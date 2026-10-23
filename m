Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775891;
	b=syKQuAL3HOxXTKM4RIeMS/JyPYOUvU8z4nceWpJNVnsougVPhC7G06/65wng5f77+YDo
	 NRMSv37V6tBfyhFzlmCM7Jeo7fYRXwkUZ+NLe/OJQQDZuuPqsoz8c1cLP3wygnXYPviPf
	 ssUjMfheLwhms2XUxb+vEmzVF0aQcl9CQ15Wrd+j8aYqZZKbZBBeORPVM7NT6+L7Pc4Y8
	 vjNWnimgVCZH9cOU/AoyI9E0t3ab75yjRLdT0MdHHW7ulv1BIkGsD+T5mHVf0ryNcJD6v
	 pU7cIEaJe6DWhDyAPhDpyBxfq9WVwq9Pg/ryO9oZPui6shsncz+V0pVXTaZI/7esXvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BBp91ryXprfz1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=;
	b=2VrFsOg3+yr/r2YVIsWo3Ucr72Ba7pEJZ75yH6wu3bGluYQYzs3rmuOtIRoRUxkTU4uG
	 OnGlj1+RElzYQDbp6eZWOVvOVXbiZM+O2jIZ3/ltYLK7ZX07oBEb/XvEFCQNUEFWusuJQ
	 nADzfqjos5LvfTZjqKZVmTFT1Gxyk2g6ccnnZpUtepqk/RnnWws7UfL9MGihvKwdUtIS8
	 B3pQtGrdXrL5JaDLrmpXOl44Uf+UZu5I9inhvXPB7whEvQYvj7JimCKbBC8Mg7FfP11th
	 V6RcHIbs+oeJqLYqVdKkNKq9xAqkfe5z3Q6W3EdrEIB9P3evSD7iiWhcsmh8jHCP3uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6IxDb2K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iruQaTTJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACB5606CA0F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACB5606CA0F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6IxDb2K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iruQaTTJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5xtp2109294
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BBp91ryXprf
	z1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=; b=O6IxDb2KDuSTwXT6p4Fe7WRNr/L
	xAHDjGePM8cidyd2XqxWGyL29PozVBtcIUy6JLAI2HJurpNpXaIXB8zYcpd+oXoH
	iT05cEobw3gDbsT+moMwRHG6Ug7wbWvruALmi3LWmCwyKL4x6Ap+YdGbINS1Kj9/
	FBxzL/CBp/l6YbC6bjBS7ZnALsR0IViHCBknJU5XTdT1pnSHFK41rhLqv5YrfjOz
	h0EjYsIIzEX5HY1VAxpqz7mCJS5eSGxK8JBpc9j+J6FoFDssWvqFL+RFpx4rdUEc
	yG08DAx7QzXYAl4mhosFWlZ36lDH1KTVLmpbZFKi6wwYlrMuV56BNbHBlPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4qvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so255485785a.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775889; x=1793380689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBp91ryXprfz1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=;
        b=iruQaTTJGLpU4PLiNJW+w1kPZSTIsBGfHtR2r3kdVGmCV8Q2/3Jyad5CN/PlrgQ8wX
         EWbOX5+PNMP8PjqEyBMG4SgHEYgtq4ejSJxZ954kO/OW2YvaI6LYZICBJX1Wk43pHPgi
         x4KnP2eD6CMua6JkAnqE3noUHhvypS1EnuRrSke706iObiCh9JB526586Py0eg6MtR4W
         Z+TDp1Ca/l5eN9NWSf0ObbytsQ0ycd6lQUiNYIvCU31vCewlrZFNTDk5FwVO2g7AEOIw
         D5kV7/T32Wbq8gdYuP1N7zJ/5AZxU0A4EDEtzSLF6sEHyZD+t+PfSQCMN8/VW1f/duQ1
         EIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775889; x=1793380689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBp91ryXprfz1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=;
        b=YVBW59qLz4v6qN9SYPOj4MUsrnag8OvYH4BAXuMgja7/Ho+1V4h8WbsIx8h+8PuRUi
         ZNcgwunSlWmZOzkzmYypKlnVjIZxgRPFlq5aVfmkIGmhCQoTWvZ0lP3QLJPJ7xf355K1
         E54wP7BW5YPsGY4xXbVu3MG5+3zc3/L7BWroMjai1tr2nHMfda9TPiFGMayi74HAUqzS
         L5X1Gypg63Yx5l3jjDhdjbYxe0WZDu1zBPcp6qal2+0skG/DUm/0DlgTd8ebKY6nxZEe
         27dffSDZ0rV4y9bM0biWhEQqcIXBB20urU8O19KL270Bm3HGLVz7lcWE7wkF2ZhSoo4t
         RSfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoMBHu44j44EkmkL3mDRtpQRj+lPKVxv2GoS+ngkgXTuNnnTJMQnXGwm689ATsI4HED+erbcyciWkb@vger.kernel.org
X-Gm-Message-State: AFq9FYLJohaisbBR5x0QjS86lGXb9AD0CI7RBK4cHn3YjS+XOc4WJ7mX
	eUXVC7lokGq3cLMZxQaJF3jqtQQ8NwN9hTnTgIFRR8U3OWmZGAZOvyxSpiwG189x9hxmaLlYQe8
	STO04umVlIYrDYgKUbfTQ1+SIsPNSPElyVi+/gPBt4HDi43lpaGfRtBQPaXs450Lr
