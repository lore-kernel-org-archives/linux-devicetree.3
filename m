Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364120;
	b=pb6y61RxEXAFDtO3fLmDZTIM7iSofHJYrvKh9fDIO5tQK2z5kDW59o4EY9KLRl7QKCgZ
	 U4TLA1H690T9vm90cZsSvpN8aNa7ix7SFLB4IDI6OihUsOYa/QQlZnVa7akJsOmwRtTpc
	 sSnbwIvUS4BWh9ttNcUyM0eEC1rKpm9Bh6/CbLXGMIIaSC5xllRU+7lhZQxl6VVQ3zuAm
	 HJWaP65jqCbicfF9wOPUdNz2Nu2A+CncWAd/5hOVWfkAlml71egL28y8w3v+T4Uyezl76
	 FJNSApxeB6ap/D0IX6D8DVYCH27/dRYEmDStQ5+R9AGH+tUQ0q9X9dZJA2R/OKLMrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
	b=lcSJBJaDphEK+h/ymhCIShfp9PqMjO1cRZe2hHUfT9ND+M2cwQyZqbXiwaB4T5+wnu2R
	 dZJ4uZW0mj4zI3beBsYZrrm6JvQOefqBI8DMCR98D+qXvJL87iY4E/4fLOA4u1uljeSc9
	 F8kKTnclyzmREbn7dc0/vrxJZgz1YdUjEQ0m8ARB3hgU0d0VZ2LVpRjjAio04M51rM83g
	 Wnk+dkCahszyd3IIkEQPOBBZRdVCmvfjaxYyZOsQ3F3cBGxHdW0WK5irw55y8baBa0gst
	 sJt2TzY2paUw6dlnItB9eMSz8B9dV+EBdKr4baax1Yi0eYiaotCsUdxErGIKucVnk3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DC060A2627
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DC060A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQh4p279729
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJ/t3yJRSO/
	I8Krm7cGvb9xURXfceDUgpjT74EYPghA=; b=mnr3WYf0RMNGwAS1YNEC2qcMZvo
	ddz23yc/mN33i1IAq9VcyeneKk6iYtaqJnOUdLuit7biAar9ZasMSpxBpW2pGokO
	0XG9aHzZwcLo0cJi7R6VschHqq0Jn1/GHYLOXqRNY1a6XTB4ia9EAso4YFmflJXa
	wlyrCnlZV8CWnjtPrmuS8mvcRL2Pxj8bS4BTUxsvDemaDSllCnkjQ3qOohqsLmXW
	anqnPAl6hs6vlClARhyPZemiCf17uaNlALmvAdndWoe0u9zJ7BWXWsSpIqR8bIdr
	Az8ZPnjXOtWayd6XXWh4v508JaKRajOatkt7reQBhVMex0F7N9EOT0S1KIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so436102785a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364116; x=1795968916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=D3l2cn3LhL/fO+NgI2ydQfHPum2bBeFF6S6SzD0DuXBbPrrszCCsvWkJFEjiUjOxN1
         /+GUmZUO3UTcDYnQwkzweV5hcImxX+Et/zioQvouwnf/IkUdZQcccKkGfn6vPQ13SYMW
         S0YSlxSv4z39+8itLx6MPzmolh7b8XRRWb9Dbmiu2HjXZbdyb7t3MMzq+SuEWwId0hqk
         t00INT4qYNVbaZubFuiJprTpUgpZCarwiW4gPP88sj2OE/to/SU1B+42ma9iu+OyiblG
         4JStK4KTQooH/i5Y3O45OfJk+lx1D9PW6ink5BGI8+a77try5lSMYg+7DDT7+7NCp1cF
         aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364116; x=1795968916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=tH4lxZl9jHlsEYMBKjFfNsThrQv9dH4d4Oo0UlrqmFsxyd3TFrV4WU8mDx4o+Zhu/j
         lM2+9u89RFT2vG5v1N7LV3N8MGoKx455hCd3RdpXtDKBNjWiqQAY2FkK2R9uczQtp8CZ
         fLheIbIkGZsd0wDC0Zrbfs2StpYsupHkjxdIKLkGv5g6meUrRkv+is6BKVU1ghiu7Lo7
         3RmLDtMNr6a4W5t6oGP20LPU6u2+syTtlexKhY0O+XJ+uP9sPumXSTBDaimer3lp6hnY
         F7RSkOzGbjVdNmF9v9hR/KX3EDh83oupRk+XCkOUmK1c1t1QIsGV8V/GLTX/4WtSJk6C
         3XYQ==
