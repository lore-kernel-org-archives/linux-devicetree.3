Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B53B4EA2
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617654; cv=none; b=kyMurvbFl72gtdQ8vYtiMFEKnoGrmhp6bOipGC0VIwy+rUmaar0ADXftvRQ6anY+lwiY6aCdu5qMaIHQqMrEd6LIP0cyxBzpz1t+w2U6MePvaK3TN0qktV8u9wji6yicTf836BwDNN7hvukux5fCpQEeXrut1BjyMFxKRrqWq2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617654; c=relaxed/simple;
	bh=bBEEBpuWNo9qYizkAFNnkH9MYW6P9OAO0lxb9kthFBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rk8PsHeq1pmKjOI+4lO3+4yBAGa+6MJUU5ZI+KFqV+ZZzAUVHZia5Xm78CtEGzxr+g3GyO+mm9V9rNm4GU4CqZ8Gqplm8Q0R1kWANVXFqTkD7v0VEgDTizYMzUPUXV1fUlwQ+tKhjQasI3PHzCwnmYmHWNp0MQ0+61LFWbHLb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYw1f8gA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyYfda4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYw1f8gA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyYfda4H"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L67LTb4106956
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hrScPQOy8gl5qBBmTGwPyf
	Adal7fkeDDu0cPvoGpjyE=; b=NYw1f8gAjbEJjJs0jZFl0z21/c7GPeCEaWju2B
	SeRTotkK/A1j/iyags8RYfTCKbJArs8G9Q8ZfwOVXMygARNQaQ1ce7j6EIxPa3Ga
	2nTc5qzJm83nsHKvDUL58UWzgUYHQcjbE6yYF2Gg3axsVR+BrWNVnDcQ2LNB5BCd
	7/f5f2+f+RRnrlhyzdhstE0VW8zN9r2f3NBvXDShUWMpyG0XdudMS4Bu9akoZdya
	mTz5TaZUHgHXrWkKZYvmIuMl6E5egGyx7VaoJ+NVjUPLg3KVUZXMnz2rPE/bqtTx
	bND8Ry7daqFjv7kl1NT4T8jlmnqexKJlcrQ6hrx5Dqxnlrhg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9np3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:07:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so18491550b3a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617651; x=1785222451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hrScPQOy8gl5qBBmTGwPyfAdal7fkeDDu0cPvoGpjyE=;
        b=TyYfda4HYsl5XTo5q8t5RACELUbX9L3nCXY12tHThZ87N6tB4HqH1f+1+elwAdbDIN
         zSS8R+pzJ2c5lEIJa8V6JU8apHe60Tuc2fvnLpuyNizP+hYTDgoWkECN6vDk4ZP9YSmY
         xfYuVakjRpwzsMpAjePeFzgOJ/CJSmuMnfakDsXxOuctkMiBzcTd98W8l1pOKVW5NYvQ
         OA3cX3OL/U6dEKjulR2GAJUJtD6dtVv6xCKH3jRHGThUjl/936v+h3uyFkRAOdxdh1FX
         hyCuBZ5QmgL/YedAOluBTBbKP4mo0oZYnx01pYQgNZpwxHnaCYTU/7OStpYjrsd/6n7D
         NAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617651; x=1785222451;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hrScPQOy8gl5qBBmTGwPyfAdal7fkeDDu0cPvoGpjyE=;
        b=D3zEpEqv/73Jnnb7KnEKssCtfI6moQ+3M4F+8Jfy/E8KpN1BSZgQR/gynYOV+KYbUr
         /fmm7GcJswp2tX0wN9pLEbkv2+4/3xYwonKPdIrV4qjMMVKWs4F37uNDMyfmqzEOmQft
         SvzI0yYvf9VD0k+oI57OCewFTWg9DC2AHS1ZkDYxbje4tOKow2Vn0+SnpzVqajNjL7dX
         +Aty4ksihPiJieS8dPrDyaapzY2W93G4Wx75JuVRR6yoIm3Ncvkq8w4YuM8lTkNnr0fv
         jhlr8mCYNSqQX+3fybOGQ+B2DJEWJO7qJ3TvTSWSOgeQTHbf0Ge+nnmZNTDUm1/kGSUd
         lOiA==
