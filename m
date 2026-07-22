Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D130BF69
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730263; cv=none; b=JwXOVjrhy6mACee44S9YNvmHZ3ioxMxnvIbqylcoSMUwKVI41dFVz4b1EuSRRYMveZD3JnQRDmmhGntVaw4/Dbe/JqE9FieH1IbHWxnswrhJC+mqID1nqNmrgPXBVPpyrFmVwuLkxw9I0iq2owqtQoCw6xsXFMsULLtI/OoJRqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730263; c=relaxed/simple;
	bh=msLLJpdS86JHzrTSghXYE7dw6l77PMuZLyC7jK7B4zM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ctolf2skaQ7ih8KDG4QZQXrerGIhzeHXqmEs9M2MR2gt1iAgQOps8kwwcWSFZEogIrqji+/Nq8ApYYARy99u4/HGtbyhDO6iviYZUdKAuQMPVABWMD5afG7t3FVORmkPOwkmxbP/11b4kNc43bDcT9EHIkCIvK8DSOhYu70+J1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NazdrrMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgSJTld2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NazdrrMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgSJTld2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWWOO1027179
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gTRhHORNWxs
	ufA7E03VlNloCmNfFPOWa2NI5BsjhHD4=; b=NazdrrMnZ/MPK7pcuVauKO2/bGa
	1cSuJIoqq9JGlWA6zwPR5IE0OjDQ1Y0+xAZRHbXvL+cX3+cxMit41yVOhJmkTT6d
	/NGghV1KDvpQqh7zRX8F4EGSptVBUXgyNXlKYUx5O5xhR4Ldis4UMLxbJnImF6D/
	Vv0vOvYWI8mYf++gwmhmkF/Jnbwm3OgOW8YWWaZlSslTUJpSd6PyDGT5c4al81F5
	7tBZyxwpZPdEWx0uNm0LPRK/HTlqYfr5Viz9MbP3XJDMDLB0pYH21eKJ2Bdcaf0d
	AO083+w/MfN6+gKxiUcK9AjQz5Yv4sUrYvqa5ay8Gz8stvB/cpTNYKnFcQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt799f7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so255547025ad.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730258; x=1785335058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTRhHORNWxsufA7E03VlNloCmNfFPOWa2NI5BsjhHD4=;
        b=YgSJTld21lHqycT7M5tnz2MyT2Xrk5MwCH/DnkNZKNV4agK3ACDhvrLOLJuN8mHjnz
         jUSg1RNk0oE069rwcwKjWu3U8pN0YXZIKXaly8YaE5DshPTx9Cd/COmROFQLoaMuf/1U
         2nQ/t6ecvmZPyNR2+Rq7AsCNm9UNOZQNVatlYSuqxwd0uuxyY+6hieGANnrbUpKh1KKK
         EPT0qDi7Nu2+/Gus0JeaFiPKy+Jbl5BHSADon26FY2KGUyDgTmCRFtkhjz7Wm9js9NYm
         j3nc/SDnmlS8MpW6cYV09pXfHdWGqL3OjuCpOHiXy/LoPxKP8L6+MTr9T7FKUCE6j8sO
         Go8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730258; x=1785335058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTRhHORNWxsufA7E03VlNloCmNfFPOWa2NI5BsjhHD4=;
        b=YKnfxXq5I6OlKzngxB0E+6kYb4M/q5/N4f8K589B11APcyOr0Pt32rFCR++8GzBRoh
         Q2FC1eDghg11eufgZvMg8sGwHS8cv78Tz85czRUzYFF+Hrcovh7dAsuuEAeMJihvhW3C
         /koq1KJOoPvlL+xvc00KEwc+VFEqtedhPgn1D82wD8vJ99VQgwJoFnQekR83BZuR6mJc
         +BVMSE/okMQRZXD2ConVH9RPvSDIWSyvJi+VD8HF0NidSHkSUvn4+NY5zST/l9K5OaKB
         gRc9WToUj7UbCO7CZfpTgZEyZJczojdQPOGDqL1oKoftgYIl37YWZsg72UJLVKQcYpUH
         e06g==
