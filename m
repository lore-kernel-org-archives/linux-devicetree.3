Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775898;
	b=a/VuBZKPlLnGEj90FAhsOS4AdaUYOX/XbgHE1zS6Yc7Mi5fckL8BFiE4nE47ikFRqbz6
	 6mjA+8AX7vbrT3de0etdRvSbb3BQ6TJWwX9eVP8b39QvtynyvbIF5gtQnckUK3ao8qzgj
	 ghk6FB4PEMKN2F0sT1lSNFjh4Lf00wzRyJhIGHrzJ/Bi/HoVg5ID2AuKzYWrtF+4Fd04E
	 o4mJJZR2R92VrhwcAsF0CNHxB4ZGT+gHY/fOJZ7SyAPMu/ZRf4QdT342C/z1SMR8T4dcX
	 N8uZ2PYWMXeBkWzEI+68GE79s5yHfYoNN0+C7qAajsCG4WVsIP0Ic0G/LNofoKMpPTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
	b=EXUHp1EZnyaMPnSqr6G856FwkFDLHyXSoQTydl5q2NUNPpaHeJLR9ZCDssSzk/LAiqlN
	 J/bDDp+OSiTQzTub/2Ub2PNIA8lNN+fX+S3Hh4ogHFdi9dIfVWSZgOLINO9MhNyOgX8gm
	 DZEvjdi/jjKkv0sACUK0K+cpVAG+AdNcWvgDZrgQ+NnnWdyJowAzewvhUQPtcb3tNQWps
	 KKUOL7XVsdkjjQfKX0ul9jEBM1FY3mZ8PglCkpY8YllKNMgItxGQXX6pKRvSeed3vOawE
	 RJbBuiZYLwx9YPP2Egt+euBxYw5UMlUNDCRXNkHlAC4NIuWNkUqghk1KOR7HKWFlzRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634AE606A978
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634AE606A978
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5vWS4072851
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DZfg246TfQN
	Ytunz0I9gt0EsxySLDi22L36IzvOxp2U=; b=c9XFIlA28Y73lvz+5dq2//1lUGL
	VKgarBj45iMCPHAYBwkiMulg82OsyJ+MY7u20+5VgBmWCLyVn9tb0yWrNYLAkfiW
	4jMCWR41NOS87rNOvQj0atc8nyzqcaDNwz3zKbW7L0iPyBG/xkWNTXnd81hIK87l
	62gzZQhuVlCRXz+HMGm6bQB/HX6mf3KGHQVrRbBHzY3O4zIoS0THO2ijS+AvvQlq
	FGZ+8P15fL3T0Y8YEgz/uQY1B24zCJLQ7k0kv9UBbXQylJEcen3OezjNB4vHeRVO
	QvDyEaxTPqxF8BSbUhBdA0qOyFBcZgRb5euXhA1BYJrCPH3TggDpGCcTx5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so222500085a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775897; x=1793380697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=GT6jvuoU9QS3+S74DLDt6SKuUfyyWPUc3Pkov4dOw8QuSXxfY/sDXMliyC1YI4X3tp
         TO+8e8tcuK+UMNsxbC/mvFmhioFu9MrJwm3hXSZzkT+GGLW5f+3E7eDHnRWU3n2NDCvr
         DXuV4A9YHWPgcwVoklcUIzQdOIPDvamOS4IHKuiqN/S0QNUlsGuMEIGB5KDgNILVmPY9
         JJNqaDbUuHGFEZ7MZHnOq9xtASCOSCsAtrBhgBYRtTZ7xSeg9t+n+wpVyqCelJkA1/DV
         mOEr/E85rknnG5yOAo0uen0d3Z6shpxKB9yZI80FHW62ljL0vxtUpnYkKiD2+a0dCNQU
         IgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775897; x=1793380697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=WhJycjYIX/7+z5sT75ZYx9CifG5QiFVopXNjfRNLfAawplGyFKKSWU3XFR+pp8yyFc
         TGkh6EklijO9qXpUVsAHJ8xcUQPA5IE3HbBcn+oCo8XEv16+fhf5ksaLpEVIc/OLdKrh
         PLS7cBrWeB1fmyBqWBnpyRQM5Do+Ezn57qPZXKEpLT+WVKo1p9wYSBDnb7sysuO6b8To
         yHZpaI0DUspfkS+vEs7rAluTBXIXwpVAt2o45q43T4PrfFfg1sKQ10U3eeA+K0KBrcOK
         e7hqDzDlO5ycmqLJ5ve0ZqmulgudxfG+yvrhdRyTksyeuYTyJpQ1tpwNhA7LcLYsmsWC
         1jtA==
