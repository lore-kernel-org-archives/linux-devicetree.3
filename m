Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245665;
	b=2801ZuSMVHzBQY/mHY/f7ikaRY6kl4WUzgyoMU4hWkLEBpREe1mNwfga4KrXHeYd8wkQ
	 c3kIURfpSBELWkCjOkWfPAXvYnWeSQdl6e1fYgHZUu40AHUpF/IK4xWAbSfcP+wO8C9HO
	 RPEju2pMWBPlrooQ/dz2rrZNeui20+GtmgKVnX2Hj5eVTjp2v/IcdYMsvy/0O1XyKBKC6
	 fNWnW5apj0Xa2Py95KNazZfJi+MguUstN3vP4rp6dv7TTw607th/jyvzDB95hWg82yQaR
	 pjcaqXxwVJwZ3UNIui1u3ZJpxILP8SKFlYgrShIRhF9uwkgeBnP0+c4OUOvOFihapUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
	b=jfwtWUIsiqlHVOpioCPaxhnay0kqWNHXv0ZvUS8hyYashyHLWEVAXpwi2nbGnd4Yw9ku
	 8Jc4QqRywHkEGAz/HzOlLRhuzX5cq8wC4p6twhh7pDz9piPEQmJg5UnItSYaOZ8wKKARH
	 fuVK8bCUoRE9WIWbBOcoOhEhlCIYA/Hxgnp0Zk1m6rjcOgZSZJF9LmzjyYhxNrcbOzADI
	 RHTfAsO9ylPt/h8tQoLqi2Z6UKt9zEEaiw30UL7P7WzuJGFWhms1450Cm1T8OcZl6xiRT
	 Hw5T61SnQ8TbYTm0U0fyI31+dVTcNaxyR64eygt5ODbbWYlBgcSQVegmY+U+hj4TR4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdNx4JNn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB42Zu8p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320F5606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdNx4JNn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB42Zu8p
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jMZG2886476
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq
	4MjFPHkk=; b=jdNx4JNnSjRbwRBK2PtSdYaVz98ph1OqXq4WdMO6JP61fifhpTN
	poMHN3/5kTbXjjn7aGQ8CG6h8Kn0HAHRb7xahZqVXJU9zCT0aLpYt1lr9hkeym3D
	8Ib4sy3Z3ImyEvXOoAvePOucAwvVrqpEJtgEVl95p56Ph1EoPgcmyPnXd2W/LJWF
	57AGKw1uhpCXh1e7VK4rV2aJwp6rZF/JG1tr2ZjfiiIklHpXaY9hq/rmnI7vkO98
	qH/82WzD4rWzxdyVwqutgBMujiJLA626/f6xdIfVqthC/D1kwk3iQRbMprcSlFHS
	yLy6QCmFPFe92XCH8yaEjupMzfJ8oyiot9Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3ghfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so2511227eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 20:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793245663; x=1793850463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
        b=OB42Zu8pr8Ror2PR8Z0q4CD3hi6STZ3euJIb1wdNqKBEXmv7SDgub5O+eRMGJpR46D
         yPGGjMJGccV1xgwws5jyumVPnzpfH+I07pIlXQveX8VF72pCe90OF7FPu/2/hAvAGGvM
         7vj+Hv1cBsNWIcs2/uClJsQaiQX5L/SDss1kwx8lgyPctbLEbpPdd7rwwrAygha0zIjT
         2svYB2WmKd14juzYoqCbND7u1RklNVQqsjuy4EdpjOsyU9J+gzeonuBJK6V0SuA1055R
         KJ/NLDOu/HExHBtjDtmHktOacxcE/WVVcZRdGvnmKI4/0WNG+Q7+fx4YdKr4r0uI7v45
         N4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245663; x=1793850463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
        b=gSSGWi6GIwsaf6YNU2ink5ba2YXT39MA6ogLn6eKy7b0/bHPOwBy+DS66ixvNNbNQV
         KX3SyB2zOAtK4sa2O0sx+waHzl14SngiF6fUBPM3FC99fNP3SXcl3g0NHwgDKsXUZjJu
         H7IPDNUemvDC+zyCth6OTYdAa9OjkSi7kVnTCrYqgP67aaHR5r9ofQcwa5aVBj4YOXvQ
         eDZA0pHKaRjQse6PAwX84pKpjRjoBhTVXSeSSkvRzjb+AHteGsaqUFycvQ/Fr1zTMIP3
         f6RTwoF02VO10zesHeHHXA4iSMT5RjqriIidwphBKruYlfk53IVHOwYABf+YIjfh0eKj
         2sOg==
