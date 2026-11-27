Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794941;
	b=Jr/iLhZKmo4YEjI8O+mk95O2tYq+nDSF+mmPq8qe1XScE7oVM6vZ6IeC8uO+OtRXiuHj
	 7oXxQOApusVldQw+uoiBlpCFM2AYBTIkmfBEG0YCnosDwT677Wu9VI0Z2dthYLJcyoH5z
	 KVpw5LEO0zISSIe8p08n+g0vvBOKSjfcsDlAZo17MGzWHMBKEB6c2/BeyQwI2RoElnRBT
	 K4IPQp6AtXCd0BsmbXj7pSH688AYLE6y36QIiwqnhUB3jI5n0YQbMgiatqhM7f2d3yrWA
	 KEBd53/aNQSQbOl/IIIDU+7PARct3jCaDei3tZUZ2D9JVUmanV4uSvuhSAte4Tkj4kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
	b=n67+6fl6z0prX/sYjxGohFkK8McuBSv33ZNN1tG7BgbciRKCUivcwlvgAQDMVibRYn55
	 rAqopWM1LuHXay0slCpO9vh6s9Ok99AzahnmIyEcy0XRHJfN4AKCBVD1hKDJ0hIDvzUzl
	 JQIvNJ5wy6aAOmzbPmVjWLFwhfl0fhOhluHt806YDLu8c3ogXvPTlqHOt+UClmzN985z/
	 +6yWO3q/Pe+uGLuC7zMjOaFIXrZfCPIdxctQYpsky8Cwocb+A/jujbHff9acxzvZds8KQ
	 XgSWfw1luCzQ1NW/IMgLSUNzCvQ4VQ9rTq0+OQGFraRMhgk73es/M8v1hpBTPw+wg2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VrqLql/8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841FE606A6AE
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841FE606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrqLql/8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp20t2617456
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXzrguSt16b
	KvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=; b=dTXtzdZyWeZRYd/GNpMeBB2pnuR
	TFkZsnGPJQcPVKJ+V48d6gkOl/DgxoXyhai+2o6osef6fWgTCfF7JSmroOfTwlK5
	rLEhZ2eLyme4c/htPanYEYerA5mGWrhHx1FcsjIPjK+/hygapRd9Epb1CeblhCNX
	hd5AZNCeuxX4WSdVvT2pPstTyKHfwJNaZKKVOeozSMwiCu52a1EwAZ9GaYisVF6a
	/B5nDncfze1e1uMuUxgIVAp4JE5vxqxCshTLSTIGCRaJuUNWG4UGNYHA78/RKRX+
	e5SrfxZkAEZfNfzLzP0uyjfY2VAnnBaPWnP9m4FrT9+X1HljG9pDMKvvr6g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hurbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210357af78so128566856d6.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794940; x=1796399740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=VrqLql/8foeES9Tvrh+Xkd/aFXfRM5epHuXARmnH31gJYeM+H/i+NYCTrF+4gZyAaC
         934eajCqZX0IGiUNFg8Ez4LHezV4xGggmXZ/aewn/KaXRd3G6XL2bkBxrTQD5aqB1/PL
         bUEPRxixFbYpWNXNKssYXsBowxnlXJJRPZpbrkpBf4g6rOrgnjLCjh6xi+AlfTSE1CAN
         mNqyTszcyTDav9+Gph4HJu1/eJYz0d1VhE6PK7h/oIhdZgqVMmmOWGossXOmkdVvJseE
         9I0P/JSzG7mHGB0rqSColiuIKN8PqId2gwhCR1AcRMD7lyqDxFiAoLiHxHsRllASeniz
         Ni2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794940; x=1796399740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=iIu+Usbekk9ew9m/9nBdy04aM8vak4TFFDKwAuIk7vqS7hgRZ2A0qX7z3kYUs00hpt
         Pcrj5m+zR8id7sudIdCzq9907MlkRIyYPfTQSIUQe9zPmGZgLWvLqUt0VZSsuEGxM5en
         j87k2HSqSLO5SvI3tdm+BSoPp5h9E1BJL8pQ3igc+fEPC7TYH/N+cyAdvPk4E5XBewRX
         +XadLo9xLsTPXEi8Cplp0LOLYekL8GcZdgOh3TZQLc5JbQ8RYAOimCUHBF70WgFe70uP
         n/uNfKRJqko5w2+LBG0slyfvmlltvccXnllgkeKjvvx0j57hA6Ghay7+J8YtUzh4azLG
         PdzQ==
