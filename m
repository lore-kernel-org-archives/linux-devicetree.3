Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CF6393DDD
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752550; cv=none; b=UvyYdIGTTU5/cqowZ+Fa5lqtHjdm/Xwtdp445zpD4Mnbj0euOUZT50FM3cJn/ydrxySxtLOmv3apNtDAUDeUQul9jt+xKOXyyTASwGCueqCmTwYvEzuo8ay0f26EvISga8+zVzpVYdYZr2220TvZGkzPswrLyZ/16EHl9wnKLhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752550; c=relaxed/simple;
	bh=5wPjaxtMp1EHMGKTxlI06Ij5iAmSt2E0j+sKRMrOd5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQbZGRkR3GujJaihJmmeZYhd0wwVHKbMAZCPEmQ4pi7WfQCrK0KrTcx9eKQ+mA8RXpVcrBipp81+cfJ0sODa1CGmtCzEim9ZlcBrosb3OBitRwXoDZ6MHRgm2kcY+9F9Zk7BidG32tHQUzn5wjyGiYpHNMjezz5SfQ6VCwiuQRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrBvDCsE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=No45AArK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrBvDCsE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="No45AArK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCHQ9882087
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoI
	XACsELTw=; b=UrBvDCsEQlaa8965zjpCp7JLorVgE23f6gC/PYVNep7GlZCGFiS
	2KkMw4aba9FsBzQ0aFqGODeJgwY56b1cXrYbZpNB9/+CE4RThAN6/x1NqOCb5WQV
	9KdCCoSzWZfEC920A1qhlIa8andQPtGGmLRtMawXT3zKnI7l2xeT1SLbMZHPTlJp
	wvVD8vBftmx3tWt+Z9uCqFBudz9Bq088x5ur+ZW08GvpxipnNfMBHwJsdRJ5hR0R
	n4lEJQCyl0fKFcefLlVpw9nUku7JKB5NTQ76WmJBCxvM+2Tya5EmVuTuqW89Vd/w
	9cbm5fAgo6WjogcUA4y/bg5sSIiOjEjt32g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k2egn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:55:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2047746a91.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752546; x=1788357346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoIXACsELTw=;
        b=No45AArK8Z57aGjzkic7BR7YeDA7OvALzNpseXz7y1EP7GE1cZ+T1ua23E5bX50k2k
         Xmgdm2hbRPgeXVcjYrQW/0Z24Z9onxYZI4D/qmwAD7LH3SlJbAtw4XDhjFw5YjqOjCru
         9WLthQ5H6p0VpcFqp/A1HimFIKVyKWysk2ldFDNKWnk+GoBuJZVRiTvwQ8nRCZowNf94
         0AS3dgcXe0JX7pRHXeX2ZT2M45HHnNv2YjTu5k92gLNRCd/KURar4+5ANcJQ9MzWWJfq
         3M7CVxQQpCxRfNyN4hVDsaQLw859Eg/VFopfvUHKR+12Wf3qXxJxVb+H2X+2w6fX1R6i
         +wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752546; x=1788357346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoIXACsELTw=;
        b=H6KZxLaH5xTMn95tZB5c5W5pN0v8ux6IXYEC+cQFqEuujB1cxnTvoNzDFNO6ya4WHO
         7gonxRxNn04S82KM7L6+QH2AaQONSVRoH8S+bIHkqtIF7Tl2c4TSnDwdV5cPgxQcAa6W
         6VcL0pppaBHjD9GYcquqQWkVoLDAoAnGADVGMBJ2eir3spPEnP58NpR68Wld4HQY5BRs
         myIhNSnvFveoKqtHSdp8pbcqlTST3lXuGiqjL998qR0Pjr5NB1fCjwzkXdry07MBcWzE
         HHb4Uud1sBw1dcMij8ryCMgglNcMVVGD/URsJTUbfVruNzzqd3Zx+fWveagrS3QyOBvZ
         7VaQ==
