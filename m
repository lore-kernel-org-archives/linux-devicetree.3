Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364096;
	b=cLAnjDp34gzA/ohcVJX/YFpc3eKet3jOQH4Z3qnRegFBPQj5to7FjlkwxXt3ZSNf5H8u
	 CQRoz/xfYU+X3woVkuk0pxQn79wtBazOBa0Ml5TMy7hE/fmG0OpmlxiUgDFeEV0TBMTB4
	 6WJL4nZD8F2odEEa9yPMxBtpoxyP9L4lH1+eYmcS/8CkCWlmDxufYmdPeDFUQnlrEMCum
	 RgtwcTG6fQp7CotjPaVufWW0Qs7EJYLHdVhWZp+UPWU8Po/jfxH8GGnkg7nbK37nqVDgn
	 O6W5uMxwtAzEvVafc4Lkxrnr20pOSOSSQvc32/gBPaE10rsFyXPWIWZCr94JgQxd+8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
	b=MtBwjtv3feFgLpPWLJ0PwxXrFjz+2CkN8ui4Q7YaXyCh9kl+FeRB5GmysTbagJXB02Jh
	 5ay0cY2WkrCfjKYLVIJM1sZEoYABt+5ZlnFYLSHimEh4TPfOtcOroVqYTJqDppYZ7pEnK
	 YGldMhUia/tv4DDkb+wr/cHPwXUjQmoySRY9OZ3ghn4GftdTpvDX+KX3it1N14NYLwIMD
	 pW+Y7Ljuy/2XQpbxOf6mC1+qjG3V8P9jeo2DGyPWGY4mASYv6PZnOvb3e/BldYvA1NE1J
	 /SLMHDKRYXdv3Ghnm3IBa30l8Eg6r91YU7HHWoE4OSdMN3SvOvvsX65iN6L56k2WVQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE5606A6AF
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CE5606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQvQL3853472
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZNFp9/0dkT
	sTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=; b=EQRtFRUA42GVrHwo0ldgQX4I3GA
	PAZx8Os3MMJfGEcsywP+egPL4DbHxJYUAmZgcDzK7sWLMMPnbJEG542RgH5Tw54z
	NAlON/htb8L4E1TF+hopzK9kjf2wBDjsetwXs7DkRN4KytENZf80qNO6cl0mFC26
	Ohao35go4UajhGtLaPIKj/se7cSCncqrizmjy8agWQqBcCWypUMFvybR355Jl+C+
	xqv9yOUTjGTQQDaEDHZvKz/GXxR15WM+31vlZUHh+mzMkuoNB+Pj8iaXjz/9YM+T
	rMjx9y8Rx4X/i6xltwPZ1HLlqYuvhctKkL4fkMf5pLcrfe7pN+sPHDI+IVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3qyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so427894185a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364094; x=1795968894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=QGv1bW25xC33LD76O50/YzWSkmxkQd/HhumnuKIFW67bE+j6l5+v6Qo7jOJc246tAf
         7nYLzkFdI8h2nNwUoThw1wyYziVnHQY56OSkjFBtEWZnb50ALHXOZM8VFxE0vkcm6Ap0
         trCbOjf9rRmL8GlyjvPd6JVeznMXxbrPDIQavEkftn/RHg3N1IWvHqCEz0sfzT1UOrRu
         Sdvlz1KhZImwgjvHmmx2sJx2u+0WKKC2L/QoQDWmW5kYfJgh/dpaHH+LPWIjLe0JrKnI
         jF12kfiDjbRE54kXIrqSbbcZLRTawbslKcf6/7+agYeqfLKcjRBCo+43wpPOJnj5VjM8
         FHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364094; x=1795968894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=WpQXyQZ4uOnLHN9kmoZGQNLZRM304qwnYFf4VRjovIriPpKfUoZfAdL3ddraW3AjD1
         vCXey8iD+d4ddiE+NM6zaWIpJzKMAjVrxuSUkkTgyfKs8tAu879kzgYf4ML6Y7Z20YTd
         75YVNhm5l8lZ8d1dE5ChHxI/ki9r071yPSCuSoAXJ2s5uI7J4PuznZHpWO/PvRsPCWLX
         XkiTjN+aG7ZZ5KHPqHYYc/lsFH/v5W3B/WtqEgXIggIl++bCcSnY1WLk8V1BZ5yU5h2+
         vnMLaueS8wgApvdaFE3dATQjhHudXJVzGFhHlHKP14+obrWNOcaRtyseCPPRABKqqGIF
         Gynw==
