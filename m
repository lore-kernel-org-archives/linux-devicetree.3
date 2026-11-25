Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627130;
	b=1Qv2yp9Z/zGrBZaI46rddfoQeJvOrXunon7Qml/C567IrJMWrASLYeTThev0M6lYFsEE
	 73+OhJnPOSsZHTEhiQ6KQp5TP5QoNAIFJjdOUlxdiamYZ9YxHCuo1ESvcnNrmr0UCtoba
	 DdDeJ0kMpY0Fqw8E4FAAbAvmqMvpyax2v2bOcuFCWeVF0VDzlzUwSOclqY8jfhXNGBMKj
	 VJiiFV3ANWU3HrKJ6pOmAmSu15Q5ev7WOZjFe8Nh1shU04Nm8PjmKJIKF5huZChRSi8ay
	 jL1B+LMS3jytOWLd91DxvAsxAi0iT48Kq9VduS2BH4nQWqg0IcFE012VgzO/nCk8pyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
	b=ogck7vzWQx7zD1e1P9jE+FkiIlxx/hkXp8oNU36zmKHXT/sC2shVQP2QbZ0D6licapcH
	 lHYixbPsF6J/31MyGOZC6T3ZUL79uq0rXPNnIj9fY5MPtVxPMBFn6QUHGBbKiPCcSqHt8
	 UAjJAKSMj9BVRxG7Ok+xrBGIT8n7zrk3K/8dLCWxUezW+oymSt20Zr3+tm78jcDQYqnLE
	 FJ6W+ftimws9ufT9p6Gla4BwFdWF7S6tqYXc176frSBsHrGo0Wfeqpol03k8Eigdt2Jwd
	 3FvLbhqgAy03z1kirXZwovl+8OvsG3r6VcjJ1PzKmvsVnW+RHoO27AycyPtV3J/vhyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07BA606A333
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07BA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQes9818698
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jaDldssiLH8
	yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=; b=h63YnrRUqhEJZoKuXYZ3r5Bxath
	h3/Fq8hWcUGRv1f7STKGPr1C3+acLo48wxLfgYbp/4MNbEMeS4GzCY4JXhG7RtV4
	SfhSN2EhxJ52dcE9xrXVMlASOPBFBUOs9GEuSeLiRxq+4pwUQESSPk6dFgQpxsuy
	Mo7zrRtdurFKjh5YYVVnYrhqsYDSEIxLY8sIMnA5XF3h2x23iMADbPyH0VtDZzFV
	w0HHPeaEX1tqK3E6Q0PRA1rVYd1gy4y6wIHbp0wD6G8dxU7nPgR1PLKwuB9x9EmB
	pq1J56cpnnVT0hS2cxRIYp4xQhRnq9pT16ieLCXq974z/J7uSZX8tg0LeBA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuht1gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:47 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4d9d2e261so91386167b3.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627127; x=1796231927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=PbRmn1os8HBDadEK1RWhU29c1VOgNVcrsrOSBGWhJklsnfUz253XCJ+YkvMbuYgeuE
         e0ZkwJn7h831ffM84BklshjenUta243oXDbZm19kFaGykc9gaU3Pd4vbsBSLkq0qn7Zu
         zr4eKvqnYvioVql9tHEV1IeALA4ykI2d94hS1LUUlJmG45+jz7gpVPHN0A2tK587ONeS
         5rUNWl2FjCQWRliZp+mC4ia/JOfW2K67VX2U2768Ncfx2I6+oTJ5wMjbYkwcLBJydoT3
         jRPCHENwEei5z+VtLFpv9rYhO957pU5leqO+a5EApjIg3klkOYVhhvcW4PByJ0urFOul
         kPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627127; x=1796231927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=xqWKfokK5Ms6zrRa22uqWVi5piBGIjaZBcYCBDFGsBXWhHDjVQYU9Oc4DYN6evydiZ
         d8VC4pKZhOFLhFxsyctdeFr8RjpRLGRWJGGKphlbP5YnUhZawgD6G03zKTqugj8w7XJa
         Md5Kc/v+NS+L4Bxl0YGUn7HKyG8nVZQHfDVuvPAan5OLyaUnM8GePiCtIaqvlbDk5IWx
         TuDlXleeStSmrMVLVW54sl0sjy6dJLB9O+vII8M5IlK5gJGmaOo5Q2q2DVHuQh8Pxy7z
         U1ya2zwmb7Rop11ickuItLTGICD89Csy1zRPU0Fz+G55Pp3OFGuO0fZccwM5tMWrcwMH
         fyOQ==
