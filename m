Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378470;
	b=rPNQ9OjI/QnNQIEHJpzJz0H8sNP34iDEDdMcc6VGHLAfLwTqtbxCYolBpgXzJCkI0z7r
	 ljx1uFSdy+BwJb2eTaDBVRWp1OwXGy3cspahH7ZST0Wp2ainQ5E7zH6reCalQynWj7ikx
	 SEeuoXX7J6cdE4eDvRVUYI/42F815tQ2NJAC/0tahw/SuONwVdsMjmLIW/FyRBMewnIf3
	 JSWxNsAVHXYTUaiWzkHRfiO8FAroQCRS13u5N441xXNwt6MVWgNm/AjoedKNLpH4vCx/r
	 Rhk7lqOLf2q72IBprk4jPLcdGbGEyaL5/09KBUhRMKqKtdk06K/QNxIcOAEZ0G8i/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
	b=H2L5UuPClGd7Lr4W8/8dAESUFAWJwwRe9LcybvDR81teNhPANShqsNfN4HIiTvipfrf1
	 9l9nIeFiDb9mLDM3eUyDyT6eB5Nm55xb9wGYra5r6Ij0y1NUc9DzLX45xJV1G8TaGYhLl
	 UFKJAmHH8MrcA17RbRghCRqOdgKa9ZjqDAk1CaZSeRoINb0O4BBwcf8/X7ggrgts57vIl
	 gVWOSKAg/l4nzKUInPL0zfjs9JR6oCiBzIGmBORsvUdwN1XDxDFW2ccLuPnYtW1wWLTPr
	 L4U3izzIcit+x+UG7SI446OKQGNLLnFWDnluhdjqavjjetibP76qcdLyN9nkIHDJVcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUgCUsXH;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A55C606A31A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A55C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUgCUsXH
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso2803569a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378469; x=1795983269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
        b=aUgCUsXHYw3KaELR4kFag3t5wB9TMdvlrPOCMERQdBo6tE9XrKcTfz2uG8UIsGa2BM
         njA6POWPRJA3ichnU0xFmq9hKVOYjVx3NCMAHHlQEODE2reX+M5wYjKoxgrlTnM6WMk0
         gy0xblA1L5zSG7+RBF+sV2Bq0S9jS56bcVppIwTO7xDiFFFzEq1Tc3zgyaC2XwMyazSP
         FZumSKEduASM4h1ETwbJe72L2CiBxGfUkZyHsoKbxiMMl/GE+XCQl2yHyY+NNLRtL48n
         28ErKSMtnVdEQ3p4FOAXYrI2bVD30h6Dfl6n1fz6Ua7XKaPN46zsuIONXiApnGof/Afc
         MhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378469; x=1795983269;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
        b=zSubAtGb24v7QSV9P8lLfzQ1jG7S/CoZ+iRMDpfS16c1kY6XxWf65yhxJwoVpVH+Vh
         cQHZQd9vjKWpPKU6HALlgpqZSumUyPSiEVEc1Vw8sDDO70LcqWKU0pKMNZjc9AzYNKgQ
         nDhdzw0n2uH8M4T4GWPDJWUFFWhq4Z/b3Tr5UjmOJDsX0PXI5CrUt5odmoPMmxf0EQVG
         v6k17DALgqyNMRzKrTF1Cdw1wqTT5FLGoGLOQQoY6hNndgULtqOd41udKecyMT+hbNt8
         udHtFcIiaRqQ7UCPgSx/flvyGhWBkDOsRGfO6NdmloDANMd2/qPJ3EZY37/fbAh/6FzD
         W2Fg==
X-Gm-Message-State: APuU4Z/67RD1+wFXNokeL87PzaUg2djbVxSHnicaKmlSuaF5HOkdCdzv
	OwngN796IUeYqDy2J8CDePm4ushAHKkuLExGYvOKWsOp9+dptokRzuJj
