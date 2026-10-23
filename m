Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775909;
	b=tu+SYRKvElJPpjvhY8NRU48+w58YbMYJKpQqXNl9+50Rb9UFWLpRNa5cLbdl36sU1L0O
	 7L1PlJRfDNg3vVLJWdW+AwoJ/Nx+4v6nDg/U22PYGbNrLgq6UtxhiTL1vz+BCPF5g46zJ
	 8QkiRoYxTozigAtaPMtYVUFwdGxHZhTrohBlUTyV9GK2GgmPXwaMrUHQJo+hU6Ntokryw
	 vckgApj9otfpkLJ8iyf001wO4ez2EhNJniuUt2X7enIbsTNp4vkyB1evHLS5pv6Y3yYFp
	 8LRi0ObT+cnZiIbQy/XuvfwNEThfFb7D8sdqbWkAoE09l8dMNq+G+wXpT1D0ILz21gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
	b=BNjIk2kY2//FXtb5ssoDitW9LiJq1KfNo01S2uU/oqpHqrsJ0NCm+fvinekQbsUyVVvo
	 MxemV4Fcmw3a85F0yz3kABk+X4m+F/n6K6f6w+1m/f0zuCv1SxsIRNQCyMISsCBAMCyCP
	 kShRiu78tiT85vtkhdIHr6NrhNG+N1BWAEyS2QPz5tzBIzfQ/jWx3fK2DF1jkA0aKqzl6
	 m2ujCw+657fsKCqQUsc1bSmi3AQie3JlimL/CrVFj6+fYt4BcyEDtm2rYaiFsvhVVgtLR
	 E4zJcjtb4dzbsj+2yVswjU+k8HxGMwoU4LXgviHsUKU2/k2N+jQoYfewMbPnBzf1LdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE18860A381C
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE18860A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5x7M4072887
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cXMlmuKppBQ
	b2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=; b=i347DQ9x7D1UCl+LQHDGivzgiQu
	MebQJAqRBiZswZYniNcj5Zv8iP+HMpB7ZwWeb9iYxTazXB48fLHKix2u40Ycdhr6
	p7NSf3OornhiWcGJh4hl7ccTfWWxY7u7hLYeuECdkDdUWlh29adAJ5Ors3c8+4Fd
	ijeNd/z9urcNS2pNIuZDd8tFzJxj1PCDGDNfJsGhPpTUjwHXtddqnOsqGErtY/c0
	anDMxKUASWUX7PV5dXOl9MPxt2RFg0l0a7TMEn4RngvhSjlb5bJ7Wy7eNPVsLGVF
	ZeHqzXvKk2n7J/K+1B9sUfyjlk5unAfG9xxTthDq8F9xGvkMj3/1L2qR+8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso223678785a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775907; x=1793380707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=P1lKYjc3lw79SU5QhNz9T24PTWiyXITkOa5Oon/GLu66pYx+jczmCxrkGly0Whu9tv
         3kd4743s8G4LVkLHk0RnyxxJ06soFfeYOFIljif87HeEsy3f/JlAXVWnGstXCKu41V43
         OUW6oKHTk9w81a82xdnfjhpndlNbAi3ukzNP7JP+zluiioEnRhznEd2XZ+j/PP24mK8W
         9Fdy/Lk9eST5VI3xKUxcINqFzualjkeMGpy0UCqRt7Leo1QrZwhLBu3eBfWqYZYwqjv0
         oVDp6PzMjwicF0pWDeNfZtHq98JSO35dKFNyhwK3Xw6PK4zWI/KjTaAeU+X5ALtHoeZD
         UFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775907; x=1793380707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=YkA0ZB8r4ub/yLudoFSH2xdY5oMV7M4f165ISAz0kCvprk/Ro7QK04fHKxgKDwr7TB
         q5XIiaN03h18QKHLOI0Ka7T77EdCskCxOfO8ji5f31qQm/EyLH7VuKPOnX+FEYLY9jAB
         sy4icXTxKh9mlK1XxxxhfHKvndvS5BM2P/+haDe8nmpkHjLBu45auWmA2EnHRVj93Aul
         J4AlcJ6vIL5l4+tqhRxYbsOw0D6paFe0U6zQuSmjWWTY2ZZoUn9hDUwMNcXEuWrN17kh
         i/psfdBiT3nwOMoiaA/KatVewh4vbEtbFeRzeh+7yGwA83BdoSgprKus1GbbcDJfcsIm
         /6cg==
