Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BD53368A3
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348568; cv=none; b=Zdxcvk5lPthYFxdy32CcdzPgNChWJG9OSUZG+iWgpTyxie5P4/WUhA5ub7ayiLJEgX3osUgrtdL0mFcPancnjm0rHPhfAkKF5LA1QtOCsL7q/NuwEYG2Prx876i7Tit4H+Fm2QyFFzuaeVSnWo71zW21Lqf8QZx+CMitGbdN54s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348568; c=relaxed/simple;
	bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENOeto3w7WYH/aQ10H9xblbgptnTw95xIeh+xky01jwQmEX0w+ohJUbDofH/SkEIF1tTx1wSRc9VPKPW3eQo6ITCjTyK28ikNsBwYCxy6Kye7Nivhj2M1Y0m8aJ7Osk8SB0SBqeIcfBxRfxO9kCIDQ+UyQF9eLdSZYCPeiO/DlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzxslg0g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MdYjXuCB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzxslg0g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdYjXuCB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S03QbJ440983
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=; b=mzxslg0gP7zoCWL8
	HK1m+jk/GCKz0EfmxyinXpZzoW0GwVrVBWb3dCbH7fX9eSQKEifMf0PES3zfNDn/
	5tuL1k1R6zmNzWMSO5Xc8ow40h5IIUCE0GI5HvhcKp8YURwnqK3Ib7iJpAxj54/s
	GycsCfsj1noxB3KlHZMbUFPErqmGt2RrQ2Q9JUZN7MKqnZWp5W+I5HQYL3F5uv88
	j/Z5YH5pHXd9X4S5LHwxNiAshXjO3isBmizvU3qpadfv5M4ijL+OBebeXyjDlZjy
	KkuU1o8DLzXLP9qVmI2sw/e5OWENrpwWdnx/c8sylXD+tFruEC1A4Lq0fdqZVAwP
	+eknaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac42g56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:56:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35842aa350fso20953971a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348566; x=1777953366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=MdYjXuCB94kpmnklm35JMI4U3DmCRMPR11qrCqDbVJ30uM1tPJnX8TKSUeoBnUYP9a
         vyx0mlId+IkfInZtliE17wqxaPeXlASxpJ+M0Oda5uAoMoJZEdyrEFs39V+KjQHFft2N
         3cDzgV2Z1/8kDb9B/pL11PohLbVoA1kjDGEF3CUH42YQJxbGixj43DxvQ+093EontQKv
         dfrR0pFrgCtTQwTSrTffk/Rb+C5ToaZKLmYN1WSYoZofuGrxq1pH4uSecZ76uTRMMQQM
         MbjbfK2X4aBeUtvV7T5uPIYPRX5+NoQBbnxvI5WhldAMtijISODdaypsGeh3Js/dg/RU
         H+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348566; x=1777953366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdvgFuqYyOWNHAPEPDaWlWX5rBlDjzWDByFTGDon+SU=;
        b=SEA9tilHRFI1rOo/Hk6/ThH9g5T6nhukgSl8nVNXa91sNAD7ULiVtda87NULzHcSJW
         fJ9QhLqGBKj0SWHfOpbP3q6lsmIO0anmqiRvg30TczmLT3TXrnM8L/fdm7cyAa5djKPP
         hzqPc5tUWIr2R7TsHZid7Iyz3z7wK5pXbltR2M6YlI+nrbQub8gY1OGDKk+4rpDrID9J
         gO7DVRDNFWrjzi820hM9nW1S3yl3CZjM+1oIXsrTiPvRNknjENqcWN3Nbh0g+GvDchyb
         zuClcA0aLd1tV/3xLRke0K5Tx3J6MqGdvCuvn0ArXxTJQnHSOGY6QePfSDjiMA+DJkyX
         B8Lg==
