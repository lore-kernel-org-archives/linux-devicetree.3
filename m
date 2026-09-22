Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1052237F75E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042305; cv=none; b=iMWTugQyaVrWvFQo8YVyUdHqckNzuyY6Y2hQgL1qDj+xDV8kQQmoHXm6QqDe11wTiGA8phg+/SM6I/mybBHTZM7wAPUVqJVWbq68N4tR4q8zWK4ztbH+2ljC22emednnLgK00K7Ra1w90lB9kEzHZH1X8ZunOUjIOwagpsWGLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042305; c=relaxed/simple;
	bh=vq54EajIP39dRuxeBY1lhA1IqSu3dNrh36yxc7fed90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIMjsX7MbU/3RQIMhA+j4+TpZBRz8F1/jZ4ucb/CpOCc2E30RiUXgT770zKhmMgj0lgd9OQMMyPf6vX7POOQCDr/Kqyq6Ov/hEl6MM1Wi+jFuh3dVneZx9fAHvTAjG6DfMZnBJU42NXVCB8zHNmOj+IUeCsLiyOsAmsXKheRtoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HK9ZnmG6; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HK9ZnmG6"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76543e2so15853881cf.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042303; x=1790647103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkpW/oRsT53SEySP7MnEu4IONGPQruWHzkCurp2roMc=;
        b=HK9ZnmG6XQz5FZV/mUVa7P84pXu+c2dK9lsYLWdm5oh5+LjJFJAH+TXA1DzWWwIBlL
         aQZLc8nI9Hae54iBQEnba/1J0vxwH5u1t+VBwqEaG6ZACDBLMTLRysA9ViiYS7z0PEEv
         B/f1w6JSHDOwNzNE75ySr0852hEyAkuXv2OvKN/9etW9vR1nqdtvnd4kgoHWmbUkMZmX
         TO0L8ehC4N0uimAcxNeIkbpMjwdRYhrJZ2J2GQhCBNLRd8T/sN9USb+sMa7WU0aVkh6t
         LfYaz0EUYyzTCzFWdPu0NF+P+E0hJJy6QNAp6X7LZ1sp5slHT9pDsdW2WxfLTOSrKJnQ
         pCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042303; x=1790647103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wkpW/oRsT53SEySP7MnEu4IONGPQruWHzkCurp2roMc=;
        b=Bray2Djw5uz+YG1nGmVRF0/7bCAbLWP5dZsxPwCiDeWg/kS6HTbE0GbjmCW3YIWA8E
         rqx2olCVTienKHtiXiECj0JRUNY7kejyAs7fK4Gub7XVgXTsq0SBMLxtTbEGgWv2+rvN
         kLMjgRzBunaijh1Bk8PfQPnv8Cvl1to6UNTivUmaXuZUMRrR506s5av5+5GBYVyy8gHT
         2LxtQcPgJn05aJaHd7SpVj7ed2y4PsfkZb7yYadMXfQmckVsX2V2+30y57umWk7hRw+X
         rPs4qIksaVgIXQ5/wjclCpEfHa+VRTzJ4Wa7s98lfHnpm7/wjN76i+ppvXXstM0nEYvN
         EVRA==
X-Forwarded-Encrypted: i=1; AKwUvBxt/CGxqCs684uhSfpm7zd5GEPYdk4Brm36HzkYAWyAiY4JIBFCbxBvuNNK1vlnHvisyaS2v+VyWQGD@vger.kernel.org
X-Gm-Message-State: AFuF++nLeThtH2YkZbA+bOgMDthnKKMPv4BNDfG35gfzcTaw8RGaIA3d
	C0uFSXF1rq/i2o4EqzWjVR88ma4sffGdzb3dGniPCWS0Iekr8qNocjwZ
X-Gm-Gg: AYBFou2TiKNvscLcBFk8QrGbqRh2BYGawYzqFAL+coGdgbDfjp0yaKtCnsOlNEfPqr7
	dJbRCZweG9Nb8/17AIxz8HGAEJNghi9M/Yv06arh1EE3pyet/DolCC7sk+w2riJgt4Eg3EBdzcY
	d53lCJ73V+MfYMPMD4f4xiWaaHekgPBMpHVeJC5De10K79P40E3NvwpEXS1ybntW2vApRRYM5R8
	/DKfqRzQDZvXzeEsZOs6yVJxPsz4Adbe+qJ4zrSd4SS5XagU+rMed5Xe6vpsWXUC3LWLfCbp5lr
	ylqypbP0ZMLx4lqXu2e5wN7Pycq7AUZ/yn+N9a0BT4MmEFWBV5CS5vdRhYnBE60hx6l+zp3GyqH
	72z8Umd5CnILIPDYDx7jmCcJ4OaC9WD/UMhOoouJjsr73zjvAYadEeu0Do1ADnSgVJl9w7MO33v
	MK5cWH9eZvYhhBRmY6bvAmPrmIUPDuTd/qO5LbwqCvYNL2IidFvQh3plqtb+Hf6nM7JNucQSukB
	A==
X-Received: by 2002:ac8:5c86:0:b0:530:f3bd:d5a3 with SMTP id d75a77b69052e-532db83184emr24042351cf.22.1790042302910;
        Mon, 21 Sep 2026 18:58:22 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e199495esm1143511cf.30.2026.09.21.18.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:22 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 09/11] arm64: dts: qcom: pm660l: add analog audio codec
Date: Mon, 21 Sep 2026 21:57:59 -0400
Message-ID: <20260922015801.32373-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..5b406b83043c 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
+		pm660l_codec: audio-codec@f000 {
+			compatible = "qcom,pm660l-wcd-analog-codec",
+				     "qcom,pm8953-wcd-analog-codec";
+			reg = <0xf000>;
+			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x1 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x2 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x3 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x4 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x5 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x6 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x7 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x0 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x1 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x2 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x3 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x4 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x5 IRQ_TYPE_NONE>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			qcom,hphl-jack-type-normally-open;
+			qcom,gnd-jack-type-normally-open;
+			qcom,micbias2-ext-cap;
+			sound-name-prefix = "Analog";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.55.0

