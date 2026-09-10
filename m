Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C113A49BD8A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052588; cv=none; b=OIw3E6/O/9m9QSk6Vw/JyI+t3vT2IDYZwCRKUNuLXvxoEd2nSB8mUQcc/cZOOLFw8IB9RA0OGcLLUM9ZiNCIlQeqc6Wy6qMO6FJOXwkwGkzNRajqu3LetYNeHscUgpKFFrmTe3c57S7XacA+VcLbG901ETdGiuvheov/jz/zw7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052588; c=relaxed/simple;
	bh=Yt6bgePLJmo5nfr3TgUtFNZs1VIHJBLofDWIH217bHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BuB2IpLZTj3lWpYtekTPaAeRxQPorMLCpPpyfFm3G7OxvDqhTswgvFaqX4OvlqOoXRq0AT+oh51c9+1YhDzlOhQu2I1XER/F51oS2YHXlUu3IAwgjFPTG8aG7h4Tlaz4hifxwFRmXN1h4tjRCCvvduoymslvMFGK2Vy0CyB5bwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e29PEg4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmrB3nco; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e29PEg4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmrB3nco"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADcAHt1068049
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qlv+RCIgN6n8OpIQswWk7x
	Zr8KiDxD72diUXV2HDjvY=; b=e29PEg4RQa7lGENEkW91d7a+K5tqvU+XIWicPe
	1FTHUTz5abkpuA8431sv2/ZDtHZGErPco3Sis9h2UA1lyBPixPIuVcIqdKyCQRBE
	Ie2t0pJS1nC0NrQ/mTsSH2Fr+ooaL0kQV4wPENNlRlxNm6oLo3PNRK4LPzQ1uiXk
	2nO9Ph4xgTYt4asygF0axN3HaJYLuQaPeieMfDkBrlNONVmzL6p8lYt/Ljw+FabG
	lAMF8mHXx0GPtUsB3hyq2NdzjXMWUhN8c3KfTAsvL14LlhEcmqolXLnfS07CzRXm
	iUJsFX61R8X6+/SPaMbmQKe/+T5VsS/9bNWuFVW0/fvCYctA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw8hev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso8341360a12.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052584; x=1789657384; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qlv+RCIgN6n8OpIQswWk7xZr8KiDxD72diUXV2HDjvY=;
        b=VmrB3ncoqEYXx/05ugUyW/qs3PbuImIEFDTauncOC3u41l7GvtsG3RibbthgzPMnux
         j0g6iJGx2bij+mvYys4/Zk2yGUFuBqLsn6xrf+/zY+CJF7BlcR0/c4A3KghjL+iCLerw
         KPWrdwd5y7I5wQaApvSY9XpW2X9V28sLqq/v7P8lbeDSfSXXUgb0QoUfD9+GBZIw+ROL
         qCnOOWWmnI+C8B8E2BcO+tXc1QS6p6fuNW0qHbA6jTYo4imcjTWP/yV2seWG0u4N1bsX
         vwCM+XjVhUGtw9YWAvFtvoREfTXXF/h9o8fQ9TKUJOEkREllJlw9XQSpqL2XswgMUnCS
         K2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052584; x=1789657384;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qlv+RCIgN6n8OpIQswWk7xZr8KiDxD72diUXV2HDjvY=;
        b=sI4cDewO8/SQfpIRsHKMjhvtEuScEl0syhY8fIkGWIE6AgmE+z8R8NuzVKmT+3cTaH
         paFXrukDnF3J9Zll27BayQLgQ1hmCuTkziifBd3fR19A0nVzsl5VqoGAWUckPhuYx+Re
         U6zcXeycab55BU4RVUqfHufQhgCBjXqbFhHQ3r3cVXY3L5GqoHjZRt9D1Vx0UKQUvSBs
         1GWX9IBSW/oE/lS27rzH0/LUjQxfRRU+xB3Jmu6ohEV0IlRgu/SGc9Ej2neBaJxhW0u+
         6UwB6LAfeWmlepORxWPCEfzSq+NNto9ECkWevHCQ+w2ImwXdDYI/C5kF70VB/a95n3P7
         tNjw==
X-Forwarded-Encrypted: i=1; AKwUvBxsGnqaf0WpMfAb315LWIUcy6idk9+iBs2Cvhnye06V1xzRIe9Qeh2D8qlVlXJLE2tSNvhyBmpII6H5@vger.kernel.org
X-Gm-Message-State: AFuF++nN2OHzeMn5ehM31PeCiHAfzJrWKiaGiRRR+IjlWUeAXiZRxK9t
	vC3hC0X8OSf7SHQOn5S/0nD7BNiyQ8dTOuTpMT6oCNV9TKPIJU8kMZEZXFp6SqXj1Ky9Tcz5NBg
	5bkDp8617vX9twaFtN+3nkp7wgjkWyT3grAOBmjazPkDM//Pw49tjatAVlUXXOiIO
