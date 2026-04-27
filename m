Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43D3DCD84
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314209; cv=none; b=ljt5TZn0AHhkd8S5IWQu73thaq2938RYh0WAKKgy1c929xwXu2iukTUiXnmZQGvxuKXg0A1Qm/fpoXk/Zm+otzdXQ/7D1wrb8PzgqJagEc0PEvGx5tQIFgJIHR44pelItSmufsNo9AiTDWXKobXwVlWvRFSF4YhR4ksBt8DqWzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314209; c=relaxed/simple;
	bh=YkWiwMK2UL7nJitylE4MB/TTR4aYYELndcelMX3Lh34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nE1C5/wzuxt5EZMBYtcfCpjJW7S28NMKAJ3bmMWTwhETFieAmZp9KwEUsTSboV1DqG7nDegR8zZI6nwuUGukHFo3sOGggZpAiJjDM+SLnnuCDAu+9wxdBJ/1/oWZasv9xISZD/JFtI/IUAeBk/PafKHX8tq0hErHaDclXHIKrEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDbuKv0u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3CedNts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDbuKv0u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3CedNts"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDx1F92914474
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7gtoBvIM0vtUEFDzhqKijfXiWCi/e0CvPeg
	0D8zQXCU=; b=HDbuKv0uptQWGIjR4a+rPf2SX82MviCTbDH8Dlgr89V+w04+iXq
	0OFlBBumMYwN0M7sUXTkdvpAdagHJy+kpsN/0a4dGy1A5KFwLvXgYpjQRu8vAobC
	F3htVrjqEysJovZezoWAPN49u/VNKlr08EhM61h8GWTaLFD8d1P1EhXtJXTZLBTr
	P6iad2IY43xaVg9Iv+BmjDSQdPfQvAL9HXQg9hTwO/A1dOYN2siGVLn4Wd2r2bTf
	E1L+AiXaHm9/KC0mn9QYJwMdYkBgbhJkvqadtyli2fduHAiIFqVfLWpOUwyn8kYi
	boXVuFc5zB9DG+BECM5dtLS2NTNKU/g2myg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xjtt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:23:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b79f4b35b7so45166335ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314206; x=1777919006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gtoBvIM0vtUEFDzhqKijfXiWCi/e0CvPeg0D8zQXCU=;
        b=A3CedNtsyaZwpepRufyNtsW3HmEKPLbPuh4NIPmPxfYhTd4VlMZ6eEIA8prEcUGD1P
         AeEUicuITo9EK4FMl7XOxP4baGzTq1GiGJIBR2w8iMI5S3coI6Fv8AOLLcsqdYG0y8/w
         JbfqQIQ5q9vhE8+cYbD2k6iJS7/luEQXtLqGoKSR9L7mvKL8nTR2zElCDwqpk7Gxn6q0
         IIL6wAngsfUliRrS79z/hheASy78xkKbfNkh1SGGB357pm2U1r3Jp04QN69QlC6+zTxk
         h1bsMUqMYCKOT/H06EF9d/0ZeNvC8f9no98sOhp6M43RXiTgNgNXb4ggC/UWGv/t1tSY
         IeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314206; x=1777919006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gtoBvIM0vtUEFDzhqKijfXiWCi/e0CvPeg0D8zQXCU=;
        b=ApdeC3YD5VX2HNqa2tBPIgRfRO9DgJijxLZutFzzBECp6rdk9EAXwM53sxFC5ZehVQ
         /rYX6rNiUF4UjKolUTDJGKlf8pq53t65UJ5ZFPhMEHNToU3kvrZ6zPR6MFNhUwES0EIK
         helMc81RHfc2Psrbp2jdY/p0Zs2l8noOKEqHwjywAOlEn5CnMvAsb2fZ99R929hokDX2
         FE/1JzNLNYywwc+0n4xI43uNjxs3zpO87372u6pCevx7W/gd3qbu/UAPwz/mKvRTWFJB
         5eMSeiWbLh256rfuoQtUxSb0D/5T9VldC2OGb/8H2INeUqnNPJRHHgG+GY9yK7SuBdNs
         99Jg==
