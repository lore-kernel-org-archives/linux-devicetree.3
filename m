Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40272339719
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067685; cv=none; b=iFmAfBgVmFcIQn2srWl8iZQjg4Kost472ws/RpHa59M8OCUQH2KsJLcM7IJAufP/M4X3UjDMaPsdHMTJkklMlAo+yqS1Qmlr5l+ZG5r9bYFHwVD4W8aCoSjjsu7n4vIV3NkMplZqgJ5TuZKqzSEaMJncwsB4ghhJMwfNsINT8EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067685; c=relaxed/simple;
	bh=YYqifraEzFq8eN1gIxEHMMpyvNsgxXs8TV7wj7b892w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mY4Pxl/uIOcr8E0nXmkNlV08tCqETLKgkYaV6ySfNWVKAAaG3JaYg0Pw0ke/zAsJJKZhTpUImo/8yOpRbV3UYYzf8mLCvooL9mYHCzxSWrIWIrsAqrLDqmwuNtOd4vWMxeG6wVYZiBscXwJyut71SjDbHikd//KrURitrFeZZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPOU8Pbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZyv4Sed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPOU8Pbj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZyv4Sed"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s6LV3110488
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jxNvCrjuH9H5uETZtM973jb+mipb2zMotZk
	DKMQHYpg=; b=QPOU8Pbjl/OUCmCmWgl2iap00bu3Gp0zmk0XO+eDcYmmG1d+4As
	h9YDiQejdT1+8dD5Sq6GrZLgNGIC5CBiCDL9VluNj8zdQIw/htgFBgHQW20juQDW
	vvU8/GZWSP+4LFYycKoZF4KgAakzf3vGrKb4pGjIt2cPK56wTyqueeZXOmqKKo+I
	Tx3WZ3OQU4Jcc7EDe8Q/N1R8behOKeg/2wMzl9DSyUydjY/sPrJYoRtRcOXCdJrU
	+cOA4Bv8xGghuIJmmmjsryhRxqxfse2QWIkF1xOhwH1SKVY75YkARcjVpbPKOzb1
	llSgsLqLj+BXFyCh1deSL5zrNkx8DOdR3uQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eya4mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:34:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fb9d7b524so534833a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067682; x=1783672482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxNvCrjuH9H5uETZtM973jb+mipb2zMotZkDKMQHYpg=;
        b=ZZyv4SedZVQ9Enpx7d264kesgogV3ybW2MWihw9H+IWmRHobblJ9w3wkNBzzlnHPGY
         kW24hr9mTVml5GPNpb6+gvR1filBmmDDEWC7jSeKz6VAKtRiUR3bFcrkbpVCGnbdXfup
         E6UFztuqGD2vmpIvcE8qV+EclCLnNE5olFIlhQwYZOvTc6BHCYr5OzhyY83Do04pJfZh
         qLbx4dKrMihb7daNZXq2hgV6jMZu216U0vR+vVko5iz7NQuoHGYoTsudVrSmF0dzIq6U
         kqUJ05hyd+Lg2XN9N6aqYLge4qpIooS1cBfddZ0V/+GdbpS2nreXJlbXGroMatpEM96Y
         vgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067682; x=1783672482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxNvCrjuH9H5uETZtM973jb+mipb2zMotZkDKMQHYpg=;
        b=ko/b9draeWmU6P4NV0M1Ww3+nWueDaM0uXcg1OPmemzZ64J67oOtYOGnzU4+EIpvOv
         HYGsuO7Mti2Grj1jO+nwt+SO2buF5NxG7M5+aH1aps3bZz6pUGp5soV3i9nrPV2Al1M3
         ozmTtEJrTNeAgVfCI4x/Vb7AJbiQBcmwB53MtBBLgmp3zlalNCKFqj5iHmgtuIxnc8hE
         N2JNublQUQs9M4PH5hX2JFtPvC5m+MLQw5dJ02xUwKgegzh3tw6DMRuDQxP/E6Cp5PeE
         jZECfixNvdmETLKMnfWAG1XNuouHYQNFBD9VmTBlvU/p/pyUdy/30EIKZ23E2+ZrJBhz
         ji9g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Q5MHIaZfRg/eDrsYQo0VbhuuUvewWRTog4dSZJp+gROlypdgyErLbkDQMrB8gYdI/P+kbJLizSt0@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7aLJBw3BepJS2pfNPjnqOIzFGDO+ECWJYU9hcGBNnm6GYQsr
	tyojbGuNawQNfMj1yFXAfW9TIFqkeOGzWE0SyPxdVDDDQZw+2WdhxYbkqLokuKYAvd1Y+dVeLIV
	aL5jyDcSHJU1Uge428ASG9e/TGbZ8fLioGVH9tRfFliH1Twk+xOSCDCJ9J13cTZJy
