Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621468;
	b=W5XVlPr2X1hXpCjS6pgP5h3BcjX4jsRLa+2wch+k7zGmh4mGYiPOzB3oVTo4f8MEoYMO
	 s8mA3UzViOJ4Ir21fWp1Qxv7NhX8R3vOqMmUpy0wThyttCutMWwF2YCW7ApONhDgfiCcO
	 prKNNcXE0jQqEqd6/TGyTBdYvluVvPpUTE8tCk2+gEvJvD/IKu/G3sDss8wyZUWCbLm79
	 YmloUG2Xm2/91j10tp+oa5bNjmj/NxtFccb6czQ18JQGbKd1cz7SJmFeCLcPqUpXAtngk
	 7+pRweIX6IgdFOD1EH8mopXP1XSX2IUjSAtLA9tGEtALSkJ6/gZaglX531tLccR0qjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621468;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
	b=0fRi1+v+4XeeQvIxravY18E9ub6BiOi5LZv5f0HAlAP7roDf5qMwpNkuU+rF0CtSqvJe
	 X2MtaR5mTif2j6BxdtUTF/8d1gs3JTnnaf6FNIAtn2vaRIU7/TO58LA05ZbKPjwQZjuab
	 AfW10Pc5XfnTeSR1O5IRBwpYvI7XYhCgnTKAniVEDHaOex1lCjCtiFZBL6s4k/33d/ApU
	 SRIENjPNlkeB9sA6odJ8LXDSioH4DYRIdm9CutQZqoixycMtOtkQmjp515jTjCnCt4kyl
	 ljjC7FIkBzICr32guvpPC3Nm61u9Id6gBz83So9SK5D8fByEBjHX0Xu+1+W6WAuOSUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFaaotrC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCtAri8G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51660A3811
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E51660A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFaaotrC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCtAri8G
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1KA2466129
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=; b=pFaaotrCb9JYp32O
	x3X5urS6mI5MRnryk62kyZ3aGhdh0e3BWmnEPIhdqj9s7plKv5XFQacA5yq8oZYB
	8xYB5mCqM0BKL+VgWDooeDxPOjKWPZEb0L63JWGKVhiITpwMXT5UwqHR0QF7JlPY
	qkgYLIfSE0Ry0vwfpkNWQw3a7jnRKfcmJjq7l+px/juZQzg29fBm8nTv2eKmJmNz
	+C4wrvnoEnKO/KqatE++OL1NudpN10/0yAx+JfpELBODltm8pWSAZLBQ1NRqiIg9
	I4w1Wj908wFb8dZDNMLVwYxeUvM5RvVfyTgpmNdReTNZ7/ngvMweFkTmdBKlzH58
	6EN5IA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhqq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:11:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc3a482af7so2784092137.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621466; x=1794226266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=TCtAri8G6Q7L4GcZBndptPEq+jWtf0hMQTwKX5jfwq0HV5HnY7u7sm7kKHpue2Wt01
         3n5RT/pO2hkhNcf7IbMq/wGW6E+JMdka8+oPN+oU+2zvqH2KyiHpAZdiK3U3k1E0F9X3
         ysf1kkQ3n3Pf25ybxXwPB1DYQMYGofOq+RNLxTYZT1S/xyZdakC4HvGPsiUHscQe41SU
         EEzEda4hrovVETF1aBRdeavHUk3ghGb+IO/NrPZiMQkaOkV/WA/Odc2jcpq1RsWkyrjb
         dOG1FOxarbJHrrq3tTXc7Q0pZRnqebqPph+4N6DmZg+6p9PE7MUl79QjSprP9Y/UAX3u
         05kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621466; x=1794226266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=eDIjiylkBSMc68whj+VW/UvjZhpXi8AYZtJr4N8fLA/XPBIh/IzwgMuAQwnzukPUg1
         yeu0FVkg9Xo+hLMMIO7XJH2Prpw0Cl4htgNrV6aiAcRdA7NCDUhjaDNVAbw5U/jpI13Z
         1EV9Nrxse53oVKoDxrNgXu/CVpA6QL7231qFhGUR4JVupYk2Wc+N7UEyq4S8fig28vrJ
         QdwDXrJLBTTh2HPbPCdVRoprMqt9+2Jn/0ow43aA2anc0Z/aj9RFWlulOZPcoTRGmAzo
         1sYk+HClt0psrvRrlS4mROKOSoESQsBdMRKCXkskJCE+SUvHalWSdtYLKsUnuRuTBCWG
         IIZw==
