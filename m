Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAA352C51
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098903; cv=none; b=q2PYThRq/0CNyAdDUqO2aNVjB3ziFDK/uaEseoYaLCimTbwqJCXNtiTDHsYHGIMIh166YdsDhDA5nCf1V43rYkdysco/SRp94AkomFnPjYSrZAbzXsdDYpFsQNO7rO3h8E9XfxRpZhy4t1IEE5L4i4DjudOP3OyRoPaM3NCJfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098903; c=relaxed/simple;
	bh=f2v5SwwFgePL9gIso6GzVLr45Q605cPfPF219lREbvE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RO3YeWt335Tc0tSdnLXKgBYWfUiBqnYIyoiIWHborBUdDEcwFXg7DmiW7TEa/F9OTGqDFib/EpdJsoOh+gxcUXLp8cj2mgiSc6s8MVdFVEaV/Wxug9ubbLhZGgpqyGsAxdoOtgTJIbi/butLkoaOu7orr9fiSuF+KVSOjAV6vvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSDRflnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GURm9cqS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSDRflnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GURm9cqS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M47eu4009498
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oRGv2sSlVdsBDicGh/FSno
	6dDdTvkWE0GZ5eJYt+YxI=; b=XSDRflnUfutXKvSChnepvq6OZQicV651dUOf4z
	0koHefBnt6qTTB7H79hfBBbSj7d5Q3nXZHZ4orJ0Yy2M1nwiB5kAS7cr3mMuX1BQ
	gHklt7j2oPxS0rvV73HSnCkDHTPaVrPxnIJyo1g6k1OP5UqAWvNq/eGHMHPUreYd
	sjoN83abCNW+/bOMpmvvRfl2Hfx2p7EKQCwL5bkddsY+xKq1eyM8MrRWD6oC5OTx
	3srqIbTiLgAc0CcHkbJfLhZVI4VhdBh9V5oRd5EF+O18ZvXDLDSYHBHmcYv44tEl
	yHnfdM9Q+NS44tU4cCYKLPMSEFPNX4r/gzHfL4d2NShDbLNQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e01sjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:01:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so567668eec.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775098900; x=1775703700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRGv2sSlVdsBDicGh/FSno6dDdTvkWE0GZ5eJYt+YxI=;
        b=GURm9cqS307HBknbVngJ03J/vM4xyPx9hqnRio5Qp4Gn/QNIMM5BVLq+1jX+IXSOrp
         ZsEZYVD1PAuo6K2QIVYx/X4/GDnhMFz9TRv/wFoe1kc1V0U5n7/Z0+cBCvJIde6lXc29
         F0V7QVDr89B5szEu2AYfoNZpEOgLp4DGCjDvdAVRtzCZq6FlKoLRA9CFnK5DVMn+5hsJ
         j9/a6PFbcx7pAGUmjZRTa7z0tUYJU70lvKkqiPdlQH+x8o+lWXvRCOeyIGHX6Gr3YAP7
         D1ze1BR67S4L3tOiOF3HdI4uArM/yBKh03FYsOXIOwRZqsflqiNMJwHnDudj3DqNiBso
         BENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098900; x=1775703700;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRGv2sSlVdsBDicGh/FSno6dDdTvkWE0GZ5eJYt+YxI=;
        b=b4Ng0XjV2WGsYnD6pwL48L1Q7MySHMiCCBfCcObsCCVfF6MWRRFGatBW7rFQ34yg8A
         /F+UX0q+Fsqf/MxUIiVmQTWxR8Aue7ECVgVS8ZErNawT1sLis8cGCj44Yt9TiQZrefP0
         2c+JiZPPQdGKX9Vd6ISYOdoDwZGQk+VdLZcEvLiTrI7XoVLzP5d29hKnzn1sNtnsqDZe
         mm5pWeePTOB1Khq+9wSTYfl2TmJ2Ax+wPuxKvX85siVPhVapG1mAkSksOXqJDqHUTf5r
         t7VpdmErx4a8U279/1VCa04b8Lwum4q0+ZmGQ0Ov33UmvXlzISZkIWYKgX9R1/Ck3ooi
         9m2w==
X-Forwarded-Encrypted: i=1; AJvYcCU6u7iqgF2O6u/UaLNP02GqLcqChcrZF4Zt1Tc6OrQvIAOBoQlv3/Yt5W2k8YdP1sVLCUYJDkrDAizd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zj7A+b38BJsKd8qlxxl1yCK5E+R83S6hBs++umLNvgm9IjGa
	SuMhT/NlvvFF7HHTLMYdvxLfxuprq3Qy/R5qShPlYEtkxQRn53GnQ6T4KMmMJn3dggloI6yTQmp
	28WMqF5FA9XN6gL+Hor6zTo3KwoSw0nMvoXgLKPL4O/lUY6K98SSwMIc8WWIZ3dA=
