Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26468382368
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665623; cv=none; b=UmsmUhM564PvyjiYzPDo9LYPO4E4E4pN0c27nwhffFJMM9THra9uomJJNLFhxq5aC1HpkddCLYCayG6BlISuOGMHp42o/wGI7h7L62CtWyb8Rkm3dbKE6WUbVI4kSbwEldS2gYQXC090kxDB9hJI0WvVhReMsTcU1w4u7v6I4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665623; c=relaxed/simple;
	bh=Wf4eoT8CejtfLR/935yK88aKHtjDjhsg711zXr8huUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZlX5ysoNYzBxBDXXI1IE48KLhJw2xRwHJZKI7owIJhxTO/EvGAOwOwz2jgkRrszSCkR8+GHe7N1LAPink0A8uqtGs6eYyfP7K4uOB96ziAGbYsZsQpPDZjAD+mtR0bASWLMVBCINR8lJkt7NbkII1JNfcm+THcmYeVXtMOmH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKvV8oFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmsclRMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKvV8oFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmsclRMJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNWQ5G1544870
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AnPSWOf86A1fqAksVkU/F+AvJQfOIsEXvB48sq4Z1g=; b=CKvV8oFOaUMQpb2m
	6LvMiwH4uW+iQBa3docolhqZzl111edN1sx2vV1TTSFTs81EC1kstlwifCExbtJI
	HLcYH8EzlkIBBZEcEXqHcI2onJmeJv/ZQxmPgtStU0F31B16Ls+mlaTp1BXQB4Sz
	EryP4xj52BLzjVPDIWijoHJYhAYZ5Fwxjj7+BLZUS5GBnGD0/3exonmIQ0jkb2B3
	AtVkes16yhTxROWB9fgBhTLajvDr3ADKwq2RSB/nUE7pkEWWuhaMas0QBlMualHl
	RsEiPb3zKCsjOHISHUax8PJd8wV+TQ07+qRXcc9MnG/XiAX3/hcD4tVNkYbQz5jz
	pTxmVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr4heg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso3180952a12.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665619; x=1777270419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AnPSWOf86A1fqAksVkU/F+AvJQfOIsEXvB48sq4Z1g=;
        b=QmsclRMJPYsWHpPedFERINs60oINS6pmJSeRpIOs4CorKh9qQzgE25BsyPJM5Skuko
         D89MtHkCiYF1UMXt4hBWTY3CWhTY22M6ewVF0vu+j7fF4ohYUfItkD0h9GhSxEC+brf1
         B2cmIFacZHbGKQWMR/8vjrT5z57PMJllj5V8wx/ICrrOgLK5xnztJX2qUST4FoXBIUjL
         f19Etjnu9jPOr/j6lEoAY/htYRELLr0/TgvhlcIhG7sPuJG3ufyUOfy3wIyYNLfKovJj
         UkCy0lDcnAiSRLeLXgzJ05d78R/zSJvTs76xwb8QRvZFElGdXLmGErtxinAL2Tko/tOK
         RoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665619; x=1777270419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7AnPSWOf86A1fqAksVkU/F+AvJQfOIsEXvB48sq4Z1g=;
        b=njhnu9EPqoXxvlolGVt70upCncYZMmPgKccq5B6QWgPulgKjiV8imrZgIfMsDtPooc
         DmXwNVtZzMuxIkWlR6x5CqZcRlUeACsnryRUl88LwhqQQ4ykrrwEkJbWuJdCtPBNYtmf
         sT+ijii9lU47Xqz5AYnOdYEVfxO6zo5Do9234Lt3NyZjwYuiKy3DSHAFaZ72p2uo2WNF
         EuqeiWonG1axO3LoxYZ88EnQzysUM1cgAzYcqommWxlhiFLanv33LgyEJt5GqYVN47Dg
         eW9W5SXDijkeEM5TqtNbGjQarTQbGQn9kAGrxPW0Oag2K2Qq7bavXbKBYvC436UQ0z3A
         i6cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/thCM8KyOKV9mZ6zbfLSnSXfvolXWkSutNXLpge3ti4olFnSUWjTVRUMZW/vkD6CXqa6QOZD3PTboM@vger.kernel.org
