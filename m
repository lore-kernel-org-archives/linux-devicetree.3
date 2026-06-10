Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80637DE9D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073067; cv=none; b=kfpO/CyUp5XR3MGoh4Zckb6faq1H+gSVkZe1BGapxJ1IdiX2Gbdgwek9NHPO19S5HsSwl4qV+MCGIaGNfE8+yne36/nNyu3EfXBjw/bQjTlRT9xoB/vIIomFgKg1MYsacqPx9sJlkIqmhPGuhgv8u9aUMdUGmoYPrYx1Ybw7XVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073067; c=relaxed/simple;
	bh=mLL1VQMpy9N1BOZ45ldfQL+Mb3ztVhn7sg/R9eDAGTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmI55qzQ6EdWp9WMiJJleXwaCm3HGkAqI4FX7fPRxKzKKjA7FC0kzzDc+ddU8pT91C6lyc9qYj3QWSm1hIO9ksz7qyWSy3wm1nIi2BmDStxIo4pPOuDPYvE1OLwQh8P1dSGJwUz4JqLO92VOvPFlLPkU4aWYRAodbn1HDHvImJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey4IBKwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHdraLsb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey4IBKwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHdraLsb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2f8ES323991
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2ytESqp4IIaVb4+TyQ22iWPJANF7n5yQgd0/Sz1Gvg=; b=ey4IBKwJmiEYjTLL
	qyHIIFqWbnknd0D8xBdjd6NhrfynT0khwDQOWnYXrDWecDc7XGfKIGdytY3tB7r3
	n/NT9KFDuv1DdMp54VbDQt06kwj8UPgNA/aWFq15Bo9dxzVV1C7jDdRFbNp9qsNX
	W1LSpDW2DkOmINgRYzeVVpcfxMmxumicJEEFKOvZnAYH8Ppu4dNK50Gqop6KE7hx
	69oGJWpiQ4NMlxwNfR5yp+tFMlLK5mFwS2BDEq4913U1633NnkVAH/QWenO1r+ei
	/5tSaufj4iolJJ1htyZI3gy2c1+L/DinPYb26PrYpebk75BDwVt9WV1VfZk7K9CS
	3jHYdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeawr9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97415004so12438949a91.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073061; x=1781677861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2ytESqp4IIaVb4+TyQ22iWPJANF7n5yQgd0/Sz1Gvg=;
        b=iHdraLsb/5W4iSwibC2zAmFS07t2JFc2sqQo8pQkdJSNpvipdh57vZzKb+gq93tynF
         RnzhV65cpEs1gkJI7UkRc/2OH9oMB2N1rJIp69jqVnTNv9rhFwLr0QtaaLc+5V0Z/xMx
         TMdhHwGFX/s6ALfo7bqfSWTbJXLnfoAr9RZXHdw+yajTNDtXFGe6ssPZsHz26mDlRTPh
         anoBJRBQrNm40H9SB938vIBBNpUBi2k28cdBD3htjpmHa5Gts84EIYAnrpFSETCHFfp5
         UwJU/FbIVFh02rQmWhlxSedb1P7OrqRLPZf9hetsSs7M4QERekziCIOPd3k/BfUv1QRu
         HEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073061; x=1781677861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2ytESqp4IIaVb4+TyQ22iWPJANF7n5yQgd0/Sz1Gvg=;
        b=p+48e5stPDAldZVaa2ucT/kC9Z5l9igq/wb6Gx/4zzC3YHYOx+tDbW3J0xnyvyz8gl
         cAtHU9JxLu0tlcxK51xRSkRIl9mPqEEn4TW6bYXbYCkM94U6AcSvxADXmT3MNXyKqLqt
         pJGzGzeN9VN4GyjKkhNP+aH3jVZMhIqoc5hsdntsSLPnwfpPDOONqJQ8/S81XiGxWOyA
         HIQ4jKZ+i4j7KWCQ5b2ojGKf1Jr5eFq2KmSQMxtIv4MbLX55d2I7T2DwhzaMk10u/+sK
         GT9MXq+WzjQ5wxrc3DpntACQwRdrB4kZrQLtFAft58A3yPxNCCsJOpiXFRvHxIpiIOP5
         k8ig==
