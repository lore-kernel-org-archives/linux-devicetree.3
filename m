Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364126;
	b=iZU2S4P9Wjlb+yK9Yh6msuLjYOhEbWHhCW811C2w5mp1O74Si1GC9d4LjLIjPL8xaVGW
	 NfjpJnm36vVqDAS397uwykXupEoNottT9cfLEzuXuS5HLbA/UBRoZOaJyqnchG2BD3JAd
	 UzhWmWkPAFVe1l3v9ojY/ysXBT26NtQaJk6iH2hC8/Grj+EjcLLNdIUV2DVmqJFfpBkYr
	 TKRMecU1mdpCfkjVnNMsJjZaLHfVTiUe4b5rBJVhIsXY7C20S4GuWEK2zLqee5Smvs/pe
	 bSXkD1ahM3XBLx/oAkmuKstylBWD3S5dWlyQsCOZGh1l0z2IrGKEKFw2hpOFojeKLEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
	b=tK//lX0Jsx8872ywCn0J/jpP11pjlE/Bon+AGqQyRwcxtvbruRyC4pAD+Pp8tgfeP9+a
	 /SZ3S6bQ9hy8piIAfUmEUMHbX6QVdVnhLerTHmWTEOq2SBbobrVhNRrqJRNcq0oJgMbh9
	 vXlLQnnGJ153YBquyiPZTZsvaZZJeKRPsBVNW658t3ThUKUsr2WnSMC7IMwkSkaQF/bZ+
	 hL1HCTBBnzm6mX0Ic5j8ZvyOv/aaqzWHUbesfqanXwiUTn6KE9NXkXoNDlTCNAOINoBDn
	 4Fa0jTFFD8Iv8kChd+pC1YfdiuCzhXGefpOwrpDPkm7CCt7Rks2K8622wCJtOUfGFDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jO3EZBvx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWfZUc+e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DED606DA1A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DED606DA1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jO3EZBvx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWfZUc+e
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFSQuV1251701
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f/9te2ernEK
	Y868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=; b=jO3EZBvxNduyQF/0DVWdB3CQZRQ
	yXlRKwyauMiID4XuOdDM84yhNBjGwFu67kDUS69srylYHE5LHLP7W5WT0XEQzGnH
	Mq9DfjRD8yv3RkSV2ZTB9ddmvveUskDnRIcafXMtsGM/jVnOwUlCColR86gJgn0i
	RAIvBxbWhpEcSCPdtEX+J/9KZOaUuuy8SFhouwbLnFVhMdxBqrXXfkZaNQoovKq5
	YA1EyMDsybFh9KVs+j+/vpitYQUxVe/5LSBFBBUnwROrGUdAq24VI280WZIRJYTA
	esdQcQ8glmJbNhZZTPd2iTz1+Eo5xEoM4kiabbVqRN2amgM/IglygGQ5POg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so673269585a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364123; x=1795968923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
        b=dWfZUc+epyMijC7jBl2cT8l+2Gu4dLS86FdcKA39aYSk0hRBhDEg4qRqGr58Uet+DB
         F/IYp2QPhdVs8NeY/E09BnLKAFJfz2o/eaF8rTDST9Ku1nTNw0ctIAPyZ68+YFijVDxk
         PGsSPgVDOX2BINExxgSxS3BDAI43KHJEagUJJpqu2rgW0pmYWeZZLmMc//ZzW2RPtMbV
         bOqG7+q6KAtQiD08LlgTY23q7MTsY5mg9nkakci9SYQN7WtMZxq3piQSv98Jr49pzt6S
         7zbOftlrMRRuTlUIc5a4/t/2Y8e96AY4DDm/ZEJQB/zH0NMpXvg/1l/h+WzoZvssqURq
         I8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364123; x=1795968923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/9te2ernEKY868Q2tTfh0N9+4p6tvTufZbWIWjMoLM=;
        b=Mz2k76bEI6cCiY0ZfzuAfHNK29VrN8BszRiI+AME5AygwnTPO56G/Z3WbkPfj0Z11Y
         nBhYM8icDHzHFV1Q1TG/l6cGBJ/AVmxDGhHM9RayFl+73Tv9mxCS3DUHUs2WVsfdIhnb
         M8cjBNJVl6wHR+RDmNvLQL7j3c1SJKpitCeMIoGFz58Mvn8XCuFOma52ZAeEwqOy0O8/
         XuJP+TWtXhJe+FEc15W4VVxHqSbRRsGXES2j4rqn/sPaQ0Oxn7DT70+XKQIl16HZr3j8
         0d2jcIEHqiFj+rODcCgMC248TBpKafVt8bNwVtkEmxML2NY0PyKJChcM51HY1HnRWlFr
         lDdg==
