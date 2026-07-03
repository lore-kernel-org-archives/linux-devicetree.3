Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF73546C4
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110994; cv=none; b=tZTVrtWlWJ8qXHOVeO4zvi42DrCPNOMXFG1Jhn2hf3Lceawa6LOXG0XCV5enXrseQvpW16wq0NH88Khbqdb7QFUk3PDXVegkdFVa7oeiVyDrmvjeJMBek42LmbJ0heCeYlxZyNHwLFarLNIOU2mFRkoXMYasLmEehEzKZ2dhobA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110994; c=relaxed/simple;
	bh=e7loczfllL/pumoewaOymYiokr/D/1bSGb//+r4vM0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oy6J9ymq3sUyicjpZkwUKR9sY+H4jqzJROzLUsAEfWHwZl1O6YI7Swb//5qs5R7ZerdCvvIG8Xovjty2Mi0XpLPspuAOziEvJh2CKttXcPU6gUGnuchZ+gt2rTyyIoaT1rwo90okPSxV+GwuOZTH+KMoHdUtfdoFWB/j7lC1KhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dveUoURl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+5+GVhA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dveUoURl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+5+GVhA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZwT972986
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=; b=dveUoURlYPAM5nVI
	5PErai44qS1UMMuNlvsWX+1GcwixZE5ClKW2MidRZEDujcUNX5k1DLccb/+8ixjm
	4Knjeh7HodckZpt8JkQIn+WOG97zt171QbUAn3uQjZ0fTK1QZ6wE26QuxLFBRoTx
	ZHL0QxBC1J7naXn7Xq7c6EuQpm1tmTI4BzNVDIUAhPpKDm146kTkisdrRoA2rGFs
	W/ziGpTcnX/Tovv8XR800cxXvTp38Kp7ZV8ZxcPOdht8VlvHqEWKAmpD4mr94jyJ
	v5fAUBikl/SyskA6uCGhGVo/qUsn8GeKN9XMFPP4zcMmUHMQbHFMhrA1F1F15fZH
	gHRppg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03a3b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:36:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1462219a91.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110988; x=1783715788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=;
        b=N+5+GVhAxqNGFoVlzc9hWjx1YfQG9t9+3CNMy14Gt0+26635Q3eE63hvyWwW2Rf+yy
         yBIpCcAPDkNakMiYmji8S6H1YyV68zMsRBWkYB94vUtrYDVrPADfBeEWPi3f9l/Gakiq
         Oa2QbT+6ceJlEahXqWfNKYxrllsBLQxBvxIuo1n5yXoyPhyTJxJII7oryJASLMQfEXgY
         G9yJ1pNvm2SJU63g0l76/143HK5qj7alrNMvMJrUfnPBg5ZR5e3SjFA5iiGh+KNhfJ8p
         WLU5n5UgwI/i4THfDHFelXni6Qgxleq0m+GULbN97y5I9r6YQ/iZyvNUfS+wHAhhIvdx
         NZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110988; x=1783715788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=;
        b=Me7qVabxJDrJdKOyJnumr4MDO6gfsb2MM25sWJkSMkFB5ths29Rc1JHW80koVm4Mm/
         MsxYsA4Bmz4xEU6AK7l4jWTprGcYAzsIDWLWfrHQkyXNi47CBY9vqXmK8MipQad6h807
         C0/bU/bpMUVLkYnEjq2JZhP8Gos2q+aqC2wgJjNx4qjnVXhX7M2dNwUK6Zcwev7N/1JU
         cGvolxTr8PoiUYOXYwm5SrVhY+Roeni8RNugKxSUcFUbT8eC+Vr738drVPRZUHZdAJWh
         NBiAP48a6ZWaXLuAI9YgfHUdgOTIqNAyHp1PPstDIMKi5MH623Pz32sMF7zLSiPAK8JZ
         UTLg==
