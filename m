Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC83D45E5
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 05:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638354; cv=none; b=HFALCBZuQM/qH3KlgngxFBANpEKtLBks28+6sPuq96R5HcXukuN7rmT909iHaKzCUB01UXDG7eWNL84FVkug/PhuQGXRxkus6DptT1ZNxln9IeuwoXlEC8hh3iyaxu4BKoezYd8HrmaXXuLaFAAH63fkb5QeCl+N78Flsr9FZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638354; c=relaxed/simple;
	bh=BB+2jPfBx1KDkhydI/MKpjYWWTkT2tUBU1PE2LP8JSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QZICpJAgE/xer2RISr7RHfxd3bWkMxWh9XUU2GpBuvFx5oun4ccGDrz19VH0bqBFUuSXcoOwTP5qZxX3o3Ex8yMCZOXn8h9Zre3GalN9DN6yc3B1E/5Lp+npMcgWAcafkR+JEYeeG9aFQsxQ22YvE8JuSwsApiZNigVFFSbIV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjPODipC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4e/dk72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjPODipC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4e/dk72"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65543lqO3221123
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 05:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qkIDce6Btxrn/DSs3XT6dg
	RPzxX4+nB324jhTyEDu84=; b=CjPODipCGeTdju868n5xfMlJ0ueLra0kIKVvTJ
	hc8xU/zrAN8J7eSnhyx3/M+qlM61EEpA513C7Rc2ZQZf7W/L5FVS60WDozhVuf26
	+7x5ITtC19k2yhMghOooUhLk+bZAX/sbPc9ycWnq9mguhUTFYwSoQSJml7Q5wEKT
	g/e3xPkndaxMOpVKDi3fDobulMa3tyGC7ch7sptH4/foRXQG8MPPPRvc0FL1HndV
	77mlvxRoE4ZHXzK0hNBFZlghX3H0FSC6dtcMYyBlhslst6YdW5ci4s1knddV67zO
	j61pOpUSElqfumTvXQMnkqsFPv8Rh6xLqq7y6iXakWS8j0+Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95uc832-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:45:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-135916eefa0so2649466c88.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638350; x=1781243150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkIDce6Btxrn/DSs3XT6dgRPzxX4+nB324jhTyEDu84=;
        b=F4e/dk721KfcfQvcFvkhOmcjwGBoaNfq3BoeASYnGrTZD2OuC0GD8fd3lunDvMUngN
         e9/8tQHLy1rj/FY3baayw5Q4K3atSwfZHAlngpkIWXXgG83j/GNpE8npXZgYL8HW6d7L
         HGBNd37eagMZUDzn1SowwB81m/ZRWMZ1H+dcFY6yCCsYmHYHFpwzHbk5z5h8hx1LjCSB
         dK0NKwg0TG2c1xnlqJQVsj87ibjBm7K1ALAT5kUp3x3+lLWw9bGuhTJot5N+RFvNgxg4
         aIdqF2tVYJsF3QLPfGlVFW1KAUHavvkZZdg+GV8WQEKdPtpbs0OO0fYNl3ONvozIhYEB
         T64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638350; x=1781243150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkIDce6Btxrn/DSs3XT6dgRPzxX4+nB324jhTyEDu84=;
        b=KO6aifu9fPkGgPp9RsIozJhdIpktrL/wT1MUI4d4AD1lgzlbARUnHQHkzaxeMuJLlJ
         Squ9IUqnPxf8lwbs/uug68nfdrJOqgECj3Pm3EL+jZCg2s8ckXU69hOcB1cJcXtOMghI
         /D/2g2vKtpYKQgPHAb0FXgMBgECyol4xi60uMBLOkLQmPmJO//0wMeqBns2vZ8ACMi6n
         dqnQcVfdxHJ4i/MDOow62BAXl+T+B6Wgx8JBtBoXwGujLUPHgv8TX2thrVL+xZlZAso6
         tokRKmeBfAldsyG/ubD8LlP+kc49zGeH+699M+8Aj/fdex/xRcg+FmKS4aHmzaO5ltdZ
         f1wg==
X-Forwarded-Encrypted: i=1; AFNElJ8mhV445x8aZiIFw/h0/Q1ludicqVWTFKgvf+J+TkRpPIoHQFRY9Ba6dzVC/3F+EyfAViNftaI1ihTP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8uBKZthW1NJvI7z6HhEzlBC9Z22311Ms+VMJmZdN4B00d10Gm
	jOOOJjX5ZIHzYr2mcmec60/OWcLu2g0YW2DTHv71/Ro/HUwU6eggySjIBFYpP1FbxYwuGhQ74mY
	dg8xS1kUp33Zm97bAINwnmWAGTfBdfKHBfj5e3DjM3oO5WyBc30OimQnIhMRw6ST3
