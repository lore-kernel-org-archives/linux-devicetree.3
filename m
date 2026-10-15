Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2252FE39
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073644; cv=none; b=HIveERG189Dk9pswaAsoYlNVzx3qE1lb2ytLL5zSt7NSmyUy92j1kwLYSYXMIA5GOiJZd8n5gUKgQN0y4+U+SvJZCxiHKJy4ERlvVdiVbWb4Jku3GfACxX0wiRkoIZEZbltHQqGq4w85rqNcIpMj5GaNjh9U14Hmgqs390IA6As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073644; c=relaxed/simple;
	bh=GvoTZER1l4Zd2vB2uFIZBlq92s3/uzySsYs0js4SWZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmUEB8y0vsTnh7UPIbImgthV6sdM2RP8PSLG37W5pvEsSqJcospogtOHgE4HEiLvBzshNMZ9uqYuqPNBUcGUu5M8G/OTrkTHBBIgbzLTcZtxXx0ebjXptu4Mcds46xtktnyck/2qtsoh7nOhK46WOnn/kVVJqJQewbkNalTdAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQhAQMDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBxSzIPO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQhAQMDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBxSzIPO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jRFu2662624
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCejaq5TguSpjsNlo6mtc06Dw7iUiiBR5d6oZHI/vU4=; b=jQhAQMDPnIc9U232
	M8hZ+xRzGueVgsRIsWFb1V1JblW7GCesUJvW//+79dXi6L3Wi6XkVS28kFUbqj5Z
	vm81SwXU7zdNdk/uSr0ZEjowkoAOaKPDykMKWMgfCm3TNCoFCB0SWh3yr4XMpQ+C
	Oivy3Sk/R9KjJA5uYm+1pGh8dEPkMmPfO53+6Xr4ZGI/rTpwzXlqK/2P8+S9IlMT
	bm9pVMF1DmC0huN7f7N7yT9IvLXs+2eTQmPK2ceiYHFYHtnMC2NkrzjDMoMNuBEO
	Kyx9zF4kQL58MrrZYDjk0ea04IcSvini0mdPnNhXwFKK2bHu2rNCXVZCAbNHCKG6
	gtAHxA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda2eh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:14:01 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47cfa971c9eso35464fac.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073641; x=1792678441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCejaq5TguSpjsNlo6mtc06Dw7iUiiBR5d6oZHI/vU4=;
        b=RBxSzIPO7NpzskvDAYrvZ9aQv2orKQHPseKwjoe3VsmJaEh+cyc6ROMpHiKcyn7uGY
         C5nwoUsojZkBNmoKQtiOhY+1OhO3cnhprfBLm1j9z+cHzzzT7Tf5w0g3DQlcAGL7P/ob
         zKPLAV3BhZkz1bQ6vwhXvX3X3fkurc2yVhxrvBeraMWUXFV1PIgHghf6HCgKwxivNnWR
         W1bM3LHpvuAH3KNyZkOLvBkWFxVWcGpqTpl6rLbU7aPjIBGoGfmZHchZhfFhlAOQIMUk
         CT9gdbicTW9q0xtBGkWx3phCdvylvvie0gpDLp9WqZblueM7Evq9HcqOpTOErvc61LDU
         +ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073641; x=1792678441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCejaq5TguSpjsNlo6mtc06Dw7iUiiBR5d6oZHI/vU4=;
        b=u/IqpNlM1TtW+UwRO+HFnCJCTlCGLj8+38+FMHs2C4BEzWCHdm1ZRkNPU7BE5AKsHD
         40HD1K91RLUzXEkPbmmXL6Y/BoF0FSgAX7w0pZkhVyBHTXzYb4wt4JMjxpZVE1Gsg5G3
         EFVChOPCV0mJiz9PuSIdh4FweTgWoODBNDaLsxCQov1MlBl/Xq45GIyNWxIOjiq70RYM
         AE8GeWa8BkxgxucOyS5RRDZ6iM2g4eY2Xo93FuCF+6+/Dgt/NHOjL04ZzUNty7dZDcQ5
         zSF47Xd0UTX39U5pzwpvIEXw2EVqq9tYZqgBhcoZs3e1TMIIpivbU0DePdF1k8eN9Hmb
         KUXw==
X-Forwarded-Encrypted: i=1; AKwUvByePAfU+F295KMGmLKbN4PdZF7rDiA4TW0PRxWnIR9oOP/trDt7ayHu4lLucq8x6v6/N6SHho/lpPpq@vger.kernel.org
X-Gm-Message-State: AFq9FYIG0Dk0IXw4q44ikuaTNvGmIdb/Dse9C43r1vZsgMWmA9bRLGBg
	2ZzIfK1mTjSJH2VKrTV8dsVBncDNAYU8byMHV78LdtJNjCNL8+c5mP3a5PLGz46eJep84sXt1/H
	r5LjumHkW9tF0ExtIrENNOzdbM/+SFWno+oo/X+IRYtFFFDGzhzHzSvTS7F4daZbA
