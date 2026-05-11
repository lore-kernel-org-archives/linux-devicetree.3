Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6643A2566
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503501; cv=none; b=fdnyprygXe7/kOU6eqpFnI1zhLgp1E43qOZDUD9eFoazCej6PZ8RXvGvVnIkkrpR3tfXgswGs/521fWq1DtcNzYwfrwm0+uo2c/KipS8oZkEEcR0+qAhkiJ3/DEs4UZOYlpfSyFudsmKx/p3Y65XLyNfxUlBw9K9ZzSPAS9JdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503501; c=relaxed/simple;
	bh=nfUlgRiZuBNEE478C2TaHpdYARSv0jZSyoCpVTzZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQwCIisFG9BmnKYuj2DEP3KszsO67d/KIaAq/YIdT1mGzR4A//MfqChTO13EFFN94RDKJrzL9ZKNNQEpAEjFrEnxQIQpaVysj653CC3ZuaSmOryxfG8KuNoiWmLZlha2YDxRN/alVQCmJTjaqtBbqOLbBCnSkr0mnVTbSKUhYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMOvHK4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChEflrma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMOvHK4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChEflrma"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BCamN0775035
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=; b=FMOvHK4/0ofVaVTE
	J5bZOq7q3sE7VFS56VHHk8TPB3J1eqCL1+MMojdm63XbNb6wPhiDFCZDSpkyhg6t
	c6Y5a8Kzv1nO4NgSEldeZbiQWfIc/Uwq10a4AoFatfuHg9vCicQ9WI0IGFeAkiiY
	LZv6l+vFzAfCd6uJi/jao0lda7AS9dbX8RgfFFmDrgQzda0pNq/EhNkcivfj+Fg8
	zNsnTuoigbTrXJk5QI3KlNPr+SIl4gAMww+rE8DSUDif9CplsJ7kBoQGEwjDSQgV
	/WG4PRWGC7611I8qF4EDoxsup6NTUagzdtRhlJKkBFH5cDt0rZE2yQW+s3tQR53i
	n/7WkA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32h89h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:44:59 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bf14e33f72so61922847b3.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503498; x=1779108298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=ChEflrmarreYSqMVgF/35qw1FvLa15QVxsakNVMNaE/Pq8WUEtrNNorU2aonZanJgV
         NR+AxQziAI03iXRymmVQZHkl8eorzlMrNrlfnMFgxY6SQBJkKrp4+h2xO3H4pzlSrgyZ
         KiaXigwbDMGFdrZ1nfBuPMSVc9wx94ivf6hNT2eOGG2/rYUSpjal3b1vkjSUxA+2UFaR
         whX4BKUSM3o5+a9+kODFu/wNruXfSMeQ7MUisKsWlbqSsXKFsspUhvCIZn9BMym1Rgeu
         UO6eB2UXF9SY9jUMaAG82UvMc9PdA9LyeOZIsKiOIgMKGLCUSIGs2E9CbNorFArBUKft
         kKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503498; x=1779108298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=i62D5fcgT6Z+twJGFdR5AOLPxcCGoju7b3aLlPOWQaYwiIs3h08QuX4u5plhXYxZ4e
         3rfWJ+ORSRqwITHUrUJufUem9F7SASN6LGI6oLOFBODQK+fZGhEk7smhN0izo9KpWgnJ
         MbaZH9BU1Z8ceOFINGV+3FVMNAo148ITgwjyVlp/8ne8u8YvufsSzysYEUDCU69lUf4B
         u8sOtsz34rSfGV4mepLppNU+fd7dqkjuCPAanuzVyWRIUDjrg2YBUXyc9kChRdSRXzy3
         J3oNuf5eslITWK/SHEfYhG1gqeMZ/Nns2cs/BdzOg8oY/0YOcshKt/JLaSPFLVuyLg7H
         dTLg==
