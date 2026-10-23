Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775902;
	b=BedjBD+ydENv1TytUaEY4wSoCutquy6AHdYltWSL9vgJHNuI4fjZ+hPwu849QAo+tNyd
	 n9Y0mrsxhhwiOwMWH3u9NJB4by1Lk3Fg1gdCj9+bDYWs3DROxO3VGhfSOaiyOSTVUnYz0
	 3mfmhnQhB79TSN9z182QdAO4LlW5yE9FVwOOEeRFmgq9PnirOZo/17d030z4Z2EAacd4k
	 DailCEkv2BjsvN/qJzE+eLbvpchM2AKLSiBIz7MBM+fhZ+YyZXRXjz9pHMhQYH2Xd/wbh
	 TQT27ZJfK+BX5ENlPWx3Xcobig09w77txziJ7qN6bZcxRd1uM7GkElEgO5E6pyk9mwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
	b=JgwyAx9ujlMwHgbF3+RDds/gtPNBYwoCiOKmx/Y+p61g9/pQ7pLZ34BghIOuOJfK41Yo
	 PomdmsBc6lEyHRsmZzv/0RsmB73nOTQPHwMNJOxb3DKAeWLuOANfwlxl6tSf/aGugRHWF
	 K0y4xTy8CMd5dRXJm9adzBMvmH6+HDnz8w8aTizvucnyVLwx140vv1kXlnpRUj5Yw+/kv
	 A59iN1CCjWX230Y8EfgbIZs2i87GoD41lHGQO2DsuMBmCEEqliOyZZMk0C9DypK2go63r
	 mGpvIp2VQg9U5EBiACfn0caRzzsQuQvvjAaw1O76Fv74QtY+4YLiFnm3EwRMKotNovQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT1oskss;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiHNwOuN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5E5606AA30
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5E5606AA30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT1oskss;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiHNwOuN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG34Fa3734755
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IwyToYvHi1B
	z1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=; b=mT1oskssTjY7dBGpzuiuOrktApn
	bhOZBSmGiZAmLju25udAAhAtKjb2/Sc35c3cRJLQ8DOi5pupSe9RkmcW3iDZuTWP
	KF5Ip2MH2RSWl6IslStlV+B8HDFjWbN52Gw9RFY9CLDOsGdjTX+qSkmDI4sGofzU
	DkBDrbno5csT/wro47uPViLDBUtaWsY0qp7/u7Chm77VbI5Vy8BtdqrGm0XOJutX
	q257b1ojOWmcLkZ7U3ngKVI3oaPOwYfQCh/rJagofXOAfaVVcLuhG+achAcLGD7z
	XZmLsUYiOz3I1f1akBYLy3dtdmfStvu11mC1YVKlElerV4xRJfi6RKUWzaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so203785085a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775900; x=1793380700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
        b=AiHNwOuNOaUC3/bX2eQvupYiaKojtMMQIbzy9lW6svvpPd5CszS1ijqVgQwjWYiRnt
         hj0cHpuYgjAMz4tSePlPTQs4iuPT/iBfsDxu1k/3tgAtaNr5dM40TLSf/B1xOJneGefM
         0E32YKeQ6oyLljAqoZzAw9tX2H1EwYSf9HstNmvrLMn4EIK/Gs4JmHgbg1Z/ULBoHaWG
         tMpc8zWhDnf6UXESKS7e6BW+p8t3FoE1WKGkde0XwE5ts386jHiZI1LqIaw9qNMqE3wC
         CMaoLhW211p2qnr8zeEfuqumLH7qRKE+9YPzLviTsmIqDJRhIXAI5S7Od7ll3pvTUlWd
         CViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775900; x=1793380700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
        b=v/dBszSZD9Jqqh0fTTKhZDdUc5enKQGU/wdx/45XlBgCDTfZOwrH9enMzYtZVM6C+u
         sB5gA88rZ/MDOZF/B9UTL39TiWpMIAOOxB+WvQ/6mpWOsWrMxBA7gRyLkgjggoXa9eCS
         soiObx3zvcrDgqM1ZLRLsprUKDkTKTkPhhk9vO+fivqwAyePTkduP00+ukyJ7BffltuN
         Gk0XEu6mUQ55qs6KobFA2piPcP8IOPb6kr33VUoGSQ24OrxS9ciIaPY3N091qAVmhh60
         jaDtLzn4AqcsuQnDjITgZ+YD2x+71MnMpXfzUmHblMTPWsNxzoJneqkNHKiLkTm1gwqy
         HtVg==
