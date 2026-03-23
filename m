Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4662D7398
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246806; cv=none; b=i7FpVvc2Xjg6rlSdLrhPd/aoecrZoIhU197/OTh88q2PiX55ysm7trPznC0VBVvqAdK7Y4MnM2fL/IWA9t5MjInPdLL2sk4QgayjXlxi3+qpwXjOB0RLaQlOIsivvIhl75RWFvAuMjngPAIiiFebnQ8pzlxyIQUEqYYo2FFm9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246806; c=relaxed/simple;
	bh=QNXNvnY2Gh+AxXTv9dpnUuKNkYIQ137rk0zuFRUWgK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O/72Wl2BfoJWjWZWKbqYrp/Rj9q9orSl9dHZH3FalyOVN3k0rwLJQMv47n2ithm/AeWNT4LrLAA0UTPTp470JKIC68vaofh9jFwwNphRIR3VWN2KD6PR0f8BrLK+lQx4p6M9bYLHMCR1VCWXb4Qk7rMm69IEipj4QvtDrpn4jJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4Ikj//E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePHW1zqt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4Ikj//E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePHW1zqt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MIswCZ949420
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eFCEpBw3BuLI0ad3VhJwft
	LsmrqSupUObcFrR798rSc=; b=h4Ikj//EjkMrsqeTvE24kguIfzBXWGQ3DPu/r9
	e8+Kc+TTk1AsjwmsSMeOlnLDwnUZBunSV7Ofjmdv1cUcJA5evLaYGiJq/zGKkteB
	UXCH5a2yJl6k1Lefuiw6wOSTeK/j1OxkXv+GsVMiqV13GpP+UOejBocnOHhSPX1a
	BeUhpfpaeb0KsYbJ9tsq8eACm/JDeCPr3H6pSGO5GPkPmTNXjeKd7w6WGf+Rgce+
	0v9lJC1m4gyupVI9mL4jjSeQjDC8yeKUKlYvpWfiQUiIN8Qfssj/Z6SVLf86KovH
	g8B8jlfcOCV+W4/GXV37ts0c3uN0b4dJT7zoey3RfiS5uHMg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghbusf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so9735533eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246803; x=1774851603; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFCEpBw3BuLI0ad3VhJwftLsmrqSupUObcFrR798rSc=;
        b=ePHW1zqtqrl6mf76nbVo5gaywXQtIVuoNIDKHiiHIoO7pGpaIed+GPFgKwqXSyC0xq
         RSrofBlmGOg78hKvzJvDm6gufUoNUUXyOaC6QS91bwTvbSxB95DZY1CXOtrMalkyQZzS
         yTeA/0d/C3+R0Z2Bw/Tzx0d2vrzbSuGcW5aizxw/pPjzhBQfhZZo9tCxabXD408ZCreh
         aZOgmGLMlsUTUUDTUHnqJ6PvIIsmT3ObCpGGi4V48RU1LWCrnFDNtArEs11fJA+Vqb9C
         OFLvlJRVpU8fNCw8WE/q2vTjK9JoPrqssG+IreER6QjbxdBan0nbfEbv1w6Gaz7aUASL
         ia3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246803; x=1774851603;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFCEpBw3BuLI0ad3VhJwftLsmrqSupUObcFrR798rSc=;
        b=Q/jiEFnQ8PJcKIhG3yRjroKR7O6wyTCZ4zKcoMUgIZQH6ofq3R8iKy/u53MOMKhfLg
         AkzTxp0GGf+EvnM4UvKgsJgO2yLUc2iojlUxsUj+X7xs2XuFlLG1nGpDOGTftjY841Mx
         IT9cr9cPm3RcsszqHIYE0gO/ZSx1C0lG2gcmB8nj0uOvqgCR14pZzEDky5MG6Nn+q0Cx
         Ey6N3H+zLczN9F0WtmEj4AF4uPzos5NDvG9YXdqDS+6csMZi/U6tGaQcasXOmOOB5ePD
         3yaBtFz64g6xFBDI/eQV6k64pAZYdUyjOPQnjF680Uld+h6InBwpwOm9FgSufW8bdfcL
         T3+w==
