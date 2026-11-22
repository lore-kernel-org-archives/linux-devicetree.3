Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364121;
	b=cC5E9xB2EQdxBLbV7iVYZViZpln2QUru466Mh1kk6aW/sM5bsjd3tV9mG+31JN6XoPeQ
	 qaftjcWyB+rtpoe3niDievZYVRad1uMtsUcltrvgXJtLdUvkBO7/lhYE1ENeHrSms0iOj
	 St8vaNAYSbXk+k+z2IWtv/Pj4byeBwXS/HAapqucHqLbniZqPNx8Ey75E2DWskmtvnNZ4
	 h9JAgnYJ6vVzFlBPb1lQdTbDWB86QC2OlfOPzbaTkBSxDjAjVH03wADK1Dp6g0XClbXZD
	 rJGelNJ5ZkPJ4F4XBf5hNtplh/EVTGB4zLwd0NVb6SXLu8FboMV3s1ybAfUTzsnkdbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
	b=a3lM5D3+ncvlST3v7rdx6caUuambhxP/p8GwQ1VH39YSTEyyTCAX75g1xvpTScoFNahn
	 9WGSS0j8Shk8XEosl/K2tgTRGXmz8t2NoOJYKrOg6LLcUufWyTEdHqvfRX/FHVzdYPPGz
	 l4/dYEG3nuzkv4I1cvR7SlfwrP4Vovobf+rHrzPuKU/atid7nukOCXDqq9erLC9hZS+YO
	 KFjAUr2D2iSi0RsEqwOETbFgWW3uiDVT+6HZzh5ihUwnLzEeZ4l5W+NpYkX1qKcVLgWij
	 Uet0kqV99t9c+ewMEaq3mhjAsLPu9A25W28/bsbKbnxn866QNoUaRAHuiWMaebUVN0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XN3pzoI9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B25LNiG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD9B606B8E7
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD9B606B8E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XN3pzoI9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B25LNiG2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFRGPV3384160
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iysdng1dCLf
	+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=; b=XN3pzoI9g3MzpnwybLHow8JiTte
	/qGsd9azDNcxVyNUWXgVxCRTRtWI94bFsgXFy6JGZTbQ58pR5+ku1OAMQYxttu6g
	tW7/CBws1aImrd0rp+J69hRW/POPgmG2IQzlLXuPQzpTLW4uNx1IDVImDo/WaFtQ
	/FaMXCOLgjusZhngutkNgEsN2PKkjFfKNeLvRHaCoNKPXgth6KFxbBJf9vtMzVyD
	XZt96YmWf//gaZV5dczYojjBIbdybMmCWKrUj4L+p9WvgM5VDJTwlXd747HdsNMl
	OmQ13e2reVxU+/2AWFywSyQdXRbNj0FiXTCMJNV30208p7hSBVBOjcTVPtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so501818085a.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364119; x=1795968919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
        b=B25LNiG2sg0/nIlv+40CfRZXIHSowjgCAJYtyw4wiu74yymO/oMFGZBndfrjfRLdly
         reaSh2r7DLfC6vJsMo8MuC5egxZ5bput6pj7b2QlC9Jup77lZt0h0hCf+OVs/N8h8n9j
         ulUo9HXfC0gNs8xddloPSZJEURzrKiB9ZJ9WXUtu7Kv9Rl+AOWHMYijWR+8cUNLeDFaj
         shubxX83ywjoUs0sfJK2kHzu3wGLBdM7VT6r2mVXA90/1T+iOoqu43ILdbLejmGBDft7
         TLMk1xzISSkR5kXe2I2hxRjhWtY/RjGVnRZpxlSMWNneNQBIgS+x/l0ulrnamW/uIlMC
         i81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364119; x=1795968919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
        b=LTyYRAGP0iHxbzpy/ZVR7ZUSA0ekVdnh+gGSzuvW7qDRRJ2SYTzDpjMRkJCzI5P6da
         RmlD3nR86vq6k2EueM9Nv+/IQo7OJjDxvXUp1deW2CcFA/4bvKPzeEWDBUAgoq9EFQEY
         wvruEOjUjU6XAQLL2XfVH+d0YuLvp56GHRpeDkXSsN2YMftn1w8knpYSm71uEqLhLjKj
         +UUrfRcOMkCPuXc/n0amdmVeLP22otwUVRfqQ3z67S97HMoADygHgzjo3atCV1I7SDC7
         aldF4Xi5nJ3Tkn2ja5+a1IFnDSZJieuNp9Ua5PlGyhO1fI1FkqTb2yFFwq1FjSKVwJPL
         kpYQ==
