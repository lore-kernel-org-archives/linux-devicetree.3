Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364111;
	b=0r6L3PXpwVoCNHpMVRQhobk0fRmDgQvajkI3eYPgH+W4ghXntkc/Q2z6eRfUHUDjX9/C
	 194Je1DSG8zsCMC7u/9APE+RaB1fHaIQLmE0Pcb2iLBZHe26v5d81O9sDJ86zmdBf4x9q
	 15LAwI63WAyd0P7KPXT3xMaFN3tPSHu1316M5kmc84j8+cLzgmfzy/Lq1WvSDomXAc5X/
	 8pp86raEfcTmrkfl/uoRiJ09zh14SM9okkbCbXFfFo8hzMDK2zffdvVVk3A+JZIqacL8A
	 DdWEh4PNK6vXHSmWDNI2TORZLCfjFanS2EkZxKxv4Q2TxLw3pOdkL6BLChsSe4AbEmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5z4Ablit6pC23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=;
	b=oifFXX3CKbi/wbpSPzZ/GpA+R9ozd2iYykU00iUUJxI6UvlAj74tq05ypfNqBHv69JcT
	 u7CHpYa5u4WuZlq7Gnl+J7Rjxy0DEXeMNKaGZ7bjtcU+5TgpuON7yfTyaXOdby5EtaSbM
	 5QHdDFnPNsQIt/Ms25V/8fxhJZGhjO2qA+xFFv7/DxL6ZBuDq5AyMbO0R666foARE9zkd
	 EANlxIgyrgYKe94VYsGLBlCehFFqer0XxXlGQJY3Yjd4Doy//aoCIaByQIgF2I6FvNBoC
	 sVUwaZ4lFCWAPcpMUVl/yFLpg1uTiFsqsXcQwEgIqrE3S6BydJCT1QraK860XcuRdqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fowX0o2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TGOqxT6h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E060A6F43
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F7E060A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fowX0o2r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TGOqxT6h
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQXeX3382516
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5z4Ablit6pC
	23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=; b=fowX0o2rGlVMjMKHmvN5UUw0r7Q
	AAQZuMEqtX4lKSxaeheSbp40R8681kWFBiGPgxU8y2+gw3dyZ/L78fN4Aw8Yxs99
	yeoZkqbC06VLn7KOkOwF6ns3uqTkLw5RuZa704xT1yKj+xwlR9FtBgl5XN8wMKm0
	3yNdoWWO0O2pG9lmBbYUKRJ/YqLC2wWKaMgPy0ntvtxA3YuP6HBVafNTbhghDyYR
	/0l3em3bSd8MReRKc+0517hi8MdMDbYa+Xl3jLsbx+wP00rsvH0imSLqscRpgtpe
	zPilAnvmYPB7k+tPuqeHuNKVGNV6tKm9AJD/RClbu3CXxeFeQby9uvU49xQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9493e89d4f9so378505185a.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364109; x=1795968909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5z4Ablit6pC23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=;
        b=TGOqxT6h4s0gio684wAzeXjSQpFjLdY0FiJi/w95ZuNMuxh5U38lMm8U/OJUpVTmmy
         f/DVLy0pZSkLslnxvtQMwgt9/10wtmz2GzEvsMB0TwMrDNddHytlwbP4A7BdwhNYpLbS
         aU7iKpiFS9tkb/cLbzuEYf+YVoleIualiriM7/x8AxbyDU1VFi0H307FYgmUaFk5VA7j
         250Pp2w+51oFcAlSe55Nhh91lsjRZvgHv74DycWYh/9Bh5DYP07kISiptMvrnBw2vgaC
         1Jx0YbZsLmi7Qx2bqqCRqkSaa5NEWp3KMjgq2OyKxcCG4TTBJyp2iDgVDbdmtUwDfJAe
         uPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364109; x=1795968909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5z4Ablit6pC23zEnkKYSCYAF5WTDtAoAJVgPlJ6vnXE=;
        b=yMo+dyBxvSVf2RfPzj9TH0Eu2Krn2/4+RfrnHOr56vqm+RAmbRecu5Mt2JpOLXUYlT
         4abxQNsfJwz4nL7zh047XZ3eHqMh6uZGTHLo9df5JE6mNDbFFFlJzvpVIibuIxKd6BJe
         HlWsEYDWOPaW3xHxsak+UT4cOFuQwbipOiKJscNk5OxAG6k5yOhkUTTmRJrs9R5/wkyY
         v25SXMC1+F4i5yX+MDqAmDEv2PpXyrIIcQlzaO3d01P+2CuqY4UU98tYmpNumzjhAbV5
         kiC4iGAAlUOwlNHYFwaeCoo0zAUUIa8mKAGDzH1wcbizbuP+v+ai++cMdP+a/g9NwDp3
         ErTQ==
