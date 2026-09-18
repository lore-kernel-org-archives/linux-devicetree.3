Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA94FD780
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738317; cv=none; b=R/Xps0jnGgP3xav5awUOUEi+/dLl/Gp9+DQSid730RxH+WpXtpOkNx0vtoXyKV7miN3k/wJvnpgkW5MY6T4B5qRWSGX6b1bPbtgqdL60DjyuRdwab6wus58iVTJlrbyon6W7tP0Gy4ylD2mR1znRjdSIwe83uIGCVkvllOxwneg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738317; c=relaxed/simple;
	bh=9/Ta3M+2cWHSSmmhXMsWsSyNlXd3ZUMPbwttnd3E9bA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpcEzye+0viqU/zc8jfE7+vyo8oxmA3+to+chpJL5JKw5w9UwoHAiCqsEFI0KPt4KCt1e33TEPzTXGdChqm8mwL0hMJbPbWJ4n+A4P8QLg6cH81D5un6bE7+SDAC0f1s81sazY4B7xkAqfORSlMK0srg/4ksli1c9LFrDo6kTW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhtX3WxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJqtdtm7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhtX3WxK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJqtdtm7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOUsW3645849
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CptbhzlF+w2apAmvvjkw1Ll/JtQE328m9MGf965vOYw=; b=GhtX3WxKE8+lctxH
	ifvsDmHib/i18tlgYcryCRP/NJW4CB0DZkcXfXev5pBcsN+U3MOpgRtj8ooH/X3e
	IxWli6pfMZhC1/UlxFihzkywxpA5xeI2yvjMahGPAjuC8/WNVIzyymB3WBzyWc3x
	gAl668LKJLtFoKq/YhteHEEoozgjWjpfFNm2I0SdwtWo7KEFSlnb1KRsG5WADYkR
	Z3bMsEImMsSSRifpwvwTF3WJoymMv1h7BuX7D2tQymRYmxhTMnSss0UgmxFi319e
	woblh5nj6JKFti49IPToM9O0vvNOV8CLZuw4cDyfu7Ok9ZbGa7E8099JWTvtfcWd
	wBIExw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgr7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:31:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86917d18a02so1286186b3a.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738311; x=1790343111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CptbhzlF+w2apAmvvjkw1Ll/JtQE328m9MGf965vOYw=;
        b=JJqtdtm7kMkQ/Ha3LEemSkRsDPm0J4leq+D3Yvg56xpgWcGum90O6VgRcqFrd/Z7Fp
         4Hu9hmG45s3N2xvsSwuO7glsrIRGij+3n5tQlwdgSw9j+mFLj9MoCvwBanWdx1g7b+Mh
         d6azD2leiL9JuImPbx33vC5UEkX2A6suGPgL97bKnrJXDE2ODf6jyQn8WNWUfN6ZP2cV
         RcAfX3Dx3zljAeKZLNgfA2FyIWPB/2DOVB+Xe9lP/C22mnLkBRsq8r+fTjMxKKCZPKRr
         thhrCb7aukwigvemhJk61/606LAUUi+wpDZkmK42DoCdEG1s9QUvzYno43939Qjxy6no
         MsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738311; x=1790343111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CptbhzlF+w2apAmvvjkw1Ll/JtQE328m9MGf965vOYw=;
        b=X4EBYfmrNYwjcNw6jWN46Z81kxu3ahdsgBg5zqWz3SaU5FfGw76RDdgnKQDMSW6RqD
         sz3Oeapp0ycQeCz0JjgLcomxfTYeQj5weNWI+q7z3U2sHeFQuk8KRIqWLLew1phbakkU
         VP2mIWkwYKxrnP+RFWy9Zkc7xEAkgSTqNqOZGHSbSuno7/imCUrleRZVygjpAp9tnf5P
         rKDuCYrddlN5P9VWKtcb9AI0RpinRLUAaLtYv6EZLaJ+Lc2r5Ij3cIVdwAAmM0tCEoA0
         OqSqKT88DluAVqSs8kqJQGHvhEYkMNQHRMKoNk1W7jZ5OGeMBEMsb9QD1+YD7FuecDrW
         /fjA==
