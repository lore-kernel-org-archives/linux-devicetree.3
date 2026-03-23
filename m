Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B819370D68
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255700; cv=none; b=Xyj+uAOQ/se/bH7iI/jK09EKNqpsA223fN+KrgyLLyKkoEqlcPqbdKB8pwg4nSLoWVXQoFbsbyBXkAhJgd4vFA1ivpfTXBPFoierpwzcRC6a5vX4PoVTuwQ21zgWnw8wyCydOpTfsd8UnInTjPAWewvG6S/fIwrud5nlMtc3HYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255700; c=relaxed/simple;
	bh=W6NG9xgcfT4Z2dlu3OJuwD9rFp6apPLQJbr7qjrqp84=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lQEak9RtYU4AUEjZfCpvmEC0+f9Iqgj6MMO7lZSRNXCp8pQ24FdZ8V6359nR9eIHZjBEaf6fCXRgrmqkwq5zvnVxFJ0P9afnIe4CiVaJVOljs3A5J1eXhtoU3KcjjEMvVWKwSYhUYZsVufhDzsYojzTFkT9OLMSTEkypF7tmA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxHObLSn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxHObLSn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fb112c09so22418955e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255697; x=1774860497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDc+ycXXu9BZBpDDnQjC6JghUL48eeZBnExRMHFl6tc=;
        b=LxHObLSn5K/ub+jX86QTJp+NgpnBsI0Bsm0gAMkqxDSoy8w4sAuRTHDjNiW7oRYbwU
         r5qhjIh/XWSmNM1vV5di+7lQHLraCp+YcqEEFTWnO/RAoBv9bLdO+rJERm6J49AYLPkR
         jgHf7oULyiuCg2YtEbGxQREzt4Jsx9rr7q86BAmDwiVdTGESs5Uyn0t2lBKPofKFyvgP
         Am4CE9q3DqGmuk0VRzpr7ZrnnTdV8/RUYX5GU79s50uMUlcxc6pOggxsi6uxG1INr8Kd
         xon/4S32SxoyGVVxbQzt0cfpIawj+U2qg3gtrzjpM0eXxvT2xzWLMnoulWuV025una5m
         xyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255697; x=1774860497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDc+ycXXu9BZBpDDnQjC6JghUL48eeZBnExRMHFl6tc=;
        b=aQNPohyzLTQt3jkhbgn4aOu48GAh26Sfl3vaWwEZc5Dd+MUoFVDuWp7K9nKMkEKFaS
         slDQGemzTb9RtAdoXCdaB5xpGLz6fdlwmMMEXc0Ssd/izygjIUKpeVgpoD/iCCWmRlCF
         xTCWIEFTrQR082wnyMI6hotWNR4IZnmxYi+Za4UtUO06H0qtdOMIF8a9PYcoNkwm/ek+
         o6NklPhnwURJAzJ0nVZaQT7wJ0RcWsqXu14ysO126SF27o/6yT/dmQH4nxxq32cSWVM/
         fP3WpG0R2xC9ypENhNMzizwwuxRnM0eG/AGp55I7XPmjEQNztiRXfF2hmhXIOS8QMYDa
         P8sg==
X-Forwarded-Encrypted: i=1; AJvYcCUyKRS8t7Q5tdmw2PWEFMmU0idA9Dnhggvta+PKI6h0iacdMNgk2+QmY76CkwRu3mG1SbvrHoGcYg34@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWC0rlKvsR2mQlH5jzq9ckUNLvqEYKaep75XfwJu13KPQb4+n
	U0nNlmnwxHYg5DMN0KR61GEUzFH3i11BEPA+C6n5rJ3sIBlPQQ3IRom7
X-Gm-Gg: ATEYQzwLIlEVqBkV3qmOjQ35CRMJ3TLOF2nSD+JxGebsP3V/f04tfgCOa3qUozZaRx/
	Vdw8EZhWneuYf5oMor1C/xoX7tnONX03nYAsxHPAtDoZicZkngY7a/S1oT2u7TWtj6iWxFRl14B
	c6AvO9rzo7e/doo2x3xzLipwIcR/xt1ngFFFE6GZiOXflWhJqx5E1CStXOxfJWLopuwM7q0bFmK
	cTYhyxVX4mGu7ehv1azouDHS2fsG6BewHyNrJUlqCpBRbAz/7uNkSuJv5qU9HvncykwHOHVB7ta
	IqRRv/AeWu+vSCmT9JBGpQDwr+k4MTepj7lbAE0JsnNBKpflXWeqBQouNU1DdT2QY/brJWyS31X
	HRd3H2feUAK/70exMP3ZyO9GCKSebCb7yScYvyRXhG+y02olA1tPVZNP8mcFm0OnJxqRcHnqg27
	C4B2EMviLy13N9
X-Received: by 2002:a05:600c:5250:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-486fedab419mr176165215e9.3.1774255696490;
        Mon, 23 Mar 2026 01:48:16 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:16 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 10:46:11 +0200
Message-ID: <20260323084616.10469-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts the Technologic Systems TS-4800 Watchdog timer
bindings to DT schema and fixes the active hardware node in the iMX51
device tree.

Eduard Bostina (2):
  dt-bindings: watchdog: Convert TS-4800 to DT schema
  ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog

 .../watchdog/technologic,ts4800-wdt.yaml      | 46 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ----------
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts    |  2 +-
 3 files changed, 47 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

-- 
2.53.0

