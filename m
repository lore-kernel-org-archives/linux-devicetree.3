Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0034D910
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309530; cv=none; b=vGVkaPpr4LMzHZ8q5CneOmptm4u+L+wYyDeDPZs4IGqwWLvzq7T68+neQG91bm7RNr1A5dV/LpHX0/3N2gPwGwfGWfieiIqtFyUTNEfhGdeCNdIogoX34ctVKCgOzXyYbkFqdzGISizjIbcyn6u54dqkIdOoP7Cdd4C6qKTP2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309530; c=relaxed/simple;
	bh=c6ViV4a8nqo+JUb40nOAbhedaH2/OCKupwocr+o/ihM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pNaRXII566bXzZtTif5M1QPXD83w/gvM2l0MaQmS08HUdVN8gsy85yhcpjYB8Vh+yyOGOJG2ou/tHMMHA1KhdunEuRRRNdj888NMaB3Om0EZuutIzAc5y2nhW2J/iDHdt1G7+1XeHGHKQgSesBhjky+rtNtuGXklM+klGlI+Pzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mckn4aEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIMnKDTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mckn4aEl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIMnKDTJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDGSnt3962106
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TPaDlQ8nd1g
	D1U+I9uBTQhY9x470OArcZLE6OBjKJ9s=; b=Mckn4aElLhp0qH736SY3T2/zrvV
	rWtj+3WptZf65z6Xi+Y/4AIl7lIOTZmoEW06Kjr2CJkU2MLrIC9YWdNlTetwjUmy
	+5rgA4k64wcc6sNU7OGEFJc57K4RJpURwSSQZUxHOICcLyC+HkvbLAfAfng7vWJh
	g80OIDY5gryjiGyJu3+lmeFykdoNLaso5hUOzpMAugJf2NfxIldLJCjofiibhp/l
	VcKW6ZJo4s+CLJ4QjmP/xZUy3y6n2Zj66pXbIWdH1b0XWBubiOjlXCbUbWiBZYkv
	r61aa5h6cEZjGDX4Kcit6EBa76RuyCOhEqUczrvM8XM2LSkRT9vgkDd/bEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k323w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:05:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da09e73d5so2489319a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309527; x=1777914327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPaDlQ8nd1gD1U+I9uBTQhY9x470OArcZLE6OBjKJ9s=;
        b=LIMnKDTJa/JO9uVINJBW+uL4DLNwZqj7bbrkgf5PbI4aPW79R6GKpqK7nd95dX+0GS
         gIXIK6dWiweBVKQwD6uC/MaH8K2kY93zzf//imIiqL9vdpSf4uFeZlCCJE4ENMfi/Cgc
         nTI8tVnGSoCze+QIzskuq4+MNkBf06uO9ognf3g0dlDuxlXmD9MliBWp4IeiyNI8aU1L
         n2+Xbtjfa98g/8WXsSAa1hdYBjb9WEYQSex5xlJm5H0l/SDHJYa6Cgr3IGXR4lqsqx5K
         ldH05/Z4Y1K7UYVhqgNQ+5rxMryt+bA1sxtXIBr0811M2/jmQ84ubTRe0+vcLA8I8QXv
         4Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309527; x=1777914327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TPaDlQ8nd1gD1U+I9uBTQhY9x470OArcZLE6OBjKJ9s=;
        b=TUh8zLmG7gnbCrj2+BhdGX3xOKD89v9rGAwlBKvJRp3QUuV+KAje+dFBgs14u9/7py
         F3qK2F4IP4OI9JSpWyfzM3H1WKEWq96A9Cu5M42WX+TF5OygIi90ahK9jnff4e9B39wk
         DV3cQk0eDD4/27UVL+LHHeGTmBWdniQ7t0nIkKrxsEZ6RSNRjtzESqROIELGEI7hZzo2
         LlUDB5idk71n11jxYolXi2ldE0uoBVBkMn/WgkNNSCophWSAFhbK5DzN7/yrbFHG7tTF
         MA5Rmq+WACWP2WagVvSwWPMIItuP6Iuxd7g1T06ChVHjLAf8vy9dP2WkkpBtGmW0vWnO
         yS7w==