X-Forwarded-Encrypted: i=1; AFNElJ+XsZSc8D9YQOUg4mBnF3Z78z0Zg4ghtrMm73rPqzNN/5T/fw+ctE0nLGDetKJKxioWIgYTrDbVJC3a@vger.kernel.org
X-Gm-Message-State: AOJu0YzDjReMhOeBMRMLTTxZ5tKY2Ps/TxFR/9cerN+l5rOVtMykNCbP
	De94Tb2tHO/wSKvhJTvYNMK2qPb3x+oyChOUx9FFDN4vafTBcJPjOUmkDNEHxoSEi6kRqr0nHJA
	aadapN2KoDuYndgo5A9m6QTX5SILbiA5yCwddveH4sFXuq8B03HpdE10nwgx9dpkc
X-Gm-Gg: AeBDievo7eU9NBlgDQa15Wp3Nnd4JEHJKudlBxq5xqlgVt94cclsbabIxzjL93DsGif
	C7x+sPjMyP+LEUzv8vt3NyF3eQFnVoGcrXxN+9svoHHvznri+8oBcjYw+sJ6tB7RjR5ha8nNGbp
	Gu0zsDBD7oRHXRhHV1kJ1wSGrxbMYQq0y+naFVUachp6WbtNKG+4Fc48j3e+wEMeVuN26AaA60s
	c7c42fCUoqfB3yl6+fAyohFa1AGqEt95b7WpfYhuTMT485dfM0dZ+7Y6i1ZRsWllZgDuXPXlhWb
	e9F2FtIKxteINNqXM5sWdHhpblDriZhInOPtn+7HlE2aIU4iE1ASbQSl5JhI4rgZBEYY4yQ65cG
	qpNrhupgZw3EEOd6eMkU9yvcUvNOrPizg3sPxiyo2K6btImQ6SpNcQt4BBys=
X-Received: by 2002:a17:903:1a2d:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b97a9336f0mr3015455ad.21.1777314205605;
        Mon, 27 Apr 2026 11:23:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b97a9336f0mr3015125ad.21.1777314205010;
        Mon, 27 Apr 2026 11:23:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8d066sm1224745ad.67.2026.04.27.11.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:23:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Hawi cpu-bwmon compatible
Date: Mon, 27 Apr 2026 23:52:55 +0530
Message-ID: <20260427182255.3649922-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4niITqax-4iqxNaXMTu100Qp90pdgN1H
X-Proofpoint-ORIG-GUID: 4niITqax-4iqxNaXMTu100Qp90pdgN1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NiBTYWx0ZWRfX+fmac9UJF0Up
 QOTSJt2zffIsSClURlTJXWXHJWHIIcK3U5iu4XF1YG9O2oiLteqfEAuDRqh6h8vDulwHXCwKt3Q
 gFVVuHNsUVW1ToEkBO7BDFxeDOZWJpOytD2SPD/Q7e2LuUfdeTt1dn0bPjpnb/fzBBCQJZr8ayT
 R56ijxQv40Xe//HlC/dm/4zgbCMspPC6TpykpC4q/k60qEgMBQojCzjYIhlr9CwqNSNpMraWuxD
 PMkgnDGnd2zKUXzRFT9DLG0HWx/kJ+CaZrSFMk6D84eHXQgXic0745aFJOuGUnDEk+i6T2mnoQi
 6CUNP2fNXsP/4GsfRYHj4tkwer8+rmkvhDyLF7FdIC6u1SV0Ktnctx4SoD9xUAMNmRQ0R3zbSj2
 JTygXknGAiOTCdIW+lWt78+bfVC1kpBsxitLUbysof+5dtuGJWc7LWJjMaxu4SXz+7llmfklflW
 5sWScCn0j9IuqBl4SSw==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efa99e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fFZ-BlF9OTnTLI8sbqgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270196

Add the Qualcomm Hawi SoC compatible string for the CPU bandwidth
monitor and there is single instance present globally to monitor
the traffic from CPU to LLCC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ce79521bb1ef..82b1d94d3010 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cpu-bwmon
+              - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
-- 
2.53.0

