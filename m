Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5F248BD26
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045302; cv=none; b=gU0EsZFCUa1tc01DdQX4gIjW4MaMy9UzxsVxxYcCeY2ha65VUF/n5zVKcO3PnEZbdDox22E+q9atGZOToSbGGS0B9pH/T70tONxY4KgRJHOoj3zsNZWD+ICseX8T5Xa+gD/fdpEWVAA6BocnazvCFMH9q2fQ+6a5xG04hR5Z0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045302; c=relaxed/simple;
	bh=FH83gjvUcfIeCErQI65OdoWy/O1PNOOMftHP18oZ0bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k06RYWrexj1D4J8zhuEXOmHZnbL1m60CY9fx5s57IJYOZVCRSNn0okV44/zsUrAB1+4rLlkc4qk4rwRPEVhaCHiHWomQjik4FqQkhjZHvA+SqJphVa3lrUmM6CEVwKw3mH2kvVQp1au5j/9954zx8Xw+7mb8uIP+R8H/Yk5M0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxaDVQI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhys7Nc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxaDVQI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhys7Nc+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hH9244661
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qtG0cBb0lQeEd2d3yykjcL
	apyUMy4NUKgnPZ9aBJatI=; b=UxaDVQI1fEl+rzi+TQoMMkvl+kjpudZSfjbkm1
	FHgzkKYKLXOqJVJO5m3E7LlqepmMlM6xpytiIbq/Tntn3mmlx1RfV4TdySU3zXnN
	DpcZItzo4LgnaOn2C8TxVDZKLsqg+zKEFEzLAcRLDQ9rMPe4Rl/e0cHhVMpGEi11
	CcwJ3xSJtJeQFlL0B+c77yX5QLjXq5twH5XlwOwhTDQWbtrIFC97CQovx3htDnS9
	EmmrlmPEaHZn0WxBoi8CwdZAMA5s6kWhtdII6+vBwR3XngD4VMzIZ9aWEmDD2Jo9
	Kl/I8lQerT+pIQhzDBUBvR37YdDNm0WiinqtB8SVa4rplDPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfkyys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:01:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3b126c9fso72792325ad.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045299; x=1789650099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qtG0cBb0lQeEd2d3yykjcLapyUMy4NUKgnPZ9aBJatI=;
        b=fhys7Nc+6xnjO3uFQ5S9sfDZhjDwf/X6M61mHFlqMfdiCjljblRSBqxQkVAbyFIG6f
         qnkDxmSxtwoZa2fqwl3ISv5WUoHGQcxynfaSi+lnxDsDKrDuXd8Ij0KBvQsvchO6+pAi
         1IXQg2DuVBtyu+P7QbyGnFdLtuKdvUpOaXNIu4mjV78+OvQ0UqutYFXQrgIaaVSGC5h8
         zg84sedHakhxfVgIdu+QsKt6kNMbwGUIQ1pJcCYSGupp+XZGd5puxsyQmbneuI+W6XXU
         DAKjeI0aGq8YDgOXDxWJyVRc/B0XkRm3m/JLA4hFkvOv6cWoWniBgPduIPhgqIWJuMC6
         1N0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045299; x=1789650099;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qtG0cBb0lQeEd2d3yykjcLapyUMy4NUKgnPZ9aBJatI=;
        b=WtRucUjmuclcSm4funVHiErdralSNgbDuqgiXuxLHUx77hSjh3IkN5OEf7A8Dh5/2o
         /xma0s9qg3Y8NWCrpuqq6Irf7FAwZIDcuZlGacyp2GoffLc6CVYelsc75pfPLFfOH1BU
         idxGQBgNTAzYalKYiicAzM7cz7Gw6pqL30Dkmv2qP2Rao08sDoAimtoy3ISLyRImZxzW
         thQrnBLXAxkxABJo+72j009YQmqzVZSnB/+RSdSV6rzzxBb3tihw9UcRkyswf2lIik1I
         yqfFO6rdQOv10K/WbYC0iNeLfxBB0HArey8JrUdNOL3X2IC9VloXd2N20dJkgPKHNgbs
         hjpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0OkQJ36117OhTK9koRpOedz4BLElD9yQiJkhs6LWLxczfRNQaXHI1Rrf4m97wpe9MfjVnbFEFd7By@vger.kernel.org
X-Gm-Message-State: AFuF++mV2XETbNGnQpSMGHjHTRPYH5hsbH3l+MtmclVPzxm38TBW+Gy6
	VjKsdY9jed/swmiZ0B7lpyD/wjsOFG1SMiMOol3PnZsRdgLAevdFdBi8o1chk5YdCfWETC9au4I
	s0Gi5als/lVSnmkcTcIkQ/8qbvBogwEM50yzT4tfI7zi1M4KitknYxKTxXAD/XUYK
