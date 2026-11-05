Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877092;
	b=jmYMPFW9FSmO0KtbW8aM6W2CTfuwKv6T+H5CNF8h0tLuhUClo35fYX7peyA0hCHN4f7f
	 UM9jS4R3A+9YS37emJYdVGBDnaFkmVvHX7Q2xS7tHVkzgnpXUEcXWQQN7AhfwUoNQrC8J
	 wEU2+XQ48hb9H/l9ExQMOxOezEkSiPKmw0toOJa/aoUWYhRqJP3pIklBO/Rnjxa0BGt6V
	 kJuqi/0M+ncNXCN37F+mal7iM76Oytq7cG1JaK+msD32OGVSkFIyx59tscJGgdSBHerpS
	 dxNbXATrfIfyXpT3xoAdWxGp1xrD4ee0J2Fe+/ex/VJ73++rCsfdyLXDhmjWg4uXWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
	b=JBbkQTKwTWO9bMx7nRVoGlbqIzPRzOZeVVv9cu+FZfkfp2TsQmIBWp8yp1BM9vPLM14K
	 AcOtxk0IMXnahwTDMVLDYHepx4H8tCDv2iBRu4bWyCxlGp16NJjnDxtux85RnzKhOVGMP
	 UXIKJxPbF0Ua2hU6J3TfiF/y4FIfzTSnFKBsq8qhWAmbMu/XJ85JLz8DeIriHxGwXfCla
	 6wMFGwNNtHd31yAgFVj1N6EsG+mAa0H1I2tdivUV+spGooZOZLrkyDtQMbPwx7SI4dRjX
	 /3RofgbAWz4QmXa+P2KomMANyn7C6pbGV69krshb30uTKi5gXh4Hm9xLmuUxmEWJ7zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pu5/zBxq";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C11606D802
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C11606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pu5/zBxq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1U521416577
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 11:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=; b=LYU1q7hbol6nweMa
	Ih+LCLM9IifmB1k2NsdvECh0fURO1VTVJjDP5AK+c/gK7HEJ4yiJTAaAPN/plh2P
	QrPOsRrcJe9COmdca/D1hIKYGd3Z079lJ3OiUY+cYfj959SoHzONhU5sVOh+0dJp
	xsoTXxAxUrNpj8vvidFcdztPuNz+WiG5spcfmI9ZAe3pHUhdcIsI56g+gYpaESUv
	26IkDz84sZKCTvDHBaq3Ew6rcr98fYIokAuI8QgRIKFZBN6n0XK/7GUpyT8b+lEr
	FTzDDb3UcuFNAz3kLe6t75xhBMM6LcX1tR5p5pu33AQkJx0EOtp/QjyYo+z0xOzr
	KT75GQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd08pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:11:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so319183485a.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877090; x=1794481890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=Pu5/zBxqOnIOalaVvNSMdbrbDaydtUbiKphzoTewxLHsbhIHb8ad8e21d3sCVLWKk5
         1HUkaNYw3QARi9X3GJDRFLVLQrpWAmDlPc738RHVEG/2nHJDm7SdTpn971d9RG7GkpqQ
         iO9sIDCplNt1ZU1cTFdI5sOxamkJm83p2K6gm2RTDXqWrUuHHi9ZrEMaeIz+zbxpO6ZD
         OYDiPjT5zjp/+rkC0pqntOgwl8fsOfxg/Yl2ki9PBvO/wVOzBjEtaVefJXIWY8XxDrlf
         OHdv4lgZIRMe3kCmyVC3ZvRVokNlv79YTxscEtzKOvgL5f6dcMy84XXzqM9jvFaon6AQ
         NJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877090; x=1794481890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=Ps0vnJ56rVrbioghR7EsKQoWVeo6fSPK05HHbEWxFAvwNkKHp+0uIQBcWjyW32Sr1n
         BPNlspIJB/0xzTRFlCxPcCLr4eB7Io+kOePls82yR6zBtUzXKCuLFP3Ja7uhWEEhYsie
         PFTYycPlDs+rNvYWRLjLomK/TjxKZutBMDPV5bhqG1TWDkXrh9YvC0IKjZ4aoKPVkL8b
         T6Qqz6xv2uq4cufwYfm02chLKEZwsnkgJQzD5LtukB3E3+HosZV2egtRwf7BEX675qT7
         LrnBI4dqZr9Etl6ibLHofjWhunNjxf4phssa1zl/XCjv//9J3XvRrIsuCSZIxHCyw7D8
         ddfw==
