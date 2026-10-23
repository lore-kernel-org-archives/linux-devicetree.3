Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775871;
	b=xG37POGNmOtcUej4tDUxibmlJ10kRFQ0UxAN0oBXM9mT1s4k8KyfwW0fYIF0uaaHLaVW
	 ArV7l383ybprMimF0Var3tClEMW4rYuKSadj+P3AvPoVIPtVR2r1qfIE4xJDwIJ5dCsun
	 xlk8ro9ji3U5+1L85OQ5r3Q4qM7lpk/gp/r4yuWhWoDTeIRbp2QsZGBuOwtlm1ltPeA+D
	 4UxS3hjiMsc54hy0ZRrAHtI87WrzqN2UYJCS6uTxlqjMIPORRHoeC+opg8HcBK/prWOy/
	 NJGjtuXGDPKfdH5Rknpohbtg4HzPseznv0H2i2tA/ubNDGCp+f/XkfXhGP2GAsu2d0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
	b=RmmVOKEezlcveu7RLt5KKlAMHq+18Bm2qZ5UO+bXKQrZWvBWU5P4a4aR+Bw1+UNcJKLi
	 LBAIQ8WBwt2oIRLeW2DcahmSjenzm9lVGWgUnZ4BvUri0FR4sv89aLKh55WdTvXSOaZml
	 WOyuF56/RHLGN5gsVY7APJyFTTl1HWjX1ic5MfNaEP5HZ+0vhpPgwREiWDi67+zCiTK+H
	 rZqhkYH6xYwL9XGXG0BkFtTKxOdOTIB8pHMS9BsLgBNs6OeEoGTgDHktPAFMZdQev5D+y
	 kF/DsDd7zKFU0S3fAd8rzOYhXvqUsajsX22cGyKhWXKR72evAPukfrEdm3fZrURe0nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA0606A32F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EFA0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5woF2109162
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGVXgr+T+Gl
	k6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=; b=f9RSEIGb3l6efg3ct1YubW/+Mbp
	E4BJtd+OgUBOIXCtz/BnPxff0NVNBXmlnMTQOSi+NFUpecTXNBJqz0qRRPrfBEcf
	6qvItVFESSaFmo0q86z35v2C0ByhPkrEuVYfXDouhkix91Ez65G2z3XshrVUef91
	WmBnb4Z8YEC9swgBq5FzGOAKVY5L+09/DmiadMe0ujltIXo9UyySieh/zrmkxfWU
	lAP1RJb+MFI6F5ArtWBCOUz5bG8iFysKfargUVPtnkgInNdLhin9ZVGNBMuJjNLp
	r9u7myBruqgM3xVjSW5MKdnOKApTIm7i4G+LsI6L1z0PCzjubOscoSM6iKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4quj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso141239385a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775870; x=1793380670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=Tx5sbuqMNpXn+GOVdB6JfnicWv3IWZMrsuyfNSih9up6eqqqp8alYKI/HiJbZ/zzDF
         v8YEWLTDhj7+sd/YEMDhnP1Ew+Uw7S2ycbAbTMvGQApXyKKO2L2411pqrdGWk1jZ5TBj
         32gJz3EtlYyNNrqirj4RZ6gPz9CgwmOEK6xcKWV90dIVL+HcuR1O9HbLsS8cuIDmv1Qd
         1uamnmxuUxh0fuotR8Ub6CPZ3NXkwe7jCUtrPTDK44mKXOaxJ50X1qIHsoftrnXjbSRk
         10Txxr8x2BtOHrUCjl2+LPsTW99vQulfP8utTWBTS7I6BYHUpkyASN+0P4U0YwHO4I7C
         5suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775870; x=1793380670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=dO8rBh6ItBUoZ05qK7B+MtBqxJRhVPu1aQnTvFveR9+terxSvoMAE5re3799Hl29se
         cpFEBdDcQejgQhr+rScU8juatAX2yPbKTs7D2qLd7Bu0nPN1aAyhZbCpsBKEihLd9YVw
         /3DZAKA9I0C/sZCl9bZWGEHzIG7GiVTbyzbAVMn+dn51oI5FVAStruLZaThQVBD8ztob
         hjmiuRCdJHVjac2LuaoHT3zq9/mEisc9PLFKgo8ZyZvlp4EOmaw1v6XZd6Jq6DdvJSP1
         w/el5U6cqj8vo5xfM5/mllUnQAwOI/6lVvAiU/H/eHbTy4QALl7RvuqN2rzzAoDPvwvm
         olgg==
X-Forwarded-Encrypted: i=1; AKwUvByKWrmC9PyBEtfS6XMhl4BIiHOOMEXcEpN3LLD3zoSvuLcJ/fh14bKSZHH4DGZUPmV8+gQMEo7gfuoh@vger.kernel.org
X-Gm-Message-State: AFq9FYI2MULHo5YtLMcZ9VBeexkwV1/tjftQALaWo1kniS5zaHEeY2Vh
	exLCdurv1lqmJXzJEJqOQxpEoyH/9G3BnSuDSskw1FNzJqCo2XI0iwS1zMx8DsS927jkS5+0HhO
	ruP3Q8WfsV7YxtceL4H3mj8VYq+CXK2eEiDFfqSrH53Tlg065frnGRsU8NC0eefmO
