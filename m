Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63449481A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046983; cv=none; b=UXU4BjhpzndhcFzpyKdTcnlafuDnM4NXhE/ietK14PhN0GE2fQ5aPok3f+yMaiPsYIt3pa+W9G953OwJByb0mTx2+2+C3EnwghvuoWdED6ZB+SqWadMV0kdQEoA/DO+2XUMi+7I7V/U8ag+DVeFKEM9znaCHjzf9AIRCVSNhadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046983; c=relaxed/simple;
	bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prp4qSXY6ywzh1YMTkU0vpgvWJFXlARHnNOOjuurl2VWCS7hLdwRpuI19kt11dBlQRvqy3CA31zHWLEgVizO1uFt29j19TwtIn3vQUPjKuMKyFHTHcZgq4RaX2Rx8jskZsGPz6JCrtuYrvhTxBO8QT+ooZxWIFL0gJuOJo/owSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nd3jh4PG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apoAwQDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nd3jh4PG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apoAwQDt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ZiL2029098
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=; b=nd3jh4PGqwzkKwsI
	82Irm8pdNlqoMBl2GnaCCmJevQXHyP88D4uu1+7YmZiM5sA3NHUTggHuX4H4/V3q
	K+spwJT1/HNTqs2lqON4Hu77iBmWDRVJxjpdVjNa04gGpmH3JCkbZWxWwJGFollB
	bQWbP3i3cJ5EPXS3xKRQ0L0txsgiBIoa96D4M1GLHhEK0ciLCV/zgBFUuoOonlvV
	4X2nplrQJGeAKyz2UbZ+xFGUJ/Jp8S+YQOonLeKRid56KoiCPRF4y50y1jyEgLYK
	KrSBkl3BS9M53BSJFiFwAUOixyEKLz1PjHHb//CoT46UX2i5ovrEoh6QLb5SNAC6
	7Xouqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc031-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1675130a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046979; x=1789651779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=apoAwQDtsJCiNMj5cV8399Pzz+RsQVkTB7TwYznifJKZZhgrQ47X2UKLMNiw3FQ+LA
         SS9ab/jQG0OKL4CHKw/KybSO8q1a9aJc4vdcSx32wrRk4xIQYlmzp3h2S/TaKgCmndEm
         OGJVxa8jSrP9toYtzG66FKxzOBCCS+UNvnpU2lojodJa3ZU7dbvvYumzsMyiTVes6Kfs
         wOMCq9HYnailMwETsqLG0PQgvLIZfwbR3UqCEkrut4Snz6QIsaVwo0PZgilh3rVveJLC
         5t7EWfvwb/3XeR8aorxP/Gjlugc9bDx0WKSu05hzOgc/wpFIHxsnAnvp5lB1p63WKXPo
         /rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046979; x=1789651779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=UETXXTTNhFG29DwzZvUk7Bh7t5Au76aI80/2x5k161JFKYqFp0lrpilqu1WHkDCS+V
         MZ11tAaxT7uP58lOvL1EtHxGe0pjnu/SHPMQlqWrY4AcBj01c29e0tP7YHo/PDDzy7X4
         X7w3gsy6ge1Mv9bcSReMyz1n7MgocSmKZiSC3c0b+1pV2Dgb/64LlHzn+6w7OUFWykJR
         UDrM27S44exGnDc8hpaquYsc3KSjAsgdliXx4Jg/9kk8fzrR/YhTnHiYOsMN78o1J3mD
         Gzq0BbLOnJRIBTR7niXWxji8cOICG2k4lpBxWjymuhIb9z2ltxhy2vsJHMRch5qzrhCu
         J+Lg==
