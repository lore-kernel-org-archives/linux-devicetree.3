Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25583C1D6A
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128745; cv=none; b=PHhflAj1GDa6tuZYmd16lZT/6Y9QV/j6NVQuPfFP5aSsrNLuyUj9iz91LydECU/qErAzZqaMJGYUCf78WhZ++nCFXbJzbDPi5G534tt28SLFigiP8Y9Bv2GveYZGoWn9FzJ+b7vrILTPvGrb2CCo8UPBt9GdBzTzMD1L7BA2Rqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128745; c=relaxed/simple;
	bh=+Wg33H+j0BW7fCbkZpMgJjep8GTtlnuciQO6oSNnFzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3GKioq6HmNDZ0os5/D9WfEcE45BCqYn7uw2s3VPouIwk2E6hPMPanYN4pHws5SZxgzA6WLDwSc+dJvqXWZJdbnCroXsGGVB3m5ugVibH9kbFaaXCUojMvW6W1f+e6ENG8QSM8LpfuQrf6qDKsdR25qt/VMvneNL56KgrC7GTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfWEzVsM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfWEzVsM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so515775e9.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128740; x=1791733540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maK2q6osYhqFaPMRX/FyroBhpJkTPgnIYfG7JKgk1As=;
        b=bfWEzVsMpgXPjtDb1R3S+DUIHevJZ2CGlJ/I/xN2mWxV5OP57SD4B0QmSkRtk/GJzY
         EunL6Xe3dCXeiTVwMVJpr3x2TOIjmdb4WcN8makCxd5TJTGPn5To7ZNHp9sOFb7rl4Hn
         5dk28CH4mLcIZwF7vyBCOHTvgem3NE8U8Nd7ljJGZdECNLnwp44enY+Pn9HEdtD/7sGq
         8x6mX4HMhBN25qkw6dAwKeLQNy07j/PENajxXZvYDn7jddt0WVnWA8huQuWUN8xUaq5B
         aQhRy/yCsDWoGVIjXeDsOsGyzbvfizlPPLjzMixqCUxnTIRKA6ibqzvM91M76MuAuN2A
         t+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128740; x=1791733540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maK2q6osYhqFaPMRX/FyroBhpJkTPgnIYfG7JKgk1As=;
        b=QPGP9N+fiUPcIfXWcP+8DJC1xNV174u9EbR60xUydFoPPwFod3oEMjdBNOq9473wwl
         Y1Ldtilh8X7JSwQGYqJd5XdyevktVupynUl8El9M+1F8/roGDZXUiFFo5JA6MvB3UrTy
         ZfJaiZ6BsLF+FDsWw//qY5ZUKVPj5Ja81MOQwWzJZZ5sI3Z9XJ++cmvqwVkgj/SdvdpU
         XezDPjfeHOnB773MtMnStBzjrBGOpUuYpQ4+bqXMSnvhpLw5s9wkqIE2xVgnct9ujsX6
         B0sfDsAF3sJhYdzQzsYusf8aTPYimYEsZUP0UwUpcT83OZ158l6LjrRE25VJOzgODQeh
         Jq5g==
X-Gm-Message-State: AFuF++na9AQ1TPjv2T/rX9+h4Gh0Roy2pQ3IGBo3TxWCCZ2gNA0K5Kde
	oIyZwAxxGSEiYGLJIrDcxRsQQkskiMIuyfM9fpP0QeSYDlHE2f+bcpdb
X-Gm-Gg: AYBFou2nRUJTKld6PzVj7zm+VMpS27KURkXd9Px4N5jjDSrj9VXAwWcaXUs3KQpK2zC
	TqzDrlVDCpDT+Bg0WiS67c9w78oPI0/TktVz5YefQRYhsuQayZ08qVbgQhzznUJudpSnC4683vy
	8UR9oZOfWDXgF/r+Eu+4x0mfqC5Ux2lUIMTskEBVHYQhK1VXPaRx8Galvst/+6y7OnoVsUor+9d
	1qp95osCdgy/VMY4Wi5030pRzf2rnfDUZP+GkBSnSJ2SXKfJmwrf6yxTqZBHvNqZFh1h39XY4oy
	5wJ8rtciGmTxSYNycFX6V76rlarBCGMKu3whQeE4OwU6sbF4z8SksQSc91x/Cu+EIF4MNHRKnQ8
	iv7iDlBiI3xYnygoNpjkfuu1H2FHOBUfhqz8ntdL352DSuY/q2M57XQ1xzod6IIneId5LA5zsrJ
	yfcKDtfiwDAFuTQWhYWAjLAHeLHJ9baqIWgq5Tp+z0zbrXkKWzFrYpbWI4fvBcIl27vcXVG8bjq
	RdR9LtYbUGF0I8RM88=
X-Received: by 2002:a05:600c:4e4e:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a027566f93mr145298405e9.8.1791128740170;
        Sun, 04 Oct 2026 08:45:40 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:39 -0700 (PDT)
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
Subject: [PATCH v2 5/9] ARM: tegra: lg-x3: Add flash LEDs controller node
Date: Sun,  4 Oct 2026 18:44:52 +0300
Message-ID: <20261004154456.145362-6-clamor95@gmail.com>
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

Add node for TI LM3559 LEDs controlled used with flash LEDs in this
device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 4cd2bbc94f9d7..99afd5d634e2b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1233,6 +1233,7 @@ rear-camera@10 {
 			rotation = <90>;
 
 			nvmem = <&m24c08>;
+			flash-leds = <&lm3559_led0>, <&lm3559_led1>;
 			lens-focus = <&dw9714>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
@@ -1267,6 +1268,35 @@ m24c08: eeprom@50 {
 			vcc-supply = <&vio_1v8_rear>;
 		};
 
+		led-controller@53 {
+			compatible = "ti,lm3559";
+			reg = <0x53>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_3v3_vbat>;
+
+			flash-max-timeout-us = <1024000>;
+			ti,peak-current-microamp = <1400000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* single flash led is on 2 lines */
+			lm3559_led0: led@0 {
+				reg = <0>;
+
+				flash-max-microamp = <393750>;
+				led-max-microamp = <140625>;
+			};
+
+			lm3559_led1: led@1 {
+				reg = <1>;
+
+				flash-max-microamp = <393750>;
+				led-max-microamp = <140625>;
+			};
+		};
+
 		camera-pmic@7d {
 			compatible = "ti,lp8720";
 			reg = <0x7d>;
-- 
2.53.0

