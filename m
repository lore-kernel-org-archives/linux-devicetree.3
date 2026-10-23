Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775901;
	b=fpYoTq3qp4q2kM+BGTXh+dSduaIwkc//KRRSiNnnLPC688nXia35mUShnJq3bETMd7Uy
	 q/GBUzLCxPH+Lp0hpiGFwuy6I9Bdw5rnPkk9FryAg+XmUEj9TGPrZ7g/kafEq4eI17iMx
	 SOHe4aYa19L3O+tEbdy3gLgbMvELmQH0a87GEQEWBG6yTQb+hdrmuFzpJENPY0+BLXQpI
	 LM+dFsL/UJkXfHpACkGVhx/ZWpdq+BWKc7ACrcYskczsxKY8Bg5DxsCffcaedfemOBDoY
	 QbKBvbEiWC9dXh4wf+cz5IDrQp4jWeMKnDzeYWmf8ayvfYkFDhc0L5Sa2XvhLsfEazQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aiE25iL3B+65SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=;
	b=wwHoizYWkrC2L00/5jIeB1gu+D8gqf8up1rVXBz8VeacpvQlVqwG4egXpMZoDNnpDO56
	 ryNQqsILZVWCiBqoNcYVV+iCF6ogUQwHRXWmStMJMcG2IfwLNhheRpq7T3WSglXvz5jkb
	 YkC/m8Xnce+x7JAThzLjbplEAmnRjpRGM1+NxB0tdvxJT3IraJTzhd8YQwcj0DCeGO78n
	 Vf3JeIYbBlK1jgqQiErQwSW8FPpZvZG7xSpZ4N/oJwQP6Dp0vSXps8CEGXRl8hJt9Lg5n
	 kQ8nikVbfled2xLkcJMBr5G4u3szAKwRpd/YBcUeXTrgtb1QirLIHn1eSz4JPa3uCmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaBmXa2s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8bl43yd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52E606AA0E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A52E606AA0E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaBmXa2s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8bl43yd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wPC4063428
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiE25iL3B+6
	5SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=; b=NaBmXa2s4ch+qTy97qX3AVx1sOv
	UynuJEo5HimTfOWQUOfQ8TT4CVy4qrU7zsf+GRvXhTyoVbB95mgNqhgPgQPPctI/
	zX/S3ZDpJoKbjBHIzjOt1xo1g9PIHoTrS4vyRQy81rHwZFKrhUQvWoxLkXhrIfm7
	/fFLLVkO2nwzSxFs0xHPOsX7H8NVSP2f1AWUN/ByVJ90pQccShkuM+qIeQ2nfXWV
	ACE33ZNSodwqn+U8CjB4a/VWYmPzlMrQmAu4fCtAG67yItFiNjLIEz8xS/u29H/I
	n+O9xCSoWTfJxPEhjWT/Hu8RZMmZ8TP0fSp2Y1/0k86PRi78CzbX2IXbZzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcrby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so323685785a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775899; x=1793380699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiE25iL3B+65SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=;
        b=P8bl43yd8bl5isBmb8macYT/up9BbnXv8DOrQp5MVwSeNxZQjz9w5/O/tOPZLo8FsC
         bT5yKeFGP3gpxFj+ZLa0CoNXNeCwMEG272JsAgcJBHm1OT3m7Qva7+P8xa5L3JdUgvLm
         XW6+/rbdykCkSepNbRBWPrzCLG0gp9hg5Xp8272aK1wGO7G+niSyNuwu/FeHvfO9pITT
         /chwqWgywlW1ZzzktjhdKclUv3vmt79AqAmbw0xOpqaZwjRwQRGRfX0+4VEhdG5lOn1o
         hHbrRP57SGwpGcEoeepzOl1GlUuaBhl6BYG1WR77A6TJZuGVGiCgGF1HIzevoMYX1PiR
         Tg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775899; x=1793380699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aiE25iL3B+65SjWf+5TW4LHVEE7rNgWhZPR7uU9yH0k=;
        b=WGeX0XQa0rYWqKxf9cKmRy6G04NMWFzZ4qQLpL9ToIXKJnu+3HhYOM/rv4Hgu56SSp
         QFNOsV4gi9QJbkj5zksGcDFJ4wFT79+Gf0plBpCj6gPnkIt+pByHzRVVpDzjXKYdB8dj
         iWvo2TXUJQ21miB9aDDAUr2R9lB3jP14ZuNfj2Gyw+1KLaoRE9ehwWBNMdRxegpb7kEA
         mYuAbE0g8AAiZ5rK6Ib0OOzM6RC2j45ReiZp5Ok9dU2akRh360E6pv77qZRh8kc2YpOo
         TFhw01muq1QKBQKl5nNBWHlpkS+ejfTMY2/agCsw9+9MXrF8q9+Q1kq+vGjDZlfLqKjH
         ByIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGDir8zXLOUXVDb7ZHmA0SQstLgH9F5SgpdoEBzzF82D5PLo3YzaQ6cpMqq1cDdcnmAWB1qOSD9W2+@vger.kernel.org
