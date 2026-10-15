Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F152F291
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073652; cv=none; b=RC4y+QUfBXoqW6Ec3ooTotrfmmMCwJZQ+TKyNv7JDFIES/A+tochyVa2rl69WaCqcEfx0ERguTavbmGYj9P9j/82El9DuPg5Dsnjf75DYkLFgYaytLfX4yBrv7Al/f+9/68gxZfEUFjqdIE07wZjiOaVOzTm0MiVm+J8iAU35Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073652; c=relaxed/simple;
	bh=7ABxntECG7NT779hQL1aoFYuMX7NmvO2shkDnYZLe0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cS8rzh3b6PJPkL23ap/t5nh5vYEuStFwI0Aews8nphV3xb9DR8xuXS9O7V7rv6/uBO1ncy86iLNnW/+PFmW1phFlv+GjzEGpFhEKv9s4ww1YqY2moKLwc5zkJVS9c+XG5mc7cHRJ5ReiB4a7xzQLnRrnx7yc8yWaQeWtUuq0j28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuVG6CNt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5gybcRF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuVG6CNt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5gybcRF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jeMD1955612
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AObEZGdXg5sS4kziMxlJgZbdtwqYN1gMq8xe9Kxgv3Y=; b=fuVG6CNtpVeDzjeC
	Jy1A+tltQ2v5RBjkr4NxiTQUWZfkJa/J/uUXKKcr7tnG09KPwvsQiq18L0FB3RQg
	65jqvdYfKNLwHqmbCBBgGAyKaFYPyPCVD4IsNgC0LXbX+wVFR8SMLquOJF4wGk91
	lk4g438cMElVcsRH7rkZ+yCdTjyNSy+rJxTK8dZ4vEZECApVpbKddyqCKiH3R0Gr
	kzoN+cwQFLH7F7OQcfgirYsLWQkEfIL4cFJbwSsfQMCETHemZP85R6x/FU58B1X5
	11B2dTZRb1KQt6SgEzSZqc0EIm6Z8S5LIcSxqRk9+bOuiH/wJ1WFyxTAIwwsyWRR
	EMxBXA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeu9t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:14:10 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6f4d828b9eeso4054241eaf.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073648; x=1792678448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AObEZGdXg5sS4kziMxlJgZbdtwqYN1gMq8xe9Kxgv3Y=;
        b=L5gybcRFqxP9oEbASXdGB64L0EuL9xqVF/430r07hNXQRuUT805Aojd3wz0v+wnaEG
         sRWxfpiBBxdTNibZJrq+9HK+cp6hfxx9xMffZSELw+ALy9lHG5CF6j8tkRmI624LlvO1
         cbhZCdPjaFWRGjZM3wjFZgvPQD5rQmWBeLI2ridLShRMIoWrL0JZOTmFOHhPoplN75pa
         1S/PhxctYK+Z0nZlMsYkXBMcz+KzFVvHjWq+Dy/l8f+93jfbuBkgiMHVvmpKyfKVcwu6
         A3BFgF7iUnQOadv5r+7v6qhjwTyg58oDJ8GqiZ0sRBDh9h9cfHNQ5uZTh92Yed8GojfA
         zu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073648; x=1792678448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AObEZGdXg5sS4kziMxlJgZbdtwqYN1gMq8xe9Kxgv3Y=;
        b=vsoox91mFq8UCl1EW5BdlmHbrzvgVRcyg0Qq0/lhc7gmrLK3CeuJ17d0Fat6A3eAHf
         PvbxKCjGGW3NLfIRZNysgeHVuzjwZ64cdNTywGhejtOrq+An1gtql0lJfedsLlEbkjev
         bwDrnI070MiFSTwRXzmxGF2uLHL+njOyYV/4LDkUaTfsVnjzJYLQdP4TkTEsr3h4q5/v
         BctX+1kcBSz4izvYStZGLRAW4ghJVDX//GaFLGf7OtSYBSdeKX3V4WKCAXwQnRqnA71O
         25sFRyZRIYD64LmugLRwoeBQbLujCeqzel7urLZ9my4bytU3sdLcMGE+bfKEFdJAC1VE
         HjWw==
X-Forwarded-Encrypted: i=1; AKwUvBxkgsdgjDMdul7IEBLUrP/VJfqoyH8mbywoEiuD5nFBGECmDYxgEjD2scG6MUBFPpXXnb7RfYUeJ+6V@vger.kernel.org
X-Gm-Message-State: AFq9FYKB8PwXeIv4xJ8bs1PANR3Agceg2AcVGSVu9PYySjfOwF4ZwIDF
	+1mYTsaldjNOpejXnLJRgys1kChg27oa2FNFUZkbkkAk3pccnbN28LQnxxvhLkMuVslVZKEq3Vb
	U0va/qmgtHCWLb8ga7gOQpArUGHL0oc40WbwyZc02QBQd0UiDhoBm1RRiXJGqUNpD
X-Gm-Gg: AYBFou0YwDtK+/QCaiuvgzT4p/t8URByYmby+WADCimz13GBeHMbv1BUgxjG+cqJo90
	4uu1ClvPfeA8qa+aXiCiBF7aEfTE3d8X0k5wbu6LNg94b/Opi7kmW0d1x/EPUIKYoCcSJcuThH7
	sXmxdcP9h9+fzFLfXU2p9pmXZh3QZsAhuB+N10zxb7NskaEth2ruzLyYMpONOJWMud77BDGQhCm
	jgZiyJeUcFIRfpeuPDJDR0VuSph0n3aWlDpNn4CFcAjR0DkJ1Iz5NddkOql7OGzHRKbREDVvhmR
	7ajK0YTDHMLsiit+2cNVtKz9NMMgG47hExBRioCR7V/TfNUxxLGJ5eWqUmPZC8Be3uN8NaOH+dn
	6p5IhFkgGyrJTCSiAQD1cIm9bwGaFnjGMy5Q=
