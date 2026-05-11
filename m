Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859B3A5E95
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485789; cv=none; b=YNUHtO4gEjVqTBmG/aCjbIhOjXGBFtne5ccAslA1BnPmFmO+TNILG8+MRSJp+jCs3A0Rk64ozJyIhuRyyn3dkouPQDiskOL8IiIAgFEYmWjDf+bxPIZcnU/z7o5rEbkoze0KmjLn7CtlYaV9+L/iMWWLMTg/o/vdw+9BNPu/3iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485789; c=relaxed/simple;
	bh=Mc8Dcste8PiXZn5dDJtZZd+nBmIxHxlDzT2m4LkONQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oot4SPeOGXvOyeUbtyjGfD7u01BVYoDOCUOjgTm3uSh76RLMpo/3z3tKhmisXPVwQcPPgNJJpkfZJD7L9D0CgT3FPmOkUWrPyrsfFLHdnATisRZ5dlKEeQF9ulSrQuwiST+Yo+xwBbe0pbfZWhvuRYliUFBP9Wyq7PzSgzalgUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpLjmyiJ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpLjmyiJ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-394095009beso10608151fa.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485760; x=1779090560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jzq0svM/CyVwYnCMdFf4d9/HiEVgTFbm0k3312KAqU=;
        b=NpLjmyiJ/Tk8Q5+Xbtrt7Mg+NTTDZJrZXgDg7RNkXMx1HenVqQXF7YeSi7nRujvTKl
         V7tZwSnfHq/XE+UUxJhyRaa56ovdT9NCm6GT1rMW9O1phez51hWUN9NkrBz9n2FuyXWn
         1H30JyehgBRRPt6J6Vh1KsxKq4iWSGU3NLFtWoADQup7e7uDLfXod/7rFnRX+MF/sc9e
         JwbXHgUsM9wzelpRYeRlwVPxEDwik4FaDMWJ57nJ0RtzQgh4lEtscwRcujg/4cKV4yz+
         oBitmTTwum5fePHqemjjuAJj3qjowGZTj4qaox1716rGJcM9L1E1cGGMkEG44BfsWyse
         ihPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485760; x=1779090560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5jzq0svM/CyVwYnCMdFf4d9/HiEVgTFbm0k3312KAqU=;
        b=rcyPg4wIajr5Yq3pkLDccs85EYNAbpZkWNxnpIlaI5isuZFSAv1yv7P+1SC4bSIaz9
         G3o6TzMRn8baGs6fFyE5ikSnNFAv/boxesgEZs+2LsqYU1qijqiQ4jMwoTx2LhHZigTB
         +o3gfDzUB5ayGZTtRt8prLw+Kfwy1QJyfzz3MGMeiRFoJDmtn0uvyFCHpL8GfxNEHM2I
         YlBlf3o2I4X/f8d9cUlZQrqXwAnMgCvecUsB7vWq8rQfPPjC+sLZzFpiykJy2vZwG/5y
         V7ShA4ZQfFzqvKxTj/EfmXxykgxJhvIXWCo835r68GuzoLgdnmV1OuMi3k5IG+s8VHpP
         AcCw==
X-Gm-Message-State: AOJu0YyB4fiLmcZ0ziw9vyeEBi+PRKFIIt1gNalu9brbjB/s2Cuaf+Az
	KuhD+Ae5xoCK2gQhjP/873/zGo0Xr9anADebNP6WsMAHf2aED/cbzVnvNVk9Og==
X-Gm-Gg: Acq92OHJ8knnWsCiyRPoCPv81z2010LvKwEDPJpa1m6ug5nbO5xS5XznTT/9i1UAVpN
	MmhdjFjH53O3wmxsIDOX+u4mp3Y1acLoCmgpZUIbJnRgI+dOEtUXdD6mIM3QVlnKkVIPkRcQXhq
	Gy4KGQNQ5M4zWl2DetwmrQQF6GXNY1yyivr4UIrqiAhpy1iyssGDu5NkZ094aUP0Wars+I/SiR5
	tiN4Yeuri+LoNiCK6FMVHPzPPRt0jaK5i1plPHUBdaDHVT1DNOAkt1HZ9/KsfHfmkESzFbxUm/2
	rqgkZiGPPlzIyEfV3J3tDfGcOBbivP3zZO9l9DS3AZ97ZYtfW95BiRceENpnlL6Mid7+br25CqJ
	Lpzd0zP+Lro4INJeY9kyXYLvjfh/vXsNsJJCEGVOHfNxvKfjwzAUxj/8sKgH7D265LUqICATOz9
	NJtnEAXUwKbbDl
X-Received: by 2002:a05:6512:3dab:b0:5a4:1198:5016 with SMTP id 2adb3069b0e04-5a887ae01b0mr7442575e87.11.1778485759791;
        Mon, 11 May 2026 00:49:19 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/9 RESEND] ARM: tegra: p880: Lower CPU thermal limit
Date: Mon, 11 May 2026 10:48:53 +0300
Message-ID: <20260511074859.24930-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ion Agorria <ion@agorria.com>

Lower the CPU thermal limit for the LG P880, since its chassis has less
thermal dissipation capability than the P895.

Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index 1b21d7628c8c..6b30e17459ac 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -537,4 +537,17 @@ sound {
 
 		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			trips {
+				cpu-alert {
+					/* throttle at 60C until temperature drops to 59.8C */
+					temperature = <60000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+			};
+		};
+	};
 };
-- 
2.51.0

