Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298038657E
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292841; cv=none; b=aH89aHyYl3zCWlcyjJaPRZYBmNUKXXfdw0791hTiFiaciNcLHl6pYvw32BImY33pRYI9hEApfaXF6qX7SAXpBbRjJC/yKzYa9mmbM1uEF0SIzUgmijZNMBdpTENa2e0mcCCKvM+9dH11EfBJABVuNqSONfRUAu7j8sruq65ziXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292841; c=relaxed/simple;
	bh=rF6TUJT4fFt0Xh6pN9n6/C+QLa7/YYWjtH1j7RXIVW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZ72E8vMMbFECKDO/675a+cyG4N+r80uTouURpkYYFF0UIR6+eiX7/WePp/fCIiG2IH4Drf2qxc7JsdFD78cxTHWipWmopByKEfv/EOXfbFh8EmGMER3IhCf+50xJz5v407+maI0zfvARVjJ8OKcoO2ou9GRLbfNL2YL5X61fRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdYPvb0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYhbHu89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdYPvb0q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYhbHu89"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HUxF449997
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=; b=AdYPvb0q4HxmLa2c
	ruqUOGo/lK5l5/LWEQIgKH26nNLdjzrwKrk3osk4p9/WFP5KxiNhDf2B7SbTXOgc
	VgTF6Wu2xgqE8URtIRpv/AoDu+G/MPRKPZXE7V9F60cQQ/W5NY+QkBbuKdeX6VHr
	qjZaLi795jaDPEm5bJBhm4dGFPKxFbgWU4JVZSckmmqSv1eHCMNBvY5Syp4MSJ7Q
	nS6cKWOd9y6qhQhBwXUGqly5CPtSbMGusPEyfjIiclc4pDZNI700IrbONXTWGOXY
	+wSisnQS4sv+J7JB2/UrRnRyBcEmLttPf0HP6P10TdtttEkXcAnFwAhqXMr4LLuN
	EgGpaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvtvbdt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfd13d6d50so600925ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292838; x=1785897638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=LYhbHu89aWwre4ZaILbycYYbvAMCOTdAnr9j87qJ6WSxMaq08x3wNY6lac4M8QvMBq
         0je4cZLLavPe94QPx6R4hNznuUheHihQzxEbXs7ucdFdvQlj1rqggILUwe6i9RRMScKG
         xI4HVlng4qigTiV9aoACOqD7PX+ylDE5YLGwtsX81eHVg3Iz7T+mOCklCIyJ5hBrpLDu
         feWcFZNXw0ozp+IY/fkdYBF4r1G0VIRpb61bTpYvZ5X01VtydWM7X6Gz/rVKw4UT3bAK
         kY0ZmkuHMHBiqAZ2j7k+QzT6eXsZW4BMLhBG8dhrVY08GG2zfr5ziULAzdoZYehF8h81
         Y+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292838; x=1785897638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=Hihm6vWpnR2i+0qJNGe/4sz1OG0OSRiYaZ4n1XEKZAKqPhSvAgWQ5Tl0MhjYs82ztJ
         s7rANprR40Quno6ZCvH/LR3W9mZtIeZvPHQK1/nM1JwuSP8v+Jeh11g1NL+weV+Ho1uN
         Ke4+fhXHlwk3TcMh/R2TSpeacV2xE8NLeR+aI2CNOBNNJx+JMi+4KIXw2WM+toYDOyY9
         k5FqDHnxw4uwaPiRxb3SiLt+HwZo4R6EiVf3p77ixGZdOWBZRkHGylbuKDkRLnlRfGDv
         D4ls/WoXP+tgjQzSV2CM+iVrDzpuU1kOVx5fb9wcfHBej7QnFGIRY9fRs9goG+5qof9B
         aUyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwhyIyma0PK3NJagKG1A+2s72bQ6nG/j8Qj7chuv1yzpS0jePERauIhILIf55Ta8AksDaoABi/8lDw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk48p921mG924PwsciG2m1/dPboEOmtUJT26nckBNOE/c2HlNX
	WuSs3HLhvcsKCflqyQP/aOHqkooAbGBW2lP8odkwA1PMZ5e+ulee2CxJ1GxzsCuolkn9u1MaCVg
	JDAIibRo4/dMWa8VaaCs6KkhegDdNoxKxOu1njERrPsnPpmPT9k9Iyj7INWLEO6HL
