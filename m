Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285CD47ECF7
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525191; cv=none; b=NYu4HjsLgUAFugFwiDIVqLFUeDR019I9um/WowI2mebHyRv/Gnc2GZapvcH0dZyw759XdnFEAhjIe753BxctHrLHR65Nq2j3GeWLP4uLDPWJXoMmc2tgn99/JNIMwIR/bewe89Jg+ypVvsYHKa/RuSGywKU+nqCNRw9NvlmEutQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525191; c=relaxed/simple;
	bh=2WQZO9iyYUTAHgUztEBao5IyZKOBUYJ+VfnKcDvPlrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rstVy2/zPRmfkSWzgZibucuOida997kVVVZ70q8qkN3BKXQhL3Y767jAdJq//zUlZypY5tWaaMz4V8lLDSps6P+2tHJW2Sb+SylHnvFNNy14vOX+Q102Sd+wNsWN1weUDCCvFH7lwDY4dGWSpG+XqiLmfLSUDO2uTdtBNEmeq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVrBuv5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Etz0WNsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVrBuv5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Etz0WNsN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIcuVC472889
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEl0Q/KtLX+7iLgYwaqoubsfIcK7cbxTLVO46xMCJno=; b=fVrBuv5dfRyyeaDM
	uBmx4eI1jocB98nPkdOyNdV43NXaizpeK7mywiLdNRiD1Ekj4MJ7nO2zBKBte8HV
	njipj2BWveI8Bn1v9q9OpDKlmwSjtaCbflEmtgRtVvxk1/RoatsN9pXVM9Re87S6
	LhzK2yEQBHnBrZIzLJ9c3kF6g4vqjI7TvB5RoRh86uPguK60mKY1cQg5XMM9TdmW
	AT33eoPrX8ZcLKKXpPNuReFgksdvHt9mc0Nfyi50cZ6dCyoFbhwMRNJZq/jYcsqc
	rDXUncf5MzPX8V9GdnsRty5Mzz0o8DMEOisMvDbPL5q1DuFKRztH81J+RusXHa5c
	Sm+odg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh1xfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:13:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so3211760a91.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785525189; x=1786129989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEl0Q/KtLX+7iLgYwaqoubsfIcK7cbxTLVO46xMCJno=;
        b=Etz0WNsNtGiGVQipT+KxqP2wKbRmw1vZb+LwKkbipgmmcDK4JjRdltwXfo/ETxJ4Od
         fP3XLmnv+IbcGB1GymhmPvEt+BJxI2MgBM0MUZN+lylz7Mv9KOLC/zv38CsRFAIEpsqa
         FVSCLcykZiwCtmSdZGfOjL5qgXvr8H3/gvdxz/cWPK28qgLKfuXegZ7LU4Rj60aOVkzo
         0JLJSBp0YrC1RtOgvbgNUP5b9XL2EJBvTLy/12fFbidpVBfarklHeCc/PhEdeDJmTFhJ
         zi7sxMtviGcYPP99uJbi4R0yV9q6cNjgwLZG1NES7IrwXglZ7xdKyRNZqiJ2zf7x/DmB
         qKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785525189; x=1786129989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEl0Q/KtLX+7iLgYwaqoubsfIcK7cbxTLVO46xMCJno=;
        b=eQw3sgL7xNqhDu3ZacIAjh4zbyyPMY/LBtfAEDIfrcoFd/8CDvFErUFQ5EczqM/uqk
         gjRtJl1ruahEq1Mmh0qsWM7ubhduVTTA5r/thEzK6XU4zCB1G9pAvn3OJIPGcR9Wvp8j
         sznSS2CAvsIdACgkyPqYuvzIR2hOC+ecqEMSrgnTWNS6+/eMsgagsOCyLZMzk4hM6Cnb
         iNU2AsFMNqs9EZ+ec0tvppsXwXCaQZgBF20p5iyjtcd3RjQV2EdHlAkGS+TnJlS3SBzy
         yypAljwLqb/WZ9MOhoqmbgPX+8kcMtEHRTJ7HUcxgAPj+KmH/cuJUhdtg5ACJ6itUINh
         FDqQ==
X-Forwarded-Encrypted: i=1; AHgh+RptJ4WnSZKCFjhaeDkX+9EDN3W7ejJin1aD6qC0gU0F1+aGvN1PPECblkthru3rMDR20uMXRKoDrPFb@vger.kernel.org
X-Gm-Message-State: AOJu0YzNtvU4AkK9+7oJPeE4iAVAKEaZa+JFNt7CZxnX5Iy/x6aXGhMT
	U4GG2v0Ub03a9S6nVtMJ5Jvbeu0rmVSbzZOJ8ZfJY5FAKQZeV9FzzT1dUPeFN1cdenHQR0IqNh0
	ofqz7OrcuIZ+czx+35gDGoSBQqgqZn63WbY/wfwE7sSTpeWQ5dIU0kTSpGUCUSBMc
