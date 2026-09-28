Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449C4D17B9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603730; cv=none; b=UHEsxGV5roazWg2y9GRwsyWJDSp/+p1iNe+5Ct7DT5dqaweK+NLu/5Ie7IaPA/snB8AUEQwJdj2FATBCNKdvGO15iJYIytBo19s192tslnWaYACCFOtdBB0gfxFt8NQObSVRkTKQDgq0AKjye4fDYuTxIHEna1UJRZ4zbq3fb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603730; c=relaxed/simple;
	bh=R6TIVlIs7hHpFrSPoteaIzgYpo36tAH3WZS4D0PrPZ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nqfpcYk1c/7H/ZtaawiZjM82W3Yfwvq+DDSHPA06zqBMLd8Mzitzqe+uM31xY9/POvh+3eAtCdgc0TKt6DCXjb0VHrNrtprgmQR8KbJVIt0bpMOuqeT9SSDPkS6AipXVcD36kXVIYsBVjyuf3OBCyBR5YF4ue8EBvbFljAmwS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SgZGewiv; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SgZGewiv"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af3a4f193so318743066b.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790603727; x=1791208527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYnbwqydTxC4isV4u5FZ/6TQfllzQH22GNqJnusLCoQ=;
        b=SgZGewivmRZiVwj9Sqwim+F2NO5vpV680vqGVk5YAYvvKqNjkD52OpnfyNlz+0UfH0
         fwUxnjQ+RUacyLkKG7A3is5WMTkGeqNGSVdkajhCzIdrQJujLlu0kmGSHb3PJHljY8LS
         zQhhH4WcNYiGgLpo92EaniHfx7WXJxZkw2CCfkbjymvwbneR2OGVYKmfU1umMK4q67WR
         S9UOQ5PYk80OSQJndpyIPb9aeTd1f9Rg04x5mOjKniAZ1oap8UcSrseBPrL0x8IffTTk
         PnTSjgvj8YSvUGeJCm7y2Qt5thZMTMiIxbX9VZpOm4/ot9LGyWwqDQx0ONI/OHa6Y2Y4
         qGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603727; x=1791208527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CYnbwqydTxC4isV4u5FZ/6TQfllzQH22GNqJnusLCoQ=;
        b=m8FHrApFTHhtK440fs6rESYoRWUOmuS/p7zDGXbN2rXpUh8FpYxTMbxxt5ShK5X11B
         GBAS5P9nwGHXQMJ8wcOGgFWn0YkqwPFxyJkcgg07CpL2VzjRvzUl0fVc0oY5pI9d3gEd
         cBUT0pW7+mbJjkR46DGyzHNZh+BLvAeOYOS2EKGCQouRRdg3VdMmQV9XWVL5QdPXrK1l
         AQqEapjLsrC0QeuqRWqocBUcW5ONRiZ6WGVGRJ/1LWqkZl3qG5TaXDeZqZbmKXSdAYzx
         tF7Aps2NErBAIahBVEXNHiNaSaMiq0gl4pOe0BNFG2rs9LXS6Gn+njAbdxir1cLpKbgP
         HfKg==
X-Forwarded-Encrypted: i=1; AKwUvBzzjIBtFc7PJ8Pp2TjBadJ/lVdc00BkyE0YRyNGdBEYkZBw/JhmBOAoEwy8+1RcIHhcRELatgAh3p10@vger.kernel.org
X-Gm-Message-State: AFuF++mx0aC0ql7B5ono2ZDlLHnrRROeO9v2QCFDmC23ZBELYEMHHtAS
	u3gbpfVhUrFzL45WFGP8+c0CI8/8AbMENYuclaPS5IqOR/A62yLUPsNjj5u+we61vqM=
X-Gm-Gg: AYBFou096RfrJt9fe+FYh1LQW2hiTV70xC7DjzYgAXLl++Sgkkmua0mwqnB7tTJiz8+
	1+BZA26NMhHLvqJOk7tOBIapU36eb+LLF/S7vKzPef/PWyqFmb0BopI3isUJFyYTPiONDNIL4Ty
	l8VnuCn2OxZbVPEaU7YL48GjS2IkR+VbrfUZP/LRA6rQozrsqHvNpy/N7885P4UlcEy8i8QAKWC
	HjPs15dsEn1sjJtVWFp4Ut5FRDXRV31xlpGvmu31af6Aq8FPdaoOzfHtTXPLinkdc/rMnATH+sn
	hbuKNPbIG0XNJQdF3ftsQz9W6kI0E0UCD0qUkdBUKxtpO1MyZhbCR3lgfd4h/pQadyivMHURE3w
	2t/MuATMCFX0pttl4gX5NFm7SDPssZI3dE+vsB8/niJTrzxfwxxn1JC0i4h/9DDS+Tep6BWn/Lh
	OHESpSj+D5KppXuB6KpsX2qjkxoIY2OYWe4XHdQ1fPZdFsawC5hh143pdIlFaNfYCzY/uQ+w==
X-Received: by 2002:a17:907:9689:b0:c26:19de:9ae1 with SMTP id a640c23a62f3a-c2ac25ec42amr1055522866b.32.1790603727000;
        Mon, 28 Sep 2026 06:55:27 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2afe8dbcf5sm366494066b.53.2026.09.28.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:55:25 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v10 0/3] Add RP1 PWM controller support
Date: Mon, 28 Sep 2026 15:58:59 +0200
Message-ID: <cover.1790603500.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which will be exported by this driver via
a function. A subsequent patch will add the function to read the
speed to this driver and a new device and driver to read the RPM
and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V10:

- regmap reworked in favor of writel/readl, since no syscon is needed
  anymore.
- removed the read_tachometer function, it will be reintroduced again
  if a future patchset dealing also with the consumer driver. As a
  result, get rid of the common header file with the function prototype.
- dropped the mutex and locking mechanism since it's no longer needed.
- Makefile: removed dependency from REGMAP_MMIO

Link to V9:
https://lore.kernel.org/all/cover.1789724999.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 417 ++++++++++++++++++
 6 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