X-Forwarded-Encrypted: i=1; AFNElJ/E2cTsRzZWGuTsjkv5UoA1T4o0dR3n35O2SRbr31Ntn8Gms7GBWdAW7e2gHbXx3ANJa7gb0JdkDKGw@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHszs7g8fwu+XZ2R4Jt1qwMNjcKUKvDVy7KHKjT0FiVLkMmxj
	31mEAdX6S8W/w2zzKo88xjHulbto0Hl5TYjZDBULua3s998qRB4eO8t4pA3LfTlKo4TgIflVTgk
	SHzRmzFYOr8hJ8lxpXdelDoEC47OBCEh3SWNwGa9fxnGRqGPlvLPu756I0EFVIPpy
X-Gm-Gg: Acq92OHGpSrxsmruEVEpo8htj/LeRR0QlLEDt7dYdh6cZ6eFcvyAGXE2nmOOiUJ/P0e
	b4kykFLSfjusg7dDPiJf5/Gz9/P11dJQmIY0044UhCqMGeTyjez+fZ/xXMJctICyMM2jW4nG7uF
	47giuWHK9ZFfBK2hksNjNO9oP+xr+Q7qhyKzDf3z3+BwZYxolq5Js8f2BH4+252RTBvpU3zarMn
	cK545sUHoQrFwUB6mIHLKXsOAzP3YMqMWVyIFaKKmSYHe4S86MOdEx75EkM553WkNd5KvLT9uJs
	4WufOhJO/5REZzPA6CNngTF/qsn6Xl9umjczZybeGnNh+RJHvODsm+Gq2n4cph0eH0+GfQLhvad
	AUBfSpK8aASuZG8FmPqNaTRZ8jr2YgPUUYpfQjvKgA337B3TTLDrWRVsSi6Ha/Zj7ug==
X-Received: by 2002:a17:90b:4fd1:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-370ef2f077cmr27350392a91.12.1781073060646;
        Tue, 09 Jun 2026 23:31:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-370ef2f077cmr27350357a91.12.1781073060211;
        Tue, 09 Jun 2026 23:31:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:44 +0530
Subject: [PATCH v8 08/12] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-8-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=3528;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mLL1VQMpy9N1BOZ45ldfQL+Mb3ztVhn7sg/R9eDAGTA=;
 b=/Xd9va40294R+8HlxRq/gaDcnCW7BShMsRLGRWPPOvltZR94CPuN4ZK3YoENes8SdkDxtR8jc
 FC2+BJpXB2fBB9cQ4gyMkiTQgZydgV/XjudA/y95v2fDl/tN4c3wASR
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: XFJe4suC3uZ8BDMUMc-1xcdpUBSPfiNm
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a2904a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX98L98YlGng7w
 +/5/BeEPMQ6heEQacChvJT9GUATc5T0yf71FQg0qf2iRChu3YjrPK+bGQ+Fz/Ap7PMw1fQo3JV5
 GTsAHirD0bU5FckqcsrxstFGmJu/4BZrrhR3LbX/ccDOp5i8wnD4dsq+GYRSY4UlHIwDrEPmv5h
 0AzLce/bravlDmZN629e20dhhiA3Au0J2Ck7Df5nND9V9hgATxj42hTIAeb9ISiSyb4sSq7KAOS
 h/5sLj+NoA6L6JHSI0+IY2XsVVK+sVbmUfr2zR+jM0xxRMcz5BrFvdBbz4j5E+pWszE88XuCVoU
 /DpPQRfkpmgQvh30JyS13Jk+Csw2spNYOQRvR49OfSQE39VCB+vs9HAkXsOTasjsdF3n30Rlpy7
 OP7/vv/akjX6DJqQfmd12hNRsVwfE8jTj7FdgTx6/m+1fsRWX9n1mk7qTmlPPXjO4VvKOAE5wrA
 29rGMW+3yYyoK+x2xIQ==
X-Proofpoint-GUID: XFJe4suC3uZ8BDMUMc-1xcdpUBSPfiNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index afd2a0e2a3a5..bafa2ab645b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -313,6 +313,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -346,6 +351,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 330fc85d232b..a42554272964 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index e67d98b8c91e..de6a91041ea2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1

