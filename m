Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364112;
	b=GRZ/6QLU03qxhTzTX2pLMy+/7dReaWjuLL4gmLu4HbSr7omBH1Iidh3Gfi0BFk36XHVN
	 oUfkLCN27dGcvnLYNe0WuEJYXYgKKTG+MdRluxOzmy+Mm9k6N87UHxC1A4gSBtyp8ozSF
	 /PfWwCZ7apjZlkhWVGpMnqcrzVrSBjJs2dW6bLzzMia3MAy8mDnYgitcuIYsfn/aoq3zO
	 c5RVSgAgsdzu9/eyww6ClnvdRsqOA1rSuA7XSmyXbhmV4rT7W+YPK4EN0cu1mgc6WI2ue
	 T4WPJsPXEMicHviZq/WVuCEhS+DGSLIODqZfoTGeXxtvUbSC8tAOKYX40pD8Lw0plHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bo02fidDDIi7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=;
	b=48fl97BezJTH49drPF/4qSxbWUHC5WS7WBrRspKLdbw1hC1Tx4+AXBOvNb0Hefy6O3m9
	 E5+zDfHpoM5Cron61bUJxuMmJsmOHugKPAMNM+YNqZ4GfcOdANaAhTKm++sGu4GaJT+xj
	 TAcuYsGraBXLQgoZSFCRPDTo46JomDN+2I/T2lMjy/C12K4ELS6oEq4QFQU6zXe+a3FAT
	 VuQs04NO0lyILxHTkdGUwb51oLlEzF7m/cADqyDtiIeJdOm7M7QqHXSRiWIFbIpCjuQyb
	 Zb0RdTEQv8cQFtU5MNZOynduo3vWj9OwTB9mfxznuPIGhQNtTP1djdnB+tCiXuEGqtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p87cdvIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUp2Byo7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106260A6F43
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2106260A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p87cdvIq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUp2Byo7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ8Y11854206
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bo02fidDDIi
	7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=; b=p87cdvIqybXI0n4gJ6juhr9il/p
	+sJZaH4gxKUDESdvZ7ubhX1Ol2ritoQf+tuvO61R35iudkRmyfIr3Gk9vLngLfyK
	A8ISw9OWl2mt9/QD5b2itjQPCYgojiqpPkuyt7Gv3EciT0Y/HozYjvN80hVRh9Hv
	M9dbUjSr1h3sGRUX0Cub6vI8XoWhDwWdtzR3pwnJCH/O9P43HVSLu2vgyFhq4e6t
	/x95gO98PNdGJ77fR0H5eqEp9oNDrQBsVisfku3v7wFVLEOxSbk7OHgCvngbHm73
	xdLrd2VlOdLdREYogcrTc5MYxGUtGHzMesyDCNpzkxflHmDvppm2GzwuQ5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv414-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso365188985a.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364110; x=1795968910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo02fidDDIi7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=;
        b=IUp2Byo7/AZBhdKj6FRETZf/q1KlhjIKCmAjTksZ4SPmKIO8HZrlu5m26C4Qvy1gmQ
         NJMQGIyWGct7JoGsGuL7IYiJaF2I+Q4zuiypg3p3CCfqW8eWmcbiCBkLR9nwETK9AA1+
         RHSpy8U0Y9sHKQgSmJkzJ/KKIyKaTj7ASzDnlpk9PdIRwy1C7rtmP0p0gpN/pVM8Vsie
         EX6aT2rQdJ84Ph9JilAzVMJjl91PPRP0fqMpAdJaLblzFjvN1Qz/BYvjKZftZp62Q6+d
         FmwH2d8Anz701yM2IzeLOCYoc/AUuPSLyaZZGdHPVB6uX54rY5iJ/rMfMqCihcDVMmko
         EC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364110; x=1795968910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo02fidDDIi7RXVEkPJ4luywF9zI8GuniBVZtXjrWeI=;
        b=gvnBu/uPg8dGD5/WMiKDFGl9/6mrKUf5kI9fWnWu9269OaCynDSv0p++hcN3tCmSkE
         1NA4XwN0GkzwN6PeRvj/rCbDM952IbQD8wn3Kevn1y6z6DO8oSNvIpurmdQt15erxHdm
         q18YEfTxIPLUDWaNXDGsOgmtu2X46awzVygOJuQ33uYD0jrPm6z29HMStsZRpV3uf0bZ
         3eeq7X3Sae8V1LcWtUapja+cRqFYU7ldQCCuQzAGMUJfqyRtaJp5jZ3mRTlEgqvGmLyM
         NvsntOpPtxo+MpSkrmaJGJtOYVGheKancUxFxWVbWkOFJNPn1WlkNVi8iGIoAWH7Mg5v
         LZdA==
