Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718307;
	b=ZJJNVi9i36uOmECJxz1nUvZ2F+ftIaf6TFDmoF5/NI2u3IhAd7QQjFO2nkiQPTQZp5qC
	 Ky6lYujiX+8s7s4MC4O5TNY0kEb+9kzd4zoGqR3eDkVQalUY3/tUelQDJ5VaBEIv6EoQN
	 6m7YqTH1YSu0BhlwNjkAmypDeum0HRK8oBjyc3FX3sfYACOCk2afu3vH57DDXeUMMHgTE
	 n+1fdaVBX5TXVNHjJsbWJl3MaQA78+PB8UYB+zfJCzu7H7K1VzdT4YJJmlfxWUjChjVpr
	 hUS+mP8XxTYSM5GZszHoi7KYIEIelKIuErMshbaVeArmtRJH3eidKTqAbTqkKHRMiaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
	b=nnrS/szpPzqftStCGQoWdf0NJP+XCU5ihV2IqPo0uYX8Soj0rpd6yrrtJxy7ChJ9DlpF
	 eB4LC62N92N4IovikUb6mvqZvn4h+huYwx1xDkmPe1J7pBSFK+3tURT3Omc99E3PxNOAo
	 hfkv+ZR3sW1FQkgeZUFkpQTZcGhnro7oe6NHP/0Zxnexsle5vg7dcmx9TVO5zevcmcI5l
	 owV91G8YgFoKmYjst1Fsks3eMmnVOWNXn+uzb8yFm2u6bNcSm0tnhaYMB5nW/4Hg1RjeE
	 BsjoTEWZ7o40U0llwDHd77POY1HZzkDKfMQsbRUp/j9NoAJ+vuLEiUH510YV4LTWOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JST2GU16;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875960A2603
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3875960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JST2GU16
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQH3EGt3470848
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nH9UtRA+iyb
	2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=; b=WW5cN8+2V2noCVEsOBkEE5TPXCh
	gTqFl2XcpTGncgwWJWlyGdcRs1G5/mmhUqkCaRlMFkj8pMJq/PLusOuMvxKdzgEm
	4zKw4r/5qo+qwYSDtDoskm3Vqe5tiIsRPQBxTZmV4whQizrAIQot8udq8kciREIH
	DEhwbTZJSYd+GEpYnCUX+kCAF1en799LPpx8B31lcAaRWtCteI3xAuD8mz07QUmb
	LUBfknojAU7TQrkAsMXj6SxX6DkBO47s+7QjHFjW/Hajcz5WNPvP7rOaHISku22+
	+8zVr60NUoK+R+fmSO0JQsq9jTJ2J/kAgaacdV3C1k9e0iFoOGtxJvprc2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru387tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so1328822985a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718304; x=1796323104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=JST2GU1606dezn3xdz0oVvFmUAQUTezcKlYjF6L7s/LgL0jzEM4qTYaIO5lEDz9lyp
         dQ26XEUk2JzX187+WmWZQUIlmEyMrcoqWkxnvEnzc9bIm29JKgFD72NzoFmjOb7BYjQI
         t26A+ZYBcQusqHcqImGP4ZKPDDZI3AHxCyCDsGSPiMcky++kfM8VzCEYrErglEMtmz1J
         36rcKmM4Acu1tT8Ye46GEirMvNPN0S2OB5a+vrDd27595cmA6qhLXpe/+oOsZyic3VjC
         yyxUf2lfhXWPHJvepi2A0ImwqWx/5SB5BAndbWrSGgxseruLabHPDm8oDApxU1BDgAUF
         P+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718304; x=1796323104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=kvHFLVkcW6KavbIhc3QPwJYzgxkfFNU258Y1r8eJmjltivhieRxS0XcMHcAYnRyPie
         nsQM+TsVSQN3pvs8+aQJXhsH6l7pH0JevrRvN2xWAK7VFrL4VfBOzvZYdhkDtJKeKAiR
         YthU0stuo/kAzndLsQnTdtGtvh90hDada573HkAQ5FpG1OBUTMOBPmwGQNg8clvif9ka
         1CbfFnrs2j5YmWMNdoNjQIU9Xg2aT5kKi3bc1dSnd6lq+ZZE0TljghhXcNVN/Sy1K9Lu
         spsiH71/AXJuhnde2Rk6EHP7KqL+3XIeFSmw1lh6ts0t8ynz9kGZFLzC1oNpBoNHQTBN
         6AgQ==
