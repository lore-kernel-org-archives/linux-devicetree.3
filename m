Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775877;
	b=ZWXUKpsNHqRO6HUWm8mN43uDSlC37UPjPH4zgKib3zvust0zOdGBGJM3dO/tWKj5bcQR
	 TohFKAXZXiYOulE3xYtFpODSszW1WkteN5sxURNiK13LZMfzt/QLAhzQebLxT2qJwrHxt
	 aECN/XdTtssgo5FYYQp8cmKXNEXTbGKmlPXjaxK2pAsGsB6Z/RMxagVAI8vRqGwzRszGe
	 XFPZnIRnBtI3rjP8AlyV2t+mLykGX6S6N8zG69bTlGrZH0T+Awf6csthzFkEB+Vo4hND0
	 WRGzihATFUT6xXENbunUYLhQ5tgv+lqN70DFs26JILaIhB/Awri2r3L1OvKmtimm6FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
	b=cDhprEAM5z6tw7CfnN7ZLLt/i/lqiUEI6efBQoCpcPY31sPioFHW+wXUgibZgm/bMDbx
	 YsOyoZsYGpc0aNiqEC134qkj6tQTUycyQuKINUHJAnZI/yCfzfbba0ausnygpkRbSf8PZ
	 gOFlm4mc4sukPOlsQiclwHYumJbGue85NjsdqJDIFPC6gP/bQdOl+RAkAD7+rTpWNGsTq
	 qXg/sFedbSzkartS+OeTxO6yQpFLDOtP/ruSWPeXbMJpSk5oiQYkuZbc06MHRXUM12QbO
	 WXWD2LMWjRR03z51X7MYxQB8hrvrWxm6Qx0Zsji/pYvflZkhCkjX1N0PMjx6om/RC/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2U4hhB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0474860A2633
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0474860A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2U4hhB/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6CMj2462549
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k44WZ0y2BjN
	G6OHV5lN8787fSShc67v39pliE/OY8Zg=; b=i2U4hhB/VXBPwwFTdMKtAeyEP4b
	db0K+zAm99lAe4dN4O+Mho+bRynV30T0EeMxPx3IqpuWrfro5rKzgWAtHJ9j68ud
	P+H42h8cazW451uiTZTxB5tLz+kcEK8bUU0mKxkbTuK+uhhpBkBT7KPRNEHGDPTM
	CwBQSjbD+ZxOxeRm0FCwU8nn+/ehsiarOEs1kcHIsUOsFD2aOcOHTpsdf+7dtC9T
	p7nI1UjHH5XBzZoIZAaVtNhU8c3BUdnmfL54bHx3avq+w06LG3HkBoXhk3n9Xl6V
	jq8Ag2oD+hg/oykT5HBbGVsF6kWp568ObpOHXds7+9qATALopz8KvvMUhOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvshh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so203695385a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775875; x=1793380675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=TeEMfGzcqO98vG0GPuPD55MCkwA7vIpcSwzQ11AQjDzbp08ypEDZ/dw+B11sqHjlvV
         uyYkd8qSZ4e9AMbxfO21MG9cqkhpuoWHlYVxgplnGsq9fFQlW0PjO4xDyUmB9bOMRZJF
         tbJjcY6lhiEx/u9IbAtUCknbKOWefxqoWTMwfrTuL+KzPS/KkkezCy/Nzx7sAievPrrO
         KzRq9puwIaLZ4ckaczrFXrhYPqEwl0sG52immISiTvvGaXWTEol9DkHu1DIlzQmALYI/
         UEuNYTEoOAN3p3YSZ5Jro1OKqanXNLlKpAeIE4Awf8j+O9DmxJRcBwf6kEBKkJcdDmUu
         BW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775875; x=1793380675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=CVzJ+3i8D02Al5fRNlw7450+uWfTlR10zbShSqDMLYY1uUGY4gEt53WFjHgQSY746/
         Tj+rs/TP3/yQQ4ui3NaI7iNEg+CXSlqyAE/prcwX4JgzbWuJfhYz9ABeUl50TP4AnQS1
         kQQxCSOsc+bePIC3wSSntwyWlm715QZ+iNp8ZlRoJiIdQ1x43bPkthphMQG6kYPAOpDB
         WtyLIDXpaVn3xD9F8r1HNHg5artmWP0mDuNJceqH4vENfi/aMJ203lZ3seinZEJbFNON
         AwFRET7LwI071Vqc9sMSMLuveXMGwaBtRFVb2gZJTH/byd1a20ak/HlHBrH3PUsFmip6
         928A==
