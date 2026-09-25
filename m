Received: from mail-ej2-f15.google.com (mail-ej2-f15.google.com [74.125.228.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281AB470112
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323388; cv=none; b=LOprsWj8QE/CHsyQgT+6Xu2vT6TwGIyuPQHxlxKAru5QlOXdXeXPwUfvXILW46oyFXWGysqr/ncAyCC+5HEgVltlD3UWIcz5xJ5IxumRe1aCHb1VBUlsNTn6aP9HkwQ7vKJ0tWqXufuMnUaWR8Vwh0K7AMs2zxyzFh40D8N5AT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323388; c=relaxed/simple;
	bh=g6JdTsSRR9F/kd9vFTjm8aBON937+a9RhH+W6bL44Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBylsuzuxIckqsgVqjZgBY7cYeaScXrfQHTVeTOTksSahO+o6E0vmpD02QuRUB1hzF2HV1k3AaOUetWt8YfVnBS11B80UTqiLI5siJCk0pr8pk3kpfBFC3yKjLQ1IUqcxz7hyhg0a6AFLaJlTfNugD6dY7Wh1CxqmQ9tlIytX+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=pY0BEZZi; arc=none smtp.client-ip=74.125.228.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="pY0BEZZi"
Received: by mail-ej2-f15.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso68860066b.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323385; x=1790928185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpzCtQ/x5w6zYJCz6BFrhS+ES9WYNEAKtYj1bG27RGA=;
        b=pY0BEZZiLMl+sONhTFyM396kNLS40oLdIfZ14xZMX8jmgJnUpJPM5rVlV2nRFB0wA+
         sAscSExjGw8vD/2UiXuhEsLy96bxmn0z79wKY+HiDhV0U3fSDG+M/EW+ixRQw5Zh9Mp2
         uhSUkvDPHvMNvJ+BrWjvIwAcygDAuF4KwpHMwc9d7L5pZTSHzvPN4ql08WIrn5YkiOA+
         eSlWwYtnuggm2XL9LTXO5kr/QZe8QRXOTEZPTt7m5lh6SBalOrdSpb/wUMRgI+LSzKzq
         p1qEoX4YmXaLbNBY82A/iGxxbScl7NcchpkI0p6oaWvvHbojijbzukZxREyORL1bkkMs
         TOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323385; x=1790928185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpzCtQ/x5w6zYJCz6BFrhS+ES9WYNEAKtYj1bG27RGA=;
        b=dqgnrQNtt3OPl/TqnROfq45mZnG1M+h/ZSpT1hYW+H9JLJhrCPWPGRsldqF7VSRVbs
         1wzh5sMWIK6N0GgKvQLWblKxYpS0D7wLmLqLG3dbvFz+KP1OpjLwz5tDai1+3V0N0lIE
         FJzKiDgWOln/vZhUbqHv1/K5PLin1isUwfMEcahpPiRqUbcsH0Ebz0OSS1Xb9fpbOKzL
         H58Hu0Dh583zj564n/Fzp6vnMy+CmTmB0B2gTunuBE649XizvGn5qlXceCokySAKzb7c
         BRHtIm1ORYaeodgyl7BMenAkvL3BfBFs56Q8VZJZWn7iJhqcH0xsEOoPhoQhS2JwOJeQ
         RNMA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ0tJjBeOdkjIXntJBUxsV6zPRNJ1MNHESxyG1JwyxMFJDOdDFIVFl+FQi7BixVL3d2EdiTUybirj7@vger.kernel.org
X-Gm-Message-State: AFuF++mRq18/dEIvD16OcEB3NKrr262bduIDsiHp6xFZfCvXk+fYzOrI
	duA/K1Fkc3p+7NfnTw83qrzAeApQPGvh/lwSgBONVD2K4ld0UNldZ4D69n2UH6/gVsE=
X-Gm-Gg: AYBFou0a7XPnSPzXuAg8IxxUCTahVQREwq5FWztQpdfHeVOPGHKQD8Nsq43KLevjcYs
	MOE2uK8dGalFiS46BAW0ntyAQy6ng4/cNAHGz6bmO7TId8orIAXPJcUUHP+5IR7IagXrhrfYEAR
	nY6XzkZwUn8NdnY77gOeVllooj2Mj+ewRilEo8qz3NXD8X0a1fJ4Ou+R9BO0KxYu1euxD4t9S4H
	kn3w77x0/EA/noFlkm6msDmtCasAZYkFRQJ+Mm9jUQQ+Ax20Z8ajVZ8yk21JptmuYpr83tDbAKa
	zjU6HL+OnGya7nuDwro9DS7z/HQqu8/7K/JfoFWTPEFQux+XcnX062UhbLUbzTQEQHvsJ28f9CR
	BGqgD5ziZssSdUL54DNTGou0enkoceiyYSAscyN3XjMUzY6vNoihe/0QKd2AbZRewqa5Dc9qK5w
	f0Kj4pusT/xoofIKHmhIv0hMPR36iK7SM8S4cknvpsvgEb5VOmVuSmUQ7hA8FZQ0o2PhEiQV3Ab
	cZkRW70hAmrcangvbEHLl7HT8UNXfwZRZIY8HDYsPuqp6o=
X-Received: by 2002:a17:907:97cd:b0:c25:5d2:acf0 with SMTP id a640c23a62f3a-c2ac241f82emr459322566b.8.1790323384750;
        Fri, 25 Sep 2026 01:03:04 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:04 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
Date: Fri, 25 Sep 2026 10:02:57 +0200
Message-ID: <20260925080258.46489-2-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925080258.46489-1-adam@wermuth.pl>
References: <20260925080258.46489-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROCK 3B has a 2-pin fan header powered from vcc5v0_sys and
switched by a MOSFET driven from PWM8 (pwm8m0 pins). Enable the PWM
controller, describe the fan as a pwm-fan cooling device and add
active trip points to the CPU thermal zone:

 - 50 C: fan at 25%
 - 60 C: fan at 50-75%
 - 70 C: fan at 100%

each with 5 C hysteresis. The existing passive and critical trip
points are left unchanged.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 149a5306bb03..b9f09087b176 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -24,6 +24,14 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	fan: fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 64 128 192 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm8 0 10000 0>;
+		#cooling-cells = <2>;
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -186,6 +194,45 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_fan0: cpu-fan0 {
+			hysteresis = <5000>;
+			temperature = <50000>;
+			type = "active";
+		};
+
+		cpu_fan1: cpu-fan1 {
+			hysteresis = <5000>;
+			temperature = <60000>;
+			type = "active";
+		};
+
+		cpu_fan2: cpu-fan2 {
+			hysteresis = <5000>;
+			temperature = <70000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			trip = <&cpu_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map2 {
+			trip = <&cpu_fan1>;
+			cooling-device = <&fan 2 3>;
+		};
+
+		map3 {
+			trip = <&cpu_fan2>;
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
@@ -670,6 +717,10 @@ &pmu_io_domains {
 	status = "okay";
 };
 
+&pwm8 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8>;
 	status = "okay";
-- 
2.43.0