X-Gm-Gg: AZFdTZd+njxa5Iz/QlORO/wwLnBiTlRlcsMhyW6n9YeOqrxnN1O6c0mL+FaNlCc7Low
	mLd0Gmbw6KJNb9XOqp0Xdnp5MXzkRvUzBVLqD1vptMPi0P3zgEOd69HM3c0FbX5/Im7aOI1GfdL
	xHZ8vOV8jSQ8WinwQt6Cb9m0q0YdYfn2S0Ia9b685AjYWmCsZn64MM6NNrNKeULhSZwGj58Sj+3
	fAedBfnat8DQuenk1GQcMZAXDEk2ua23EFp51tt+6MLojj3u70Pj9krkTCn7Q/z4gOBLId2LDKA
	OuWObW4HmK0IMxukyCWq9yIOnr/5JNvQKWjO19GlobUju4E9Z/qS+bZbahnX6brCHFi9bh1VSzE
	Zt2GDTmsgxh6GA4kFfGgPGnbQaKrDIvFGPAMe+i+ewtT7AxspF6pi9Y1ktcSN5MaMULqswDItCi
	JUvYumYSLWjTFawHR+FIyaY5rJOwFG3d5oZhqVYeKj9Tg4Q+TLGBHG5eOQDAgmEccG4WGyOxTzi
	vOiPMGB6dZt+DN7GDs45gn5BtSP2xa3n8E32M0+Bg9TwV2NF9F0F1xpMORwkfSmq8shqe5zTgFs
	fxErUfBHQH63kE4RyqOw/CgC+/f9/7KKONZasJqAaBh7DO5IuR+todZHLI5f4zS1haBLRfIocOf
	saWNl9KybEw==
X-Received: by 2002:a05:6402:501c:b0:6b8:afbd:64e6 with SMTP id 4fb4d7f45d1cf-6ba37edaf1cmr6652717a12.42.1795378468547;
        Sun, 22 Nov 2026 12:14:28 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/18] [WIP] ARM: tegra: Update Tegra Note 7 configuration
Date: Sun, 22 Nov 2026 22:13:49 +0200
Message-ID: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch set is more a placeholder and is not meant to be merged just yet,
I am still working on it and comments are welcome. I am sending it to be sure
that my work is not stolen or overwritten by some AI slopper with a trial
subsciption to a fancy new LLM. Thank you for understanding.

Svyatoslav Ryhel (18):
  dt-bindings: ARM: tegra: Document Tegra Note 7 variants
  ARM: tegra: Diverge Tegra Note 7 device tree to support its common
    versions
  ARM: tegra: tegratab: Upgrade powerlines configuration
  ARM: tegra: tegratab: Add pinmux node
  ARM: tegra: tegratab: Bind VDE device
  ARM: tegra: tegratab: Configure USB and power supply
  ARM: tegra: tegratab: Configure MMC devices
  ARM: tegra: tegratab: Configure wireless devices
  ARM: tegra: tegratab: Add thermal configuration
  ARM: tegra: tegratab: Configure HDMI
  ARM: tegra: tegratab: Add audio codec and sound card configuration
  ARM: tegra: tegratab: Add common sensor nodes
  ARM: tegra: tegratab: Add MC and EMC timing nodes
  ARM: tegra: tegratab: Add CPU DFLL clock node
  ARM: tegra: tegratab: Update GPIO keys and switches
  ARM: tegra: tegratab: Update aliases, chosen and memory nodes
  ARM: tegra: tegratab: Add video input configuration
  ARM: tegra: tegratab: Add panel rotation

 .../devicetree/bindings/arm/tegra.yaml        |    7 +-
 arch/arm/boot/dts/nvidia/Makefile             |    6 +-
 .../nvidia/tegra114-nvidia-tegranote7c.dts    |   14 +
 .../tegra114-nvidia-tegratab-common.dtsi      | 2759 +++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts |  603 ++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts | 1405 +++++++++
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  341 --
 7 files changed, 4791 insertions(+), 344 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
 delete mode 100644 arch/arm/boot/dts/nvidia/tegra114-tn7.dts

-- 
2.53.0