X-Forwarded-Encrypted: i=1; AHgh+RoOWHi1AzaYCfrp45kh6Vsj3iHNHAm2J7mkbYUtw9daQ/xHMjCsh6FlA0PBL7/TIxTmdqYftLGUG3dr@vger.kernel.org
X-Gm-Message-State: AOJu0YzYvwg+9/TD9sgzN/D1wTSfPahp6dx91ElItSo4qRgOEAcxgsO+
	R4b9BREgSllm9igFdzUklCUoQdVa1KicNA6Zp9/BqMXrWLRfYILC9qZjR8FpV+SO6CQJvQ5XlwV
	JifCIlbeOX/tenKQxSoHZ2aMohfXOcg8x1D2XMHMKq2ZrcKYILC0Y5TU8RyYPVKj7hW49nQ1Z
X-Gm-Gg: AfdE7cnvn5IoCORQpeDRPQBbAL7OdUHkg/qvEDipBV+ole4svWoJSDUXdHw4jBVZraE
	fY+QFF56F8lt+wUHykBWQ75/B5eR8Fy5/ukqdyrMyS5EH+JwxKQR5B02gX/rIo4aqFZJHxmLk0f
	FPA1lav7KgrcqH2dgruFqRfJLtH96FjIK3xfsyKfhpiAF8xf/HDWbaUo1g4evoluMzfYVEAq1IH
	3HSGMPbOwjpFv3MRhLdPkjGwVo2EBK8faFsST5p+sbyJLtVvoiocC5CiT+7nAI03nIgOT4DH7lZ
	qy77ugburHT4kwssRYPrLqR9HGJo+ZiGqxyCjTqMGJjqs2PxdEEkiXT1HQoTdIA3VLTY0t2o8cF
	8FomCS15McSsnwHvIVxCXr6yWZP3HuMQiNp4=
X-Received: by 2002:a17:90b:51:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-382808b43cemr879976a91.8.1783110988394;
        Fri, 03 Jul 2026 13:36:28 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-382808b43cemr879934a91.8.1783110987939;
        Fri, 03 Jul 2026 13:36:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:34 +0530
Subject: [PATCH v4 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-8-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=gfyhHgOTYf7Emr9cLrvSN0kypJSlIEIIltSML9/b06g=;
 b=K/LDEKPGoZfUeH0tbE74ajfDKOByD2ZHrcPWd7L5t+EUoogX2zIW7VdSETU2ARUATIH0akAMR
 AAKcD2XotdRCPLTyDSnzTY7LWtZbQ9VE2nior29pU513KlghswTzcfr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX73JibfuMD5nX
 d/CJonxcYfrOP6ByumerhfgmiB6q3W1xIgM++O3RZ4QgyCQZZM6qTrHrPTb2LnhsHhXwczH0wS8
 eXZsVhwQa64Dh7owTNqmIvt9BXMQQts=
X-Proofpoint-GUID: DPfi80iZGdMzLoHtz3oPEAS4RVe8nFPh
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a481d4d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JW4bpjJLMT2bmMDKeKQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX01OlTDGoBp6C
 WAtz3ZnPD8s1lA7dwwXC4sD5IiTgs2zJBQLUWqi/FkD+Y27ofIobscEQKbGx+WgJbqG+I4lf5Xk
 f8p7Y/6AvoCZ/ptqNGAN5/HKQf4EvAXb5bkXoVZdraQp0FiEikpK8P6GablDnwiR+wFXvwERZIs
 +yKRVuXfTFDkJ/0hFgzu+c3IQRyGShE0beDM2DCYDZrIz70PPMeNzSNwxZ84oGiXxCE1hawIKYp
 Xq/bmHHuyo3i9Qpi3P5Y5hBEVSw2NhmtC1BeJjqzJE7bMrvrwvnCp1AE84fcvGdxTMFQy+F3VKV
 6Ws6y7wYXgAJEXh70KP/lD0iYleKckhSZmXVTxbWuuhobHUC7xymVqo91wtf0yaTfxH4Z2/SLru
 U4hZYNMksPR7/VBSxF7asXfpt3wvlt2s4T0cj9ZQy7EY/2CtQTaGW1q6fg6xDr8VEefWUwgtHyR
 yae1rmJ7RwvOREZ6rTw==
X-Proofpoint-ORIG-GUID: DPfi80iZGdMzLoHtz3oPEAS4RVe8nFPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index ccf8f856e994..a95daed1581f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -50,6 +50,14 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.54.0

