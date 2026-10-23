Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775903;
	b=YaF1klPb0GO3xT2Wlivs0OoPl1pDgZ4wz4YsLu/oOwf69o1egSSZeBrQ17JW4BR3ICwU
	 wn+CoprOx8kGrlpSEyeFmmaHdCYlMm8byAskSgM+7r4ww/3HCrTAHabvQslzVVrtStKXS
	 gbuzPYjPOukq9uyRoG6hCTDorqfhspb9Ogum3H8AeUN6gkYojIUGH3L/et6KimbyigaFi
	 WYlvZvrs0RuH4HeRRKoAQffhFqfQOMfaJyf32kpIZ67AeASfWGUv/Pw8yxMDc9PGcjYGE
	 xMESso3OX3fzbzj3N3RtT2OSZoxv+JK64BaklAtjsXXi/1YOEXKmm0xQVL9LpKnp72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
	b=N0lonwSTmzbw6oGh9eflYiFNp85LJm1xNr4tURCuyGuoVYWjufWiPdTPuyqJc/dtycVd
	 COENIQK8QEVoH8Dby5rvJf6JBeOROwINl4AvYvb8HTmJ72cvufJx8IS1Zh2R2KlHVb3YZ
	 leToAPtbWvBJPxBoHx7ZyHqiEdF+CDzRpnlVZbTMoBQr87G6efzIXL5vpA/6F/PviicKN
	 kdq9O8GzjacG7FGhIWhRX7hGjAsia6sd7FPMU5Op86LsH59gIZUDk3b+rv7Flw7ToRh9R
	 +nIetSCtehx/ff0a26HTC1NaEF6yttZ7brQPmlcmBtuc+xoAm76ZcHCBfRIo1tNhc+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6032960A2600
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6032960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE69482999826
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M9b4xWrqlE0
	Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=; b=N7asCZYZQ/M79q0CDhsr6wTFxhv
	5sGz/fRJYD/XXFByGPOAcdh+zXgky2vNSK2rm3lRpd7pYj2ExswyOEA2f8R3C2XK
	+hTA/KAgPw2FJJpGe5yG4wBXWXP36bpn6cWbwiLQdmENul+wLYUoY555IG1nL4Bb
	HKMLAkPXc5Ev9C3UvoN4yjuZHy6jD4T6aR9DpKPT7YOXd8STzrxSHtxiMOvUn2ru
	1cNrs6UU9RXb7rTRMZna+CUlDhWy6A0Zy3+MSBDZ+UxF6nlcnwt8pCHOMT3i0AQ/
	i1vgalvn3sc3Xkc9hbzUyxAyc/xhAz6HJqMXQxXxHD8+FijP1GNpw2bXXuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso393137385a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775902; x=1793380702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=aoY4qbfuWYIAR8W9rBEtMQzfYepdax1UjkB4LVKkV5tzbmhf0kf+H/Uw3vshdnHMXC
         KvhCrG7XyBaDdYOK4z582xswZn7GcU/h+cGUcNVMDTXm8JHFisv9cIZVk7Y+elhzpgGW
         L43SIbkWwz5Sw37NQp3t/figIeyOfCZcxOxn0rLoYCZ5n4x6QcbjRZtNeWtJYIBZrU+9
         zPqabqsfv1wiqiLbKeZtkOqpe3qrOdaTPFoeaQFBKv1mCAquJHLHgZMdziN3pj+bCiC8
         lI8KX642n29RVhDfk7O7fw4CN40kMN8LRZH/LPbyuKaq/+zNTGHnTMn9etno0WY850mk
         qemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775902; x=1793380702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=MI7FY4sMiqwCoFx7dmHtnLyvkiAuAKi0DETWjz91jAiDv+Sn91uS/T/E2s15Jg1YSu
         Yp9xpgz9h0MneiJ5CwVqiC/j/xBmy5Gi1hpQgn6/c6dxFM/V4odGB7F3miKTkvX+Uzoo
         uXvcWRykjhIXmkNk1CqFD7gXvmWYh6swg7H0gWD1TNtmGmhFxyzsIojuv2fZCg/L8k+P
         0ITHTJyEqjXGTLQYCBBa4/7B6YmRcG5N+biabN3D9GSaYdMN/rmo8QpqDDTkY1zysCAL
         MNViVU6wUU9Lo9NFrz/0cTxRuEw2DjIzcxlR/WWclfQce88N60SBRQS1dKg8xuV/Av8p
         l0Aw==
X-Forwarded-Encrypted: i=1; AKwUvByPebro5ATdrr4Od6wPZKx/sJ0LleZ0t78nes320OszWctZMAu0TTdHQFnV92Hb6Zirc1BzILsptBD5@vger.kernel.org
X-Gm-Message-State: AFq9FYJWFwgN2DBaaCj0x5VcUBVPyamIRXMCMnkTkwpQPFovznNliX2h
	lD79tHEBJF7LsEN+7c8oAsLkGBgceKKpyl9VMvr7g5tVEszLC1pTSoNft2ItKctZLO3qIroofMG
	8jK19uduTKCfiabvHWMl+uHGOho5tq6548N52Ro12gWxaYImSyGHtglD8eywy/Vda
