Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9882630C618
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782586512; cv=none; b=iaJuRBKTWBJ2tTQQxZqBQKmr9Dy1kZn56nUoBnYeTYBz/7MIDj2xOwc0+XZV8aHUigsOCypIiMN6Bm43/OQrVze+DIBkF3oLkPunFKuXEG9qe+H0TEQnyk1qHIYQgspaR2t2VNLnInq8l4dbBCEgHYzrBXMmyf5F5IM40MWPXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782586512; c=relaxed/simple;
	bh=M2uDTEaPETMcjGHX9m53MCs7/s2AV/t2M14/4PHKTpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hR9eoqV+uC9W7wL1SCzcNujtgWbtCcSRdPOQeA0R9VQP5OP98tXRP8l43qT3DVIVkU0rRcxTm8FLTMf+rLahkL5oBEm+GRqZwrbHMFV2D9ECa1pzjB7BBtmKMXYROnJvwgAeoEmTxfKzTlhT7LuSYvqeKKNiue3fSvThnrp0Ra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O74Xr/rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2rfD2YL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O74Xr/rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2rfD2YL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65RHnmcv1703067
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pDwBHMixHcG
	VFUUcNVdok36oM75bvaMbaiO8a8IAav8=; b=O74Xr/rT2Ttp8aboSpRuBP3OtAS
	66ELj19MAN9TOsoLJi2lEsQfFTu7D2BUbmE7MDAwsl6Kjrawj0eoUVk7GB121IAz
	DwqdkoqiqQSF06OMw9bjBsmM7tIH7aZByzCsGmjjPYe1kTqqwTfA2wja4F2V53W2
	v7MmBEYW/B5USHT8sVYpoG2edts8EEw+0cbUisK6EpfNWf8i88Np+XP0wiVnbnXp
	9p78SbqRZlqlXqb9kl1hrLkQZiHM+GvlOHDUDq0MA62wdJzyb+7/p9Jw3Ip1XsWI
	dG2w6arsqa+mPGK/r6TlpEVRrLX5OItmxrF/iP+2k1k3zNEyMryC00lJ4EA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27349gfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:55:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fd85d01ed0so5568647b3.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782586510; x=1783191310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDwBHMixHcGVFUUcNVdok36oM75bvaMbaiO8a8IAav8=;
        b=N2rfD2YLfG8qXYxnWmxiabRq4oU85HT9vlHg9+fwxYN2oa5rwtOKtkRCp7JxJrOb4/
         oNRTht+yWQvTuyfNg6VSQoupo1Tx3bQBC1pyZtGMUQwODBeUbgCtr/seIM2HFUz8iyiI
         cOvEYBSFR3w2mWSdpPAPSjPZnS2/pP0WtwV6wo88OJNkGnLwIDOZl+scEGrybP2i/kdZ
         aITEso3BZO/TFAR9/bWveIscHwmyoHGnMumhDdrebZW/Oam8O++Rzfuhr6AW+SU5IEkG
         YUlqzaJe/Gt9Ihxz+dZa1JaGLKlcW6Hu98NHVn1Ie+0sZzN8+vdMMV97dxWfWM0P+EC8
         h9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782586510; x=1783191310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDwBHMixHcGVFUUcNVdok36oM75bvaMbaiO8a8IAav8=;
        b=RocIZVeaMuyMSwUnlVxvYQamv0T+M3tYFCN/psSstYkhcmBa6/q3/JVm5bbjqxrrNY
         v02XIdR6PQVgZfJJrBG+lMrF/q7/bylQpBq5eZOlxAeXUkV2wyYyEHX7ofIJh/wRJ38n
         rWekNjJxyGxq49KPOgrkK0T4wgYV7Bno+EnGiuskIAV7UDSPTUuY9fKOM/2kEIWYcViU
         SvUnRYeKQMc/L5cpUYTS0yZ0lpJ7pMpQb/2d0f/q4o+P+Fzce/baQG9qnyCCjXLKL+7x
         Ci/syO/s6A2iDIXPjyjTyHn+0t9oIAYeBDpxmvuj+qg+FJ5Sk/xmtMbF7YDv/CYcrTc1
         Mwtw==
X-Forwarded-Encrypted: i=1; AHgh+RoEd3aMwCSe2QC7pzqq2O6kl6G2gamoRyDp3wL5vhxMHYua44v0LLi5zxyGglkTjz0jrOkcAnSYXiNH@vger.kernel.org
X-Gm-Message-State: AOJu0YzCDQ2YGci4ZNg013/o4pIj9bARFdQT3gBc1WVqOQ+/iCBo7cwz
	DNgxou5vN0FkfQ3Fhf3wmM0RofHcWsEX+TfaYgxfbLGHs2CMvmwBWUfDrSorEK/mpN7L2GuSqzc
	rK/vWVE8gK8xwECVhsvCIHxkyLB/wAL91JRKudBjiU7350u1iRXSpdXNZC1qGklJe
