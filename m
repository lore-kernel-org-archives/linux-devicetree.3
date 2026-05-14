Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C981EA7F4
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731547; cv=none; b=CdPgHFo6qpjEhxMr0ulUW4fQxAzhH9zszfp03Sy637W0RcCiib61/1lelFAQFinxcJ3T/bVp5hDyMwxqMkXpNO39s4fAIVxBTe5kub3WyY8TKV3pW8cuKiiXoqPTr0YNv00z1RkPzckKFivh2Pt36HA82gTxqMvpCX5qMkTBFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731547; c=relaxed/simple;
	bh=un0IRtFtp9HGA/SAnUxGPXD5R1Ixbj7GtriN+lXDHmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t95BZ7uWOxzdF5EqZXYQvO1k0daU8OdvJmtPgJiJd3T/7J3SW1qBhj8uoWo+nYZTxZaITUEX4xgJhNjLckM3lws4V+Fz/FAljVeZjTOJqIIa4QVQhEwvAwp9ZN1zcXBVIhr5eD9QDYBBo3hU2MtlxAwuYv56pp0orkQSOWJXNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXjueYvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAB3tZ/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXjueYvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAB3tZ/2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2RgoL2524398
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AEoBtD056KIOqMNBS6wtuX
	6v1ARlOzo/InY0Kh8om3Q=; b=IXjueYvP2nFtyS1pkdpLJ8NzxjE7bdNF9C8a0+
	CdSrb8r+tjLbww7Yo8r5hhl9cpftNHLHSoNFZzKjWQZ4i4T1moZXo0Q5YHwyhtoc
	8sdsQ1Z6Tvt6+dPPZB7v+VE5L4ahg4rXt1Yay+JdSlCPzfTgsyv2/hnB80o0rtUa
	WgeVdoL49axhsU2wtkKCgli3DOtlK1jo+hkJ3iN+nPaT8Z5W94c9G17HT+eUiw+s
	SQpKbeGkSBIGRm8a5T1bkNe7DfV4l+JBS3wJydd1c7r+89jJpjNrFquUt+G6FDKJ
	Qeg/BzQtoHl3iPrUlX+ByP+iRmFH7rPOahGEOhZR5OM7xutg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjj7pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7378ad0so63030305ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731544; x=1779336344; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEoBtD056KIOqMNBS6wtuX6v1ARlOzo/InY0Kh8om3Q=;
        b=OAB3tZ/2cbBvIuy/CWsgXZIRmNdKqUthveTUtTXhBJF3DspCKL4ZD1WN6cv/IgMElm
         QXAVdY1hEb4SVqZCAJoPYblViAza2GmwBgqAcdx9BmJVGYWI05c6Gql3ex7BcnA+883V
         YZQSPxKpRbyOl+51kBqsrYqxUw7EoKtxHjq/Y0oYQdjnxx/cdHdSncTFZLO91jQq1Y6f
         vzvZmsxK4YdaYiby4O3QYxEH7a2usORP0JC6esubEtyOA4zYn/Dyd2wrhQQzx1+c0EPV
         Ld0J3PJiJErbCPEYOVe5T7HPRptlNZBG2tcL531HL2s/knlNbsIEdUYWFTwrsg6XThqF
         7NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731544; x=1779336344;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEoBtD056KIOqMNBS6wtuX6v1ARlOzo/InY0Kh8om3Q=;
        b=FdjB6ePgGfFSJrrkuHhf8Nj18ymthWGA8KROZiUCf9w5zSTeyI+ntqu9O6rS3fM8Ut
         wJiOxLo99dDqXu3nIvVwhCcGJcJjwr5zW3TM5dhc2HI+ClnbnGCvhwPTWxtdmJz+GKMW
         lg17rZFFJeXTfvNMMrbMciclcG/QfmdCtBBEC7k7cMRNDokAN2i2bYK3oqLyK4rqVDd/
         ekuPxeek+rdK3tNEJWlWV1lB7YnaAAw9gojnpnb5uegJ3dyuUZ9GJHBeOineCfQjvXuS
         BqUAlmZsdW2liCyw4zKHcqi8U1CAjFbyMgEYlQ8kl5tgI6dTrmm4ST4AE1CXabT2Cjyc
         IUEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Md4y9SHra2zdpCsBNABojyomm6jItb4Gdd/fAKjf8RJUGnJZI6VcGmldH7t6WNKVk5jmkht6oEGv9@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQ461Tf0hJgVBC1QdxEiiSMvtClaSwdmYHV3QPHjcROi6oHlG
	+WwftUKzBxeHeulN44DJXSN4MMTx8vgE4J2EL1BpUCSHVfzUqcGVG3h9stkX02SIP4ZnSLItfRO
	1r8QbB5hJ+KSVU31mygPCYiziMk3nEWx0kPGhKmBDBxts5LvCrZtrZ6FpkxNxiJyu