X-Forwarded-Encrypted: i=1; AL+hErE/cKRStbxEMW0sQ4PPMwwzdSdl9DSm+FemWjv5YXjayeFRML1+xLrrzMfgThZdUP0bPEj1TBBooFuj@vger.kernel.org
X-Gm-Message-State: APuU4Z9oDk4CU78I0Z2nnwGWUPZZe3RqDFJHrsXVbaSgoI690kGKxdgY
	54+tJx9lD1zjW0ySKT+0kJZ437YzklBDUvkieWzLsv5NlvDtGxTHBbwalmt8/dfgnBnV59oYC/T
	ZtJSafjSaluYhPs/5g/SBQ9dsTymLGqf4sT621WkoB9oITgAHeVJ/JkTTOJIuzgr/
X-Gm-Gg: AZFdTZeDgsZdLNHuY4hoVwSLxwOP5fMi3WP/OsjwDUrX0rl5Yz6vyVFP+HA79ZTTAR0
	vvQFAXkzpnCn3wmijPk9v6bHGZevzUBoMTFuDJ3/P1lKnomWq6NDNPo8tVcQ03OqTFlvkkkDy9b
	q2iyGkUA6Ybn12m02b3qWGDmtl6S841Y+5QKVwLFk0WsMsbMB2NQMAOg8N4qdFzcQXEuQ0Abqd3
	kra4K6iL/RMuSAcFuAAtig/hMIvO2B0Kcc9afb16b3k+0OAiENBOl0r/m3v/4wFnpZS51A3+tey
	YeKa66ZsOYlTM8BuztFLNNKtQZKVfYk7Be5uzX8WEno62OzIbL0mnsNo9fECfsqvjWvM9QwjPf5
	LxAJq43r7bmiREaC9OR0Q0OpF4C+Exg0UZ9B8e7877WETxdb5EOluSOH/IHPCnrmX
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412218785a.0.1795364094265;
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412216185a.0.1795364093887;
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 03/24] ASoC: soc-dai: export snd_soc_dai_stream_valid
Date: Sun, 22 Nov 2026 16:14:16 +0000
Message-ID: <20261122161437.5994-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: I4iQ-2eRVOQ9QKO1NwSe0N0jLHxJHyWO
X-Proofpoint-ORIG-GUID: I4iQ-2eRVOQ9QKO1NwSe0N0jLHxJHyWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxq7NvQh1ISOk
 h7nSHqerIfbDYlh1inKFRX95HR7RQ8FuhIvhlJxdWXMP28rioWDx72oL/poqtwR3L41u+adMe8t
 hTaB9JDpKki0Vm0/zbRCFL/Q3gyQPXxAlvUzjIgaQOtNKsViEiy8WQRckxIOSI4Z9VHTKRpYerp
 5pJaKFLk784Pqg3MJye8FlioPavP1/KazlOrX1U2kBACu5Y5rDO91TVRS+hJZ45F0hAZLx5D+PY
 RK4KVjB3nHdtjepFaiJQyhUJyAUUECHyh52+iIyPV+kC4BvGu7VkrUbZRWUcl6hAE8tIpI7pKCV
 MNqSmYgO85Gs3TM9/Rp1b1AgJ0ktyycQ9Hq8Xwvj8851hWTcluOS3X0ttro2jXl+f6YU8MSx0tc
 99UiF+WJqfQw+CNvo4jwqtwB7f7HEvd8+sr67+P+8JH3gpFoGeQ0KyuuNxOVTeSQIyVQqQ/8+kC
 Kz70rpUlfKcQa4n0d7A==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b0314fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=cE0UM4t--Vybx2cbpv4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX+rJgnKkFyDwr
 5yJIyE837rI4HsiZC+cqpvw2UDTmDzdvAFer6ebtQa4ON4QkgQuXlAbHR2HqDmDLnbAB1xh0Zvd
 VcBcP479KQe+kFJCYGpUHYf0V7gjK8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Modular users outside soc-core need this helper to filter DAIs by
direction (e.g. the qcom SoundWire machine driver, which iterates
codec DAIs on a multi_direction_codecs BE link to handle each
direction's stream runtime). Export it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e34f34eac3d..5d6385b02719 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -706,6 +706,7 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_valid);
 
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action)
 {
-- 
2.53.0

