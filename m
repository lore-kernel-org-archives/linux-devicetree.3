Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71C51FDA61
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778202154; cv=none; b=t7okDkETMwVWAvtm19owF5fLSVF6NgGr/XvASs8xYOiIVneQ0P6BemOspmOxNnomzE82IgINEICV4JwQi4fN6GptAhufjMMId+DSKFoX7KiFqiXPesZo/VbN9y0uBuSX7FhtmKF6pX/sQOQqMFPV/WBQYxxbYLhuGOpjMspxGto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778202154; c=relaxed/simple;
	bh=xU+Bv3tJiX0J7E/44Be6i0aRXSQ1fn8WrrGJavKwxao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEu83RR6Hqw8Xh7PNvypOUo7fPOzIaVEqaK3KzuOsFGAhObBda1uDEKBl4q+zyIigCA0WjRBhmFjHtmaiTcOPqZaAjf2XhtDq+6A7NRtMBzPOvpHSXHvfsVmyB2iWAhmHYiNrJDB0OdA9DGtGx6aMcLA2uRx9eaEB/lzAjEG0z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFz7uV9V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRGRVhrR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFz7uV9V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRGRVhrR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LZQ184069498
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 01:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvDMQNPUZcPObGUF7IML45C27ER/61yELy/gJByeJd0=; b=pFz7uV9VTfcpNWZB
	/JGvhu/I5yFeAr/z8Xm9Js6NKwYKRICqlRSJiq0cCH9r5JdCwux4f6WDbMx5xuKC
	zX2BgJSwaeQ4EOpBXYTwtGBgquSXcHOS+fU3acmR/LMaOuRwUE8ffBw0BL1sPb+7
	0SWs/obK6FXWpBx5OYXDWj9mQMqQjytzMJpYRwmAxnQCn3alHBb0j5Ag3vBSt01J
	VODPPStPYroONIODnBdTPfDBL5VrXHQYy8Tu7pm3MIwB59cTTaSz00/gtXeRfBse
	7dV/+lzBbBNjrm/mlQ6W5IOpSSA+Tg0eFdc9BPtB/tu1k14VWoJ2Zze5ycz7kFgI
	if66wQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp0gjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:02:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so1210410eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778202151; x=1778806951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvDMQNPUZcPObGUF7IML45C27ER/61yELy/gJByeJd0=;
        b=hRGRVhrRxPANHbTwgcAONYljndYHlzm9JcpimxZT7s6Y/xvTDeTkxwUZhqcFT0NqWn
         SPn8zMfuvNHH67oxVdNR14t6k4gA22rgAtqSAkq1+jG1HzMkFwNcG82BPSyDeiAxpydX
         77qtg93oeiB4mT1gTvfV5NK753d0pKaT24LFQrERf4akm96FW8/Rq9dqd/ldu7EPel0G
         yKeYXP+Uk54aKE5FdqmvjzownsqmRdOEVnbMA1fbZx6h1UpGcOaTsLyorkg1yAMMM/h7
         NimofTMVpZT+YN0IeZ3wvR4JDFfGhsGPuDHT09d8cM1Gc6es5AHFOUx5a526P+gDWVBz
         F53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778202151; x=1778806951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rvDMQNPUZcPObGUF7IML45C27ER/61yELy/gJByeJd0=;
        b=UVI3ZGijXtAghtXIXqZpKm3MLRf+qyMiBCgt+2iM/uWvWTfrkPNPUpH+T3TY4xEi7C
         j4jYQz6cFLQ6qGVzPEbAZECG7IugQ2ADX8IHHdlWLhrt+2uskK9Y5zP7xCOvL08KNGuv
         Qm1GEazU+EbfgMRDIIcD7hcTUStlzCv8pFjLV8BQEgEgPFrSJxUXaG+7ZNrYIx5C9Pwy
         r0vHBgnPd36dt4LKTh+l2WqGc4tgH3lA5sfjzHE1rD2wF7ICB8XyeQSWe6kcIp019mCG
         wFl14++QffRnzQO5Pc0oBMzysO2BMbibtO0DwKwApjeLA4TPUrD2d2eAEDNW0qQ/UkQ+
         944w==
