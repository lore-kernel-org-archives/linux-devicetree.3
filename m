Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775911;
	b=v5r352tDf0wt9eCh+ZBuKOgvDAJlzg97KcRYtWst0DyOad1KUzUs45nRS6e0AkO7pSIg
	 VW/voeL0D3+YFZ3wpydMWyo1ZbuKHnIcvW0gGqOU6g0rbvtXIqQqpRq7CjATt6mV5Wo3k
	 xFxCrD9wp4nqSdk0OJ+bot+fI/R6W8VMxskPbItJnDvXnEDupO+sGy2fpDirX/NPe6VlR
	 9V8JE2I4gsdj870OngUXpFyEQmCJk2Y96rokUj7LqH3J5ITFeslkLSk5QV/7pUDg7oX58
	 OY/2BvDIUA0bXxTSTO11j4U9ak3g4c69NsA91jSI14UOqjK58FSDdjoF0p4h1KCaw5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
	b=u+q/HbUG+FWXp3nH/LQQFL+UCbuUo+wHHNJVXpPxaolXBwrvPD4VWH2a2PzBvqjfFCtD
	 Y2Biz/14G8PwkjigZb2UUiFvWpfmIHV8S1UZNkDhg0LBERp9tR9SSeO1BETx3k5GrPzRX
	 B/3/UVUsFOadOQ58+0zECJowWdXrsK7DfqF42QqbRFDuL7zLIQW6hdaYV+5Ea7t1VbDZb
	 2VH8VwDeKkPKtLGClIwHeatYx/7wqb0RNkLvBVjhbQBcrN4UBLTgM7N+SUHdQY2DR/bEa
	 ZHQUxqJmWd3dp2jmSgCWLNczzwc744mXhX1Hd4GPtf4j+ch4BBcqdfydksgFK6lj4VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA1C606E9D9
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA1C606E9D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2woM3733912
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nuqdJUBgvz
	q3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=; b=R45wIbQgErXsxYdYO1+Z/I7bC1J
	5d4RNR2zv4FYzqgC34lY9duBrZ/xFRw8HUGTsrjbL5lPqa3AB8s8gdHkRoKMwefs
	IvsHWvvVSSfkR05tt0Vd3XV/fXJ/XB54sPBcqDZ1GJeQOTsJwv+MG8MaV6lx8CJf
	BvdahcESu2MGZjr45UbdqcHn5lqcPrWqpmMprb5DrJLDP/3EAmw9EVpGV+NW7jgl
	Xnrrv1DiYsJSjGzGLWm3fPqGu8ayFg4kTgwQGm3A1lXHSUeBGwpmvWk1UugJYJTe
	mxbVMTGUHEe5NWM8MSGmcuBo1QYoOKHQ/5mBbnebitm5UHvzhGdkJtCJg6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so252590985a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775909; x=1793380709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=VetaSVmQRVXif5aLmH2WoNwan4zvnfkl7uhA6V4q3b4TnTRv+GdyiSFHjbO0JPuWm2
         blsRrI/cIDMRnvCYI+lhQomai303gm2xcy6Ko/W65Qf9Olf2t4C+JZ1eVhqw5G2jLK5w
         +7jHtTaIiJdCT7ouiw3jnb0YRKpnCbRe+OVNka5caqjowL27x183My4/hcGkftI9TS+7
         QnPOGaSsnT9I3VHAtKorHpP6JsnuC28wwW5iYighCr+qoSnxkmfBsg7/TkURBqTBE85/
         EizWQArBtj20DdiIYO4lDDVRBs0dj9cB4XJW5NZQnfvXuFX1ANH54AxSfT0k0kGjdzsE
         /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775909; x=1793380709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=d4zqxLAi9EbLEooLmkC4lbIb+gclchNaqJjRce8nvqGJr/zbJ3sniD+yUju9PuJuHc
         ur809slkvYUPb33U+zvMc+GAj3tIKyQJPxIZyitV2VFsdRdqelqQuVo/lvJqjCU9jqPu
         19l4Hd1oLJZz3hYH6PdvYGt/XltGmFWibFRqm1d9yXojoUwDKQcjoFMEUm2X3NQBHqzy
         uLR3XtXywvCDt/C6ngFsZHL8Kvgg8meNc0tcuxp1E6nnPf7RHdMoUz1SIuwRLb+vSNyN
         2Z6E1haq8LvC76YSfIMiVOjXvSZPm19kzA90SdHv/zTLrhKmY4nBMvs4rb2ab/7reAkh
         M08A==