X-Forwarded-Encrypted: i=1; AL+hErH565KgZNfmAc2BTY/RcsUNWccTtuIfQ3wsLnjGFrdG2Qrg9I6MdPFIU2iKRnKmBjmE3xU7H7R4fAsH@vger.kernel.org
X-Gm-Message-State: APuU4Z+0xWu4oaeg9T0WpF4/Y69dAumW3IfQdlchI2nPK1MbzgXQGA4h
	3dTLyy7wc20CqsKRSdm4mftDiTGJGpImRK3/hRiIiNbiODDC/FuIrZ/wx3p08o/LTtUaVhuVE3K
	0to9wnCHE0DBySeoC3krducPsfrXqNln3cWHn+yc+4kgrTB2bXRqNiNrjV4XTxfAj
X-Gm-Gg: AZFdTZcN4WAIvZ9y+CFtpT8FCFTM1bsELZbMQiNt91DmiyV4gE/3fgwuDN6w+CPc9o9
	EgPTbO7NysAkL9ppmg1ILutoZ+JJ1CKsNddthvCE1+7gc9aZsFghy3OUTGVwEdkft72KygIL7Lv
	Mx5L636+TWForYuua4rFKuRkTyOYxdvGgvLbc1Lu1EcsBlqwuK0XG8eEVJ2JabLDZ8a8CjHtTXq
	YFigDUVytZzSrWtYRwE3xkCJWtZ/umQ2zNWUYDQAYuzvIGHLQG8+PQImY1TWa7h79/PAF3VHRdy
	nc2IXt1IxOho2qpNf5DXsZxGHGsdaU5oLAX8rh0dF0eR/2yCVYTtv51wOIU7xyM2OmF2he5c/xb
	Pib7OAsKjRv/bh6jDpwSeboV4Kv2u1wbutG737+MsdAfuBt16G8VFiyFHmLR+aRP4
X-Received: by 2002:a05:620a:6481:b0:93e:592d:f5a2 with SMTP id af79cd13be357-949ba823313mr1496326385a.11.1795364119065;
        Sun, 22 Nov 2026 08:15:19 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:93e:592d:f5a2 with SMTP id af79cd13be357-949ba823313mr1496320485a.11.1795364118528;
        Sun, 22 Nov 2026 08:15:18 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:17 -0800 (PST)
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
Subject: [PATCH v2 19/24] ASoC: qcom: audioreach: add speaker protection calibration state control
Date: Sun, 22 Nov 2026 16:14:32 +0000
Message-ID: <20261122161437.5994-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b031517 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=w_sgUqFDBmVKUPfu87UA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7GQ1vKmbHNv2
 F+LqlL2ty1WKTmqdqgrqCcbOCauoOTkvRQXMnVO5F0ODZZQCP4oVz0n5AjmFpbpVkcyzw2VvIVi
 c3FY2ueZlHse6lqnmcwC4GE1V/taxZ4=
X-Proofpoint-GUID: 3q4ikbG3OJgwv_vNZaw_jgNh5_bXb3wG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX4V91VhTH28Ox
 O5rNPd9vqUJiYlK5ePs1fPhBQ1VyBB+9z7H4dPeSa4DcrFUvI0FpBvEFeAPYqVQB+8RxZQAaVGA
 EaSxkTcvke3tSM9MSpcsz37uNNmXCMjWk/yudwE1MSn/mtHDZyBylaC3XnrJ3dcRXngXEwf5FSw
 xfya5kNOiGlILJwuJ4KwO4rWBDtOp2Ge1SAealU/9W2Upu94pRbxyHdZ5yn4xqbEx+ervkRYL71
 lgznTqa7B9ehrVUOHraaanrkYBbSggVAaPB1dgMgeFMdFSGcqm8cJmyhtfw11LmB8DesRFaQ2NG
 3aKnIg6/VIPjtz+eARtetlXuqyQOzmsnqBSLFh2ljXIyTqY81pESmSzb7Eajj8ijM5mtPm6lyI+
 pyBSyYM0lHgUHDWhw1SLOBB7+cUIV8762wl2yKciW9xC2+FX2BO1BuOIUSzNCd2gZzaVSlbHkKb
 sAWU8gfM4tcS5LGZRtQ==
