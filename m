Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD413546C4
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727722; cv=none; b=XOlQNqmRg0yb1GT3d3BRNz1ykaHUSj3GYJbBOB/R0tnMWPm3Shw/Pms3JzeykmG3iY0+KHCwLxNfUydQ04+4XojBRCFyxC0Faj9pLlvpB2ubLQcSrM/WZJg0D4rP5LKR1e6OoGlEOtd2RTbuK02r4EIvexJe8PjiQ71nceyFSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727722; c=relaxed/simple;
	bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWpJJBtU9qcoRd/Evrf+JqabUzTU4wP7uyLBovxLHqdqA1vlAgiUt5SYhUAMhk1QVg4HnbbtkQKyo2JfDCCPypOc3Vl9B6UdYi9JBLAmy4W6PgDomzHUTEaJeMnmIIVr5erNfPBmDGq7BFUonqEXU9f3HRP/4HxdBlIfMs7a1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDOlIZGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeoLsBKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDOlIZGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeoLsBKo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWSFJ646416
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=; b=JDOlIZGdjzix5g+5
	q6HdGfDPU13TwLARMH64QvMItNgCt3Xa8uyI2dpSNcuDnSWJNt+oBYOouga5ohv9
	ZG2lz5+0x5auM6OCtMzfLwTRiAIjwPkooGqmVK+/my3fQeP+FwEpZudQYnzWMS1t
	sTOc7QAGSxgrsQNzGGAv3vY4maNWB98w24ZwsXqvO56d6IQCAFC/sEnJNUek9vdr
	X8yDdiZyFvRocFmZl/1klIB0SdertDU+cXNSFp5i/zB2qOj8cWVRM0LXblVwHK0y
	DiCPR/kYaRAnof5O57UJZ6Y4iT+0rbzQISEyhC+duuw2+L5yV9KjlYk0A2Xbkxyq
	MmhqwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2292uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:42:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae455cf6dso179824875ad.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727720; x=1785332520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=VeoLsBKo7dIXRnlecrSwOzJtMlxzB9bDB/HO08eawZ3n45ScISGBAfnHKE4BvBYx93
         0h57CdTkPy+U5L7+Vl/kjKsRMJ70htllRscBhO7ELGJGqB0AiAikcE7/JDC3eFQKKqSt
         Fru6i5W2mtU4ZvaLSkl1ju/Gsmzxca4IlhwB4zujl+RDBt/q4BQCjO/yZwED4zWPkvU9
         1A8eF3JSrdme8kG7YFyJqZBgC9RsLJ3mQPWAtWZRwOF6n2Fns2LHe96kS2C8hSz6y+to
         CYPoS+shaxjNZVcCGs+FotPP5oGah5ZtA4wfSPZmFEdQF3+wBMynhav8BcdJEcbWHjNx
         psvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727720; x=1785332520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=hqhXEnkjCOANC25goFgnyq6viT5Kkmg8FACaqvAiOlsnW38cRn5uiKnfgkhEebjkoo
         v1t+5IT0+OlolYDpe+CEIIwnu8y3E0vgZ8av22sB2Ra46h2Oi91TFzyeKR1ZlwahEgrG
         1lSB51fo0ZEH9DBfXV//2eMDYp7PPLjEqxx5jJ8Y83N6SlEIs3QaCjegttOjCIGK1pnS
         nKqTs6CF1SJVanxFh5Gd2+Emh75Zll1Zs7RmEXitQGE5wr0RJ3CkwVkEopF+0ZS8GAK8
         sR9y9I16VvsvHmQ9qfjiyU2Bfdq+uujWJfwSvxyGie5amWu6aMtToWcNFuDyBMzpkpvv
         BBYw==
X-Forwarded-Encrypted: i=1; AHgh+RpFph+VWeS7ejRQzoTsTN2sun3pMlH0grKhH2K65a15ciIoO4KyAIZAYMkGkdYuVA/+zF/l8MZ2K6VM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyyz8Yy29GLU3u5mKKDFvYCsONEa4H4KOWju7JL0g7rKNAkE60
	5uX6eIjhv7J7XnxX8rssu9z0bqfJ3Pezl1DmpSN6gGd4vhPY34zXy+kSPZpv/LaRib4O8gdOag3
	viuTQlWnZCjkT/ARcCagLaiUd+uIgeKBNbC6L4XozdcvUQ/e86Z441YrINBt2kNr3
