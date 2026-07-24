Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D7384CD1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917824; cv=none; b=OYfd5Y6tWvjHNmOYLE4xYd+RVjVQkve4WmhGcaKdZqSdfmLlTOQevGgue36nEEo98hjHAStl0/1aTVMpz8oiKKezgvEjPCPIhBAC+aIT/KVNH2lsLrozF3YG3uwAh9q0K/puh2NYXru0LPjDf9/eu3PHX44hw1hQhdPL6/lBQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917824; c=relaxed/simple;
	bh=vEWLGKEjbPeqn+JrSclqs8A/PUv6oQMDepAljrMFR6U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KaUR8NondZXjLnk1VfUMZTbmjNbZuZP/wwERcvdsvYc3BxQ88OxDsuJsLgIaZjy7A9+bu8JIuOZlc6o7JUqDJOOMOVrN7o5TIvwltQfpTv95bH6Yns3VOlPYhKKuOoN9JekxmHiL3LNSGPrRf3tcWgPTQsX0xb++yu3WWZ00t4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKJSC4VV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKJSC4VV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so775846f8f.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784917821; x=1785522621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTyim+3+s6xPpPDNa8YNRWmvmeAtgAU4Rem7Wi+YNIE=;
        b=nKJSC4VVJOM+PX+u2WuKHRtUTtO4ViJl1WUzQe6csRI+6g4WBphkDDTZpLrWplgaMD
         S4O8oiFmI4UnXvuImNckyu+UIpEE9GyatVWeOH6ONd9Xje9zI2j1lrLLqQz/vf5AnqnJ
         x7Ta3rx9uFKEqj7lkp5qoQtko8Q3cCeG32vH2qy1RR8PAdGV8luDAZaaIfYEGABi4kxb
         xK+ZRfzUMn5Aa8ph/gCNI5n4ejRPss3bz2eFlRE5ahxcQkjYIpra3eZ/IN4yG4/jcBDt
         IXphoinIIDWNP3DVnv0lKv+D3yJwdNAmyBAxJIIJxok/wEXrRaC5E6qxBlrh+DbqEIkg
         I81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917821; x=1785522621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CTyim+3+s6xPpPDNa8YNRWmvmeAtgAU4Rem7Wi+YNIE=;
        b=HgYWedeC/uhQY0dh9WELbOjCxaLRnOOxFpQcTPUSiaDks7eL7pb1t5mhs1skItN6Uw
         czFOnQvBXefLGcvWxZ3fQ4Co0Y3ShhpvNj4+xmG6J4hWF30QtOPTmmbQBJcpxQHiCclr
         BCDM5ThIb1an9HmKbdxtGGqBIMlqWQejX6Fd1AZATtNl3NGUg613aCEM5W/TrOCXVFyI
         PZvqkRAHeN9GZpFv/NnNspNet3B93fYJgBNMSm0/Dxh0hyMcRmX1VyUmpd0u5xcNEq7e
         jNC1nsjiU4bAQSWrC75NZuWErCAQzVvAbhO34Svg2rP3T3x4npQvYWCHgRhEFb7w5j1I
         ly7A==
X-Forwarded-Encrypted: i=1; AHgh+Rro9tieaKOMH8rCsaeZrCHf8xd6zeXUizSLYXHhW1BotZ3g9sayNUTuxtrKZI5Cs/4F02FadkFMyUro@vger.kernel.org
X-Gm-Message-State: AOJu0Yy90jvCcB5lG0xSt/b5RHKOSCWqn1YUD+fJrCpn3WwlC+6G4+xg
	9zTLBLs3boACpI+66n6tz0e7IAW0tVBehWrSOaAnMBFPTb+L6/7x3RbX
X-Gm-Gg: AR+sD13PVNte8N0Xw1LXNICRTYmIPKx4e29tVM6HWS9a0wbgOafNmeu8jyvpQOJaqmU
	EQK3NCyh0fmR/RjwHkp3jyfnkGLM/qLLsqNwibsqUIVbHPoMrZHokTzTMyrF0SsCCgI3VBIAC3e
	myFfEWxo+2tAQ+AmasgSicfFsX9MrQDnawjEUV1MKZPDq5iaK9xfnyCJpBF79NNiL9PlbRoenAA
	UoNrSmcYKWo1Fgfjb4G+Gbxo27alULwpzsNAyLIXwtKKXhapzLiN3yAr0TDB1mBKolPI8kTt5YR
	GcZWDR6prTkVpQx2KDkygiGGFs56V+1nVEiZ/Hp/Njlc2I1ZhGA9tYtO25x520TfI9lnQjWguGF
	RfaW1IA1hEQhgCLSeA0ph11a24ahogwUal4CMdQnQ07PMwtwb+VqfSh0Ntnoo9K4rQ9fG6NmE/Q
	tjWWAv+OJexagY78YWKucz9nxu0xMSCPyJC7BdKgGLHQO1nDw7E5/kI6Xhumkvfgx4e//BUOLI+
	WM=
X-Received: by 2002:a05:6000:1ac5:b0:47f:81c4:36b4 with SMTP id ffacd0b85a97d-47f8da6b7e7mr11367085f8f.14.1784917821051;
        Fri, 24 Jul 2026 11:30:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm26396571f8f.24.2026.07.24.11.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:30:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Jacques Nilo <jnilo@free.fr>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Gerhard Engleder <eg@keba.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 0/2] serial: 8250: Add AN7581 UART support
Date: Fri, 24 Jul 2026 20:30:04 +0200
Message-ID: <20260724183007.188172-1-ansuelsmth@gmail.com>
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

Changes v2:
- Drop intermediate patch
- Use .set_divisor OPs
- Use div_u64 instead of / 40 for 32 bit overflow
- Drop dedicated match table and use compatible for type

Changes compared to [1]:
- Fix all formal error
- Use better compatible names
- Drop unneeded header
- Drop usage of irq (it's filled by the generic function)
- General code cleanup and reorg
- Split to patch and add the UAPI map patch

Benjamin Larsson (1):
  dt-bindings: serial: 8250: Add Airoha compatibles

Christian Marangi (1):
  serial: 8250: Add Airoha SoC UART and HSUART support

 .../devicetree/bindings/serial/8250.yaml      |   5 +
 drivers/tty/serial/8250/8250.h                |   6 +
 drivers/tty/serial/8250/8250_airoha.c         | 190 ++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c           |  16 ++
 drivers/tty/serial/8250/Kconfig               |  11 +
 drivers/tty/serial/8250/Makefile              |   1 +
 6 files changed, 229 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_airoha.c

-- 
2.53.0