X-Gm-Gg: AR+sD11kJj1k0faXELAxEA7oK8gc9ovxBh3wH7aPFck/rWl2An34rob/oJ1SAePRuvV
	JmhrdbdNSRAyubw+XsBzAwuH1dRyjFAZ1jcxH80vHFv7Q/iz+o3ciCLq3tEpVbJn43BYCO4VnJh
	Ot5lfX7ODHLd8teo5utWvXaMNMZc3oeSeRSk8v3bUCTUskld13m5LafL2TyJ1WI8WTmu6R7SqKI
	gUtVq5JSsikqeC4SyeqVQy7qZaMrvJKoQp/er4s/qOH6+PAUDqfv7siIa3gOIohlDVfZ82Hz+Ls
	qGoLF/B9WrT7CWLrYWVpEEyih/vr5oyKcka+XCdBNeajdszB6tVIXhZVh/ZwtWf75Xa7Vw/zbqa
	blLCd2YElscocHcZCiAmCtdQ8SgEnfkw=
X-Received: by 2002:a17:90b:4b8f:b0:38f:9b7:8c92 with SMTP id 98e67ed59e1d1-38fbc5607a7mr847808a91.34.1785525188861;
        Fri, 31 Jul 2026 12:13:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:38f:9b7:8c92 with SMTP id 98e67ed59e1d1-38fbc5607a7mr847793a91.34.1785525188500;
        Fri, 31 Jul 2026 12:13:08 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm4945869c88.11.2026.07.31.12.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:13:08 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 00:42:45 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Maili Graphics Clock
 Controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-maili_gpucc-v1-1-9d8c37bded69@oss.qualcomm.com>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
In-Reply-To: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfX9pXj2CV7t0NG
 VLue8/W26HG6uWUhg50+g7tvGgBS4NfjKvbeP1pBvTnVmfRuj6HHHsbYXaaBMAmqA+vtdYcc0lK
 OyehmA4Qz1Ox3Pca+mJW0dxGGqHhd4OrL6UcP90SVwqQBL36e48EcMUkdHOlaLQd9uMAWA++WJK
 SwmRjXvBWnQo6/07EtJbVhsN6Gb/p8FKTSWJDIBI3RvrBEZW5wjM8ftwf9SfZUs5YH0i4ELSCn6
 vqa3RImHCEOF3BCTOZfWPcP0naLEJvJX4PM1t8Od6YU0T3wGuDuAARQjal7up1nICMknTVNirRE
 tlxUzb964c5350w9ztkfmB4zNm1XWH6cbYU4olPDUaWLDfLool+IgrLEhmDWgACYkECZ6i7ma5y
 IqypQaMa/JhjpkuQYPEE3Z2iWSGYMTk/FpDdXUful2dsUEpHASGQZdtu3FZ4MchfMonhWHBsT5n
 mR6fmmp5tCgJLSAgBmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfX4VZobltsj7QA
 jxVc9NOmAIOP53+bo5gzgSvRp/leYtx099R4dt0moFlt0ANbgiiN5p+p2SHTPt035RuLG9aEvs2
 EVJ+rX392nG8kn2B+L5PJK/cnL1yG5Y=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6cf3c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uNidFYLHKZSrdiSmO6cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 6F_1Xt78EDEmFzK45hprQCdITc8WGcfS
X-Proofpoint-GUID: 6F_1Xt78EDEmFzK45hprQCdITc8WGcfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310146

Maili gpucc is a derivative of Hawi gpucc with pll0 configuration
change, and hence reuses the Hawi gpucc driver with Maili fixup.
Maili gxclkctl is the same as Kaanapali gxclkctl and falls back to
it. Add the compatibles for the graphics clock controllers on the
Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml         | 4 +++-
 Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
index 3e40bc3c061d111620a988ac148861ffe9b18b05..b7179d53166f8c72bfe59a290d0e5a406d3f08ea 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
@@ -17,7 +17,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,hawi-gpucc
+    enum:
+      - qcom,hawi-gpucc
+      - qcom,maili-gpucc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 28b653f6b64d5ca748f8d77f01a250dc0a3101de..94f84d5294c6df8d8c7ac28c26a89a27ad1b8ebb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-gxclkctl
+              - qcom,maili-gxclkctl
           - const: qcom,kaanapali-gxclkctl
 
   power-domains:

-- 
2.34.1

