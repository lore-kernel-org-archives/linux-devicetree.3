Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4609C3B5307
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284344; cv=none; b=rd5MlcXlVOJtE3IiErHSUAM3Cik0pAA1yUWeTC0ZKoZ5NZdTa8U6YCp5d/DtM1y8xFxjz2qVEX1kyvZr8nsmIlSkpvS+PWaMIlQgZmQMF/7WxnjvemENy0KmUihluaPY5c6CdmN+v7J04cim3KPYGPRGGFT1cOzLMam0omSwkH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284344; c=relaxed/simple;
	bh=n3Dj9ex9DeD+L+lQKKQOUzTFyrR50tsgxLyyinSeV2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2H5zwZnDDKAOLfxBOYRMHBjacvXC59kyyfc5H13V8VhicJwUIqpmNYhdRRxuAHGiv6iVRRC9pttxmWAXqtVP1D26LA3OoEAwVNeC606AehvyJOGb16JJxKWf+3OqG38Wgtph901ijUJ+OABRMMeIjpnJCDnYWCvs5jgLCqUmlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuycH58P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiOsi7hO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuycH58P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiOsi7hO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3mlL3123484
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=; b=AuycH58Pn7nfM35v
	HgR9QbZ4RIZH4mTeAbsPZ3WI6dt3hML2aAfsz7Y6Q4nNXbdzYqobutZiqljTUW3y
	RixshYN8knxww5P9No4RLpq0j5OiY8cS9S7qGS1O1xlidbtT8Sz2Os9m6YJWIqKB
	QlQKLBXeU0h5N6VCDpNRWR2MZxhOl5Vb9hXNq2kcfZC3Ve+FoyxvCye3o4B5haBm
	KFGjRgJXFZYtqqF0inqMnGuPzTUyrrd0St9WeLSr5Rah0wIxV9FFZqP8BIVBdOav
	wcDNEzTJKLWZ2lkDiMR1uEYU6U0Yx8g8wFYbddqxcS2KXOpPfSeIIoAxZ2Jokr66
	zbD6Yw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgg0ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso6743179b3a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284342; x=1777889142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=YiOsi7hOdUvlVBPqk/6PK1JOFfKdepVVj1vAbabkL7zS7e0ZO/d/BMm24egQkxe5BO
         qmFTM3jJtf7k27tAeq7gJAMEpGmggNLIeLiL1Xt/hCsuLiJ7WHkdTrGrzRJG9KplYpmJ
         qPArt8UTUjG0Kui9aIgfBXwTPfZOUPO2fmPQHZA6vFZnmVhlmkYLLH03pRgrI53M+LTf
         2eWx4CVZiQw5jkOwMKKXSuN9eEwoeVWr+AlD+k3+hzh19/o3rmb798YA9bFUCXvj4Y4l
         y9/j59UwOcwVeElvOGLEtE8vIlaTQnUgZT/hAxVP4T+LQUBifHq69AKz5hHassjgXzdl
         JA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284342; x=1777889142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=SPbG5EBF3i3rFbN1QELGYbQF20naGq6x8LMjFzDVwgQPMvHHT4N+y42uIOfXcvMif2
         PBrH4JHsqWbXm9Le/zejUGVHo+trT3ouSIejbtmaFSDz5GarC9+9hZXKvD/Lnltt6srN
         B3IhsRwIbnb7/cgJ6rgNcp225xYizIpFthItvQipBiHmFqstIhtEfjacHpBy021qm2V4
         0DHvC8Vfk5aSt3Xh1bh51ctBSqT0AycJ6olH1IRf0widT22X/0Bl0NzAEwfy7VbT4tl9
         8VtcBCaKSNc5Mk9HQH0hNTZ0XQDx76oHWOMGMOGr6hN9QWg83hR5d1nNrERUKa2ovCuQ
         o4nA==
