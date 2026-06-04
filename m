Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E773BFAE1
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550806; cv=none; b=keuWr6C8hWzBulr/2/cNHm9KRoCKGux2pmwhzc5YVVSG5rifspdchnufx0rzTNtqv7PQrAc8eMsSxH9whA5KHk5aPPzNUV868GgPBDCrLXpxkhi97aLM2CukzQRuViLsvNLdsmqmbllpZ8lW22PUyHg3TPLebxKbNXyMJxSKNA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550806; c=relaxed/simple;
	bh=Q5+uO3LW2fHz7K6MzYEBqR1TRxqTCEKCt8vYU5DOE7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmDDJV3GtpLFZxqz2fgC5b0mXrQdIjgmYodimJxHJMLWzjFxLLDRaDOtULOGhLop7jcUIukMrUV2y3lbdsIHZgqqXeNK9WQDmvDGYApt0gq8UkjqulY/fyEvMma953QN8MQ6sFyQZx5Nwbkdc51GWnqiA3Xy9UZHfzpPRCazCuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsIiTMfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dE69F1Y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsIiTMfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dE69F1Y9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JZ2GC1039359
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 05:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=; b=IsIiTMfhGPWECGDj
	w0d/K9g3hGHlcZ4XdwTMjkTuyO8jegjOmNSmqXdOrblKErYITlOjNI6M9/w+G8bt
	kszMJgDqhKNUuDOKK5fxF5S02gQkmbBz4xDb0HQU+jWCdM1e2MVi2x/Qhz5MPUtb
	pkthGCuvlVaWp0vYTEhDh4jJvoMpMDqMwmID8WFaJd4sJTFIsZgCEviDAxNZ95dl
	yYZvwX4CHe/qgwPG38y4gxq0T8vxOKbpmpKGyJsjB1f+08tFpq/GA57N7P4pi662
	oi63c78Gn/1k3EABUBKv7MCTgrKhg5GX+gg7EQJQNSu0JuRnwBH+ZB/f2EGqC7N0
	XJvTyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8hs76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:26:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f424d5bso255776b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550804; x=1781155604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=dE69F1Y9aG/s8VK71+ls+hFgOmSJqXxhbIuOCskcyWufeI8Rv54yyl+6hNAm+q8xJj
         Ja4BzHIR42KWhJw1X/18flveTgjJmrLf3r/m6JAJMmmidOiUk/SH6gWiICGwzMrW61Z9
         +bFEZhlfy6QQp1kNJGF28p39TStZedYmojY1QvN8iZ1iqa9CHAWi/adjhQMX4qjqdaOw
         7ftyKSMa/d4nDiEZg2VyCn6L/2TN9qczQHb1MyJN11fZTU6CHnMCviawYt4gWHnp3SJZ
         qMfQH2kh+essHupiDaHyeIAF48LPpHeJ3C96C8HF4vrSMJVUnxk6UjJ6G0LBJAAdr0Es
         ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550804; x=1781155604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=FYxmXoTM56+b+noFMHXgLlW2HUolOB7ivR2Blt5l4yMwe7SKNrm0Q6LSb+g3+nJYqu
         03sAJUQRem1a6byyydmYahZviWX+oy9oi6tX0UfAuvkUrrHVtjH+5L99vX+VN/LeNQc3
         Y8b/rJSfBIvM93nET3ivPm+ooF/LcLnRxmjG1tL7DOPTza2IYcDYZp+WR1B8LxlavF4s
         5dQK3iskdTYiaaNWq0RgF/f0/HfY1O8APQcRgSJ7OSd0gxIEXZ+HmO6VesSlBFdNpCYk
         8neHtb7rCIUyDbC5OqVrFcjfl+QBYVmBedaQpnOfDeLBBJOYomDFQ5LwJGhwU98p2Na9
         P/cg==
X-Forwarded-Encrypted: i=1; AFNElJ+HRSDSBCfEzlck820p+2e2XlhD1VwSz96xlkjHN9fa868GkeCLrMm7Xp0SO2ld5RjIuu+akHvj3vMC@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYCGIjcTO/ohUbQ16L7nhU8wRw4phnSxuiNJZips1xqK+0srI
	w5ws8mW/19y8RiQQYTExWtOnMZyEWYRz2ubvAjZxEUOXyYkOjhtpU+tn6AwE9dM9y/ObLFJV1ll
	7WB80GiNitha3E3ipuT/SBWRz+muSrtU/UicSH6HnI4XmyKGVK5A4h8md8Ue4RB5r
X-Gm-Gg: Acq92OGtWOvS0lrSqxTh93oGI0xFuzg8BJC76bjmiPO5GuUiafHCt1VnOB2RPL6JLUl
	frGevTawdxd9m2wdr7JNdba8bxhfnc0uBtOM+y3ATpMZI2jxB9cFyBNszzS+4Hlkw6bjq/lYsVu
	Ba8zdNJ77yLVbreajFNDitWl+tcTwRk/ty1D9OqM50MBlc5h4IGMacJOZiRvIbCCA43y8uB0ZS9
	JUwFTLvbq5QtUTSTGXk04V1MomD+r1el5jtl7OZCFSH9kg1bLNbHz8Los2RMoHVn5fRayfnLbzv
	HU2v42o7RSrOfoO4bazOCo3XGMWIQYcHi2dDs5s27kZHJtg0DIAIzxHuY0LLPMlKeQNjITDy020
	TkpxuoQQmlT3K9clD42HrE3v9fbdjq2cT3RieR+CuPpvj6b9qyo4DYQOFtDW132E=
X-Received: by 2002:a05:6a00:139e:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-84284fe7c61mr6194780b3a.44.1780550803643;
        Wed, 03 Jun 2026 22:26:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:139e:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-84284fe7c61mr6194759b3a.44.1780550803185;
        Wed, 03 Jun 2026 22:26:43 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:42 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:09 +0530
Subject: [PATCH v4 03/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-3-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: RbqSkbNOIvBaCrAgE5wOA-u6OIpdbxrE
X-Proofpoint-GUID: RbqSkbNOIvBaCrAgE5wOA-u6OIpdbxrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX1jvJfQgPiSLE
 bjirQ9ZGK9TmmmDylT+HJrVfHZZODxgtxEcaRQPn7tnptGrrP02gUyjFzNbNmYdoIc5WgD94BMH
 l2zq66NBvY8gZL1ojKbb8LtXTsz05Nuw6cNAsYoh+8bCYbutrQO9Js8rH0CpZ2MHQ2O6YCFtS3J
 rhUUinIEmZtsfhVp42E2tK/8uB9zaqsYoRL/USZrqxf4IU7V+zSsH55lcifLQbg73xpOnRxYBBb
 ncLpze28u0T4l/wUiS4Gyzfu2/STVbJJPrx6wvCJDTFNXgiaCYHUjIQOtTik8vcs2CJl5b7TjLD
 4sG4I8DWGytKkCUY9NYsOlq4XSkGBvTX0IGb1GsTWTaiOTeHQr0Miutc7wouIaDJvIzQY9icAuZ
 KfZ0LUCxP6U/sKZul+N6CJiQaey5xgpJoNKptVpZA/lnR54UY0+G2Z7fXvLRuFVJm9IDPrnBjk3
 lrOWX+8NnhtJh+D+Ctg==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a210c94 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040050

The Qualcomm Shikra Display clock controller is similar to QCM2290
DISPCC hardware block. Hence, reuse the QCM2290 DISPCC bindings for
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 24f2cce033f6e109b65a79553fba5295eb9adf3a..5cee033f2115deb392fc1deeee8d5aed4cbde052 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1