X-Forwarded-Encrypted: i=1; AKwUvBwVcDB9JXN0sXnGCLPNRUvjw2VBOH/OFMomC1d/XDeiNSIWTryBQNVFuXJK4IjZd+KxgLNTu6SvTk4w@vger.kernel.org
X-Gm-Message-State: AFuF++mV3yaX+tx5YPBC+qM8D7LmfXtFtdHR7OiHPbbPur14dPsYo2J7
	1jzlAfQAN6XrBu0NEfUe3qHMStWwnx/ABMpj57Qbf8/KYSo955YPVymMJsdzt1q8nmPJcSg9NIo
	HE2vFAu6oWlAoqKFtMtNoel/rJtLfTec0w0BhJJHX1u+UvWNoD+JF4mYyKU97BpiF
X-Gm-Gg: AYBFou3RVBLiGPEbxM36LbNAlR//73kIboND+pt5P1VGCD3/uEcT4SmO4LmKCtb1uDg
	PbMCJjljDUceAlWZnRojLmWCVn1nlQMLVxP2cQZYgyU3R+wdrgoez5Pxobj7xTqrPZ+zcgoBkBQ
	6LNUQK/7LyImrAjcg86SmuNu2+iJcku5Ni04ZXsu9Ljoag9scXu3paMsmViwEzUPCF5MaQsXX0d
	lZg7eukXwE9/ydALVJCykm3OtMTUr6gqFUzx39F5EAy9PPtRa18hb7enwBNZ+e7pz1BOokjubBk
	9uwrrq4agRK6YBh1lghHYIUz1S70BgZ7C9msR01erm+ST0IbsdVx0S6HOt9llgfhEWEmWsGgAWB
	+TTHHYckFFBGzVYdyFYxBQxf9vo3DTEeEgCs=
X-Received: by 2002:a05:6a00:928b:b0:874:705d:f65f with SMTP id d2e1a72fcca58-874df8f888amr4056827b3a.45.1789738311010;
        Fri, 18 Sep 2026 06:31:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:928b:b0:874:705d:f65f with SMTP id d2e1a72fcca58-874df8f888amr4056776b3a.45.1789738310528;
        Fri, 18 Sep 2026 06:31:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:01:13 +0530
Subject: [PATCH v1 2/3] ASoC: qcom: qdsp6: lpass-ports: add support for
 QAIF AIF MI2S and TDM dais
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=5424;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=9/Ta3M+2cWHSSmmhXMsWsSyNlXd3ZUMPbwttnd3E9bA=;
 b=XbTgUQnLgmptwqOM7gVpRFjxwZzWea/dscC/3bjZwzF36H0B3ZBhELesVLHcK1w3VXunbYqny
 ZJ4IPg0z7arCFr1wEc7U1NMXhNHEfr1vra+YU6dWGUhEXaXhOY3Btja
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX+laBTbyucAKU
 zZM0gwpOMy67eRa17AUX7ZN2yNqWBPUrYuU0ws/teoz3PzuSVmEOOw9fmabVCnFS/fO+LmjyWvK
 rtAvZyeOfJW/3XIOxHQmlYfH29E9Iyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX4GrAz/GupbBH
 6z3CkPNYjZPSQ8PAR5JB+bY6dTP11ILx5T7q0/u7kW2F5Dk+oQXaeL7Rd6yzY7jzkAwBgfwlqYc
 mZs+zZaSmuUdB1H0eQCiqoqQUYTRLFp+pBHoEv1yeh0CTAh5NkqVFb/RsrcYD6wkmZAQMxfsGP8
 nj7CbUghFB8yDlFt8Mk5RpFdt9/7lwYK6WiKtNlAXS2fOn6WXH+p1cswoE9rJbkgUqak5VI+305
 HXBFKvkQTtrsZajsKPuK2yy8sXX/ZwbN37H//zbjGsbSlGFDwKS0QFSy/W6dwKKwnI6Wio9dQEp
 8HJ3eowQiv8yYQIPeUPtQ12fSLwn+pLtWRUJM0ahTQ8169HDqIlf/xYOFUaf8M91CQFj/e3wTEW
 pF0UNz4GMo9ILy+WkYYsI/EKIy+Mf1af8WIeKE1C4qGz1+n5xmb7kABc0a9ebyqiOmf575CCNBk
 J8EGWpsc8bywVIW8D1Q==