X-Forwarded-Encrypted: i=1; AHgh+RotK/b72aKeQd86Pf7SqMnPmO6AdBYk8qp7N7gqotGlgW0hA8eTGVEdjLxbEMkINIe0cCY8pkYxzeO9@vger.kernel.org
X-Gm-Message-State: AOJu0YxXB2nkGpLliLfzRIsOyA6e/S7QJXcQzPT+FpfrtehttDqW51JX
	BqWMgKFtkSM6ktEpnpydsVKHHpBiAGhKH1hikHJ7Vf0JkBxm4MdTRcIQtlVeO1ULYNU/edO91r8
	ghoukoR7Ur6Aow5IUtXqpgPk6g8p77w1IY783cQEiFfcrf8TT+/Nw+nA+qwfvYkYd
X-Gm-Gg: AR+sD11u5DWqwR+WzSRyuEfxvToRM5DpUz/WcYvYiySXgELDPkdELRBIizfyMiEjeLY
	ENZ4D1ndiyCvrr4V7/XXaQxeKt3NW4JwViS4TZYJt0x9p/9NavombHGrM7H904+7xT7BzsIBmNH
	dE1+urW8Av0LsKz1oVFBvZ4ME/csptF0M9HvsgU86/a7zvEdPiCy0CNSxuNjLbRqhjSy280FPqH
	VUWhWkXanpToC0CvokW/G5taQz35PQXGEd1n83MtvLrha6Iijj1DksKmk81me/P+lutAQX+vyNq
	e2xMILRnfVgtm/drNizjO9b1UWAZKQfCBgtYY2OczfGYpiqJy21MN1AmcAyZJw1s88X4JH4DmNO
	qXLomPGkUFBwXMnO3OtMYFktm
X-Received: by 2002:aa7:8059:0:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-84c5b65f0d9mr4970465b3a.17.1784617650796;
        Tue, 21 Jul 2026 00:07:30 -0700 (PDT)
X-Received: by 2002:aa7:8059:0:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-84c5b65f0d9mr4970446b3a.17.1784617650315;
        Tue, 21 Jul 2026 00:07:30 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm7080833b3a.18.2026.07.21.00.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:07:30 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/6] clk: qcom: Add Nord multimedia clock controller
 support
Date: Tue, 21 Jul 2026 12:37:15 +0530
Message-Id: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMaX2oC/1WM0QrCIBiFX2X81zmcM3O76j1ijKWuCanlX1IM3
 z0bdBEcDnwHzrcCmmgNQl+tEE2yaIMvwHYVqGXyF0OsLgyMMkEFo8SHqHF0bkwN6c4HrfncMS0
 0lMctmtm+NttpKLxYfIT43uSp+a4/T/vnKaFECqok37edpPwYEOv7c7qq4FxdCoac8wdvK3wZr
 QAAAA==
X-Change-ID: 20260620-nords_mm_v1-9b7dd4f92d6d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfXyQgeG7S5NmP4
 Z8iKdC5GRWw2Cf/fvp079KGMOe42qsO1AxjUUks/yNpkjP/DUQ6OfvZV+TNGWj4Yd8GZv9yUyS8
 12sGJvo8Za4jfCSdaEanE7HHQ2t40pBa8cKBdZmB/VkBYOLwwfJZmBjsCp3kHdEOK6iJk6WtQDh
 nhpTL2jvcgU5A82eBtrm50CMkU1O9WPBpy1TlLQkMjtecvhvv57ypXDjjJuODrclmreOPmxg+4A
 yLTpGn206MtPwji3EEBV8z0l0RyQydkyl6biJ2qmubOxym8QEutStwcrwx/PauZ7Nlf7jOf7IEV
 h88/LhyFxdnPnrJpAkfTFjs0BbPWmPdE/XweK6tehR2j97Kp4F0vDc0kzRHj9VzU2jlqpZmOGiS
 nLp2+EuPrfMyOqwd5/hYBkLBioSvQebOWSMYC6R9zizn/l/hVBpm4YOec5OBHGi5m5PO9AUmXwC
 z9iXf56ST7g+3wP9egw==