X-Gm-Gg: AYBFou28uiZfsw5htoiLrIJH1OxaBWPsp/6+SvFkQnJsKVgHVrWJYA09FNGoTdlFz0l
	T7IDjffVqmdbJ6u9iy88Y+tUWUX5H1dub2CMYN8oTy5nBnEp2pcTqPXhNBg/c9jhqsW/2+CRBIf
	7Qfh3/B/eEQLTBXFvBiGRiyV4pIMRDWYVjV8bLedmm84K7Wy1kJu2HgtHINTr9F/MF4oQ3K9mHE
	wfE/kWovcgrGSFURm3B6ikl7QxSUtzhO7iJu3l6YagE8iZu+aBhSn4kq4YdpVZGL9TrXs7DyRH1
	yubsfvZIWY2HEEcu4wy5fxl1t8FqlDHZvEe+vxors/aIbzDoLdwaHYOE4F/TmRbhfv9b2F8deHX
	lMNY15Hm91Al8fR5Cjm89DK63Bpij
X-Received: by 2002:a05:6a00:2d91:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-8616bd5c57amr53850258b3a.17.1789052582967;
        Thu, 10 Sep 2026 08:03:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d91:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-8616bd5c57amr53849946b3a.17.1789052581155;
        Thu, 10 Sep 2026 08:03:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:00 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC: qcom: Shikra machine driver and DT binding
 support
Date: Thu, 10 Sep 2026 20:32:37 +0530
Message-Id: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3GomoC/yXMSQ6DMAxA0asgr2speMHQq6AuMrjEoKZVDAgJc
 XfSdvkW/x+gnIUV7tUBmTdReacCulXgo00jo4RiIEON6WuDGmXOFl/WR0mMG2FobNsH50LnCUr
 3yfyU/fccHn/r6ib2y3cE53kBpZqR9XUAAAA=
X-Change-ID: 20260910-shikra-machine-v2-d6a79dbbd8c2
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2c6a9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EeDgvMqZeazNxKWBYXAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX++5KFszqdLkd
 7w0QlsZUlIb+JzqutuoGVWO2/GPsSrrtoXh31wyDnh7BUhpO11E9o4Wt7ISkTSNvs0SdNIjSlHU
 X0TkX0ydhIxS0A3G1lxQdR1DyTTU0HM=
X-Proofpoint-ORIG-GUID: -HUNOqiTVVbn8t09gWtCQvS8hD5Cv99O
X-Proofpoint-GUID: -HUNOqiTVVbn8t09gWtCQvS8hD5Cv99O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX5aoNYOrxNClR
 hxRTxaBKdKx7KGZLH0lksuXvaEMRt4ppaa5duTncjev4MNefg7eoePk16N1vJex/g+Fow0UYptF
 PHJaXYm2dcEEpKRbte7Rwn+/gXvPIN+O+YlbZDNyM11gGEqYAIuAM7N7lqM/pcSFgKRmFzxAnFJ
 DCCq5dlyoXvwqfDXltCcaPEEuSpyLQx4+38vbOI9bF+HnkdDNJb2vimydXM9zoemC5Qad6HkZdz
 zZVm5RmAvHWLeWYbCTeumkOqDTJusZfzxlxuaPrKVQrYUklw/zxPA7Isd3dHhheaPIgqUf9lNNs
 ulnxOvCjLHRiU1tnHx4efnUaaBn/38NUgWM6JcdjUqA5JqMWXrFgEImFZTT0QE6UWw/LwDBFkHu
 txWFGi/Eu1IRSNP2L5GO3t0tXKKE9dT3IYBFt1HmME8o5fToa35KV9I4AHpqpB7zIlAOLNbemIv
 Yp6SHE7ZamUZa/ORiVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

This series adds Qualcomm Shikra sound-card variant support in DT
bindings and in the sc8280xp machine driver.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

Changes in v2:
- Split the single machine-driver patch into four separate patches
  as requested by Srinivas and Dmitry:
  - Patch 2/5: extend hw_params for QAIF MI2S/TDM DAI ranges,
    add cpu_dai_fmt, VA_CODEC_DMA_TX_1 and be_ops filter changes
  - Patch 3/5: CQM variant support
  - Patch 4/5: CQS variant support
  - Patch 5/5: IQS variant support
- Carry forward Reviewed-by from Krzysztof on the DT binding patch
- Use correct struct type (qcom_snd_soc_common) for all priv_data

Link: https://lore.kernel.org/all/20260611112946.954172-1-ajay.nandam@oss.qualcomm.com/ [v1]

Dependencies:
- https://lore.kernel.org/all/20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com/
  Dependency: CPU DAI ID's mentioned in the above patch

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (5):
      ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
      ASoC: qcom: sc8280xp: Extend hw_params for QAIF backends
      ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  3 +
 sound/soc/qcom/sc8280xp.c                          | 82 ++++++++++++++++++++--
 sound/soc/qcom/sdw.c                               |  1 +
 3 files changed, 79 insertions(+), 7 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-shikra-machine-v2-d6a79dbbd8c2

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

