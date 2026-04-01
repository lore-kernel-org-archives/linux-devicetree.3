Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4BD375F69
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028838; cv=none; b=f8fVZa9pUZFYKrsXsAaSifBMZI/ZuMIyO2Ba0yvGGa8zp5sKdnJu5ivwwbsTsFqjrcWjYwmxeWLEuCXMNFTim+1X4uy+Ek4sEZS4yHbwOIfNLC2jToyOLTxHtfbUXWzDwXLfitVkAa32xJ2zx9X63MnvOQWK6xFF6Ta/KsUD3Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028838; c=relaxed/simple;
	bh=iK65w0LjaTQtPQfrKLmgekAJIlm/JBXiAcjmKb5JoP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hnWH06loYf8iHMk0XG5RJO4PZsP350k34hkRULGJFn9hUrBvXjUy94XLGaY37kuVQXSzkYM/BD6hMWx1OjIWVb83R9VWi9h0IeMogzMTIglGQ7fozykHa1PcPlqlkPlfBAHA4dgAwqB80hr4vbab5HqUqIAsNnRphAeZLqvUJz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtRX4OVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kO8n27cY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtRX4OVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kO8n27cY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VTg01459610
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hPPR2+jvkaHole48wnGcgLBTOBMjVSCOu4+
	iJ7qiB5g=; b=mtRX4OVuC4Ht/qmfYab0gD/tLh/L2Y5Dg2+vhcGjBpA/9bTgmDN
	0MPqJgbRglVwpdFGOQCpNKQDtu0kVz8mHPEzfwT4i4NkJwTJl7CIHtmMoTLsDNBo
	A/9ecNoSuHdXb1G4/J9TM+5JTRFFc6NS+RpPy9YeP9HFb7k9DSWC1ggFhw46BGNM
	KYNjuxU8H4McdgL2ELlWthGirxh6OxdEzz0DApMCk9v7w4tsP7Y5gDrnL5YHJ6Tq
	qZKtDZXegUy75Gsl2hQOK3Ovqa9V4pqsJNegqNfMVkpiE9hUlD1se/d6oNfAMpV5
	wj8S/yde2rXNgYjjNnuE20aRMXhGcbPy4Ig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0vv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:33:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b23c909256so58586425ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028834; x=1775633634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPPR2+jvkaHole48wnGcgLBTOBMjVSCOu4+iJ7qiB5g=;
        b=kO8n27cY3NDoIDALUUFvqv2ZxLuFycYz3YExkrWGkzZ/dCrY2Kz4mZ9h0h5vWoSKks
         juIPmOaFHRp3thFvLnUsrL4EAGRpRJStv7gL6Wzl4QdlK+SgUHm4qjxaKS6fvSz3SRpj
         dKhBGRQAYy2M/v7ZqcckzAXf0auAAeQT437LGWbMPeS+5k9ZQ/TeUIffg5vvWI9oma5M
         LkCc2GbmvPyPvYZhMG3p+nbtAxUG01xyLcwEwMJm+BHk0STTPYiGees2AYtUy31LHkLb
         9+U9dynwKpKCispAWpXWd+4OmfXlyyZ89mHxURUXd3NlVyDnpiaZkQxn5S2O2FcMvMKX
         /+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028834; x=1775633634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPPR2+jvkaHole48wnGcgLBTOBMjVSCOu4+iJ7qiB5g=;
        b=tGlDnLLHNTiGGz/Sjys4mD91K4GvmTYgLgPRh6mbFU8zHOgbIAf82bK9eQCVmpJRIs
         Jx9E9AUb/BKpWzW4zNLJ4OOO40Px/urbAELKocM3WlY94SaL2nBsH4pG2profz71+xmO
         oQ0iwoh75vfRtqlJ9imBBy6l8ruTjKH0B5KBD1sPbA/oXemN+bc2+eALFjK/fm6UCqdw
         7JKV1jRJCY4Dl4nfikSaG90PYPtnmBpAGcyi9Z8M0/5rH0hy7fBm50Db0CYZV0TByZLo
         hc3EjyNA6ZI88wk9m+egHxX/gdhfQg8TxUkKL7BsApWTqUpbmugpyAVkGUhU+fYkQZUE
         Aieg==
