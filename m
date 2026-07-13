Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6D13E6381
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944951; cv=none; b=FDI82jr8KEiPeGH/cxQIkoDv9Mes8ciBoAs6fQeHD0tYdSh4wwIz7zObbgpS7P2jUNjtCks7fGB1QHmnNBnBWPo0GrzAMY9L99DBS7QFZ48dnOV6RUHqLcb+JQ0rXlIHxXxyNPJNfSpNziemDjRVCxiDz3QkafWSXxBX+04sEek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944951; c=relaxed/simple;
	bh=Idmip/nOu5noW8nkQdg4s/Q7R9FjoaKZkmQtwHukCcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=deLi9M+Tr0NVEC5LaNtHWyCuYb67VGguC96YpRtzVvZVD0FAdoLqyHleyaDj/z4iHECvGd3yCX3Aq1yj9Q5MFkuXOHrWz3zelrFUrboSmZh8M50pgLp1NvQYkdgwrB+7iZbuCzHEPv2o/Ujo0FcUM0ffutTH+PT5yDXkiyc5E1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1NtvZHR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZj75XqA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1NtvZHR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZj75XqA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDjsh1398802
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wqxzQNuOSLpI4zoQgw9QEO
	mxgTQJ9nfCSI9GvtFZtCY=; b=R1NtvZHRN2zBl+YO+eLtZ2AFgLjLSMON6Rtoxn
	J2vHGn0nyaNu4n748w+J0ZRghA8LNGoAp1+BUgL3unYQPX0xXHFYvpMMc+IKfgBJ
	x+GwJ5Y0nvTRyUoLHRsoNVn8+Srqm48jv/ssgNl0SP1uUAVNIC/GM3Ep8p1UDKxn
	3m8Etn+6lnnfyWQEz6O7WMYcKfvAZsZysLOy650G8B9ziFny/uEkEbKbnvKv0MzG
	+hOtUbCm2jFOx0r2xT50sj6VEAW/Bx763l8iOhFbp5+t/dd3CRWncpFfqinXrkdq
	r/rx7dfY4/EybFFrtAvIw+b/WlzyL0TY22CnfFGFNEuTVtJw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4rfyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:15:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811279d51aso4111601a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944940; x=1784549740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqxzQNuOSLpI4zoQgw9QEOmxgTQJ9nfCSI9GvtFZtCY=;
        b=gZj75XqAoJ8eLfwsEHoeSAITHzdey7i057jnjhZFrCtk8AzfdnWpK5VTTnITk0ombb
         p2b2Lmj2ypD7XuwreGdCmCdPFdyvB52nsiMkrG7oXWM/KnDVC866kNDcfQJ3MbIi139t
         5cIPG6g8Lr0MReThAztio0bldmwVUUamDSGormNhxHFIhpz1hPaz0I4lqlvFBFj0DqrW
         kEOd+OON9989uo9e3cvC1juhGKJGSHoFLbO0qOa4cNK09ErnJkkuPe5H6R3c9DEYwJQq
         JJDi9+iwOnHwRD00to20K5QoYXt/QUj/aZmfm/cGJNNcJMCTr8gr/DYXD3XRmZo0MSiz
         TCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944940; x=1784549740;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqxzQNuOSLpI4zoQgw9QEOmxgTQJ9nfCSI9GvtFZtCY=;
        b=r34FUOC9fmTrjGJnzjHXGXwLytweo2+av/AXK4WIst3sJOF0EX4CXDbIQkqiFqeAl3
         wmtsi62SimdV1UcWDaChpaKj682r7iN/nSIQDh8oeynUq2NyasFcCDOyynlHYgSvUXBG
         i6KKTsVundFBqLjdgJEITT0Os7g4/5awLV0b6NBGNBI7IG2+iCt9xtLpRlVUiuPQpbdR
         w8+pEC0FTwj/eVTGaUOQ8z1DIKgjHFzq/5csV1Q3Pr6zMBquB25j+2fDtHVI/MkyFbWj
         KSZBYr6ndRIf9DZZmw7LhAAZC+KIZ/OOtP3QDrDMM0JUquspGhufZKodSdTpE8Q/6/mL
         oPEQ==