X-Gm-Message-State: AOJu0YzPWHmvJKIEJ4BTv/nPvTDgmwm8XDqzSHeZNTqx7OZ7RV7ygnF7
	orfYpM3PPcXZedzB56KsGVdCmO35cgoNC+3kAhTSfwHmnObxFzp1gLR9XIvaqyYvQkI8qt8ybKo
	SukwzJD32LMCk+qVdG650lpm7JZJheNHHePXmxYnRxFuGcYXhOHBzXM9v1PPFr+e1
X-Gm-Gg: AeBDiesAVV3xg4ZASN169SIMJWRR5UJii/HRtaxftWGscCdXS88wUPwlxfastGldWCT
	iYamr4QZTfcMXkXpkIrE9WfFZC+k5w0m3bs9hd6eaiv3fPKHkcDcCxmZZDzNYIeQWwxP+4O24cS
	iG8qLkyIvYaPQnZLIsewN5u7JhXTHRiZQA3lvVnHgv/t0q9k2znEzpfJcrKvYIptC7y2N9l69am
	P+MXeaAXHxyJZm3hAPzqOiZDLwYI2ewlow1e+QMUyv+pbnUdl+G3yRLstmPAFaFaYP++l4Z2MU3
	bh44VQl8jz4B9ILaXcKMvnzmVFSyoWjDQh2gvtWcifxWem3v8J1K6Xg4H0QoueTeYHWH35aIkUL
	qgcprtF3C/ze3RqrDEBHHJcbp3MOL1Vx7u4J/UCTuOAa+TZHzXS1CPKhAR+ce7n6wn3ZJ
X-Received: by 2002:a05:6a00:929b:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-82f8c8e8d78mr13418536b3a.36.1776665618751;
        Sun, 19 Apr 2026 23:13:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:929b:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-82f8c8e8d78mr13418511b3a.36.1776665618298;
        Sun, 19 Apr 2026 23:13:38 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:37 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:54 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-7-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665582; l=1341;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Wf4eoT8CejtfLR/935yK88aKHtjDjhsg711zXr8huUg=;
 b=SAwSWLIeWNAXNjiXxnGpHx/1U/G5POQn5aYBtIoSaWPAkRUZJpewt86/zz0dcgsYSEIsvnArT
 mjTXs4YLXRQC6mkKWAt2iv7+xdV0CWNwg7fNHWJROY+sxs7y+XZnKwO
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX1b6FoDBVCNbo
 TDlgsQjnsvKw12LVXSO26a7roCvnumMxkg9kAYWwhwSzl7i5tRVET7+93jEO+7Z4neSXDVLMbLS
 P6/OKVtMa20Up2/miXT+hCQgFgD+QcFl9x3q3mmb0y5j/k7oisSlnBoDELyQ9BD5jMDr8K3MT0b
 +ybArBrS8dEWH6plwFSrucI08k7ECl56DFQDmmReXWoitQ9F/LdXazco0ZI89EFYoqhHjULAnYE
 QqCfHGWHSzbulAhIPdIcZJT+Pn2GBZN0xM6HLnlDK3N0shFPtOg5Bfi2jjDPt3hNXiHEK5Fzc9e
 SkJBsuUwsmdXtBiE2xK1YRBJFhFeyPa9mAX+32tw6P3WUdrcCjoEejQ4UOCot+382H7RAX4rAmT
 VmdS1W+Se8Y1LJGRokuyWe9UE3pvoNwuzH6zGPy+5JcZzuFKO39q8ArEfwEhg3xS32GxuOiC0gk
 5UG8EQ8PDEviVq3G6BA==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5c413 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=va74t0jcI0ebB8ul8YAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: OrhuD6cZb1yCwiiDWQbP1-azr-bO_uj2
X-Proofpoint-GUID: OrhuD6cZb1yCwiiDWQbP1-azr-bO_uj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without this path, the interconnect framework cannot
correctly vote for the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..7515d982b38e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2864,9 +2864,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&config_noc SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1

