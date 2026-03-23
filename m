Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70690386553
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257513; cv=none; b=X1vHAyMrc8Adu4efD3cHW31J92/hmoUsVCO+7SHPNMWjAuKRqhDtxBtOp1LcRTKNr3TT01zWfGxCi8dpksN+yAfidC9cmnSN8jsVkEcdhdM+od9p6Gbgq1awSU+ImwZFUMI0b0DwMDuMUj+Jtdzti4zrBiWrwZ/fzrjYd64fyWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257513; c=relaxed/simple;
	bh=GRasFOQDQnuoi6LdOvdCuvHUGo8tuUdcLZv2gGWTa7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JwlBIUlYOTeAm/6Csr9mcpB2HlS8tbc7G5JcQVp1O2qw3g79UhZ5gmadqEfDBqpQAIZa9fb/fA9HT14ZbkGI707mf/jZioGrqyr8dYFbaS8nseBqj52EanQ/I3NOz9l8+fVDlcUnVgKVPh9ZP5E5XNdHntGwGlNECW0CKr/9sXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmOMaHrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvYcnUn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmOMaHrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvYcnUn5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ABDa3588156
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=; b=bmOMaHrSpkRUjCi4
	mxpsYzlaH/hvSwoLZc8KGvFWSK4KbTGcnBp52OI6GAv6O0eXNAzm3urSN2sbuEr/
	TN37j5/6zjOovos6vQ+82ktCIk8c5Pz484x/7pKb/L93wwyhObApJhHjFNG+D3SC
	eSvo16EEaN1yDZVGEWFnMqIRwf/RopzUYF2FJGxUWFueIslGd1VwLRJpUtVkCV4J
	wVfbbqq/zZ0ef1OAhSoBJgLCU4pqJRq0EjHvhQsg15HcTTnInBZB3Zl8xy4TEMAr
	4GfbwI97fq8j6WWCK15k2EW7pBHvO+geNFqAQM8S9+J4yQ3uf4A3tFHwBQcBH7W2
	q1oXUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jm98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b8f351debso4879273a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257510; x=1774862310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=;
        b=SvYcnUn5MIW9czobkiH2neGDmBcVOH4miEhmNIMAgOMNsOdxC++KDGoQVqhIHZnLzU
         mxGqRGI0pYEW+sAN/alPME9Xl9ofLeACD2AebaaVmcrtNWz7nVOxFsajkRpHieXYAGDS
         XjbZ/ghKpVMgwCrdijoXDD/kdfJh+1bJh74ctcmsj/Qc3vViORkvB/tEfQT2ugXYmpMw
         UK0Wi0xNZH77j/3i4gy27dBBfPn7MnCfChM6GKtt8Q6AqZfyAjK5heXh2sIN4THgZcq9
         3MUqYIfduin/rdUd6mQ87SdJ23F0MxxAqdL2aYE1ZwNv29B8G9LvTe3C/8iWQuRRdrNo
         8JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257510; x=1774862310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=;
        b=F1TuQ8XNnBwBGeQxgJu1GsfUAYHixkdlr5nELcWz08iPqUW3QwxNRkHJdSvJb4KDRS
         Nu+eQSczjusL8UQlOeYxZwMkvi1tKaF/gQMn2sEqLAAQ7kHoaM62KttWrtWlETaarJZF
         gebiRPBgcLesi9ixAAZU5VDo2DApFxeAQMugA8FN/Z7B7lC/WUjeoG8v75VRBaQ/J5++
         jXfeLvmV2oGbolG2wSxhecA/UOPn04KSWbBAUsw/WZ0LRZ9RDKwGhAqujxiXCongU416
         xnIwNj8KCl4MZOZWTkhdhn1COglEsD1f5j4KzNhLml7zT1szjEXxlXhsS8JKVQyxKBV1
         SBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUHFkFYECOX6K+cpcVq2J9yObOq2ociFZzlruv+iYSW4dClxbIUUL0uSxGFI7ZnUGdltSgx3oIfWkg@vger.kernel.org
X-Gm-Message-State: AOJu0YxzrLxbDQVUlI4d7Qp+LK9HNES4OBfBeI+4ZMXdeo19Ij/QvQRy
	cAduFcKKtLFl0LFp6gPEO2Y1RwD1mkm+N4dL39FFfofavhA2pqk36xnrdGfElfp6sY34xExAzD7
	DOU4OfaxXQTIIklCr1OhIgAo53tL03kuqVyU2l8GmkX4U2sidqI8GfNfu1Y1qH+kI
