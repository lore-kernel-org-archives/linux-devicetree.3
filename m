Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21A3A3E95
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503508; cv=none; b=WYFiFcyRlFBRGRpNTeavq1+Fl3D7cLLlbYTFWcHqa+NOn97FHWzdA5Gsl8TEG2a5IgTfTqgfHt6vFvCkbrhPrz9gpW2Y0WxlFfTsUqRhipeMb+eIC0mdJjDLWVyVG8I/GFLbZgSHWxJvoRX8zc35Zw2XXGntG5GLDvyrka3rf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503508; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZNuWiNHTkmCPsWhfH7bbITkP/KVZboarm3yjzJ9GQ6z2x5DTWBMThiiwniAw9PqlnTRc59A4UKBJfalxs2COTdE7BqL7nvrm8VN2GgDGcJEcREdPVvtzfvBpVtgPQyX2q10Ijpoa81sA0uorp44W57XAk3ZgD/g8jEqiAtMBnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDjNFKz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmTlvH2w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDjNFKz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmTlvH2w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A4n11258479
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=nDjNFKz4YrY7G8/d
	t6ePcwklcFqSiNS6kr14CWfLVkcWk1QQj1PN43Qnc+bV5CIwtVPBDzt3e0vKIDs9
	/79dsIETCHCNYHZREPwkxNPGwJb+vhMpzgr1/KuBLUG10VEk73pmroNg3o4jnZ4i
	TpBe5OaNvAM1XnQlqmIkmNl+umd51z/jdhU0KYQVEQgtoRj2H4LI+rM/qf5uc6/3
	3AFfsiZ62LgqLVU/q0lFYYXxPZQ6WlU8uiwLJVIOhWNwQy/SNZ6PkUG3JQgawIQw
	z/vip9IVPPhSGMX2OZ00ewXYpD2GtEI8pTAB+9ZC2dwTpjJIg2YZtjYGhnboTKeM
	cGZXdg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag215s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:45:06 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7c027fb7a62so18239507b3.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503505; x=1779108305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=YmTlvH2wH7VREZS5xFr/F4oBULbnNZQB4WW+jnj5hG0Xhk1SD8wuQ+9nDrVxrdTyvJ
         E0yGb5mh4VQOcWK8mhQIvr5jr+FOfjml1LQarW70yWGuzhTzJM1QfcAvJOVfL67O1LB+
         bOEcMUPups4ZfnHjL3iYRmskc/j8BgBBXS3Dnzyhl7ejeNR8VTNv18a57zK7avabp6JG
         PaadSS0+X3SNSp6X2EgUCKtJJdwAghI1a9TkH3ZM/cfnACZcVGE/tz71eT/av629Tal3
         fRlm7RmC5D54OBZX002aQJ9OFaM+zxkAb2XwhS7hOc3sL7dEQiYj7FB6Tugo69bZNsQf
         b9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503505; x=1779108305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=Q5rbHKcaOi4GE1kBKsOnwV0eIewN3fGYqdTS1nWnq8HgbkbvYYLXbkeIzOYZ7O6baE
         72tAypsDm5F5xOwllzYSkkDQr8ZdkbY9GzXM+PQlPUuUZIEmt4h6zb7vYzOr4Ah0J8BQ
         bZVzuD9D7fqVd0nr9AI6hd2QDAKqGYhOBD1jIz1BwZtYC14l3M4hrJlJrw0pRBsYJ6Mq
         m8Pk7bDJuNvSKkXBz1mTXbSdUey3d6kZspikSsqmR847f121Yrq0Vu+zz6cz6v8KLwTn
         FHptAvss9nGccW7Hh2nqlvTu82pE8CxcA1IK19TZl2Z4BohPuOZWiyuN8nPUn746Mifi
         uenw==
