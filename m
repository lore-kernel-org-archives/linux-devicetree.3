Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF573C345F
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128751; cv=none; b=mz42O5YAJP417orjCmyjfT0ovWxvDoQaCp2s92hwhiHdcDXgNu1gZVNcZ4+4dJWR5HyAt5G+eX9nyNsCqkQ5o/DS72OCTDV1NLc6A0T1p0sRkJB6P/E4h/0PnABlZmUEDWSqNB0HeRCSTUKgVrXUdhGt3IkbLESgyyYJrImWO18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128751; c=relaxed/simple;
	bh=K1VIZ3NwHt5qEWl3louZYpxajUVl1gB557HUIiN0qII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QMWkhqh6P9JibBTjD9dWNyFon/roWJ/wB9nlyAFvO+Rinvn7jf27P05Hdma7W1pzCIkSb1IONAf5m72GAJ8qewkL9pfSM78FfKcjtXQWBIGxivmfjZuEdZSwMsh7Ij9MC5WA17xm2Lz70noxJVjabHk2QL+Rm4LbeprzRnuppEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojZ2or1P; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojZ2or1P"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso427287f8f.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128744; x=1791733544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1cONhEHrcirrtFRMhHudThkO2tsvRRJIxPc9+WouMU=;
        b=ojZ2or1PwufYCbu1U8opKRRmjymNYEFG1G2xGJv9IH90cbEwzBzr9W4wSuEjqnQ8A0
         YU8cLRFuU4wDfYpOlIDODIyooouRv1XhJGA94DGCbU2pOYkuwWXAX2n2acZfK/yV+/1Z
         kg9vLUr69NXR8drX/XOsQ43MsoHaC2F2vyfrni05CAXdYBrOfdwuiscEh7fU1PeITH6i
         vJfB/Mjex2CSSQK6Cdqi3XugFfuLGmfonBveQ56A5IFP2mLMfohCTOSs0ixIA18fizL1
         dCruMmdFOyj5LBiO+n3TVUBm5tzFDT7E/7I0C3UJdRXUSPlk5B/q6LVxPlEk7PiBwFTi
         UgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128744; x=1791733544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1cONhEHrcirrtFRMhHudThkO2tsvRRJIxPc9+WouMU=;
        b=Hu2JuPrTLwRb+NLHpDKgV3jQ2+C47ximqvLGFlqHxb9rRFMVHzP6yBa93Pj00Z+Zhe
         VQfgDQRfIDbwS07GEqZhMM5+oDdxyHXVicP40FzeRYT3jna3986+ZMb0krQzgQrsIOQN
         YjLrlpo9pr/JtkWBOe9Xb/b+pB0QMIdvtUn+1Yhw2Ou3JcmvAEVNex26Cg1HbuJ4PV35
         NRly9xaJ2KhZUNzTK6a2EMYexvwLFR+RsOgvz0MWqWWqZ+lC7fXUCfyn6UZgwKcOubNB
         Lnqj0ROAKYeP/rkQIEY9QUoocKMMCMHR0oFFnPV60K+fCIjm/4hvVWlXB36nufbDTCz2
         v3zQ==
X-Gm-Message-State: AFuF++n2j7h7Rt7JuNeG6YvXRmyMp9K+NEj7aDW69XPQ7ByzGTUSjTKD
	OW60kkOnjgJKb3xdu1HkVJpMnGljgzy7GLsbhHEIKHlPKFRg4ibiihft
X-Gm-Gg: AYBFou1o8Dg0QSPijdnjLKAqMTSrvjb+Biwp7zy+4muUzvVM3mCbiUVXHdYb9mwY8+w
	0C/x3I/luLO0H+wuxfZPwgl/PWevnUZpmw/whSLHgAGHkXS0q/4IV3V6k9ZOGru4v4RRL6IjAyL
	SLPEoRXoZYo1h1aYlQ6b6xhakKklTuAlUDa6aIuDtgjOd89ZP/BcboEwd/Yi8/MJIl+hFP9l1eK
	siF5NvCHPkMN+lDMMJ5/HcKeBL8nhumOzNnfVE/w7EZ87cQs6Om8Ha9gHS2JD+fCflSWuRZ/9Jt
	WAf//f10+rt4N9++rDkTPJmAHKMqadCDc6ByoPjAIMItT0XQHFrma88/tROWVyi06yJ/iVu96Ii
	MN5DBmXXvdN6VxZobBrXxa2HT5FXVJS00MfNVFT1WNsvqpxobV58Q/uK91L84cHB5IWAXq/G67+
	8tR7W/oiFxflKYL1hTHjNlL+CikRucHE0EPsFvxgdXmtpj8mYZprat/1cq1wVMo6ibk2Ri4N+4M
	O2jwX04H0QVNhvI9Ic=
X-Received: by 2002:a05:600c:1546:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a02756e5edmr142342575e9.13.1791128743642;
        Sun, 04 Oct 2026 08:45:43 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:42 -0700 (PDT)
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
Subject: [PATCH v2 6/9] ARM: tegra: lg-x3: Add haptic engine node
Date: Sun,  4 Oct 2026 18:44:53 +0300
Message-ID: <20261004154456.145362-7-clamor95@gmail.com>
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

Add node for Imagis ISA1200 haptic motor driver used in this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 99afd5d634e2b..1f10f4bfb5f24 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1568,6 +1568,30 @@ power-sensor@40 {
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

