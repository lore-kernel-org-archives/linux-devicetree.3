Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE663FDBF7
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111281; cv=none; b=ciF6/ROEDFx7kPE+IGDFMSZINXORck0Z78KgjCwWe6vxT+kiKvc3c3RW9qY6kV05KCjUt1Nfy9S+5zFK0RYZoZiU8yxUXUQBJpMJgdLvd7q/SpMXmaFpt4sLkLz/PWPk86OHLl6EMzByAEgi0s2trwytUHBPlq9IMVPNp3B3NFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111281; c=relaxed/simple;
	bh=siu2NmBy5DQbhz0/hxEEhSyI3TF+Hjy1gBfEQXSBmu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHB9sBzKSbhuykYcT4svznuDlCCXr7QHeMoKF/WUq9ej1L1Gd7TzLqtjHziSVKGpZsMS/ww9+2rm+eU4l0RAwNLLxfVRRxWPTz6/UKqIq5tWhBqkMng7QZ+9MaTICKWkLZmDJnywaERtDzWbcVaKLiO483xQLgEBtZr8pOf3bGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0uR6VdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3KzrYKh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0uR6VdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3KzrYKh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXUZK268471
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=; b=j0uR6VdVGlmzfMPf
	YAvgKQrcX8Jjc8cjX2Oy/gM3acy+lkGcJomen6ybw2CmMkwnfdRUNZ7oltJe0wXo
	r/K8H5wKLSh+N7LmNolbxRjmPnaOkxKc8FQcX3fvhinMzFlEo66nhWoKG37JxVuF
	Q6l1kg3NNon5+zcXPAeJ73X7RuenqRLiinD2JC34gi1TcwgaTKU9VFjR/yMcHJ5X
	/hpoFpFTuwcnnBuqwUsAcQH49Wwgu2znxrnuflZFvh34bEY8OZr0z8JWi727OXOa
	XMbzMRfm+lY+FYTKuQqTRdzvi6L6FF/Gs99Pg4ccXMkx/yelK8/kVC+DAe4DfNT2
	jxOYTQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c0s5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:07:47 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14371f7ba1eso351232c88.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790111264; x=1790716064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=;
        b=j3KzrYKhUK50TPEoDSnNEgqIozEpGoOPjMmgIQxFNem0pzwxNpNUV/z0HacLcQ3fcq
         kaA+eskhXLmrWN8mPHkxmrZebeMMjCQg6pXQ9wxIeOtuFk7fRsQhAXQrxAD+l1jlKkGF
         xk7P62M3OdQCerS5Y2Kplnf9eEadEXmodww5P4Rf0+FoLbjtwacmaruUNbDnFx9i9O0o
         dVAugbjZ32MaIHG3J78jAOUP4n6tDxrkOM3m2Z67jyCG3AyOWUCiRieB2vmkVwXfY2QZ
         6kf/oZhscngVhkAUVqoUqaQVu/tox2lKTzhMGubu+60jOVnym5XkQUEYem6/MqCEcK2L
         kTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111264; x=1790716064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=;
        b=Quh4WzG95/hqw6c3vSpdbraEE53Jhb8GvqujoILplnXH7SHkHAS0DkUkblCYPqmC44
         P1iygw/edzoohUmRjZp/40TKuH1iIQfYclbdJahQ1VmfqZIZYEZrUQA2jfPQfgH04/a7
         tU6CEaLhPGw8MWXPhTqbB9VTvlcCLSFf6WoTDeDaHER4YoAnQNg5UqjMlxV3rum6tCsz
         BCo6xoRFCmXEwCX+6GtXIN78gNXbbgbxDFt57XMIJyRMCVZlugeqfCxLTHkhcY/p0o8b
         gYNKeFMn+xnzMm9h40Cpp7ZmY6yt2gjCPXLxUYpZYBr6rGir8qgtYQs++8Q5GgEwhx3/
         g57g==
X-Forwarded-Encrypted: i=1; AKwUvBxwPp5b8YtNeLm4Ju0/b6qgSztgyDgR1CWtFRUpgIBGZpBVEjQ0AzBfqs7qUD8acZDXAMw2F1vnrbuu@vger.kernel.org
X-Gm-Message-State: AFuF++mQ1btkOhh+qiMrWobJrneedPnrvK5AW3+rkDUya8KkGhNbBMik
	QZ4jPnpdSaCR95UA/evslcNmxW9n7uStkUjQgPMcci3ne1umy+XN4DKra9xutDIVIN93TaYDHK9
	X7I9UB6bIKKcRYrNrc9is2II/0FCeQA7+otcwrq8P8svtGT5R2cERwIt0eW3oP3G6
