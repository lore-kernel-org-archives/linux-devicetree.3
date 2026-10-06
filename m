Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7E46AA6F
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318355; cv=none; b=TBqNxPzdgW8bej2Jfq78wtVjTYCc/MVSDvu8lpTB4O5vI/i9/fE7xpm5dyuXL2vLxj+AUmVB/LkSTuI7fTgBBuxDzQyMAluLdR2heoj6wfVNXQLLQL4MEvl35AsxuWhDJZh3RcpJQij9OE147ib/ZIlPwfTBzMDiEo2k14wCBDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318355; c=relaxed/simple;
	bh=EOMVP3YQwkcIyqlWrQGFAqi7cRnWf4pYZmNhfVKctYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THazbitojuA8hdcM5lXf9CCCtQpAbksTo61aFG1X0Mawo04UNHAmoWp7VVxLV721alxyqrUeLOPUlBVJ9Wcmw6uWmc+AeVM340jTlOTsC1shVr8UNaxHNBMdkzXQOZIHWDMXzUtYRWfbDOp1m/dEpuaaewWSKljfPG9+o0ji96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Zoi0P0Nz; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Zoi0P0Nz"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso722703eaf.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318350; x=1791923150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=Zoi0P0NzQI7obJSl8NJ8k3Urh4mofmZ//Wtl3y+BW+defDjgNGAa902sOUS6v81pR9
         RfxJvwD75zAsl95XF7WbHHa6Ai4wJP783tHpsomiiFH1gbdC7MHN0licp81jniNziCmU
         Szofe8L75M/KxFMnnZQW1NKIM4nln8nWM3ks5x1y3+V2gk4hVIG4LbpN3E7sYE5JC3wY
         tVLiOSyeZVroM0JTBJOc/zbAOinK8HeYBZZB+g7g6TrFvfjeeiBY1kA+YuqHXNJcOglA
         f6s6WwAm6g+3/R0ts4gdVGQzlXW7CwdGdHyevk8q6+LVA/Q5Ir5i/2KuTUD4g3pTVbPR
         TEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318350; x=1791923150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=V4HdzUuO+YoLOmb0apmmB1qMa+1xzNYrJD46DpLXEw5yR3ROGE4d7yH7bYxdYcU7yq
         igPbgePjCUm5Hk1fBZ8XsRNePo17WgdLyOqzMCTTiuY6u7ccMoF5IOncMDLqJPzhnhZU
         tssiU2zIlzV5evuQgka8ZONM0wrx0srgbVfUX8VdMvJRd8UW+b8hn+Yya/sClqYxNcNd
         Y1cPEGR8CvtG9OZXPdwQPsditaerhPlgEcn61m8tZpu4FzG5m49RLxLmrOYtCd7Z/N16
         fO5g+zodqFRvXo6vJPqogHXuSlWvO5BINs+9xUnFkxaj85J5GwI5KVe+6gj1VIqoe3xy
         IOdA==
X-Forwarded-Encrypted: i=1; AKwUvByhg4m6kNu6tCFJ9aMzqtRxhU7Qz8IF60dbPUnBhaDDpGAZvu2Vwysp4r8rZD+LLWVEDLUuSlwnoSDS@vger.kernel.org
X-Gm-Message-State: AFuF++neFLYeyPapagYSmTR7NKllLHEbY8gmH7BAMj+iZM+bbJOTT8HB
	FXYit8l5ENBOroMnmMNRW31o9kh+K9ZF/uHfEXPwxapseBMlD//+ijcDVP1Fk2kzP29DhiXE2rJ
	Y453i
