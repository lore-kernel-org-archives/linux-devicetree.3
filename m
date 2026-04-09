Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FE2641CA
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765925; cv=none; b=XjxVWL5AjKOqDvzpgjEnUsTjo85TLMwQqRVolIkqur76dra4l7uOPUiF80u54LPecJq36KBs0JQWStgRFxirgsHWwWqvBQ13zU3RdGBSqff4D4dYzN1fygEg5UUZnBG6+4fsnFreeKXK++zO+9MVu4PjOeFq9V6za5zWGhAEbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765925; c=relaxed/simple;
	bh=mnyIpwA8/epHgHoeb8f0RmLxnS8bfUTJWV6cjsEiKVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBuEcvPx+nplXcjB2TRPjCvMNssvVlp2reKtXauKBCzhY88F1G5Pz/BFKCTczd0/fXCOBUBAQP4betvLppw/Y9woP2vGX2BXc0nPFi0bt+lwbpYWjuL4EViJBcztRsXP+IwT7qPQHUU4E3xT7Yofe+5+MooKHJ5ZKH9oFDq8Adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOakyBPx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOakyBPx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35c206f0481so1365315a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765924; x=1776370724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ju9xIYAZJV5mCf28srD3IZypPl0SWMmGJqicl4PQgS8=;
        b=rOakyBPxITn6rfpIeuN9L3Qx8QI/Kw4lL5QlxBO4bYLTjxMQDhFiq63P66nxMViaH8
         lcxQ2AHTlIKV6jDUrXiYFpm9bfjoGsDiV8Sp2A9y9kaYVsChbWA0pOcR0LPa8txmDGLD
         GT2bKANGoUFVXYnLug89rsI+iFUgNvq9asy3QzPL00m+qjeONiNv3/qwZ7kMey1YJPxG
         4X5LEhM/M2WvFtjHlmYJ/KrRns4L6z7Bdeb+HUtk659m4KSTALYBTdVWusZKfiQL22XK
         oSN9bf33UxWhW0gspFKiYNyhcSU9TI8QysVDcBeJe/5MSUyDu2RSkOjmAdEEsGaaQC5t
         pxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765924; x=1776370724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ju9xIYAZJV5mCf28srD3IZypPl0SWMmGJqicl4PQgS8=;
        b=fBDfLpElsmyuGwnsFzX3JGKCEQhwtxWVAv+jUmptbriiIqHrB8UmvCNkEZPWZHiQ+/
         xu2K8o5h7i4IOgREFUo+pv/rCB8+46E4BU1ZCPrSrm11qIb9cGeFhJ/awc0zgl9A2YMr
         f7vXSEaxMnKTcZIExm8R0wK0+92lOi6Q5hAkJgHcJiXMbR50gnjgS/U4ouC6cXt/5D8s
         NAfoWpczHZKzG+UvHscTZKVrDOT4rMjP994Fg9HTjVgnldWNpb0tfd/+1DMroB6OPuak
         /p6eORpF8UrdzqMxqLIRz1azyceHzDSsaZk0J8PxGLrwHi9butkOlQAXejGbCl43ADdd
         zm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA59lqPdVEODdyXmH/h8MHbM4eGoMUyhz/J0TY9cYEaxaZ91wV9OH7fgtRoEqXrpVXaWvqUb+KZoaU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7Sf8fUTwDEmvkBsR3EHrnLtNk/C5Wb1h6K2tlDX93ZOErgne
	lc0ZvsjdsDG334DYjALTRldaUoGFmugqAaMSN4vEDn3p2/aPdceVowYA
X-Gm-Gg: AeBDietOMhMSJkiakcceA8jFe/d+kxaoHlvopw1ZAxb6G52oxq4+72OeS6DaO55jIWJ
	trS0HiquCE+R1O5BLUCl6ORmvf2n93Bs6JrfxPdYRDqkWU+aMSJkQ1/g4MQmyyMwe5fSvlIa4Au
	Di+8Td/bF6njIVzgfAZ5XWDgOsCxw0xNf90YazxY5z1YyaMmNKzvEqoZW7Zf2FHUYlLiZd2F3u6
	Ea0xroJf5HmP3bkEio5e2UAslmQYbjnQm5RgHluupYSScIpMpvjMVSDQjJmjvliXzPNZlNtvAja
	Jz4JvgJ/2bsfUKnBfzSITzfhRh2H5GmI5rco7fxcFvFyyKCQbMGnIDHkIrrRjfkbOl+09qXy/Nk
	Dng31QHZfB2KU3aiePt4W48+5oslAlSAH4aLymWE3bgMvTFMV62mK9T5X6MppVsELRZRAHbdvLB
	lbe3TOZGvlZ4Cbvc+f3CC5IzRE9fbpL0NTM4aH6z/6FVBEnfP//E+yTBJnH17ofe5kscb5ew==
X-Received: by 2002:a17:903:3c4c:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b2d5a69ae7mr2868625ad.36.1775765923837;
        Thu, 09 Apr 2026 13:18:43 -0700 (PDT)
Received: from tomriddle ([131.203.184.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm3895425ad.82.2026.04.09.13.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:18:43 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bod@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1e80100-microsoft-romulus: add PM8010 camera regulators
Date: Fri, 10 Apr 2026 08:17:16 +1200
Message-ID: <20260409201717.108169-2-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260409201717.108169-1-oliverjwhite07@gmail.com>
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PM8010 regulator outputs used by the front-facing OV02C10
camera module on Microsoft Romulus.

These rails provide the supplies referenced by the camera enablement patch.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 14b5663a4d48..4427ecae423f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -857,6 +857,57 @@ vreg_l3j: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j>;
+		vdd-l3-l4-supply = <&vreg_s4c>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {
@@ -867,6 +918,7 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 
+
 &i2c0 {
 	clock-frequency = <100000>;
 
-- 
2.51.0