X-Gm-Gg: AYBFou359VQ8SbfRQ87vLqzm05cp2hXxnIOULHSgyXeAAKw07JTQo+0pLz8DlebTDTi
	1etHPc3iYH33V7M1+7Zw+4AWQFJ3/R2J++AkhZLR+F3taewzTIIt3HHhBHaYDKfM8oGEUUYKDt3
	uI9nVDC0WTHdfo3e19k8Ql9bThBhI47FwIuo7oI0pZb4aXxTsmcsDV52H2IPv1YD0MaCKAhQvlj
	IlgE+Em1VAfQgM11wAnnz+8bjJpcBEF1AhJEUYPy41YvmmY5jzHq9JSlev205kRQIr80N7s5/eH
	OMpKU08IdgxfA/bTAcHaOKfTNcZPGDrtEbKeJtZzHWo+089BDuqsC9msHzPv4laLFwXyxM4ZIuK
	he80lMA4pUCQp
X-Received: by 2002:a05:620a:4509:b0:93e:920c:bfcd with SMTP id af79cd13be357-93f6f7e4205mr529241785a.57.1792775888553;
        Fri, 23 Oct 2026 10:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4509:b0:93e:920c:bfcd with SMTP id af79cd13be357-93f6f7e4205mr529234585a.57.1792775887909;
        Fri, 23 Oct 2026 10:18:07 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
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
Subject: [RFC PATCH 12/23] ASoC: qcom: audioreach: make the speaker protection operation mode configurable
Date: Fri, 23 Oct 2026 18:14:22 +0100
Message-ID: <20261023171433.820092-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8/LR7IBo9EeH
 vz1LKgk4RrS1G7NUw7oD6HPglDr43gcUSgY+Myf5mFgGkHgaMciNTZf+bLbl5WQjQF/JakoB6qx
 03GlnTGbSjPx9OMimZd92nnXVh4nJkJiIDpvXAFPdo7YgSRqzBxBaJlotQegtm5vv/yGvO82SiV
 ym4HQCBbeHOQPgM+kWa0ggW2Ok65ZHZLtYCTlpXSuSikxUpzPpK+K+1rBN32CMyMKI5ZHPAkgz1
 TJ9S+9EAviOoLSWy35STwyS1KS8cRVaTcjWn4uWtVO9sqtV6ho2VkKJVnFycuHifHOa0JJpTHqC
 GX3tkNHhrJEuQXRciyLXN8PkcqdY3TZRWhoke2w9USVl3MiVktjK1YETUGuZfLcj1TEtVNu+DIA
 POlh/ifssboLO9Hb49UPd91txoXXZDTL4FdszXvpXu1UQmEWwgN0DsBQ3S3n38PLv4PM8kkOQ0k
 puSnhK12H44laUGKfzg==
X-Proofpoint-GUID: 066QvZ5tUgBQ4bbIVuWG97gpZRI0zX8I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4YsMk/jgNLQN
 wGPcLr9u+UKQjV9Ug4YIScILkp+8yr6TS7G489TF6xc8QY4L8dNKeO/8il0Oi65gR+G6ZxB7JfO
 Jr4rsMwJetCbQ9Wfy1hfkr3eZAxQ2u8=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb96d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PqEgyVe3TUi4HKbwGR0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 066QvZ5tUgBQ4bbIVuWG97gpZRI0zX8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add a speaker protection operation mode, Normal or Calibration, and use
it for the VI configuration instead of always calibrating. The default
is Normal.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 33 +++++++++++++++++++++----------
 sound/soc/qcom/qdsp6/audioreach.h |  2 ++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index eb317b704b54..7c15c91888b7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -13,6 +13,8 @@
 #include "q6apm.h"
 #include "audioreach.h"
 
+static u32 sp_operation_mode;
+
 enum sp_vi_cali_state {
 	SP_VI_CALI_IDLE,	/* Not calibrating */
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
@@ -1474,6 +1476,16 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+u32 audioreach_get_sp_operation_mode(void)
+{
+	return READ_ONCE(sp_operation_mode);
+}
+
+void audioreach_set_sp_operation_mode(u32 mode)
+{
+	WRITE_ONCE(sp_operation_mode, mode);
+}
+
 static bool sp_vi_cali_state_is_failure(u32 state)
 {
 	return state == VI_CALIBRATION_STATE_FAILED ||
@@ -1575,11 +1587,10 @@ void audioreach_vi_calibration_event(struct device *dev,
 }
 
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
-					 const struct audioreach_module *module,
-					 uint32_t operation_mode)
+					 const struct audioreach_module *module)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
-					 operation_mode);
+					 READ_ONCE(sp_operation_mode));
 }
 
 static int audioreach_register_events(struct q6apm_graph *graph,
@@ -1624,6 +1635,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
 {
+	u32 mode = READ_ONCE(sp_operation_mode);
 	u32 num_channels = mcfg->num_channels;
 	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
 	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
@@ -1647,11 +1659,13 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 		return -EINVAL;
 	}
 
-	audioreach_arm_vi_calibration();
+	if (mode == PARAM_ID_SP_VI_OP_MODE_CALIBRATION) {
+		audioreach_arm_vi_calibration();
 
-	rc = audioreach_register_events(graph, module);
-	if (rc)
-		return rc;
+		rc = audioreach_register_events(graph, module);
+		if (rc)
+			return rc;
+	}
 
 	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_speakers);
 	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
@@ -1675,7 +1689,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	/* The DSP calls this field num_speakers for the VI module */
 	op_cfg->cfg.num_channels = num_speakers;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
+	op_cfg->cfg.operation_mode = mode;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1766,8 +1780,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
-		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_CALIBRATION);
+		rc = audioreach_speaker_protection(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 232faba6d83f..e30603674e37 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1114,6 +1114,8 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+u32 audioreach_get_sp_operation_mode(void);
+void audioreach_set_sp_operation_mode(u32 mode);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
-- 
2.47.3