X-Forwarded-Encrypted: i=1; AHgh+RohoAsBSMgktmUz2jOORdbHkSI8cHQj20e3B5M9CFVc47kz1uQyTgN5aiwXj7xMTlQOyiZWV8wO2jtx@vger.kernel.org
X-Gm-Message-State: AFuF++n43duAoDXv8ng92piiffCl+o3768f/1h0HRUIpF9hyy1PuP4Ud
	RA3V6j3wD9tgiR7Cv5d9lnMrZWdEZYLaBWeuw4Bipz5MuC1VoGufJC2NNFP4U2yTYb2fVEO9ekV
	4xRz53G6svdqn5FgOiiNMvdz5JMjVF80B750vNPIWJJmOAFEfhDXHA4Q/jDJed8eH
X-Gm-Gg: AR+sD10BvJwOl7mh3Uo2dPNx1NFRRvErQSNPcCy0x5aJxfK/ifq1QnA0BL/O5cuEIrl
	ivJhP2ibDRKl0R7oihm5UQeUxMnLnEymqL0iHAlZhPAWRzKf2TQOOBeyKWgWZUdIXBTNh/oK3i7
	0HUIcndqLAfs1sZ65ssrJV9bSW/9xuRhCZvY02Qu431HQI2c3F+6Zeuuj6v3nGLS8TfyqL9uk4z
	thXzghJHJQPlBU3cRvHyeVT70mTW66HVDy+IvwADooQ2KytMtvCS8KN3KaOYFW5Gmu96t0RPJ5m
	mF+e+8TtFrryGCBy/dajvsfGe3PIjeV9E6Ibgm7aVw75IsEscitpE6p/16Wp/HceYmEM37DQJST
	As4kVJcHa9rg/kTdimfftjqsxS1Kj6ofBGb3mRDzejh/9vGc33z6AUxYe19bX
X-Received: by 2002:a17:90a:d2cb:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3966d36df78mr15644678a91.2.1787752545683;
        Wed, 26 Aug 2026 06:55:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cb:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3966d36df78mr15644505a91.2.1787752544964;
        Wed, 26 Aug 2026 06:55:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Date: Wed, 26 Aug 2026 21:54:52 +0800
Message-ID: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ef062 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y7D3pg133TmPf0Y34y0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX2+UB/nNsd8S1
 FN3qzZ3oZEe+aQHqjQIbXTLEAnFQPLBInsR8Pz4pnpXW8o6up7If2w7245cSAaoYeht9yCnL5kT
 LVLyQ6HMJKrI9v1xYri+kdA22Z6nFkE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfXyTTFBA+OtIXz
 YiF6KYoURclXPL6RDsN6L1A8gjNobLYchz5h3xtqvGIE6nxI3z8Tp0xT5AcN+WlJZD8p23OLqIC
 IPQzpPMDkFQ5reIvVafLSn/vNPPzj1afiYv6C15PLG/rQIMQpNu3T40SlkPUvqEbcNVnPX6dahM
 ppLGi5v+OMO5mwsxrxqSIH5hrufGls46Hbg/tgqDVrqUDDAav9g7/zRAyNoEFzfg5b2jwr8X2D+
 gqGe75owMuh8GZ/ABvrKaqKlILxIhic6KtUBKgI/49TIaiwCEVPjEEl4b7l1F6wv2v3per8oqHX
 fcvnSzYXWyNvzm7hXeJ6xwfrM2Kg3kdxfPryAPH1JIeHDsgYmdjt3p6v4z3YQkEIUDAHi2DnaAI
 2QQhGOvGuEjstYIT/zzFT6QGql6mI+8JsqxIpvkbFK+rPZBBk5N5HZ0/sqA/hU44wUklxpxsaEO
 7Gx6+91rao5oLQTv0qQ==
X-Proofpoint-ORIG-GUID: xhOPP66t5QpEd6JrHbIXlnRZ7H4ybXD_
X-Proofpoint-GUID: xhOPP66t5QpEd6JrHbIXlnRZ7H4ybXD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260115

The Nord CDSP subsystems do not take their memory rail from the shared
MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
resource. Add the nmxc.lvl RPMh resource and register it in the Nord
power domain table.

Changes for v2:
- Drop remoteproc changes since "mx" of remoteproc is just the name of
  memory rail input which can be wired up to NMXC power domain in DT
- Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/

Anurag Pateriya (2):
  dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
  pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord

 drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
 include/dt-bindings/power/qcom,rpmhpd.h | 1 +
 2 files changed, 7 insertions(+)

-- 
2.43.0