X-Forwarded-Encrypted: i=1; AFNElJ8eImRNUBM8jDOgrUJP6k6huyf3SU8AXiTtNh68boF8cdESHCUJWKNHAeCdHRjQ+2OEldv20lStFlvX@vger.kernel.org
X-Gm-Message-State: AOJu0YwhGbzTuPFDDvU7xylZrmGe9FpvR8P9Y9yCWvwH6zsori8sUitU
	/XtPwaOtIGgjlf0Aa2BlnLuo5uO5HM0OHFPsBgGgPCZNvLhlRMbfqVdDgg2mshwQ2SNq4Rr0AWm
	mM2mFKF28fARsk2ML22t3puyusat+yq01FO7w/8ke2kx+K+Np2A8hAKXPp4AMtDWV
X-Gm-Gg: AeBDiesctyHtxizc64thkR1IzHrhFU5P08muB2QanAT4+EdxlNF/+sowWMfqyAXTT52
	ovCS9PjWKVMbUaU/yK3RVzwOVcdqueRKIYnU1o9q6qokkk56JwLlsjDRzYsObP2UPhZkkwqc3/+
	MEZct882SBnMgE6EkYY5R3PVx5mFPqr65YLtIcVGXgxTwWoZpc5JQd43vh2PKF0tsBsHOChw97Q
	FaVmYPl0Wo5MsPRnl+1Eba3kxRb61kkzI090tGxi8II3mORB9mfLnzLDUBJi11cqeYcqhaZc1po
	3mIA2pg5j2ccVzoQ5gaNaaJIPCb70ftAGQWb6AxF4PH2nCEyT740mA8B+oGjzUWftymxy9dq8AK
	NZBpZqF4yShcBpa7d3GUpcgmZIIF6vULWio2vbhI4eZUt4Cx1CRuwgcM/oAKv+7Y=
X-Received: by 2002:a17:90a:ec87:b0:362:bc7c:55cf with SMTP id 98e67ed59e1d1-362bc7c5d34mr14125572a91.8.1777309526812;
        Mon, 27 Apr 2026 10:05:26 -0700 (PDT)
X-Received: by 2002:a17:90a:ec87:b0:362:bc7c:55cf with SMTP id 98e67ed59e1d1-362bc7c5d34mr14125548a91.8.1777309526399;
        Mon, 27 Apr 2026 10:05:26 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:25 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v4 4/4] arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine
Date: Mon, 27 Apr 2026 22:35:05 +0530
Message-Id: <20260427170505.1494703-5-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfX1Cc5MeDxgRhl
 Yj4T7ifmlrj5i5zU+XnD31vjhB+0rMetxNFED01HFKFtY/wr1LWmSIIeRJ2pKoZKdHQAqHKz7fu
 9pY2ud+YddmGuci8wOyaOGZegoAno7enyjWUjndTdR0ZpwaJ8NbFWR4ueS3A5pUZ643sxdtlKFH
 7B+DOUZgPosjxffOMQoDwPDg38ay7/UQ6a9eZO9uIJcsYDz5aQOESR/7nsLC+jZ9Z14gfYijBHy
 pC/MufFLpSmAEOxuOOg3RKOpzftPh9t2kfkt4Hsom8ASsNNtUJf9jCXLHDM+btjIEvpUen/WrT4
 OZsU52zL+Los2LiRSP53Efrpl8X2duJapRhbeD6d09Zckc9QNuE/wS7+MSLk2ig497tvUnJYref
 7iva/rSj90Lm99d6vrwslfcz3tAP4as713k8UTy7IROxCcXdtX+S2NKpBSkZIGb0qvFkb3Wi9WX
 VFtOPdSHOAyY9F2ml4g==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef9757 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lesJYhStKq8E7S18cIEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: G2_Q-qr9zPs4vdeTccmYs2yY6gRbWu4F
X-Proofpoint-ORIG-GUID: G2_Q-qr9zPs4vdeTccmYs2yY6gRbWu4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270181

monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach.

Add combined DTB for the same by merging monaco-ac-evk.dtb with
monaco-evk-ifp-mezzanine overlay.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 852d2b86407b..25013a408062 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -66,6 +66,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo

 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
+
+monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
--
2.34.1

