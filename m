Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55944E042
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240811; cv=none; b=I0Y0EmuMyi7S4VYOMyy5Kfxi/SNKZLKVtlKbtDfjAR8mFKxO5Qys0fW1x30zljYAFBHUKBmN3Hyu/tMjxKnZ0dt/RC3ek0cIYDgXABrUwdEO8lMzrp1gPcdH12C4Eo4kelW8A/y21QVBmKgDQwfwuxf9yZkTOq+CCpuLoug8czQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240811; c=relaxed/simple;
	bh=wHxFYx3mvxdbbx6m35zMlL0fF8roDcjXviwsUf6LpAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThZxjf8EcaGBxsjJSzdYWFyP7KUit28+aU8sTQOzbjnlBCgu13YP3Ndif5MFE7V/S9O6Z3HQY+OKeSY5+3PtXR7fKCBqWSdE7b7BxeEujUeSsT5u7y9ahCwbe2KV0dC/idLjA0ZrP3JvU9c0eT2dWEzjNbJfkqoHwWXwRf5SxpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiURavtV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiURavtV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49febbce9afso6225e9.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240807; x=1790845607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb/qIibv3qYKIWDbEUPNel9PVjN1RHSn4ca2JUKNgIk=;
        b=KiURavtVn2DFmp0ldOPf/axQ1sh6xjW86vWn1FSBx01LIwph7HA+WvERql+h9p3rR7
         K0V6NRqpFTXPV68LPGo+RBKsoNqP5o/osYobQ2n+58RrPXMGmNY4CTMz6lJri0XFBoh2
         tgvqVikiaf7wG4hbrP8jfIkBiozqFoaW0BIhxXvFP/I8/vGNaawhI+lM7+q6kEsWNpSo
         /C1YJwIf2jqXX19DyBXiZMzg94jjPyWBFzJVG1ZDn/YDMj3kKu6jKkAlrHBySjETp8sQ
         +YyRO+652QT08AfO/cr9OX9QvHTzgO77EvX+T5GEVgSFXDkYuBzbuS9r+95gBio/TUQx
         LFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240807; x=1790845607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb/qIibv3qYKIWDbEUPNel9PVjN1RHSn4ca2JUKNgIk=;
        b=yAQyZY0zhgJSYiM5FkVyWZ+g3vpxmpYwv0EImO/+HNnvrJLZG6J+r2Xou6r4WKMJwq
         6EOXEKUPLSt6Nkjqmz/YOVoV16V3XXZo+4Z7MLVxmLYLG+3cQagv73EcblJ/uWxBBKEh
         nprRQVXKAurOnjBJKIvfGPMDLYyKIF/XDgJfqrUuthJgpPU+jsgqxYB1XUPv2nAutWAS
         h5qAHOX9EVCaCFtGrQm6MXjiIIMQxl0SGuIU17COlPQ5opzudM6en/zkP8ztfXvip308
         J19IaZ8NRDCEmPpxa+5wp48W+3OauUFY+HRA28IeDUTo2b/oDTfw2gxzR7zUaFpN60UZ
         djuQ==
X-Gm-Message-State: AFuF++lDKxMz8nhQjpI41OUd/wAL1PFsV6JtkoqsNCzRHK09eZqYwu04
	MzOM2yIMvfEpbwXKEmQhniwZo0wXrnUJ3I73aB2sUf2sQTrjIIZ46V8z
X-Gm-Gg: AYBFou1H3wgKsyc9DcJh6Rv0qJQzao4X8nbW8eOeW9UYUy3TUuTbugJMXsPdWtVBgPv
	vSDlzvf7JboagdB3rwNOmaOc/NEOtyltHmaj3wf9k6HS4gsaqJvOgWmR/4OLwD8DOC4e46NEvSm
	Q9/d0zvpckg7sT0tjkRylC//7H7q5Ddm+iN8CSmwdP7WojNCeGnpYOC0lMMdY4WKXcg0vpVLLjv
	wpeZtpf/jWB4TWLtnrAnR32y9rt747V7sLq14uTQORWjJJRldCXZq3ieT2wqOyEKUopTLmLKJVp
	FA1J2ihUCHI+QUvYHEIICWOaAspKSQJDxbp6qjRPHmTRM46txRiFDb0klmE5pmdz8VvVbyIdOSh
	zCJ3fYiPe2fOlqPR754TkzPRYkzoT2zMTifRkX3oRdC+Aktx3FbcuwnT5AlUMXsakXH91laJ1/y
	vPe207ZkXZF/mWPOOTTMG29mftL+JUaA5gWe1AY+tlnGnrMoakK5UVE9Yl0mLmbXJfaVNrvjT4z
	QqyX5rq+qlvRbhv0N48NCRAGK4b4g==
X-Received: by 2002:a05:600c:34d4:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49fe66d07c9mr28228545e9.12.1790240805477;
        Thu, 24 Sep 2026 02:06:45 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] ARM: tegra: lg-x3: Add haptic engine node
Date: Thu, 24 Sep 2026 12:06:07 +0300
Message-ID: <20260924090608.28734-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924090608.28734-1-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for Imagis ISA1200 haptic motor driver used in this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index a59539f36a316..bd82a3f7951a4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1614,6 +1614,30 @@ power-sensor@40 {
 			vs-supply = <&vdd_3v0_sen>;
 		};
 
+		haptic-engine@49 {
+			compatible = "imagis,isa1200";
+			reg = <0x49>;
+
+			control-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+
+			pwms = <&pwm 3 53000>;
+
+			vdd-supply = <&vdd_3v3_vbat>;
+			vddp-supply = <&vdd_1v8_vio>;
+
+			imagis,clk-div = <128>;
+			imagis,pll-div = <1>;
+
+			imagis,mode = <0>; /* LRA_MODE */
+			imagis,duty-cycle-ns = <1250>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <2300000>;
+			};
+		};
+
 		nct72: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
-- 
2.53.0

