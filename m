Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364127;
	b=F5HNxJ97ZmPiJGXlcydIO0RJypva+QEm0mQcSC3Rky9jnC7Z4nC139fK1a+bNgd5Ihke
	 eBJfHDGJKx2rpU5Vofly1edBSQL6Go1D/zdKE7YOdrA6jUFltwoLEV0qsgH5MpxGGgtRP
	 kFIs6s0/bDA2gm/0Yu26cCQD3eQEO2B7RJZoddmL6nWWbmKWGP0lMLlrJDLnK/EM2ziMQ
	 BsIP2I/GcSp/LZ22xJuHp51XBPcnx+yTRziKybp6h1NOIh94uxXfvVZJtl4CYlRhI96BW
	 UOW9tFUFPSC80tll1QMXIoWH3Hdjbg31cqkw2IztBTJKHJCmRloQW/IZw9tZBHasJ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
	b=lRIkp1q5v8wp6l7Y7lBv+/NPkxBm2la3EhoALOmSkuxvM7mFkosS5vGc2eVO/w3sszjM
	 xN9rGdYXeumT9bETpkAha0iCdX6lAjsMvtOeNLepWm7ov9QzdFlarrZAbleEzAV+wNR2t
	 Q6xFUav1Lr8O6Ru6pUYh0Nmelg4cGXyn9ebjaj5DmyNrAN3s0sRvSMZHtpdPWf+XJGrTp
	 DXSA6FgDXdVpPCF5sfGXaHkeFYgxpGgN+wMfa1ii8H+KMORk4epSiLzlgluvmAQA3nvDr
	 YVW1T+Cf2oaWgOPVn8Q5ntWL9ny4dkBsYnTZxhPb61qNnKGOsVTbgfJinGku1DkQnBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D246606DA34
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D246606DA34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQXec3382516
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZXdUoqdbSRJ
	d1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=; b=F7ZLBf13BN2DpneKCSqjS/7EyJD
	A94WvUlT1emakZgFcG5URf5GhdyVec/7ZjBK/JrcWLPpfPH4Tx6g9cAsrbdbCu8m
	Ofjx88MNGFZCtZ4n12ulVJI+y4CJ+x0EmYTHrG8ejAQznNAuLZku7vknakQ07ADF
	naUV98Q0axFU/Nssjc8sBCflRrTNCs0kU6h8KUPa8p6R3GipmnEWZzKeYu+laIgI
	baKvoQHuG/mS4YzZbuembAjfi9IIbh+AVQTqGHrfaQsFY1ZFjGxvcWEz2zL9yiYN
	pSFiN8hB3y7Ky16HuJIWe64Vb52YsqXhi5YQZnMNvxRp6UXhahbkeQvHqNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so285059685a.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364125; x=1795968925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=Xn+R2jNSxXixcqiAP2Ug8TqFY9Fog3Ba9w/J2Z4coeYFNmNen5hxB6tT//0aPiilTc
         +czWrd+WeHajdb1HkC5wfxVO7uANlPPOat7QKO0uM+aSdF1fnGQbKeUAzh+wiN6OtGtn
         l8wEbWtzUqfvUWlOGOdsSH88hg3Itay3UqcNX/TqpXLvFvXJMGcxcAegq67LdQ2iW+PP
         JyhONMWbIIpXSzG7cmR2iCbxoqhVG6NaV3udXNtNox+Af947WKCYBPD6aSWMiHV4lSGj
         Y0uPkLTO4UyH5Q0umH4AxeDUZi6BVBRiDvLk1x11TdQ5PmpMP5ZUPivR7YC0z3TI0ywJ
         45Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364125; x=1795968925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=sxgvY/QC/i262q4cM8F5ENaA2cyi0YBSFwz81iJV90HfocdKfkjpUeWmovOycI8457
         XrdVyxvYrEWppRYlQFuqkhmK/geJA9O8DmtBwF+/LPWKyyV2naAdRXIQ1T4M7Y7amQDb
         2WaSrLQY639yZy6pLpfsQP2ESZ7ABLmB02xpUBDB41tLpKmkpcSyMTVA9aECOMfuPiHu
         8pqdbH7sR2ubx8oN5iUvXTLYEMRtCfdSSQ3KPAgyaW49zZFdOI4xi1z7AfnAF+H8q6QW
         sYE8vqRzsn1yw1brDBLKEX8wwTvHXpOXM24bCi8qqQKMLsKbUOJ9Z2zTmGJYlJ+01gKn
         hvfg==
