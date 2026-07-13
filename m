Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A16335676A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971436; cv=none; b=mhwg70hF/TKIeRv2+2+kySG7tA/4NDczmOVh+A67mDT6fTe8C9HCN/PQlT+8mL6UKo6MzR4U9EjFNY18ican/f0m4ssyBI77x94UwrZwPibphMqWNUJKqO96cxESSZlUIf2fYhxACicXpEkTiJKUOXIiI5jZiYJWh3MEfza+nBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971436; c=relaxed/simple;
	bh=7PXb6tONCWiJcT15/yOyr3WnjDDS6peuFjileV+wB2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYS15fIYMPm12lHwRhYp3uc7Yn+ftmTUpNtaDNFfz8EADlL3Z2bZ3BF36LSZ702ZokzLhHplw9JJQ/doW9fg31owtD5UAQ8chU3Y+unvwLTxJVKaYM6Bm+wDEeI9UUNddLm9NxoVHAW3UVW73kG25pRsaT1zMPuz8SaKkOIXidk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJSZ1r/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlWbMlrA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJSZ1r/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlWbMlrA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ97T42275378
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvecEd/wRZ6RX60LThPvAmUEWLJBuucyCsoY96VS+rI=; b=EJSZ1r/AesPK4O8p
	VJY96MT8i2e/b0Ym2cjWZM4+j5esJ/P/CqoJ/wbDW6tyEKlFJh4xJgVjvrqvrV2m
	rC0F7jRwjF2bxA8CZ/W2H1psiPThlIoSN5X6/pk5//behP4/w0yUQYihTRPFx8tY
	huGnJAScCfw+ck58tuDlPjbxbKrOconGK9tgAy8RxgINKywHAhpSwcNhsmKhQEOd
	i7b13SNPCymgdQL5E4oIME7NxGj2Gj47oy+GlwD1oq0pYIq0rtHP89VW1AZyFQGT
	McZLOFzjkyYNsNBHUdwfvbu6zuDN92fpdkmHbp6RlPrABn2G2N8WkiS5lPzHAR3E
	ohTAGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p0hmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810960140eso3751941a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971434; x=1784576234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvecEd/wRZ6RX60LThPvAmUEWLJBuucyCsoY96VS+rI=;
        b=jlWbMlrA0Akqa5L3P6jp64op++9af5kRcMwZarXgopa01ujfVI/j3G3ljI7z0vGm36
         epccUdWq1J/2O8eLYGZiuwOJgoKpeNWArSjNwarhFfmetpLQCJuXSILgrOetW1l/RMQd
         vhvP8BX5T//qBoifa7X3UPKV99tb8+bsLPKkZwzAep0UMU10eJgemmA7WAx7sQnbT1q4
         NQftk7x9gdDfcPb4O3sppqkrnJF7NA+KRrDAvn7VJmbZC43hvOrleyHwcBP8OIxtvjLu
         lPpsUxjcRgOwEwHJ0YdApZWKARhR8OSYE6JpAhhAVppvGHriWWa3oc4zUXB9fwya7PJn
         1sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971434; x=1784576234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvecEd/wRZ6RX60LThPvAmUEWLJBuucyCsoY96VS+rI=;
        b=avE0Xtni+Vld6WzvBUppBLwUKpp3ODNBWfBMUGhXlfxoXlNAlj6nxYUrkw6m+cm8Sh
         T0lUhw/Oct8CAwbB9ScIoyIECEDn4AkWJky/QIoBRFiJ2w/iUvyP/ixg0UL+/C8F4+nd
         Wa5WF8040NvGPV7YxxvVlhsvIl0M25BzgMuncLZhYmTzH3soBcoys3uvjY6Kf8aVcu4H
         6g4OJ4uIwpBYSiBU2br02wkiUS41yZzjHRPFM7ERubsaSB9XH0GhThkWgBJMoM1QEoIK
         nKWDKeoRkeCD3YWI/q9Eo9qPo5GvLS0RXS6MdZ7tBiX4+3siyJzayL/IXthLBgLPBxCW
         LWOA==
X-Forwarded-Encrypted: i=1; AHgh+RqKrbYh0BVKXuwHG2FKd0Vx8XrL7oVTggo8BPfQwn0XlJAAmyOGyn2x6925jsKFswDQyzvLp0OjmRx0@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8Y7Lc2+VxrWs43Ww2BdQEdwr0eG3CQelyDNzTtsjprwi9lOB
	fB/JziVvE+MuF0AANVZipYBp11lyacopb8uiZ+Y3VwJs5RBrhCLG4QWc7eC+ZaiThT5MBuulYaO
	bYc78pazgI6HdHFALvRnWKMZqpBk0fhqTWOm8E14UgILG7Ald7ODsMhNbXlyS59fI
