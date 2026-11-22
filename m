Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364098;
	b=CoG6qs2cb5eauT4Jg9QhrHVNNnhKajTkWFHb6MJyHKwYud6ZtviTdmt5J3OkUcm3VtSm
	 GYS0PyWix7u53XNIkYVTHoycW4TC3mfyXyNVOPE3tq55cAYl9wT+kH9JunVOlUhEeGU/J
	 MzVVTwplBXn57E7NzMvY2bEnklH1AYVYcl3QC92IahkUiFpeG2AfVdXBXl9NvRc0wzBxI
	 XA0hqN9YrzgoHcumHIL8n1DCbEaBJti9hOBIWNoBrzsSDVXcjS+sF/HyGUnCn88gkgYK2
	 YXHiQUN4kEy9rQD1b2HTOahhSgk49oV4eOrdNTAISoWTHlWTkztqU0PFOFKLdDnzh/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
	b=ZE7cEacsb5Ym7DIrOIOI6Z7u340Dh90iC57ajiTKjFgRDLbeNcBumcojIqC3zjN1o+e7
	 loJMejeWKro/ey15DOgrSc4qeuO9x3GybOGrvgwshHApWBx6yqGDaIK0O2GHa6APbdxxx
	 k0kt7M3L+laC01m69QtYfQjahr4NV8N+ehU/u11/HlHGEzjCOgmDdUi59YFq2MF0DlUo5
	 Ad0fB5PSEwdwXa6BSatT6DUp8Js1wLklbuuezq5Y5YLLHBzsFOPs95wInBrnA5aW6hU/c
	 dodXd+m4PsmYow6N3dAKldAYRRt+m6ac0fjtWpLkNkdsJVxBd6tCHrqqMAIiE2uA9bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CE60A2603
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19CE60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQbm93496391
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CK8GS13yu76
	IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=; b=iIQMXipOBXcfer219SBFft7VYCe
	+Id8znt7MekKPgySSZ14jJyWkBiB+MSVe3x2b4PRdilfmK0+IgS5NjQeW5WLHWM4
	pw94meLN0i77Ge0G5sD65LM/+PRC5zlPDZjQYpV/ymU8oCEdxkVPvSQ2JTZEZmNe
	6Qih8c4tpER5SUKDFs/Y6aL3PuRxPhhwuto9xMoKSfL4YtHZxTV2mG7r39/bUYQg
	cGsUXumqzR0vZrmPBgOfV/cKQP1Tgv0tofMnc7Fh0yX5TTSSgPtS9OJ8JT/A7GjM
	wNhcJSaiR9xZRL8aeB7DasFiPaZ2uyFgn5PkR0ztVroZzK3so6aN3+Hs/Sw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbtty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so436075385a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364096; x=1795968896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=JRppqu18YH5PHHQEo+s0GZY99av/5p/zbgiMImgU1LvV2oR+Hqa5+9j4f/37ohGgwf
         4O0WchXPoebdpQBX+6wUBkl191k6O/Jwfp7RvYIk3e7u2fVqaTf94NKru8vrGm0ieawx
         Rz82+Nt4QedWm2GET/zWwZvkfLIxDDRAGQ9WOZyw9jHsz3LzL9EQ2Vmu+8g4YRsE+Dfa
         c+j2hRfuBbkJGQC+rBnpKpUy8DWplEg3bEbkg+AEJdCUIt3N7GL0TW3M7+mlbvBKbN4h
         FHBzC0ciL47GU9IgtXTfygXxkD6gl528ImhZbOvg0nhRIUsvOERzGtbDeLSV54DxFN/K
         bs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364096; x=1795968896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=p7K5GFzGSqO6zQsy8H/pgmr8IDe+yvT/2uI8InF/NgYjRNDjZWF8riE7jHsJXnO9XF
         Uwo+OKTZ5D9Qcpse4pUytL1ZLMNgO1UXMBxqEgNfzga3R+crHQb2XXkQjPI+xv2Hc1EU
         PKdZ3YnxNTcRtSCQgPVSpuYbhxerQ5dmoYBIGjApEPS23wg4RouUBzRRF8XOverbxEed
         M+xqLDjAyqaPpJK9+m5VQCGpNGhIoKwwIKfDhHojorgeXCu+0LdT84rUQMpArddVLKvB
         3tRiIAsIW5EACY70/xpfPw9R4qImaW3FAh5VF+Vfx2HW390xowU6xaZDlCg9s/Lh2ysY
         rzSA==
