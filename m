Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517C388E55
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181328; cv=none; b=mK/0l7HN+B47C27PQ4xLeOk8xDLXZrSnk8zRVTbqqmiszbaRYOMSV0mBaK4iSWIX7ZjTu5nPIhfCDGHkpagp207GT2AO0f78iNejvMFZDMBuvopD8APsTIctHekosTtlKVSK8aZT8WmC795XM/fQdh4ywopxvqprhJjfhrXBUCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181328; c=relaxed/simple;
	bh=vJFXQJP096D6YldUoenCakW3XgnnE2kNJtgpz9My/6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwYSDKhv3NBygb7WW/FYvsp7ZKf97IRpdhNn0L+2a518bCv1549551MyyCUkxcBaAmqxnoacKZfE9EVQGMw/Nwdb2ESLHp6X4EQuHkCFjRhSgyJKaV164SEuQIuj64u06nTD15miCOSa0j+K5hyQNYGTMk+9SBld789Zci0fE4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9YmADEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+/SyTQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9YmADEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+/SyTQN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wR5U1412211
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfE+seesef0XrJ1w0q53ykOxjGZ6GwmOgnbech7VoIg=; b=c9YmADEIRFtzUHdM
	5nTR7vJ9i+goTofgLneu9h0WHVyBQvJLXqEyjch2qtRM2dKmf9wtpjylXBggX7AD
	8BaUHLGQaFpmAlflXRmgStOoKrGSGjWjz110+wt+6fVDISGpxSar7ZYBWoWJrIep
	/FzsKqZlQxER5iEPr665gnv4hciJRe/+2My1jE0Deb/CrGG4CygcxpmH+FLQfLRh
	PBs1RlPLAw+k4iSX9gDicq5tIZ5hAY0+HEpRaPbC9i4VRXZSkl/6icjdJFHKVD5u
	BNg+Ddt/pLPaAP4Kxhs+gNPM8oXVxgEQsr3IKbhHMlMs7IRyZ9y+YokcEoIMIxxA
	WM3fAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kacbkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so7122222a12.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181325; x=1784786125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfE+seesef0XrJ1w0q53ykOxjGZ6GwmOgnbech7VoIg=;
        b=N+/SyTQNO/Q+t6zYsX4PPcmE0ICDEvqlE/baIpGeibCuzxUfhOZJZiW3F6UEJXmECp
         A+WNcjtvuqi+zwZdmDBAQ+d9pwCmu76TDINvWk5hcgj8ykbZWWRESprSyc9+CqyR6oII
         ZyBQ/q8W7Q+ficn+HjWjTyf3Sjfbo3PhLzxL+0MQHmmks5KzFNYDgo0sclWm91m1BguV
         1oc5ZHazrPhegbzgRP9wXpD/5YCyeNp1lBrbYhwVOwx9Z/Qa80i5SjFb40m6s7RebUf2
         ktVh0axSaA32F1gzTTA047wYyDvsVqEeTajrFyYaYqaux2du+y1vHLeKt0WWIQ3bZ3xW
         gJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181325; x=1784786125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfE+seesef0XrJ1w0q53ykOxjGZ6GwmOgnbech7VoIg=;
        b=UV+/yxGH4pwu/Rh6Zxnz44rBtJSzU7Zbzyk34Ojrntq1o6FCN8VLAAgsBneiirt9Sv
         Fi1tUi4T6tLjYogI6F+f5VrD9Mao4Dk7sCisl+xYtQb2QFFa1OL/IbXOCu1znc2Qg/aA
         s7mMVTKVKrG2oRKUPefVKHiN0Xv/VVNsHkVuQhmY9wrrCzI2Q9T9dFmPPeeDD4WBKbtj
         uuX0O04irldEe4FfhYgZQjqT/htkgsqJ1fGgSmvSeCBhQYuTYm6D1WBqcBOaKdI4psaB
         s07Q5NxcsmKeaas4sTSQbUHnr1Cs1wCdzgdRA+RHJzsngly5Ft3OwSGyQ6+YvNNF45oJ
         UKhA==