X-Forwarded-Encrypted: i=1; AFNElJ+uhDka3qkP/SLNgVSifuF0rvZJC7vBub5Vy0/ZTmXcp45/L9NV73mGWdQh1MYaA77fwy68Rd0PLUAf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/3thJ97bBInhs9j6NxyqGpeNr39BjA5260FBK0OetN5nqDfUR
	4/urEGDZP03P/U1D8ZAnGKzbXzPc4gYsn1MESGBGq8ofL3dHOu7oy5YQe/MDIhJHSEtw1e7ffHv
	cVRU6A49+3Kos/nW3NU4ZgN3tPZ4sLI5seXap9xd0OfcSs0Q+i0+xEl4Ba5G5aVNi
X-Gm-Gg: Acq92OH5rILF/1qKjVZ71gys/YX9BDcV1ejo9p1ZnAQ7YaOKyHvFsgqC9jpPJA5KGS+
	+T8pubNC1GYRKWdAynuqb1XU2XG8UHjfu3KBj00z6z/VDwfcte7aoPFagcYXzRE++HXKUHlJ55z
	j9BZFcv+ny8lCvzhKzCu3DP1ZvKnCpP2dvr3ewQ+w15vSBJMgnxMfXxl5KZmBIizXIeLcP8OwnW
	vWWoyc10JUn9XHldVls6pjXg+xpmmuGY+tvVB6TmlZqid7wtIiumeJu9nG2FjfTR7DZQvqBx6lC
	Nwu/nAj8BbEWN/7yChYdkD9GJCVJTzNfgtw+s29nIv/W5orVVGIMRR4yLagaokv4pp5aW6a2T/a
	ZJjBipG8iH6paeTCOOT7y3u1hh+E0njbLpddINuV6z/Ij4Q4IoKX5gTj2Qed9gMnLCx3meVZRZv
	wV8QMyFfVSBLBkU6RtQgtCN/QbN7lgdi0hXA==
X-Received: by 2002:a05:690c:e72c:b0:7af:6075:4e0e with SMTP id 00721157ae682-7bfb9aa6ffemr113490877b3.35.1778503498471;
        Mon, 11 May 2026 05:44:58 -0700 (PDT)
X-Received: by 2002:a05:690c:e72c:b0:7af:6075:4e0e with SMTP id 00721157ae682-7bfb9aa6ffemr113490587b3.35.1778503498035;
        Mon, 11 May 2026 05:44:58 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:57 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:22 +0530
Subject: [PATCH v9 4/6] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-4-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=eCeG46QNcGH6Tou/jfnrUot8SRLcYov2KTKbb+oU9wQ=;
 b=0HSed/WiHQ7zpOBEPBiNGpSOHNmKQpL8HxpMlCo5AcFF5FH8pI56nLwQiaNKM2qcHQojCDmWQ
 nbFejxSKJJ4DMq0hmsEQE4CU27HMKF3rw/cfUVEvN2qZFBJXr1QDO70
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: mQL6xCNoJ8tTg37Y7bKpCfMYEZst_Pxy
X-Proofpoint-GUID: mQL6xCNoJ8tTg37Y7bKpCfMYEZst_Pxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX6ybSm9bLigmj
 PDU9HlxeMpsvIkyE+6YKyg69tSAI6EbjK2isgFic0/QkmPEf7e2QqeomTOKpXt4ilb4NZygew+n
 tvxBIL7gIKnZ2M4ZiUXpk1ipWmTRDalUixCX3vd42rG6LD2llx60yj93xUosU2CkhULIdKZKUVU
 Qf15Hp3hzfkXOjuAWvCQY3pJshdIu/SaKLrU9WVzA92fkgTxENeihnhjfWOpImsmnTDPEgsItor
 58Lgrkkt9XcLpfB/xXY/BHv4GegNO1T7GMX92eeEMBXz5waEreNdtzGKwMJWY/VZsO1Iptp+5BO
 DrbFt6009+gc5uQq6vNZH35DGTnN43wxVeHpiGWbU9fcA4Ba5BGKrP5buldxxHMW1joz4MNWWbp
 ddxFzrJ1KxWr7IEax67SF8/mwQEsth0iKdt4cl42SU2m6JU3A+rYvUJOtyU512HBRQ9/dcwP4KF
 aScH7C+hbyZJx8tBfow==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a01cf4b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575e..9602d65c8b3d 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1523,6 +1533,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