X-Forwarded-Encrypted: i=1; AKwUvBydMoVibFtTBnzcTt9azFdqw8LPNKUoFfQzzPf3rfsIsgLWFLTDwrpo7oXtknUNMG8p+Nd+n7zBMe5E@vger.kernel.org
X-Gm-Message-State: AFuF++n/9JFtZHIY6yfjlFMOjJwQ6YUrwbdnYJrQvNDDeXR8lMqDIQVF
	8pssQ0e7tAislLO/2jtd0d6aZ+TT4L9rgJIrssv3iXgwkagkvUT/6NgoKwGOCOMJLtmWVy3HjAU
	hoa95uVUEAADa6ETbjmilBD0My2vsxOzR8TWqbB1PJegYvYOxs+GzYUkFxl+DIto5
X-Gm-Gg: AYBFou3cYq7mAIxmcE8aD1gTbKFQbas0M4C0x4eyATsyIlnP/0wzZAQZIg6cNCqhLmF
	c9WCeaIT7yJHtT1l5EF/D4utjlzo6QmaGXvwhXZKLABmmXVGMxDSFsdeUA94me3CFELYcy3uhJD
	X6royRnAvm2JfRuO5qA7e0kT6jiySAh8ZlPZkYQAm8ZBggzp/8Cd81360gbehQM5Vb9VxyoVKha
	b2IR/vDRRvKjOmm2xRKnTKo9gMcXkN0tvzzg89MQQb4HQjVUd+Y3akNyKF7f2F2o4Cb50jqOED2
	L6uyQvzb0iSqfMQihKnaq2CcjTqVgDG3S9W0p8HKNtPBeCNc0jsMro54rXdSXnTmI67hmeYjQGH
	51S6RwyghQVKjcX04XuaeJ0KQS4yI+SBp0Ls=
X-Received: by 2002:a17:90b:4ec7:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39d77bcb0a8mr6587657a91.26.1789046979194;
        Thu, 10 Sep 2026 06:29:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec7:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39d77bcb0a8mr6587610a91.26.1789046978774;
        Thu, 10 Sep 2026 06:29:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:56 +0530
Subject: [PATCH 07/34] arm64: dts: qcom: sm8350: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-7-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
 b=5LlS/DXiwsqsZ2yYbBg3z6Km0NRyy2ifaFKQTtfi0sZD6SvYQ4afWbncG/9GBAt107vf9qvON
 Vvg1W/oFxsFDz3C/NBnR12HdACy0l1NdMyPJIDFfXPdVOZfBdleFZWY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3tIidQumfw0T
 oaxivQnx+SWyALC5YNfPOqttQcYKToJbv8isMyPa/bacV9zmCnCKWwo2nau9VQk5mfSTRq0RR+E
 ln8gsM08YjG/vY7YV0pN42FNBkfZeNaEjouUrfawGzkyexAdf7pAR4lviRBCh1pg73YbR0dINgL
 aH1xTWXYG/n+F0W0tFR6fpAtOIxz8OCcyFIt1Ni0BctcLZe9mP+soQvQHniopPZeJbR62+50m8+
 FbQUQxINho30NuWa9X/bYrGACdCo8LP/VaPOY8TkoCgBQ8iYOIOVbiujLSlaKFCZzm75uiRN+Si
 v8Pta/mrFZkEWyxzbjOZHFQcsg1eZio+2LmP91b5JsAKjb0AEpoFPH+LAi2omobqs68DFtQaAXO
 Tigu/38cqrBVeG8If/x9lwGPJM/n8HU5xIJvcPWoVA4mgmzaoB/Ms2ZRVXV1JgMLBK/opuLBU1H
 u2SiUPMAA02yBY1+RxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX2IH9x4VYpjLJ
 etMwIgkhDtXsvVSjbHADebCjIe3RBzxfcw/c+AjFpIXSSUo18w9kOoz2l7onzsn6gBTMHBMRFoG
 nHRdI3rlL4i7BHxZkM8jkIHaTdgKUDc=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b0c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 9xVWXBpVqGKPphYxOly2-EUG61xewtKn
X-Proofpoint-GUID: 9xVWXBpVqGKPphYxOly2-EUG61xewtKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index bb93c3e9417b..e9b9e03f725e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -500,7 +500,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -514,7 +514,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