X-Forwarded-Encrypted: i=1; AL+hErEFnaz0Z2VVK+y0cl6eo3uRigr7KBYSJzcSdVZvJzTO3flUFMM6vqB4HQ0ncy/YnqM+/2JBtXN3+Kc/@vger.kernel.org
X-Gm-Message-State: APuU4Z/froQDhuSgZ5tEXrghiJGTJrNrAHIO0is+djskn2K6gQV9iNFr
	7beEZGXxdtsDPWU1ZzRTEBaOZeS9WWGiPxyGNVSMQh85841bco+1vJ19YoKhq1qtBrNcQx9WdsE
	agVTh4v2ypjdcej7Eb3CV0p/vftEIekT206z9uEUElYhfqHCNavNeRkCwXLr7F5+I
X-Gm-Gg: AZFdTZesyuNTQRY2dJ1kCW0oOdnWY/v7UmM6NCwuqyKWZwLZ0qACOvYEeH/0ZVRZRF8
	qdmmxfr6iMfThFnbdxs45su2vo2wpfGbDf0KKU6kLCQujU4FxQLpcPbuN/wU23C4CB0OSluvQ0z
	XxtFmy6r9flxlBaryIepYPwyh1iENNxhBVAcEJVVbKWTOY7XMP+GFnM5W/9wavdCkk93lned+EG
	f3dh6nvn1BClWc7AZGoS5f1ms62Pk7NcXzi2e1/MDPr6txXlMqIk0TXfpoDfKu/dlHN9KVktbDv
	w4diPZFucO8LEVqHjU1N0WWo/GrNvJ9+xLoV2pNivf6jnC3NRn4ybwl9mPKgCkY8k6nZWWGVNpd
	OqhFmoc6Lwrre3zl9yf4dU85HHxA45cCr5YTrQFV7UIZcL5nMhgvtlc8DBdHoSYMU
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431889285a.42.1795794939951;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431883785a.42.1795794939516;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:17 +0000
Message-ID: <20261127155520.358909-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXyZW65/gnmbfF
 Q0Um2AmDPSZJzemYhVmcNLeD/OA8W3mhrQgW4Ro08C0E8Slrqw3uhC96KM93A4oBUjh8r2SQPBi
 LnsVJGbYEYdCxyHcuzlxod3B5pUNEKU=
X-Proofpoint-GUID: a-34K9aHGd-hdCfyquGDnoUpWr2sGZ8W
X-Proofpoint-ORIG-GUID: a-34K9aHGd-hdCfyquGDnoUpWr2sGZ8W
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09a7fc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX+Cs0Mo7Ows+a
 FBm6QJk49GfBNv+az6rwF57yfFL6THa62UJGZ5bcUNxTxHh+w840flz4oW1ySuYiRh5rPDdQWdi
 uVtqHNqlT1wj8kam8PrTle5+kaJiJmmxYOelTT0m/v9hiJDTzsA5s2QtnGGNOStWqaNljG1UGPT
 4PsxZ56sTwPpcv4H8sXl3bG4/XbL2xwE6ahjCD1SUtv6rBV12iSvCKKAOOoDNV9b1Q5vHfp+ANB
 mQqcB0cPKBeHojwyq6vuC/iubZnJSMAo0PQHVDJbbm6QCiZl62byp9UsWDfzAFNP9helHOHRelY
 cLZQ0+QPgU9u2Bk9XPNmsE4ZkuY7utTXC6bWz/nsp2JC+tye3Ng635CLkeLt49RrTPcuJ7eDbyC
 WIKcArGqeUhiY0JVOOpMWlX29n9epSeoieLV4qQJMSre0R6Xaf/fXLcmGOicrdoBpUE8e6yNEIS
 ZPgVWk/2Q4zQzeYFDXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 8e0dd2956882..cdc24b273877 100644
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

