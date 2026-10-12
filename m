Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35AB456E19
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793970; cv=none; b=ujfX32O1iSZtstgVJZsoW15KuWvRGJNetIVHRISUj8+uaZAKNN/8ia21cTVJKyLjPEdVVBmDuET+c26qiaaBNrxuWuk0tQmQ9/Q+s6bbBH9QSxbQfyc84z/aRqCzh53/9mQx53KEr4ZjOzwBUOpe9YOzMNOvKIVlnvbzgiibvlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793970; c=relaxed/simple;
	bh=mdZEiXnEcF1Ehzi2mtklDaI5cuB2rt2/NDVg1wust1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkdW/qDMtCgExEHyuwi2OLXcRlHbJjyD+H+8BmUTH35IhcHpvHl+uBWO4gL0UKuvYBt/s5WtK1xuVWNdwyoELeXTLSsDgggD2WCsWd5tFOEpCC8GsRFKiZEtW8zhY1aPWDhcf5dy8N/VBajMbrUmRfE7bcUYzhMQS35nJqwUsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7QUWlyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYJFJr5y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7QUWlyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYJFJr5y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LJ4g1754980
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=; b=K7QUWlyRUT+LOQ6E
	gzgbxW1FFixrNWZKFdrryhvcatNJ/xhJqwGeB85KQOk69TiLOYAoM5a1cCrpnvLP
	Zhm3QnAA9ElYeV5bs9qID/ExekdsaOKtwbOfYf1O/utjs143fC1dCkJUfHHEp1cp
	6X4hSpUhx6f395Eeub0eo1ogiV7qKVcksR1iaGxFSeMqOO+NyDcTaVscHHE8Vp8l
	5D20CREjZ9EQNhqoXjRDeJCDSshhCYRU1JE+Vq+ylwWEg6xyMZZAsPjqAD9wGJXW
	sA+e0TzDLgyLQ+nrQ6WIVYa4y/RpeefQfu7sCaMZSrdJyGfPz2sC2wEqPGE16eMi
	fkCzIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711uwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac16335199so240168a91.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791793967; x=1792398767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=DYJFJr5ymuPvw1NB3ugxGfMgoOgK+sWJ/BjRfkwRcm/nV+HFjHh7oPfA28NCK1K3h9
         BQLT3iFHCBMhNTA7O3XO7K5+XZMZBqQfwzaw+BamCLfvb3vFlqoAt9b66sC5EXaqOrvm
         zQeLvCNgg//Xlm8aIShbGRud8t5WW14t3Z3nlGuhbbJWmCha/qifU+GQSXIj/zLEYstk
         y/dvqEepaDdn6JF7r/Jz685W+PnTjovYwECrr4RcUERONtj/v+Xlv7E+Cd/RzR703wcd
         7GuZ5KX70fSBzC3rPH1kzn/ugO0TYbuxi8aJ64rNkBsX/+lI3VS/zG5bPN4lp/UEdcOb
         LYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793967; x=1792398767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=j2SE+RzVwmgWnaHKxBbyR/y4PMn+O/oWaOv9vmBLUJsjJfD6ZKYeU2AvajXB9fX8tM
         UtgW3Vcj/mrNOtiiwG2MRebmfZuDddUoW30e0iR5Npug4PR+9fc+vGCFSxHoJOO2CdD8
         NRdUNgiA9PMuDnobxN311ceENLknmIWpzIAsr+tASLu9+V0DnLSQFlJkQfETpdpNbiHC
         AF9zYAztbAsH1j2XUaglYw7o9hLJ/WLaTXoi/RtBdgo5/TjP56QJltZ/0aTD+1Q3g9O6
         Xqj7ICUOCZwcF1cdxMCapBdB42YfrMw79W8Cd9HcU+VV0I3MeUfNnOgygf3geWjl3Em1
         EaWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEgVMoLy0w2JrHgLr5aIEC4NFAReS/I91ksEpwuQqU1DU6OvXI0cwaajNrpK2WPH6yvgYI1KX8QevV@vger.kernel.org
X-Gm-Message-State: AFq9FYL9S7Ffmjgi2GuLSCCJcbMd6YYgMBA1/J6kMaD5KLBAFSSBpd1u
	LE/Nf7AvoI2DG7Miz92gSKLD2rszpDO717GSaIZpSjaDXssOgw3GDGbAH5Y9eXwinMzlbWbqxQF
	G+rWz4P4JDaeGEVTGPSE3xWS51f4ka2r9O3gewlv/Oob07teJoBxKrLJwlm3ZjuVG