X-Gm-Gg: AR+sD11omqFKZy7T8xMQjZK2/r6Nz+e+euu2GZyOH9zTuAcvQmETMJlRPD2LhliwCjG
	3x2qz6Re44jj0KrV5jgpam+z3qFZGICoQM5ifHNQKGqeb7A69omQc3FIXw+l9G4frrJFOJaGBx8
	5N0NkKR1Bc1ymyv2itsxGRt7cFdXC1xo2Xg/7WNqaNCK8XsM+1m7+9OK7o8EMyXHb7bXz4dUNa0
	bO6eQHVqdjEPnkedOUWCZiytZqN6H2eNi1F0tQ9VdKa+wu0cNXXXAHWVkPoTeDqadM76yXYLeBy
	E0wNtzcUS0F803woCNvifY2X0OxWtO7IdhSedOZoB+KF3kd9331Neavg6E1b2Ys4VH7shbaZjcA
	51X9iljRwQn0VUq85byK5HgPYHfX7JUAmoSY90FW7V306/GEX1Rk=
X-Received: by 2002:a17:902:ce89:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d015a0f7c4mr44028525ad.1.1785292838430;
        Tue, 28 Jul 2026 19:40:38 -0700 (PDT)
X-Received: by 2002:a17:902:ce89:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d015a0f7c4mr44028135ad.1.1785292837998;
        Tue, 28 Jul 2026 19:40:37 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:37 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:10:29 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-1-0548e1dab760@oss.qualcomm.com>
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: kcDg_KJWBKUJehWF-cuUuCXSrNwFIQFS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX8T3l5g/qXc/K
 ZBrawvnjW5yedpEqZ4N5eyhOSfbDYFyZhEJm+iBCmDU2/KuolBAMIUDsE5DzvmDd+JfJ6JxjhHT
 Yf8LdM5T6AfuMASnYEIAmXVJ7IQpTLU=
X-Proofpoint-ORIG-GUID: kcDg_KJWBKUJehWF-cuUuCXSrNwFIQFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX1TbagYowZPSm
 gC1h0V8ta3eEB3BxIuwqiavqZmK9Kv2eq+SAzW2K7q3LA0fKt+8bvcfQpEBxx6B6SLO1ekClml7
 Glk19V95hnyb68Y3KYvOFv7BSOBPTQDlOl5qOEPidORbfY0wrB7fCh5w/EG3LBQzBI+U+bDJ+fo
 4uIWBZ45IlekULYx4Zb9mWMvCg97KIj70aILUP2xktfXAATW3HsLfu+m2y9g//h64k37Vcueg7o
 7tpYVkQso0ui7r+1hI3LgmLN57QZk0iuO2jvbq2aKo1YVYvZqXLLH59Zrs08nRxknjAXZZEyqkI
 Eyt+7OzCS85S8Q/QmTOc0fSgoMNIyMdDQ9fY4eaJV8djYun+I8v8ZTixCRYsrLsbCdzwabZwJVr
 iwnLpFwf+pPhjqMo/7ZhFy1K+GnyIa6gjDY95JYe5hotGxyYDIh8HpRuIckyZzm7m+YoQsbIqFu
 VDnEijlFOiENO6LWN3g==
X-Authority-Analysis: v=2.4 cv=dOiWXuZb c=1 sm=1 tr=0 ts=6a696827 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=s3JIKy7HVgEvE3Gl7h0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2393,6 +2393,7 @@ opp-32000000 {
 			};
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

