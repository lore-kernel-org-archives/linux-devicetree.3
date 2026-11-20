Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160053;
	b=IabbWNvBp5XuC/1pOXsBMS2t3lZVC0ljVu+ywDIQtjq/RoyWYeK+S/sRvPxN37t2X4Ms
	 SMvYJo6PFQr1dhpN1sJ/87+BgbtV0snhHffUZgV/sxjRnrS518lp7RqbyAo/KH/t8B8Bh
	 82jWzUZUQUoNQfpP14uE9ogqxWFxl8EdUIBSEMdoSgBQbZFcTjh7KT5thekln6acBT4Ku
	 af7ONTe2drrFvC3LlIv40IDVNAyVa/9/NzOEwZV7eEvMEGZKrDiOAsbpIHwI9ztgEl3mm
	 1NgbyOl2f+zsm4NLnZvTbSBNRwowDRBcT6OwjN4BrNf96gZQYang+CT7Oo/kjU8HTNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
	b=s8xslq90jlqVF7BcbRIjAGMSGZmSrmUiTJOn6Qs7C5497J+2KM4+qDxyL87K/lV5dpmb
	 chfUaGQKDiJx2rzwPYYYMLO/G4Op5LK4N09iEy+h3lQvHs2PXtgWY6NYLAczWy8Dsrh/g
	 onE6Wa/pntH7USWkSDP87h+9dlIzGKm7JVZLNk07rKqppbZAE7D7p4Dcp6ZIKr6XcE+/7
	 76Me8lkoQqMfV7d6G0qzdpCTsIvFbdwdbf6WbRCZ9SczmRQvfrIqvuk4bvZMiVR2FfDSE
	 2GWYpRfm+QJYMV209X7XG65dJGOT0iYfRMeJH4iVaXisHxurERHkVFH9Shf2KAMhttw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caNuTuUn;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB06460A3813
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB06460A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caNuTuUn
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so5014745e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160051; x=1795764851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
        b=caNuTuUnbk/CiU2CCksNUM3jfmJfYfATNbvRdD6mDUD7922uAAIvcfffd8HaVo7nDe
         maUx/Q8bh4GwIzRKzUCpSPIad1bewWf7Q79xzOeKxcOhcWBYBAvOVO4jdo0T5YtThfJW
         VagYkp64XVf/IqUDjyLItsm0zzUr+wXUGEGfuU070mXHn9b7qxC6mkbHfCXdIDIa46Q2
         nX5Kal+csBsGL+FieTY0X6rMo8rn3k9GjRwuuoOVMTZS6h+W0CAEp+Av3gyxj5dVc06v
         +bOCPl6l2dsP9v4fG7z9CyiZwyed3x5HD7WFjZXszVEPa+rvsp6DLewlgqrMKK3ifbcR
         c3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160051; x=1795764851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qQAv0ke6L7thaRcZoBAW7C/f5nOb8olxJacy9wBEu4=;
        b=Ijm0Fve2alILcdy8xg3RHn9OWEsebEQykzME/Fxq3oXwlJD+sMLCzeguqqZPUYhZ7B
         2bA5vSMP0+D36ooSdxsTJtBaW7/gikoLXWS6YrQWFRY/MqMqq7+F0UXjWnKq2YA7bVgS
         XW2miFJWrgLKKmh+IqS4GxGT/kMGC+fI3pbSNiZ27OA2xBlH21CKooSlPc/Quz+N3HaK
         L05iL1dRenp900day779gNyuihmlEV5wpGFmWt5seUE6Pk8d/HnOGyoEvv6yWI1Ka/+x
         FTyWOQZDfgZUTDxqeyavHbmqYNZx49A8ObHmXABhLPeZInWxlyOpxMZ4JTm02gUboAe3
         8lCg==
X-Gm-Message-State: APuU4Z8LVjIXgA6HcFl5EZiNgKR54iWkYUIniV2wwkqWjZQqEe+Dd1o6
	PIeuEGNjyNPmVmiQ6Os8j0nZjXumVIx1vTwrrjGCt4HJfDTCFksWcokP
X-Gm-Gg: AYBFou12SieZurJRvNGgTrRwl/3qfoBRInA1OOgVfEK1JrqaQ+CZow2GZVpNy3eWePj
	vjbfqVxUioEuoFZncaIdUiDz3sD/mVaBDpqd021+abAx3uLWlZcrPUelMmY1/GFTSTWI0/P84Cb
	Y7eVfvyzCG2UK32qE03hq2YpySc9V+7ruMkUEzjBHECTwjfgmzTeykcd7fiHJwZkEK12K9BSADU
	Ta7C1lIKZXrFN6tEoBzPpcH5e/SafjCAehto15897Hmlr/4wgBjppvilVTvG/hAxew/S9B+w1rQ
	lFfUh5zApXN4HQDNyfPVBsVuvCINVr+++3AVTfpsqyr9OllJxMHH2vkpY0cgW9c7y9i0Kczt4Op
	vpC6oyZAWqTB4kzzbKczd4lExDBS+I0UEv3rRhacZGbV2sIVn1RgkO3OBGeW85dP6n0W7nFbWt/
	sFbng4NukmqhbvcOZd6aKj6UfZkyxAKvNiAvqMzSNG4Ew+9K5F2ox5XJ2SYH5jFhdxQmRcHKnrE
	nXrQVqtM7AHv+3CHk2Lu+mvkGsYqKvxR/ejhxl35qnpoxeMAldUwQ7G/eilP1eZicSSoOo82ipv
	ied86ucVvxrtAJU/fZ/q87RJmvF70MSrDrXiVOmJbfptXwBpQAZPo/0D6S6x+eanCqDuxuZsiqY
	HLFqacYdoneq6YrpIknzs
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr49766975e9.9.1795160051109;
        Thu, 19 Nov 2026 23:34:11 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:10 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Fri, 20 Nov 2026 08:33:58 +0100
Message-Id: <20261120073358.10267-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

Describe the QCA6390 power sequencer with properly voltaged supplies
and enable Bluetooth HCI on GENI UART6.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 2d8b06c05ecc3..46258f3a8cc72 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -65,6 +65,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	reserved-memory {
 		res_xbl_uefi_log_region: memory@80880000 {
 			reg = <0x0 0x80880000 0x0 0x14000>;
@@ -634,6 +695,14 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <40 4>, <52 4>;
 
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
@@ -667,6 +736,29 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &uart12 {
-- 
2.39.5