X-Forwarded-Encrypted: i=1; AKwUvBxLK7ph6mgrd9q2psJ/hRzex3OHkfkxqXP4p8qs/a7RkmsCiUtwxazsJS2BiiilBrsNXSJggICH6fui@vger.kernel.org
X-Gm-Message-State: AFq9FYLFVuZr9KWj0UBeuzLKetMoRmssN4KhaUmDEDuD0ns2wsP59TAu
	MwBHkCC9HVK5Uh+odfUtuXTseqnSNMrpTqlAkzSKvWIaM40ne3kse6jfLLowP+a3t+c9fBvgkAV
	CR4X/94rcEyC3UObyJX1yoygSvuFloQNyrEk3PQmkqLeXNFep375UwvkocA/jAeOQ
X-Gm-Gg: AYBFou1uHr38WYlNeKFD0eKC5erL7ol/MS+Ym9S9riOET9Efazj17Q0VHVv0AhKn4xx
	6td9Tz+pTOQCTEujSqvf0S0X4U0ByUaFRudDQdJitMpOBuCdleRC68DwHk6EqsX6+d8qES1emLl
	6ocLXBKdDFXX5FSCvPMqMrUX2leLXg2uKs8CbDHo3JAXTaxhCHImneVtD0kVik8/QEugvaIflAm
	Lw8ajOGBzoXTZYPt6aGqnQuasxIPrUyUag6B2uCpB+mdiRMjh0WQC0YcO5gRE7gIVYM0eKzplmf
	AmeORPXB/NOME4SEB/RfTaJsICvOj7POUctjAl3Xqte+MSXUh3VTRQxwkzJO23C0Y6aQgRfgyMw
	q5Sn+kV/iuKQO
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97338285a.66.1792775906862;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97335285a.66.1792775906330;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
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
Subject: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:32 +0100
Message-ID: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wAXwBtrw9lRpzTjfD1s_L3dJFIRSzlLg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2bUG8Rpl8y0Y
 N0JgqyYxVIH+owIPCatSXpVUqM6QH73bKic9xygO62iWdUHaG5OngghbgAb6ibzjm1BF2zUD5cY
 Ndpm+a1wlwgpb7Ugm9qfI619MFvIEII=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gpxm3BjZcJp1ZicY-GEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wAXwBtrw9lRpzTjfD1s_L3dJFIRSzlLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzV2pfIoqy2Ys
 HMQs8uhBdskSVUde9sADBoSihLWsJFYz4oY3Gx2DhliNKm67S54WkS5NQEkHJivitk0qlea3j40
 Ayrx8bw4BjPjh+WVWGIm/G8pEF7JemeU4gkSw4kLP4P6S95mwkh7KGoPHdeantxahWg6wATCg1o
 28OY+R801d/uwBT6FSM3k6lQyH1VCQ7UONwc6JBnVK9tgngrFTS6gPlOhbvVXdrbNChvmQVR/Nk
 f6yGFlAxj50EUObc8BPyrYBaB44BqAnIRQnDbHPUHTUWvYybRapaVkzB7ZqfdDY9RcXzXBRXxEp
 0okzkZsifMjK520x0oZ2+bIx0JY5WQ8YU4D33mKSUUSViFgELU+iMRYef8+dqg/L3HObQ5qbTUJ
 /IEs2KViaw4Nm4NJPEczgxH+BcX9LT6qEqKNP/+gk667rK7CY4e7U2P7p8BOsInPMJmuPoCaI+F
 +6c+tsPPQelrRDNfiFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAIs to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..fddc76f59557 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -256,11 +256,26 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs on both
+			 * WSA (left) and WSA2 (right) buses. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_woofer>, <&left_tweeter>,
+				sound-dai = <&left_woofer 0>, <&left_tweeter 0>,
 					    <&swr0 0>, <&lpass_wsamacro 0>,
-					    <&right_woofer>, <&right_tweeter>,
-					    <&swr3 0>, <&lpass_wsa2macro 0>;
+					    <&left_woofer 1>, <&left_tweeter 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>,
+					    <&right_woofer 0>, <&right_tweeter 0>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>,
+					    <&right_woofer 1>, <&right_tweeter 1>,
+					    <&swr3 12>, <&swr3 13>,
+					    <&lpass_wsa2macro 2>;
 			};
 
 			platform {
@@ -923,7 +938,7 @@ left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -935,7 +950,7 @@ left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -951,7 +966,7 @@ right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -963,7 +978,7 @@ right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

