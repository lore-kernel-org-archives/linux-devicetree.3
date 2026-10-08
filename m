Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C8245561A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493660; cv=none; b=bwgFpJNxFqPFu4YpUTu2UiLYqI7utdBxe+49pIN4UKehFgZYvA7a8LVskfRDBb2r62d3gbvDQThC6WDIsA6b8UDr9KoM3IOLzi4wW//smxiX1OdvMctW8N9dPuGlrv1Sf1h1vDezhgK5r8VIS2OQcQVSeFa6YWucEsHBcyeV/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493660; c=relaxed/simple;
	bh=9vAQXV4viLSEXL8Q+GA/6rNPs5qW+BgcqKnhkDr76Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pz+wpcNvAMN5WsAuo93wsxtKktb//flwZS+lYk2Qom0r6BvP62gOUjjtkONjAT5+hjfyDkI+2T1eSVChMur5s0oJqSlsEGESr4R5TA1rDutrlnSldvn+XcaiwtvcYsRQWSmlwNroUCZs5qIRhSEIsuUs32EqynGT6og/QH/YLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7Y59j8f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTo0jfC+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7Y59j8f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTo0jfC+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0B722534098
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 21:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+Vkc41unzNxew41NjqyUCYAnUjbaybiTMnS77qN/gM=; b=M7Y59j8fQ+TEaBv8
	KyrSU7dWjYUOkUXB5FaKj4gZKyOg0NTnvlgE8gs8NueMX6MkCVUpAgVLCnaPdLKb
	bq1QZBswHeH98+QQZ19RcqYkbjONhzQbN4pzcAtUFfbUoroEG/MkV//k/pPNsKP8
	ZUYX1qQ4CuI9AXNtZrgsJg2zhK2YW/7+QGBx6SGnh4YmEAIw1P9WCISIraW1hAvY
	rgvpN1nNfJaxiJ7lsn/+m0ORl7f7a+Avs4nqyCy+VtTu8YdupI9cbWNvPQNuU5H6
	cMwKhbprP3WL487wDKviA/sCfs0qkFn6r5NJHyOHKMPY0YssnIxOcAHfk+CpseXS
	O95rwg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev58xmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:07:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35158d674e1so1458527eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493657; x=1792098457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+Vkc41unzNxew41NjqyUCYAnUjbaybiTMnS77qN/gM=;
        b=eTo0jfC+DXnYafK5lbmhweA5c6EY5gHni4kHQZ9CD0g2Rkxudi4uzj+DWsfS7vM78S
         BjKn8D+VEOZia/pop2KvhdNXDDMIcMMEn2YcT4en7gOb5ZgSCIJm0BtPRtLL3QlZGEuc
         o5Vn6HmCcYF3pFAYhwCpB7IPlxpaER/dESn03ONOjQzmO05RHqFj42usXlM4YX2oPgRO
         mrumcjTei4aXD5+66zYPz4tHVg6Cns0fWf/tLaUjKZPnn0HPKRejCW/Bo4qLRZe0H6vy
         bWgu+xhLWT9vsYSBGH+RDnqmPB46nLlnZxBpKdzrzgP1e+W1RO0WIkda5e7KcZw2XMVh
         /W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493657; x=1792098457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+Vkc41unzNxew41NjqyUCYAnUjbaybiTMnS77qN/gM=;
        b=p+4YbCYpg9sNMxyNpso52U4Fr28/egD5kHz7vMyHd5ZASYpO5sed3OJIwMe8aSD8ou
         MS3MaU5sSQf9Kaz4VR5Y3A4soJWHRrY/VnmL/LIO9fkVE4pRD3YXBIymSN+2QUe7PmDO
         tGb818vPsF2fqd9hCK/g697gMbJ6PgdC8OKaE5kj8FM4qSdzCzX1sTVWswhdOkv9mPS8
         MVcaF0rPg7V+QyOmZgTepgRE22R0uwg+5GarAOM7qoP4V1o583qpHd9o2tmHQZ14OTxS
         mSbzfu0p1rnxGHLeU5APXPN6ClyIDsfsA4FIVQGirgFZPc5MZOxO0KpX8rmLxczK9TGv
         sAAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6dYv4LEoqKTuW7utG8r4zaxLWYUL54eW+SktyrjQ0bbOkvdhAH/7YWYS+GY6py1FN+E3ySsK0AxTh@vger.kernel.org
