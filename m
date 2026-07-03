Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425634B662
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111000; cv=none; b=P8B3AnpZ/+oTxZPhhEomYcF+uzRerkPwxh8jqZq4pxoy8F1/Pf37L8YdGj61p3rpc8FDtG1d37OurDpwCUX2MZUc+aLgNNfevmdEoIn5O2rO1fMj8vQsvLkFulqDQp9HEcrJY6i0mTXVg4y8ktIWmL0M8DJMRV3VNI14vffFsbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111000; c=relaxed/simple;
	bh=wPn9MTeoeQW85931rm6TioLDv62uQ6M+ZoxoWxSWh3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFAIUBJohH3lEZ/L3T3jas4ClVP4tka3t0zCpjczo2wJgFxcx7FmRSWtJjBLWJqeYVY/xhS9NLiSOsfVZCaCOpj+ZZT+mLsAaCINfkWGFaWIWMgZokt0tmrpzFEZl3b+yN6UM2NbDu9tz8bNyRwFKt6e4MsCNz9G0eZpjunZaIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzQAeyrU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqHDCI78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzQAeyrU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqHDCI78"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPYQM837841
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=; b=GzQAeyrUtLWL/Att
	0BQGtN1jrzTo3PMxpYmNXjkP0hrCClkfQewZAXWIWWxjar8OD51Bd38B9gAe8W1z
	D9WqjaVyv3dEC1uk71Izsejfrma03HUbRJO8L3bUJwdJeJibdKzRV/Ra5BDO9IWs
	uXQKF8q1SKTXb/qI+Hz3JKMCpccz2ytTkp1c4SfdiLAJ+jaV5EMaBNg+Jxc4LtyA
	mbQiF85aF0mcSqVdK780tKeDjeK45dd8yvIN3QTb1wsm22g+OHDC73Kfy7ZCoRmF
	+dOU+6OBoHeh0ETKIAcxURhiNX2mqDqloLlkSr+myMny3zHBLPzPBegUcC3xzVAp
	/dImjA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytr24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:36:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88d7a75507so1489840a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110997; x=1783715797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=;
        b=KqHDCI78OUCnxO8roOmSfov5HPH1SdcwmCTMcQABr9pAZ8J01V8JP6yMH+F0dAdELl
         BgK012J0rJyle7wOifipSAWp0GDW0BdH0B4y+Q/+PtDKdJ/0bw2tOuNPbQ9sYi/Wy2X2
         xk47sYo+uDoP7axngSpakuV4FhYFeZqpnxSrcyCuyNoKnr8nXI4wQAgwVVz5+I8QSUgp
         x/UhBLQ8Notbbf4MKNS/KnpqfZpP38o4uPrbMtUloW7uq1pmb9LldVCnD3o1yRx/jJnu
         HH/cwcShp6jG3oUpnktLaUufs87I6c2MNSCG13q8a1sTFR/MENaeGxmHhM+fhbc5OJsM
         mQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110997; x=1783715797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=;
        b=rFBygXNt9wYtXSrD+g9iificAH12dH08VUayIIzb6HltsKG8bY3M7wksiLwXSjKgH4
         l83Vs8bVeDHr810+FWrNoFhQBXLJLZe7Ch0vkw9ppoV8bomI6kDuy7MblJj0f6kshjPR
         5RvhnoVBUyLBE36oafWym6zUuoDMvfbd31W/Zavgku261XsmSUUTXqmQrP4Jiy+UaWMW
         TNYJplHJA+xPRuTR0L16c+RlJXzcqSqNI6akxXQR7+FldbVL83vdMzMSi9QtL536cP4F
         mdqm5Pc/9wFXGl//YMeAKf5Q2dODjxztDIVJpWRHCkkneKUuvNW2HuNeklAlZ6omff1r
         SPwg==