X-Gm-Gg: AYBFou3ksfbRYHkUeJsHglBSxkwZqv4j+eIYoTBTSgcyebDCCJ7TEVifRRZpvlq1pAw
	T2TG9fvtlspDm7PseGJuDSRgLF0pwVIwrXCYEVxT8GpM/J9cDq0QYHDNW8ccmZftasDGTlBzoQ1
	iatjQEFfZJM7m1h4FGVJwL9/fMDv/PGw9iSXtESY/wnzTUwU7lw/XidwPGmya8Egd4vEnNXNKo5
	4yJBCBhdyrtlGN8W8lHeHNCfqcVVnqf6igsMaRhSv/P5ug/PDEvIKbFmOrI1PV53eQs1cskZSUm
	pwgSMo4aVYAllCEz4dJN9fVTxCGftG+0cWiuY252gTSDEbjV7AN2mA4tvCcVZCPWK1ug6G0lxql
	EmQLF44WwH/2UR/aG+IrTJP17hYR9CwNgyoCGUZ9Z2b4vvBe2ow==
X-Received: by 2002:a17:90b:2ccb:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ab3afd2c4cmr7349161a91.54.1791793966618;
        Mon, 12 Oct 2026 01:32:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ab3afd2c4cmr7349138a91.54.1791793966135;
        Mon, 12 Oct 2026 01:32:46 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm15749423a91.0.2026.10.12.01.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:32:45 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 01:32:31 -0700
Subject: [PATCH v3 2/5] arm64: dts: qcom: Add header file for IPCC physical
 client IDs for Maili platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-maili-dts-v3-2-8b499e7b9a52@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791793957; l=2377;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yWrLgn4BhUP2Li9oQYTGa5Fv7Hp9QVFrMuhqbxh5MWU=;
 b=+sPX23MBatF+CEC1JMVRkIZe3QRFHLhgsDQCOa7yS0fXC6sMX6WH5hCpVj1RcyBWGDUcfkuGA
 x/pMXugRq+vBLfKAgpn294a67YSK5NbDuM8k8tai2k3nIWsrMuL80k9
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX+DQv+FB8QnsQ
 l4H7YjyYY1sqMWDqc0B0sdVs57jh/w0ZGiycXDFIQzXqMzfc+MDYNNGtvuCgklEOOH3aXTHQtHG
 teHFEUcrFPO/kGD3+Zn70uB0ZDyhouY=
X-Proofpoint-GUID: 9oR0ZE8zZAEuC3C-TZGOqHtbvoB2Y8OU
X-Proofpoint-ORIG-GUID: 9oR0ZE8zZAEuC3C-TZGOqHtbvoB2Y8OU
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc9b2f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KM9v1C0ZMMhQZhCIbx4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfXx7hjPn9hivU3
 5rrlCmDN5HOyhR4EQKNDu9RvSxvAhZvCzcCgErpK9MBa/R6+mIfYsAM/yPdUeJtWI9MH5Z0/6Sc
 88H12jAjDhM/mAUAYFdVWu7J+HDiGox9i/tcX51ydGJYpfQPv1DyAgvpgB1YuDsgDcNKt3bTIjH
 HGjXeAnhYnAaYj6YEdoqg2ewlrW4UZ/p+lihTY5ofybgOkDgh/abcp2WydgKDKOlCbBiG23ONxV
 lPu3d9mciT7F9BI1jbtt7a6qMdDDtM5VN7LWooPHIj8Fw3qIbvEjUWgingt8RulUuafsDcZf+8b
 IUER488/6saNl9gA3PfOSxAYdxvmnRiwjM+n3fkuLgE/7djdIcRLry/Cnb66biiw2qnliCz4HNq
 4G5YS3ggnLVJQXwnbeQ3ktVQwTB/Ac9DA6OtHliETJbEMw1VKTIXMnEHAgKEr4p9GjrnRQcKteE
 TBbLYmlFJ/KUKyJfXIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120033

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Physical client IDs are used on Maili Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-ipcc.h | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-ipcc.h b/arch/arm64/boot/dts/qcom/maili-ipcc.h
new file mode 100644
index 000000000000..7cf66d20e9c1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/maili-ipcc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_MAILI_MAILBOX_IPCC_H
+#define __DTS_MAILI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_WPSS			17
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+
+#endif

-- 
2.34.1