X-Gm-Gg: AYBFou2UmXf7Sel1Tz3UataUs2TREpSn7EDuLWeKUXkiZ/8sw/5StNDI5twspSg4nD0
	03rkB+IUXHE2ztItn5FimBGozrxasiKNfdIsFYQ0Pt9XY+UecVyvAfOHPZOiqONODUO/IeaArrw
	uwY8TGAScj87wxPWTiHcTnBkg/0j723IMKqAmumEPoJPPuYFgmIyGDHxBbjzwOXLxN9U4HDnSj1
	hH+4AsKyfyS18PbxA6uKOcveuJZt+8U2MqN60nNmhJunvXgbuTs4EfSRJMOYxM4MwE6ISw0NKuZ
	nzJNFbgxUiVh1R2IpaQ+g+n5LLkyyqYMkLCDEN7mG2w+2NClBDkrflDk2n1mMWHBhspsbw9sXSH
	+gZYiyKjeJMWerzNZaWbw+cjpW3KHsDSFdZNellVbrQSMxJaHrPGPRH+/bizQ3i/dFEOfhFzKRy
	TJ4wu54v0CoKk1hWkVlPDVDadfz1hb/fT4U5uH5IeVmd0mNtWNVs7JbWDSig6Uplz7cjgf1NvBV
	A==
X-Received: by 2002:a05:6820:4c07:b0:6d7:c2d2:3bb6 with SMTP id 006d021491bc7-6e7a825d4a2mr306044eaf.74.1791318349916;
        Tue, 06 Oct 2026 13:25:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:04 -0500
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8395-genio-common: fix the
 panel supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-4-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=EOMVP3YQwkcIyqlWrQGFAqi7cRnWf4pYZmNhfVKctYk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVk6xsdsb38h2XMoZmyUXwDh+TV2jSd63sKWb
 LEAsaeGN0yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZOgAKCRDCzCAB/wGP
 wOTwB/9qpjbVdEYGrVDi0toIg94lEZMC2rKuCDdP4g4DkG41TRMX0aSRt+zR3KkDxJ79JtVyIeK
 S+MIMyG8ojRbQ0JtT2MpPwX99fFJ44xH9o102h6vWagCYrVTTW/foDhJcKWL1r/LSZ3R2e+hdZF
 GWoHtZXRpEuqx1H8Du8FXvgPvATmIBKjVn1zNuKGT8xczC5l7VctkvrZ1m+TgdrzpvIVbWkCYV0
 i7jqtJ1kRXwdmsfY8j22vgm4OSBFZnW7fTwIpWgyiFu3ZpRg6n4ROXFI6k7A36VAL/MH9B7txNx
 pmagYP8bpZRWIwZGRsYixjEAafiGDg+mkOSiHsMiIg9lXTLf
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Point each supply of the Startek KD070FHFID078 panel at the rail that
feeds it on the Genio 1200 EVK, and add the vddp-supply that the
himax,hx8279 binding now requires.

The Genio 1200 EVK is wired as follows:
- VDD (backlight LED power) comes from VSYS through a switch enabled by
  GPIO47. That is the regulator previously described as lcm0_iovcc, so
  rename it to lcm0_vdd and feed it from VSYS.
- IOVCC comes directly from MT6360 LDO2.
- VDDP comes directly from MT6360 LDO1. The lcm0_vddp regulator only
  passed LDO1 through, so drop it.

The previous description pointed vdd-supply at the VDDP rail and used
the VDD switch as the IOVCC regulator. It worked only because the driver
enables all the supplies together.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index aef908df530e..f415b6f71653 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -175,22 +175,16 @@ button-volume-up {
 		};
 	};
 
-	lcm0_iovcc: regulator-vio18-lcm0 {
+	lcm0_vdd: regulator-vsys-lcm0 {
 		compatible = "regulator-fixed";
-		regulator-name = "vio18_lcm0";
+		regulator-name = "vsys_lcm0";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
 		enable-active-high;
 		gpio = <&pio 47 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dsi0_vreg_en_pins>;
-		vin-supply = <&mt6360_ldo2>;
-	};
-
-	lcm0_vddp: regulator-vsys-lcm0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vsys_lcm0";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&mt6360_ldo1>;
+		vin-supply = <&reg_vsys>;
 	};
 
 	wifi_fixed_3v3: regulator-2 {
@@ -303,8 +297,9 @@ panel@0 {
 		backlight = <&backlight_lcm0>;
 		enable-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 108 GPIO_ACTIVE_HIGH>;
-		iovcc-supply = <&lcm0_iovcc>;
-		vdd-supply = <&lcm0_vddp>;
+		iovcc-supply = <&mt6360_ldo2>;
+		vdd-supply = <&lcm0_vdd>;
+		vddp-supply = <&mt6360_ldo1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default_pins>;
 

-- 
2.53.0

