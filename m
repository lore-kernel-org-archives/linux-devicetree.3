Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364116;
	b=XM9Wa1s4hdrTTkwLi0Q21xHShHHfaKVs1uKZvBwIbpOMg0PP89Wyo9Xy/XzQVpzBcu4N
	 1qE0MFjJQnGR1AuqaG7RKilGvt1TuQ9PokdeH+CPIqVBMEB3LEut23S8AdiPwkIEBPYUS
	 uUjzficoH9wUNQcg9GlTBFakpKTuqplP9ePi5XqMhjDEldJ5/oZuiNWL9kE9ZaRz7o5gw
	 QF41etXwg+n5XecUGqd88H1yrlwAjcK2rOsKInvi49QKlRdeDKVzcTdSHoTHvqm0YUIrK
	 VuLqEW0/Dq3lrXn0PDiEENxEKkEpxO0Irfuxu8XUo8ragD4iZ09UjMppKkASpr3oaig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
	b=nmER0rdmExHdfbyz2yiNQ3q2kZ0nLXYdxllz6BK/O15VrdznwBkOuFOpL6Yd4HmVd+XP
	 gFD/cWT6A9O/t5bC0CPFFHDn4pwIgLhrJloMVm0OIIjIdrs9H3M3ZP6GbCbL97qZQzkB/
	 OZ7ydCXeprkktpAfaqDOKzmshDeLzNM6PDkjPg/2N1dpoxJnuCelKlvA4qC/fLtf7cZH/
	 amwyEDFu/YYk5fxTdKmdJ1u2h4g2lNA7Ntuf9IeFrI6dYKE7CBFWwI5MB07snVJY3Puxu
	 3H3MO5ZXBHhS9GUSEA+p4vi/Q97OMTeDWdHYEOGeG38QPpZ+94Nh035JeSaiw4WQRGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386FB606C575
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386FB606C575
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQSCa3382503
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xe9mNmGNVrg
	K7uWOt7PejiC56UqOuv9iVTxY26r7kf8=; b=lD2kb50o/CmUvZAkZUGmaOPR3zo
	ugh1ulOK+h8IWxdZXdl0ashI6+BSpcTNTwSWI7feOjbpnoP91r1f/o+wsi+CM7mn
	tPDKbNW1DhhAS72Eef6FaXlBgVvLep+oKtABMlfYXQI4WwQPmB4EmryCr5eEtgQD
	zBcsKE347dusT/KJx8ljOHmTL39ZvHMLA3p4Raupu7WkDBUDlCvEQXlEVGNoYk7m
	tSGoiaCprWWD6oQzm48yNbULcM+8p/XUW2bpqnmkWeL7fjVCkiFgqho4mOpyKqPC
	zc//MgbCt8Oc6prp+p9hCaeL71YKZlVIldTRI5N2Wnl0xLaTl3InBqrNDDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so427926985a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364115; x=1795968915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=PAUmqffozjd6kpMEtcqqtil4WserDjEBG4hsfIbq7RQN8wPEvs2dgCeBZoCQiSoP5U
         KaVw9jlPN6HxMmMVO17AbTxSpb4+mES2gl7pdAA6EzogZhKhJLxHmpLpWcWcoaMmVA2I
         nRulq6tNJoda0RuENDR1HWj7ABkWdHOJprqxXvGtdMYduJrk6livbs+G3GbjOSY8xPE2
         +zux9KallTW8izr9H0wC4zM1Id1AYjgPjfKl0EEFjlMDLNAQSIF+SiSQgKfJ3mZRMtL8
         CUMWuZ/CLRk9UcSE5NuoKw2A6QSVdvua+8zRmwdDAtrLJspvN1LlZaeCajEUtPqj5acn
         3Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364115; x=1795968915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=Nnb1NycSdY7lEYvLDjY8cKadBxkEzeJ08ewo8xmxBdL6zbWDlOjNmAmQQmZRUWRYYU
         IBBQZhWaIZ18p44QbT1Zg2vvBnkLndGXp5faHLgTSIZYMkLfpJ/2WS85d24MvVS/GpDg
         tmYCrmNzri7xblqiA9bFTArNGYAGbMrMrfoJnbj2Om3A6LKwtueOtjzzzcnX0bkRlEeb
         0JgnKSJq63ubVOLD2hhXJlPyrNx/acxDs86wFBbVyRK8kp2LwjmdLxsRI5Tj6L9bQmJZ
         eDZOA2p9xoVTiIQr8PMZoU4gMEgnmLGnNh4dICMP/Mgz/ngv8IJ2QeUUfO8IdIMzEWYT
         NlsQ==