X-Gm-Gg: Acq92OGWd15Bm3YWYIBkgrm3kUWtnZSyKJps4PnlWFDOdyRtoFYdX09lpn/mA4fBecM
	OX6rheqAuslgoA0ib0UoE1tgTbMIRQXiOm83QAQvvbXzOQ74LoSpua1G6zE6S7h7tUsApt4YvQN
	v5hj4vyCt6dS6pddVHr1PKAk7FGRKUPxyI21bPFRmjqaC9lWZaHucw/0nlwH5pUwPZTpQ0iqALu
	J/80azQNYc+4DfZk0DNxydq2HE61VkdEaSUxun1Jd0rit4Tqel0eP0RYWP+hoJCgfCFG7HBthhz
	4dGa6HGE4Zkt6FAymzsy2ucH6T8/THkCrRY0+iUSzFNV9vA7M+MSIqZDcBKwPl3tU70Qcqvi90v
	A9V0do+xCHmAKG2cNYEKSgYrO4svf0fYsWCjlQSE7+VnzkjBqk0IqnYodhABj3I4Owg2Mn3lUoH
	uUHeGe+qavUgnLsQvbLiiMMG06Dtawx3ub606lVIfZYjzJAuOIYX4N9CtvgGzxzA==
X-Received: by 2002:a17:902:e74b:b0:2bc:dc18:35a2 with SMTP id d9443c01a7336-2bd2fc24a64mr53203825ad.26.1778731543877;
        Wed, 13 May 2026 21:05:43 -0700 (PDT)
X-Received: by 2002:a17:902:e74b:b0:2bc:dc18:35a2 with SMTP id d9443c01a7336-2bd2fc24a64mr53203565ad.26.1778731543269;
        Wed, 13 May 2026 21:05:43 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:42 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable icc-clk support for Qualcomm ipq5210
Date: Thu, 14 May 2026 09:35:34 +0530
Message-Id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5KBWoC/x3MQQqAIBBA0avIrBNGzYiuEi3MxpqNmUIE0t2Tl
 m/xf4VCmanAJCpkurnwGRtUJ8AfLu4keWsGjXpAq3rJ3ktOl9UKJboVTTDO0GigFSlT4Oe/zcv
 7fsdIHPtdAAAA
X-Change-ID: 20260514-icc-ipq5210-0ab03f3a3e83
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Hsnj66TeisWoCrCn1YI88JGUCYcRt7id
X-Proofpoint-ORIG-GUID: Hsnj66TeisWoCrCn1YI88JGUCYcRt7id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNyBTYWx0ZWRfX66tQJTqWUUXH
 oHILSIk0ec6Q8I98J1UVKQXTq4SgR3ansTZ8Ym7Lh9DyJNhLQnljmeDwD60AjRgH/hGI3X9mk+g
 mcej4DAE4oyP+jkveSBcEpM8hS7M3R4s60LyH8apZIg5Hkzprk23fjJH+2Wm5yqhla/UN8fvSyF
 +6PhAwkIMse67BXZwPs8dSqNVVcIYHftce7pS8oO8eqrxQMvspEwqsaNQAowdPuJT8WlgGaGfzo
 mmNqWJ5vGfEwl0AmpHlcpWwezZAP0vTkOxL7pTiWkNRqK7eTMdZ1O0D+RpOVGJhcW6zBOLHbR+E
 m38oIYpIORuOYJatRvD9Y20yBGoyOGtGSVHzomw7KgS53i0DypWzeqXXcIH/imJvsDEO/r+MzSm
 Z00qc+pbWHE9A8uCc/9ZB8PBptVfX7a5cz8dg/5FH/wqTnmkof91ROAJEAiqoYd4MEcec9pPoR0
 Lbfq65QY6bVHkhfGvsQ==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a054a18 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=07cjT_76NfHvuXGZdNoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140037

Add relevant master/slave ids and update the gcc-ipq5210
driver to enable icc-clk support.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (3):
      dt-bindings: interconnect: Add Qualcomm ipq5210 support
      clk: qcom: ipq5210: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq5210: Enable interconnect capability to clock controller

 arch/arm64/boot/dts/qcom/ipq5210.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq5210.c                  | 16 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-icc-ipq5210-0ab03f3a3e83

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