X-Proofpoint-ORIG-GUID: Q-ysHtB9sK6Z_64R2ljuP-Qef2Lv5sNu
X-Proofpoint-GUID: Q-ysHtB9sK6Z_64R2ljuP-Qef2Lv5sNu
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f1ab4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vI_4KLquzuGg7hnt8WQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX8XfOcH0PPDDT
 zoTEp0kax7qpIcyPNBsoXWS2VvDScdlfD0C7vNyOObNXgZh4sENu8wNRLfdw0qJw06cIUPfQ7NA
 eo8KtD9vyRkbg+pRf3Dbq24l+IxPOrQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210073

This series adds clock controller support for the multimedia subsystems
on the Qualcomm Nord SoC platform, along with two fixes for always-on
clocks that were incorrectly exposed as controllable branches.

The Nord platform is a multi-cluster SoC that includes dedicated clock
controllers for the display and graphics subsystems. This series adds:

  - DT bindings and driver support for the two display clock controller
    instances (DISPCC_0 and DISPCC_1).
  - DT bindings and driver support for the two GPU clock controller
    instances (GPUCC and GPU2CC).
  - A fix for the GCC-Nord driver to mark PCIe link AHB and XO clocks
    as critical CBCRs instead of gatable clk_branch instances.
  - A fix for the NEGCC-Nord driver to mark the GPU2 CFG clock as a
    critical CBCR instead of a controllable clk_branch.

The two fix patches carry Fixes: tags pointing to the original Nord GCC
commit and are candidates for stable backport.

Changes in v2:
 - Split the GPU2CC-specific clock and reset IDs (MND1X_1_GFX3D_CLK,
   FF_BCR, GMU_BCR) out of the shared qcom,nord-gpucc.h dt-bindings
   header into a new qcom,nord-gpu2cc.h header, since GPUCC and GPU2CC
   are separate DT nodes with independent ID namespaces.
 - Updated qcom,nord-dispcc.h comments to reflect that the header now
   covers both the DISPCC_0 and DISPCC_1 instances.
 - Dropped unnecessary <linux/mod_devicetable.h> and <linux/of.h>
   includes from dispcc0-nord.c, dispcc1-nord.c, gpucc-nord.c, and
   gpu2cc-nord.c.
 - Link to v1: https://lore.kernel.org/r/20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      clk: qcom: gcc-nord: mark PCIe link clocks as critical
      clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      dt-bindings: clock: qcom: Document Nord display clock controller
      clk: qcom: Add Nord display clock controller support
      dt-bindings: clock: qcom: Document Nord GPU clock controllers
      clk: qcom: gpucc: Add Nord graphics clock controller support

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    3 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/dispcc0-nord.c                    | 2004 ++++++++++++++++++++
 drivers/clk/qcom/dispcc1-nord.c                    | 2004 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   37 +-
 drivers/clk/qcom/gpu2cc-nord.c                     |  545 ++++++
 drivers/clk/qcom/gpucc-nord.c                      |  593 ++++++
 drivers/clk/qcom/negcc-nord.c                      |   22 +-
 include/dt-bindings/clock/qcom,nord-dispcc.h       |  115 ++
 include/dt-bindings/clock/qcom,nord-gpu2cc.h       |   47 +
 include/dt-bindings/clock/qcom,nord-gpucc.h        |   48 +
 13 files changed, 5399 insertions(+), 46 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-nords_mm_v1-9b7dd4f92d6d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