X-Forwarded-Encrypted: i=1; AKwUvBwcYqLOa4zV3saSKY3mlLMBGou5V8+nObDiWLYgSeC/Y19mFRvcrI3wuZmkuCzX08B7Nn81JPclK2UQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLB8RpMtSJqN9B2MWk54wyhPwj2dAo9DGOz3JE0AWQQkLT2TRYz
	zl00+ppiAteRHZ6N/6KUDiQ0VlYHlr+/jI2ecQ1keeuzmaO7HZCItFkwIdaItUV7noQpshx1csq
	nyrPmBJycBt+BgKZZd4M5JD38kBspJVgwkYNUAf1BIBifje0B3nQf3Llh1Bn6NvGx
X-Gm-Gg: AYBFou31wTXsAlwUIZwAsBqxOnHLlj5qDlxPjc8GjyB2IfnY+DHO6ZXYx+Low0LxpZa
	MgtbfH142j/5o6NOZ7n931Y6Xw0j/xSrWllUDRRYqAdqp14Aqz/inh1JveoQgVaTJOMkYVxvNHT
	KC9ukIRwhgRTkegIl2Pmb9YPgBYYOex5XNMtmqGUGIZ1X6fyprHfRJGBfBBXKPzG+jpAmXReBCk
	mcHRB+xsQLb4/9/Mw+UQg0DhY8K/Bbc3Mre1sFtUJJbAXTYEWdNtRGm1JK1PvhKF6oj88KceaUw
	ki5cMd7rnFs++dFtYVOMd9x3Xkb36QxuHtTKNusXx7fSFg8gjiZag+9v3ohIjqk75KsK9mjyG+w
	+96GEVvDA5Bun
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545741985a.22.1792775908760;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545734885a.22.1792775908118;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
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
Subject: [RFC PATCH 23/23] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:33 +0100
Message-ID: <20261023171433.820092-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9pvwvHebonY5
 dZkTC6BgWuKmqmsPTvP1zPhN4INrp/Ta9XQBSXzs6r1Erczv2Y4R0n2kxhqioRO10l/PwZgV3kD
 JEFuLG5Um6X0vXPt4ibAd6OyPxv9hQ0=
X-Proofpoint-GUID: uJmN6tDLdyXQBj5g62VTBgI_jxytqQqp
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uJmN6tDLdyXQBj5g62VTBgI_jxytqQqp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6EpzXy6frAHy
 3qNdRWfBANiAEai4Pjgw1f+pEoZgUxzh2zGmLn2I8cXPP0WdU7sbBRJOvYMhrYbv0GtSIWyGT7t
 zULd1kGcN9lKPqNSTUSClcuJF65W4OGDB5r6NugwupYplv4fFVgv5vyCX5Hw2+7d3altniYDQKh
 +BxBV29bY11h4V56cxZ1CIzSfDAz9285Ezyq21PLHccl1fKNV5KR5jorSkA7G+A/TBdbFVtHWGg
 JCkTd83lXddfW7QXYPR6LnQhoFn/QX2IKujiEv6opErLvb56IECvA/c8jK27SuQuDlr1/gkcaWm
 YD3HseA3THcGh93hsGUNdIi7B/H/1QgtT1Gvtq5aV7ysKu4jbsEnmVPOzOIJhoc3/7hriN6ARWQ
 SX8dDHiPG2Vvy83mE2Cq2CMBGwxiJA2Zx/pwaNxyIriZvRKkbQAtR+Yi1I6rAc6REvZaTtiVvG/
 WLUFRPRk0x7O9G6YBAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..d6a921b3c713 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -268,9 +268,20 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -928,7 +939,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -940,7 +951,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

