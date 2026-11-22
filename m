Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364101;
	b=y0Qq4ZjnaKu+s3izUUlTtNMyJC97FdINVRG7rbbVZzA0epnXgDDPEG1hTrifBGP2mf4r
	 1AD5rEVa/LL6iU+ZYfc9XMSwEq7pQFjB704DDtHua0PSEYEQ4JYF3/jvPlmA6JvfgoUa/
	 Vpskeefrevy8ky2+PLMbeXRCOICv1sZbzf9tWS+Hn0OqadLF853/MAwu47KTvfnu+bWTv
	 ytIM82FpsftA+eBQK/hr7ABjZa3X0DqePPVl1sS5W8Yuleuuboe6v0lPC9npQXGnOc3rO
	 TmkAcMdTE2Lu+KkS+fIIuVCmUNIkTTW1ZpVcwLBaA1zBSW9deaLqHcCXCcljEOZsCzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vj6W0qz0lVqcEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=;
	b=q2adVQKQNrrIx72YFoEBsXx5l0TsULZpbZfZ6uQSTA1CEonioI3Qm2LV0RiWaFuATPx+
	 2VhIfEjije6HYjGDey3Oz+/Ydhj4O/2HbiZzX2h3sncDyeY9hobafeH0fUMXWDpnyKQu2
	 6WqpeQOC14JRswDsdlK4/xLqW++DCSQ5TJPNClyVBtcC+YeXK0TbgLKIblkmO2evjI7v/
	 JyApWQ2AAPKelBa8VRhC8SYo5+rs8kyRhosdBpbxQQRq4jpd05tLTPpDWs7eHVZYvYQBg
	 /tGJLIRwYICfi82qnk33uaibCd0R/L028cL33+TZumDT1SLkbkCtt699YqfkWC5IPmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3PFhNa+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJc0Da6L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CCF606A69C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CCF606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3PFhNa+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJc0Da6L
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQI8w1854875
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vj6W0qz0lVq
	cEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=; b=G3PFhNa+ZVL0wak1CsNwxu6K92Z
	u2NROKfMkhYpBeOnvzSoxwyP2q1oLsDf2v9UoYlIq2qMTpA6iJhXQUpaLxUq90cx
	3r3eNwVxVpzygFbX4PhtL5KjRKGxb0TbydiHqWGBZ2+swzaJ1O1Pk/yk1Vxo3dhv
	sYu/YDQbAZSOrGucvcS2fP5waiQ+RUoZrEkezzY/ieAxmFiVZKl0P0lTDl86s3b+
	dfGIWW0JS+9CHj0Dk3LlDD7+dvq0mWp3HDmZEfqmkt/+aGXkYfCugbXg0O21fAsC
	AViPq+VVOETJt7ZaNzFEvvaboiyvO4qPNAH3tyOI5C/bC50D0inQx7ZCLRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:14:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so278906385a.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364099; x=1795968899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj6W0qz0lVqcEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=;
        b=fJc0Da6LLomYikgBQgVs7Whf5yJ2g2L2ZG6mDoSPspTDd63ay/14yArU4GCOtF+M9+
         /e+xwwLunRVKk20x06uGc7HaKauge7RzwVxBnpxcleYI2KQalh1lGb64rJqhSz6T3HC2
         Y9BaNI5sDEg/QhfX/nOnx1jpXL/bG2Wn1W6oXUyqK/5AbJMl6lrxWMo8x70Gx5Uwk45o
         Gu9Za69KWftEnjE6755xT3pgqFLti1Rgivs3tadi+7Oer4OJYs8HPtRuLhdhQTZ9HSUZ
         X9pVCKMMO7q9VzvsH0pRraN+eDQ+QDcp8LX6eWok64/aLqfMCUdKffawl+uvsUbNuJB4
         PQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364099; x=1795968899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vj6W0qz0lVqcEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=;
        b=bqCO+O9geUfMV/9k0vb9heYEnrdUtV2bxTpqMip6P2jYvi+Wm5lFIBB0eQOhqgfn+b
         2x6s07Ik6VXoP9kqULewG2hxC7uYukrrqV5CKoOFhCrpkKGHBU/IN5n5a++gqdUqY/4p
         o50pM6Ty0TRu7fILWBN6Z8rAqobcgkEPjGU/q1Vnz+nxulS7L+b4XxiuESJOWlm9vN8T
         KFK8qhDLplDWqP4Hfnd7tuTxUeTFiJm1qVIWGIQAV73P4wbehBkJl86uZMMnUFxLmzPC
         R376tn6a3yDf50PyWIJuXfkUGa/FXg1YgztHrJmkN/NIcXr+mdfPwGtP0KIEkNZGm2f2
         V0hw==