X-Forwarded-Encrypted: i=1; AL+hErHJGFw1Fe7pS5RuzigIIL/xVnDF/4hCKfa0laZRExTPK7oczDgefs7OwW9yJg7r3PqJu3mNB/Jy/BsO@vger.kernel.org
X-Gm-Message-State: APuU4Z9nu7wfMW2Gv7ffqQH0dPJL1mGlgxkh/73/+xAugteXQA6m8bK5
	PJlkPoyKUMRn8YAJ7x8Oo3xX0GpAg2p9JV9rcX7TvEccKRMI6KeOLRsk/3p+BiF4LvzUX7wUMKH
	UQjXzNsNoL6Twg896LArrShPGQLCrRzjsh5FGz/RF2JbkL/3rtEhSnPawjX4by6+K
X-Gm-Gg: AZFdTZdIFUaWJPmM83tsQD/UkIYO0q1Ao7B+zbHboLjcjfjuCLdB/ZbF/x+gBeF5ryt
	/hzrwwZItBUGMpdUp9GiS0NeR+mhG2R32dcw3OmRIU8RPJdZ8g1bPczCH9U6Hjamv39xDihSraQ
	5dhq3bqvXt1W+fWBUzgQhajQoqU0sPp9pVlwjdgCcqqhb2Myw8O6/8gR1gpcmRNU1OCBi3jk4yP
	i/vni1iDHT4w52hdZER5VPfTqHI9ZZ0se9O+o3sx9bMAxVhtJS3RLNbSHvfr7Q2opDL4XSx7tqX
	4eJbHtFw59LDNS5AShV2fAdj3jy7Ak0HcuPCCIB7zYRsawC38Rv3JquWFaqQESwBNMg7RwbwtOs
	oR2D1qWDLalw5fKF/LNqWsntCFLsP0dpnC3ao7pr0dsHckP2I9alIW5EuzMrVN2LU
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr1728776585a.21.1795364110301;
        Sun, 22 Nov 2026 08:15:10 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr1728763785a.21.1795364109530;
        Sun, 22 Nov 2026 08:15:09 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:08 -0800 (PST)
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
Subject: [PATCH v2 13/24] ASoC: qcom: audioreach: add speaker protection calibration trigger infrastructure
Date: Sun, 22 Nov 2026 16:14:26 +0000
Message-ID: <20261122161437.5994-14-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX47OH8DLkDv8K
 Z/m7SG8tRu1XZpPmN9Nde56OffNe997BFWhHV8CnCqFnRY48yzUJZmoGHNyB4I14otComFigYYP
 wCc15c25zvle9D2zfHUaRu0hH0xHolZCJS++V971YjjEsSMqWQ8CHS2/XIBcosRaQYBRnOgGMNL
 TWMQJO7g+kKR91d9bQh4MQL0KvXWQpexQ8H1neJlZvu75kay77PTU20LBY5LbVKMMYiur5v3ihI
 VuEcP6/qF7QrOy6RLcopMpsc9Y85uFuObEd8fMcisOY/l49RVxcUwDUddQMbsaxYYQfM9SGdT1V
 ylrEU3iqvvVZuIKaUX/HmTdsYXcXxjSWK2YY+eOIPhrdyzt+fOyDbvgI7kvINQq425GrYx++U1O
 OQyBnN+U920940o1ssp1vFZFt3ySCoyTUXzqku6n6QsH/lXg65txugkAlkEh9560xNMAx8sU+HT
 8sZvQ68hwnckxH+GOYw==
X-Proofpoint-ORIG-GUID: iXxGTrmbAAV9dR3-w3dLMwohGNcdMSuR
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03150f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5LjmXOTvIIUa77iOKnEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwuy7CktgYXG+
 9/dio1887/2fPR6kyTwoiinggZJl8Q2ayk5YXaSB2YHzD+hSI7dP68Yvsy09H2ZHPhR3w7ngpN2
 aMu//fPTTXHziaArjfyd/m2ZZ7VdTN8=