X-Gm-Gg: AR+sD11knu+SELcogYyTkq96bB3vzjht/AYKhVzJ5xvNtSkX8Zv1TbIe7vyXeM02pb0
	owrt3na23QdASRahJ8MVVA7BkQ/pt3LbnbBI9Kr7sdAZQZ1BXdXoobrWAZkxvg2sEoIEN3DqCu4
	mD9tHwHgp/OP3+vnAIBEIyn4fOsm/q2fgYanGtIV1TNaJMQy01p+w5HY5cmvObJXeVag4UcOfXF
	H+hmGgK9G3LPRD0/jgov2KQ1Nki3QCJGx98kwZ6rj4ybj7BkessQ5abnCpq2i3EYR5CH4eBM/Eq
	pTZpUb0Cd0c5UZOYz7w2zxuwcfkIylNARIwLEByRAkpUKD1iZZzKV8k0tIZtxidBOnzSUnq7fk0
	zZJsIGcGOqbr8fkq5vmhqg4xwQK+OjwOq8dU=
X-Received: by 2002:a17:903:46c3:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2cf34885b75mr249481935ad.14.1784727719540;
        Wed, 22 Jul 2026 06:41:59 -0700 (PDT)
X-Received: by 2002:a17:903:46c3:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2cf34885b75mr249480245ad.14.1784727717542;
        Wed, 22 Jul 2026 06:41:57 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm15186705ad.80.2026.07.22.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:41:57 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:11:21 +0530
Subject: [PATCH v5 4/4] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-shikra_vpu-v5-4-3d80babd4672@oss.qualcomm.com>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
In-Reply-To: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784727691; l=900;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
 b=HWId/SX7aAyEaq4wi/UxnTTdt6OquIHfj98ezz+HGYl0tHsy/BoRvBdx9goia27gXFL7YwFnM
 dg6nyY7N1YVAVSmP5+hhTMS66nMYZk+fwuRnFWgbAePasCwgCKqzEFP
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c8a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: imR8tLklZ-aCsOxJGK84Wp5PNg9kRSeZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX3WGmhdVYOKZN
 d5hj9oSGETXR2hWbfHY0102+66isijTAXQKQO17IBpIGCsWZv1NIzluxgtQ9dEnwLVPlJOTsevv
 lejXDslR0BBrmUQMjV34jRhKjfKQUOA=
X-Proofpoint-ORIG-GUID: imR8tLklZ-aCsOxJGK84Wp5PNg9kRSeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXxjBLz9Aj1X6h
 lS9iyzLsKLsZ5brMS6BNLwyWMf/pVrER+9D8zY3qsb6xc61X8/kq9kBgopeqHYGz1O2acHNHeWJ
 dnB2aAtgRvIbBmK3b99vOEgt/YYmoN0JsG2koR7B4e2mi70N1R1uHHpqRU/1Ky6EFvPfgzdcXE5
 Q/rO/1fqKuayMXJ8uG/0SXXO/SJMnDdxHEwhmpcrQ1Eulw6RUXFCmKu5KanDYRcQ3hxhJ09wax3
 4FA7UBpYLZ31yFgL14NbNPkh5FlMLqMH9Sy1geeI362eAZt2fABcbqccFSfQlINrZ5GnBSeWi6X
 9jV+Z72r4mLQzdZu3ZKLVy5g58RJYaLYjiOwxY4V/F6eyMnkznEz8j/a+N4PT1Zyl4/CrEZ/QBE
 bd6Z0UigUP9BV4h0KBFiMsbZluApAsZ8Gw07Hwd/2niXwgDSe0UJ7lb4mYNp8Z8flfFixPSCpdp
 ZbJhaQ7KT4VRymtVmbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f76422d57766ba34647010c690646fdab..696df7c9a7e0f7c86955066e76df3d8fcb8bad1f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1