X-Forwarded-Encrypted: i=1; AL+hErFQP9yeVa+vp4loD/QDo0y+uywM0PvuPpVSeqdCG0/bZllBJHMj7Ijnqa4tcvqg7Njy+Om6Gn/CZZ+X@vger.kernel.org
X-Gm-Message-State: APuU4Z990lPuHiP8xc7H/l/XAC0YvkxnZq6Se5ZbZRz4ykuerMSwX8yE
	yMiu5EcDxl2hU9hzEtRXgkdTcdNH/3lwKnOP9up9Brg6L0ts9ZYoS6VNOrWomGn2lHzDpSl3nRk
	4Uma0tqV3gI1+01lry6pkoNHg5jPwDX4v/ab/ZU8mf951KSkWEmBcK95e08uyflNh
X-Gm-Gg: AZFdTZc/N376f92SFHIPXpPhlH6Za0tYwxFa5VlLjnNG7y4G5ZtsWJkovs7En3FAmMg
	QRbCeErfAHs2KqPxK3WcKvwp04zrzHhbVOVMEO4/UG1xf2fqCAzi+g+witBAjBKPpfMbNqE8aqK
	72bm50t5/K3W4VeewnGX/jDSTmfUt1Y7ehSkxAKoRPJIvt8oHpBsaZueWmbzTv8ZA2s81nqHWH+
	M/rPRhyGqyOBCYHC+d2emo/svVCPgEoCzoeqdPuTkttE0jIZnlKpxAMr/DOIRibKlW4VWCORzUk
	NlvTh/C4eAMJ9/JojcpgGNdTM4+CNnqV88vrFK08hEKF7xYLAi/KSicKZqxIrY4XVYiNOlw5YGp
	nwZPPAU142MfWiaMEKK49CvB5JJ4Ht8d0Px/c94uCTGkDrMM3cdxjxe/tA4mc8CZL
X-Received: by 2002:a05:620a:2b9a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-949ba8246e2mr1521954785a.12.1795364098696;
        Sun, 22 Nov 2026 08:14:58 -0800 (PST)
X-Received: by 2002:a05:620a:2b9a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-949ba8246e2mr1521950385a.12.1795364098203;
        Sun, 22 Nov 2026 08:14:58 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:57 -0800 (PST)
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
Subject: [PATCH v2 06/24] ASoC: codecs: wsa884x: add VI sense capture DAI
Date: Sun, 22 Nov 2026 16:14:19 +0000
Message-ID: <20261122161437.5994-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5urx3baVK1ct
 kACVa+UucUhiVt6kqmP6OR5xxetRojHR9BMpwISKFWXQeumS/u26m9mXQbp0NZSYc+TBV8fgGy9
 jko/0waShFQhDjN9fqQLV2c8CCkwPVuuKu3AVJn96u1tZ3DKWS9r/+RltUJSy2PM03sTZ/K+RCP
 YYL/Lg3+RA4hEd5QzBtnxftpzv+TsmkdiiX/WGM8viVpl2kQvUX428SmSF9LlRZ5NJKMpVgbMdx
 FyuuhDlsXpt05L7ad+9d73A5qvXbMVODrkanrGH7KXUFB5CFTtjeh+9xQ59qp1FTLxyKvyYZXPU
 29AAZPJucMY8GaFJalKELcpq1TfP7zw3VooVLZfb1VZID0Q7OndEwUcYNjUMpy8nJ9q/PrdKMic
 KTU2MRSStO+bGzfvqhmMF58WFx9dprRW/Vn3pRjt+l9V2SJ+Gb4GrTOenT2a1gf+q/en/SRQEMU
 aeKYsYhcrb+9MMdaKxQ==
X-Proofpoint-ORIG-GUID: CNgD9UbSRaoY9spq0B8YcEI9fw9giUv6
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031503 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mD6ITISG3cOiDhduhQgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9JVsD+D2tw/F
 hIBARAvtWgSN639sEJOQBRTpjiByzxMa2O+SPfL8o0XSPXJDcvVM3DXYqJZqDxLiyEoeEimNS4j
 sisWaFfWBpDj+jLH2aahU6F8J2mTAMA=
X-Proofpoint-GUID: CNgD9UbSRaoY9spq0B8YcEI9fw9giUv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries the voltage and current sense data that DSP
speaker protection needs, but it is described as a sink port next to
the playback ports and has no DAI, so nothing can capture from it.