X-Proofpoint-GUID: iXxGTrmbAAV9dR3-w3dLMwohGNcdMSuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Introduce the speaker protection operation mode as an internal state
(default Normal) and a write-only edge trigger to start a calibration
run:

 - sp_operation_mode holds the current mode; audioreach_get_sp_operation_mode()
   exposes it as read-only status for userspace kcontrols.
 - audioreach_trigger_sp_calibration() flips Normal -> Calibration via
   cmpxchg, returning -EBUSY if a run is already in flight, and arms a
   60 s watchdog to bound the armed state.
 - On the DSP reporting terminal state for every speaker, the mode
   auto-returns to Normal and the watchdog is cancelled.  The VI module
   path uses the current mode on the next configure.

The calibration run is edge-triggered rather than a user-visible mode
so a stale alsactl state file cannot flip the DSP into Calibration and
nothing can leave the system stuck there.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 69 ++++++++++++++++++++++++++-----
 sound/soc/qcom/qdsp6/audioreach.h |  2 +
 2 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2b5c083b8ae5..130298a28749 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -5,6 +5,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
+#include <linux/workqueue.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <sound/pcm.h>
@@ -13,6 +14,8 @@
 #include "q6apm.h"
 #include "audioreach.h"
 
+static u32 sp_operation_mode;
+
 enum sp_vi_cali_state {
 	SP_VI_CALI_IDLE,	/* Not calibrating */
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
@@ -1482,6 +1485,48 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+u32 audioreach_get_sp_operation_mode(void)
+{
+	return READ_ONCE(sp_operation_mode);
+}
+
+/*
+ * Calibration is edge-triggered rather than a user-visible mode.  Guard
+ * against a trigger write while a run is still in flight, and bound the
+ * armed state with a watchdog so a trigger without a matching playback
+ * does not leave the system in Calibration forever.
+ */
+#define SP_CAL_WATCHDOG_SECS	60
+
+static void audioreach_sp_cal_watchdog_fn(struct work_struct *work);
+static DECLARE_DELAYED_WORK(sp_cal_watchdog, audioreach_sp_cal_watchdog_fn);
+
+static void audioreach_sp_cal_watchdog_fn(struct work_struct *work)
+{
+	if (cmpxchg(&sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_CALIBRATION,
+		    PARAM_ID_SP_VI_OP_MODE_NORMAL) ==
+	    PARAM_ID_SP_VI_OP_MODE_CALIBRATION)
+		pr_info("audioreach: SP calibration watchdog fired, back to Normal\n");
+}
+
+static void audioreach_sp_finish_calibration(void)
+{
+	WRITE_ONCE(sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_NORMAL);
+	cancel_delayed_work(&sp_cal_watchdog);
+}
+
+int audioreach_trigger_sp_calibration(void)
+{
+	if (cmpxchg(&sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_NORMAL,
+		    PARAM_ID_SP_VI_OP_MODE_CALIBRATION) !=
+	    PARAM_ID_SP_VI_OP_MODE_NORMAL)
+		return -EBUSY;
+
+	schedule_delayed_work(&sp_cal_watchdog,
+			      SP_CAL_WATCHDOG_SECS * HZ);
+	return 0;
+}
+
 static bool sp_vi_cali_state_is_failure(u32 state)
 {
 	return state == VI_CALIBRATION_STATE_FAILED ||
@@ -1588,14 +1633,16 @@ void audioreach_vi_calibration_event(struct device *dev,
 	}
 
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
+
+	/* Edge-triggered: the mode auto-returns to Normal on terminal state. */
+	audioreach_sp_finish_calibration();
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
@@ -1639,6 +1686,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
 {
+	u32 mode = READ_ONCE(sp_operation_mode);
 	u32 num_channels = mcfg->num_channels;
 	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
 	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
@@ -1662,11 +1710,13 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
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
@@ -1690,7 +1740,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	/* The DSP calls this field num_speakers for the VI module */
 	op_cfg->cfg.num_channels = num_speakers;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
+	op_cfg->cfg.operation_mode = mode;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1781,8 +1831,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
-		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_CALIBRATION);
+		rc = audioreach_speaker_protection(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 9d9449062b83..baafd3bcd0c3 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1114,6 +1114,8 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+u32 audioreach_get_sp_operation_mode(void);
+int audioreach_trigger_sp_calibration(void);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
-- 
2.53.0

