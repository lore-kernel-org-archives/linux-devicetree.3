Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0670D3DD508
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933462; cv=none; b=SnkABHWTuiJUML9ZMc307oIhbEffHoy2jAP9xBYe5ZEKG3gYKecc34PhAmby/EMzyuvVO9DNY0XcPe0E/OyBHtZXBQOzDIiSGvx5XoHzKXrJ9Z5xdg+Nni/4sp5F1WTQ+l20ys7y8POZdFWL1nCPOjjRFyo9GX3uiASlpLH2u7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933462; c=relaxed/simple;
	bh=9BRmdFzW8oYEC9eBqhv0oyUu5gc72FbmneAGMeEP6Ow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JTOFCZ/Cg/bhRLLxPDoweWNGqM4mtHxP1il5FEr7UWxSoVTLl6dEuapsSvw4ne5Ugok57KTF9o+Q9LrO5O8xHbB1Q0dgQ8WNC3uHtbJ80W8MphZD6xBV7PH9T7uZxvvZn0fv81/6/RDut0wZMZgtrFv1Dw5TETEtyhUYljF8d20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8YwEQk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDOHevKa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8YwEQk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDOHevKa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O7Qf473551
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4ECQjdaHnTc+TTRzlxH3WM
	4pEczV6dL3FXSVILHJzk0=; b=X8YwEQk7XcVpYrn07QBbKRKs+J2f3oHL1FM1JL
	b0wp6eQQSI8JA0hmZMG+BIO04Yb3VMjrEQBN/DCZTqinluj5obKfr2Y+i0jdaKSJ
	84vfCNAqyuTkTiRWrvQFYEg0djOhUsdtrw6r2GoDPYIoE39TE37CB6SoS7xyUVS9
	huUAdazIR8yzEZFu40OvioBdToAaetst0FK1Eq69KwIiYUQkRM6Y218RF1AfFA5H
	HBx+BsSob3yyAIgnex08AszjSb4XElr5QMT33KF/R/9ofDX3B7jJKTbHYW0AQNvJ
	VLudjzf4NQn42sDeJuRFn3FNvOa3m6eKjBF+Qr3Ex2ik2c2A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9nd7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4022294a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933459; x=1784538259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ECQjdaHnTc+TTRzlxH3WM4pEczV6dL3FXSVILHJzk0=;
        b=dDOHevKaKfQBhLacn5yjsJTUR9/XeCc+gCX8LFKQ3wEXIL/rPyHlqSOhhHedBqUa5W
         JzZRiZZfRDWy5wQ9zKny2jUQAThjgVm1ZCg5m4Ji+6XK1jXf9dWu8vxoeE09yHaYa/Gs
         o3LzKgfufUQdq5EG2FLpUlxCY7FF7fc4M9bfKfrWLZFtZwJc1tBc8QG+koBE865ZbgaO
         OLpA2DW0AMadD1ztLh8nLJRHUf2eoDCCgzeWKdAgJtlGN0r0LIJU430H72ud0EPl3jyg
         K6kU052cy4tT78UWkw3jI4spGNspMgxBJSXQvr5+iJHBajkZsD5jCG+VCtH8syNmmIRZ
         Urpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933459; x=1784538259;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ECQjdaHnTc+TTRzlxH3WM4pEczV6dL3FXSVILHJzk0=;
        b=ARJhaGYDTu7kZwS2QOipPqc05jEcAFsYbVRJz5sxZObNmalaPUVCCiGXvjFBNPJZxh
         VV4mWKCH+RYkpz9kgqdW09R+U3/U/YWrXMcfKIihZXEhn4hFqbmVonf2J+ssfkWEKQmD
         Q7cdr/Armp+hkajbeI8z4EmWJdkrs1pewzLTq0YwO4jxupuy1UVGHaC+RJSsO6ofFA0R
         qg9NOHDtmAqxcMWlE0mvS6Upt1ehhOqq5ZHx/lvagpQUHbbvgJpxS7r8lG3tzh+RXFvZ
         8za9ux2tGD6hgYwN5rKK7QoJxLlb/Rj3xE7BYjyYvJ+CTBZ6N7WIqcq2dwxDAAUSGxAd
         66BQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkCN+Y9KNB3GvCP7bg7thogWdXOU7q0zkQAbrB9NPz4xyR99CzejxhR8+X4lkUIICSpb8uUkH99v/V@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4u5ks6IN54tHMD3/A/7MFIzDjtDTNgwKrMWB1XYwIqwqo1uHF
	28bNp3o7uWL/dzrzAOP+AVHG1lpptSE7O3nua75yqopdG/60EAnGJ/tX86iMhM1R+Ad3A7tP/6h
	RA4zrc2S0Z8c3PEtBiouW7FOi6sl7/PQQIokulnAVCi4XtFdxy3JACpbYGXx3nQnJ