X-Forwarded-Encrypted: i=1; AJvYcCX+uIpw6351jB8tyRqS0ox0zt9xZ3S+e/ekG6+B2WH2GhOHPMVAE2x52tQQHmVKAW53lPfl3B+Kfz2C@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6d1W5SMkQYSYXxGDoMQG1z4lgEI+3Qo0Jo1NBI8H1D67JKFU
	Osl8y0CWYqedVYRppEF2O2/+PqMJsfSCVCw5yQFvBRaGnalOrcuvX6tbkar5OYPB9XD4GSA2Fhl
	HzMXOSFfDA3xvBEOFH3eXROZxRwIX3d4gvmdk+S2R22uYGzvtje3UWCjnFzm4G9Eb
X-Gm-Gg: ATEYQzw0efA9c606PhbyLsa3I0l3nsCH3bS0WKetTaCLLb55Bz+kF1pOWmP+BqQwc58
	NWk8jH066ZRwgedTzdiInCkj77c6pxYXtJfo4hmtsS/tBYRbimnhAf4hb5b/EbPEjh0qqX+xjMa
	Ky1PXFLhWLPgpvsvIWkEUTAy3uwzmvsc3kswUDb1Bw2evtUqMPX8lNGq18P9KSFrK6mDvXhARqz
	1O8paZKAgKOoMzLh3/ST/MG3ydFpcFcJL3A1emzE0cA7ndsDcoauFNNTTNsD5u1sk+VzUaTFce5
	a0JUdxIVqBGMxHWbs9BY8L+/Ai8/6U/C9kSeyFPIukplOgDHuEDEQA7lVBuuXjQKCJYfg7mni27
	lqhXmc5VyFE/OYA9ZoLqwzhbNH4yX8FBLsUDRj13lBdaE06tHI7NT5bngvrkyW6nIwJpVFmYl
X-Received: by 2002:a05:7301:2f95:b0:2be:37d:3d6d with SMTP id 5a478bee46e88-2c1097b37camr5133694eec.32.1774246803374;
        Sun, 22 Mar 2026 23:20:03 -0700 (PDT)
X-Received: by 2002:a05:7301:2f95:b0:2be:37d:3d6d with SMTP id 5a478bee46e88-2c1097b37camr5133668eec.32.1774246802752;
        Sun, 22 Mar 2026 23:20:02 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] arm64: dts: qcom: kaanapali: Add PMIC dependent
 features