X-Forwarded-Encrypted: i=1; AFNElJ+cyrcERfKPZSs6/3giipArWtiIFkVKtt3DWmlcJKApFJic+hV4hnOPN3aSfmj8fpyWlWVOdAMryMaD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28Vt068vfk1gb5Gok7xDtR6jIJUWnvS9IP4jgb+VxlUMsQ0xc
	iAI5xisliol77halaq8maa+EQe0xmv3/PNgVlugvYA4aEOus1Ms8jO/h/Us4tZMM4+CY3vqN3Ml
	Sy6eAHFPIFSCm3G+5P33oKHS/6OytglCaevH8dw0JQuMCSI+BhmqSYUYRS0Zi7sIB
X-Gm-Gg: Acq92OH2gTDS68DDGD85/Um5J4GWEdKxBm3/wnH00xGIk2VTnbO8MwWhblOX6ayubHu
	OEcvG0iZ4sEZ4dUzOMZ5lsQW2nYRHxGJIkk8mr69HDwLSqQh9SyxIVZdzls9seX1V5eA+UFe97R
	G6HdFuY4eahM8u3Hq+WfI2dLig7JG9njONFP2tkNWomKQcQcTKgM6yRz1UoDIjs5nhIw4Aw8KDL
	roIDtCRPRpLekKIQ9hxL4U5KM1jtQZOoIGQUgYAopSw50a3mS0yFCDTlJrRN10tU8lf0fxhCGOU
	NDo5DoQWjqNtALrmk+HVuFDCFAL1IG9YyUCCcM8XKADItNFYw9QpTR45Oq5RfjlCiX+Sgsg6Bwo
	Mmw9d9DRlTTm9l9Gs/hZx6zcGdSZGpOeafXMmF8m0ydfmKtGNIZLZI+yF/ASrXbWFEqW7QIWOGw
	319FooX5wbAu3Da1Nj36k1ZtJz/D48ZVEZACuSGDZU8JvP
X-Received: by 2002:a05:690c:8d08:b0:7ba:fb15:3293 with SMTP id 00721157ae682-7bdf5dc7e18mr223304657b3.18.1778503505447;
        Mon, 11 May 2026 05:45:05 -0700 (PDT)
X-Received: by 2002:a05:690c:8d08:b0:7ba:fb15:3293 with SMTP id 00721157ae682-7bdf5dc7e18mr223304327b3.18.1778503504929;
        Mon, 11 May 2026 05:45:04 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:45:04 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:23 +0530
Subject: [PATCH v9 5/6] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-5-e5437c39b7f8@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=GmUcUV5QNEdwyQE3ykhFFlHYBB28J6Z+H/Hs+RW1suQ2uI3/v1jxMef+f7BvzLpuKo8M6wlhD
 RWcu87i0AO2DW2jN3d9AGlf7LKOgBebW3fJtMAk6bVtXUo1mSg4T03v
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: GCvr8ha0zSRkAKPaxPDk-Ar3raG5VQIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX5Ig5BRLTTu4c
 yeF5w/o6cqxz0aTVhIR40NwX1puVbCIujFBtTwHXPY53AB1zx6YuZWphSzO+n6fvKCHpkb9Sf3D
 6rzBA6F77KimphXFdYGw+yDvuIMD8O5EK5b9BU8JoGMm8922OUIbCT0QeyzguxZvLWoqmkGrL8H
 BzDf74CLNRX1RvIVEWhmw6wsk/0faPutr3aKbabQ0JLlpoZRZm7IbJ5yruhPnYs3W8NHUrw7lgz
 OHSYHUryVPgExu1rDftLt6Qprrif6Lx8KOplZ/PlI5aDfysMnFM9iVrwWNkh4FZTvtzoQM4igDW
 7JEv/bNkMIQoSj2i0pmnpXo1B9nDnD4Tz4FDxkr7OSgroQB3dMmd4MmEDm6suFkknPxSwliqDdj
 AjX45MsbhYQUD9dsozY04qedzwKFmZ1QBMJiuegRN0TE8+fFQpDiWtYZbuHSn7DmUFtoaCvEsfX
 MvT93FJ4B5E3ZM9m8hA==
X-Proofpoint-GUID: GCvr8ha0zSRkAKPaxPDk-Ar3raG5VQIW
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01cf52 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
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