X-Forwarded-Encrypted: i=1; AL+hErGgJipGsi9LtVoEuYzmkCnZ4JnNs5++2OguupGA97Jizd9dQ+dwdKVvMjAHHNJxKSUDO4etKOOQwmtD@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZmZD1CKzrzd1Ju2i1wz3QTDyCKxqvRh/AvlosVGAbGgFH+vf0
	h6zdasMV7t0U6MIi9AFdgSNtFBxoyrzHyNS/PkCugo1RMnRGv5SeuivXIi+BbKni0f4EYdj1xM+
	slAxUYoXg6/bfJPUPIwsUVaPCuvuJCPFrFmqfU+UWaYACUSa3qdhOcde/6JoSI1hl
X-Gm-Gg: AZFdTZc8HqKvU7SkzCwhKk4aqcxfrKq399BrN7vg9EWWmTI8cj5UpDpjvHeoXnmK3tm
	/BYNKUe859/VxSOG8vcmk5Y6yYq+sM4oyqlxxnnYJPwnBx/ohz/G3Y3nGqk6ldPLasUjNYSjz/u
	FG9aE/GBNPBkRlsmc2+6ta1m1LFg1uRkcL0yVN/BADND4oUX9/ojCTLSsjSyrxFtUZLXSCKYq4O
	UvU95U65pIm2aGDzsHPffbUgwuzq+yZr7GW8Slyfn0JWUC2JuGcU1ZK7HAWjfTcZoGWyugYSV41
	YFnN+8smp7y1X4KC1HLAICW8SQYsiB45Bh7D8sc4qkJUgwf+zoYRtlGUIK2wDHAyIWguVijw2P3
	GRfsFd5AIfGzMIkZirgCpqaMk48wB9V5s1CdCBf28wPDuyn2o51wkN+g94Z1Lj2o6
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506516685a.40.1795364115965;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506511485a.40.1795364115542;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
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
Subject: [PATCH v2 17/24] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Sun, 22 Nov 2026 16:14:30 +0000
Message-ID: <20261122161437.5994-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: eN9pb4TB5nansQOyOwgRLARQ29OXwZ48
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX3F7gR88Yd/aw
 Fy4VMX4uqWzjISqGdiAynBn7uXNSnsrHahcOIoS18b3S3ciu5ACfKYNCW1LXaG+H/DIXObLRopu
 kIukz/AbSz1WnqDvOWlXQDVP3ZKJ0Oc=
X-Proofpoint-ORIG-GUID: eN9pb4TB5nansQOyOwgRLARQ29OXwZ48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX3Tp1nNsyU1V1
 ZLO1yqgNMBagQGNCDGdCIdl94qj28PqvGG6w+ddpcdqBWnfhBnSdCg6A55ObSvB8bok0o/UwlkH
 pGpwEYjKDVtTmbQ8i0Pbc219okBIHTde16vF6gOmhnhLfcmW9SbQm1spx5l/xH2xgQvMmFNI5Bi
 EeE1Lv8vjs0VwLJKHSo7G789TlC4Hgk7XcRtc0GUvmS5KwjLmRWAt65Rx56Dti+LrIIdOxX4mN+
 8o0qr9YpoTSqLgNwrojfPYrP09fmMMwSx1gMSn6buYgR3HtLwQ26WZf3MSGkE19POA1ijMhkMFD
 Mh63lOISa21obbBzH0wO0wAXk+hb8jEYeiMsTPyNpqhggiZKbig3RNDgXAP5anXDGv1X8c/T63z
 bPqmBiVT8T1tOsGUG3MmDKuAZkvkJ2S/lcV6pSBQ8leFDmZemRMfbKARtr1t/3S9i3T4rNIlQCi
 3AJQe+zVmhvr9RzVmFA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b031515 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

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
index 436d33ea568e..97d8585a287b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2084,12 +2084,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
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
2.53.0