X-Proofpoint-GUID: TJWWbvw_Wt44-8mgW7ocdK59xeiD_ZMP
X-Proofpoint-ORIG-GUID: TJWWbvw_Wt44-8mgW7ocdK59xeiD_ZMP
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3d47 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7ryQxCqle0YhxczeOuoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180191

Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM dais in
the dai-driver, these dais are used in Shikra, Hawi and Nord based
Qualcomm platform devices.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c  |  2 ++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 54 ++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index e204fd59e512..83f2711bceea 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -386,6 +386,7 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
 
 	switch (dai->id) {
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 		slot_mask = (dai->id & 0x1) ? tx_mask : rx_mask;
 		if (slot_mask & ~cap_mask) {
 			dev_err(dai->dev, "%s: invalid slot mask 0x%x for %d slots\n",
@@ -474,6 +475,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		case AIF_MI2S_RX_0 ... AIF_TDM_TX_12:
 			priv = &data->priv[id];
 			priv->mclk = of_clk_get_by_name(node, "mclk");
 			if (IS_ERR(priv->mclk)) {
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index c3d8116ad503..f422346a50c6 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -548,6 +548,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.id = SENARY_MI2S_TX,
 		.name = "SEN_MI2S_TX",
 	},
+	Q6AFE_MI2S_RX_DAI("AIF RX0", AIF_MI2S_RX_0),
+	Q6AFE_MI2S_RX_DAI("AIF RX1", AIF_MI2S_RX_1),
+	Q6AFE_MI2S_RX_DAI("AIF RX2", AIF_MI2S_RX_2),
+	Q6AFE_MI2S_RX_DAI("AIF RX3", AIF_MI2S_RX_3),
+	Q6AFE_MI2S_RX_DAI("AIF RX4", AIF_MI2S_RX_4),
+	Q6AFE_MI2S_RX_DAI("AIF RX5", AIF_MI2S_RX_5),
+	Q6AFE_MI2S_RX_DAI("AIF RX6", AIF_MI2S_RX_6),
+	Q6AFE_MI2S_RX_DAI("AIF RX7", AIF_MI2S_RX_7),
+	Q6AFE_MI2S_RX_DAI("AIF RX8", AIF_MI2S_RX_8),
+	Q6AFE_MI2S_RX_DAI("AIF RX9", AIF_MI2S_RX_9),
+	Q6AFE_MI2S_RX_DAI("AIF RX10", AIF_MI2S_RX_10),
+	Q6AFE_MI2S_RX_DAI("AIF RX11", AIF_MI2S_RX_11),
+	Q6AFE_MI2S_RX_DAI("AIF RX12", AIF_MI2S_RX_12),
+	Q6AFE_MI2S_TX_DAI("AIF TX0", AIF_MI2S_TX_0),
+	Q6AFE_MI2S_TX_DAI("AIF TX1", AIF_MI2S_TX_1),
+	Q6AFE_MI2S_TX_DAI("AIF TX2", AIF_MI2S_TX_2),
+	Q6AFE_MI2S_TX_DAI("AIF TX3", AIF_MI2S_TX_3),
+	Q6AFE_MI2S_TX_DAI("AIF TX4", AIF_MI2S_TX_4),
+	Q6AFE_MI2S_TX_DAI("AIF TX5", AIF_MI2S_TX_5),
+	Q6AFE_MI2S_TX_DAI("AIF TX6", AIF_MI2S_TX_6),
+	Q6AFE_MI2S_TX_DAI("AIF TX7", AIF_MI2S_TX_7),
+	Q6AFE_MI2S_TX_DAI("AIF TX8", AIF_MI2S_TX_8),
+	Q6AFE_MI2S_TX_DAI("AIF TX9", AIF_MI2S_TX_9),
+	Q6AFE_MI2S_TX_DAI("AIF TX10", AIF_MI2S_TX_10),
+	Q6AFE_MI2S_TX_DAI("AIF TX11", AIF_MI2S_TX_11),
+	Q6AFE_MI2S_TX_DAI("AIF TX12", AIF_MI2S_TX_12),
 	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
 	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
 	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
@@ -562,6 +588,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
 	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
 	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
+	Q6AFE_TDM_PB_DAI("AIF RX0",  0,  AIF_TDM_RX_0),
+	Q6AFE_TDM_PB_DAI("AIF RX1",  1,  AIF_TDM_RX_1),
+	Q6AFE_TDM_PB_DAI("AIF RX2",  2,  AIF_TDM_RX_2),
+	Q6AFE_TDM_PB_DAI("AIF RX3",  3,  AIF_TDM_RX_3),
+	Q6AFE_TDM_PB_DAI("AIF RX4",  4,  AIF_TDM_RX_4),
+	Q6AFE_TDM_PB_DAI("AIF RX5",  5,  AIF_TDM_RX_5),
+	Q6AFE_TDM_PB_DAI("AIF RX6",  6,  AIF_TDM_RX_6),
+	Q6AFE_TDM_PB_DAI("AIF RX7",  7,  AIF_TDM_RX_7),
+	Q6AFE_TDM_PB_DAI("AIF RX8",  8,  AIF_TDM_RX_8),
+	Q6AFE_TDM_PB_DAI("AIF RX9",  9,  AIF_TDM_RX_9),
+	Q6AFE_TDM_PB_DAI("AIF RX10", 10, AIF_TDM_RX_10),
+	Q6AFE_TDM_PB_DAI("AIF RX11", 11, AIF_TDM_RX_11),
+	Q6AFE_TDM_PB_DAI("AIF RX12", 12, AIF_TDM_RX_12),
+	Q6AFE_TDM_CAP_DAI("AIF TX0",  0,  AIF_TDM_TX_0),
+	Q6AFE_TDM_CAP_DAI("AIF TX1",  1,  AIF_TDM_TX_1),
+	Q6AFE_TDM_CAP_DAI("AIF TX2",  2,  AIF_TDM_TX_2),
+	Q6AFE_TDM_CAP_DAI("AIF TX3",  3,  AIF_TDM_TX_3),
+	Q6AFE_TDM_CAP_DAI("AIF TX4",  4,  AIF_TDM_TX_4),
+	Q6AFE_TDM_CAP_DAI("AIF TX5",  5,  AIF_TDM_TX_5),
+	Q6AFE_TDM_CAP_DAI("AIF TX6",  6,  AIF_TDM_TX_6),
+	Q6AFE_TDM_CAP_DAI("AIF TX7",  7,  AIF_TDM_TX_7),
+	Q6AFE_TDM_CAP_DAI("AIF TX8",  8,  AIF_TDM_TX_8),
+	Q6AFE_TDM_CAP_DAI("AIF TX9",  9,  AIF_TDM_TX_9),
+	Q6AFE_TDM_CAP_DAI("AIF TX10", 10, AIF_TDM_TX_10),
+	Q6AFE_TDM_CAP_DAI("AIF TX11", 11, AIF_TDM_TX_11),
+	Q6AFE_TDM_CAP_DAI("AIF TX12", 12, AIF_TDM_TX_12),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -717,9 +769,11 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
+		case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6tdm_ops;
 			break;
 		case WSA_CODEC_DMA_RX_0 ... RX_CODEC_DMA_RX_7:

-- 
2.34.1