X-Forwarded-Encrypted: i=1; AHgh+RqVYOXAzy0/7laoLgDlp1KPiUOS8kFEWVH5Lp+h4ZeGcgErnPAlNW8oXfOf/3AzybopIlT6FrJ5R3Qn@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJ522KlRPOlF/ZCnHhKciKcv0ylW6xgYJRddkwa2unf+4t/ma
	bdoxNernhdxsyQ9xfP8dYxrpZOfX/Ew/TT7iOfpIf/F+HdK4gFhGmyNqV4XZCkcnKEjY7AQULfp
	Sq+haKy69H1KZ/l+VLa0tD3YjCdWN7gnjJ/NA+eGkGlYeC0D1BwTPnyliUByjg+NL
X-Gm-Gg: AR+sD1322pbEiCcyWsNsOkALhFDXp28f/be47C+LT16ModKcE4VZAgeOIdwOUy6ahJz
	z+8CvqQHQmh1nwgYsOp/BXJb6n6OV33KeOq/ibnkxYFKaNC3Xfs5/H/yrtLpXK1EKR/Caqfoa2k
	IgSHUGCe7wGcRs8IUKjoL8TZdfr8aQUW2VbLp/PmJjYf/kBCQ3TbUgbC39GJKYbhKQ7/ReNIrjg
	N5jBAWx3XoSSiig9vRo2i4mhZVFloYw80YOMptmxhkFi6Kwsa5ZD1uNPpbvteaufouj2fHYEbtJ
	hgBO8qHcuMAF1Sg89CQKHbC/KuVQ2KEhLqfrPvNfCv4usRxZMzQGYoblEv5O+rSExh8kV/qDnRS
	7q0dz6zTbYVZAtM7ESQIxJIwaL1o=
X-Received: by 2002:a05:6a21:a8b:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c3ad7a88b9mr26335561637.28.1784730258323;
        Wed, 22 Jul 2026 07:24:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c3ad7a88b9mr26335524637.28.1784730257892;
        Wed, 22 Jul 2026 07:24:17 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm11231211eec.10.2026.07.22.07.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:24:17 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V4 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Date: Wed, 22 Jul 2026 19:53:42 +0530
Message-Id: <20260722142342.990384-5-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60d293 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BFOuVXoWwltGLQr-ouQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: rbMMQu0W_EfxiRnnsNnuIznaf0rp8DYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfX58bGbAejIeJl
 fndnHUogYYEclucKh56zj3Cycev31i9PX4x7K8wF51UaEbQdeZD9Hsbj9ee/NujE1XoosO7ev3Q
 G3i7mOrKnQcY8EzLytbmmjV4ImWZXPE0OHc950J2TZ0g4JRrVNwC39h5uqMoqiOpzlvgWBs5vAG
 B0TChhUfcTiYbGZxJvkB46jcXb9XQ0eXDLqn+vbN5CDgzW9NP/skZULcW2Dp+zNmuBedgh7mlAA
 21rCTFut3lVhbfqvyKJrBy4/tRKPYWXxXN2+ph7byT8cDoN9hMYOyQtZri9OHxhq5BveDnLEkK/
 6Rjg9Fiu8Mh24vS8fhZ+T1e9VySzGVLzv+m7oOp9moNxOiQSboUOwjQm//bH9Z+vraJ6LX+rdIO
 f0m+S3CuRVsmVwugkiJlfX08NKR3gNySis+Nx9OnAkfzJLnfhiKeJgRBJuVKgYtouoiw73axBpm
 M2dw3/D3G+GmIy0K24w==
X-Proofpoint-GUID: rbMMQu0W_EfxiRnnsNnuIznaf0rp8DYU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfX0p89zRx7JUzN
 8Gf0ZQ4a7K8txNdpTPvD/Xs3CPQVk1QVPpQiH7Mwk/Fi1yWJ9dXbryiF9FbkxU44A6jBs5QKqir
 h6b1kT8uhvbzRWOmrC2zftxwI3ugfX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220141

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
regulators and gpio-based card detection for the platform.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2e41b4ec83a5..9251019fd31f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -905,6 +905,22 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9b_e0_2p9>;
+	vqmmc-supply = <&vreg_l2b_e0_2p9>;
+
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 221 GPIO_ACTIVE_LOW>;
+
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
@@ -1090,6 +1106,13 @@ wake-n-pins {
 		};
 	};
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
-- 
2.34.1