X-Proofpoint-ORIG-GUID: 3q4ikbG3OJgwv_vNZaw_jgNh5_bXb3wG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add a read-only "Speaker Protection Calibration State" control with
each speaker's last calibration state, so userspace can follow a run.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 60 +++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  2 +
 sound/soc/qcom/qdsp6/q6apm.c      | 15 +++++++-
 sound/soc/qcom/qdsp6/topology.c   | 63 +++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2bb56933b9de..f1e454062ece 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -22,6 +22,7 @@ enum sp_vi_cali_state {
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
 	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
 	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+	SP_VI_CALI_ABORTED,	/* Graph stopped before the run finished */
 };
 
 struct sp_vi_r0_result {
@@ -31,6 +32,8 @@ struct sp_vi_r0_result {
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
 	u32 seen_states[MAX_SP_VI_SPEAKERS];
+	/* Last calibration state per speaker (enum vi_calibration_state) */
+	u32 last_state[MAX_SP_VI_SPEAKERS];
 };
 
 static struct sp_vi_r0_result sp_vi_r0;
@@ -1657,6 +1660,21 @@ int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
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
@@ -1743,6 +1761,8 @@ void audioreach_vi_calibration_event(struct device *dev,
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
+		sp_vi_r0.last_state[i] = state;
+
 		if (sp_vi_cali_state_is_failure(state))
 			success = false;
 		else if (!sp_vi_cali_state_is_terminal(state))
@@ -1805,6 +1825,46 @@ void audioreach_vi_calibration_event(struct device *dev,
 	audioreach_sp_finish_calibration();
 }
 
+/* A run cut short never reports a final state, close it out */
+void audioreach_vi_calibration_abort(struct device *dev)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
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
+
+	/* Edge-triggered: the mode auto-returns to Normal on abort too. */
+	audioreach_sp_finish_calibration();
+}
+EXPORT_SYMBOL_GPL(audioreach_vi_calibration_abort);
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module)
 {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index fb3f2f61e2b1..4db93c7f8829 100644
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
index c410e2f6e6a3..35daf763287c 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -815,10 +815,19 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
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
@@ -854,6 +863,7 @@ EXPORT_SYMBOL_GPL(q6apm_graph_start);
 int q6apm_graph_stop(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret;
 
 	if (ar_graph->start_count == 0)
 		return 0;
@@ -861,7 +871,10 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
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
index 0e28c68c735d..a19efbb889a8 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1548,6 +1548,45 @@ static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
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
+static int audioreach_info_sp_calibrate(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int audioreach_get_sp_calibrate(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	/* Trigger reads back as 0 so alsactl restore of a stored value is
+	 * a no-op; writing 1 arms a single calibration run.
+	 */
+	ucontrol->value.integer.value[0] = 0;
+	return 0;
+}
+
+static int audioreach_put_sp_calibrate(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	if (!ucontrol->value.integer.value[0])
+		return 0;
+
+	return audioreach_trigger_sp_calibration() ? : 1;
+}
+
 static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 	{
 		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -1557,6 +1596,30 @@ static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
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
+	{
+		/*
+		 * Write-only edge trigger.  Writing 1 arms a calibration run
+		 * for the next (or current) WSA playback graph; the mode
+		 * returns to Normal on its own once the DSP reports terminal
+		 * state, on graph abort, or on the watchdog timeout.
+		 */
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibrate",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= audioreach_info_sp_calibrate,
+		.get	= audioreach_get_sp_calibrate,
+		.put	= audioreach_put_sp_calibrate,
+	},
 };
 
 /* Kept apart from the topology SP controls, so FEs have them without it */
-- 
2.53.0

