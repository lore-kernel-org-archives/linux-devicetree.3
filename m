Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFFC356754
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055050; cv=none; b=nT16hAh9D3e9rfDWKagM08JWgnc6CVMEpXxlVGJytiAfuIbmXMC7jUreQxJhiJqZxByWywV/LPb8LZuVF6cgqk2k4OtVE8GNFcmFOkk50M2IeLTiVJOq/ihL0bVbT1+Jwula2aP1WUKu2CXkPVZO9Sac0UNKE1rEZyAhfVhu27Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055050; c=relaxed/simple;
	bh=s7fSnjoSnd/wINZ2W0kztndmGynq3HRQgtXJQD3txzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F8X75uSinx2ZNk7JF+4DCUoT9FPAQ9vpQEsPiN3FurtBa3/1kwahQQETdEUSdLJfb2BkTg/lKgWBhnxez0GPG9pF0wOisdeBJ/s4DYJ/sowfLQuFDmnd+bZeuHkXuxClJABVF6hZvcNgG2VrvkN+ZCh0eSSEYO7ll7N8xqShVLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9bwdtFC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqzutYE2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9bwdtFC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqzutYE2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342fdX2777606
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 05:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5WyoGsIYKBPK0Ky6A1rZDa
	hRDD+ZrB4ddT2JMWFeFtU=; b=e9bwdtFCzfzxD+f3UogEqveVpuxa6QxcRfSNt6
	Rc0KxrUrGfeZU4gY7KzHjhr6ql2aOsf2TBW1jl1U5QZ/w0Oez1C74hR/aonCz3/B
	uXv6WVNBFaKPzAyk9DUfGqjhsukrnBpYNx92Ji5i5mFrByBMqSzyOhqXkAdu9G76
	CS32JlGXrM8oHcARA/8IZoMmDQf52J6XD18NFGh+DHyMyZRwJ4WL/2frhB27f+I1
	Fg9PMnhsVHZ4Nu7p6yD085kc/E3fJcRcDGlOD+BzwI8jsNT4lPXOWN/KB2HhfT3k
	Rd1C7HGAdyCbFtgSHc7wAkbncqEwhnmbcqvHg1Uit7e6SSpg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2536r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:03:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so380368a91.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055035; x=1783659835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WyoGsIYKBPK0Ky6A1rZDahRDD+ZrB4ddT2JMWFeFtU=;
        b=iqzutYE2HW5C7bqa/6AhxNLI4s9EjK2U0CRDVxVyfYk84FL3ZkWBotWCFC9wNYDYZ7
         uTsyIzkziKexhtD8fdE4TrDmN+AFmZnEsTNWV4nZF+Ypf/imPqN1nUkxLXI7Jpn4JHS5
         YMRi6UTeBXysVBsuBnE+7udefsuIUkRXoWEIuV713bi5LmNRbkBUN6855ZSrvJLVGiYU
         6x+4ln2ZS/IqT5AA75l5yD+TkJ9t1rqmGdibNDhwWUSJFtlDf9UsRcIMy+J3VwwOcGWm
         HOqkHyaKdtRcB9v5bzbHuEPzWsedHu/pGevz7nfRpvyZuzMlmsdpRfez72f5Z1eEyoSu
         NnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055035; x=1783659835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WyoGsIYKBPK0Ky6A1rZDahRDD+ZrB4ddT2JMWFeFtU=;
        b=ltBXLK4MhdKo6RANlg/Hesbj0wopkySn/EbIJChED67dTSOstWLyMeHPgjF2JJX6/M
         wivobDzcwn0jpyeyDr94UPwF5tvYQ5ns4IA+fA2KAlmtdVv4V8kjSfxCJWTgabJMSs40
         ZmWHLjnTtEAowhx54JgwqLp1fHphvPH9Lge9Wda24/f8mt71C9Pp2PM0e4/7C7lfvO2p
         4TTSTt5BftYXR63FBIDEImIivnWDw6Oz8qgkYT4As0b11e5igQhsVh9iGakvclHd27qF
         HoW2W86Ppr4uxF4lM8ARJvhd43tB9TPya4Nu0MFbSay7k5qmefRir0wYnKuphWCB0jjR
         JFoA==