Make it a source port with its own capture DAI, ops and stream runtime,
and leave it out of the playback port list. sdw_get_slave_dpn_prop()
searches the sink port properties by count, so pack that array densely
now that VI sense is no longer in it.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 95 ++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index f58ce92c46d4..91aa004d7137 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -732,8 +732,11 @@ struct wsa884x_priv {
 	struct regulator_bulk_data supplies[WSA884X_SUPPLIES_NUM];
 	struct sdw_slave *slave;
 	struct sdw_stream_config sconfig;
+	struct sdw_stream_config vi_sconfig;
 	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *vi_sruntime;
 	struct sdw_port_config port_config[WSA884X_MAX_SWR_PORTS];
+	struct sdw_port_config vi_port_config;
 	struct gpio_desc *sd_n;
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
@@ -822,8 +825,8 @@ enum wsa884x_mode {
 static const struct soc_enum wsa884x_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa884x_dev_mode_text), wsa884x_dev_mode_text);
 
-static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
-	[WSA884X_PORT_DAC] = {
+static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS - 1] = {
+	{
 		.num = WSA884X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -831,7 +834,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_COMP] = {
+	{
 		.num = WSA884X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -839,7 +842,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_BOOST] = {
+	{
 		.num = WSA884X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -847,7 +850,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_PBR] = {
+	{
 		.num = WSA884X_PORT_PBR + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -855,22 +858,25 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_VISENSE] = {
-		.num = WSA884X_PORT_VISENSE + 1,
+	{
+		.num = WSA884X_PORT_CPS + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 2,
+		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	},
-	[WSA884X_PORT_CPS] = {
-		.num = WSA884X_PORT_CPS + 1,
+	}
+};
+
+static struct sdw_dpn_prop wsa884x_src_dpn_prop[] = {
+	{
+		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}
+	},
 };
 
 static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
@@ -892,6 +898,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
+		/* V and I sense pair */
 		.ch_mask = 0x3,
 	},
 	[WSA884X_PORT_CPS] = {
@@ -1767,6 +1774,27 @@ static const struct snd_soc_component_driver wsa884x_component_drv = {
 	.num_dapm_routes = ARRAY_SIZE(wsa884x_audio_map),
 };
 
+static int wsa884x_vi_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+
+	if (!wsa884x->port_enable[WSA884X_PORT_VISENSE])
+		return 0;
+
+	wsa884x->vi_port_config = wsa884x_pconfig[WSA884X_PORT_VISENSE];
+	wsa884x->vi_sconfig.frame_rate = params_rate(params);
+	wsa884x->vi_sconfig.ch_count = 2;
+	wsa884x->vi_sconfig.bps = 1;
+	wsa884x->vi_sconfig.type = SDW_STREAM_PDM;
+	wsa884x->vi_sconfig.direction = SDW_DATA_DIR_TX;
+
+	return sdw_stream_add_slave(wsa884x->slave, &wsa884x->vi_sconfig,
+				    &wsa884x->vi_port_config, 1,
+				    wsa884x->vi_sruntime);
+}
+
 static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -1776,6 +1804,9 @@ static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 
 	wsa884x->active_ports = 0;
 	for (i = 0; i < WSA884X_MAX_SWR_PORTS; i++) {
+		/* VISENSE is driven by the separate VI capture DAI */
+		if (i == WSA884X_PORT_VISENSE)
+			continue;
 		if (!wsa884x->port_enable[i])
 			continue;
 
@@ -1800,6 +1831,16 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int wsa884x_vi_hw_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+
+	sdw_stream_remove_slave(wsa884x->slave, wsa884x->vi_sruntime);
+
+	return 0;
+}
+
 static int wsa884x_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
@@ -1829,11 +1870,20 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
 
-	wsa884x->sruntime = stream;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		wsa884x->vi_sruntime = stream;
+	else
+		wsa884x->sruntime = stream;
 
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wsa884x_vi_dai_ops = {
+	.hw_params = wsa884x_vi_hw_params,
+	.hw_free = wsa884x_vi_hw_free,
+	.set_stream = wsa884x_set_stream,
+};
+
 static const struct snd_soc_dai_ops wsa884x_dai_ops = {
 	.hw_params = wsa884x_hw_params,
 	.hw_free = wsa884x_hw_free,
@@ -1856,6 +1906,19 @@ static struct snd_soc_dai_driver wsa884x_dais[] = {
 		},
 		.ops = &wsa884x_dai_ops,
 	},
+	{
+		.name = "VI",
+		.capture = {
+			.stream_name = "VI Capture",
+			.rates = WSA884X_RATES | WSA884X_FRAC_RATES,
+			.formats = WSA884X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa884x_vi_dai_ops,
+	},
 };
 
 static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
@@ -2091,9 +2154,11 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					WSA884X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0);
+	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0) & ~BIT(WSA884X_PORT_VISENSE);
+	pdev->prop.source_ports = BIT(WSA884X_PORT_VISENSE);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
+	pdev->prop.src_dpn_prop = wsa884x_src_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	wsa884x_reset_deassert(wsa884x);
-- 
2.53.0

