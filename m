Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9593D093C
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277712; cv=none; b=f1bTTLUolx9TjGhS/Ja8fUc16WCzUeu77oh8ZEbyllEJyuG630rzEaCzvlN8gtm7S8+Q3rukFSWAkG4mhT4uI4TKrPwSRhE4psdweK7Zf87tycLvR7erPmDC6SeFsGzURyEHvNzDixrkn8dt2r8pyKwdO2YC+VOBPPca+J8tfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277712; c=relaxed/simple;
	bh=I6mglyweQO8ryeKHCO+zp+ON2naaajVwIsB/Q6NBjwk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=XlL+RbiNAvv9UbwbD/3HpRgPPWfekPUdZk2bYqJrwuUnEUKn2BvQenzHQAGqef6HcVHpweehXdPiZm8U4hV0QF/MzoM0rOJjeUfdLTyRR08CM6cvEEcpaGvqteDtkTbA6LCtQs+N/Ms5BijK1ClZpUutg/8hnqBdCBJJfxC8v2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovVuSSIs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovVuSSIs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49553515a8bso15364745e9.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786277703; x=1786882503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rE3IjPZJHA6t5dZ+S5v5NleRepR+dFK9piV5wH4qC4U=;
        b=ovVuSSIs8CdiselHBXLerEcR8sVL8lm2ch54NUDvyB63x54k9N/QptkflX650SCCI8
         x25G3AeFGgbd18Drsj6wop3aikCa4baPx7b3g+Ko41f5V4s97aVnVTgmG2XpkYpuW61P
         EwWmo0R9IDaok5JarVKonHUUrhxfla83GEzZQdx2yf1poqi9KzoyPlHrV/zD8QVhPUS+
         T2HuFgV7NykNBRfD9dhKlW7RrrzHQYwDHSV7u2CimP6hyJU+lgKGn/gpDV/SUGnWtX+h
         SaboSnY6RbC7548sjleGpmyaQs+ZsQvcOOeWM81afG09iF4whYLtRJVzuqdLse2QV3ty
         23DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786277703; x=1786882503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rE3IjPZJHA6t5dZ+S5v5NleRepR+dFK9piV5wH4qC4U=;
        b=JjmJkiSpgRuWTVvA6OyWc9gt0TTzCuqVzQzWYyjXFJTwD7TdyWuYRxU2y0zsLWfW9E
         3DkkSf3nCqvvFjHjhna2d5xu3nkgochr6RDxlEvbq+jMZePYEqpXBNHopbOd/j7k3gxt
         AmkwrQh06CvRyAnd0v1L212gGQ8FwXDapRXw7mTX7gfmWr6Wb5UDT/mSOz3qhHKwxWTn
         Jtn8WYXjN7E0FiJPqJCcpWvfRmmh/iQU33wx2EZfprSy/WpDjK3PcgLID2VxwMJLq6kd
         7vRac8g1RnG6Xg9qmxIAIQYwVXcsEObVLPFdqDEnmtguUAk4hmdZyMm7SvtReMi/aJyg
         knyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+tV7CMVQjLLw2OjWCEtX2SAZmuz/oT43JyXoVeX5s0Hpk96lZvkmIWzBlNSnqt4pPx+L9O+i1ukO8@vger.kernel.org
X-Gm-Message-State: AOJu0YyK3qVzcahOAmzEOSJkDAGNefIJE3IvPUhr1z6QG1+9vNMslhf2
	RTk9jl/ryJ7vh7gqWC9iQgNvOZ6Tbb7J1i2oIf78eDZJerAH8uuVgRhVALG6y/Jh
X-Gm-Gg: AR+sD11PMmWOu97I+3+Kt28yZnxgqGyKWg0VzVIHxXWcwN3+KF947v7ZOnSfM/5rbOw
	4LmviKDxjA3BgR5hZrq5INHBnnfYg8QKkz7BanS1uG06harIolZoRHaxPWLu0Tau7gDltN4OXUC
	zBlFQFs8ExG/37cS43stjGaetr9zDZz4bU568YdjviEW9JEgZCBxmjm9dqHQFR3lPW9e0lQ4Viu
	+82mlTJ6V2NnFbrnfBEPagrTBt9b0KW4cDxgoRrKr7LXoFYUhZB+QyFPWhKkUmxrjoDcagNCVTJ
	tPq96GKsbuFHEPWrcYM/3m9bWIV4mszYx7roGcD0RG7JSb+UdpF4IGQSs1ffN0UqxDeFnUgrquT
	l0mnkzZrVootOSXbu2LiFkaRYKhr96ZYWP9ciSJtS0hCBn8tYUMvOZwZHcyZResUwDPU98DDACr
	GcoI8ReuIqa0O3Qk5PcmzNyI9yCOokxY6nEeJI5UMZrY5+9Cys556Gk0ZEtxyX14rreZSdGDW4e
	1AS52wUsokwOawLZHIR8/x9J9ieNFBiKK7rqG31mjqpnbZ9NDwpJIHEmSw=
X-Received: by 2002:a05:600c:3ba6:b0:495:779a:ed33 with SMTP id 5b1f17b1804b1-49959e0c481mr269281445e9.7.1786277703131;
        Sun, 09 Aug 2026 05:15:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995ea3361esm194506475e9.15.2026.08.09.05.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:15:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	John Ogness <john.ogness@linutronix.de>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Jacques Nilo <jnilo@free.fr>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Gerhard Engleder <eg@keba.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 0/2] serial: 8250: Add AN7581 UART support
Date: Sun,  9 Aug 2026 14:14:45 +0200
Message-ID: <20260809121449.574277-1-ansuelsmth@gmail.com>
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

Christian Marangi (1):
  serial: 8250: Add Airoha SoC UART and HSUART support

 .../devicetree/bindings/serial/8250.yaml      |   5 +
 drivers/tty/serial/8250/8250.h                |   6 +
 drivers/tty/serial/8250/8250_airoha.c         | 187 ++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c           |  16 ++
 drivers/tty/serial/8250/Kconfig               |  11 ++
 drivers/tty/serial/8250/Makefile              |   1 +
 6 files changed, 226 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_airoha.c

-- 
2.53.0