X-Forwarded-Encrypted: i=1; AL+hErHJzVgvvyb1ROvpIwOpYboFaXRwsTxd9qAHvFLn6T2KPfHSeY7tzCZyU0O55uvIqv8akjb6LAdq2S+u@vger.kernel.org
X-Gm-Message-State: APuU4Z82krfBzqYINRJGo0Y+PraXx8uWvf1qnROSD/UbdwZVR6B5r9/V
	G2s0zTpV41H90TFDpRCnmPHeWGwgsy+eNfpgVza21uSP8qNm9VQJZ0s96cFDPCAQ2ggXm9VBh9w
	rNbdmfdljmX9x+nDUBtY+smVBd+P9uxnH6Xf+Y9N28VeOKsyqnfmigDVv6vDIlBql
X-Gm-Gg: AZFdTZeXD9AoXwVGsYqk0TmLmJbnMDRZ6d1fgpLWw9TbueCnXqTrN+zy6VoQZoWqkej
	Y0kB5PZsVLWt/ah7WlxVRQyFwobAVNDQxuG/NQI8Uwm4uW9ZwbMqpZdFMyEYLSe/u9kbFki9UH3
	jvCR+xPsaFw/qjFaA6jCHyp0eHFODCAPIwy46adeiDfWzHF+iZte7egcXYBejSv/eyrE6xY45Dn
	Bn90j/KQNyWuYC4EAPYaQFgEzpW/ZfxlGrX7356OUULh9GsJbDImlDPAcuCMGt10Mlexl4BzFZQ
	xCqHi8WMdS2vPoSeVulkzaDwPTSSCIYTdKGf02QAIZyeFnCPxyskZ8qVdiNPbN56E+JVU3lct68
	9+Tr1CnzFhEOoGkRCpyYDczw+CtIPT0WECoM0vAdpK80tRHtFxOIzTq3L9DeQi+A9
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58945147b3.87.1795627127336;
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58944987b3.87.1795627126791;
        Wed, 25 Nov 2026 09:18:46 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
Date: Wed, 25 Nov 2026 17:18:30 +0000
Message-ID: <20261125171831.1458954-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b071877 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OjCvDKFjsN1F9Zy31NAA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: QpEXzsvZfY6vXpfwNiMgHIVyyplyVqE7
X-Proofpoint-ORIG-GUID: QpEXzsvZfY6vXpfwNiMgHIVyyplyVqE7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXya8HNZniCi1j
 E7JYm0vrOP9CUdkLtot3GiDskzOjoRR34KagZd/rEd9rwokfsVVPYcKC6RJaYDx5P1/ufzMDw3N
 uAHh8Fcz9WLF7CyTXepVAf8vt9e0sfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXxiSck/FsRO6L
 nTJRaqNLF4CjqhjAhfQirk4TxrzKqPuytvJTLKZEBd5aooapJIgxAT7Y+Gza/UWfMK3pGF82Ti7
 xk15E0Y+jlYERFofxGAHXxDLYNZZTmUD08SuRkFdrOhODV3IHa3fuVaMQJtphakvU6geSXe4YGV
 EdrlI7eWmOEL6N8680moaQNNTXyBWMg3k2CKEs0Xr3GaAtPXW1rQkoBxK91xS0ZVl/yPlZs6IdT
 CxBxRcs85Yro0hdZDk64tJBDR+AdfX+4TldTDF/ihq4/XZCAZS2XX+m1qdMmu7ogvPHg2b9CDti
 hhO4akIATF7nfqk4yVtYm6ELKFlAgRJrHkT4Av/E2i+/YRZ0h9opDn1YWi5LfgI1CjPatceWqUz
 30LShTP2lYrACEjM738B3B35XIUqoWbfTKS5naQNF7WTaQPuXdu3VenYWhVjH8LM04Y47/Dnn0u
 eQSf5j6DIXTNu4opuHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

LPASS_CODEC_VERSION_2_9 is reported by va-macro on Glymur-class SoCs,
but the rx-macro probe path, component probe and read-write register
check still fall through to the "Unsupported Codec version" default
arm. Version 2.9 is register-layout compatible with 2.8 (and the rest
of the 2.5 family), so add it to the same switch arms.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index eadd52ea2630..94a272916ece 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1659,6 +1659,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -3698,6 +3699,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3883,6 +3885,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
-- 
2.53.0