X-Forwarded-Encrypted: i=1; AHgh+RobkHG0B4jSgEkj2GgZwf80JBzMmcjKVsiIyhyDIM58yAVXK4ddif49yf30esCEJ89KbT+hah6OVNri@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqw4r/gaHksXJK8hlqe/lTUQ1Flie+5mEDFM8Wy0FiL4B1XvYN
	0w6e6bDlZzLVaSS3W/LrkbQDEkdJDq25e65o/xqBspfYhnSBA6B83dE4McrY0T36unL+6uaPd15
	jV9rrT+fDn8G+E0SpamielcsNq+JA2r8NI20nr0FUSEF0bu2OltYuAOOFTR/0FInO
X-Gm-Gg: AfdE7cnJ5iEez0Uquhkwfd3XJ99gIkuVhCeuqb7pNPkTxEF/SoV1NgJDQSapvNz/yIY
	t0VVRzKMPXTKVC7d13MbgWpTgCpESqb6kgLhqu0mA/J2PC3mD4i2F26ZWBGQKwD94rplxBxchB1
	By4fTm0+KPT8nEZQUpTZ9TSVXuC7HbjUfr1Hu14mKrnDtVwf2XMckHSM8m35KxjttylRjqpYtgQ
	px0LExFsuoQtMlZPp3cR3MhDJw3ROEIVmNhBRUU5ro831BvQIrK5m0qAkR7riq/EqDMZqW99bsA
	AKZv3n442YFbkuZJA8Qeqq+pucm7D+H/SLprjTbtM56vtUzW/bqoo8udXqTpahnzwLfG9t9e5hu
	hzY8RzIu/RXWa0rxNu+CdTYc6SKFZoorh8g5xqTIU
X-Received: by 2002:a17:90b:3b89:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38dc7778aedmr8357984a91.38.1783944940027;
        Mon, 13 Jul 2026 05:15:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3b89:b0:387:e0db:3fad with SMTP id 98e67ed59e1d1-38dc7778aedmr8357959a91.38.1783944939599;
        Mon, 13 Jul 2026 05:15:39 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:39 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Mon, 13 Jul 2026 17:45:16 +0530
Message-Id: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54d6ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=2gB7WEHjjayKgNmZduoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX8vrj1YymZqnG
 Xfa5FNZd7DNl1rRPzl6x73j44lgb3gnIwVUF/nCW0GEN7gS4up06A7kbR42V8XPEpyNlRkpEnM2
 JxwrFKJZ2Vn65SIQ1HqGed5QAtBpIy4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX5QXqniwCJswx
 Oeh3Lkfjn0Yhm/dHavy2dSxCOauuotTu3GyCE8bDWVD8z45SUeM34/ldimP6qqbCBcB/ibLluWW
 xRNk6NFjRZYrV/KPXAKrRvTm5v6owOHqxjgz7PYOSUuPzTlybCZDjxDB4BnEAUx6uxnBALQYa9d
 l25iTyFHwL6j3PRY1Ms+sdgf4eIuK03QEKgLQ5VrYkdxNySm7t3Y8rFFsi6eMIHIFJmolp1LWYo
 m/d4H2Bb7zpsUkmLKEoYXFgeCstCRNsKIbWV8fuEmPh4rwUlG8kmGq5hS3eOgPPp9ttRSOUpatZ
 cjyri7sGM89/icoVnP55ET6orj4Zdtiof33DXA2GAdMqu2a3F4zVWBrsa0kSPy36Q3SGjzy9Je3
 s6j9U1YXG3rP14si7OyySDLaih3eq9UJVFvI0pb22SA5a8pBvtzSw6GJCIfKoI77YfmHWKogz9S
 iDr5SPBcje5CaZNadgA==
X-Proofpoint-ORIG-GUID: G_kYcijqqAmvwW_eRK4SCQR7vGRckRpd
X-Proofpoint-GUID: G_kYcijqqAmvwW_eRK4SCQR7vGRckRpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128

Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
functions as Milos. The key difference is the slew rate register
layout — on Eliza the slew rate field lives in the same GPIO config
register rather than a separate dedicated register.

This series adds support for the Eliza LPASS LPI pin controller by
extending the existing Milos driver with a new variant data struct
that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
The pin descriptors and function table are shared with Milos since
they are identical.

Patch 1 updates the binding to document the new compatible and the
single reg entry used by Eliza.
Patch 2 adds the driver support.

Changes in v2:
- Use 'enum' instead of 'oneOf' + 'const' for compatible property
  (Reported-by: Rob Herring (Arm) <robh@kernel.org>,
   kernel test robot <lkp@intel.com>)
- Restore 'items' descriptions for reg property, drop redundant maxItems
  (Reported-by: Sashiko AI review)
- Link to v1: https://lore.kernel.org/all/20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 18 ++++++++-
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.34.1