X-Gm-Gg: AfdE7cmcauuX+3l6OWwb0oVmh8WqD3DOS1H711QZf31UMPxYMhTojjnzdWA1BavMpS5
	qQu6a0+YlFYDCXo4Eepz0t2jd7HLMVau5hf1fm6x2TPxeFhL7I1fFuH02JYwgjwV0kdGyYMoZ6H
	F+Yp+Niz/ZSlRmQXGrN27v1v/HiyGOcY9T/n1N4tqgbCXW/1YgiIPY2sAjsZXiN/Oui8jP4UjAw
	58BYO6Hy6ghOFcgeDc9/iSm7HroyB+BNFDPy47PgVw31bFwT/bd0iw+fPiedYwOc/rTnTchre35
	FI4kgJfwxp6sAfHmm74o/qdBTOcd16pp1fJCHf5vIMramxfjTnq2ML4Yteq7prmVM38ql7ZZadk
	nPZ41Lwsgmd9bWNvuH8ewl0+jCyyP1AtSF0E=
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38dc77993c3mr7931695a91.42.1783933458966;
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-38dc77993c3mr7931675a91.42.1783933458528;
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/5] clk: qcom: Introduce initial clock controllers for
 Maili SoC
Date: Mon, 13 Jul 2026 14:34:06 +0530
Message-Id: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAaqVGoC/22NywrCMBREf6XctSlJah+48j+klJhc7cU00aQGp
 fTfjQV3bgbOwJxZIGIgjHAoFgiYKJJ3GeSuAD0qd0VGJjNILhveiJZNiiwN5GgmZQdtvb4x3aI
 87+uKm45DXt4DXui1WU995pHi7MN7O0ni2/583V9fEowz06BBXtVSiOroYywfT2W1n6YyB/Tru
 n4A95k1uL0AAAA=
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfXyIH662bejGLK
 65fsR9VFX7NpaM4ZvKNMxe7P3Qx8pKF6F6MMDhLNs/nOQdfNATXeYl8zkkwl5Zk4XJVkLGA6pwo
 fyEtmIUNGKGPXtGGGc4CNAYqgNQufYM=
X-Proofpoint-GUID: ymDHiGv8gDo08OU2KXVnZ4Gdz1Ltaa2G
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a54aa13 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kp3T8kGXBi3sce7iFlAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX6mS3VqcF4GoX
 vLvyGkCmsyFU8L5VBse9PcG+57swi4ZATKSUWr5fNrz/EMuCO4LC6RynrH3fb8rBPV5CmqOUXox
 688oR5jxk4rZdiEERYESBSUFkh6cHNtSNW8mPUly+cen7QVuRFtBkT9249Ze4A+Tzja3Gv3Daf7
 XyMLBvB+AMGJK37dNW8O4/UC0ei9uZ/RCVs3AgDVnNKHYN/4xrFyp/7cF52tUHOnGk7vBX5dIu0
 YqjXGWaunapfwg8nXaqYEIuFUjA3sFfVoGxp42qrEZ7rDuhFxUFek+ajY9x2SYXkjshQVv/H2+e
 AEKtnAYaXU6flaiO5Acy+hRkgJW80+L6GoKJYb46sJNrTH9TU5IhYom2TIMs6rchE8EMfPGXc+D
 QbimWqZSv4JFMdHZZI9gNKN2qTQIk3gPdatOZ8gzsB7j/cSCRlS4Z/1roh4SUiy8FdwhvArunGO
 TEWO3W+dGu3TvDRHlRQ==
X-Proofpoint-ORIG-GUID: ymDHiGv8gDo08OU2KXVnZ4Gdz1Ltaa2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094

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

 Changes in v2:
  - Split the new Maili-only QUPv3 WRAP5 clock IDs out of
    qcom,hawi-gcc.h into a new qcom,maili-gcc.h header (which includes
    qcom,hawi-gcc.h), instead of adding them directly to the Hawi
    header. [Krzysztof]
  - Update the GCC driver to include the maili-gcc header.
  - Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com

---
Taniya Das (5):
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  11 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  65 ++++---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  34 ++--
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 drivers/clk/qcom/gcc-hawi.c                        | 201 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-gcc.h         |  21 +++
 6 files changed, 286 insertions(+), 47 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-maili_initial_clock-c7e2b4530d80

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