X-Gm-Gg: AYBFou1S+HIaREdnR+KazzeLBn7ukZ6YRDpOzNPNJ6Du4X7SDBOWI51DylJmjF0Xaxt
	NPiU5ZsqRhPohIefhSg11C7Te7PojBAkI4eLn/QQw8tfUdzSVY+Qv779NIhUCXg6h7IuERvgckG
	xBZ7G1eVmDosAXeCJ/JprMVAD2cBhOj7iOIrgs3ReExceNAHDyoXNbo/q7DJOcVFIIWQiWwRdwn
	gT1J9ZK6Zzl1IkC+LvqDPeE7mFq+OQmplEEXvXJPNGtknQCjELvMIDQuFy+1LmSJUCrrSSbiUbf
	SRoRTyXtqUG0Wnvw7ELwQRHl/tEVaXSLb52GTqHL16DK877oNbRYFEXbR3xa1KA+CP6aPXCEMRq
	C/vaAnBx3TVGB
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525153185a.44.1792775869549;
        Fri, 23 Oct 2026 10:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525147085a.44.1792775868977;
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
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
Subject: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links with more than 8 DAIs
Date: Fri, 23 Oct 2026 18:14:11 +0100
Message-ID: <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX511SrGA+ny5W
 fWLhVb2jq/gm0kOiJfXdanruuIrI7aJqEcXQ25EmcnoS6P/dxD6PHZYxv43vtqMQ6mSPEaP2HJr
 Lku/r+LhfXflm/QcmBgB6TDq0xQ7LwNTEKKGWwownsMFebofZpqZ1r5UlGhwBWS8yL8WyUV6X4p
 KGoTy6hUQc0A0KfO5Hsml3k4oS5HGN3YCbCkOyRyFjT/stcAvn9YTQabCqqWyFCtRUHlG2C5i0l
 T8L4os1ErnY3OzTGaHpC5iEJKOgKrFAH86dLYUMJQ3XFdOhZnMUKx7kQdjwjJA3Zv/uLKdon5/6
 1S9vKzyamI1mXoTa/3ioj7gyWHKUo430BCzUK0zZXuqss61BdanM5Sy7ce71yyxI3XyjvYUitwW
 SyrvJubdOShq8oGc2iBiefHQO1kq+NXhOBqTb2gDDEoDhri5DI6KZJINOMNAWu3GrYuQ8BZ/zuD
 9CSSeu4tCsHriR4F4oA==
X-Proofpoint-GUID: 9ZFDZcQvzttvhsS4B32HH9Lf3rMxq-8u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX+rWGjS/CFXx2
 DvCDSPb7VvP8nae8uxkTFQzUBOiUyZXdnFaCWT8W/KF003D3qV2g7N+UgsLUBRym2QLXjQ4awGP
 spCU5mSDDdnPWqCGi/b8LP2V1uqWaH4=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb96be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZoKOZlNiuk5k9p05MsAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9ZFDZcQvzttvhsS4B32HH9Lf3rMxq-8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

snd_soc_compensate_channel_connection_map() builds the default channel
map from static 8-entry arrays and fails the card for links with more
DAIs. A speaker protection link carrying both the amplifier and the V/I
sense codec DAIs of four speakers has about sixteen.

Keep the static arrays for links that fit, and allocate a per-link map
with the same 1:1, 1:N or N:1 layout for those that do not.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 46 +++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 97269b4ee4ca..34d02a39de90 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 	if (dai_link->ch_maps)
 		goto sanity_check;
 
-	/* check default map size */
-	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
-	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
-		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
-		return -EINVAL;
-	}
+	/*
+	 * Links wider than the static defaults get their own map. The N:M
+	 * check above leaves a single DAI on the shorter side, at index 0.
+	 */
+	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
+	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
+		else if (dai_link->num_cpus <  dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
+		else
+			dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+	} else {
+		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
 
-	/* Compensate missing map for ... */
-	if (dai_link->num_cpus == dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
-	else if (dai_link->num_cpus <  dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
-	else
-		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
+				       GFP_KERNEL);
+		if (!ch_maps)
+			return -ENOMEM;
+
+		if (dai_link->num_cpus == dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++) {
+				ch_maps[i].cpu   = i;
+				ch_maps[i].codec = i;
+			}
+		} else if (dai_link->num_cpus <  dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].codec = i;	/* cpu stays 0 */
+		} else {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].cpu = i;	/* codec stays 0 */
+		}
+		dai_link->ch_maps = ch_maps;
+	}
 
 sanity_check:
 	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
-- 
2.47.3