X-Forwarded-Encrypted: i=1; AJvYcCVpcA0XbNrJyaMCF47XqCzrgq20FbwHvPiA9mG9hkYRfS4trx87TljTlRlu+RhzYe9qAjOpSbaXT56D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+M8IKQ/VL8eHPEBmC/D0Eor20pD59P/qqy9QHqy6wIYUIxPvE
	xY5PYTb6LpO/C4jB4FSYnFuvsWKUJlswD9rgR6H28DmKDqMoPZm1MbOaTzfM/pPW+8jLUcqEFSm
	UquolHWOA4u65DYDi2D1Uck5nk4pOY2ptcRNl1j85EXhG5WDMc5DymLpioPG73r9t
X-Gm-Gg: ATEYQzyNE1ExRD9YeqNqGJwggHLQdOOoN0dwoY+dLppJwrpK+ntlqRn0IkDcynYwhBj
	AE80i9jBz/H7eKckS2hwxdFpAbnzrALkjlQ5253vcQcPv8P0WulezH69xF4xN0nVIMhlZCLsq/K
	ZwhquGlb/IFgpzBYct8teAgMiAJHJboZAP+FULsUmyLB6/BgiumDTnuU66gbIb8FVmMziRGe6zQ
	VMmiuDbGEcQHKkUzwqbxN5ZBccxk6zzlgMBWAJ9dYNdS8C99RtC0H/UdBBWD62Fr8/IGBHmV11o
	OwNriagg4IIVy9lfQboBgwrRHhExwFUGrACtvHOW04+v+zcd5tav9fJP5pW/whB5XeTw6Qyd+bz
	y8OF8HHs0TMXwebAVwldbJO/lppyru48ts0eCdD71SaGhCkS3ss/ojT8fbgdGhY0bKM5SNHs1ob
	eC4jj4lOGe9zRJIMWVQg==
X-Received: by 2002:a17:903:3c4c:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b269aa6173mr24687455ad.12.1775028834291;
        Wed, 01 Apr 2026 00:33:54 -0700 (PDT)
X-Received: by 2002:a17:903:3c4c:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b269aa6173mr24687215ad.12.1775028833770;
        Wed, 01 Apr 2026 00:33:53 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242690e60sm136623835ad.37.2026.04.01.00.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:33:53 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb session slots
Date: Wed,  1 Apr 2026 15:33:45 +0800
Message-Id: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NiBTYWx0ZWRfX1pFRLrz9Cpqe
 zk3KHj1bc1PknPBKTXS51Uu2ePm9FtsvxH2ZvwaJCqXreUYCD8RciQF+3v+QZ2kWx1aPRyn0vua
 0jBUiez1li5yOi8jDslX3ZBd7fpHsWOyfRa+ltxe70zALMrDT1v6evlQfYtZUqBC3P0tTcHbpZQ
 mUnrmhN7OisrsoyAa/0q+2rBonLJKZzpuos30Rp12qFVtC6frwU0Mz8mi/ODOwrFp2PwdHG/SEI
 fdcxJE7m/Nd9KE+SzczTCEBFxlf+hdu5im2TpabNeA8wIuUgp91B0McvXeuiDZwP1HE/mAxnnv7
 e2+dsHNBj3p7qorTVUer+Zq9qtruivS4hiMARmT6oe+MrhqJE+fbYzoE/dFh5oucjukX2HuMMIV
 4ioL4RLBUG4vcad89EyYWqDwv/3IfnoL4Mthq8xGOWeV0I+gdWVcomUc54DE/mCPIeLjHp7xi6O
 hHdoR3nE+lCKyOAm+pg==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccca63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hbxEiaAZNVryL09W7gsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7PVxZBqvcVCzDOz12jhUmdb8tEXazLYR
X-Proofpoint-ORIG-GUID: 7PVxZBqvcVCzDOz12jhUmdb8tEXazLYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010066

Some workloads on Kodiak can exhaust FastRPC sessions when multiple
compute clients open contexts concurrently, leading to -EBUSY failures.

Describe the compute context bank with qcom,nsessions = <5> so the
driver can provision enough session slots for the compute-cb instance.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..5bd20909f9db 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4465,6 +4465,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						qcom,nsessions = <5>;
 						dma-coherent;
 					};
 				};
-- 
2.43.0