X-Forwarded-Encrypted: i=1; AFNElJ8J7Z9qWLnn1rFMVvglxarBWoM0JDjO5TVNgr0tTRKcbg6HgSJSE0UkNZdqN8EhRZCgB1rt7rzl/K/a@vger.kernel.org
X-Gm-Message-State: AOJu0YydPSphll1GPFF9FSAGndZpqcCDIGdZ7jblTgUtZUJZrdPMgSkw
	UM+qC3AvgbTCB630g7oycr1QcGZ90opbCBQgVNNVvPZ4jn78KKQm6A2I1QDIR7bgE1kJHR6q1E2
	zdMehq1TOHIiLBhEJbIyJG4n035VOnIHWddCLJT9bzeAVEvfUDFPDLCJg6Tx3GAhB
X-Gm-Gg: Acq92OF7k9evJg7i+rNwnQDQbMkCu/4rygYA3VQfVs3gtWMvIw9PtKZ/KpkKoE4/qlB
	31w1xFKJogHiuNGNHdNF6J61nwnMHtVfHDAxkyoAFfI8H8FILrCvEjLB7BLm0DeF8t3GNQKCIel
	tAVEBrHYaR2fP12T+40CeQ/cXA1baeXgitaxsf5/Ge1Ro90qv09fQfNHSVzcTltsqORnCtPdmXO
	SU5eqCzLIPOq3YEqtxVoT6HMjHQQbpWSdKFqmgcFVoGemBRQafi7VXZN9ldkKJUVizgIZk9JoOy
	j+WzrhLtV0195XBUrIm/aMoGr8RK/j7JZs1viq6Mgwj724bPFvzOq1Oyxv0leKG67zvM6fn0naM
	Wz9z3drOsdSXAWR2OVsksgt2V4ZOyl3clQ6W37shDl/tg3oHBNI/MOobRD3fARaXWvLuJHA==
X-Received: by 2002:a05:7300:fd04:b0:2ef:e4:c912 with SMTP id 5a478bee46e88-2f6e29fc666mr2109248eec.9.1778202151214;
        Thu, 07 May 2026 18:02:31 -0700 (PDT)
X-Received: by 2002:a05:7300:fd04:b0:2ef:e4:c912 with SMTP id 5a478bee46e88-2f6e29fc666mr2109228eec.9.1778202150397;
        Thu, 07 May 2026 18:02:30 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm149809eec.24.2026.05.07.18.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 18:02:29 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:02:15 +0000
Subject: [PATCH 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-pcie-v1-2-0c910906f7e5@oss.qualcomm.com>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778202147; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=xU+Bv3tJiX0J7E/44Be6i0aRXSQ1fn8WrrGJavKwxao=;
 b=2Q7cIW449GSWVep8TbtvAQ51wF7b/ZmcjaY0HGYWRMjCD/uSEISkOzeSpBD4yrPEAzyFAucLH
 9QDDL6yYFQRDQRlnHWz3U//B8IuBxCdG9msOX8952CES54cFUMTzz9s
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAwNyBTYWx0ZWRfXwp5USLpsCEAO
 IctXyy2PsxDVCGT4SHUJMRtKOBaUuqarqc5Y1lsSAlElKpMiiQVEK+wbili6f1mRgNj9W+Zn6Mp
 w7HwOQ9Flf+9ZsGWPQcZld6UCEflD1Z///Mr2qdR0yq+lS8hA2KvrW945mpere5qGKRtg+wtID6
 Q4ccF+wGgLVvcC5fqYtxnEla87Zxb9w5mXFhu7TIBxkHCEN++5rG+KqRJWwFmRyNGx310GZwYLc
 MXxWICnMFu+Bn1V5pb8sOl+cE9e6/u7vPDQgP2ltwJUxPPies0EcWZVY/aGNOgDbV+Ux3Ly4OT3
 QKrD+7zlOD8d3WrpqJK4xBolfQ4Pj5qoifBq0LMG5rkH2jrMKyeh4Rw+1Q7/rB60Z6FkDzi2cKg
 PbWRIGVTbEFc2qWtRej3T4RPFufsI//C3oFvgI85peNBGU/SKV+OaIgSKk+FzI8EmGYii1jHUJD
 h5w8tQEuuiZJScLMApA==
X-Proofpoint-ORIG-GUID: ZCBoy3kVYm7Vz51Hqzx7iYCKuNqibp42
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fd3628 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ZCBoy3kVYm7Vz51Hqzx7iYCKuNqibp42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080007

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..80a238aa26b6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2121,6 +2121,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