X-Gm-Message-State: AFq9FYLO4gmS938LNSW9ArTH7uphOd+0ImWUyfQcq7fFeWM77AEzNGs/
	UBuUUmNXe8zTUQ/mCDShuRIQNK/GjMrojtzeCH4c7sX8BfgGFVuoSLc2iglId4sw2ZQR1iTu9qg
	QAkfrfGUiY1wyhBl9w427aNMT6q9uN+5Nftc2bjvzrdgB3vB4OeXwPUJHztImiCNw
X-Gm-Gg: AYBFou0faAy7x3Wy9OagrtfPfjz2QMOHMsAYb8NFT9tJLr/AomG/XUagMFExjXGXngy
	1CV/I5rpaKjBQCPrPVhV1kDy2BjhdvhnpmlENTUAQ4rt57QA/4zhACzOCG7kdAJhmZ7xQxWM1qi
	MMiehdLePteLG2cfC4c8g7z4OEsNJ1wtOJWs4eq1iJ4+xMfNKjrld4SHYSZmnfTujHjnnSwhtFu
	UY6oFhiEsmHgVzfNrUTvkpW32ShMIfblWXNS6hs10yWPN7VknNh2ysJf4YG5A7mdJQkhNEI4///
	XtjD9uF5Sh3hJJm0iHcPhYz1H0Yk39FU8Dzv1/54GO+ZzQnynY29OLrbEiovJylrMYETMwyegFq
	Y7S2HDVOOip3IAcfEPk26w7U=
X-Received: by 2002:a05:7300:f144:b0:351:6594:94e6 with SMTP id 5a478bee46e88-3537e085100mr102091eec.39.1791493656675;
        Thu, 08 Oct 2026 14:07:36 -0700 (PDT)
X-Received: by 2002:a05:7300:f144:b0:351:6594:94e6 with SMTP id 5a478bee46e88-3537e085100mr102054eec.39.1791493655932;
        Thu, 08 Oct 2026 14:07:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 02:36:38 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: nord: Add GPU cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493618; l=12452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5jj3RJ/5IFAiCv3Rof+NOkHigaCXJnGzuVZWWhgkGNQ=;
 b=etf7fNy2G6qqGs1vmRapH2TDTAjQgPfxnyYBFzjsabgU6eSevsB+wqIoG/x7aXky4XUAqWrln
 eq0qXxmvSqsB0lpGmAQxudhEKZBQ4Clr9urEuC2ZMOxbwI3xnDHPMXM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfXyooN0Zw2+x7K
 o+mklVV5iS8f7Bf40mdUkgFKk73pdF6SEk3PILRCbBEZhe/HN9d1vqv0+i8+hKChNi4jKky7kmq
 fzrRxo74jVQHq9to6JqyM2f1AnS3pgA=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac80619 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oAcwOEFyTfjsga8YSwYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: S4AnVMWbgp9Imh437GOSpxpf18ltlQu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX54plrcbtpIhF
 GGVPCGEz1UNHVsFjbzdQQsqbrqhkFOjz3a8/Pcm8/HILP9qaXnjOZs5HwaJHZhSIa4z21I9/ywD
 QYJsCCBWncWvwUzbOKc5wQSKYsR1zoP99P5FW9RP9w7UGD20uLWdKPnXrv1UJuAtKhai6XRvZ7r
 6aerYm08RAVoNAyQVRery464D+BGdhLcsTploVgR+zYaSLo1W+kPERD2KHt3E1x/rv551UAvbao
 NYrwVdG4Z/jeDn6HjZIy+mzR7NWzfJnAHWzAabWBw6a9Qcp4G2/zA9CWHNvZemCGa9fEKdtrPes
 cRa88b0R0ZAiVAAMdeu9SBs3AKi9cLr+vQZ0W1ChL0g7wSQ8OGPQxJZPCZvTSU+dyfDax+FBW9D
 WDTHEwCznMWwaLMqUYHWTGxupf3VzgXPBIjMeKYfSimEKtWZgVEhQpHDncsnZ4n6Pc1FCEJcp/m
 PL7Oq+kHNaIHGkL5CFw==
