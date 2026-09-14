Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B7374E7F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369291; cv=none; b=en2dIkIutzE5VY4d+8pqN2R7BVf1MMk8rT6ZoBcLa8NriFTibZQIysiEPwRB6v0uMiE6vxLGwWUx8z0nLAUEZNfve6tfDwaxrgkdTeAOj/V2nxr1EwzCqwa/BzBEn6rcsj1Exv445XLs/+ZzEWh4iEPQeC+QPZjtRg81EGfMcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369291; c=relaxed/simple;
	bh=OWFye6SIF+UnzHlpj/NXxpFD9oJT6W2y+uiXFKJFwuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtRXdVr0d+goeosFHDhh++z0nk7ZbK34nHwGC3xM6bJ/YLqPY7Oagcy7ndgc8/Rg5EcJ+0aImeD1X7elR820Hp3kbRLZ9SlyEfnyfIn7XX+hdrvrJnzyI2nNFzDJViD2h49u2pfhaJz3hPqNfVMlyDRG7lpD8bVzyE//VNce+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0qVs0Cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbqpJDdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0qVs0Cj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbqpJDdf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilxv3369254
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=; b=j0qVs0Cjf4aGmZbn
	vsdBtVdWy0K520OiGIuqkdvBZSeC+RIU9MSrg0b9rbXONTw3qUXjWb266NitMa62
	ctHJZ51Kx9CJjv+Savjvg6AnPUHSg0PrS39ewt5E+ijQB8E9458s9SYthGoYIrOe
	YTyDMLGcozjAqkcHJtpgTMfFi5n4AzXKbKMfYEpZkeT8KwR5M1S/ZtWXLwZ527GC
	Qm6P4+oixxkIhgY/FcvbYtofoKerGkivxg9CJRhSFomPMfGMpAwP3hqunh+JFd6l
	yBZMPP5fkMVc0jTKOKgkSyXH50DzuU87QKfQYK3pEP7+unrxWdv4kzk6cn6NC9Hd
	yna2SQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5edm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so51437775ad.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369288; x=1789974088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=;
        b=YbqpJDdfysoFPqYyYGnAp7AZjXs6uNHc/Rw4hFeAMlmPlO7pFU7nXzQ30AokJcA0wl
         b59d0/jpntH15eoHtILR8d4B745Cd/HDtkwu8OWZBiXG0b8sMEg/g+OzDMC1m6nyAYhZ
         lHvx8jVB7M4eii07sygq1JMfIrDwlBus9JTQh31F8CcSdkBsyHGnT2xuG4qiWRP4TWzZ
         RF1BAm+J4Yi61//GLALf6MzSSHl5c4GR27IIJiPisGWdZsIvteindItqRJgOhBVFlWjf
         AqOgoZAQyNfR/idrByASFN6wN6bzOCnEe5OjIw6vIDp1GDJYA/WzsRNZ28dx2Ie/3eSc
         hsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369288; x=1789974088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWm9FpdxhsiSeiVC9YPwc5/oMB/0t7X6Bgxd//+LRoY=;
        b=ZMu48C+LL5YbFU4iNNP3BKIgAlNBnJcvNCqSFCDMOOGUDFmYxjPxhWuslnmtQXbXAA
         y+CEMzDQ9vPpuP1IhjiRbgzkIa4tZPK59gmHyBbWTUojIYVcmoUxKLuJBuMBFVRZGQ4n
         6AQiQdj2QHwoBVEZQQlb0oinbgMwFWEIp07y3D6LRGzyQAJ4o5hfX+KYf0PZ50Lrcyfe
         2a1JoxKhs1tNBs20R0mUBr91fOJMFOhPdyC4N6jOL7gyuY2MEM4YlGQlV1XjZOghgF4x
         NLRPogFx2OU6N4I0Ke87Uv+eRQprJpew5XYpB4DLOQj9TB5eoYLox0A5gUfO/GOO7eg3
         cfww==