X-Forwarded-Encrypted: i=1; AHgh+RpFUkDVZEHvAzauVAZyNvX452nYENcUqCwZhkfXBmnaRfH5m+nl2Z2gmxLDOkGS2U4XV755jxUktWiq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6FSTcmW92qC/MeSc9Xy8beRXBq7ZhojpXX9VlBbio+zcFnt5
	NJtzZDidk3o2NPFy4jrrQb6xbbVX8ATCg/IeFcxupN2clfBgwdo+RZrRh0TcGKxGJu1f0S1cqoo
	9HQ2t+4gt7DS1DidvF2RJjxXFILLEIGsAXWJ7auE4rrozIkIcCUL2nSQX2EDuUvYN
X-Gm-Gg: AfdE7cntU9Rb/Eskx6MvWcEyAcyP7y0Iwp5Xa7pnPY30apIdhkYSb+rVP/vIt0xN/pa
	q2dPO+8QyfssShdyq6i3L7dE3I782bXULtaRhsQoKfedJrQOhtDgmndcuwtmTeBr3G+jX0xMpCk
	1GVpzBBR77nnQKUGT73nNt84D3XbvZOXzCkr1Zb/AQRNwhBuyZs65A+zj9OVPbuBc7TdW3rmwcT
	qRETz4gjDdfCTLkzzt3npA6hZKtB5347iJcBJoI49wo+qnZBBmLFQrfEzkaamWQixYjGA4X8oyv
	ESjHh1gC3HC3DvzczaRShKDogeYNM5rR1mDnmd+/2FLKyzE9L5RW3452BBfIBTUB9d7cKgjgBR9
	ojUNig78yGC0dEw7PUdxkiR0C21NHZn1zeXvSCHl0/MQm+Lk8hM/uRh68UKyrbAJR9Nc8+Nc7GY
	c7skXCGfm4u+I=
X-Received: by 2002:a05:6a20:6a22:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c380418fb0mr3931301637.66.1784181325401;
        Wed, 15 Jul 2026 22:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a22:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c380418fb0mr3931272637.66.1784181324967;
        Wed, 15 Jul 2026 22:55:24 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:24 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:25:12 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI
 mode for SPI-NAND
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a58724e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: U6FA8bw6WiJJ8eueCmJX7JvMQuiTNWBW
X-Proofpoint-ORIG-GUID: U6FA8bw6WiJJ8eueCmJX7JvMQuiTNWBW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXzFUReb++d4cQ
 NN2yF8lcRzXXEHrUkJnHKx1O//76egKGd9RpMjyJ7qVRQubgSXX+14xDKmKRLxn0wyqr8av2kXr
 bsXA57qDGqN2ySVuG/jC4y4so96XhQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXw2EKLoneqS/3
 YpYA3rNbNnVA+f3rJZVgP5ASzH0r/8kC23FoSe1AF8NVi9n3yd2Qpz0RpjEKwBuv33yvZrhx5ct
 IoW33K2vtiKl0Fdym6D6nKtrQ4OofmO/ja/qxw0gjc0g9lXVf4Ek+YFGd1Jhmh0dv9pQxcmzmdP
 DiXSGXpgj9/yzSfdBrWzShJ8ck2iMeQqA97oiOLGPBu/kerB257pNwzFXee68BTufXM4phrORC8
 fD1yEVinoKR4WkQsVkmD+BsK2u9hmKo6nDiYjT+pMKgTDxsR9M0ME4KCuuIpToyWZkJZZZgNCnN
 8thy15l2jlc6hhqZiKRq5e/zEei9pDqgAqszESCDQT1PpmwmpAF6PtmmorcptZXZg79GEpuSjLQ
 MTyN6P43OelDOfikG9rB12CIh88cESushK1DgpigBHC+5MJ8hbLpxXEjxjrsFwhpJK/8YX6apFM
 akJenYtiykRbfELMhkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160058

Set the SPI-NAND device node to use 4-bit transmit and receive bus widths.

The board supports quad SPI transfers, but the device tree currently does
not describe the wider bus. Add spi-tx-bus-width and spi-rx-bus-width so
the controller and flash can use quad mode instead of single-bit transfers.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..86138529ba77 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -249,6 +249,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 

-- 
2.34.1

