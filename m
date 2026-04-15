Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3ED3B19A8
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260032; cv=none; b=uaeOSVRHM872sa9OAewBkHCYpuwjWihUwDRwSyPiDs2HzBmTIgQazTIjpegMdx5Y9MsVpSFpUctcVUU3+RzgGNSPE8QRhjTVpT43jMhdgnzJWk6xesXOch455NrM2ERHtSns5o1Klgw59LAjGiB7gDnoiJw54UsoRkBTL9BHuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260032; c=relaxed/simple;
	bh=jaWvwEt9ndPuG30CRSFYIxotCRFGMgAGMMUQpYK2etE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlRtImmGYCMeSe3oJrRdaME+F0TfsNa1qO3XREN0QzEhdDhrCs4kmjIo7vdOsE8ynMCOyqjDyYPTcxsE3ufuEdUT3/2Lcz2GAvpewGOe0KTEWpYYa11hYZcJI0IV36uQwn9AZATGuPk8tOMWxDbsMOgR6QZ2yJoSRwUVcKHIgN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3rfyK6S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUu0FoJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3rfyK6S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUu0FoJC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9QN6S731034
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=; b=l3rfyK6S14CBobxt
	M2QRtuwAl6XsO/3/kNwNegw1fxr6E00a6dMX3iSrWzAPOe2rlj8iN8ULLpbBEpXr
	2V2uyhFYYkTlLHdOzbEWwTTRtMTf/rpP7fPPM7IZ2eGKb28EKCriKSAa1U7WnTBy
	ugUyLF0z2A1IFpZuFPr9Mw9wDoCRIsQqilfPRO6kZ4UmpvVQpivkq4N4sWtjBk+b
	pZ8xAeQhi5NzuLpMeE7SaC1bGa9kg00S2Z2FKRmo7VW0MaCvSlCgMZX6ogLKBLus
	sNZiUNQoV4Gd0FoFtcofzl7O3ZAmVuq+KR1yUe/5k/fjYWgaeI83fnTvDf+FXyN7
	0S8aig==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruubwu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so4028013b3a.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260030; x=1776864830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=;
        b=jUu0FoJCIfbsMeH9SXW5pAJvYirhVPj9vIeNfQ7rZA45ZGxePVKxhaNhmVYdXgWR+i
         Mg138S6FZAU3nvA8dodimGejfjdPO5bDaCBWz/uILu2nbkTvd/dCpyZZX8EfxNjFr2oA
         h+nnlZsqB0f6v+u0fCUd/Unqw7foZySkUkHmWM2S+Q7k01ZPAS2rm0R/7EL04Wrpboq0
         vb2cfqby7yCcgS7kC/2UNz+6b/TPysDqwf3Nc2+1MADLQTJnQVVMPDveLVC7kX60hb0n
         RjC+i1Lx8FRSitfFmNLLZnl4y1Y9CuXJfqcGO5t+Al51wFv/EmVaHYK2nFJl9bplQkQZ
         yg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260030; x=1776864830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWRX77Fpbh750tmNmoRIzfQyvGyeKlTdaGTrYvncf/M=;
        b=iEWQubjFQudiee7jhjBGfJ9g3z5RTr8P4A4pWdD+Ie/SyDYludorlOUBXjSBnyyQvm
         j6vNs9POi+3cYUZoDSUKkK5T9v7I3WTTJHwuGUsQgwfklkPZddt/D4klxhaQl28sMDAZ
         LRz/JywRfBMSh865DiWJJt4Hy98sZzVSFV/MCKcNTZPBb6JTMQHJribDbIVTh36dR9+B
         N2S1sZfv9aKmBh61AYflImBuBA0HNeCGxfX7BAd8J19DVfGyrvGrNsUcR8xDpptDQh0b
         NXFwyKbkPengoMg7pnNzGqCRSzFI0aFYn7zkOTlnNCrNM0Tc0rN61At/GDAyVSUhkEIZ
         Px0g==
X-Forwarded-Encrypted: i=1; AFNElJ/Ko9zQO04rPsmgup9kyDSn49BB9Bj0Q7ZZi7iCW4k3ShsA99oeCUErBHMOelG06SNW4cGt5Osj+5aV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4v+yWgfM3HewtPEKacXNEMosTP3+NASOgazc5a+zn0NmSpEC9
	qQsXJAz6252bqRuqbGVILm2KZPg5mwrJK+z+XVxJBOVwY1xgkR185Iel3hy7IrM1X9fW053u7OK
	vss2FsXw1G2CQeQJYfBRc+umcImRyZekUAil3fmDZsuTjMouepegD9y22TL+G4YTo