X-Gm-Gg: AfdE7cntBLqp0M+umB8ynHzBKsZzji8XmND8XUhNNvtOT4BCLKUuXKYPfICTQFiH8+m
	wW29H/rkyl6d5VWim8a2xJYXiS3MqOEw+FEq5zQ3nfsN7E9WnL4+Nt1YAPChD1lSRIKYJN+0LMu
	8bl7rajsyv3H5cyeOFY+/bqelWpv5gE/0LCr6XIYR+WYKXQW+6bowY1hNnjr/z3G/W9/G03FC0l
	wdLlmSPte8gkeM5DirAqntsRt1cMXo9rgLGWCYf7Pyk3qJMIePyZt2ZeiLq7CxmqTCVY5GJd3xa
	xdiKCjpr/SivECTL/t9VdGVL51DlMarcaYCnift+0Ap0kX/HDM9xDWagwy6WFP0sldSqmHVjZf7
	LagpsETHvc48wt0K/cH9cXwoMXg==
X-Received: by 2002:a17:90b:3911:b0:37f:9cdf:f0b1 with SMTP id 98e67ed59e1d1-38e17e859aamr339885a91.32.1783971433949;
        Mon, 13 Jul 2026 12:37:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3911:b0:37f:9cdf:f0b1 with SMTP id 98e67ed59e1d1-38e17e859aamr339864a91.32.1783971433488;
        Mon, 13 Jul 2026 12:37:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:13 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:50 +0530
Subject: [PATCH v6 01/11] dt-bindings: interconnect: qcom-bwmon: Add Shikra
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-1-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=1132;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Uv6ZvEASOaSSEeDU/bFl4MtSdU2PqpdvHwxUksopvic=;
 b=yrHF/i37zl1zmdrt3gs9W1sLUEm408c6jGIwoKDK6OzwLsIe01Vofd75p4l3joycXpAFUNsTI
 F9MV/qV2ySBAMDG7uOw765odE4zaf8YB3PwAfZy5FB6VHe0+UYgWP+t
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX7/VOTmLGnGV9
 AqAFN5BfJylYsvuZQuYlXuYCPTi4feJatREJ8ujdSGxA4TNfnrRlfl2Aado4aahPUK8ksTpnfpL
 WVkldSMfENnrW2Mztz81dGiZ0izYyH8=
X-Proofpoint-GUID: OMEB_sm0Mfa_n6dx7Aofsa9L_Hv1yyUc
X-Proofpoint-ORIG-GUID: OMEB_sm0Mfa_n6dx7Aofsa9L_Hv1yyUc
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a553e6a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xRFGNxSSmkLZXw3MVBAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX3HmWpvO9zcUA
 jeZU1i5BGVxWuxyWWVm7DTPef2k4POvIfVFweGYkGSFKN/5h70T9JhuadKZSHkh9I5IvJK9RvV4
 w1TTSplTbpF+ScoVr4pi6oey0mGsj/TswEQdnx6TKB1AhBm7HV0w7LIEtNGiQbpMQ2k13GQ3YUL
 aKDSmJxQdpXkF0POIVVOVtk+15IiXvlxivtde2jN9fBAllCQX2GFfVp8zGA2Vg07aH1kiEkcdvz
 1slV1pL1NBhs9YI7TpXMzvGqxr/Uz4B+UcA1zcoStmnpdVM7rJUF9TKpl9yL/5x+W1BMktf43TO
 BSNkQSffZIoW9Phc9Mv5LsSiwnZmMVUG5qNWEQiasOMxJQeDE0XLD6E+TkYnoayq0MsmPbzhF39
 CP3SLFASD4WDvARDg2AANCs1gesjpGmr0vpYcHBiQROBkNZe/kmq1Lt4bC93GHwjLbCaTYXXJiJ
 BV1lR1kxFh+rhLrHVHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130202

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add the Qualcomm Shikra SoC compatible string for the CPU-to-DDR
bandwidth monitor. Shikra has a BWMONv5 for CPU.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index e002e70580f9..7474193c59cd 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,sa8775p-llcc-bwmon
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,shikra-cpu-bwmon
               - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon

-- 
2.34.1