X-Forwarded-Encrypted: i=1; AKwUvBwm0CD5SyCB/6rSLmGNSQThlKsDACcJSGq5BYc/OfChGOdw0OfYDhqkcEAlJqNszJsIMB5VemNhpJ+K@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9lu9aQeIhT9msIa38Oh5BFNt5r2GQmqNVKENAqXtj3TmWASJy
	brIxioBf9QYzM+i3x9bS/r48G/9XXnTxZCvQbDBhVNuaa/KABQe4C5I3gs9o7fQvEdoFM4sTISX
	G6NspIXmoL7IJW3t6CVqRlihWGAUIAwgUN0xFQip7vUebtOuFtVBsTnwEwH8vcZPP
X-Gm-Gg: AYBFou0xfp1hMHOKYBwUy4i5uhGGSzOcplMGGaAG6CWbvTosoy2iqnaagX9QfJDo2sw
	fNd8MShWhQW/2UJ0hH+fuuLZb2BHhKmVW7t4adaX4fnEo1Z9n4/JYrPjZmlx+5vaNkwak5fKPUI
	M5tS9d6ei4cNm5ya6+g9i5T4N5qcUlapID7T7NtkRW/wg/SQ1XY4EbCLZniUXG3z8ZnhGMG4p6u
	XTkenn2dkebwyT2mT9QWgmdn9hOeCJYlm+Ht3y9isXzb3jvci2n6KJmyMDrKjM5H6VjSgdIClMu
	YCceSxPgsmY9WdEU3zbesAPVq2lVVAh3lbWpDBQHi0eet0JA3Zw9ve2v18WPKasNbkD2u3lpJz2
	rOmjESkpLk9vS
X-Received: by 2002:a05:620a:3704:b0:93f:8f9:7a83 with SMTP id af79cd13be357-93f627dabaemr1009220685a.43.1792775900139;
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:8f9:7a83 with SMTP id af79cd13be357-93f627dabaemr1009217285a.43.1792775899700;
        Fri, 23 Oct 2026 10:18:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:18 -0700 (PDT)
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
Subject: [RFC PATCH 18/23] ASoC: qcom: audioreach: add speaker protection calibration state control
Date: Fri, 23 Oct 2026 18:14:28 +0100
Message-ID: <20261023171433.820092-19-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0NksYBSeAbEt
 /Z+MOPqk3uLTwqCq8vEEh0nPElAktYTU921gfUzfEI2Nu1xtr+mtGwJyu6PbuTGohmv7jvf3Wiv
 pPoK38R/Pxz5+uZ09TkV+ZXBJTFISqA=
X-Proofpoint-GUID: KiFxif1oLCM1WbKDyi9FtYlILV-OZgEU
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=kkz25WANwqfBvfs1KZUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KiFxif1oLCM1WbKDyi9FtYlILV-OZgEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwQD/ntGKfilG
 RQM2iayx/8Lq1bfYrzKR2f+0w0rf+frFH+d+hMZe1GuYa+btDJv6pjuWWrn+3MK44hOGuEaJKjz
 t8P//sFHw6+1QzOOd894b6pZjQ7ZsW4NCupVk/mQw8yjGENuHV5cSwO/wvB76XxX+/WS2h/HSQz
 GdXFVWSW0jX4cr5hd6wo1ajzYt8D85AjTgNQ8x6PKlsItyiVrW+4pGvr56uRETmKfcI4KXYUMy/
 yCmPGq0LA3WQCTZLPVazet+1ljNjIJfgQUxOgGJDD93+WSlnw1YhNyMqeapwrjz/HjfobXytmFE
 0gUtfs42m2DVrtKtKkKy3zbF9VfPD0/sQOQGdzYMYyKKRVSBubgD2LN+tAevZrzsHOgVbUx/AoI
 5G1+3K60etCuLdhJ957MgSpdAYTM085h6bD/92V19MVjM4M5G2q5YNAvL5+q1RJjfLgqY1vjT1c
 NRsulVsO4zU5NGfP7tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Add a read-only "Speaker Protection Calibration State" control with