X-Forwarded-Encrypted: i=1; AL+hErE29oa9VO0fnlRU8Sd50wDsS51wyeUy6HxtMO36CMsOv8JYmlgpjpgJq1/OT+X624/fof0rnvrCkKCH@vger.kernel.org
X-Gm-Message-State: APuU4Z/m0xIeh1zozExeqcs10aLO5qHm9t93yyFwB/xPyGo+hrKyrv9G
	YbiSs0Jti4hOMAbRtq0KRCsG34ntxVvdf3Z8qjI2ZOYLtUam33E46huZeFres3AQh9zvFPjdmHU
	2jJRlBBVMjezar46BYI/Y7OUH4qiSlwGRBR4fdiXiiCRE5NF2FN5HQezovugrDkw4
X-Gm-Gg: AZFdTZfmQ0EDYEavUi2SUTO8+cY01llbCURivlv6oLxIjb4abjuLEKnMml3DGlzxtFX
	NMcyB9BqO5nGzWliHzlQqcv0sUeGgOEjgK36gMxvlfrZYqz1b4zi7UtwGxf5IALKh2pIX4Ds4aS
	QdppRgvaTc+JJvUJUdjnwqgmx/N7tAZ7ntVHLw0GgquZ9XfZS+/iJu6X2WHYoGXHXziI+D7XSax
	TG08fyrqcME+GC9t2KFHb6/V6inJaD56hv1zy9jRQMMfUDaRmiIN8jHixcFQGwLg5XiTqVNG4U3
	X4jhPDdTdDUsZIfJDAfzWsvdvYcmsmQoPGRYKUql3QFp6KobzLawgddVCLffiWCxjgS020omrMz
	IYO/0z+mOyDexHnb8vWVNF/SmyzVmTQ0JUPtPkCW7f3UyUeA5N6od4wQqXc42KdiA
X-Received: by 2002:a05:620a:2548:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-949bab3ca86mr1519072885a.68.1795364123331;
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
X-Received: by 2002:a05:620a:2548:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-949bab3ca86mr1519065585a.68.1795364122858;
        Sun, 22 Nov 2026 08:15:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:22 -0800 (PST)
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
Subject: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:35 +0000
Message-ID: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX0525321qIP8N
 UwtJpgNWSqvqXSxFRVYkFuceOxxg6njryBwtG1WI141S2zIQVGtbtOBGOtJNBDHy/QdzvHvXujm
 iFm3/Y+BlqNFvULgGMwM8xXEVkVY/rtreo7KtQOgo5HP4DfUgAuOR8rsFOaahtPss27rNOj8LYp
 RtfWyE4x1OeNRYiWDHicBCvAcB3XggmSORb7d9ZUf6JsDgureR2nfYX3Pxadz/AeApD/EqQecTn
 L3g0z57jEV+/23Khi+J4QkvR/o5cjDx9LCRy7UaDVK47xO4kbbStCkhsKzo/f730jigCwIG7Q4r
 Bd0znraf1mtF8tZwn4yHfw36eT+fmkJCFhED6g+3vJ0kcVR+l1qYX/Jb0FaFYYqzvLHcjwirIuZ
 kySfdh3E8Wr/fbNa6vYoJP4jIarVXltOmVGhr20mLgptA8eS3A1VMDxz7essNWEtgy2btw6mLYr
 gzV4R7fTV9NqLSCGCjQ==
X-Proofpoint-ORIG-GUID: YkBVKvKVRDcutjLG1YsGgc0WZNglOn3p
X-Proofpoint-GUID: YkBVKvKVRDcutjLG1YsGgc0WZNglOn3p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX39eqze3fJvA9
 D6IEFSLxbcdp5bVox+CCr9u+XA0SJ4cUsd9gFqaDQql5rLKFmztIBfwGuIP5VvTMF17mUd3FQgm
 wHCPllE6O5MYvHSEXZ13aQ36+Y2tjCQ=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b03151c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Iq1yyRatR_DTk_j4oukA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAIs to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
buses on the same WSA Playback link. One MM1 playback open brings up
both chains via the machine driver's multi_direction_codecs flag; the
SP<->SP_VI control link in the topology handles the DSP-side pairing.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 9562a432dca7..2ddbb4dc526b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -262,10 +262,16 @@ cpu {
 			};
 
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
@@ -792,7 +798,7 @@ left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -804,7 +810,7 @@ left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -896,7 +902,7 @@ right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -908,7 +914,7 @@ right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

