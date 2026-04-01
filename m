Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C36C407103
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047240; cv=none; b=Apf3wuTsH7PPUqU32wJRiKvBD7W4czzRjC1TVsCn/WW3nikgEK+/xaer9T+9I9z3ZStDRCK/vXZTVpsWicA8zRH8hAds/cNrrIoug3KsBNUuGyfRNwrbRMD6hhBjJJ8kpo7vlxrKxCCoVZIxPx2/9rPFXE0/xw6nor8QBuCB2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047240; c=relaxed/simple;
	bh=V5Q62nK0Vbbku4OtnNMe64D85IWZhZmt3X/PMujd7b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qjrNMK/afYwYzuMOjaroJZQ+zLmmvO+UZizO6hPnn+nGhB3y0qYhldnvYqMAP3XbFygryyDe8pS4C5bQmsOnSNQmrbln/NYWc5WNVcL6CfVWYMb7OaiCBtH5fp04419hY+IPEqvSMWOV3wFGum2ux3NLslRQLcao2H91z4Gg3h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMirwWpC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu0TziGF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMirwWpC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu0TziGF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631CTJ0G1285924
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jt5F0jmqoE4+JGiWZ53i58ADF2Fia+zsItp
	8jaoXLWM=; b=hMirwWpCfXpZ8fgkE/tHCqq1EmTzdzMNyMgb427m+/i+9g+67kB
	jzFG04BU8ccZ/GFaZBg+n6ksqH2YPqQDUcbOs0t/CEo3nCJlk3PsLwzCOQIkcwtm
	2G94EQL1ij4N2XXioZcdlsQ5rtv5kdsFLR9dyVdHYDTwC5bKrQJaXgEv231VwbAX
	ugavsjq73bh0FQbZGzH/57/H9KJSmh1VkA643+Tk/5k5WEaRWWWPwQgmXlBUhrqg
	L3YZh7J+LnUdwe2pgRWpIjm3HI3+LBX0Egk5U+Q2ywHFd2FzgWOwn/0A5WfeAH3L
	wOCcO0LoRGVS3tTUncJKzcGaFVgxiLDb6NA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3sar8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:40:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso4606869a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047237; x=1775652037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jt5F0jmqoE4+JGiWZ53i58ADF2Fia+zsItp8jaoXLWM=;
        b=cu0TziGF8CmsAQ3VAZM4MSsRqHwWpkZRQ519NiYQPB5OEK2Y9wvUfh+reqwZW4+WfS
         BmsF124moxRAmz8Lx+F2yT4Y4ofwZUzLnj2P7pMFXPNSlRkf5zFxtr6qR4PVuV8KRgVd
         ztEWXBHED0+JBLYFiQhdN8mgsrJcIol1ZBg5kW4t7n3XSv4E8qtCTnGhvzfztwX8OZ6q
         KBA7OKOvdjlnoTQuS2+4AX+PdLTNXDJCRuJzPkWjgeKoj1y3Dh3KehWB6bREgJM42tQ9
         GNovK49y+3SxARnFzCGoftiXQfgZqGARfj1Ztw6lEEgyg769pfj/a1Tc00G1a0ZeNQrf
         C9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047237; x=1775652037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt5F0jmqoE4+JGiWZ53i58ADF2Fia+zsItp8jaoXLWM=;
        b=a/YJPjT0X01LuiyZFaHoXd/OTk5T8bB0LKJhFf1vCT5t8hVYEczkMZZELLMiAH/TTp
         /thFN9NpE4013YjJ35274pXekSer+NdURNgEzDv7ljao2zBl+UeIMAvoTOMivq/ReIAZ
         tKc1rRLhJ+lnOWS6qJL1Cgf8qbfmfXYeVVwcs/bv/HweHm1/RMKO8iBXHw11yphHxyHv
         /crsUEHEU0WHm8ANsLxcnP+cfi+lYdOVA1Zrr0QkSH6XQ8rRSi1TBvLstVQLBm9nkf1i
         u1665k+JDoWNUq3jX6DYdRQwuc9Bx6zfmpFSf633bYt5GnXgqnDownFD+A7eGXwTF/Nk
         p6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaqDtrlI9d+sbG9L2KmR4lnfslH4ztMBPJQFBfESg3FTfOJNVdHh6EDL6cF3p1EKMAAEnRzEA7YQU9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu/qp87hO4GWneCeuM0Ah/HPjBzVyDPE6fRyVxrRJK94a+EH4i
	8O87hWr2m2Tk1wMcJVEwMfGad5iLFENJAacvbTpmfB/v6ARGYJRUEMsTSnr1ksvg7Qdnnxo4SVq
	hEF+4xRT0yODuOy81LOI8mXFb8FN5oRI2ARGlmt9V2tQiXM+pQjtjW0eD4oLlpKTq
