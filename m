Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422A38A73B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902134; cv=none; b=KqiFMYpZtS6pjKjZ8mBOOfSTvHG0IvkzQg0PouWO2HINBH+kvWuFVw58Sx/eD9l0qADniCNTkC4Zodt2BiBc/9TfOe9x39EbQvzQFsh6gO9NnNMt0D0lQY3JI6JbirARP6146Y3gZmyHs/OZuHg2EtSRdSc0XQdpWlY5OPWVNc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902134; c=relaxed/simple;
	bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0B/cYQlO93c9/E+3G1ptGgYKFjMFooCPcIWk0i2LS01xxzfrzFqSIBEBSad/bolhuydPSyWxNUL/+um+FCjyP6tMJ6RloqeIByYhfmMA70FlbL//ZoN/Q2fB08EViMgESviPSHg5mS4XZtidSyRKL0HGBThw/heWHcLLtBb42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJ66Fx1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Img/yTmO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJ66Fx1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Img/yTmO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OlPH2347165
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=DJ66Fx1BswjDUyEg
	+m9kBhO7qIXWhbLthFaXsPksqnt3w589fO8O6xJ1eWkLomEpC2nrTxxZ2t3o7ZhN
	DfpXFai3Q7Vby04dgnfSrdHzQcHaGS5O2SQ1stwlgogRAQ9hB7SSEWJBR+cGtYmM
	5MH5CWg23cSuXsBcLk31zDjKxgfCbYoOUllAbLTjgBHLyCbFEMyfFZguoxbnyFvH
	shA97w++ZxMmstGOOkcdxsjUTSaKsKsyTZRu9KCG9d+NwJqm6jY/E6Q4g4HGuscN
	faozQ7bHiIUUs1t/9pwf9mh9SPeVriOcvw5R9wXPDZqKpHIW73hSgapKMA/pzOMh
	asULJw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrepy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:02:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8424aac207eso3480287b3a.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902133; x=1781506933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=Img/yTmOz4EZJKx6jz6MPDe0m7sIzxJ/THZHT1mPeBZIOCVp0iu0Hy8XS5g6m3dfDJ
         wo4/8CUbVg+/XIVKdE7HZD3NIBoTCWYbRp0HMRMkdYRADUG32jrKlz1+3hea0ypG99Pa
         axQRJBsjWgguEXr4vQxg+9JS4du/bM+yK5ocoGfrIobt6hg98yqGiLKZPZpEQc0iCgwk
         HkUyrduPRIHsxU1riEDONTK6vuWKHlJYVf8tnX8WsFqewdPllez55C8z5+LEOFB4N9Tg
         EetHlY4daP3dzmLfOQ+WhNYvF6mqpbzehd162dD8Vlm2mAhuKYP2P+5hGSyHL4uKNIqL
         x3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902133; x=1781506933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=Wkfj2DvZ2pOzCInsZVB/2Y3JO6c43R9AEl7fKygbLVwmzdAYz9D+h4eXoIri8qLGr3
         Wn7UgHWrPZzIN/xp2oU7uhf0B2QDaN1BPofLHGz0KyZ0ObK8s4/dL+94l4M93M2E9gV0
         aj0IgG+9DF3VdZmHPrbXazcPvC+dKMA4eivBWvevMlBKZav+v3bw1oKKaRqTFtDARVgf
         PZVcSHpAYwRjt3PoL8lxNxeO++6rMj/lFY9HQRfcBkWRgDVq8U9jUM3ZQra8o7PkhxbD
         pV3MpPkJOaLobyefOrQy22tyHclTncAFjJNKt6wB2f+bHD9smpRNLL4OVNCrZoPQgarX
         niQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GISUhmnB7tFzeMTipqRheC8CVQkRBomG1jv043BBtf0BSgaWE+5DYLqgIDwzI3q+pfsYvJykyPI4k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2R9b5MmfLS6pK/WrDwu+/LNRVVd66Ksa3ypPkqeLwE/l5TQgj
	DNESUWx4JzYOXoPeUeTJTgr7lQWiajVMhLFNOSTD/nJSTzY4DvyfZ/0DmL2p8h3xK1YLNH23Y2z
	p6qb1ClU3hTmHqMWA13d6l+99VG5q1i+tpLOGUnP3nlAa0dRUqMawhjKIsR8edipr