Date: Sun, 22 Mar 2026 23:19:40 -0700
Message-Id: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzbwGkC/zWN0WrDMAxFfyX4eSqq7dhpGGP/Mfqg2MpqViepl
 ZZB6b/PzbYXwRXn3nNXwiWxqL65q8K3JGmeati/NCqcaPpkSLFmpVE7NFrD17TAklOAuILtvCE
 fD+jYqdpYCo/pe1v7ONY8kDAMhaZwem6g1vYPK3y5Vtf6y6rMIrS5+uZ1U1V0U8VVICcJcHOA4
 A9RY6ShI4fvs8jucqVzmHPe1fOm/pXPT1r7xvCIXTdgaL3X5EbfOmO5tUTGju0YkHRAuw/q+Hj
 8ABJBxvAKAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=2717;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QNXNvnY2Gh+AxXTv9dpnUuKNkYIQ137rk0zuFRUWgK0=;
 b=ft+trLRcYUQjjNXzSWtT8EM8Bz1vPW+R0yeyT3CPvtCiAPE4ROBGcnw8aq1lawiQOPUtA5Jef
 t0bjt8ZgP9VD2rk9Er0msN0dtQahi4tocuEomvsR7ZuR/ENZsK6B6mN
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0db94 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9eyiDgkpgt9l64mz4AwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 2WIUQ-3voMblxt1S44qOBJC3oggO8GtP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfX6bYS3xUjJfBb
 r5KaCOKSRw2pN6Mgy7cinK+CY8IxhVgmvuqGBqnd/mAMMAOy/pcmgzkSt0DcsKDR7z5eP8Nzo0P
 GdyU5g9U1ZkRJgEk/uZNRoAUqArb6Deobe1rYGeoRKYBKrnYH2q26hoZ50dLpQv0xWStWAtalGP
 WpQzeOHvpBUqA5UVnFM84O3sJ1x+diANtru1q9Nqf+oPTz6OnjkmD4+b913SEKpkNv8wzaiz8+m
 V2PaRItmF/yCpJfHHwMgYqFHtZbHwIS9nyIlbFHQS70ieNFmcLnSNwY0G30t6tpEg1Gi4bmCVGp
 fn98ziD0XTVzcUou5DL7op9DhWFJHX2edwfQXbjhPRR22YePotFAZf7NHdhWManZoZpXPgJbYHv
 PM3PuONk4+0wgMQUeZrmUY4JZnZ/lgNThaWrLII5DsIVsvdYstxewhEfOlIWo5yZIIavySrZ0dD
 isI7b1pyCJnEkhraPgQ==
X-Proofpoint-GUID: 2WIUQ-3voMblxt1S44qOBJC3oggO8GtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230046

Add PMIC dependent features on the Kaanapali Platform including:
- spmi-pmic-arb device
- various PMICs along with temp-alarm and GPIO nodes
- Volume Keys, RGB LEDs and flash LEDs
- bluetooth WCN785x and Wi-Fi (enabled on MTP only)
- Display (enabled on MTP only)

dependency:
dts: https://lore.kernel.org/all/20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com/ - reviewed

For display feature, there is a 20~30% probability of crash during the DPU initialization
stage without voltage and frequency alignment. The issue can be fixed by:
https://lore.kernel.org/all/20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com/ - reviewed

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jishnu Prakash (3):
      arm64: dts: qcom: kaanapali: Add PMIC devices
      arm64: dts: qcom: kaanapali-mtp: Add PMIC support
      arm64: dts: qcom: kaanapali-qrd: Add PMIC support

Yuanjie Yang (2):
      arm64: dts: qcom: kaanapali: add display hardware devices
      arm64: dts: qcom: kaanapali-mtp: Enable display DSI devices

Zijun Hu (1):
      arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and Wifi

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts       | 331 ++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts       |  92 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi          | 289 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi   |  93 +++++++
 arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi  |  62 +++++
 arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi  |  63 +++++
 arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi  | 213 +++++++++++++++
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi |  68 +++++
 arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi  |  63 +++++
 9 files changed, 1271 insertions(+), 3 deletions(-)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260322-knp-pmic-dt-4873a7d906e6
prerequisite-message-id: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
prerequisite-patch-id: 46f519528d63c06ae8d46857285f08dbc0178a11
prerequisite-patch-id: 80394c38f46592e7bef58b2670bb18e9253718b0
prerequisite-patch-id: 2b0a4d96d4ce86fc6e56e80316f53f30020abf65
prerequisite-patch-id: 019501eb4a1a36a34c5b90f63bb2f1b521d6d60c
prerequisite-patch-id: 46ef2e848ebe5af55c6e8d6e16c775f4e3db4ed1
prerequisite-patch-id: f24bbf211e6fe18d5a022b1bd31050b0b4056cd4
prerequisite-patch-id: 72c1a9d0eb5c8a94233d47809192e033ba2cb6ab
prerequisite-patch-id: ef3125ac8d8471149ab219b79a90304dd491602f
prerequisite-patch-id: f7fff260ebea331c7faf9be96eae00ceb42f94bf
prerequisite-patch-id: fa0135a52b89f9c5baa8c9fa160d2d927e4e37bc

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

