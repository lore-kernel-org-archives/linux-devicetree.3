Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D37335566
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803290; cv=none; b=fUwnlmok9O12MbQQV9qwfSV9RPSzlLJ/1c7d5BIUT6nsy6A1w4H4wPDCqIftBDoIuEE65hXrn5pjkI0uV+5i+kxet7d3QIptvs7XHDLH7F0cgMbwQVWlPmwMmgjNoyHmI9DVRityoFB614Wac2AHVhl1TEJo56Y+or4mrs1cGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803290; c=relaxed/simple;
	bh=LCqQueoooqk1QVlkRvPlmTHpiHm8HjxSiH78KPzgC40=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vFA6XDnH99JnKM9LMksrS0zARUJbj3soVL2sp9yYRwp+dy+Tr6r0/R9h7YaZVBqs8lP0EIVIgVzck11J/wwcLe3T8tvVwbX2F6pxzt1AG5DDvStObHGs24PCrkasP/7J4oWv9mHO7rQHSQu8m+sLW1bdUH1/hzOCuXINVpQbKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZPMMwbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoqKNGE9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZPMMwbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoqKNGE9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IGpDAp2398018
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TPaQW4JIBNiyx9NXi9UMuQ
	jkYUZLH9jSR0WJTcNOy8U=; b=dZPMMwbIYv3uVzmP8YkVFhpnuZTOP200JY7Pb9
	ooDtdhAz7dZRFXxVKXDTcAW+uGdFJtNjWt0D0vy0pbTrEXGheyYIs4dDYLefHdpH
	YckYIjzq0YCc4MykVjBYQWLKcbjEZphz5GLWCI+fyrxSr0z+GeSbjbu1JfgDFyQu
	HcbUodEPUOEeUczES3oKV9Pzfb4JzCq67oRHYBpaSvaevw78Zg0zl7F6VDULQOFY
	Clki7w44UhKmRPG9BeTKhK0e/bA163NXhG97f0DtzYH93WWLPwlz+3qT3N0R9I/2
	r3jHzIGfpKdsB5j3kAoqFS41QqhwsUE4jm+AxdUgTKMp+8+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm228ask-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so1121613a91.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803286; x=1782408086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPaQW4JIBNiyx9NXi9UMuQjkYUZLH9jSR0WJTcNOy8U=;
        b=XoqKNGE9Gj7cSIRk3UpyXLIW5Cdc6CLQmlz8zbO6S1P3GnjDt1C+ZXT4ENuioVh9iu
         mPbhfMtFo2UjbthIkTUKYvGYlYK1peZ2Y88riX0lUpU0+/vi8rOLF4GAZpOb55Evhl5q
         FJGeU3jHZsbjOSVlek/yxvxDi3PIEGhqU31rxI29nr2WQk6t+dMnfCz448u0Dt4Sdjnu
         AImIELagBi2HXpavIxyWcQoti6ffvo3CDM4aKfZGywReYPsfbUO4h9rr+fZE5l+kSHYF
         N+7oaawB5/3152YMaHiEAJmasXkMV0TXUHymeM1nn4oTQZWfNb9MKYwtWDlRKuO0di3p
         xsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803286; x=1782408086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPaQW4JIBNiyx9NXi9UMuQjkYUZLH9jSR0WJTcNOy8U=;
        b=lqYcP/oHDP7BvnBffsBezNAhTAzWSg4wl3wYoK56guuyR0Aq+qD9o+baI0G/oRr9W0
         C0ID/yi9i211ng/lBZEEzeZwnzhC4ofbCtBzPmb5DC9AP+HXUJJV2kEAw9hM6IjqW/lY
         WJHxJnFV6YV7GliafOkSbTMt0r2VhRxyKhTedK98639/E7/aCkoNwF835zyrRyRL8BqJ
         rZ6ieLBnieaEsgDrAUh6mC3Z8JsTU1EE2SvfKUVH/jWIep8JzPf078CNbmXS6F0YZe7c
         sKHT3KSTPdQZdgKtQWBeVc+tYQbSW8k7VuPo4+u6tUPaoWrP3xizFeohzpF9ZGus8Qpn
         mS9A==
X-Forwarded-Encrypted: i=1; AFNElJ84gKkNrUb6aAoAL/wl5GLvZgRB+nrfdtvEzKCyqiSMwWTfMdGsmeUxWzgvmE3D524JNXC55QguY2DK@vger.kernel.org
X-Gm-Message-State: AOJu0YxNERS7wNA7vq0aNL7xtgVUn1GTfFKJzBNWVs8bKl4wuAvzK50U
	AA6kGbxdwP+E9Bb9IZ8KHn4RrajnQZ5GC3w4nGd044KyvDIQ0f0Q2oEqEt+dNwsuZORrEf/ejvE
	FUxzfr58tl8Y3sWxj64rhMT00GUp7zmHY0OBydXqZT7Z/UqG2zHLI3ttUPnrKiddq