X-Gm-Gg: AeBDievOdTVFBvhQALQoMvs0I+zO+YvbL5AeCv3w5ozOr5KCnXS6PGQ9UBUHj+xyJjM
	QTNL7MVqpX9MoObYQzqYi+DpxzJ06xxy7E6LlCeoyFFnKlCvlM3+5unfQ9bsWfqExMJ9Ev5dEdJ
	2v98m/6bhYypzCYZN/vRJqhjr3y+PIDOsBarMDHxOSMD6MnJfajzVgwg9Jbuz6kqJ+gRPImd3IO
	1jLgEVYZALEFsw9y69kKfNd+IEGf6+7Z76VU8H2up710OFwdFRCplW1CtLzqAVlc3JMYia7eStU
	ZvkWhJPUlY9aPxmIk4TL4+IfIumXiafoD+m1DAVfS5Y7lDqcj2Olqj9wqyp9TFoVQGUQYsB7MGW
	yBh4EtEWtHaNKsy5Vnv2J3/vSKB6a9MmjmkjUnmGoZRCWMRc9Xe3uP6HpQyjqZ8n3hDXMNSCYy5
	p8Jj8HUyHA58h8Yr3RpNjckDadPnwyglyeCQjvGR9R7PD0Pd6+S2jWh40k
X-Received: by 2002:a05:6a00:2a06:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82f0d3530d0mr19462540b3a.22.1776260029725;
        Wed, 15 Apr 2026 06:33:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a06:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82f0d3530d0mr19462516b3a.22.1776260029246;
        Wed, 15 Apr 2026 06:33:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:48 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:20 +0530
Subject: [PATCH 5/5] arm64: defconfig: enable IPQ9650 RDP488 base configs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-5-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=936;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=jaWvwEt9ndPuG30CRSFYIxotCRFGMgAGMMUQpYK2etE=;
 b=zjkiZk2sTrb/9BHcsPSY3WLlAPWnBr3E3SX6hwzQfhTJJEYfrStQUUiR/9unnwH7KZ0kQECvw
 nrBaNGo7KNlC+aj9RDJvv3a2wfq1yN7YRLSkBrsNSQKCUUESSGF9yXw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: AU7374jRdj5tYqiR7ncrtv2SXZzVs81R
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df93be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX+hHcbY/AZ+f7
 Y1jG4ZUrRcrtw4MtMD9nMaoG6p0ti1CIWioGvD4Suznwyoo3b/96uLokXal8mOTLu5DP11wxpvQ
 cpvwWhJRbEau34p2TTA3b/oez/7d5DtxxQowY60rOKyf7dvagZJPKEud0sdsbfJj0ouDf+QJIEA
 z6Mf0tgouwvRlmPXca09gSmJbYuKTdjrrT5r6b5SqvG3+y9TsBfTY0VqFyZb201rI+HTWFqNE6D
 NxOk59dNtaezxu0Oo50lItq3W6F+f1t0qXg3pzrH9P4cKC+HtATq4TVjmOa569i0OMLKT+sGTSH
 ZYBq7s9TD15Wz56XdFUCnFhbvyqBi4Mxnkp5DST/7XI1To3jY5p5+tVxa5uQP1aL3y5DKU48T2w
 Uc8kol+fGnq6Rbi7RopIIcQ+yye/QtKYuxTey04s1t1vKirGxCckjkA+l7yBnGlLPo9XrVkHh7t
 6zzqrlEtJ/VjGYM0zeA==
X-Proofpoint-GUID: AU7374jRdj5tYqiR7ncrtv2SXZzVs81R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126

Enable GCC, Pinctrl for Qualcomm's IPQ9650 SoC which is required to boot
ipq9650-rdp488 board to a console shell.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..442aee9d197c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -662,6 +662,7 @@ CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_IPQ9574=y
+CONFIG_PINCTRL_IPQ9650=y
 CONFIG_PINCTRL_KAANAPALI=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8953=y
@@ -1509,6 +1510,7 @@ CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
+CONFIG_IPQ_GCC_9650=y
 CONFIG_IPQ_NSSCC_5424=m
 CONFIG_IPQ_NSSCC_9574=m
 CONFIG_MSM_GCC_8916=y

-- 
2.34.1

