Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61E35E957
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049475; cv=none; b=ns0xANTwfIjDiKuGWdr27siiF+03FQfb88bLd5pkfv6+ar+C7Mn3sZ7EOFP0k1Ev2kmwJjI1mUB5QD0Zo39TVqPU+MBVSwQYU/5dt4ZApJ871HOysXRs60P1mftYDcSBO+Sxz95sL6nOV68yVVL5ZmNmaMKCwXPRC6vYrmOPTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049475; c=relaxed/simple;
	bh=2TNoC4iE2ZdHY+NdBz/7JWkGjU8w0uJr7p3sLok27iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjeB1kw4n9oBFq7wdoAZn2FP9tNknE9NEwlzl05mjCUUBudDMoYWM3pGLq8EhqWrq7PBap0mirwXjlCRRVj75uhx1lyWttGUDq1ZrgBNyfHYYKCmEnd46NtltaQ4Fl64ng+gCI5U9GBqJvEfI41sw4MFITn6YAXf+YkEjxwMXoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGGXR6TK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGGXR6TK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso47601515e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049470; x=1780654270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9pBkAXW7gLZd8FKwdSxA3ABXZRrpLoJn++TQ4FzcjA=;
        b=SGGXR6TKhtBm7rfcLVNGQ4mota8D7G3pJvOJhLsLxy4TjCVLP41bMwRNlEAbJaPyJ0
         og4pp1A9sVSO98NKTayrm8pxV1VxsqHAMqjEQm3eAfb0HPFnfDC+xbAg3ulqf3hoBK97
         zQk9To3mYaU/c7Hd2PWjqiUs+jkG4+Gg7CD7M1eh18CGpvvtsi9GlRXbv8za9kG3OsKN
         pN3vJsIhtY28g6sAX/r0ywb27f7m5OYFMSRYQpEA5NRrnyDF4NDrlm9rP7/O/XaW5wBP
         LiWTFrdm1VFDI2nZi10R/1i4ZT+oELspx/gcwnTHPJ5hrXQrmiRjunqNmcTlPs1YIH/6
         696Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049470; x=1780654270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9pBkAXW7gLZd8FKwdSxA3ABXZRrpLoJn++TQ4FzcjA=;
        b=owKfg7R0hss+Cs/3d5iMhD10aAvF4JtLkBnORjYmhsNHTic4M+lwupyMUDvX9kw/uX
         1njCr4isoOtAeIOikp6q8DlWAJkchZpczHjbVfbzKv5+bg5iLc1iXzHvyw8FhXVJ8MrR
         sVCqhKHvBmUjv26EhJbF7avnxP0UcYUzggNBYJ4fSPblbQaD5OarznEF91h/sgJZ9IB6
         M0tfNAt6klD3rg11X1cnPIPDRa7hUCB7AouCQIRAA1RjOAo/2IYzpcRCNeusTPj//NJf
         QnbzH26B/1vLeFOnoSkxlM+GPgVMXuH1/zEw1VSm5au9Wolbjme6GtMy4SNPTTIgSkaJ
         wSZg==
X-Forwarded-Encrypted: i=1; AFNElJ89NrfEncxeMFZdI+m4Cu6OXXoWudjEKcB735+3rnDlUeBhErI+LCIZoDuPtPOg3goIO9+d0LDhgnMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ihowqZ2+WrANohoq+gwLNBG25mnWUsRNkJioO4cWzcKDyGof
	f1Ku9ev34MYmcqE9bzMM7XY3Y6KzXgPbcIuFMdFyuSw4rawSdAxwoMZK
X-Gm-Gg: Acq92OHV0xYdUL7rmBlhpbEsXmlU2HZ/dQ1oONOnYkL2X4qAnN3C+iEQHoELGmTcUqH
	2zee0n9MpluoYFQdakbb4bKJqGc4J0LaDRQrbaNhYBwZ/H4IvvylraLMjYDwbc17jfMQy59xmPf
	nXaDvs3jikxrT51UH14ggC1aq52NGkuPH1VwsvFtwMMn93kOOHCRWphVlZDd+1uTHkIm3KTPvMw
	EjOAZiY+ZKS7YdKwfJxvfScHR8TsUYaiDMr9i70B/ZHHnUF88cClnArHn+rPt66JzRAoehwI0Vw
	3i7srEKMCStlM+1K7TLwy+/tsQL5W3l2s0LeUEPrhCojMjmabxzzIMUA6bDsledfPx4+K0AQwWC
	K0SA8bDICvVOS0AmeVMHYw4NH631gjeIDMo6KBkfHkpfD/d86X5PxmztOwM/0Ac51dsnpQu6YGW
	geja991uGyxgkChg45b0UXQR3jj2RzmQJh6tnRstZuEr6n9VYV6Dbmrql4Aqy6M1bgOJ19RVvlb
	RfSWiWahUUTSxnK61xg0H/D1LK7hNR5sGrDohWoV999BiM=
X-Received: by 2002:a05:600d:6413:20b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-4909c0c9f56mr31124965e9.29.1780049470077;
        Fri, 29 May 2026 03:11:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/4] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Fri, 29 May 2026 12:10:47 +0200
Message-ID: <cover.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

Stefano Radaelli (4):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