X-Forwarded-Encrypted: i=1; AKwUvByElFu3jaepi25EQ0Nil6cMb/P3gwEKW/+WRlqet1a1/HuYz4/daMbaKVp7W9ObGoM3fMJI2RmSjFqJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLXYrP8koXkG6mh9ImyFCuTgI9gBl9/a7MTjZO+5V7001lDxjSH
	tidQieyIMv+BZqWFZa9dGUwOB7h+sPkkcdmuz8spNorNQeWbz35PqwAwo46/b8NBwYn9safTfNZ
	ksbAS1WCDNQ3G9F9bbiT0L7hPq8XXSGHKR2umOPk7tgnTkqG39Dwkfs/FTA3+6Ev/
X-Gm-Gg: AYBFou2sYkYVuQIuQYRVln5Bu5U5/xohaldO+Sx+03Xa2LQu5mvkkIfdFIRUy0fvP2H
	daaT4isUYxDNpStVMpD5/MU+59PgVTe12WxfYfXLzO1T+CR616LkCt42t7sjIrMzlEpmLlgercR
	4naD4x/euHeH3bh1lAwGtQogd3DOt8ZXKde45yEDG6Ke1ORPewVG9Jd/AnGT27p7lX4eDWXtVAm
	Pz8Lo4JvPVhxK6exh8cQ40xZjBFZSpOYErmkJuaeJBGTCtbMRwRSymlTgnTIKkKKJTCWpeMdfSU
	xA6JJ9ATFozCHMfW1gN/S9d3GH5oF0D6dz9GUD+sgKBbbkQsZwrMVbOMTLcRU7cOOQnIhF73T4Z
	bpjmByIZ8wn45
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513761685a.33.1792775896773;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513755185a.33.1792775896248;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:14 -0700 (PDT)
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
Subject: [RFC PATCH 16/23] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Fri, 23 Oct 2026 18:14:26 +0100
Message-ID: <20261023171433.820092-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: S3Y8I6m8Csf2Qh2p2566NefmmY6zfEB2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXw1knRq7LdSi7
 IteWzKTnYzfeg5glFXvHZWcQ8W3E7yaQq5FVLVXCcK4h83Dncruy7Vo+ODmm8U1nPXjqjFZ4g+P
 gjC6jsjCbhK81UOTBwPOJ8hvTQ/NVS0=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: S3Y8I6m8Csf2Qh2p2566NefmmY6zfEB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzGEVMoClFE47
 tf8gsxo+HhtTiXpNJjWgDJb5mqfLRfAXUIasBUHl2+jT4nz0XwPSG2ruFJgrYjbeWqqc/+wOArX
 RXmh7YyhQ6mU4kJ1n4LEuEDlhn2NSnTPuwsegod2rj88nGzsKcjBW8LvGqUvUKkC9Il38RoBecQ
 MZ50jFUGYTphiHe6AUaFWvxHel1MtG0Bzc3c060JP1hveQn6zGhLg18nG5rdl8K0ysQ7rLP5wR4
 fe9pBCpUZf4lz7C8YhGs3W9Nk96w6FEZPROxDbmtrjDwDh2YqoASpG6rE27M25r0UB2LVs4l0gF
 3OyXahCIZVg7kE0q29/V62YnxI137cVGXbDVJq3vrWXGCzjITqu4kSXHT2S8gga0x3CCr7+5UE7
 O++ZzJbyXRdkD5X4sLUYMgRb94yw2a1oWDws6i0KDoK8tdCUlhhw89GihGpfA7lRgmf3fYbRwiS
 FhGF2yXWtZneTTptszA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 089cc9dd76fc..d027c763eb25 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2033,12 +2033,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.47.3