X-Gm-Gg: Acq92OHUwcy9NbG4nzYNmC33jss8qMpdEADdL44L8Qi9cK6aYaVuV4Dakrfhs+NFxrZ
	g+erehPrz8KnsPmXMBTPO80d20DSnsineWalLliVIErBwuZVc986C5A9+1N47BQN74Di54lakVX
	LXbiReeJFoofqnpiCvGVbLLHa4XJlSd8oMTZcLjCGhGV9DsPDRtL/rgS2eBGOQgq74S39SMXgDL
	OPwUiHe9VGNOLsoBwiCBF9ercDGdCk+ms/XHGQHhpHaOk3t3Oy1KesVtCz3+k9XnGvA2I5U0FQt
	8NbaU1kuxpJqrFutvb+pszj8TW8CYZIL+H2EJ9ke97K4AxSODoEPOeuvX9nVdvOjEVxxLoxsvs5
	y8fIL0aBgFe7Wi9rOu56CZ8p5f3rQC6Z25m4uDtCty5uc8zGs+ESODQc+BMQ=
X-Received: by 2002:a05:6a20:3282:b0:3b4:6cae:4a51 with SMTP id adf61e73a8af0-3b4ccd60b95mr15783331637.11.1780902132544;
        Mon, 08 Jun 2026 00:02:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:3282:b0:3b4:6cae:4a51 with SMTP id adf61e73a8af0-3b4ccd60b95mr15783282637.11.1780902132028;
        Mon, 08 Jun 2026 00:02:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:02:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:31:43 +0530
Subject: [PATCH v4 2/2] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-display-v4-2-88a846afdd5d@oss.qualcomm.com>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=1072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
 b=ny50TIyWUidyGAoanv9GgdCfanSDF9NUNBpKf2lLq5HsfD74oor5jsEU2fR/ek82X97Y7wl5a
 pQpTBxFfCAWD6I+WS5VaSGpScGu+HZgiinG9WqdVvLOmKN6/XspjrnE
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfXwDW09V+oT9mz
 678Zi2n4xN9PfIeOq4Blv7GUvc9fFKgo7ts2ZhaBFY01qjNNB8KtMyIuMmrAaI1jYDCg0775rO0
 QwNx0u4p8hGtDM3BN/BRzhbC2GQYECu1ZqIcKwjxJm3y8LhPVzOk10D5cD24SdXRkEROkvxBdtF
 RKxv9AhbmU741B3Ax6u36O/ZI3DQ0haVJV7nu3yXGvNkn/aTOY/JQ2VELyY1kIN9ZhdXhzzheJL
 jY5QMRgwBHJjOFtB34J2hjHgsz6d7By6DT8h4aZ6ji1PnFVdrRk+sBT2aQoVw2/Lx+X5w8FcMJm
 +rwTdluiT/w2qtepzlKpaZuO1OPytN4aCIBkqlFdyA8DNmsPcEC8cE7WSyzNCwflKFoxQGoDScZ
 PClBp5fDEmUIsbCNlkqA6r1wJEcfkd/m2nRb1Q+sTKHNwNpm9i6YhKDwnD5zpzm27AeLdN3RSyr
 47QluzLmqkbYo4A/6Hg==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2668f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XuKMx7f3ltwE3Y0lsuMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: tY8hv9Lk2I9z5YpZqxXmXM4rE5TiAgE9
X-Proofpoint-GUID: tY8hv9Lk2I9z5YpZqxXmXM4rE5TiAgE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080062

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1