X-Proofpoint-ORIG-GUID: S4AnVMWbgp9Imh437GOSpxpf18ltlQu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080084

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when
it reaches high temperatures.

Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
reaches 105°C. Label the GPU thermal zones and their passive trip
points, map them to the GPU as a cooling device, and add a passive
polling delay so the thermal framework can monitor the zones while
throttling.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 177 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          |  80 ++++++-------
 2 files changed, 217 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 4379092b7bf8..23370007c974 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "nord.dtsi"
 
@@ -2042,3 +2043,179 @@ opp-403000000 {
 		};
 	};
 };
+
+&gpu_0_0_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_0_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpu_0_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpu_0_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpu_0_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpu_0_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_0_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_0_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_1_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_1_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_1_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_0_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_2_0_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_1_0_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_2_1_0_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_1_1_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss_2_1_1_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&gpuss_2_thermal {
+	polling-delay-passive = <10>;
+
+	cooling-maps {
+		map0 {
+			trip = <&gpuss2_alert0>;
+			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 147d8e595a3a..b032d1d2ad9b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -4101,13 +4101,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-thermal {
+		gpuss_0_thermal: gpuss-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 1>;
 
 			trips {
-				trip-point0 {
+				gpuss0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4121,13 +4121,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-thermal {
+		gpuss_1_thermal: gpuss-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 2>;
 
 			trips {
-				trip-point0 {
+				gpuss1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4141,13 +4141,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-thermal {
+		gpuss_2_thermal: gpuss-2-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 3>;
 
 			trips {
-				trip-point0 {
+				gpuss2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4161,13 +4161,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-0-0-thermal {
+		gpu_0_0_0_thermal: gpu-0-0-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 4>;
 
 			trips {
-				trip-point0 {
+				gpu_0_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4181,13 +4181,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-0-thermal {
+		gpuss_1_0_thermal: gpuss-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 5>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4201,13 +4201,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-1-thermal {
+		gpuss_1_1_thermal: gpuss-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 6>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4321,13 +4321,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-1-1-thermal {
+		gpuss_0_1_1_thermal: gpuss-0-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 12>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4341,13 +4341,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-1-1-thermal {
+		gpuss_1_1_1_thermal: gpuss-1-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 13>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4361,13 +4361,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-1-1-thermal {
+		gpuss_2_1_1_thermal: gpuss-2-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 14>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4381,13 +4381,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-1-1-thermal {
+		gpu_0_1_1_thermal: gpu-0-1-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 15>;
 
 			trips {
-				trip-point0 {
+				gpu_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4421,13 +4421,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-1-0-thermal {
+		gpuss_0_1_0_thermal: gpuss-0-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 1>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4441,13 +4441,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-1-0-thermal {
+		gpuss_1_1_0_thermal: gpuss-1-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 2>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4461,13 +4461,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-1-0-thermal {
+		gpuss_2_1_0_thermal: gpuss-2-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 3>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4481,13 +4481,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-1-0-thermal {
+		gpu_0_1_0_thermal: gpu-0-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 4>;
 
 			trips {
-				trip-point0 {
+				gpu_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4501,13 +4501,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-2-thermal {
+		gpuss_1_2_thermal: gpuss-1-2-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 5>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4521,13 +4521,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-1-0-thermal {
+		gpu_1_0_thermal: gpu-1-0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 6>;
 
 			trips {
-				trip-point0 {
+				gpu_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4641,13 +4641,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-1-thermal {
+		gpuss_0_1_thermal: gpuss-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 12>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4661,13 +4661,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-0-1-thermal {
+		gpuss_1_0_1_thermal: gpuss-1-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 13>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4681,13 +4681,13 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-0-1-thermal {
+		gpuss_2_0_1_thermal: gpuss-2-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 14>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -4701,13 +4701,13 @@ trip-point1 {
 			};
 		};
 
-		gpu-0-0-1-thermal {
+		gpu_0_0_1_thermal: gpu-0-0-1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 15>;
 
 			trips {
-				trip-point0 {
+				gpu_0_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";

-- 
2.55.0