X-Forwarded-Encrypted: i=1; AFNElJ9BIkT7e5vn65AZKTxOrtHluNajgHPSkPGCuvn0wJWrkvRITcGoJ+1qjuQGbiXAiRLN5PHFYle7nmHl@vger.kernel.org
X-Gm-Message-State: AOJu0YzgBU7oQolZ4XGCChNT9wrvy6Zj+rKZh8ln3UDUd5ErscAUAnBo
	hmOWoSfTTdEGsffTBr0fqVs/ofGATij/+5lwUbUQR5PF2eKyQzUNXCotGJ+Zh52lvkemXT5Yi1p
	roHXdYKnimSfWl58GAD/XHtTunrTuUrN3OLu0Twd8SCMr5nKuljgIyM4BdsFNfmxePuU4Kvir
X-Gm-Gg: AfdE7cmxu0V4JpNGPwGrJwwEGOCuNm+34VRK+FyQQjEpM+/B4agUhgauh8F5g13NU2P
	Ol6ZjDXjZJSpO6yXOyIHe+tgp9xb9/4kz4X5UZpYcSvsP3ouj0yOn1GXvRTaaKHGNxRWd23uMPS
	ST5vrqUjIHGIJXTfmIcW3Fh7ArHUsmJqMSUXpB7y77GLIoLPqqODFifra+Ok43+LhxXyUuM8BWo
	HqVmlQ1YkiY9u/yCBLxseBnneRREfVgdb8xbP3uBVBdGUPYZBcrQNTsd2bPyaymvSpt0M89xMxH
	MjF2ot6Vfv4uOBcXCUsDxdawtKP+Mg7pdVxgebpD+8Md2FRcMcqStv/Yz+P4egpBVoq5KjQA+oU
	odU4dx40vxyBKwpzo+5G/d2HQi8DdsTYO65g=
X-Received: by 2002:a05:6a21:4cc7:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c03e3065c8mr805372637.25.1783110997143;
        Fri, 03 Jul 2026 13:36:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc7:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c03e3065c8mr805345637.25.1783110996652;
        Fri, 03 Jul 2026 13:36:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:35 +0530
Subject: [PATCH v4 9/9] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-9-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=893;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=MQlXtxhLQFtUqLHdZjGZifsTsVTh3ESNrqyekz7rOG0=;
 b=MzhVMhZap4fsAniWO3w2MNYPOUIaWxceqpeu98aHYIopN/QURKoMDWtY2N1HuWpigtKSVKySi
 wFaarKM7dXKBYN942TJzB1YH/LjyAJhqYOZLEi4us5GnzMYF3HTZD2L
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX/MjVeETrcUNQ
 IR7iTx6RRfRkoWonEMBm98jpREbKYuJUfYXGdnMhXWR/MJJpK2QK+oK4Mx51mop3SAN59jugPGu
 IW58T5Zbg7Z0XzLXsVMwnOeNYbZRXTSPNvbeTuMPQ+lDqbqkSmOaKm+aJtULnKI3cg/QXcMoP3O
 +ue+bX3wDft9KSCQ063Vs1tk1oym5+8nM+ecP30tBvmy5NR1KGhugVQn8t14DnLOCKpCbsGUbXA
 d1i354aPe6mg8npPquJUCKwznCHDLq1NjJA06mrObNVL+ghMQfvQOezY96Kv0C1J1hnk8Nqs0qz
 0VxLPKlMobeWg9uHVCRPYKvhe4o9LDCQcHOj+mVAaAArDLdBk9jB8yzntviX4y5+YO36UB0uIeS
 TMkMeBuECYzoG8Df6fB41djNWontG47NRD4W0BNDCrkg20PFbTm+hKwXWO+VVccqFHUEQoDe4CJ
 EobGiWLOq4hJ1gkdbuA==
X-Proofpoint-GUID: psjCBn5q1O-BuDzXaZvJa0AZomUhFpmN
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a481d55 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=C5heC5qkSJu3Z_QeR_8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: psjCBn5q1O-BuDzXaZvJa0AZomUhFpmN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX3m4YQvHI+NpP
 AC2sjBjjZZVNYvhsEp4GNXS1Tcyp30SPCOJ/ZaMtqo+PD5gk0i5M9JNdVEbsf0VKGVmbDD8XPIG
 LfGwLQlJw2qO34UKVc3eA8n20ZDMHk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra IQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 743979b5ed5e..b51aee19ee20 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -58,6 +58,14 @@ &remoteproc_mpss {
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
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.54.0

