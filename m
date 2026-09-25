Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E947A0B7
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326031; cv=none; b=Ykwr/TBnKpKqVxXwVHTG9c7F/rkHI6xH9Mdg2dVw19Ln6WN5a4WoRcvhgC5dVEqMNi8V+66fbcTN7jAc+7LcUvw2xcYRGyBN/htFEcObfMTky5qGisPKsbSUhgS/MSlzkXnzC1IRYcXVLKx27VtP/nxzCFOi7B0C7rU9S0g+g20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326031; c=relaxed/simple;
	bh=qZl1Q5bwQ58gN3uKiNg4+tTdTPKtZZZ4CCEo6LH3/Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFqPZvU+Yb85e973+sRE0l2efjrklQo+f7IOLEqHz8V+ddJ0ZaE9tl8n91XwsIXbexfXmNjL66nbVckMrsIZKD72yxku0rYOTLkeJwd8IRtQC23Agq2oUBzBORCJ9QDIeZqS+dEMrlCmz1sE/P9s7V8WQ8iqhgic8Tu+ne8VDKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaEl7h57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYQtZV0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaEl7h57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYQtZV0Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YSJx1055735
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DP27l+sS5LI
	NTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=; b=FaEl7h57P63nm3L1ZHNi49+sycY
	tGd28w+8kMZQzDj6Qhcu5B6GP+ppY9sdPLfR8bheQY5jp0OBv1mL+iTqu3Q7Ople
	zThS6PUX6HXE8lAXNRif0re+QGHIWscMMTXR0i3YRtRpGPkl1ZDBjNC/Zb+sV4AW
	qSMRvh8TCjWgHR6WLPXl8AA4tknDs0wTtqGVmn7dvB1iIBIBoKV5DQhu4TcMGXja
	OEPU+d1xJWHFTupDOU6g1buNMYmX8/uzfj6H3zQhEzx84EDFcyLpszqFb1YzBx3Y
	Dq59IWFUg6EuR8FTzA6+BcxW9RjEDuiiO6Yenc6fdROkCj/PO6mkFxjQvbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce79p4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so155252285a.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326013; x=1790930813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DP27l+sS5LINTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=;
        b=XYQtZV0YrxuFd0AhrmwAoBb6CZZaTOTywS5W2DnX40nrFmKIzueNlyspYs48SO/9L9
         Yd3v2tcVUw/mDIgiU1Il4oELJbAvsBA4LkOqs56cxr9EqACKykbfUBUsxVxhFBEWq1zN
         WhVRG7F7DLShhLaQIWGhwse6xTRu9Vm8HPg/Eq2FSU6EkPVWgawpvV4ecRYxsMgFOtWE
         A65cS2PoPBfX2tMdOjIXjXdN0OMvVTi4IcTgUB949lwZo3YSwx9EvcY8U7Vz19EOoImI
         kVFFtd65nn4xgm1MY2LzYszIw/QR4patRScC9IH5VPJlSQe48exo4CDMSlCOX/PQeF8F
         sHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326013; x=1790930813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DP27l+sS5LINTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=;
        b=p3N5IKDpbcDuysbK/kSf+EnuXPcZCu7eyz3iU4MV1dFvClNQJezyRVOOZdMRB45rdK
         Oo6rC23g9FoQKFX1NOGAEXnJCubVtVbtG39tlF6sY8FP8mMY4JZCXSSth6REYujBPUIo
         FSlCnonohUUgvAvtK9+mS7VKwX8iDp8G+rjKTvzmx50qZRavl7nYWGyLrfXXAk0yLSte
         i/nEONhEHaDPmzMEW2BvvJEQbEwhCM5gLrKa2mHsL99xScWiPBDnde8iX3XdW9h98yln
         ikoc7w1yg8ONs5za4rUYQGiqQCHgc5IWYsxP+9vE/OMpC25yt9pbV7J/z0AVrCfNz7ki
         FkAg==