X-Gm-Gg: AYBFou2CuLgOcm1dcPbN+ApvUAe8S1njoTrmKH8kcwm6ZWADPwJiPdyThgD1r3/Brad
	DH/Fw2GtTh6zmAXolZZH28Pf+FRWR/FVZyeKFLD49am9l0r/TVvtWQGcFbf3BDKcZxauY7pSc09
	tgoOD6aDZ0ujAGm3jtESyOfQZ8b1Cyx9yKMKPf4tN4ElINgUD/TSBoDx3RX4T17yR+NiBvabtHs
	mj4QL4kORopZMTmjfFmdl/s88EIaZt48WpGNibkn4mfUEZavHWsViRxAnXYiyi7CQARkkbWTIgZ
	M4jnwiPhNhvwQA17M/SbEsnbfVbLpT0Y6wbiVRa7jK1XMEr8ngVV0bLpVjP7YHzEGQcbXIhKf3J
	mVLJ5gPCI8/s1owVD1YaWfttKwg==
X-Received: by 2002:a05:7023:a4b:20b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-144f8fc800cmr680680c88.0.1790111263920;
        Tue, 22 Sep 2026 14:07:43 -0700 (PDT)
X-Received: by 2002:a05:7023:a4b:20b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-144f8fc800cmr680641c88.0.1790111263244;
        Tue, 22 Sep 2026 14:07:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm1157207c88.13.2026.09.22.14.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:37:32 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-socinfo-v1-1-f0d1aaee9323@oss.qualcomm.com>
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790111254; l=690;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=siu2NmBy5DQbhz0/hxEEhSyI3TF+Hjy1gBfEQXSBmu8=;
 b=lnEdRep1ZaFLQE1onPrYzba/AeJYBCvVBHvRxnO/E78JFqNTayAxcG48b4Q+1i2oQjaID1kpe
 COzTgnOYSktDAkEE+XE1A2sG5XpO+uItP7L5koJ7qCxGS1o9GXPPrWp
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: pE7kkMiD9UqCGVLdnEqvPhJOiIMRvkd0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX3eZoBX9xA4Gc
 EPh6XgWu01ZwElDPx3bJW5tOPAbCAnAZM6KHPh6H3buSSlbb9jZ422dmx59E0oxG4Vylr7z6O94
 YPcnr2GI6j1+58sEUUOZRw94GclWfRY=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab2ee23 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yctfUzL24_LWH4g8eJ0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: pE7kkMiD9UqCGVLdnEqvPhJOiIMRvkd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX91p3/uogVajU
 Jef5MIUZxFxTJunGrMln4oEo5PEPJrEmfzVo0JdzcTvwaGR2Vsmb95i2qnhJcCuhJQb4f7euvJs
 jWlLrE5V/Yi7MMVoTeC0bcT0P2RLpFaYVdAyulVJZOg0foFei/chbhMKnmAqjCE/EtnxRX4rv7x
 079goDLG60iXsXJApkEmuX+YKv0q6aFY4+KGOBhjFKa0k1KtitokPlzFDQURsdVe6J0Kbb24c6t
 4EGUoFokdZXiTMf89Zd1z9NnAh0wmd4EHuc/rG9NUmkyieE/mu3PwwaUQLkRtbZorwgPFpXznX1
 +gj9QWIDhEI7crrG9aHS0+ySaQ99aRE0q/fyfVsbC4eiBSLwVNWWDOQzTdbmggpNoB62RvuE/kL
 WzNuayONhzRUTl6csIDKsAE9rJtNQ7n2A8GnSu3rbtt7EYYOm+gDdUW5JYBsV2+L1/lqEwJiVX1
 zNldBCS7GQ7Xn1pvWqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220297

Add the ID for the Qualcomm SM8975 SoC which represents the Hawi
platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..4259f8960447 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -301,6 +301,7 @@
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
 #define QCOM_ID_SA8797P			690
+#define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_CQ2390M			756

-- 
2.55.0