X-Gm-Message-State: AFq9FYIMU4jzHwdnUgwgSXMhDHePCcmFIp7nB5mJ5WmlF9XjSEmQuK+2
	b4rmJJ6/0UMXQTti9+6/tkVTYHbhsXPN35kQcZD+v7sHX/hllk2crkAH8xYWVpJpD+JSPDnzXBY
	gt+Hgmh/hYUuTb0DFh6Jf/pBfRADoLvJxP13kSiEk30E/ru058WDjHyybQHaAEhhW
X-Gm-Gg: AYBFou1MOsAdRv0xLoRMrgQ5YRzHSYLT2xnquvbvfXO3IKLhddS5SWI/79ZiMPNKkm4
	h1bvdUDKatAe0MKg9KbHJQFK9ks0BdgH+3xvwii+xdRFrJAHl8d1+PfiUXGWtUxyEOzlTILlGYl
	E6mavKVNNxGcHKiGnNQKvhA40W1NOp6qx6792Rc+T/UyvOoMkzg2++Yk8GwmKhdQVOb8LuVjPPX
	p0CPObmEsNbXoTMLb8w1hvmCla/Tmz3aYpullNzJlVbLkHeUAafmGeHXQ5z/Af3qaCI0v1L5qMn
	Pag243/Ve8Rn60HlAtNnu5TWnkUDdgxiS9qTFOr9gO7jAIGdxn+eRKJ3NnCMXToiE4v/GOfegXv
	vyFORgLiogjxT
X-Received: by 2002:a05:620a:4707:b0:93c:c405:3215 with SMTP id af79cd13be357-93f6f966388mr536169385a.44.1792775898662;
        Fri, 23 Oct 2026 10:18:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:93c:c405:3215 with SMTP id af79cd13be357-93f6f966388mr536163785a.44.1792775898114;
        Fri, 23 Oct 2026 10:18:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 17/23] ASoC: qcom: audioreach: add live speaker temperature (T0) readback
Date: Fri, 23 Oct 2026 18:14:27 +0100
Message-ID: <20261023171433.820092-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: Z2PjHDo-mDGxVeRGqVuA-r8FeLEmxznV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX++KUfm1mGFeq
 gKZ0PKvoycUxJutvfSrLsMFabF3LEfya+HW13Id8P6WB5I2J51t+418sHl6Pv2svOkrLp4rmx2N
 AN6hgSiBKAUSli1zCFR/6Vzwr7qS3aU=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb96db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jt9GbcDmORiCJNAdx5sA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4dvQDUapG+rg
 32Teqvb8G9zaZIxaKspedVXoKfXoIZ4FrtmRRH3uoKmUJpFG3gzo8j42G95POl4JWw0iG/Cv7ai
 oWcZ1bIEaW0tMdRtBYJ0l5FARf7/+4jT86FjI7O+P+CdGNm/5vNE9zntSE3ObrHyJ8eH65WPih/
 aUY7xiTlykooZBqtV8x8iLqGz4tePawSqR/TDm24/6OAwzJUL0dF/nfnNKprU0Z9aw/6eL3r7TU
 0QBt131rLnTmKyluWl3Eikso3nELQpeXHW6EQ3/Rvu1bk1lZDG8vzoIBz4ukTkHJjq5/gKPqfkP
 y7WzfTsymMim2yqKXEJsTO/x6QXBKqS+hJArnlz3AEIaQdFx9I03K6ZJ4QiRUMZRgLxm45XMYEO
 uTKwsAlXDv9Je9lOp1fmmo4m6xDDl8NhNH2WUWK9X3mYsl39+5XNjKmS8PEtUtBcqKtLJpDFIkD
 /bQLjW4m9nqj5p44HPw==
X-Proofpoint-ORIG-GUID: Z2PjHDo-mDGxVeRGqVuA-r8FeLEmxznV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

A calibration needs each speaker's die temperature when R0 is measured,
so that the R0/T0 pair given back to the DSP is consistent.

Let the machine driver register the speakers' thermal zones in VI
channel order with audioreach_sp_register_speaker_map(), and expose
their temperatures in Q6 format as a read-only "Speaker Protection T0"
control. Record T0 with R0 when a calibration completes. A slot that
cannot be read reports 0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 65 ++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  5 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  7 ++++
 sound/soc/qcom/qdsp6/topology.c   | 41 +++++++++++++++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d027c763eb25..f05033cc3f7d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -5,6 +5,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