each speaker's last calibration state, so userspace can follow a run.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 51 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  2 ++
 sound/soc/qcom/qdsp6/q6apm.c      | 15 ++++++++-
 sound/soc/qcom/qdsp6/topology.c   | 18 +++++++++++
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f05033cc3f7d..3eba0a9a0372 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -21,6 +21,7 @@ enum sp_vi_cali_state {
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
 	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
 	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+	SP_VI_CALI_ABORTED,	/* Graph stopped before the run finished */
 };
 
 struct sp_vi_r0_result {
@@ -28,6 +29,8 @@ struct sp_vi_r0_result {
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
 	u32 seen_states[MAX_SP_VI_SPEAKERS];
+	/* Last calibration state per speaker (enum vi_calibration_state) */
+	u32 last_state[MAX_SP_VI_SPEAKERS];
 };
 
 static struct sp_vi_r0_result sp_vi_r0;
@@ -1616,6 +1619,21 @@ int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
 }
 EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
 
+/* Latest calibration state per speaker, 0 before any event */
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	count = min(count, MAX_SP_VI_SPEAKERS);
+	for (i = 0; i < count; i++)
+		vals[i] = sp_vi_r0.last_state[i];
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_cal_state);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1695,6 +1713,8 @@ void audioreach_vi_calibration_event(struct device *dev,
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
+		sp_vi_r0.last_state[i] = state;
+
 		if (sp_vi_cali_state_is_failure(state))
 			success = false;
 		else if (!sp_vi_cali_state_is_terminal(state))
@@ -1753,6 +1773,37 @@ void audioreach_vi_calibration_event(struct device *dev,
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
 }
 
+/* A run cut short never reports a final state, close it out */
+void audioreach_vi_calibration_abort(struct device *dev)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+		return;
+
+	sp_vi_r0.state = SP_VI_CALI_ABORTED;
+
+	for (i = 0; i < MAX_SP_VI_SPEAKERS; i++) {
+		u32 state = sp_vi_r0.last_state[i];
+
+		/* Slot never reported: not part of this run */
+		if (!sp_vi_r0.seen_states[i])
+			continue;
+
+		if (sp_vi_cali_state_is_terminal(state))
+			continue;
+
+		dev_info(dev, "VI calibration channel %u: aborted while %s\n",
+			 i, sp_vi_cali_state_name(state));
+		sp_vi_r0.last_state[i] = VI_CALIBRATION_STATE_INACTIVE;
+	}
+
+	dev_info(dev, "VI calibration aborted: graph stopped before the DSP finished\n");
+}
+EXPORT_SYMBOL_GPL(audioreach_vi_calibration_abort);
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module)
 {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 7345b6d15f58..6a08f52b7786 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1141,10 +1141,12 @@ int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int
 int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
 				       unsigned int num);
 int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count);
 int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
+void audioreach_vi_calibration_abort(struct device *dev);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4502741d87f..41daa02febf4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -813,10 +813,19 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_open);
 
+static void q6apm_graph_abort_vi_calibration(struct q6apm_graph *graph)
+{
+	if (q6apm_find_module_by_mid(graph, MODULE_ID_SPEAKER_PROTECTION_VI))
+		audioreach_vi_calibration_abort(graph->dev);
+}
+
 int q6apm_graph_close(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
 
+	/* Covers a graph closed without ever being started, e.g. on prepare failure */
+	q6apm_graph_abort_vi_calibration(graph);
+
 	graph->ar_graph = NULL;
 	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
 	gpr_free_port(graph->port);
@@ -852,6 +861,7 @@ EXPORT_SYMBOL_GPL(q6apm_graph_start);
 int q6apm_graph_stop(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret;
 
 	if (ar_graph->start_count == 0)
 		return 0;
@@ -859,7 +869,10 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
 	if (--ar_graph->start_count > 0)
 		return 0;
 
-	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	q6apm_graph_abort_vi_calibration(graph);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_stop);
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 8bc681a633d8..75381d9a1435 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1551,6 +1551,15 @@ static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int audioreach_get_sp_cal_state(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_cal_state(ucontrol->value.integer.value,
+				       MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 	{
 		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -1560,6 +1569,15 @@ static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 		.info	= audioreach_info_sp_t0,
 		.get	= audioreach_get_sp_t0,
 	},
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibration State",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		/* Last calibration state per speaker (enum vi_calibration_state) */
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_cal_state,
+	},
 };
 
 /* Kept apart from the topology SP controls, so FEs have them without it */
-- 
2.47.3