X-Forwarded-Encrypted: i=1; AFNElJ84A8DBfaL3/oUOyKd6+5HQt9jKXhXYV4RLnLF3aXAGkDuuNUl1X70RMYf2xNNLFog5qDn2OfNgIO5f@vger.kernel.org
X-Gm-Message-State: AOJu0YxTXrnHH0R/EfTUUfIW+S8lX+omhOI45TQ7F4f/Gx382tAvHfCy
	EnIvlRm8vhGk6mavhVEwz37L3YQl4H0FYAVjm/6WPdko5+yBFKz99t/n9ABh0h7RCaWwd2BK5xS
	huxGf24Y7rbFyrOl8w6+WVspFezrhNt/kav7sq9n6hERVHLqOiPUpUSoPrHQpzlDW
X-Gm-Gg: AeBDiet2tNOjLu3Rmj6Wi9GbIidmWRkzNqhs17wlT2joqbq95GYp2hRn882Ko+NoApY
	N6ik6f6ziX2zUQsQJxsVdSXLR36gxvDkv+DjNO4h3ZD340AEDX3tBDr4qHQHgPMmHeDbGv+3jt2
	eWr5SoTDji2nidXrRsEou2uS365GwRV/fcEnFNCVL71hWZItUvxRG7VIW4zwvfybdMRKzQUqstf
	gpzEqodrGi3z9qYVmo5PE2E3BDfXL8droErz6GIpfLxp89j6/2iQCzyZ94ALfPXXvgY+906khaH
	KPdgn/jdbw4/9AegwWxfeEXRTLZCvOq8SVQxkuoYOmzv6PYqN1LVKBk40I8+7+eO1u7upwUvb4+
	q7DYDrhWNeV1+UpAcx9NpsoqsKGjTeLcoX0aT6Y7IWkyJE5Qwuf8gNWEdg7sSOshEgI+gwrzjCN
	d1PJmv+BX7ZElqIuZ2xh3tk+2nyPft+W9MeS8ub1tihLCf
X-Received: by 2002:a05:6a00:3e07:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82f8c919150mr43912412b3a.46.1777284341793;
        Mon, 27 Apr 2026 03:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e07:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82f8c919150mr43912352b3a.46.1777284340843;
        Mon, 27 Apr 2026 03:05:40 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:40 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:54 +0530
Subject: [PATCH v8 3/6] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-3-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1650;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=3BLnT5OTOT0qEyowVKSfm/R3DNxg4MouTyG+K4wg5xE=;
 b=Hlbo3xq6s5a6jr3USS+Pcqn+F0iHwlc9CIYWbC2511TyN1Y1eaq6TwYcu+raC6WosoM7rMxuU
 zYss128YWnKAfipuhrCrQmJjeOKmKfnQOH+rmrv9oeWf3jsSnIJATaN
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNiBTYWx0ZWRfX3LWfoMZ7j2qm
 /kmlxjL5iwSxh15vh7imp+R6XOvwbaGqahH+Bde37dTvsFvgH5578cvyIOibzoeCx6n1aBGjZut
 03/m+Vxe6WXV9aKIKpL6a/xVG7Ztv1HEqd9dfDsDDifdvBOsL1q6ch8uMe9AQc90kciDcEaKPfH
 eEYd3ORSbXfYxCy7OqdLg1FQrVfIcbWGNUdZRSeqT/DrzDbRbft70QjCNTMOXRYhUv5G1J3AhgN
 2mXnr2A8oEsbWMLTd+w/CbTpteh93kluRBhd0jWplrIGIhk2e5dHxD1E+T/un/GcmbM3jgE1UL2
 st87TP2nARn8aPW7QT2rdRUuqvSHp1+hBLiPu1Jk+2dAza7713SZmDdOhG8Ip1sVs2vInHzgjTL
 kXrkZuqBThupiUfYQXAW/JMW5xf7ZeI/giDVQrI0bxwpkdQorrZtrcg66M4wbi5OFScwzw8ENcL
 Q5OxoTP6KPAnizWpArQ==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef34f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=h-fhkJo0eXD2C244oGgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NLaFKNtn9DE8f04QFvVDoxakTZDjHs7V
X-Proofpoint-ORIG-GUID: NLaFKNtn9DE8f04QFvVDoxakTZDjHs7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270106

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..8f684f3402ba 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -433,6 +433,22 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -565,6 +581,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.34.1