X-Forwarded-Encrypted: i=1; AL+hErFn+nAgWpe9nqet0WR/A40j8mOoKHqP2AHU+mH/lpGneUYKCiUTTZHeg8SHzbJX6QafgojuJZotapNn@vger.kernel.org
X-Gm-Message-State: APuU4Z8rP7cJGy10Zgjt8GG+rKWIRpWJozNtQzq4fkG6/MVzB0Jc9/R5
	nTiPOD6eyU7iSN+cyXtCj+dQaLFNjf6X5Awz/i0hlFYin4ls0uOKYF8VEG53+hjYXS+51Fc/Z5r
	3M7CiaMDkyDxbbH/Ar55WSZ+llOKHUlLnsFTMVFJwr3D2ds80KlSJz3GV9BESuGp5
X-Gm-Gg: AZFdTZe2qp4FIf+MynVopap1FsTUL1CI+clvRVtzCuKexKZLveYZ0ewDNmZhgUXhzOA
	h2qPmMqydW56Lm+KeBjaZRaEwAT+UTYVGqv7CZ7q72hCy5OgMJub0ADtph0VqSr4UjwMKw1Ba8M
	5r/cUY488fS2SV26X3EQIJeacdnHwLsXSnxTr65fET5WRuFilDHlwEU7XGHEmeh/G4B+rhoFL7n
	ASbIT7WOeg1YUXEK5ZC2rJgFWfPGIJiaL/8EQ9CpFroirYC8xmnoS1Ad/POOWL+JpMSgoJNs1li
	ATIhZ0d5cMJnBna5l4uFpmMV/abNprmm/e5yniABCSZCkZP9HofHICGHNNrKjy0kon3CZ1R768B
	gRaUoH8lbGmDK9pkanrsreO26FUuyqrHMWZuOopn4ERdwujdf+Bkb4BS+J1liqaAq
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278944285a.52.1795364124783;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278937585a.52.1795364124226;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
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
Subject: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:36 +0000
Message-ID: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03151d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=PlqI54VOmiubEWYg86QA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxiE695pLj5hK
 o1U7NZ2dUNXj7qoRNwOjcyG7CEDKxbj6nEZiCiMjULdLYUKPncWS4+jzVgQcUF90wsalUcJHBB+
 KnIegNi+JWAfWlghFdUhrCp5gtunbSc=
X-Proofpoint-GUID: zP3MBmSTXvq_UQCoAHf8waPQYmqGdlgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7sKO+vJII0NA
 89zzqVofcTjL86AUNjO81/fNzHtMdSJqhURL/dVYvKdz9NFyGfaI+Wntlpu90/35lDpUoJiAZVw
 X94092f4L++ljQi3TVkKvT5p79IUs7UAHoSZAgMVVJjhoyu6+BeVhumciC7bBon5k3f4fiXHIbc
 sjF9BW83RvM6VQeSlkgH+L88jjs82UtIc388kpZiJXt2g5bM7cJ+CQcG0V7AYvft5ID2QPfGfEI
 6UdEhivlHhTMBWEloDNMYc+I0Z9s4LeQ8bwC25jbcXc9dYBFcMq5TTlZ+dF2Ds9qcchO9jbflqf
 WBb9HP2JT2AGEPWWjN9Qi2gMJ8J7Kzul3WDkfEq+ZpZhZICQtZiHtV/JJupng/ItmBuAWRA86Yb
 vwuwAkB/kpRKtwXQGpCB3vw1ianQaOsyUIHKTZXzOozeIk45UL9w3zC7AbF2OiHoUz1+AtxQ3va
 NfciVEqA6W5nbP1UTiA==
X-Proofpoint-ORIG-GUID: zP3MBmSTXvq_UQCoAHf8waPQYmqGdlgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on the same WSA Playback link. One
MM1 playback open brings up both chains via the machine driver's
multi_direction_codecs flag; the SP<->SP_VI control link in the
topology handles the DSP-side pairing.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index cc7ba3c21bdf..407a8490e6ec 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -273,8 +273,11 @@ cpu {
 			};
 
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
@@ -789,7 +792,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -801,7 +804,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