X-Forwarded-Encrypted: i=1; AKwUvBzv+KHzdF1lX6amjtS4IqQfomyRLmZ2RXkc18d7r6stKQLgERftOrMklzV+LFLioPpjBQN0FCOyEyN7@vger.kernel.org
X-Gm-Message-State: APuU4Z/mjTgJO6KACH+mjvL0HJTIQqihs3TVKTIwkewo8HXpTCuZv1Ob
	n0NlcXDvs4fNkkfgm3QMy2Cf9gK5lrUObGYHaTR8IlNRdcaC5bg/Sid3v6+AFc4rimqMilEkw2O
	ipb7nk2mQugNLSuMF8jRu2yLjoNLdPcc8JeLbKmRpuaSY1V8i5AMYVb7PzXziccQMFuef6NTQos
	Y=
X-Gm-Gg: AYBFou0M2ie20BY3neIvuIFA49Fe8Nnc9my6IBEcmcBF5rhG6yfGTlZ9kNUNCzrWhV+
	0ngE4CRo7Tw7OHMYqgGnITKgFSJcV0qmT+kRlX6kn+uM1sDftNH8SuFl2ctf6ytgLUKrjhwXEPg
	RCiLWb3GErO1kNWkcCXjEoHKnNx/TDVgmWkAR6F30ZK+exdyRLtjOii0y5m1853Rme3y1isCtZU
	vOdLBY7zza2TdvkjBz2eIHktz2kAIgynKk07KdSnsp6upLFKP7BvYmwLGLH7/gjKqP6oPKdoZG8
	B9oqKEVZSFPUaZPtkpe2NF2Gqg5MIL11E1f/QsCKDpPFf0P77/j7l4zDZfXiWjQnj5qiW+ZkAJP
	JJIX3ncuYo+fRVP9YVrVj9yF1wZF/JEr2xA5i2xKs8PZAyuRwAz6g3TjQnQ==
X-Received: by 2002:a05:6102:6b0b:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d0726cacc9mr4313371137.22.1793621465416;
        Mon, 02 Nov 2026 04:11:05 -0800 (PST)
X-Received: by 2002:a05:6102:6b0b:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d0726cacc9mr4313354137.22.1793621464663;
        Mon, 02 Nov 2026 04:11:04 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:48 +0200