X-Gm-Gg: AfdE7cmsNFtHcWNZN00cVrz8STdA6rLaEu9xNG5KYQnlyTwLqp1im2tgKC4iiHbT7jB
	BxEsLTK6QaHteg0wEJR4xOCNoRzuzWXSRgZ4HWrCOM0PRuNiyz3gYFhUUXcZemAuQ8lHhlWQ/+s
	Pv7ohKyjEbxnt2f/V2FMLlIJFt91xam64v5EpJZ8AQlVTbeHi8edCUdctZenm9MJgdUnqKMrPmS
	aH2ydvYIOSjpEo4IrYTNym7QzvrhwFvfJL0S2KvD9xwFjXFYGjiP/EHe5I9uVMKEwffDwNdONCy
	VkzaNUgqTCftw6AAQ3PnpppuQ64QcQ0lIFSwZbfSImCk20kJHGo2m2BvHJI7ckxjtDFi9liDsLI
	HipLIogxjCxUJ9p7cf2wmEFfK73t5UEExwsrEzvaPpmf7R6+Wbq3px/WPqOnLHsSWa35ex6onIg
	==
X-Received: by 2002:a05:690c:4989:b0:80c:8596:464c with SMTP id 00721157ae682-80c85964b48mr56512717b3.62.1782586510032;
        Sat, 27 Jun 2026 11:55:10 -0700 (PDT)
X-Received: by 2002:a05:690c:4989:b0:80c:8596:464c with SMTP id 00721157ae682-80c85964b48mr56512427b3.62.1782586509532;
        Sat, 27 Jun 2026 11:55:09 -0700 (PDT)
Received: from localhost.localdomain (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc2730sm97556937b3.34.2026.06.27.11.55.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 11:55:08 -0700 (PDT)
From: t <jason.pettit@oss.qualcomm.com>
X-Google-Original-From: t <t@t.t>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Sat, 27 Jun 2026 11:55:06 -0700
Message-ID: <20260627185506.26974-1-t@t.t>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YVF6-FIbeHbQmGxH1LcMxweUFiACfAKv
X-Proofpoint-ORIG-GUID: YVF6-FIbeHbQmGxH1LcMxweUFiACfAKv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfX6jNScY2ztGDO
 tUAnCMFNxlB9zeu2enlpoCUArdvd0w2vlg1t69bun7aFuF2OngBliIHmdgsKu3Y4ylKYvKkfDnH
 3uJGirikOIbdC8IToh0K7N/3lgBETl4=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a401c8e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-S1dkTAofOBTlHLHEW0A:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE2NiBTYWx0ZWRfXxY9Uh0mcPSKS
 gIF8710Qkm/MtD+vsePIbWMbqqCfD2AaEApKO8l/TPj0TpwBgCLnw+m9Wkqc/3yUs5H3MgoaH9K
 f+zcmIWgcT0rgWpLDRM6I/Lwb//GzX8cqA8xqkE73+pz08etC5+S33wvhc5r7fWzd7dt5YAjZ1L
 Oi8L5BR8XHcl6K9Kk6pLSWDyOsIHgRfsXrU8n9nB6HuRrxk5v6NHeJDEPmerLrNAgb92FNSRpLV
 edD14pGeSFuRoceJlQuJ+xsIWfLrZFC2cX8B/haFxrq9kuL/zXF79R2NE1Lcf5yizMxjbsmi34T
 yb71tSxE3ysdSFDLWJphxnsSQkB3V/4nyRRCRak0xEFUDsHbLstNZCwrktXH1sL7zZ+DS+0bPJd
 FbyjntI/A0qF7rXSyBlTsr6FndZocBR/08fm+R/nL1SSF39vabwDsDT97dAo1BolzmqDn2fNQpK
 /54x2ylbWnUnPzRdrXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606270166

From: Jason Pettit <jason.pettit@oss.qualcomm.com>

On Fri, 26 Jun 2026 13:26:14 +0200, Konrad Dybcio wrote:
> I would assume it's simply not present (as every SMB2370 is a separate
> physical chip) - perhaps we should just add status = "disabled" in the
> DTSI file and enable the nodes on an as-needed basis

I'm not sure if the chip is populated, but I tested whether it enumerates.
With smb2370_l enabled, the SID-11 SPMI device (2-0b on the SPMI-2 bus)
fails to probe:

  spmi spmi-2: pmic_arb_check_chnl_status_v1: 0xb 0x104: transaction failed (0x3)
  pmic-spmi 2-0b: probe with driver pmic-spmi failed with error -5

The SPMI PMIC arbiter can't complete a transaction to SID 0xb, so pmic-spmi
can't read it and the eusb2 repeater doesn't bind pmic@b (only pmic@9 and
pmic@a come up). I keep it disabled.

Defaulting that in smb2370.dtsi would touch the shared file instead of just
this board, so I've left the override here for now. The comment in v3 will
be updated to read:

	/*
	 * smb2370.dtsi enables all three repeaters by default; SID-11
	 * (smb2370_l) does not enumerate on this board, so override it back
	 * to disabled.
	 */

Thanks,
Jason