X-Forwarded-Encrypted: i=1; AFNElJ+HSvs4HkLsHaC2Uq2rqFhgTuY452XEc3kTd1b7Hm87hrMBOesiUMvWm7VnrnZt1lJKDtGV1pjBtVOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFf20umYt73eGDkRGRk0VHfbhUGGhPOq6lwyVCT+QW/OnNO3rX
	pl2ZJ2B43EO3oAX1Lh1MuJaG4PjsB3jaeqqsGikZceXGiwbcHhCQpMM5amNc85pW44CLIrOSH5E
	buawSBbAoIc/aQC1rWmLjZyrdaWQqJz4BMA2txg5LmWehhkWUpTYhMY3l35+YjTg7
X-Gm-Gg: AeBDiesX2HksRcwocolfFsk7D6IxBSrfhCk4Z1HNtieh+orl1PQphINhn4tX/r1KhJy
	D5f4W2WFU5WTDn94fDuzMmvflIf6Q8CrKvrlwk2v6ngSMPX+TbtYwBHyF7S0GIxOcbwvrh6rcax
	9GYHCqzZikjk40mamZM21X9OMdYHTakGXvGz3FVcGtC6+kGEOpfHg83IkTan7FaykMsOOTiN3Wk
	Uys38IgMi1xlzohOzb8nqvBru2Y4Qw7e0LqecuInEGtc4t4Lsmp1UTuHHHw8A7vTdxgLWOPTaa6
	r4BgYRpOUVrE26oc6xmjHeXrwEd3iE7pXoO7UzFALDlpsB6HBK1Y0LIXd2rUctWCQX35L0XBO2j
	LQiZ5xMbPtw25GoOXkMu10ZBqyXjeNTp2wldAQv51W9VaWh92HuuTwnYrdsCiBxGWog==
X-Received: by 2002:a17:90a:d646:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-364921b0f18mr1617218a91.20.1777348565600;
        Mon, 27 Apr 2026 20:56:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d646:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-364921b0f18mr1617163a91.20.1777348565020;
        Mon, 27 Apr 2026 20:56:05 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:04 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:07 +0530
Subject: [PATCH v3 01/12] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-1-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=1361;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=9ojkIAdTpgdWLJL63T3L3LzXB40PPdXzhWOQLp7Cpgc=;
 b=ay0dYnshvA44WROZCAGWy4lKalYgcb7yDOo0fRviOiuhVcATuyWxdErrTpNeQbm6pWWNnv4X6
 u3mbWherdU6BTtXEW7QFWSFFg8yQ+9jQhUvkN+qqjo9clshZxPEAcC6
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: Hp3qoqcNpBQPlw8rbZn88g8kKw0ciucs
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f02fd6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Hp3qoqcNpBQPlw8rbZn88g8kKw0ciucs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX36xFnwu+Ys4p
 MXrGy6F9BndkS6rL130D2MZWj0UhTMc1cPp77lq9VbO8rx7CkUIN7CtRPBL+BN5kv5CWdDROQ9Y
 B/TtFEZb1N1c9M7+q+Js6C3XPjbVu1aEVq5eZ3ZxmNBuWMeQy9QK1koqJke2auCZ1i5ddXGoFD2
 G1KTSiMIj3BZw5R4bUdqHY14URll0UUXgxgLmgLmVQPBOcqtlEZbEJNj22aMLnKodYrojOqSOwr
 RYSdm7D7GqVsSYt64T+fyW5ClM+kRaR/b5R/7LtichQhWsp6cJeD3ihf3JJ0u+XhToa+uYZXSq6
 Abvbdvt5pFs9V3oOdGeuwLeURr4iIa33hJskd9rWhgKTOGAPl7oz5YpyJ6P0Ft8DS6RzSsnicgI
 5KYdoGYq2D7mF4Ba/qMq1n594ATBPzHV1Tyg3c5ehm2oiXFH9slwoB2FqO4BY5asNnzRsPfstw+
 MPBEFnI9hh59NlWQvBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..bfd1e762c38e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1