X-Gm-Gg: Acq92OG2bmilPc+a9JKm8GjaGWo3cTbx48GROYREmKPqXGuu8rEQ2kRcxJs9raKJjzq
	AF1lbjtQ8Ljw1aon1KkwK2GoCXe5yiXDHP+SjpD3GPXDh44L9UVuJcnjckbVuNyWOFCatXAXf84
	oyi68vCJNDIJrT5PRQDktUBAj2Tb3URHf4a6STVMpJfYsSB3Mjt8d+w0+6tYNeVtUVowhftU9WD
	p7pJ+TNUuukl23qdjj1+lSzY5xKGlj7lp9UMSWN965bW0E2pMNrPDFk9a6LCTeMeQNYAOBdgjHR
	H2uJ3rQ5ZY8i8Cw5AIYFn8AjhS6kF4Cg9Z47g3f4fbJYV0P+WCkoqavri26Lq1n6DgBxWz0P9za
	EcB2JBH0i1HKSLpaIoeAnYrbkkK7qax3b/w9PDQiXCPKCgZl3VJ21ZdcapDEyxG8ICu5fusyLEt
	qppmH7voM=
X-Received: by 2002:a05:7301:5f09:b0:304:819f:502b with SMTP id 5a478bee46e88-3077af4c61dmr972545eec.9.1780638350400;
        Thu, 04 Jun 2026 22:45:50 -0700 (PDT)
X-Received: by 2002:a05:7301:5f09:b0:304:819f:502b with SMTP id 5a478bee46e88-3077af4c61dmr972525eec.9.1780638349990;
        Thu, 04 Jun 2026 22:45:49 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:49 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dt-bindings: soc: qcom: Add Maili soc related
 bindings
Date: Thu, 04 Jun 2026 22:45:43 -0700
Message-Id: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdiImoC/22NywqDMBBFf0Wy7oimNsWu+h/FRR4THdCkzbTSI
 v57o92WgYEL956zCMZEyOJSLCLhTEwx5CAPhbCDDj0CuZyFrKSqVNXApGkk4GjBUHAUelAKmzN
 K1yjTiry7J/T03pm3LmejGcEkHeywkTJFbrWB+BnTZzfP9Vb+SU7yn2SuoQLvfJvP10Yer5G5f
 Lz0aOM0lfmJbl3XL2RnPDvQAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=1061;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=BB+2jPfBx1KDkhydI/MKpjYWWTkT2tUBU1PE2LP8JSk=;
 b=P5rKU3i53Mz4ke1QbICqzbrkvre6Pv6gGIRMwVdWekZ/+QKPiMUkkcDnizKBpYuBW52gXjqK4
 mzYRaAmKteZBhUvmHj6/YhHFt2o96EjyVEiNlGjTQsJ+smMPHRZtluK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a22628f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g5Uc4DKV6OW3X7lTdicA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfXzv/JUAGClFTe
 XPT6ggDTgIm8o/1mAdRB9+DHltt/VkLTh0hbn3xcX2AKiw9rTeG/zRjd23JC7IO/R1zDBoGpM4Y
 CP5jneQRDQzQVGkPlrO6mAUxqh65qkeulDkwRhTM+AWA0JMVTeya6Yc61pm6cDCyrMwhX9E2I9o
 2hC2FhNorY1b+bK3FURXF6dP6Jo8gWLYPhc0ZLEgfPXJY81Dj9weef1XHJKLM5K/QvrV86u95MR
 lypnaKiDnL/UME2RJKC8uen1yJ3u5kBRUt6PgLfjqEXerrIjxKzRfADzecjTomk2oPdYWy/b7dU
 djq0DqPhDN8imDUsyKggGJDMffCciwofkaPhXDTAIlFvAq7O+X3P8nsLEFxj2dFKqGOo8PZV33q
 JKDbLEjVhCNkTOg0XxKKXguoc99tCuXZ0Fu7Mjs7W8ETed/Wecg4vo4G/PMrbU78V+dUPwSojUZ
 8I95zwgI4//0JPknrPw==
X-Proofpoint-GUID: fXE_460d2-2eUYtCl3BJS4bEsRWyMU7Q
X-Proofpoint-ORIG-GUID: fXE_460d2-2eUYtCl3BJS4bEsRWyMU7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052

Add soc related bindings for Qualcomm Maili Platform including aoss_qmp,
imem and SCM. Maili is the new mobile SoC, and its DTS will be upstreamed
later.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Add missing SOB
- cover letter update
- Link to v1: https://lore.kernel.org/r/20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com

---
Chunkai Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel

Jingyi Wang (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      dt-bindings: sram: Document qcom,maili-imem compatible

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260604-maili-soc-binding-66e47e2d46b9

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

