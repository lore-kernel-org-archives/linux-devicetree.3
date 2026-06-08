Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA33C2BA8
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913384; cv=none; b=mq4Z3f/d9QBPrHBlSAjTlTOKrHagVxR0g7+1tw/14LAaohvEDIjSsC2g37eH/IIBL1X5Kkrogw2Cz2wj0uzeXAMW4ZWXljZnhUru5nuIdsukFAFr4kI3p3ryUBvX3UBMjsjxvZHLv7CRFhwlBEwJaP9glsPw6cdDjJAdURM+cgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913384; c=relaxed/simple;
	bh=CbsFlDNtFpz6GIRTFluFtkzC94Ozj0Tz3dlAQs/dCJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYFf/DwpxOvb3mM7qoVwcYMVEwvwcVZdw+7TAGKXODf4BcK5gZYrpIDy2xSeiMaIXfklPA1WxA6k2EuUXAfK1S2skDHdl0uF+BHRh10MzjP1bf9q/0PNy09HwMp66BeeM40Pg4Ngthw0ifr78bPc4ilKS9Sy7WqwGaaYne2Rqzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSLH4Oqj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSLH4Oqj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so52800985e9.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913381; x=1781518181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJZ2SsrLyYdhpaIk7NOSs9hYatpYCTJ+2tcOe2ZTmuE=;
        b=pSLH4OqjsoyuhYQ2fKnMB2xzSBoxZdFfKabD0u1hKWRd8137vokAVNO+E3Cqc9kZEg
         RGdm5RGJQJ4xd+/loaPU1jBLAjMwk9SZ/20K4F8RUglZssaiI3xCkbLhRAy/rAvg1+zV
         e3yN0ofuP+y4W4G+p6ZKy4VCXP6b2s2cIvRlbFa9JbQ2fX+Z7GRwk6H5rae/5x2JwS+t
         wSDGatUegRVk0Alb1KBfeaGtDzc5xRMwGDGrgS6EjOZIZkXb7pdNVQIeU4tr1kxY7WAf
         6/lAf/ca+eUJ3w4wbRfB1btWpriA0wPrle7nhtUHFc0JlNoeWQWyUNU7MI1iBd4hW9Nu
         AClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913381; x=1781518181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJZ2SsrLyYdhpaIk7NOSs9hYatpYCTJ+2tcOe2ZTmuE=;
        b=iHaj/ruYRClauOVzzI3a3fs7jFdLQN7V7tTRF1gTnBs6dI9RcuaspuySHSJ97SVzJ3
         TiIm4SndI/8GRyfRyXw0zRGu6ZFF4QwG64EPbP8sTFuYYKZKNcJEzUvu6oQ+LR8htg/9
         Cy/9EtfghVmg1iUzdWpebcyczWGz4cajDheyAKEFk5hpWSSF1tPvXimEezXMGobk4OXu
         OL2b1LklFQmSsp2PsV8DWaCt/oN8qeD0yirJnLkNn1MyskLMPTSXronvSBIXJ8FD9xH6
         UjCbRZwLYuPPL7KmNWFeE8SuXoKSmaXbvSR2DzAw2emymqCeH7axdOzrV/95+3Zw7ogG
         8Xqw==
X-Forwarded-Encrypted: i=1; AFNElJ9o2K0G6GDW0Fla21j+p9Nmf5PD+vsiXSUVwEu9IcztoRS19fomxH8GtOBCB33E10Ya7HzlrCNTJJj4@vger.kernel.org
X-Gm-Message-State: AOJu0YySr+u3l8G2UWN2Fg5YRLoMRl52tp52Ak13kQaopH4Ekyt79NM5
	Mavd5GcG0ZEeMGMsiyXCih5WvI9xD63tumlxEjsM2dAhqRIf7OtQ1AMY
X-Gm-Gg: Acq92OH1LQgLjXO9b6cVEUBgumPxzkXWwW+dLTz4ZO6P0FR69yRfMW7x9WVdYsPmFAk
	XhVox2FH/xAzBFDokUx3IZ8PUuwfcsO0CMz290UYMycTujF5DQP1i7rmDyWP3H7u5XI3oEIqWhB
	cgM3E7DgAm3q5ue9AqjSiXEFogxUhiBNerH1xiCJRWvrsIyET57m1J03l5ZCpHz/dPQtt7hCm9V
	nzBLF8x3CCFHDSoVQtmBwXK9PIQDZ810lydrNI9bxF+WwGuGCLN0ZUgOnVIdSKfZfs0/5ktPwHb
	BosO3SBxJ1QU0JN+qtqyv/6pkcw6cMfmYMgxtu1e2mIz0fMJ0Ch0BL0irAu6Z3N05CvvxEM2UEb
	KbICpFcT1pgPp7RaSkh5b/fvaKzmwYh2PxQNl/RmU/W60S0B6vrDvHjCbv8QhlwnUiQz1omew+q
	eNP/xy00ju1FCjMTuD7XzpwcRUNYrBfUR5/OGqU0Ir+Gd0NAfswEBEe+iIg8X6cJ9KZY6IPYJfc
	VgdPcFLv9aTv+oo4ggnSyDjSIHcLXEQLy8Chbv6FBOFpuSi
X-Received: by 2002:a05:600c:8b70:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490c25c20e0mr231115895e9.24.1780913380888;
        Mon, 08 Jun 2026 03:09:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:40 -0700 (PDT)
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
Subject: [PATCH v4 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Mon,  8 Jun 2026 12:09:22 +0200
Message-ID: <d940e6d16047eefae56c866ff619fe952bbb89e9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e9fcc491e5b2..7b839efdbcbc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