X-Gm-Gg: AfdE7cnVjxmOn6HTZp1RSLAK8xRcFHgXYZKDSuz9QVSYn2NuULOlwbeG1ycCsnnynRu
	e/KcYMhkTdfl7+ZGRDsvFLdRWk9TQmGywUdCLcdGxOjUM1XLJsDfqDvFDWxMyq/36JZSQAyoD12
	yaoWzXFbxPbgoX60lWkkXeOQmMVjtXG0vLvVAKH0AM+Zmtc1CRkmzwH5i19FzVruBjIGULWy1pC
	1VV91bPUYUCxyE6AEz+BsBBXaYtw2A4s1VwqM0vsQvxyrItweQtdXRXmg8ojjXQkL3UaxjYmTbB
	QTVYeE55quXQ4jNu8AX2Kny1y9a+Sj1E7/+1kHcaidPpW13PSeDsTJbcwEQkQGdwC1sUU5LC51c
	339bqHJVsW2x+Eb+CUWMY3uYyF6o2g/OjGs8=
X-Received: by 2002:a17:90b:538c:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37cdbe3cea1mr4395921a91.17.1781803286545;
        Thu, 18 Jun 2026 10:21:26 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37cdbe3cea1mr4395860a91.17.1781803285974;
        Thu, 18 Jun 2026 10:21:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Thu, 18 Jun 2026 22:51:15 +0530
Message-Id: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAspNGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nz3dzEzJzM+My8zJLMxJz45Jz85GzdZPNUoyQTU2ODFAsDJaDOgqL
 UtMwKsKnRsbW1ACwGLx1lAAAA
X-Change-ID: 20260617-maili_initial_clock-c7e2b4530d80
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a342917 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WH5-n01XVsl9kePyjj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: XdDYtS2iObsXhS77zWFNprKuXtTLtoQ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXya+/XSEqDIEf
 /SE6y8Y10wx2WtecGqGk5k5BqgGmLRibFQsi4K5cfctGJCL0Pds3CIgHsYQpv2T9YpAdckPbTDv
 zi0ewb/K1dWnWC22Okr4VQ20496EC5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX1LavKVVSWLDM
 Xz1kijMpZ7vJzOkuSbSSqkstmhX22E3Do/k4Wg74j8u+2l/7lQdXhax762rGdO7x1rAIxvn70qk
 96/wLH6hyisIEYq8KACg7H3Cudw/dLo/1v4zbt17HPIYfyEKhThuHLCk7JDbtwxLvBCfXTSw+bF
 Az02iYvvXm1tpnCn5O+1XyTbGv/ynUa9LLpkeQwonDe8pa/yCN8oAdWllKmIkDwO4FXK1lCru9W
 2ucNF6BLbenRPxcLBvr6zci1qWW10F5xIksf/xSCZZSyOf40uLkWN3vB8ujstEhTI2gN1mBf9WN
 ruVrzHsWBZUl8hNxxl0mivC5EugiJOSoKM6FJkMdrNXYmd8/CzmXLmcM2gG59hKP8+ggny8oUa9
 gqyCEy0XYk0lo/wUrYMVd9IMM/A82cWz3wjdjW6T4Xcd4j3y/vSzx/GiDW94uBPBswG4JzRTnpx
 JlR+7P/uAEGe2EOBvkg==
X-Proofpoint-ORIG-GUID: XdDYtS2iObsXhS77zWFNprKuXtTLtoQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161

Introduce the initial set of clock controller bindings and driver
support for the upcoming Qualcomm Maili SoC.

Maili is a new mobile SoC from Qualcomm. It is a derivative of the
Hawi SoC and shares most of its clock topology. Where the hardware is
identical, Maili reuses the existing Hawi drivers via fallback
compatible strings. Where Maili diverges — specifically in the Global
Clock Controller (GCC), which carries an additional QUPv3 wrapper
(WRAP5) — the Hawi GCC driver is extended to handle both SoCs.

The series covers the following clock controllers:

  - RPMH clock controller: identical to Hawi; uses qcom,hawi-rpmh-clk
    as fallback.
  - TCSR clock controller: identical to Hawi; uses qcom,hawi-tcsrcc
    as fallback.
  - Global Clock Controller (GCC): extends the Hawi GCC driver with
    eight additional QUPV3 WRAP5 clocks present only on Maili.
  - CPUCP mailbox controller: software-compatible with X1E80100; uses
    qcom,x1e80100-cpucp-mbox as fallback.

The devicetree for Maili will be upstreamed later.

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   4 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 +++----
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 200 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  10 ++
 6 files changed, 269 insertions(+), 45 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