X-Forwarded-Encrypted: i=1; AL+hErEovT2dckttmXxBJ6kqExgIPeND7l8VDMA+r5IMBhMcwU43saXLFkzuOwK/W+KK0GKPq1gCnrbEjdBq@vger.kernel.org
X-Gm-Message-State: APuU4Z9YwrMZu5AVg3dBDMCTD1rm0LXeBa3xbDodmxW434xwRibWo0Rd
	wqAl0Ajcaj3F4KUZzxa9tkN+t/ZXweh95fEJm0FOC8qj9v0wJlaheMSFQl85CfcR0PDPClgXGbV
	TdHvzABJRUaeRJVfi3yH5hwEuBmV/cL8maoFKphMcu24c9sYomEpbAd1GNS0x7v5X
X-Gm-Gg: AZFdTZer5SxyysxRS5fve/Wer7xX4VPxEjGfditjlNPxWuMtA76GbBy7L0lkfkfyIIQ
	d3zERyGOAa4Un7Kc+rVZX5i4LRq3le/pIW259TwCxYuH6vMo+rUH+aPcwwKuI/Zj8lDtu9eqine
	lTZokpVYnbKj4eyJ2ORUH5sJSKLB7CW4jSTlI36zQ/6RrI2vnCDtNIQ6n1VXeU/71+4y2rgXBqF
	HTgs5lEdfQoVQBo1UN3ERs1++1EauvLaQIe0UjFQoiZpbvGvAlJNpyVcnnzDnovktix+mh4uQqw
	E6N7DPPCiz4JzAjGsYzmvKRKro5FjdqS1m2pEegu4fREJszPjCXo7YNqdSm6DskL0l8Zv93dFkT
	Z05Qc4JhH5Uow1LLAkcdJFmjagQlKn+iWzQLMaxna8x3q3oceEXfsMPSap2kkU+5I
X-Received: by 2002:a05:620a:4012:b0:945:fe1c:82b9 with SMTP id af79cd13be357-949baa0dc96mr1545919585a.46.1795364108600;
        Sun, 22 Nov 2026 08:15:08 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:945:fe1c:82b9 with SMTP id af79cd13be357-949baa0dc96mr1545911685a.46.1795364108051;
        Sun, 22 Nov 2026 08:15:08 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:07 -0800 (PST)
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
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 12/24] ASoC: qcom: audioreach: cache VI calibration results per speaker
Date: Sun, 22 Nov 2026 16:14:25 +0000
Message-ID: <20261122161437.5994-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03150d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9ZV4jQrK44SIZejVWmoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX29KhKDWfU9AG
 Q4i1LDhRmXrWFDA24wTUnkBN+PRDwY3JPORDwE1iOt4Fchc7Gnuj3Xl4mOx0jnMwuVqVEz3+M3B
 kmq3rDCcEw7Jsay78nU3+92YqeANO3I=