X-Forwarded-Encrypted: i=1; AKwUvBxVFEWCOaEywg06eoECwDywRxIthN3cab973M/qWfg6DCPuPXjs0TEjQOzl8odZvnz9EDp0LZcsgsqq@vger.kernel.org
X-Gm-Message-State: AFq9FYI3iXfrsxP8wQIWl6j/Bo/OwUoFQXxc+3DwBpjRIN6XymSfgtuc
	4HDU02JG8JYjkYcD2APvcx5P+3KmsiLiEVjjVnO2egO20AojsF+9OFroES/h+CjjrWjgQppt4gC
	nKjUn2Eq+0AMeRO9LMNqWtA3OXWOhoLWeehDpvgq7Q+rxXbn0Gmjt3JrjrVLwXTbJ
X-Gm-Gg: AYBFou2pi/7J0Gx/6/b5EnpdDvP4lMh8o0p1SKkj7yv6A/DgwsIa9iNCMMHI7nj+wBc
	Fl/2T0dM0bSRTl7Xyd/6OHbW+GBZINFxtJUYk+NkoDXxdwpL3t07Rae7rrOOXPwLNjYCnd2Qxyl
	kM/ZJn3HoHfIjyYXNXmtKBayeLrp9ZXCpmq3n00CnRENDOv7xAfgZKkkSzQXbSS9U8f7a/ICZJ2
	9XYbDrcl7pHtXIMKA8lj9PWfM+27Dvlq80ZOLP6+YhSkTmnrxcZIGYJM1mjp6/n0Qugd+ssTEKt
	6PgcOG+KcmGj1ObKkNtKfHnZvuijDkHsE8cZSY6DOtf2zebbr6KdjQKFwhVi6SnMP9LslDDqt/a
	A9inlCv8NUTUO
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960273585a.34.1792775875213;
        Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960268185a.34.1792775874548;
        Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
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
Subject: [RFC PATCH 04/23] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Fri, 23 Oct 2026 18:14:14 +0100
Message-ID: <20261023171433.820092-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: NrdU-zYCodop4Cvd-XXUq_2NhAuFJwqm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4QU08qrW4b+D
 Wbf+90y+Zw2ZSSfCBg5LE6hMqYsstt/AbahlrmeiZVPH7TZBIkaK+wLgvf5CYS0xJdRqcoNhEdF
 uSbSuMB+DPhz9c4q3HGZ5+bb8Rj+MFA4xDVmx2PmOALSDN3mHc23vypso3MFeg9x/+zP0c8cZd+
 B2XtreFkqPSd2KzGSkoY4/tNtmC3SHrU/B3Lq6Zgl6ov8WbtzqURWveudrV7m2u9Io6L8478fme
 wcjtLnLLxFSJy8fvQk9nwWoG0x09LmaEWm6Nf00lWzwXCy3DOd1NEfxJtJBQEMSWJ2CutK3EoZp
 uWm7INdqbH3C3c/kPtd0/w1v7HJ852sRji/RhLduuAi+SjcWl6gA4Em/GefzrMy8Xkn9EFxt8Nr
 Fh9nI33wtf6nRdOR1DywRrzmQlIp5lXqGLG1nrckB9J2wU/wLK1abhZFijVr0aqUrssdnqX/Knh
 7Ag+Rq/R7upb5VdYOHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9zwYHAMgr+Df
 k0q8kyyQ/wfhBE8g3P/A/xCP/T33kE2PEF7x9I44e5KJNwNATSPjCPLGxSi+yCTwb1qZIf9WKm5
 8R4RYjYCVPnFc5b7xi4mfkZt1Hht6gE=
X-Proofpoint-ORIG-GUID: NrdU-zYCodop4Cvd-XXUq_2NhAuFJwqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.47.3

