Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636503D8133
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630628; cv=none; b=IEK+cz4wVRNNfZw5Gri3weZoNWAxNU0fqm/luiSgJ4gMTkBFLhtfjuh3jb4w4mhfKb6TBvl3Q8LideHhjcSOKSvLUXqfhIPf2iPJQAkuHZCdM5ey6cf5L3JQr+RUwO3XLCoKYp+RKenA1uBx3kQOpOfEaZKVcRJHYrIOvabNvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630628; c=relaxed/simple;
	bh=6OBP/KYeRYDKgBThz4/HFtSQVBBoXa610eilBSNGfv0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=bReu4l258PiQksm0RypvPLmZ0czkzlk52laZrpBfdNtaLmob0BkBdhi1aWoTtT4+GTmJNpG7BK76ZW1Ia3//t4pdZCzKWrvYKgUwKyERSI2ftqMxY4cmwSzchxcggH3P5K64B4ydfRDcSxLgtbRd+6ll9Zh/Rj07m4aMGxZ2wGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhBX1nvR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhBX1nvR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so197888f8f.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783630625; x=1784235425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=63iZQAM7RJLn09riXo0ene6klrJLz5v8YHBQUwmsJ6s=;
        b=ZhBX1nvRsqxMGhA4Pkyu9DlXgzdBx+t81+yDQuNhACZSeprWF0kFnCA9YVXwWaKQ2N
         RjhT4Nqeb4GJvBEMiJlQh2nQa5sgvkhDoQIrSPc17Ke28+w55rTuNQd5ef7VkRt2EbcM
         Mu9fcIC5qajkybIt8ibniesEm9EOkjMD+zvxgw3hKDQSWwlhC8CzkRdFSCeb5ogZvxq2
         USSiWnySEROt+XThCJnpsASPL6hBitF6zEPC3hG4O3d3NrdoC9eQCKxZvYc5JVjVNhBN
         CRrgh44VV2buZ0XjsljEeC0e/qI9Gdzg8GJFb6Sb+GycsK795REfjOi0YwAPCzmmUbrX
         OPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783630625; x=1784235425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=63iZQAM7RJLn09riXo0ene6klrJLz5v8YHBQUwmsJ6s=;
        b=Y3tFNtXLalooJSbGGA52gibDPQXvpsFUEh6PHf2iqxyTZtgw+nx1dr3D6WdSoW1NcB
         //WPxv3SYd9salEmicUUwWNWIscmzz/XCspX6pRf0WSs1oE6E+8Qvc5Gz8q1Q1YDpSbU
         f+qEd+OjHSvQDeHGv5EEp8Uf6S6WK/zf/oxplAt3kNFue7bGcTAojWCGRyMvTaXskNxW
         L2aFkjAQT6MdyP+5loQfdiMLk9jLkbVByGA/lkjL7CZM0h93RsCwoSPRmFY4GlKu1lmE
         hSIR+yhOY9tmYV6vGWwF0g2V0FC8+WOJvHs5UopIznFfOfkOAGP1Ft7W25k4tOiAKLF0
         fStQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuLqg6tDL76CDJy2xfHbfGu+EFA3z2iHq2qS5BThLX+z7HNiz5e70QHxKqHnamAUxV0Hxt8txOnzxL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dUSPLZu+GSiQ3tXjz9i/9H3MKBj6HRxbfH8Aucyufb+ai1tg
	6ZIVhDjVhmMeUpiEMTcPLYRkhvNWIl4cPkdSq5HdbZ6UiC+1xvV/bosF
X-Gm-Gg: AfdE7cm9QTzH5ULqzdIRZPMs3JKWyk7uwMKJ9fv1r3gugAm4DZ65GYhuDqsP7NuzQs+
	wsE2si+bivvlHgfFm5Syafgzw7mrFq+4OdNn6z8DpN8XTMLESzkRV9OLbRUQ6HkFxuFwf59ZJjh
	maN6ThksLZUiq5vsNz+0zN8pNypGCdJFw0VyfVGyQTqEThXA1Z05aWxjmDi9EVJSVs0Que6D9MR
	ySJ71HedhtBlMUmAvri+Lbr5sTZYTgxyVbDAVvDtViPnaltyADq4qUhyT3ep8wkAFqSdB4DF1L3
	au9yB+pJ0mTdXYdDuV0tQgyiVr7Qs9wLBZZ/fB6+JLzy8WzuEC7HpZmqTu3iU105w6eE+LYpYoB
	X7sLBerVEtYSInWLvZOI+gB+Bx8RLG/h1t7XeNVVBymAQd14RJliDnizaMur2zlMRgbC6TVh53j
	xn4NRGow1aRTLXxQZ63O/Ky/mju2/xy4RGLVH1r0NgaJ3HJJOU8VbSMIdPemOwHt2iNZh3nMxdV
	ZMLlKZ2
X-Received: by 2002:a05:6000:26ce:b0:470:2fb1:3dbc with SMTP id ffacd0b85a97d-47df07894d8mr9639468f8f.35.1783630624617;
        Thu, 09 Jul 2026 13:57:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm52894965f8f.6.2026.07.09.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:57:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	John Ogness <john.ogness@linutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Gerhard Engleder <eg@keba.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Lukas Wunner <lukas@wunner.de>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 0/4] serial: 8250: Add AN7581 UART support
Date: Thu,  9 Jul 2026 22:56:48 +0200
Message-ID: <20260709205656.319531-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a new version of [1] to support UART driver for
Airoha SoC.

One additional function was needed serial8250_get_baud_rate()
for the driver to work correctly for baud rate calculation.

While at it also try to clarify a long standing issue with
new UART driver when adding new ids for uart_config[].

[1] https://lore.kernel.org/all/20250209210241.2622309-1-benjamin.larsson@genexis.eu/

Changes compared to [1]:
- Fix all formal error
- Use better compatible names
- Drop unneeded header
- Drop usage of irq (it's filled by the generic function)
- General code cleanup and reorg
- Split to patch and add the UAPI map patch

Benjamin Larsson (1):
  dt-bindings: serial: 8250: Add Airoha compatibles

Christian Marangi (3):
  serial: 8250: export serial8250_get_baud_rate()
  serial: 8250: map UAPI port type to internal enum
  serial: 8250: Add Airoha SoC UART and HSUART support

 .../devicetree/bindings/serial/8250.yaml      |   5 +
 drivers/tty/serial/8250/8250.h                | 126 ++++++++++++
 drivers/tty/serial/8250/8250_airoha.c         | 190 ++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c           |  95 +++++----
 drivers/tty/serial/8250/Kconfig               |  11 +
 drivers/tty/serial/8250/Makefile              |   1 +
 include/linux/serial_8250.h                   |   4 +
 7 files changed, 393 insertions(+), 39 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_airoha.c

-- 
2.53.0