X-Forwarded-Encrypted: i=1; AKwUvBxnKpU60cb5na6OQZFFAaGPgFG1udA9SekGr8bd1U7GdNgJ9oWv9WgrvgxD6A5ryrPDx3yNJ4x4D5Nk@vger.kernel.org
X-Gm-Message-State: AFuF++kg6VXlAenTNb5gJszI91CwzAlQXKC5InKtO/swJrhHE/jxH+ug
	wAZunXDNGfKVuPsktpjx2ui2TKpogaXNuFGEqmCQan2QPhjseTLE5pVS2XDW1RuAtlUdG9Q1B5J
	pQyrCpkjN0Uikb2AXb9VaA2ewaB9rRDjNW+U/YY7Y/QIaqZev4NoQ9972OpXq9gbM
X-Gm-Gg: AYBFou3WPQIVrCEYRwOwLzGEIZKTjXF8h4Q3SsjeMjmP6KO9Ao1U/pcf3jg6POeiSWn
	JnLtZng7Vg2MArBwC9hdY94WwBYolqY4R2FZNDywjfss6nbv2yItyO0SDtWl6Su2Ps0RMvoqkUF
	v6ML+Aq2vDyL+XDq4FvrIKV3fqEB9FajWssD5CiPlHNYsIWeihwun9DmewP/43UqYed1CDRPaUW
	xHFrERnlvBvYQe3deKmWF8AyugDPM25UyfGSnAvEozOoEsyJeXVz9+M7+2TnoWFcCaA3I2E7MSl
	Cg5nC0etsmGqHKu0HPMGZdPYBOgwf7CftuNZaGI8FtBkMLO/ayTE5hR/9SCd9NZ8HBw0OWXW85U
	ZxovY2VwM7kzD
X-Received: by 2002:a05:620a:2843:b0:93b:d79f:d944 with SMTP id af79cd13be357-93c43e8a580mr309132385a.57.1790326013266;
        Fri, 25 Sep 2026 01:46:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2843:b0:93b:d79f:d944 with SMTP id af79cd13be357-93c43e8a580mr309129285a.57.1790326012853;
        Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Fri, 25 Sep 2026 09:46:35 +0100
Message-ID: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ebd75Rdetp7_w0WO3T7DlVh0hYVw1qzF
X-Proofpoint-ORIG-GUID: ebd75Rdetp7_w0WO3T7DlVh0hYVw1qzF
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab634fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXxFAgAuMKSRtA
 nmIZ69rbft3E3jhP0WZFD4IQubErSeGRkdBnXqpRYfthgWHx1BteDC//VYlIrXGPz66JHawJK/8
 73AwJqrUJcUi6hAq0WSHAvANevcRzzh41C/NxZRuG8XWMMEoG4wVKEl11f8HmGe05v+KtQweDCi
 +EtM934tTaMkVRyovQ8lINxmsbZMcaQX7uozmR4fb6sRB1TMbyZpB6pZckEmo32udNpmuqz/vHE
 CNvCDBnFu73vl56L6uBI9K9HyfiGaRAth89NRj2Xe1k4SArjEPJp34suC8VXWCwwDXFDe2BEfEG
 9m6Qs73AoUteC4gUkec0dzWi7dbs/VRTQr1m+80U0ach08Hub5XKXTnyFfrHEiaoKrnrt0rU3nX
 3DR2tokTFdZM3o/GNkoUgYQO22BNt1IyrHINqf/IkOnricUPCauCJoy1uY2kt4W2M/MMlqeqVp8
 A3LDzf7v/WYv1Cy//GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXw1ETf0FXMUrk
 q672padzu+Dfxp+pbofGNALOl33oKEGdHQzKy2XeM8IqVBFMTb6JVblgrfw5EprCnp6xVpb3gG8
 KHvfy4zKgvY4bFuvV3XKRqcR/Uz6eV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index 356625dce99e..eda13686850c 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

