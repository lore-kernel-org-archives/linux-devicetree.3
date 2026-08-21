Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C71042668B
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324365; cv=none; b=GOGW1xie6aSzwlUp0b9QBEI3YYpw3+RjIxAj9cVNqkkttSg5KddNyNr5g7JYWKNL743LN0AFShPlfA/C3U+p+f9v0OuBsVe0pOibAGhqdcGUyPl0pmYSUeKJmlLCT+tMnHFKFxbDLGiRdOASzxMIVHk5yZrT8PXS4cHEEhUt6kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324365; c=relaxed/simple;
	bh=WDEAc+a/SLkgrSJkUe7LKkxiz7rqpJlb0a2xNqjXnFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=unRyAW3Yp0zCDdt562IKroxmmbjXKBeObesOtDBHVjET0rhp6tNAFYSHbR0jREUlJCFRBUZoyqaUCLMaCFI63ct4fQbLsup1mEFQAkb7T4J3LZpunAMVd4J32mrVHlpI0bfMnS+tw/Ndy9WF0jHVk9a26GWpmAHwHK3HHStqzm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgP00wgp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgP00wgp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so2032229a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324362; x=1787929162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=XgP00wgptpWTzQS4mZIO1B8F5epij68Bt6isUbuprd2gXyYEYMHp2kc42POCUqEsJb
         iaQ1Ds5/UoheFW3BCB7GcLHIQRY6lU9hGzLT4Gq7ap03sXqs8ztKzdpoVY1kNjsm8Tw3
         BHkevcqHjs16cfoTck3zJfSkizXL2hTGbnqCvoS+5fqF4qOEEHVZ+2FOzJymUJlf8umC
         Z16XJh+koCx29aGFu53A0J7IcukTewbM1fypYQrpS5PFW7xwwrdIcWB4Roe/QZ5vZ2MR
         NC7kHWeos9vR/jNkb60kPBHMtvlkIOCD7mdijRuqpkXMTLC+87uD/xhbh0I1dcJbCT3H
         iWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324362; x=1787929162;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=IJRnbGzVEgjGhWCbrF8j2uUEx7xp9SlBOOh+kkxqibfptKoepL9O5fx6LZO1+uDOWz
         S8lzZAVuOD8iho9DwlXqVIj0fV7tBMNhW/eF60tADDWY/IWTU8FeLAVTH7kFzMIAwRVP
         KtNyJUMM32pp0k2ga5Q3HUIdsifw6qF4lPu6jMfkyS8BZBJ/7lBbZKmANc0uWhJNdudb
         LSwyhtsHfhr13INxBnS11b7hvNRsEbAm65tOaIDEAABIx1/cOJitvpeLUv8R63UMPPfw
         0/8XU+inF8wGQyOLDxUABOqQTyqcKQc/c0WrrIdFqrwN/61aHGHNv/gm23ncK4sABvlJ
         GYOQ==
X-Gm-Message-State: AFuF++k0mb66EjtkH38WcXTle0pypBqHyLcjozg9hszxqow1jjkG9SZr
	wyJYnE/hJEK84tWY9x04+Nz2NNh7ut5RHLFDvKmdq2BfvJKU318We10D
X-Gm-Gg: AR+sD10FVMNB/eBQTayOi8y0P7v6BD7v8N/7bnKk2v+UGnXD4imHR5D+HnjQc+iCKlc
	rP1jKb4EP78R/mGD4Sm028sygp/PMHbEz5HsDKjgJFFvEh5u6EpgdSCBv0/5lCwt3co+uvhH15q
	ng5KafC/6pj/bpH7bJ7jsExJIuX9NbktoNm+hqVpXrXrwF3x5YmXkz+R75RzByNm+1w2Fc5l4Mk
	pG9u/sC/S7RG1EYDR9tLPeMQ+Z1mAaTR2s1PQjB/QJ+FuhJzKp7+yJyA0grIf4rAp3p5mUDHqWV
	wCaj1AFib45VbJfM56CZ/YIa4CCCvlciUlN6bx9BYYI1D3TQ8iTpVWGvK7NVt3p5Io/SmTj+Jlc
	g72kSXJEO448buiLssZnL0EcRe3VA38F34gCmDrX31OrSvfihwJXyQgNRtJAWHw7WmXeA1Gwgwv
	9IJZa6hXntIDoPFXBDKZD8MiDZFRAL1rbid3FNDxhWJ5AVAdT2lL9/CrPztIMEd8xU7X7EWs5Mz
	eosqwu4+c4KV1RskXbz4Ne7GeGIOZO8Lb2iNNJjK9IbDc9/pV47it3zPh5j0fZmaQ1sHeHsBh1f
	QHqgHL0vO8USN4jgjNLw4c5eVDw+JrDLjCy5yc+yRHDKRq85
X-Received: by 2002:a05:6402:321a:b0:69a:a4cb:2882 with SMTP id 4fb4d7f45d1cf-6a42f216beamr8673257a12.9.1787324362464;
        Fri, 21 Aug 2026 07:59:22 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:21 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: imx8qm: Add USB HSIC support for Apalis
 iMX8
Date: Fri, 21 Aug 2026 16:58:56 +0200
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBniGoC/yXMwQrCMAyA4VcZORtYypDqq4iHLs3WiM7ROBmMv
 vuqO36H/9/AJKsYXJsNsnzV9D1V0KkBTmEaBTVWg2vdufWOMMSIYQ5PNdTX6nGxPpky+o4vzI4
 o0gC1nrMMuv7Pt/thW/qH8Oe3g1J2/bdeCHsAAAA=
X-Change-ID: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

The Apalis iMX8QM/QP routes the second USB controller in HSIC mode to 
the USB hub on the module. Add the HSIC host description for the 
iMX8QM/QP SoCs and enable the HSIC path for the Apalis iMX8 modules.

The HSIC host node is added in the QM/QP specific dtsi to not conflict 
with the address used by usbotg2 on the iMX8DXL variant. Therefore, it
can't be described in the shared iMX8 conn dtsi.

Tested on Apalis iMX8QM with the Apalis eval board.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: imx8qm-ss-conn: Add USB HSIC related nodes
      arm64: dts: apalis-imx8: Add USB HSIC support

 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  6 ++++-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 16 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  9 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  | 26 ++++++++++++++++++++++
 6 files changed, 65 insertions(+), 4 deletions(-)
---
base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
change-id: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