X-Forwarded-Encrypted: i=1; AHgh+RqAhAlG+eEVZGZh0LJEIb3CC2zmssbROI1RJ/CB8ldjTcu3GT2Bu/8X2IETQGVlEMtP58BiG8rmlXTR@vger.kernel.org
X-Gm-Message-State: AOJu0YytJoO2sXHosTujDIn3UizayZTzYDbrb/sdETvQ29QqpZOwnVS1
	1qDasJw/RZrPCB1U4LajcHWXQepFx4Ap+WIqxv9GV/SUwQ9xQY/XTONUPPL1XDOkrV+VhA+lpvg
	muVRcKnKh5zIPmqlhWyM3NHShEgft1DNp/yNlQN3dBQN6m0bUtomKtQ2ev/nUhfzpeMKrzn2a
X-Gm-Gg: AfdE7cm/30Y68LSmIRDfF4rqtwfRdBx+UVgCF9DOlKvdmJXE8QSqjU2g5qJgExo465I
	lnZ0OMTTGsDDZtIBafXNwRodQkFPDB2AhrkA1gGHvXNpu0RuHthq8PZXZJLv/gWBs1HniBBLO7p
	S97vo4HUj3fha3Cq40GdH62j3sFuALLOeI/XD/Le5DhdmfjAgT14gkGW5Bhf+BimMV3+IL2dWc9
	xQNeY1o2+fgexCLiXoD7C5+R1+/VNUMK+2BAESizf0nM/GROqpCo54qPrYhgwE8b15tg6eO3/U4
	CSQgcFundVeszHZQgbbSH4ECcTglu2BGh177GhIxUPDiQ+iYVczWXa4uafa+2a4bPIi9RTHuny1
	X4vToFAFAIH5BYBaaD8Dj/5El4Np317i+vMg19YgaPJXxOI4nyc5SC9XP3QhknI2qt0I0aKcWqY
	IxJ6Ylp8TLVBonn/5ADWB3PUIgY0eSVzeF8FNY4Wmt
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr3598849a91.8.1783055035530;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr3598813a91.8.1783055035069;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add APSS clock driver support for IPQ5210
Date: Fri, 03 Jul 2026 10:33:46 +0530
Message-Id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJCR2oC/22OSQ6DMAxFr4KyblASZla9R9VFCKZEZYwBUSHu3
 jBIdNGNpW/7PXshCEYDktRZiIFJo24bG7ybQ1QpmxdQndtMBBMhC0VAZYdIVfWmkHuJ8hnkfhg
 Tu94ZKPS8qx7PIxvoR2scjibJJAJVbV3rIXUamAd6Wj2yAaXGoTWf/ZWJ78Q5T66rE6eMxioRB
 XAeK/DvLaLbj7LaxK4tu2sSFx8x/sMLy0dRmLPAl1msvD/8uq5fFsIOEBgBAAA=
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4742bc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aqkEcFr06yCu6TYfpIsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dQDAIUFcA6qKcUDxSLtVEF2vBi2XIS6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXxae1hpkmcVdX
 2MJKgwzrrKJORmQoaOmfjD7CP++4b+LLCWaRBlOwUyz2l3m0NQuTRw19DmzRvQXmuOdzJpI37qK
 ZRq1d9Z5P+O3KQS4jYSff2KHF8xL2thOWexyhE0C2gXXJ4qxxu10bVaD/SJ8B33OJnSXzOyIpno
 38vfWUSCYDvsnKPHb9z9yUWzJry2H3SD3kJqMigSVwN3+RZ6m6wyw6ATHsd8+5xeh04emQpsWHj
 JNjLYkMI/MCCPLlVLaQvkSRwR0VOooiB5+Tid3OZ7QMIXTki7rJLsVmTPQQIQP+a4Gif3FdesAo
 /CmdNFzqGdi9AzXR65/+AIajRcasXADmuDoOan1nSi3PQLtBsOThQfQg4GYb9NZr0SCnAoOEdh5
 257pPqBnseg+z29vsUqEhKOnHFQtQNE75QfmcfaUUaUUwjQLMBAdEk/TlSxQZ9AW84W+KQQ7AXe
 71uvraHVjh5JlxPRDQA==
X-Proofpoint-GUID: dQDAIUFcA6qKcUDxSLtVEF2vBi2XIS6M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX7v2+dD9+ZXLC
 U54z4gYmrXEUkqqkTVxXDsir+xq+e2aZJoJYKbx9o2fI79pC+wDgX7Je9CbGdIoC4qkLjXU5hfP
 OI8j1NVgIqSMa2Tw67KvNl0u5Dm6YYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v3:
- Marked ipq5210_pll_data as const per sashiko review and to match with
  other SoC apss_pll_data structs
- Link to v2: https://lore.kernel.org/r/20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com

Changes in v2:
- Remove incorrect tsens dependency
- Pick R-b tag for driver change
- Link to v1: https://lore.kernel.org/r/20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

