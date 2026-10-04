Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC303BFE5B
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128744; cv=none; b=dkEvuhiRDnNOL3lc5JtNh7V2M7+2GUT7xQYeG/ZR60b45KXfBznuVr7kqKEAmBDAuzubQfLyWOEPMnQTHONBCe1yoHwfWJKdumHSK28FxMoJQaabQWFMFxv68Buq0IKvfaiZRtcq0Mz5OGrTVrB0HHB43aQvu2JDzCiNp23jzWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128744; c=relaxed/simple;
	bh=ZUdYFvNaKE6O850vYvFCyfLZJcA0m+kFLOLLYg9bgQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNzbyJmK/PYN/04Xg8M8EbO/g1eMHsR/8COSf8OoiVd700wvsnmhiRnKLirYdLaaXg7t5bDvsYHiqTNbbfFf+3b344Zu4M4PsccJpC8e0bCRQ+QGy5Mbf5VZ/MnNTRPDg0spBiy8jqWDVd1A3w4ktIguYGgpri3R1ScUDlkdjZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZ4WRohf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZ4WRohf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a169d33ef6so5264425e9.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128739; x=1791733539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8ze6+ah1e3mb9qAUtFemD4ZPugNnr6xsGEZLvksASY=;
        b=JZ4WRohfLZTn83jP11Tci8w0JkjVHpVCrFEx44uqaLCCVwaJ51qSVBLPMvwT4emqzn
         aUcz2jJ728ykoJZ+cYpmKNbGYaJrEU14m0qqz27rXhtK5dWXnwikyKkKzQLYsSpNHVo+
         R1eqihm/0Jf2F6KzTvhFnjgbdrRbx9D5qLpgmDKjykWZ6bdDYGZl8+3w56Zk9N5AiXpa
         5sgERbM6xGusxZ7qk6FquhcNiTxysogzWKIJ4AZC4YLbOKj81+2jpWDwBsx2hjr53JDD
         nT9HP2A5l8kIui4CDkpU26f7OfrQX65MKfGetCc864g/Rw+sCt7zEMVH+cY1jJbxAorz
         07NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128739; x=1791733539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8ze6+ah1e3mb9qAUtFemD4ZPugNnr6xsGEZLvksASY=;
        b=DZJnczhrCIQs3Lmhirhc+TGY8Ie99XjUp9xtWt0gkjD4aPUlza52iFeOtqsh1F1sE2
         lBRF2uzrOeGa6LM6c0molbrlFv2OlgDXpVaSSv3ACNxUv1ja5gdLUD7151AF7gmRCSlx
         V++HppL5W8UkR80OOlcnKP+SMrh952hpla/YfsWYjEwA2XzBVaPpIiF9QpI+jgP92B9z
         R9bY0XT2T4f4+UYbNGk+2QxAFnhM5pdnifpgYtCaOqzWPZl74lm9zCweC6ptaV0L+iTC
         mngqEZ8dBBfAiIg8CJqeafio+swFYjw9IZfhDeAk3Xka/mdl6/zDbLPxKOzg3kg4wVdZ
         QLyg==
X-Gm-Message-State: AFuF++myXqfZKG+ZwLGfx39qrvnXlxxJ5MV/hZdTSP7KZ9YwfbyPROpE
	256HXA/zaESAuBzyrYMRZD+w5zho8nTEzmfMdlt9TbwCSZwhTvztHW+a
X-Gm-Gg: AYBFou1pvwGT6BWNIAbdvy7iGoyHvfusSPu9jDD5sg8VuW+ZtxEYIozfY0LE2/Ranl0
	tsWP91nwr0zs1jTJx4D6xhV/UajjP9eiH2ap/MwQ/lRvDgMVS9OUG18zMgdA4yvQ3B6hqC+q0jj
	4YgOnlKKqi04Nax4qNTmFPU79j+aK0L8882jQWzoYSQNSAQAr2KwqcXb3BdwU7uikEQjuMDwrTv
	DhR8kpd+VudDclU+yXTl787zf3LenhnstACefPMlGAr4vTTCJI2Q6377SpmO5oj/54miGyo8j8r
	efyEBgbS7OgdRu8hTvaCKzHPvzz7q/9CCBk3t33T/vaPGnPch6CtG6UszqRpnYd/FKJzBlL76Gu
	ijacOVwt2NIO/U+yM10QUnT/44MII/bg0Cc/pZICPnWXRV0G85J35ZRQrO6dOca6bW6V+RMb8xT
	pIvi0toOsO9c5qaKP9FfodbZ8PnE0+lXhgZM7Jpz5idxhhzJj3ydvFUBIA6tNz+lBlNZkpdwJf8
	W6aHOYClOjWRAvWJPE=
X-Received: by 2002:a05:600c:8b2f:b0:4a0:f0a:976a with SMTP id 5b1f17b1804b1-4a027579f41mr142026455e9.13.1791128738839;
        Sun, 04 Oct 2026 08:45:38 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:38 -0700 (PDT)
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
Subject: [PATCH v2 4/9] ARM: tegra: lg-x3: Add light sensor node
Date: Sun,  4 Oct 2026 18:44:51 +0300
Message-ID: <20261004154456.145362-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for Avago APDS9900 ambient light and proximity sensor used in
this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index d5365253c740b..4cd2bbc94f9d7 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1106,6 +1106,19 @@ nfc@28 {
 			firmware-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		};
 
+		light-sensor@39 {
+			compatible = "avago,apds9900";
+			reg = <0x39>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(K, 2) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&vdd_3v0_proxi>;
+			vddio-supply = <&vdd_1v8_sen>;
+
+			led-max-microamp = <100000>;
+		};
+
 		imu@68 {
 			compatible = "invensense,mpu6050";
 			reg = <0x68>;
-- 
2.53.0