X-Gm-Gg: AYBFou1gzsq3c52aMU0PZCSsIt6Ys3tfScoavQ5Dk8S+AXUMkk+rnJVcJrE9q5LfIBC
	L2JadNqOLbRv6v7lX2Ismi3Ggv9DCr5A5gPi9uFZ3qekFm1H0ZGUqbuXr+/fQvaNpox85Y4Yv0B
	LEqkhRb0tdLiZ61rrCnd+o4on8qyEfjEyCa+5bVjIffphfES8bIUjGhelXOBIXT5PjBqwgpYNjT
	O3LMsUlUGbvFjxxKIdrzn4bi508LxpBN/0sOIE8g5vxapoP9kTq0sN4iRaAHPfMo4JwwrgFbYuC
	K2KAmFiD4n4pgQ8QlZZIhRGmkz9ZVwj5r3E/etZABEpU3EMYBDrn/pbvbhraawAvliWKThCFAXS
	Ja7UQHXArUl0J
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922231885a.23.1792775901736;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922228285a.23.1792775901279;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
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
Subject: [RFC PATCH 19/23] ASoC: qcom: audioreach: keep the last VI calibration result until the DSP reports
Date: Fri, 23 Oct 2026 18:14:29 +0100
Message-ID: <20261023171433.820092-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7WRVcga9sO9Z
 6u2nT8Tf24sITKFWoIGD2Ilo1CIVWSKHFMkMJDVyw1WMpe+WnMfllk/3T8y6zmsrOYnwEkL+BCH
 v0wQvm++M43ygcuv+K0j5C7VnJBpjI23mHbEe9c9zRPKpUqsZjz352O9PKICigcer0GauAFM5o1
 /ClJp8RuXLeQez69rtKGQWBPbDfX+AwcjOChpyrPWC+v2zlwE2qpjOAgpgxQmAO/hmQmGm650nv
 t/rhGM1KHob3cfQXVdyxz/BpgvidFh7TA9QxiWjrBYKIM3yrVo3W4r6+CipooTntrszosX6OIOd
 5MZYdC9taSuzFhSBGP9GZsY5WcT8Xdv6qZzhR0XbBw+0lSJqmPaEdmB+gSan0bW8e6CaZrsyAAl
 p5igNVHdG4UfxhVn6tJsUV51CWDcH6NYZFM0AcTe8SHsKTxiFRRQ9eXYEXI/RDED3BsQWUeI7Jf
 KBn0z26WsZ6CobSTjjw==
X-Proofpoint-GUID: tQz9MOwnJ6KrCnqecPDtB7BB5C-ScYPP
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IK27QhZfs67nWGHMqAUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tQz9MOwnJ6KrCnqecPDtB7BB5C-ScYPP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyEicWpZ51HbV
 9iy+V6dOb6u33A7mvKo9T0Zp8C702wxSKyMcWw++hSD8Q3HVebSrEUD/+KH7WffwVjZcjKJtnIY
 oMEGMoXUtT6OVZq/z9Al/gcFYuEGfo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Preparing a VI graph in calibration mode cleared the previous result
straight away. A graph prepared and stopped before the DSP reports, for
example by a sound server probing the PCM after a calibration, wiped a
successful result.

Only mark the run pending when arming, and drop the previous result
when the first event of the new run arrives.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3eba0a9a0372..e996be54c42e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -25,6 +25,8 @@ enum sp_vi_cali_state {
 };
 
 struct sp_vi_r0_result {
+	/* Set when a calibration run is armed, cleared when it ends */
+	bool armed;
 	enum sp_vi_cali_state state;
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
@@ -1707,9 +1709,16 @@ void audioreach_vi_calibration_event(struct device *dev,
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
 		return;
 
+	/* First event of this run: drop the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states))) {
+		sp_vi_r0.state = SP_VI_CALI_RUNNING;
+		sp_vi_r0.num_ch = 0;
+		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
+	}
+
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
@@ -1731,6 +1740,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 	if (!decisive)
 		return;
 
+	sp_vi_r0.armed = false;
 	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
 	sp_vi_r0.num_ch = num_ch;
 
@@ -1780,7 +1790,13 @@ void audioreach_vi_calibration_abort(struct device *dev)
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
 		return;
 
 	sp_vi_r0.state = SP_VI_CALI_ABORTED;
@@ -1844,9 +1860,8 @@ static void audioreach_arm_vi_calibration(void)
 {
 	guard(mutex)(&sp_vi_r0_lock);
 
-	sp_vi_r0 = (struct sp_vi_r0_result){
-		.state = SP_VI_CALI_RUNNING,
-	};
+	sp_vi_r0.armed = true;
+	memset(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states));
 }
 
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
-- 
2.47.3