X-Gm-Gg: ATEYQzzA1x1IhOxWSvC4frTBVNbhIpLRPEIpqlzrRZiDnnBxVar1iBjj/4ALG8F41oT
	kYCUzgFK7EIiPxCP0CwWFkHGKJn1qtM/5CUgUuKZ53RdtOm5Z993XR5IX3z8XTMF0u1S6mVQ7RL
	BqZO8HhxHcZfAOgs78aZEECpHwISz+dUKEq9UENGg6ijf98BQpstzLDZU1pgAtg2SD8suIf2gZz
	XcLURw/k9BiOA9Qh7oJur1hO2vT4GaIZpwclE+QcTWlaL9UN5B0j92gk4fr2wVt5N3tlmdk3fIm
	YJIga4tgLQ/wvffAkWEgRWtSD17V/vyPHEWxgon9rFuuTuu/0tWZ+J3f9faAD3FmMeoWCqHu17i
	q344i19ZvQYifn7uRdOQ+qwrL3lPE/aV1lALM7dqG6C1DkO8=
X-Received: by 2002:a17:90b:28cf:b0:35b:e566:15a6 with SMTP id 98e67ed59e1d1-35be56625d6mr4506783a91.28.1774257509884;
        Mon, 23 Mar 2026 02:18:29 -0700 (PDT)
X-Received: by 2002:a17:90b:28cf:b0:35b:e566:15a6 with SMTP id 98e67ed59e1d1-35be56625d6mr4506758a91.28.1774257509385;
        Mon, 23 Mar 2026 02:18:29 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:29 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:55 +0530
Subject: [PATCH v4 02/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=2504;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=GRasFOQDQnuoi6LdOvdCuvHUGo8tuUdcLZv2gGWTa7I=;
 b=0AKNRl6KfF/JYgXrtGC4dExbf3Ox7uxMEZ6hQ/OzDCKpAt31J5XhaBXgEeDlTCqSJjJZuQYds
 bmivaZvOYjPDXR3cTODuxf7D9DSQNwkbi3lePlT0YgGyra7M2ElG3TS
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX/fsgghA1U7g/
 zdFyf94ZaR10qsyXpzaQle4+tWbtdVBzSz+Wvshy+fMZ5iAEdKPy5q3LyUh6tHh/AKULSDI6sck
 A4japYD3Q9VsNRgtkI04DlR/DAlmiJQ4QVqbYcEgqkErM7uVr21HWTzo9K+S36lG2zWfqczG56h
 o6eNZIK2GD9nTfcRTPG6b0xgmFOM/UwF7UbYwI049VabCtydLYCovmS1C5EwoNyC42biSTgg+xD
 S5jfPPqGkU/JD4QcZeh9GX44rAXM7rhz+76IUdDGNxRnS1TL7bcfAJEVkJgz5l4/negECpFaoHo
 jKThsJ+XgCYWq9OXrXVQiuq0yl9RQP7qxi0trcFu9W21t8FC+ndDCqHWkXkAUHpEtGyqhgkAxDY
 WGmoPqDI9UJtBU1x7TXpvjn3MemrPWm2NvEdFS43jD/+M/GI4hdwGRm2ShnpE33SlxocnY1BwyF
 9bvUPBNRjFInAFkWNyw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c10566 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DGDWbsvPyNGGEFbMfx4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8768yVGtvOoHobsECRPzG42QIss03poF
X-Proofpoint-GUID: 8768yVGtvOoHobsECRPzG42QIss03poF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
de-coupled from the QCOM UFS driver, it explicitly votes for its required
clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
not passed on the kernel command line, to avoid potential unclocked ICE
hardware register access during probe the ICE driver should additionally
vote on the 'iface' clock.
Also update the suspend and resume callbacks to handle un-voting and voting
on the 'iface' clock.

Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..bf4ab2d9e5c0 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -108,6 +108,7 @@ struct qcom_ice {
 	void __iomem *base;
 
 	struct clk *core_clk;
+	struct clk *iface_clk;
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
@@ -312,8 +313,13 @@ int qcom_ice_resume(struct qcom_ice *ice)
 
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
-		dev_err(dev, "failed to enable core clock (%d)\n",
-			err);
+		dev_err(dev, "Failed to enable core clock: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(ice->iface_clk);
+	if (err) {
+		dev_err(dev, "Failed to enable iface clock: %d\n", err);
 		return err;
 	}
 	qcom_ice_hwkm_init(ice);
@@ -323,6 +329,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
 
 int qcom_ice_suspend(struct qcom_ice *ice)
 {
+	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
 	ice->hwkm_init_complete = false;
 
@@ -579,11 +586,17 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	engine->core_clk = devm_clk_get_optional_enabled(dev, "ice_core_clk");
 	if (!engine->core_clk)
 		engine->core_clk = devm_clk_get_optional_enabled(dev, "ice");
+	if (!engine->core_clk)
+		engine->core_clk = devm_clk_get_optional_enabled(dev, "core");
 	if (!engine->core_clk)
 		engine->core_clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
+	engine->iface_clk = devm_clk_get_optional_enabled(dev, "iface");
+	if (IS_ERR(engine->iface_clk))
+		return ERR_CAST(engine->iface_clk);
+
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
 

-- 
2.34.1