X-Forwarded-Encrypted: i=1; AKwUvBz/8qnPoNXq8bML/Imr3AuBmezyrw1c7qOFHkvYGeSQtsWdjRQJtwkun4EKzabxjDdAmeyp20ZllI5d@vger.kernel.org
X-Gm-Message-State: AFuF++mvZB7kP/WFZmIAARKAkXCm/XWNnm+SmGPvac1zUCKjycdiZr9N
	sLGYLcxJX2ygT+hkgm9xI7VQLlM6SnQk3VgQnr52l84al43QXzaFuO4oPcxiUIT9YfzpRa2wZ1K
	9raHEVNCy8CkBjqZ05+Z5RO4KBqvH/RqxcsFU6ARrTw4nhvGafUQrm3yv5Oo8CqV6
X-Gm-Gg: AYBFou1cHF7q5i8Okkq71rCkcDVYLrtJxqRmTu/rfHmZJZPsTfXoA5mtFtxwuXQjdmp
	mLARXknlhX+QtaZusY5FcSvVQjjlfCgfR8bgxkkemQLEg8wWOskik05v/1BA96zdlyn8byYHdx9
	KD4bVm9gKxJe+Etvyzz2ct/FVvywLGIp+gjjSfMzfJInCjwVTGNcH6abAtdRlGshLQTCcsN8UXw
	KJnUdDnDfw28r+uvTqmFY2Yw8jWXV9F7pGQs8muazS7DdLxL7CoBKBY3uxhpaKiU776SsyWAUWf
	XluZTnM3wmd4q6jWFI2U6v7srFsq7Yf5HPxvl8gyo8+2Npb/ogqLmLpzoKfvJ1iZJmgQ6fVUr7z
	GhW1w6ydtY5VTVnL/uqoLw8yU+n76
X-Received: by 2002:a17:903:3805:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd6c5bfba0mr28468255ad.2.1789369288216;
        Mon, 14 Sep 2026 00:01:28 -0700 (PDT)
X-Received: by 2002:a17:903:3805:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd6c5bfba0mr28467285ad.2.1789369287726;
        Mon, 14 Sep 2026 00:01:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:52 +0530
Subject: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=807;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=OWFye6SIF+UnzHlpj/NXxpFD9oJT6W2y+uiXFKJFwuk=;
 b=BOarSMTg6QUkU349Yjl+X1Y3q5uv/2wneJx9e8bqYEs+glbAHqcuxRu8FAf5DArXz58skz9TJ
 BoxiT+jvzUsDnF96I/MX3ewKud6PMVLftLp8faH8iDzk031L4y+6nD8
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79bc8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rGjSKMGomevJ4fbcliYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/WC9iyG2E6JE
 NoO55IgIGndTmEZHyDNCCTK6lRmvyOkYT1hV2U+8bszbkTeAKDZPvgOeJcG72cmVhovGeOs6j8H
 BtD0+8fwh0F3RLLj0AzqMJTu02KAMPkXukAWVBlDfmV9Yb9Qxox7VBSCaT6MxkiH0ea5bDMi6w2
 RFNdsxUOoHvUrAXkVSJ2JNFtBZoP8zGgZskgIEMQm/ys6ibe/qwdJzDIGRWKUAXpPXfe6Lg+L33
 k3KGObe9cg2tdH/Bk6loL2pXvqpqxQfS9cr1o7m9rlSN+Oj63pFkuZ0wg4PglN+xGopLt8gRglu
 atFQ2MALsjjaoJeYMdd5OsGA/swU1wzBMCOVn4NEJEBaBictg9uzcpCWR+JewIm5SJnKSFMU80k
 HkyoS3jGfcyGmbNVlH2AWxyHVUVtv78/reA4BzJtWKA6s1CSBsHpmU1YLotixbIJF3+IUBn7Ts5
 ahQG+mHbGQ0pjyeCQMA==
X-Proofpoint-ORIG-GUID: C7YqleTEqk6IodSYCuEz5xlj_vqWnOri
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9PRSIZWHT0x3
 0XObUelVO3aDKP9NqZ03sudIJZNQ07+iri4IB8mIXshDe3E28XermBV92DfLqhjPVY5QiC/aDXW
 edn1kjsPkWFNBR5LB7peU1y9vJQELGU=
X-Proofpoint-GUID: C7YqleTEqk6IodSYCuEz5xlj_vqWnOri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e7fed60a59d9..c226ef4aeed7 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -130,6 +130,7 @@ core3 {
 		domain-idle-states {
 			cluster_sleep: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;

-- 
2.43.0