X-Proofpoint-GUID: p8AlX7Q_-DIQA5k7Y0NQgRy8jR3-ptlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyQydTZVq3sYr
 UiB6JPTl7rsZmK4pBUXbw6qoym/uX0ftzxg9kVmgV6+OqbZciGcTwhOShY4btC4Gc9tGjzkIbRB
 5YS6Lk2iqxgV8rGswn+jobebiz5Pmro/eSvwp5zt35nbSVWg8bX0ZbpdFQv+8807+/sapdvXlJC
 sBmRVxsFlyifH1E476KFW+jhK1+r+qfdDSbbSb0Ttof5ai0E8t0/ZRX7CccidvwFqvYlE0VLtfG
 kk71mtfcKck4cRny5hmak1nI3vBj8X6NkTqjVqHTTlgSM7ACNMpzwlqaxO65Y0dbp1CGwBAz1PN
 ADUN4sEVZlv6GUpLsfkyuWPPZZbZ9j/MXZdSLrITr75+ZkNLfYinSCfP7OcX8ru1+N4+RwiSAJj
 0eWshtEeXbW+cfqweN41QUk0x8gioiwMRAWYOr0JvqSGv0ygQ5GuzVOVy3jHgNpDcYzC6zBuEfE
 xQcNTcRIhgJoB/fGhUQ==
X-Proofpoint-ORIG-GUID: p8AlX7Q_-DIQA5k7Y0NQgRy8jR3-ptlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI module reports EVENT_ID_VI_PER_SPKR_CALIBRATION every frame for
the whole run, which lets the earlier simple handler flood the log and
drop the measured resistance.

Keep a per-speaker cache (R0 and seen-states bitmap) protected by a
mutex, log each state once per speaker, and record the measured R0
once every speaker has reached a terminal state. Log R0 for a
successful speaker at info level and for a failed one as out of range.

The cache carries an explicit "armed" flag that is set at the start
of each configure of the VI module.  The first event of a run clears
the previous result, so a graph prepared and stopped before the DSP
reports -- for example a sound server probing the PCM after a
calibration -- does not wipe a successful result.  Turn the
pre-existing state names into an sp_vi_cali_state_name() helper and
add a Q24 formatter for the log output.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 134 +++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index fbb9e3c4b84a..2b5c083b8ae5 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2020, Linaro Limited
 
 #include <linux/kernel.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
 #include <sound/soc.h>
@@ -12,6 +13,25 @@
 #include "q6apm.h"
 #include "audioreach.h"
 