X-Forwarded-Encrypted: i=1; AL+hErEURDrOXO7YARorrTp5+8tpJW09ywR0ExC8ankAxdBm6JBwTkTTCjNdjyXp9w6AaNrmNW/ksH3F5U9R@vger.kernel.org
X-Gm-Message-State: APuU4Z8+2qNyl/m/oX1DALSLS8K8ZSP2zmK4C6ulDD7KKyKNBGXKdCuc
	EgBMgDjq0pMZKeBQdzx4nJvTna+VrnvPd36r2Vw7FwGDLUg9TOSa2qWdWJF9doA3QxqGjzwmvXG
	36yCzZsSU8Sg8JO4Hg6ZUnmynCtZvbamE4ZkmdVrv9+cq7g9RCQAJ47olhZ5jpoT0
X-Gm-Gg: AZFdTZfBNkpySYOA9s5qv51YGj3jtEWA2msXxyT/ANRMKTz9y0gl/5iA0xxR7KPtKPO
	Zt1sltuzgPjABAHU/n2Ku74j+ClWRQ3z2R8wwsOnG8Bo11XLeAcMObIqq6P7VrZEszkBOT1+tzo
	bCx+6V2yrBxQkWsidJVemzKmnLBGi38iHWOFXqNxByX9gx28ZLt4g00peE2Bc9NRzyFbV+HD4Zd
	iLTJHSMsLz7C1WgI+7Oo9Tyzork8IW0ak7toi+tIej2OZS3Rmv53nxDIgs5dGzUZnSLDARus86P
	P1LO26Cbm5J3BDpDsBzk5qDf832g7cph3VJpGQxhHGxlsS+9ole5lUMgbn2xVJvVdI9z+3dpIeb
	+TmILDAfBnjXP/UAlbljuNX4+zw1s3QPkRyewtyZsCX4YzQk4hXYYCJ5WzsYZ0tbn
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619401085a.28.1795364114619;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619396085a.28.1795364114124;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:13 -0800 (PST)
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
Subject: [PATCH v2 16/24] ASoC: qcom: audioreach: add speaker protection mixer controls
Date: Sun, 22 Nov 2026 16:14:29 +0000
Message-ID: <20261122161437.5994-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b031513 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=z7hZsS5TAAAA:8 a=U_FWf4IRJOzsE_kR7ycA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=Qe1wxHrAD-1Q-kOd8w1m:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/GYHEOnOr2Zd
 lHDWomQ6KhkT4SLSvJB5G/HuI1RZwprdrHpBJ5pG0Z2RRxdskZAMUlQ4hK19/gqiXVQtOuolC8K
 AAcN+eqanFhyUJURnpGv8TfHeMskJ1Y=
X-Proofpoint-GUID: o68Z8hTo2Ap9ea7ZlmLaT7yJUxNvJOHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxEaKYpKvyJdx
 tXh7QdZgSohNz+8EaxkirGyXR4b4O2drUImzCyRu2D6ZcYWdIR29UcUl8ftn4yTkzkt7plzPj4V
 +7UwFxARa2maUkAwgPfJcOcJu6/KndDsaDqyXIR1FMuhokeuR73HzhCCTRdC9m2izKUmSu3yqSy
 ix68I2nZ519uypHvJ9HaaCNzk54/lTtbVUe72bU8p/y4tU1Tj505FR0bofyqO+/zqaBWsD6zWUy
 zEARz5q5S52UfdtV4sAq1PVsoxmKVM/T8bowBnc7deGTmTMYSHQGujdiQv4lznobjxJSonzTHsu
 30DajdNVKOf4puWQto+7VBFI7iVPugDi0RSMthmDOkWJGwPUEsM7KwaZOr3spJJ3BzfULnZXB+4
 +gs4E1wzMIAv4iPRddoAWOkNV/nIbp75Cgh2lCW9lIsksG++C5LbuUsZzCVoCkYGYsrpcBVKrIf
 rJE7zR9sUJv1k4PeREQ==