X-Gm-Gg: AfdE7cmHQQUcl5TjWV9aZrIe0oAhj3IAO10PE9g05FAPFvkjuRImnSVsn8b4b+w4hDP
	G422GEA2svZnLHwDgINoTV1vynVwx+hMFprUjtfsW/oEi6y6tFNLQTIRuZnN25gGH3gEA48pDXY
	+RKVQXmZcWD82/xnequiZjeTsbR+16p8Vp1lTB5WO4fyEdYMiRqmFgwIutAMQD8wy4Y/mkQgWT3
	QeRwPn+faYCUdqly/TPfVXhRfmW1oQZeJgORoOsISIshwwcUf7bEatJyU2wt6gA7FeS6SA4QStO
	W/NOkuaAPHZ8F3QTPsFy7GguX5FKl2neqmGANss38oE5IaFEAL3dUTqrH0t5EQaCtniO5yi5gYS
	8O72fp57uYdiIB48/XEH0WLxblVnZuHQc4dKGPV2F
X-Received: by 2002:a17:90b:3e45:b0:37f:d27f:5186 with SMTP id 98e67ed59e1d1-380ba91d167mr8733573a91.25.1783067682166;
        Fri, 03 Jul 2026 01:34:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3e45:b0:37f:d27f:5186 with SMTP id 98e67ed59e1d1-380ba91d167mr8733540a91.25.1783067681667;
        Fri, 03 Jul 2026 01:34:41 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm18797839eec.2.2026.07.03.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:34:41 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] arm64: dts: qcom: eliza: Add audio support
Date: Fri,  3 Jul 2026 14:04:19 +0530
Message-Id: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfXxmv6ti94oKgC
 6VX9o3hZ53qxjlY/qdEgMXkU8/wx6JGV3OJdf9Cc71frTu8eWklcnNtLYZQxaUKPkpgfYgQ3ivU
 nHFYvO9uuMcSb74VA/+F4lSNfHhpRkKbreJNUGzLBFXWQFBmMqdVgYUf7Bwggh+jGcZZFkRzX0s
 5CQSLI4vOBYDE2LYcJhifR3yfjjO1v5LA4ed2M3G5R9hzotrzFEcg9nRbildRCs39AEQEUf6rag
 ERrLVE3xoqAePvlrDaMfZK08c2Rz0qP/f0PZl8qMFnreTUoRZl4O4IvIvON77ZZ4OUj7n6ZMKkA
 WKjKEn55R3ySDWHMtIKGtW5swMaX0U2IQmyPUJt/kFr1D3nNWkAHDRFM9tCNDQiTZp5Hgzo55gr
 d39j2cxCEYk0eSrmzRkN6hxufi3npmXor8zwq8/kMkGy2+KsYcwQoCR7+20OGjaJw4/9cXW+cKY
 VdS7aCuffryE/V7GRGA==
X-Proofpoint-GUID: XQbGQ_sX_k0NqGQsftk9BE4kzUHSr2wy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfXzfHpp4/DiolC
 7ZSHg8TJUkscTAramlbBvzZaX1Xx7+RkpLZlf20AuYmUu/mMct9twDR0vwq5k9Xy0ZMOBb9qDQN
 PwYdOGXEqrZ7SqJZpstQKehzNtMU67k=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a477423 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=h2ZIktL6sUqn7g4XYOwA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XQbGQ_sX_k0NqGQsftk9BE4kzUHSr2wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030081

Add audio support for the Qualcomm Eliza SoC and CQS EVK board.

Patch 1 adds SoC-level LPASS WSA macro, VA macro, SoundWire controller
and LPASS LPI pin controller nodes to eliza.dtsi, along with DMIC and
WSA SoundWire pinctrl states. The macro and SoundWire nodes are kept
disabled so board DTS files can selectively enable and configure them.

Patch 2 enables the sound card on the Eliza CQS EVK platform, including
the WSA8845 external speaker path and DMIC capture via VA macro, along
with the required LPASS macro and SoundWire configurations.

Ravi Hothi (2):
  arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
  arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with
    WSA8845 and DMIC

 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 156 +++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi        | 193 +++++++++++++++++++++
 2 files changed, 349 insertions(+)


base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
prerequisite-patch-id: 7afccbf2863f25c18c4ccebd721defee1f84325a
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53
prerequisite-patch-id: 84282f8a368672c3f0f8944c442c71713cfd7390
prerequisite-patch-id: 84db6b0611553825dad5b2d6311bcbd840d75a2f
prerequisite-patch-id: 707f23d1ad401ed79c1a2812c294cca66fe9d9d8
prerequisite-patch-id: 9cdfb1f97205bf64d207cd98891bcad4cb841783
prerequisite-patch-id: e990c9019a8c5bafd59a75ff9829a0f0f7350239
prerequisite-patch-id: 15da7545070f556b14e772424dea20b6f012dec1
-- 
2.34.1