X-Gm-Gg: AYBFou2GZHaWBKRFYtyuklrn1DDaTc8cTkPZ6Pq+hLjWWrOMyWVuokMy4WVPYV6MYxo
	Ga2hGzRbQGf++3f6IPULqg5MBCHWMouF4nohJKWivpVDayMH3ht/tpPwabQmr/gTE0eaeAoELnS
	Zr3jzVcsxyfZXJBG3NjCtYJ5I35AjageU92x5751HooTwSi7CYbFUaNoxcMNfstIhY3czG3+g5i
	+6ALr69GJQoa9jTQBVHmSi4RmZ0wwYNPWO7/Yit2rqQ38m4k0Z/+KlQwQFA76c5UgVeTh2pB/u+
	INqiN6ToSNLnBn1PuLXLzDiYqkXjjXS5WzBhCYTGfrytMKbJ9tJ0cjt7c9S0Dbhe+Xh0fKcc7Or
	jOpO4AKlFIkD4dJ789pIHuNY5l6smeY2ph10=
X-Received: by 2002:a05:6820:200b:b0:6e1:d8af:6e85 with SMTP id 006d021491bc7-7010e6e74d0mr91911eaf.24.1792073641012;
        Thu, 15 Oct 2026 07:14:01 -0700 (PDT)
X-Received: by 2002:a05:6820:200b:b0:6e1:d8af:6e85 with SMTP id 006d021491bc7-7010e6e74d0mr91882eaf.24.1792073640553;
        Thu, 15 Oct 2026 07:14:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:13:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:43:10 +0530
Subject: [PATCH v1 2/4] ASoC: codecs: pm4125: Fix MBHC button threshold
 programming
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pm4125_mbhc_support-v1-2-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
In-Reply-To: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=1480;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=GvoTZER1l4Zd2vB2uFIZBlq92s3/uzySsYs0js4SWZ4=;
 b=SuwLyy31Tf4fhGFsknvrz5rr5JXNsmK/T6njdP3TaN5oZd7+GYaZz82n+A2sih9Xk43S7RJjx
 EEh4lSHhH58BfhxRVaOhVdb5KeS18ZgbphBvqrltWtyl5qaXVQcIE1/
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX02+gWu7rOCI6
 JJWt/I0EFaPQCn5Shd+iRgsdEDfyFlLqoGhxx51w6A7RA/PtE8X3LK+hyT04QJP96INN3xo9psv
 8/fjBy/4VukH9nGCp1mJkbztm9SCuYA=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0dfa9 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d5X6TG9WFUAVuZc9_kYA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: b4obfXH1pTVOMwjWgdwBOXnNzEgpz1WK
X-Proofpoint-ORIG-GUID: b4obfXH1pTVOMwjWgdwBOXnNzEgpz1WK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX1S9352YMPOen
 ysu+m9n/BgEsmpmI2qUUKnRLLP8SlGUjbJ9tpPXVgECxxJKaqjMvRE/30SJXOUkjUR9Ayt2iHjS
 EDyBpkYRcANLEzPvUH3Caw8DCQx5Ztik+o5fmEDet1Svz+xKG6debLypSA9kStotrDMOH1Qi9Mj
 8VdbrRG5HArHH4C8oAVMG++hFHvEG7XbitlDyDkAKxEU+yrMzN8NoivoUk+dk95UWQgTbuSZ+mn
 UMYiqVPLm3AiED7FDGgCJk1Dl03A8MEJnL5SK2MA8iqCJfRyJN7GNH+Pt9CUiNRg0052Ixh5Yc5
 Fy0K+FvrmJLk6PJu2DEZQUsSbKTPdr7l4aEGs9CqLDEvkA72RKFbGQ1rX5LFqP9tGxzp9QWykBt
 nopKGlkpZJytLAVe4h8q7DTm6abY2l9RWBkrsLd/ri+xkuwmxsvsVMWxOm4EPDRh9SwkQpBFvPe
 c2mf6LbuwMQSNfMjURw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

pm4125_mbhc_program_btn_thr() pre-shifts the computed threshold by two
bits before handing it to snd_soc_component_write_field(). That helper
already shifts the value by the number of trailing zeroes of the mask,
so with PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK being GENMASK(7, 2) the
value gets shifted twice.

The two most significant bits of the threshold are shifted out past the
mask and the remaining bits land four times too high, so every button
voltage is programmed wrong and button presses on a headset are either
missed or reported as the wrong button.

Pass the unshifted value and let the helper place it in the field.

Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pm4125.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 674a2fbc4..923318c78 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -981,7 +981,7 @@ static void pm4125_mbhc_program_btn_thr(struct snd_soc_component *component,
 	for (i = 0; i < num_btn; i++) {
 		vth = ((btn_high[i] * 2) / 25) & 0x3F;
 		snd_soc_component_write_field(component, PM4125_ANA_MBHC_BTN0_ZDET_VREF1 + i,
-					      PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK, vth << 2);
+					      PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK, vth);
 	}
 }
 

-- 
2.34.1