+#include <linux/thermal.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <sound/pcm.h>
@@ -41,6 +42,13 @@ struct sp_vi_r0t0_cfg {
 static struct sp_vi_r0t0_cfg sp_vi_r0t0_cfg;
 static DEFINE_MUTEX(sp_vi_r0t0_cfg_lock);
 
+/* Speakers' thermal zones in VI channel order, set by the machine driver */
+static struct {
+	struct thermal_zone_device	*tz[MAX_SP_VI_SPEAKERS];
+	unsigned int			 num;
+} sp_speaker_map;
+static DEFINE_MUTEX(sp_speaker_map_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -1564,6 +1572,50 @@ void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count)
 	}
 }
 
+int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
+				       unsigned int num)
+{
+	unsigned int i;
+
+	if (num > MAX_SP_VI_SPEAKERS)
+		return -EINVAL;
+
+	guard(mutex)(&sp_speaker_map_lock);
+
+	for (i = 0; i < num; i++)
+		sp_speaker_map.tz[i] = tzs[i];
+	for (; i < MAX_SP_VI_SPEAKERS; i++)
+		sp_speaker_map.tz[i] = NULL;
+	sp_speaker_map.num = num;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(audioreach_sp_register_speaker_map);
+
+/* Read each speaker's T0 in Q6 (degC * 64), 0 if its zone cannot be read */
+int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
+{
+	unsigned int i, n;
+
+	guard(mutex)(&sp_speaker_map_lock);
+
+	n = min(count, sp_speaker_map.num);
+	for (i = 0; i < n; i++) {
+		int mdeg;
+
+		if (sp_speaker_map.tz[i] &&
+		    !thermal_zone_get_temp(sp_speaker_map.tz[i], &mdeg))
+			vals[i] = ((s64)mdeg * 64) / 1000;
+		else
+			vals[i] = 0;
+	}
+	for (; i < count; i++)
+		vals[i] = 0;
+
+	return n;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1629,6 +1681,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch)
 {
+	long t0_live[MAX_SP_VI_SPEAKERS];
 	bool decisive = true;
 	bool success = true;
 	unsigned int i;
@@ -1681,12 +1734,20 @@ void audioreach_vi_calibration_event(struct device *dev,
 			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
 	}
 
-	/* Only a run where every speaker succeeded gives a usable R0/T0 set */
+	/*
+	 * Only a run where every speaker succeeded gives a usable R0/T0 set.
+	 * The DSP reports only R0, so pair it with the speakers' last T0
+	 * reading; a zone that cannot be read gives T0 = 0.
+	 */
 	if (success) {
+		audioreach_get_sp_vi_t0(t0_live, num_ch);
+
 		guard(mutex)(&sp_vi_r0t0_cfg_lock);
 		sp_vi_r0t0_cfg.num_ch = num_ch;
-		for (i = 0; i < num_ch; i++)
+		for (i = 0; i < num_ch; i++) {
 			sp_vi_r0t0_cfg.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+			sp_vi_r0t0_cfg.t0_cali_q6[i] = (s16)t0_live[i];
+		}
 	}
 
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 67a9d3c66fd4..7345b6d15f58 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -8,6 +8,7 @@
 #include <sound/soc.h>
 struct q6apm;
 struct q6apm_graph;
+struct thermal_zone_device;
 
 /* Module IDs */
 #define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
@@ -1137,6 +1138,10 @@ u32 audioreach_get_sp_operation_mode(void);
 void audioreach_set_sp_operation_mode(u32 mode);
 void audioreach_get_sp_vi_r0t0(long *vals, unsigned int count);
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count);
+int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
+				       unsigned int num);
+int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 9002acf0e0cd..19c91d0bede4 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -20,6 +20,7 @@
 #include <sound/soc-dapm.h>
 #include <asm/div64.h>
 #include <asm/dma.h>
+#include "audioreach.h"
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
@@ -1173,8 +1174,14 @@ static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.copy		= q6apm_compr_copy,
 };
 
+static int q6apm_dai_component_probe(struct snd_soc_component *component)
+{
+	return audioreach_add_sp_telemetry_controls(component);
+}
+
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.name		= DRV_NAME,
+	.probe		= q6apm_dai_component_probe,
 	.open		= q6apm_dai_open,
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 6316d1ab0675..8bc681a633d8 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1530,6 +1530,47 @@ static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+/* Live T0 per speaker in Q6 (degC * 64), 0 if it cannot be read */
+static int audioreach_info_sp_t0(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = MAX_SP_VI_SPEAKERS;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_t0(ucontrol->value.integer.value,
+				MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection T0",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_t0,
+	},
+};
+
+/* Kept apart from the topology SP controls, so FEs have them without it */
+int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component)
+{
+	return snd_soc_add_component_controls(component,
+					      audioreach_sp_telemetry_controls,
+					      ARRAY_SIZE(audioreach_sp_telemetry_controls));
+}
+EXPORT_SYMBOL_GPL(audioreach_add_sp_telemetry_controls);
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
-- 
2.47.3