X-Forwarded-Encrypted: i=1; AKwUvBzmUkQAr7xYH9hp5tTt7P6lPZuc8JjxxD2aDCfcEECYZQTzYnKSBFelVpO9qV0rZ7d2jb9f4fsxOb2r@vger.kernel.org
X-Gm-Message-State: AFq9FYLGewo/Zgh1BuVHryP/IdUXjyvB3We3yYnhnqMxBaW3qs2prrtq
	aRA43oZQVDFPXNbJU9eYg3kUq1djYvD+leuihb31wB7PUOzMyGAeuRxBKl97DsJV/SZE7w7lRA2
	CmqNDHDCRHgRcsg7S+uRD3OcT7ECDpXYmFRPt8wIb+dOkT38G3Lkkrbm0op2mwLrf
X-Gm-Gg: AYBFou1jKEO5KU0t9IsVkS2SPaPfKi7h6iZRLsI4h+u07ZSpUOAMe5Cw+t3SO68nMbL
	eXbGquIsCBXr3VA7cxSB6NeZyQ+dDVfWaHZfrVQ3D1hmFNNxu0wYwb/DeSIif3xEtn6mt8we8S2
	+5RdQ5eD1Qq+twZGQepuR37verz0UR6XEaZFsSYR4u96sktl/X+a+utBzJfYngJffALOzK1R3xB
	eu41vvA5H26nc8k9sMmEjgHVkAAg4uA0gY+tLjujX1Ma12UKQvpRlcUw6sMMLUPqM/eqLqoAq5n
	uob5UBgLeZbOxPUclejTcm/r6McQ7vQWAE/UwDTMPQ1CQg8TmJTMv6Ejw02NF6JPW5GdltAz+wH
	9WJ9B9RVkmGg5lzQGnVR1SQFEfzOtoJXDA2hs1lWWfaRzwBYPkmmJMQvBMaUP/1LWgQxonU8Pyk
	N5M5G8FWGW6sOuHXy9JWLJ2LIl0Vl94eoF
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr5877567eec.19.1793245663375;
        Wed, 28 Oct 2026 20:47:43 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr5877540eec.19.1793245662793;
        Wed, 28 Oct 2026 20:47:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/3] arm64: dts: qcom: nord: Add display support
Date: Thu, 29 Oct 2026 11:47:25 +0800
Message-ID: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX7nuvpjHNtf2F
 YPDF1KNHjkkQ14GalQaEn7x72ua8Z2VjSNbc48pbYPAX7T/rLmXeBJ/ViFxeCRsJ1f5TetRvwr+
 FmZKmLrVtQZjD6G/ahMwULL1nrTjbiw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX6MmbCD4XthrL
 NAU8fXrEtgV/m89PL4JC4QJi7v/AWeirzQ0u0/d5FoPpWuxl74ZMT408WlCVLx5W39R5DrJAZIX
 jIUJjVWZhTldlI6aDCm/K9hfRs2TuQnUPSvzzzbtVMvq65niWPVYkPtS2pR603BRboLrYMH5XOy
 lNq4gUBaeT2xj7wDPQX4A5ed6eXN1V2b90ZNqsjSgq/h1TBew95WXFf0oAbKpLNhY2J0zufsBcz
 s6XgNQ6Hkv/ojoNHVgxoUUdKTTOP9IJ81d6CZ3Ccbm672wn4z3x+FPH4EAo/EpKjth6z6IWE6I+
 9LPp5c13z+o6LyXZCEJRloDNTLpg2R4chT9WjXW6QZm++zbcYUzyQ58Xj9ehE3lD+/d5tgrBKaZ
 07zIdIF0Y3tGmm0MTqYNLCApPkU8IL5qTrBbiJ/meVMgXheUc/8V7e+9o7yJQfj14T0gi3VLG6Q
 lV4M7QhcfH2U7OHd/SQ==
X-Proofpoint-ORIG-GUID: Voxa4Sa6S3FMJWHW3Q7WxqP3SQ9JdXf7
X-Proofpoint-GUID: Voxa4Sa6S3FMJWHW3Q7WxqP3SQ9JdXf7
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2c1e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nVVmeSlITW91QR49vnMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290013

This series adds the display and remaining clock controller nodes for
the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
and RRD (eDP0/1) boards.

Dependencies:
- [PATCH v2 00/13] Add Qualcomm Nord display and eDP PHY support
  https://lore.kernel.org/all/20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to dependencies
- Prefix DP PHY labels with mdssN_ (Konrad)
- Share a single MDP and a single DP OPP table across instances (Konrad)
- Drop odd blank lines in OPP table and redundant comments (Konrad)
- Link to v2: https://lore.kernel.org/all/20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rename label mdss to mdss0
- Drop clock controller DTS change from the series
- Link to v1: https://lore.kernel.org/all/20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com/

Ritesh Kumar (3):
  arm64: dts: qcom: nord: Add display subsystem nodes
  arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
  arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 407 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 124 ++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 264 ++++++++++++
 4 files changed, 849 insertions(+), 8 deletions(-)

-- 
2.43.0

