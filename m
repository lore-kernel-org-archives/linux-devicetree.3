Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919201;
	b=BQPRv3DW6m5Vucyt8yRrKx5Ng87dvjut+d4xaqmjsiYl4JhfLpDeVWbs4KlIDt8XROaR
	 IedqV434uV6Xqbu5xOg5PmM3P3BAvzdNsnhIN4w4f05TXWl57jqIFzExe//pczQvhBa6C
	 UtSx40mOFnN15Cn9nsmI0YctFOPX1rZJT3dQyKEi6EOOJ5PDZ5Z2vL4+DHYhBldYllgHF
	 vHgVCXHLOD/V0jLIGuLyDPXLLW2TWAhbQwBLMFtPMhz39q4ZhQo+z5A88hk/zqPfJ0Bvw
	 sCkBaQ2CcGkC+TgJXVt6PQVvLdqpaMb+q5pnzxFkslBpR0FE+Qy6vbSwtmBy3m37tzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
	b=v2J9z5Vp8Pucuk6ESqBBAed8qTr6v1KaDLQ2tJyKDcUtIBev4UCPNabbqDjq0c34JHbu
	 2zF0I3ZSYnx7M1h3ldTyEMtTM7AQxJ0Vo9W6rWHlX12HtxCjmEWX265URA+TzI80zHyUn
	 tOL1i3W8SIPqqZgv/2sj6tVHWytve9j9zrgvbSrpOCIM7vu8f6SpmQved8c8I+hMdwPkk
	 RjroqsiSv99i7FPA+D7Y+NeP/2BN5wUPcAxcgCBjUNDC+rYqJjf6f0mo7xgQ8UGt4zcRz
	 Cs5hQp8xto3XlvvdksVPwY+lz0tKYEaIlvlZkAykJmyrJZmPcZVg+DW4Rtdm8lYCFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amuFs9ok;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3405760A6F45
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3405760A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amuFs9ok
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso52102435e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919199; x=1795523999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
        b=amuFs9okLI2wRGNauxrep+gGsL+WgJninSyaPDOkEbfMWHi10AqUav2FKNgAwERcf8
         V7IB6M42D0ens0gIQNIPkVtXA+GlgitgDE/T7rM6Dlc97u7gzS4hyS4gFH6X8HoHIKB3
         Y0ExhX0hVl9YGII2y2SZVK/0Z81ZNZ7/S/1DAXzPo4mmNwD02YDsVjM7OXvof6xjax9b
         RxNowgKMcyVGzB24AobXPCvssYOu/F/FgK/lg8M5j/hPa7llwNTv73eKS71OEYgmdOjh
         6fYLD9cmVDCn/h8rw7RPMmeo+yAV7i0mpGYKAXXAHZMV+EpEJqIPNadAlkBDgh5j5J4f
         Vgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919199; x=1795523999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
        b=oXslf78pE7xfVw5hyY9zmaArHPcIx95OLvu8VVfHvQv204qf9c/+S6grNz7jOnHLcM
         ifDd4R9umu6Kbq6tNkWPmhJO+Mw5zTIvmazYD7yTxC6TTIEqcOOYjhj8uxLna7wxPIDt
         mg7q8hl4sDNGovqRZzMU12THwviQjPUNJXgAFkI6aCWBInfP8RMBbyPHmyo93lwuTHe4
         aW+1f7/NDS74dEmBWGBkIAWvwYhYmSf1S6uqmH5Dn/hGzM4QOY3cmjK9oZapn6OJH5tv
         kY2ZCTNcD0mLgFaa9qMe2jZ/MIuWsp6GroZatlCPCrzXAUriLJ3QnoehIixfW0Lxig5V
         VjOw==
X-Gm-Message-State: APuU4Z83A2xh+zRAp3WDH3U4Y2eBrC1KFWNlrxsX+HWpkmOdpqB63ur+
	rA/8c5HtzW44PzFP5bihOVjKpG5PjCPU628duogIeTCTwoOmq5cvGqib
X-Gm-Gg: AYBFou3tSsdE1jS2L3+mp6nkYIQDx1GHbqpr8TxmLPFob/uK8XQwZbvnak54rZwvWK4
	sOBMZnSd6EhxUqYv2481i8Do8/u73z38Ty3+mU/C4Y6MEKcv13OvGtoYo+ScgNcMoctCCQs7TPJ
	tAeewjSpgF5hakTIclirfVOhQ91LilXAofdVKKSr95LR7hR6lDdqmhMI7TTy2XT1VHessztqPF+
	5G2hBzpxMrgfHwnxPi0dE79rwh3yXHX8SVieXiuvasQdX3dWV39wOaYh3hORqJvImeg6N0tzIDx
	4v/gSL7kunshl4zASa56WHXqef29L+oVOt4PrrV0DEWk2M8ehbztEWNe9ivlPNx2S+Yoyl3A/In
	WaJSJ+IvWcPNNhR8PtYT/OamVEdcdqphRCrMN03C5MeOdPk5bMdDP/Fa4yGGkbgGxJTqmlZSByf
	RkIRepX0LXv/0sp/ra8qdG/cjpZ8/R44omD0qHnpiJ+JFajxE9M8H+qblhk+Zo1bvDSm6c/+yHz
	dB4anz9Irt++o1fi50U4NI91iokrFJUERN2HwOoOT5pjLIq7Xi9qWuIvWQn9z05G51/zRQun07t
	cniHq5MQYZSWlXVa98NZmRXy3vRhYoAp6wm1NqSKzpOQ2ALvUVf0GeoHJOVWasYB0wbq0w==
X-Received: by 2002:a05:600c:4e45:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb56bb49f3mr279082685e9.23.1794919199526;
        Tue, 17 Nov 2026 04:39:59 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:59 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
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
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 10/11] arm64: dts: qcom: sm8250-lge-timelm: enable USB Type-C
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-Id: <20261117123946.668557-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller as a sink-only port. Keep the
primary DWC3 controller in peripheral mode for now; host mode and VBUS
sourcing can be enabled after OTG power delivery is validated.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index a094aa81ad225..6b57c658cf918 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -535,6 +535,24 @@ &sdhc_2 {
 	no-mmc;
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_BATT(5000, 9000, 15000)>;
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.39.5