Subject: [PATCH v4 2/4] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-2-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9216;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bw3lRk27DYHr1IzAGaOF70J1YE4CAQr6Ctzh6DIASCw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3QMe81gFRKWbP0l7Du2RptXPNwQzSBpFZyq
 1UW8MHkkoWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh90AAKCRAbX0TJAJUV
 VrwxEAC3ytFvNuLfUcTun6fJnZ/1Tb8nLADyQxlB1EIDnWcYMKTe89XJJSzImtuu29xtGXgn/F8
 ouw+qkmhTzJklCWKPE1WxbtsmSLLgusrAno22QalQ9LrSNr7qB0eZCamH7tG6HSDKCBqTMEFIdn
 pf1jXQ5x0mJKccUklh9BickyHaIwa6gIZH0Y8NTvHTJwMq2lOeF/ICNKF/31tLDk3jdZDzAublA
 BcFiYJUWx408l108QszeFsanNDAieAX1DAb4hSbgib2vc1fKbwA3rnD6uWSqoshuRASv2EkE81S
 6TNJ8wwz6L5cg8RUcgFnKzXh5RcRf5f+aKHgj4kPBcKzlq75tssoA6lKq1bBQRyDD0ei9OAADE+
 bgNhIHT8UOyZ94XJDzIQnVKVAJS1lgm+CmeLQTacs5s+Ey4T7En3fvhnJVz2/0KnP4QsmRayvLr
 FHuYKCAB5REyV4YUXsa3XfWGKQErWQjKOaSCc5XXpqzLahJmvJXOlH77oRfd6IBo94QuF4Zu5bx
 ttXeklKQc9UrjaiGbfL2VH5QzWeClRYogY4iqx8EFRHeYaWUGyGfJXvDHYYdtXzOjXJbeD5zYhB
 A1sSH3r80zlR3j7BC9wpkXLbX5DLqywUZqxoBVssMZg3E3C5lGD0CCtLvJSpB944QgKgLs0FOEe
 yPOq6qUb6RTSNlw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: V--JqBczDBzIrSDzhaIxX67f5tXXo_VW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX6BG7o5nKUKnt
 wRELpHLoQxbIKJpPKOiVQiLvXft55NGmzvbbrTaOS57SBr9jAEvaqnbUpxLaAgR4uEP0rueLuX6
 6nvf0iBwp+ZrXZXE+w1qTSVtFgsRsr5K38IF3sfeiIGSKF3svQB3FJKFFmrT80YYJIKrRfvjYyH
 /8hFd+IPFSIoAXT4wKoNngNgFlRN18+cJl+SVhnCaTLdPVAx3kv7TXt6FQkVnhbQbPObRhB2pH0
 f9COcsR8z/49wljjdLT3fR9L6PHFVXtNJa3mEMwRqdq7d9BW9ZE9W/pD2OZ2iWaS3VzSw2lCvo8
 eHjB/LHCqmB27LmfvUC5IfMqdUnGowc4AZzbLvRF+d0l4peKLiFSANfjoiPEs0f1Q0HyqRGv3NZ
 cAm5qlYvQjqZGNUroPaREFLRGTeROMGf/+fXHttEGeLYRkt040aI5s+MVY8bFzBZn72hZgegeE9
 +0EGjsBmXUeLNsVqmPA==
X-Proofpoint-GUID: V--JqBczDBzIrSDzhaIxX67f5tXXo_VW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXydh55rinQJYR
 /Hl7XIaFy5zmKHFsOhhA/UKwvp3nZumxSL7XpHNTaXUTi6eKYTooULbQH2SV7WVICc3bcV8o9PP
 fNutJSFTCY6RcMseK7EZty5yT6e7SGw=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae87dda cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=igo63PMTUtHa8Wayq9QA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The sound card support is the same across all variants of the Eliza
EVK. That means we can reuse it even for Eliza CQM EVK later.

So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
implementation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 141 -----------------------------
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 139 ++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 5e4175291f05..43d428a4ed2d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,151 +5,10 @@
 
 /dts-v1/;
 
-#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
-
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-
-	sound {
-		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
-		model = "eliza-cqs-evk";
-
-		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
-				"SpkrRight IN", "WSA_SPK2 OUT",
-				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb",
-				"VA DMIC2", "vdd-micb",
-				"VA DMIC3", "vdd-micb",
-				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb",
-				"VA DMIC6", "vdd-micb",
-				"VA DMIC7", "vdd-micb";
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	dmic_eldo: regulator-dmic-eldo {
-		compatible = "regulator-fixed";
-		regulator-name = "dmic-eldo";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_bob>;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
-		    <&dmic45_default>, <&dmic67_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&dmic_eldo>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&swr0 {
-	pinctrl-0 = <&wsa_swr_active>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* WSA8845, Speaker Left */
-	left_spkr: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		pinctrl-0 = <&spkr_1_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Speaker Right */
-	right_spkr: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		pinctrl-0 = <&spkr_2_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&tlmm {
-	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
-		pins = "gpio59";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
-		pins = "gpio79";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183e..726fd8dd6c0d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 / {
 	aliases {
 		serial0 = &uart13;
@@ -63,6 +65,55 @@ pmic_glink_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -94,6 +145,16 @@ vreg_pcie_m_3p3: regulator-3p3 {
 		enable-active-high;
 	};
 
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
 	connector-0 {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
@@ -148,6 +209,15 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -197,12 +267,81 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
 &tlmm {
 	sd_cd: sd-cd-state {
 		pins = "gpio58";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &pcie1 {

-- 
2.54.0