X-Proofpoint-ORIG-GUID: o68Z8hTo2Ap9ea7ZlmLaT7yJUxNvJOHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add topology mixer controls for the operation mode and the per-speaker
R0/T0 pairs, so userspace can run a calibration and restore its result.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  2 +
 sound/soc/qcom/qdsp6/topology.c    | 75 ++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 7ab8e11ca5c2..db62dc7f9c8a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -57,6 +57,8 @@ enum ar_event_types {
  */
 #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
 #define SND_SOC_AR_TPLG_VOL_CTL			257
+#define SND_SOC_AR_TPLG_SP_OP_MODE_CTL		258
+#define SND_SOC_AR_TPLG_SP_R0T0_CTL		259
 
 /*
  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5dd7f2c51d5c..c07a27bdd3a2 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1465,6 +1465,68 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int audioreach_get_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.enumerated.item[0] = audioreach_get_sp_operation_mode();
+
+	return 0;
+}
+
+/*
+ * "Speaker Protection Operation Mode" is read-only status.  Enter
+ * Calibration via the "Speaker Protection Calibrate" trigger instead,
+ * so a stale alsactl state file cannot flip the DSP into Calibration
+ * and nothing can leave the system stuck there.
+ */
+static int audioreach_put_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	return -EACCES;
+}
+
+/* One R0/T0 pair per speaker, written as a whole set */
+#define AR_SP_R0T0_CTL_COUNT	(MAX_SP_VI_SPEAKERS * 2)
+
+static int audioreach_info_sp_r0t0(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = AR_SP_R0T0_CTL_COUNT;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_r0t0(ucontrol->value.integer.value,
+				  AR_SP_R0T0_CTL_COUNT);
+
+	return 0;
+}
+
+static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *scomp = snd_kcontrol_chip(kcontrol);
+	long cur[AR_SP_R0T0_CTL_COUNT];
+	int ret;
+
+	audioreach_get_sp_vi_r0t0(cur, AR_SP_R0T0_CTL_COUNT);
+	if (!memcmp(cur, ucontrol->value.integer.value, sizeof(cur)))
+		return 0;
+
+	ret = audioreach_set_sp_vi_r0t0(scomp->dev, ucontrol->value.integer.value,
+					AR_SP_R0T0_CTL_COUNT);
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
@@ -1505,6 +1567,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_ar_control *scontrol;
 	struct soc_mixer_control *sm;
+	struct soc_enum *se;
 	struct snd_soc_dobj *dobj;
 	int ret = 0;
 
@@ -1524,6 +1587,14 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
 		break;
+	case SND_SOC_AR_TPLG_SP_R0T0_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
+	case SND_SOC_AR_TPLG_SP_OP_MODE_CTL:
+		se = (struct soc_enum *)kc->private_value;
+		dobj = &se->dobj;
+		break;
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
@@ -1550,6 +1621,10 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 		audioreach_put_audio_mixer, snd_soc_info_volsw},
 	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
 		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
+	{SND_SOC_AR_TPLG_SP_OP_MODE_CTL, audioreach_get_sp_op_mode,
+		audioreach_put_sp_op_mode, snd_soc_info_enum_double},
+	{SND_SOC_AR_TPLG_SP_R0T0_CTL, audioreach_get_sp_r0t0,
+		audioreach_put_sp_r0t0, audioreach_info_sp_r0t0},
 };
 
 static const struct snd_soc_tplg_ops audioreach_tplg_ops = {
-- 
2.53.0