X-Gm-Gg: AYBFou3+n5xU3mn/yoZ/67nA1jGiXIIynoDnFtXAD30r1NC1TDG1iD3BCjwxU4OYGmU
	fsZeSPCbGBwbY205XI/HNgWGqdA52X8egEEi8u8PAWtw1WLAjrpYp3+rJO2A5CAODVLn67eD58C
	xnhYEWGqGCQP1IBGsUdYVIB/gI+OKoFHfRGdIq0lRRwvgwbaKY/jGOyVSdLZhN040R0CCY5CUe1
	StT7Uwe96ghDheVDjowZPn2vhWAOj/mHd4TSYIghWqlnc6rJijO+/fEazgr7ODDTj7lVsF5sjCf
	8cUHdloA6hQ4y9MBi2YniqPNHneyXU9CPmBUgQoyJT+hO0SALwo+aD7InJd34M29K5KxJUPOinp
	GimNsUJYZahn3odMY3P8QE5M6KJp64S0D7jb1
X-Received: by 2002:a17:903:2f8f:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2db12357370mr566337285ad.2.1789045285768;
        Thu, 10 Sep 2026 06:01:25 -0700 (PDT)
X-Received: by 2002:a17:903:2f8f:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2db12357370mr566312755ad.2.1789045268289;
        Thu, 10 Sep 2026 06:01:08 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b9f0sm88424805ad.20.2026.09.10.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:07 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH 0/2] nord : llcc : Adding LLCC dt bindings and SCT
 configurations
Date: Thu, 10 Sep 2026 18:30:42 +0530
Message-Id: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqpomoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MD3bz8opT4nJzkZF1Tw8TEpGQL4zSLtFQloPqCotS0zAqwWdGxtbU
 AcXYO91sAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        zhangfei.gao@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX0T28xl2PWBOo
 lDYmGhEss8dCFzRKMd31zo91UipZ09hfS3jQQdDzplKUTWTVBo1uMqWumeG1B76fFETs/z6E0Uk
 //XJ08SDc0YmRQy/XTnzBUvxVs9te0Y=
X-Proofpoint-ORIG-GUID: EfydAbM9qZdTMjJ9f1Q1SL_jedLWLxIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX2DrnUSiGyu2o
 0CKYq47rG8XqATaL2acxiDQ4PqLLH2DwQ7AQqVcdVOlr2Ph3B2XMiJZTy1zsoUMavJN9Tw8taJq
 jAPjC60iQjzfm0/YEwmQdK2iympiWpGri1i5KUbSDvNf7f+yJFgIZMvEPgnPV6grAriBPxFSYmX
 cv9B/ExRJtfeyLhiUautYGn4WZel/7HJqjVvXDzprNn2Q5qqL4uVwH1MX3nc2ng/t7Fkej662VR
 aAyuoJ8+ujZEEP0rXGX2BeapGFgPY9RDfIFY8uwy9r+dkbvOpsOi3QTOE3CNkn9pNh3V5H3+zV3
 s1lR6PfQf3Q2UeO8mq77oPn6LW1qzxB2qIu+ch9DKbUB1N/MgO6nNpj4LJgZ8deUXEOtixhAbG9
 bWHY/CqUdKxjp5aAdIh+nA0ch1AeY9EOGYSMq7aiAho1NMLkiXH2okWK+Kf5SdnxruoLLE3SvVo
 +Sv61RHOgI+vudc8IrQ==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2aa33 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iF6ZZfrMDr8hCcISYuwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: EfydAbM9qZdTMjJ9f1Q1SL_jedLWLxIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

This series adds Last Level Cache Controller (LLCC) support for the Nord SoC.

Nord is a multi-cluster platform with four DDR slices, each containing four
MACH9 LLCC banks, for a total of sixteen banks plus a shared broadcast OR/AND
pair. 

The series consists of two patches:

1. dt-bindings: cache: qcom,llcc: Add Nord compatible
   - Updates the LLCC device tree binding to document Nord's sixteen-bank
     configuration
   - Raises maxItems for reg and reg-names from 14 to 18 to accommodate the
     additional banks and broadcast regions

2. soc: qcom: llcc: Add LLCC configuration for Nord
   - Adds the LLCC slice configuration table for Nord, derived from the Nord
     AU (Safe IVI) SCT table
   - Includes thirteen use cases with unique SCIDs and usecase IDs
   - Sets no_edac flag because the bootloader leaves LLCC EDAC registers locked

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (2):
      dt-bindings: cache: qcom,llcc: Add Nord compatible
      soc: qcom: llcc: Add LLCC configuration for Nord

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  55 +++++++-
 drivers/soc/qcom/llcc-qcom.c                       | 139 +++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |   2 +
 3 files changed, 194 insertions(+), 2 deletions(-)
---
base-commit: 693de981a44b0e7e3b6a73f0b0bcbae9c8d068e6
change-id: 20260910-nord_llcc-51aabc83f8fe

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

