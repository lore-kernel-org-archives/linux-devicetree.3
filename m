Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3D411661
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435804; cv=none; b=bhQmqnhPTOGeqflIerkSjzRVabQSAIowAKRcZU8YZSKaCzTfUqlttXi8wbevFPQKueIJcdGboqEAX3elewhsLTxCk03MWMX0m44iG7HU9nI4ZGeKEckN5/W2dWdVImTICLuWdkg9T8jKbq61qPfUYX4bFobR//KdYegBnqr1hrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435804; c=relaxed/simple;
	bh=uy1TWxecPrFpSI3RYQyi9bhEt8VMUIPKm1QoqnK5vac=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=H2o+QDTKLOY0sGtbYpk96eSRYib5FrW8E2G9HtlxbViLPXhSrx9DZASId/L6PRf6mQ1XSFUIJZDPDmXPYzH0kQBFws2vfg4DyqYORAg8tOIwOu3EPNpWV8A2pN/8KwxMVLjDpBIvPuWEcpcb/4I9/rzUTOS0+7pD++fxHxEOFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciimN4u3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciimN4u3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso43263665e9.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786435801; x=1787040601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfoJLqBVLFMTHWJaL28wXC95kEq7j2/28qxGblxnEic=;
        b=ciimN4u3lvVxFkvq3GYoXZ1D7EyfaoC8ngiR48VXaOtitzkQwny8YfwMsZ1Oh5ixx1
         qPJcApLzt0K5n3YFCBvHW0H4fYd5mp+nKy245yVsIz6wlsJHaariJjXpR+Z/99xzt63w
         NC3+BUSIVYlCYpV5A1PiOuX5yRPQXHkOGgdw4Du7xEfj50e3nSX+W5Rm9H3IHLS0MX8P
         HrHoR4k/GU+GqI2G/rPkEa1EGYf72CPkXRjv8UwaNrF3YlRdC2GeHvWPazI/WQxbPVEW
         kWOwzngFXp9IzYI6b/uIH40nPXfLLKqIbzbyE7i2HbejdlgvfySVsl8nxBlenQJp7yzc
         pdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786435801; x=1787040601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JfoJLqBVLFMTHWJaL28wXC95kEq7j2/28qxGblxnEic=;
        b=Fb/xON5RRw7PqPpDQNHBff4SfVK/181Kw4e+KOPpssyT7Cl3qFSwWiPcRMYi48TFX/
         KT0lTad/r400Qmsx7DdUcccpulnwH5ERODyD9nGc4D+Q27euGwI4/UgOu13PH+m39adO
         wL+GxxbO16nfhmhweXMxl5MYxA5wczUjJmPdImm6Azt/f/iZ6EVqM4gLGRNaznvf3nGx
         QZRNVSg7qz3BZLyJWLe74I5LZnNsnRTmjNp3UaNqaxrN7cH/vaCXLLlfip7xsdziP9Fz
         1C+fxItmwMGS2d/aRo6OdBkzm4dAOPFfqyrK7bKws9xnY4sbm/oXhW1AwePsIo7rT+lw
         Nq0A==
X-Forwarded-Encrypted: i=1; AHgh+Rq4hDWxHaCIODR2bOvVafT+ycwNlDjW/wTFhCLMMcBan5CdsvfLZQmU4zqTb3EbLHmpSTFF+EMfbgoT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxw8VsN1eOHUUrG1VuNCulP0SJNGEKNzJGmbULhEEAN9hac734
	5P3jvjHm3+w+udrGRH7FhquzBNtFXiBHZ9fdw0Te/VX7Lpv8pxBkfEbD
X-Gm-Gg: AR+sD13UCC6JCu8OebOE9yBjy5CRm8pt7o4KxugbDhSNtWMcuHvew3+B8mGtXEUdOSD
	IO+ahGP2meYXGcaE6NoJu/Ikm/RwE7gPlKheVOTgN+l+nm0HYeYQSaBMtCJoIXx65s0pT/K+CHA
	/jJBaT+i9P3vO7ZVSNszaQTtjhXafzNdCokCew3VlKe8/DnL6enuvYiO8KHetZRZ5/f6l6oThis
	t7VPW02jHJSNPZ6fIXJghR7TnZWaxd43F1gX+kMEdpmwoPpWCtCDlPiaC00ca19ORHetxmurn7t
	j5LUVKtGCz6Um79YFEzH50RTkzwg1M2OMT94/L3QLw4GcdO910VP9HQWQEtOu02wBAn6TsSRmhf
	C0xShNsQBltfEv0kxmNO8Lc713x3A7YlywDlowlFNW0c827pYj8FFiF+7HBledY0wa//UjjWYtC
	bk9xHQHpw4B9UJEfm+BXSeNPs/FVmVrT5tv1se/GZhJ+60hRm9ZjgQLEvtt+FJt20NpmJ8C5u0J
	+sJgrtu4yqLmywgvJvQgu4LkWWOOL7Z9nzzYWi2qbCWdQ9b
X-Received: by 2002:a05:600c:698e:b0:499:76c5:5855 with SMTP id 5b1f17b1804b1-4997846c127mr27025665e9.16.1786435800471;
        Tue, 11 Aug 2026 01:10:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49977df9489sm45336675e9.1.2026.08.11.01.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:09:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Haowei Zheng <zhenghaowei@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Gerhard Engleder <eg@keba.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 0/3] serial: 8250: Add AN7581 UART support
Date: Tue, 11 Aug 2026 10:09:45 +0200
Message-ID: <20260811080950.664379-1-ansuelsmth@gmail.com>
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

Changes v6:
- Fix commit description for Documentation
- Add tag to Documentation commit

Changes v5:
- Improve 8250 YAML schema with enum
- Keep alphabetical order for YAML schema

Changes v4:
- Add Review tag
- Add errno and types header
- Drop redundant () from comment
- Use define for get_divisor

Changes v3:
- Address review from ai bot
- Add all missing kernel headers
- Improve divisor calculation
- Fix wrong uart config table
- Simplify divisor table handling

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

Christian Marangi (2):
  dt-bindings: serial: 8250: Reorganize compatible to single enum
  serial: 8250: Add Airoha SoC UART and HSUART support

 .../devicetree/bindings/serial/8250.yaml      |  32 +--
 drivers/tty/serial/8250/8250.h                |   6 +
 drivers/tty/serial/8250/8250_airoha.c         | 187 ++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c           |  16 ++
 drivers/tty/serial/8250/Kconfig               |  11 ++
 drivers/tty/serial/8250/Makefile              |   1 +
 6 files changed, 240 insertions(+), 13 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_airoha.c

-- 
2.53.0