X-Forwarded-Encrypted: i=1; AKwUvBwt3a0JFt1huEocy0R8D82XCASKa83tknTgkqDFrOoJIDi9uDhJ6UXzvsG5qqWkmdwJBX19ij8e/zFO@vger.kernel.org
X-Gm-Message-State: APuU4Z+SrV6cuxB6WeBm9xLOKcuDEKIDJPMsFlJdE+VbykoGV+cS04Ua
	/mIL42sJmS0xOlz6DcbUReW4dFTNvg2v6dJLTXMpoHe0f06YClJCdNZ9Hui8CLcPcRUS/KpKJoQ
	dNFdB3qVgz4ESeZ6jg21ohwCquLC/ZRPLlRRTrZ3+H6SiObTyTIFNRkBmGlh75xvM
X-Gm-Gg: AYBFou1q3VD9jUKTahs5vQJB4EI9yCfQKZwDWL+WEzvHNhLGbRJFiKBi/HJnb99WRsy
	qmi1VCJOfSRHBuAIoLFQodyozBcUF0VHxI252qojcZ0xJQSUVQihjShEo8wmCuo2jMZxfiNywAD
	GFJuCwjSM/wV9X5ktURpxSaQ6Mp8Gg57Lziq7Kxm/yRbGUKbQ3BCzOsxMsIeRYrBLEcrLaLi15z
	hKqF7a8tpMD8vjM5EbI/nnoao0QufmFd1FlnAN9SKc0ULo+mr9DjB/w1QJFmnJUXHeLJUzx8ZxU
	FeR8xdcgWVgVJ35U9LprAjpzqJCdVcvik2Usk/EyGcUGjPal/PDSQDRsx4KNmmrVO81Iq2T3mLh
	Gxwxe01OLiD3fdUS3uC4dZj9tnk5/4NMJsQDQVtyesLaJbp2qakmbuCEVoxrPN8VqjeiIjC8rOx
	3NIikl86ioj8Nyp4aEa8phKH/pRXxlcbljFltOD+3U
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041639685a.65.1793877090355;
        Thu, 05 Nov 2026 03:11:30 -0800 (PST)
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041633985a.65.1793877089727;
        Thu, 05 Nov 2026 03:11:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:10:59 +0800
Subject: [PATCH RFC 1/3] dt-bindings: mfd: syscon: Add Qualcomm Nord Titan
 CAM_TOP
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
Message-Id: <20261105-ccu-v1-1-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=1095;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Q3m2L70QHVhNFssz0d5iHd//KrXi34EuQb4Z/fjKNc0=;
 b=tJUyjpuxFIMXk3yVPv7pWbYsQQMLXi4d1roL6jwFr09gpB77pcSfkPDrM+jz0MMUgdXX+mAHI
 GAZHn2d/ZbYCRjZPtKEwPdztrnqtMsEyEjk98aw5f7HWCUbeyTDslPo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX8vjToISejvR6
 ILayZPlss1T2vhosrx/hhO1RKMTsZqainx74i7SqQ7zkqMIyt/1vhob0cH7NLW4lnUMZzxRFaCs
 UMSQGOWUitiRcuQPzgM/aCqczk6IQkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXzjWfIwNhlGvo
 WDgd/Z1U3Ow65wU642heTDd6unPe2ZNiK/un3pGJq4ki3FXzCfTFGICHi0IId6CiWDQ9wP927rE
 oScSROu2sCdXRwvIy46xFa5fSFSAGExJxoVNUSAQST7z9YBb28X6SrHYKidOQixt1skam8wKtxq
 5VKNVV4RE87K9sPhdhHxC93I6whmqkeDnEZHpslOqAVPL/znGG0k59W6NSdUWQjA/1rEIGrlyOF
 6iznBZnpv5NwEJeAar2KsucHIGLBnn1mYyqWDVQcCPhptnjbyP0XY7xRAtoSsYff4k1OULyfznw
 wfB9Im12Oap/OmSR0z/h/R/wAQDS7xYO4hlAMyNSSjw+p1uR2eyRm6mE7XVriB7kvCDjZee0jz4
 GwiOqB5M7yNP0LBHPzElZ9F3QJexKCeYGMYkDq3oZi8XyXztsoHVCReHXX7PNJbkOakKUOuCeYi
 +ZU+zRJY5EJc0opBznQ==
X-Proofpoint-ORIG-GUID: _MuGon8LFJ1kEmkuNjVmX-UOmYIDICfe
X-Proofpoint-GUID: _MuGon8LFJ1kEmkuNjVmX-UOmYIDICfe
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec6463 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eQjVoD_657R47FWD1NwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

The CAM_TOP block in the Nord Titan camera subsystem contains
registers shared by several camera blocks, including the CCU output
mux used to route the CCI I2C ports.

The block is outside of the CCI and CAMSS register ranges, so describe
it as a syscon for its users to reference.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca224d8dc7d8a0243acc49c253cccea..077c4037fa0ce4f1b93927579c2c326e7bed73d4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -109,6 +109,7 @@ properties:
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
               - qcom,msm8960-sps-sic
+              - qcom,nord-titan-cam-top
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1