X-Gm-Gg: ATEYQzxVra/cvLfR42QZP+owXlpJIb900U5TGNcwMfE9wDhURQQNtyNUAn4OCRWj2zL
	EXbArSqT9wRRHMl5wqj1HXz9U1x9l8uxWbVkISzwLSBPuMieLFS/H0QgZJOZ9ZTw0PHZxTBEfzm
	cDZGVyu4n8JH4pjIq3JBGf2Z5iKLe4OweiC1Bec0aDlK3vfb2fvzNOurT05404MrBziQhDg/aUX
	TRN6STQSFRo29JBCKtukD+uroSrNHge/N4FbUaM1yRQ9w5+z0p7dTYaBlECufOxS+Ad+Zn2e1Mg
	VQRj99BIXOPaLBT6F4tXxyrLwqcU2uA3zqaAB5yppoLKHgLf5G1pjmLB+7J+GNCqlEbH/QN4EGD
	VeVxTDkohCIx1Ni8ddovQZOM6V0BiwqVDdfMNYQyB4WGPOggA
X-Received: by 2002:a17:90b:5868:b0:35b:96bb:47b9 with SMTP id 98e67ed59e1d1-35dc6f7aaf0mr3154328a91.19.1775047236601;
        Wed, 01 Apr 2026 05:40:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5868:b0:35b:96bb:47b9 with SMTP id 98e67ed59e1d1-35dc6f7aaf0mr3154293a91.19.1775047236029;
        Wed, 01 Apr 2026 05:40:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbb74aa3bsm3558171a91.1.2026.04.01.05.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:40:35 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Hawi SoC
Date: Wed,  1 Apr 2026 18:10:28 +0530
Message-ID: <20260401124028.589931-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd1245 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Kwsw5yc_4_qMWDLpIgMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: vEt5OJv4IcX6cISWuZ12EGVUvCb_IZ5q
X-Proofpoint-GUID: vEt5OJv4IcX6cISWuZ12EGVUvCb_IZ5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfX1+PlQ6yVTneu
 uLJ39PozjZVzTsbTRxYq0MIpzReh+WFq4QfOwcX1dcLh0Hxs1IdqmqAK39vwazd2sBzLkS2nnKH
 hpp2ZOk+GwIAY1gX/kmdq/hUTd8O2vKqJBvWIKD9W6YKuTd0Lg3GghKn2UUzjYSi11FKt6ipT+7
 PuzPGk+lIq9hBIyTCsa93HOClOovvCf/KkGWjWlfMZXWHW3tR3qsmINV9GBORDTtOOvg0ezfyll
 vCfe5Pc3+G9N8PIe5Aorq3F1H+ZP+PJdziNwmlTWa9Ryb0GiZLbUi8P1jNPl3mV3YxKOjHMBu0U
 Lxs4+lopUlB2PiPHCfZzl0rvAxlWPgDpO23kkJ+JbDzMc4NxKheuc2DcicK46qFnoqdvuWB3/cK
 9r2GzhmGKIvHGKtxWVbV3FXpfSAo3eXH7AA+9LhlXAjsFet/IR5ik9/iAtfH2mayCmyQIUrkjQu
 plVl3HWYB8thAEV4cig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010115

From: Xueyao An <xueyao.an@oss.qualcomm.com>

The Hawi GPI DMA engine follows the same programming model and
register interface as previous generation of Qualcomm SoCs like
kaanapali, glymur, and is fully compatible with earlier GPI DMA
implementations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index fde1df035ad1..caa2ef90d8f2 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-gpi-dma
+              - qcom,hawi-gpi-dma
               - qcom,kaanapali-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
-- 
2.53.0