X-Forwarded-Encrypted: i=1; AL+hErFJ+PtHI5NImeUUER56uUiBnKZk0Fx3rVKTeXGVuBMdq4sGpw6gshcHZqGD98vehauZzlw6pNCpH21r@vger.kernel.org
X-Gm-Message-State: APuU4Z80s+zOQmXfy+uhRaGqcsPetI+lvaavpQBKeS1MPuuWbZu/HZTT
	ZJGF6rEzW7tEzWMeEMflaVzGj4z0GMjf9CvSE0vpNgczKI6ONs8CV5kZV7y/dPKxiAm1iZ6Enr9
	kr8mTxaZr+oMmWD+cuj9MDW3nOEaovzVS2SVDqBhcCCsIOcP36aQpRhHCHsgIUaln
X-Gm-Gg: AZFdTZfiEAWouPBNlx0/MNCf8YaPIDr/5uCikGBPU8NqnJeHr2KNFlT66U8+fAhMaRq
	hQB82Sre58j8PZmln1XUf6a3OC0PCTH8DX0QYlx8S4h6CPnD9oeuNFkq4E5dqQphm0F+TSsOsVM
	HoLAEAgfD7rpVOJugFh5iLdj6Cki/7wXiAHzW4M+mBWULOURuLQ9IQIT2RH8ot9aiD1WsbpxSg7
	JL13NzL9GJHUMr+DEJ4An9+EI9/9RoiJXq8geBcmKQuRN3IPwHFe29zqpRzlUUpDFPyFADXJ4N2
	LRkLj3BniYBSwk8pM8Sh0xMvaGaQYUjMXWuxjwoWwI55CvXIy/ls0KFsaNvjBYHbp1B4rTnc5vV
	I2SdUTk35q5DuUBZWVu4RT3m5DWOvEIHohoyfC1x8K8wbIeXwUSpzSReixao9Qhzd
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223073285a.21.1795718304567;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223069685a.21.1795718304127;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:03 +0000
Message-ID: <20261126183806.172485-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b087ca1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: VAplskXuCR1ipz6cX9H8Eyd7qE3qAgzi
X-Proofpoint-ORIG-GUID: VAplskXuCR1ipz6cX9H8Eyd7qE3qAgzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXza9lbAsn6ddS
 oFXKpUqX9vhquOovxzrIgtY988Owe7fmhocuY1/0ZSpl9cqMMZsVJkcQPfuryCjOEPtgVi7J6q2
 UAE5PYdR5Gb0v0UJsyxd7U83J6Eb4BB2Y2Mxj8RD+V+HD6KWPz4Yk+6cZocTGLQNA1AK0Ik42yv
 meMKclFoYhIC4yoHsyIYrO1mZInai1wFARgTeqzsQSOG+hxA6WHlTF5IBaBFwE55gPYJel3I6NG
 zZnGbApQjhHGQ0uvWWW7XJWZOibeAsqGlK68tOvIuMyk8SXSF2xcjUALvGAs5+OAYVQjuKF9sGQ
 IIDX+6N2nqITWzM85nLgNTzI/poWKVFXNuX9NaPD2gZS9rnRlfGob/eBjrF8dVesrAIFWX7+8tZ
 Gw2ch+nroroJMChpiZBY4oW3Zjuy8t1g0eEF8ooATk0zRZSrq3kCcQPO0/aeFygyVO7h4RzTVnZ
 9qqE1y8toU5XWDbS4QQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX6sGaV+szUJdn
 qMS21oVnJjQAlonj4YJRww+fDX5pIHgXlzpcA6ar944t55OHfJjrhdBVJYxUBLNoP20FGtaJDiD
 zP9x6d9IaVylQu94WekHCH4roxu/WUc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index be0a2cf10f54..5428c6a45ad0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -298,6 +298,38 @@ platform {
 			};
 		};
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.53.0