X-Forwarded-Encrypted: i=1; AL+hErEMdClYNPjkbFCUAiJFUTYgy2edvUHrVMeGOmO7+5RiRkqtY070Vl9LNYrS92j79VlA9NOPAn36mkGb@vger.kernel.org
X-Gm-Message-State: APuU4Z97qmWeJb4Zj6wSUgun1oMBLxU2W2g7eaT+Xw9eizpXL0AX1PBc
	9SMbhpIctHr55twfYyIuU337gS060jKLtkvWGFMOT43tiRsLJ67NWut3eTSypsdHPzCP9gU4TsB
	qqWJ9A40vb9HdGG0LYAqBx9SqtkcLauNOvaLokYNEpo4QQvwaVJODqjtsFq6khzNn
X-Gm-Gg: AZFdTZf13Rs96gT24O7iyz2ke/3fwToMXg0QrjtUa2+YKqKugPXrrjxu1sMgVDB88Ic
	9VePJm20XzQ28YKh4rRmCWvdvdv/lkVEAZFSwnAzkoP4ZtBVpVI4H16wm185Bsp2vhE0vgv6NTg
	1FxaUmxpQF5Z2+QtkrKHTC0+NY67RinR5qrHGShd9U5Ce1p8scVj3LF4pxGSNJLp/wEVwBpD+8t
	gA2Uca5XlTcarjkgbiA7pU+y4cvCjYRDumPn2erCukI+SK7bYe65pCtwFPr1oPVv+7h/zBewHdg
	MkTK22NShhYLB9HoG3YEQDUOUQ1bbZhltpnSsevs01e4ZtOfw7WrW/lNyp/aRpVzOP5/DAxpaTx
	3mNvkalKPIqbbvgjFpTKHXvKM/bjS7Ck3HtuyVoLFQeGKLWw9BcDG9e3Q0YvN5FJR
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738824885a.72.1795364095877;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738820485a.72.1795364095325;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
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
Subject: [PATCH v2 04/24] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Sun, 22 Nov 2026 16:14:17 +0000
Message-ID: <20261122161437.5994-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9mAVSHSygY2P
 wMl2CUgbnAP52O3PZUEgJT/QVk71UdaqbL1qo9In7etyJOVF36JHpZVlZeR6M0gmeWzXD8R8IOA
 xsEdVz1Jsh/Cd0PY+wh/tO0oC8rPPIPLPM46el0qNiKhLVnu8ODGDchoVz0su8m3EfSALPLdkTH
 6vEUKai1qSHyJ/EL4KS8YFXD4LXAqvJbVsmBKttlY3YWalasqiBUCk0j6C0l4gYmXmvRwO56kAu
 osZLuKYcFMOc0EmTcJN13hjDUFcpqLAHo7p9w8F/uEbkeSolCAHYTbjeXjDUWKUkBdw2+L7eXeI
 pjxvQdxCRE8SQxvh+uhiQ5uOBwrnxak+kKTJD51MjZjgkBrSzTM9T+h04+Af79dl1m72ahjZ5aK
 6/0GLrSGv+LjKi1yTl962wjYYEbYscLRMbUtux0U+x3GWRVTyTOgxRONnbyoY+bmBMuyXe2/nYT
 wHqwWapyR7icGVxychg==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b031500 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NbmS5_GTq9OgXFR-vLoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2Wu5YbZg3t/g
 +L2Fq8BFkJ4X02bSKzXl0iU7xNrrPLqxNPd0s7c9wCFNblamZJfC5YyrfUYjXWrlHPpy0XuP2yG
 YEXyyeBNJR7H2L3EJIJ/cNZ0RZhtlrk=
X-Proofpoint-GUID: IQ5PM8MgtpSWoMLPij9-jXZdV8RHuGNC
X-Proofpoint-ORIG-GUID: IQ5PM8MgtpSWoMLPij9-jXZdV8RHuGNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links. Stream runtime names
are suffixed with "-Playback" / "-Capture" to keep debug output
unambiguous. A small sdw_find_dir_stream() helper centralises the
"find the stream for this direction" lookup that was previously
open-coded in each callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 225 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 171 insertions(+), 54 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..953a6eaae127 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -5,9 +5,55 @@
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
 #include "sdw.h"
 
