Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992965;
	b=tsCIHqS3OcM6LZMDkWbuVAWMYRCKqp3udZA1WvpHKXXgeoH/kpuRbCTs26pcDvUN8Q2u
	 Pt7xDh82G/pelB+qKL0qiE9lYIQZqbbgNvIiPm4DI2aooXwL2ZMCDZ+JsTaJrRi5wWCXF
	 s0SKBkQIi4qUJJr699VqZUvdY+OBIJtH7KEMlTLDlHWSktgABgG5ym2cPfJ6neSCHU3TC
	 eESZPqYTvceehKx3muApxIrgWfWANNwz3Wc5C3arL4e6S25SGceOIp+991UIMyUZiLwtE
	 n8ITeCV9f+2lvvWazZG3mzni5ez/glcfKAI9C7IQBetPBaTXBv9fVcWEuL0F0Dwz6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=qNqfsqdDfsNgEHKseCCwrqnheA/V2GPHkjSD2vDLs8hqZF3eRvL7HnRITteZ85XoCcz5
	 5uv1dOoJMeX2pZBgDAvLC2JJWUKJOS2I/ITwCiaGLont0n2BISq5T8P+3t5997TpYB3u/
	 XEu7lDK9o7E9gKHziyxcZgCoeoYgEsvkmyM/ZaD3jt3NrmUOK1LSZER1A5l8sdwlheSO3
	 fC20DDWqjc4LfMtmr8kkEy6ZtEx87cz5u52CBHg54xJaMIyaAeOTv1om6rbUCD8hO+Rfk
	 xwGT29oyVJmF19Td+vI+/XvqlnXCmtRyM4ndbBHRgBX3Fn8U/Xj/4NDgMFvtWm4+VMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b="LhCHoh2/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2970606A336
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2970606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=LhCHoh2/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5451615e9.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992963; x=1795597763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=LhCHoh2/U3GoI080JJNIQFDdPSkUALM45Sz5GOeyHK55/aH98wZNzrxhMWEDDOWe2X
         TVGmTY4fK9DUTYz/iBRdTh8w83eH5vcM+pYX4fGC3tYrK/rc/P+faf9VwELQYfp8awp5
         TeO7VL01fIXHFViPv0wuCAwacPxfbf747h9CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992963; x=1795597763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=YIckVyULApjeBt3GY8FWgpB/wXWFIa6cBY+6vc+pVQipu6cL3qFoU0s5x4cqnYYX3t
         8ycNtvVE9iVtAD8oKhh9Ygxs6QYqWvhVCcQGJKM+wCmLxxkhKmfSTGPQ/PotxtAbDXOd
         sMmsX+oku9s84fxttqjLBdIKCRHnAVMOJYdKgv+mtDbaahrhtMCSEPKbdElCXiv1yKM0
         MvBPZ2NrH2ql9U4EfO/QWY6RSyeUebQGvIMyjDEiGX4C6QJAb3+LwNiYixjIW++zzR3b
         Zgfv7qbzPMuSJNRoJDmMQ+A4dwuvNe1t1Of3IQDQcfVr6W5qcYPTQYxLuAp4CyA0PDt1
         YwZg==
X-Gm-Message-State: APuU4Z81eB/TDS30hRaD6qbNEGgD5SfDOgw7ed5ylwBkt7gG0EsvBGz6
	oM+9JNLhfQTt+dynoacUvnD60H1IAU3MGjKiieoTD3szIlqC0kJGgfEgyRBYGHc99jW4dyCpB1S
	muYji0H0n5g==
X-Gm-Gg: AYBFou3980ttuwhWIijFKFLxkKvMO8ywPAKsHOpsII2+bnoTZvnwVysXcLLJTDnbXNG
	SEN2XB5L/kuilViGl3a1dEOkyZFwyUeVamwTKi+Uw1DTgYsdm11ItY0xrvktP2pxRfyRlpKBMEO
	Q9P0xe2Fd8qcNrKewcr65C9X+j4mQtwxWTM5uVSpWrTvpgolMZidMjRgp0VbQYHB4IWHxkfcwO8
	Ka+8vAy8vOE00WWr5ofVRSiIjbncSI3a+mDEj4AEAN0Vfi0coKpp7z+4rMvbOFQVdGXr4N2L6u8
	UuxNcLjEHi5FpFQpBXvZ9QOXvOU//ynRiLIVUEqKRFUBlR00pnnxPaYmvYxtInnZFKEUShv5iXS
	qpVItoeGaBn9J4dcwRT6Z0e5pSvEYmDGE5qd0QQZx61ZmtbzgNtWinfmZZ7XAsTuXAthBH+GQGh
	hwHULEG3/qs46hFDlvyyz/9v5XHdmf7QdS0bLtYOatqKzd4iVm2jbL/S0TUn9PfzTMIVp7L1d97
	4WLoU7APK5/cy99UkWN7FDhpUsU/tEX0XrAux2OmEHTiYFjRC4qRnDWdhuPjU26Bw4E8zL6Ul52
	uDCeWrYmUNZ+Z01v/B1DDmbS+buZKOAhYHYWQVKEE5eNCPk=
X-Received: by 2002:a05:600c:3b8b:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb7da1b581mr45003055e9.13.1794992963264;
        Wed, 18 Nov 2026 01:09:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:22 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 18 Nov 2026 11:09:11 +0200
Message-ID: <20261118090914.38082-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118090914.38082-1-petko.manolov@konsulko.com>
References: <20261118090914.38082-1-petko.manolov@konsulko.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