+enum sp_vi_cali_state {
+	SP_VI_CALI_IDLE,	/* Not calibrating */
+	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
+	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
+	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+};
+
+struct sp_vi_r0_result {
+	/* Set when a calibration run is armed, cleared when it ends */
+	bool armed;
+	enum sp_vi_cali_state state;
+	u32 num_ch;
+	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
+	u32 seen_states[MAX_SP_VI_SPEAKERS];
+};
+
+static struct sp_vi_r0_result sp_vi_r0;
+static DEFINE_MUTEX(sp_vi_r0_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -1462,16 +1482,112 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+static bool sp_vi_cali_state_is_failure(u32 state)
+{
+	return state == VI_CALIBRATION_STATE_FAILED ||
+	       state == VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT;
+}
+
+static bool sp_vi_cali_state_is_terminal(u32 state)
+{
+	return state == VI_CALIBRATION_STATE_SUCCESS ||
+	       sp_vi_cali_state_is_failure(state);
+}
+
+#define SP_VI_CALI_UNKNOWN_STATE_BIT	(VI_CALIBRATION_STATE_LOW_VI + 1)
+
+static const char *sp_vi_cali_state_name(u32 state)
+{
+	static const char * const names[] = {
+		[VI_CALIBRATION_STATE_INCORRECT_OP_MODE] = "not in calibration mode",
+		[VI_CALIBRATION_STATE_INACTIVE]		= "inactive",
+		[VI_CALIBRATION_STATE_WARMUP]		= "warming up",
+		[VI_CALIBRATION_STATE_INPROGRESS]	= "in progress",
+		[VI_CALIBRATION_STATE_SUCCESS]		= "success",
+		[VI_CALIBRATION_STATE_FAILED]		= "failed, R0/T0 out of range",
+		[VI_CALIBRATION_STATE_WAIT_FOR_VI]	= "waiting for V/I",
+		[VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT] = "failed, timed out waiting for V/I",
+		[VI_CALIBRATION_STATE_LOW_VI]		= "V/I level too low",
+	};
+
+	if (state >= ARRAY_SIZE(names) || !names[state])
+		return "unknown";
+
+	return names[state];
+}
+
+static int sp_vi_q24_to_int_frac(s32 val, int *frac)
+{
+	*frac = (int)(((s64)(val & 0xffffff) * 1000) >> 24);
+
+	return val >> 24;
+}
+
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch)
 {
+	bool decisive = true;
+	bool success = true;
 	unsigned int i;
+	u32 bit;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (!sp_vi_r0.armed)
+		return;
+
+	/* First event of this run: drop the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states))) {
+		sp_vi_r0.state = SP_VI_CALI_RUNNING;
+		sp_vi_r0.num_ch = 0;
+		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
+	}
+
+	for (i = 0; i < num_ch; i++) {
+		u32 state = cali->cali_param[i].state;
 
-	/* Raised every frame; keep the per-event log at debug level */
-	for (i = 0; i < num_ch; i++)
-		dev_dbg(dev, "VI calibration channel %u: state %u\n",
-			i, cali->cali_param[i].state);
+		if (sp_vi_cali_state_is_failure(state))
+			success = false;
+		else if (!sp_vi_cali_state_is_terminal(state))
+			decisive = false;
+
+		bit = BIT(min_t(u32, state, SP_VI_CALI_UNKNOWN_STATE_BIT));
+		if (!(sp_vi_r0.seen_states[i] & bit)) {
+			sp_vi_r0.seen_states[i] |= bit;
+			dev_info(dev, "VI calibration channel %u: %s\n",
+				 i, sp_vi_cali_state_name(state));
+		}
+	}
+
+	if (!decisive)
+		return;
+
+	sp_vi_r0.armed = false;
+	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
+	sp_vi_r0.num_ch = num_ch;
+
+	for (i = 0; i < num_ch; i++) {
+		int r0_int, r0_frac;
+
+		if (cali->cali_param[i].state == VI_CALIBRATION_STATE_FAILED) {
+			r0_int = sp_vi_q24_to_int_frac(cali->cali_param[i].r0_cali_q24,
+						       &r0_frac);
+			dev_warn(dev, "VI calibration channel %u: R0 %d.%03d ohms out of range\n",
+				 i, r0_int, r0_frac);
+			continue;
+		}
+		if (sp_vi_cali_state_is_failure(cali->cali_param[i].state))
+			continue;
+
+		sp_vi_r0.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+
+		r0_int = sp_vi_q24_to_int_frac(sp_vi_r0.r0_cali_q24[i], &r0_frac);
+		dev_info(dev, "VI calibration channel %u: R0 %d.%03d ohms (Q24 %d)\n",
+			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
+	}
+
+	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
 }
 
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
@@ -1511,6 +1627,14 @@ static int audioreach_register_events(struct q6apm_graph *graph,
 	return rc;
 }
 
+static void audioreach_arm_vi_calibration(void)
+{
+	guard(mutex)(&sp_vi_r0_lock);
+
+	sp_vi_r0.armed = true;
+	memset(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states));
+}
+
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
@@ -1538,6 +1662,8 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 		return -EINVAL;
 	}
 
+	audioreach_arm_vi_calibration();
+
 	rc = audioreach_register_events(graph, module);
 	if (rc)
 		return rc;
-- 
2.53.0