+static struct sdw_stream_runtime *
+qcom_snd_sdw_alloc_stream(const char *cpu_name, int dir)
+{
+	const char *suffix = (dir == SNDRV_PCM_STREAM_PLAYBACK) ?
+			     "Playback" : "Capture";
+	struct sdw_stream_runtime *sr;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s-%s", cpu_name, suffix);
+	if (!name)
+		return NULL;
+
+	sr = sdw_alloc_stream(name, SDW_STREAM_PCM);
+	if (!sr) {
+		kfree(name);
+		return NULL;
+	}
+	return sr;
+}
+
+static void qcom_snd_sdw_release_stream(struct sdw_stream_runtime *sr)
+{
+	if (!sr)
+		return;
+	kfree(sr->name);
+	sdw_release_stream(sr);
+}
+
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +95,42 @@ static bool qcom_snd_is_sdw_dai(int id)
 	return false;
 }
 
-/**
- * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
- * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
- *
- * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
- * Soundwire stream runtime to each codec DAI.
- *
- * The shutdown() callback should call sdw_release_stream() on the same
- * sdw_stream_runtime.
- *
- * Return: 0 or errno
+/*
+ * Allocate a stream runtime for one direction and set it on the codec DAIs
+ * of that direction.
  */
-int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd, int dir)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
+	const char *cpu_name = snd_soc_rtd_to_cpu(rtd, 0)->name;
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (snd_soc_dai_stream_valid(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = qcom_snd_sdw_alloc_stream(cpu_name, dir);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime, dir);
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
-			goto err_set_stream;
+			goto err;
 		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
 			continue;
 		}
 
@@ -93,59 +138,106 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 						  &rx_ch_cnt, rx_ch);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
-			goto err_set_stream;
-		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
-			continue;
+			goto err;
 		}
 	}
 
-	switch (cpu_dai->id) {
+	switch (snd_soc_rtd_to_cpu(rtd, 0)->id) {
 	case RX_CODEC_DMA_RX_0:
 	case TX_CODEC_DMA_TX_3:
 		if (tx_ch_cnt || rx_ch_cnt) {
 			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				if (!snd_soc_dai_stream_valid(codec_dai, dir))
+					continue;
 				ret = snd_soc_dai_set_channel_map(codec_dai,
 								  tx_ch_cnt, tx_ch,
 								  rx_ch_cnt, rx_ch);
 				if (ret != 0 && ret != -ENOTSUPP)
-					goto err_set_stream;
+					goto err;
 			}
 		}
 	}
 
 	return 0;
-
-err_set_stream:
-	sdw_release_stream(sruntime);
-
+err:
+	qcom_snd_sdw_release_stream(sruntime);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 bool *stream_prepared)
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (!sruntime)
-		return 0;
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			qcom_snd_sdw_release_stream(
+				sdw_find_dir_stream(rtd, substream->stream));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
+/* Prepare+enable the SDW stream for one direction. */
+static int qcom_snd_sdw_prepare_dir(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct sdw_stream_runtime *sruntime;
+	int ret;
+
+	sruntime = sdw_find_dir_stream(rtd, dir);
+	if (!sruntime)
 		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
 		return ret;
 
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	return 0;
+}
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (*stream_prepared)
+		return 0;
+
 	/**
 	 * NOTE: there is a strict hw requirement about the ordering of port
 	 * enables and actual WSA881x PA enable. PA enable should only happen
@@ -153,15 +245,25 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	 * accumulated resulting in Click/Pop Noise
 	 * PA enable/mute are handled as part of codec DAPM and digital mute.
 	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
+	ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream);
+	if (ret)
 		return ret;
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			struct sdw_stream_runtime *sr =
+				sdw_find_dir_stream(rtd, substream->stream);
+			if (sr) {
+				sdw_disable_stream(sr);
+				sdw_deprepare_stream(sr);
+			}
+			return ret;
+		}
 	}
-	*stream_prepared  = true;
 
-	return ret;
+	*stream_prepared = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
@@ -187,9 +289,13 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+
+	qcom_snd_sdw_release_stream(sdw_find_dir_stream(rtd, substream->stream));
 
-	sdw_release_stream(sruntime);
+	if (rtd->dai_link->multi_direction_codecs)
+		qcom_snd_sdw_release_stream(
+			sdw_find_dir_stream(rtd, substream->stream ^ 1));
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +303,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *sr;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (sruntime && *stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
+	if (!*stream_prepared)
+		return 0;
+
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr) {
+		sdw_disable_stream(sr);
+		sdw_deprepare_stream(sr);
+	}
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr) {
+			sdw_disable_stream(sr);
+			sdw_deprepare_stream(sr);
+		}
 	}
 
+	*stream_prepared = false;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-- 
2.53.0