X-Gm-Gg: ATEYQzyGGvi2E6VD3XvXYfOkjdz2nT7ceACCqly95ZcBBY0lrbl7fEyB8Ps8qKOUO7x
	sQXuMQvvDC75tSw88JTNZ5evrB7TBYkm1sYXW+iXAk89iTIlemY88dkUM+66QUh8yFTv1Dqk4je
	UG4SQ8CoX5PMOlyxerOr4PldIvHdv7pm5tzYlmPLFV+G9hdIrm3/v0JOetJcxY7E4UAQ4eIrXwQ
	EIAQR4ebJJEOmZXcnsXqulNy21FX9Hdhd71+c/W/vnvKJt0hbAT8M4iqWvNS7W0kVsZ1A1EdXGm
	U1qsLCyjwfPVDXQEsvLPQHFpt+eLu4CeHeF7uEyJQa2u/qK7OZNummnD1P1a57caCWIZ4ApiIyH
	cPLioifoHT+Ivfijgshd7ji7pth4I4astKiOlhSF+731SnF3aHPk1x6ZrdAgoZ1fRpUat7puOKw
	==
X-Received: by 2002:a05:7300:ed0e:b0:2c3:fb9d:cd04 with SMTP id 5a478bee46e88-2c9325b08a7mr2875857eec.17.1775098900189;
        Wed, 01 Apr 2026 20:01:40 -0700 (PDT)
X-Received: by 2002:a05:7300:ed0e:b0:2c3:fb9d:cd04 with SMTP id 5a478bee46e88-2c9325b08a7mr2875839eec.17.1775098899342;
        Wed, 01 Apr 2026 20:01:39 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm1287044eec.25.2026.04.01.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:01:38 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Subject: [PATCH 0/3] Retrieve System Cache Table (SCT) descriptors from a
 shared memory region.
Date: Wed, 01 Apr 2026 20:01:33 -0700
Message-Id: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7czWkC/yWMXQqDMBAGryL73EA21B96FSkS4qcuhFSyUgTx7
 gZ9HJiZgxRZoPSpDsr4i8ovFeBXRWHxaYaRsTA56xr7tmywb8jJxyHGEIbHUafYTA0wdz60XDs
 q/ZoxyX6/++95XiPBT5BrAAAA
X-Change-ID: 20260401-external_llcc_changes2set-5ee118ac7152
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775098898; l=1367;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=f2v5SwwFgePL9gIso6GzVLr45Q605cPfPF219lREbvE=;
 b=BGgjtTogITYB5Gl7DlQ3B2Zoh4XHOWyNyXTzZCG7e8ngvUF+vbxzbkpIwOurWuxyVpY5bV2Wc
 1Wg5qAFrGDWBRIXCv26yTCLmCR97xXh4g00j4wUfCxOhWzmL5o79rNn
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69cddc15 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7fDgnTYA3Q_ah9AnCHUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: wgIFvn1An3cWyXKB58qToofk7nljVc7t
X-Proofpoint-GUID: wgIFvn1An3cWyXKB58qToofk7nljVc7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyNCBTYWx0ZWRfX/g21xoHAwWp4
 81Vel0CXURFT112wW+q5K7GRSilKEw/eh/XEldLmDflhLjSO/S/ZPW/Ovi2r6/ZtU8cZ4yNJ9NC
 1l6tFlXkRvSkg1VtzR4LqeJxe4tJRD6bPOHKSLk5F3OFyAu0gX8BplmYEoNuEjsuNfvJkvJvmFn
 i6piU264ZmQaA7UuZzteC6qi7TTvN0YdS85b0XDUPEyK57Zl0leaa64pMO/t3vUYycSsdYfUQIR
 DtEw1ayo7wY6+xzF8Xrzm9jAL1ZQfQULyOUGL3CDzaHQbGTDAicj+x67kZFHM+Y1lj9zp1a/v4V
 LsL2YRHk0glHBDVHBM3Ymrn4PLhm1vG5vTPuXmUmwh9LNtfibTEFPTcJKUtiRxiQdLlCBH08XRY
 yIMAQcNilunR1vM+dEiMJszbM7jMlBEV7cVs1Et7BXTogGV2xZYxSU2USuKMRGrelJQP+u/7ni1
 FCmeSjMhzLRMRm4cBHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020024

On newer Qualcomm platforms, SCT initialization and programming are
handled entirely by firmware outside of Linux. The kernel is expected
to consume the pre-initialized descriptor data rather than configure
the SCT itself. The LLCC driver therefore only needs to locate and
parse the descriptor table provided by firmware.

This change implements support for this mechanism in the llcc-qcom
driver, enabling SCT consumption on platforms that expose SCT
programming through firmware. The existing behavior for SoCs where
the kernel programs SCT directly remains unchanged.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
---
Francisco Munoz Ruiz (3):
      dt-bindings: cache: qcom,llcc: Document Hawi and future SoCs
      soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory
      soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in comments and diagnostics

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  29 +-
 drivers/soc/qcom/llcc-qcom.c                       | 301 +++++++++++++++++----
 include/linux/soc/qcom/llcc-qcom.h                 |  44 +--
 3 files changed, 298 insertions(+), 76 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-external_llcc_changes2set-5ee118ac7152

Best regards,
-- 
Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>

