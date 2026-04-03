Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779E3ACA65
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224530; cv=none; b=AuXVjAUU/gYCBzChSJxbB4LceqLipotNILGMWEzmXQ0DiA9vm2ODYQvWNEMXMhAZEqdXSb/AGCFOpa31b1hEdSHa8FZkdjLE7n9WMwllqOlBBd5mjn43HtY4jN2gCb4EEzMej63hqshkq6ov0+tTJAn+mi7D3qiHQHgi2J+0X/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224530; c=relaxed/simple;
	bh=WiO7xxC4vnoDFEP8yYgqIU+yonljli5p0uLIYnjF80c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeR+/P5wlTgM9XZ0ekpvzZUDLmiFTKG+3toG7wIHdSH2otSvfFoSVyU6NGso4Be6kncji6IwPOLHQKc7vQWYDH/PfdVdrNPT2o7pb0tgyB/aotdDohPbbHIcrPlNGUfwu53loGVrkcTpA2KfROKrMLelV8nRomC0L7lTxcnbB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4j0QMeLi; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4j0QMeLi"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9358bc9c50so272185666b.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224523; x=1775829323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=4j0QMeLid4kOG+UcPl45sYTvbZMQn7MK59ELOOB1UTelF9wBWCF9eXKLcEY8tuyQvt
         AKiX6dZmt/TG+9WQBiIfw2iBRZK/3UNmHr/Idx0N6lUIPfwgGPDgHzk5iegkISC3dCqE
         /YntSiHddnLvw6fXA0wgoBFiTXGUEYJume8Bn/fT4K4Hz4n1s7c90rcTW2rpRzw+3SPJ
         brGvhfLo30ADRWBM8QVzpERzVj+t9WAqunOC5II1wrOqtDmqkCgF39AtJ3poq/i74lvL
         q8ZEDuDouyN5DoM+NtfmepBTiL9d/+b3DVgHTng+Lq+PLRurdwtB3ZLlMjCbN60UeuDG
         6Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224523; x=1775829323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=Y4IL84r/A4YA4wFEptr/Smu/UIQ+Clo83mhIKkK95ih2RIvMIOyhxVsymXURFaRaiw
         ehvyv5mSlpGJXeBsm0X/mOABJKuxIsLjCHggqVystbf/1WfYBbjQHMnY41UJ5DVK5Fi6
         tR7VmM/nqssXP7D0m6dfrfovH3F1Lo2N+mCDjks9rUP2jOJgKwR+UddSevx9MYvutpJl
         lWle/J4Dxu34biEndgjZ9KucXEZdIGSdL3U44oWOagI67fk5IpRxM2UYl1Wufvp75nJJ
         JojHm/fk6FJkt9o14ZafUSHlUgUnX56oCB05IVZxiY+mlle0B7J+s1s5YWHdeEKo9RpR
         Pgzw==
X-Forwarded-Encrypted: i=1; AJvYcCVCUiSWBN55J+mSc9Ed/v4e3xsk4OYldScXbp9oyqj5pL4m9HyD62fbd36nLiWKR4jUwItjIggiVizw@vger.kernel.org
X-Gm-Message-State: AOJu0YyPiiWIIQ/xvTn2PD/4U9Q6qQ6HMcDHnCckNMzjqmifKQprsitx
	R8ixKTM3OXdE3UI28vc0YKfpRAItkhupf4V/vIkAhRBFO7mwMyx6UlwJlfuDWYh1yGw=
X-Gm-Gg: AeBDiev2g2T9SOHMydGxZrkc1IydaUXcTJhtdCHQizPcj6KWy4DlVzBAoEfpCKGega9
	Sc6X8uZEWSBArK0p/Zw326RyE72IXmSRtHyfXaNjvCnUOfeg5zVuGbIIQTqACLCaTuAJBjVRUyU
	/flkynpoajDQsQ7zHpNvrMtbBrzhah4KFKELUbk/AczbkNMLQ6kkvXugBXmCR0AVyfg5z8xQ073
	OExHiLt/uzz+hOj1EDD6dVo/n5qAOoXHyeEFCUmSudoBfLHaCdL9KmEAxTjJzUSq0S7qQN0+XSY
	FaequZZoSCgD7miugpnPwLk5DhYgLb4pVJZ0n7YgXZp6OWNSxb2ZuELKM6EuvlffPDSYhB/Y1R1
	40X2XXSF1vYnu5xe2GXk9Di/sZu2T/6kfmTyasRYYe8Yl0LLT2X0soiHW56yRwNcy5/lVVaO4Ra
	o4+/3OeTP605DnANDeH9isY1Khk8PvOTpFJjDqZpf22C7fVB0t9MvsT9FKp7Qg9hPS0a3g3RkTw
	J8ytzuPYSo/6s9t4C2sKMxuqOuEV/1M+ct6Bw==
X-Received: by 2002:a17:906:6a0c:b0:b9b:5164:906a with SMTP id a640c23a62f3a-b9c672a4f0cmr157218266b.4.1775224523388;
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:53 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1686;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WiO7xxC4vnoDFEP8yYgqIU+yonljli5p0uLIYnjF80c=;
 b=9xLHPNbkt0sV/SMYIy8WN5UbmrF1+a9f7EhbS1150zHQgK2ZkM3gLMQ3RUV3bSz9ea71I2aJt
 R2qV50g74/zAGlFDurH8tXrwoGm2tG7BDnEuEDClBZR1UMTaig0kdCg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Thanks to Alexander Koskovich for helping with the bringup, adding
the missing pinctrl to make the WPSS stop crashing.

Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index db72418b7195..d8ac495ca7c8 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -242,7 +242,7 @@ wcn6750-pmu {
 
 		clocks = <&rpmhcc RPMH_RF_CLK1>;
 
-		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
 	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
 };
 
+&pmk8550_gpios {
+	pmk8550_sleep_clk_default: sleep-clk-default-state {
+		pins = "gpio5";
+		function = "func1";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &pmr735b_gpios {
 	s1j_enable_default: s1j-enable-default-state {
 		pins = "gpio1";
@@ -1049,3 +1060,9 @@ &usb_1_hsphy {
 
 	status = "okay";
 };
+
+&wifi {
+	qcom,calibration-variant = "Fairphone_Gen_6";
+
+	status = "okay";
+};

-- 
2.53.0