X-Received: by 2002:a05:6820:625:b0:6f6:b13f:5d20 with SMTP id 006d021491bc7-6f6b13f60d7mr7841865eaf.23.1792073647644;
        Thu, 15 Oct 2026 07:14:07 -0700 (PDT)
X-Received: by 2002:a05:6820:625:b0:6f6:b13f:5d20 with SMTP id 006d021491bc7-6f6b13f60d7mr7841843eaf.23.1792073647119;
        Thu, 15 Oct 2026 07:14:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:14:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:43:11 +0530
Subject: [PATCH v1 3/4] ASoC: codecs: pm4125: Keep the micbias reference
 count balanced
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=2940;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=7ABxntECG7NT779hQL1aoFYuMX7NmvO2shkDnYZLe0U=;
 b=dsIGx5n/RBHXvfyT99BuqfU0aQTpwd447tfJBU06n8FLUdS9pUoxzu6bEsoW1koHRb3vQwZ9U
 5WWC3ngYO4EBXGu37yz5k38PFjj28Z4OeXOEqXn6+Rwo+nYpByv/S2S
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0dfb2 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=a79-ETRTX09cNbBUWbcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: u01YdBcvvOG5il-pFgDt_5GmVKDFpBvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfXxE5PIorW/uRs
 plEodXPUqY02KqhtttPT2WlqRRB1+N4G9ZwjGYH81Ndf7OFgIf1J6XJK6XgxbviGGaM232RY/Q3
 urZaWIVHXyAby8TILHtZL/vr69nJgFaWkdAUD7w5fSaUTdfXt7UjlE93I3NVfTm9s/mGAzcLm+F
 L3XwyEOtwQRXTAgyXzB8iOsTq3SbT15x7YUkUZZ/5d6IEwwq1UClsuBFCBW1j7LxzoPrWcb2ViA
 Ddz8bccz2TMz7HkuFt2qcKd1Q0/8khrdGs+mqK2xXpHn9cb4a+VLs9xyCu2Zry8BPhOPuQ6Uvkh
 /b5AH0H7LNrLHJqKj9c1d3hVCMRy3nmwN+3ChLrctQeO2hv7sgdibgoM+VBEp5CALJnrtlaXPvK
 9gta+Vj5HUZMrRksRE/hhHlPToUf33UgzyG9CND4jN//rJ5o0oK15t6/aB9emHMmiFQJR9qv0tV
 S3Uhn+J15qjrO+lbzWw==
X-Proofpoint-GUID: u01YdBcvvOG5il-pFgDt_5GmVKDFpBvk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX+1LFou51Vkl/
 J4KqmBOWuFwL3mK+r5zSjFUAtP3n6hAHIdZ4kuE13Viy+dFHmHPa8YjXlR8icHW2OjVSEg6aHgL
 MC9JbYkYzvYOxWAPgmNl3DSVBpmBGr4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150056

The analog master bias is shared between the microphone bias supplies
and the playback and capture paths, so pm4125_global_mbias_enable() and
pm4125_global_mbias_disable() reference count it and only touch
PM4125_ANA_MBIAS_EN for the first user and the last one.

MICB_DISABLE clamps the per-supply reference count at zero but then
evaluates the enable and pull-up counts regardless, so a release that
has no matching request still reaches pm4125_global_mbias_disable() and
drops a reference it never took. The MBHC framework issues exactly such
a release: it takes MIC_BIAS_2 once when it starts detecting a plug
type and releases it both at the end of the correction work and again
from wcd_micbias_disable(). Inserting a jack while a stream is running
therefore switches the analog master bias off underneath it, leaving
the path up but silent, and it stays silent until another stream takes
the first reference again.

Return early when there is nothing to release, so the hardware is only
touched for a request that was actually made.

While at it, use atomic_dec_if_positive() for the global count.
atomic_dec_and_test() lets it go negative, and once it is negative the
next enable increments it to zero instead of one and never re-arms the
bias at all.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pm4125.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 923318c78..2100f4e36 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -229,7 +229,7 @@ static int pm4125_global_mbias_disable(struct snd_soc_component *component)
 {
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
 
-	if (atomic_dec_and_test(&pm4125->gloal_mbias_cnt)) {
+	if (atomic_dec_if_positive(&pm4125->gloal_mbias_cnt) == 0) {
 
 		snd_soc_component_write_field(component, PM4125_ANA_MBIAS_EN,
 					      PM4125_ANA_MBIAS_EN_V2I_MASK,
@@ -772,8 +772,18 @@ static int pm4125_micbias_control(struct snd_soc_component *component, int micb_
 		}
 		break;
 	case MICB_DISABLE:
-		if (pm4125->micb_ref[micb_index] > 0)
-			pm4125->micb_ref[micb_index]--;
+		/*
+		 * Ignore a release that has no matching request. The MBHC
+		 * framework releases MIC_BIAS_2 once when the plug type
+		 * correction work ends and again when it turns the bias off,
+		 * and honouring the second one would drop a reference on the
+		 * shared global mbias that was never taken, switching the
+		 * analog master bias off under an active stream.
+		 */
+		if (!pm4125->micb_ref[micb_index])
+			break;
+
+		pm4125->micb_ref[micb_index]--;
 		if ((pm4125->micb_ref[micb_index] == 0) &&
 		    (pm4125->pullup_ref[micb_index] > 0)) {
 			snd_soc_component_update_bits(component, micb_reg,

-- 
2.34.1

