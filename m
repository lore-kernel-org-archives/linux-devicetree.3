Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112038;
	b=QquPAB5kUpJ3W4X3X9mKhgPAcwUbbytmkozCKF5Rt/fjDj48tCXEnL3TLHifLr/L4h5Q
	 M6gzgvXXPPZPOVoGOJDXsD4kbVvio6ETk/lt8Vc4WTWNv+HHC98Msw3dzFsJAioBCVzj5
	 D7ycF8Fo1fwT07cPYVxB639i1gkgmsMExhQsxOyibJ9hgkN4Py6mQuMtnXH6tecBMjQFF
	 wqSb7dQZov0XeOvQSSGwP3OC/+ZLdkeAFnsNKXmFZNjExkpjVLTQiW6LBV7Y1y63Czi8I
	 g1ajCKYy1b+HnKpQleCexaETPWGFZIV3XkmxuQeNZzIDfxtTn/oFD5Boa3bQ7+un1lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
	b=4nX2Jf6hoPCBW11fXygjcMAfmkuNugE/2VB6rlxzUSowkYMVodIB4OjnV/Z9mZpQlcSK
	 ED8cu7bAPhKQZrCzUKqwrebaKegpai2Ob5sJaZbAF2fn6OLCNMTqTjwCsOgFhfE3y083x
	 Y3uqe1uKgb/fy5fURKkOGMIhAFWfCPi+lNDLWh0y+x1ryLH08EhiZvMxxK4MDPCR38VpE
	 9IggH9JotG35I5wYJV6gpl/RksvksmB4cNOiRm4lHLvqhCm62YKQ0Bl2NVedIgaEahWy3
	 MF2WpqgL/an09zr2uSy9eMRTYfB2ayHHKnzzG6W+lwQPGQn2orfn2SUelMJOkcTvciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2P5ERuc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU3fLrrC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACD606A330
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DACD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2P5ERuc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU3fLrrC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGtKal768634
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWD
	LPYDEugQ=; b=R2P5ERucCv60pTPsDYPVrEIwI4sD0lDM+7KEkHFBujxdN9DW0r9
	Tvfnvyq4g9lYWtUG7a+I5Sk5zDzVQf8Ofsksl+hkcO8dASH5JhhpK/89YZp6DsWa
	4a6h+wXXAqkowlKD4v7kPPGlPmD4SysRbKRxScqJDGEazO3oBXsLGCUdGCQ/Tz+B
	ZZgYPB+gSvVrf8EI5JlCIdWB1lEp+/9OtJDj5lMX0gwqs7RbyvIO3X3qCvvxhv8z
	onVRvjzqvAg23O5mRCGZLOo15q+XO7ptudxc8JnAWR/Mg78frsov7eBGZgKXyVFO
	zhwg0av5AKMm/xPUsPdEso2orJn7uPlo4fg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2twm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:13:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso1240337eec.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112036; x=1795716836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
        b=DU3fLrrClcE4Q9S0CJmJyVh1Co/UDhcY+3U38x0wKmAYFxyfoxahSdaGMNcxnla2Vp
         DLgdhQLek9CeFR8eNa9xX1dkSnoA5c4OY8x5oXlK3ijJ6eQerGu4DogG3mcH1A7CfShZ
         BIwZkR74HH8wzWCfVdb6S/YPegjqSN40efaE0FUY0vonb9gUBZVNYha9BowvBbljubEx
         a+fyK0oO0WVXoUQYXRuc/wcPYif6YMtGs6dJrTM3G4gVSSRhhKycLC4vtEtaaO6ByvRj
         OhjOE7PLeqYmXPWQ2K8Ri9O/MHGV3gIuG+SRRNnLQzks0ygPTSRrA9kna9xrBmFBUzw5
         F79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112036; x=1795716836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
        b=0LBvxlnAX6vqL9Y6oNGu8BSlsNse1SI/bFfYc4vhACrhAxT6QS6FSkagvLzqGjRO0Y
         /FZD69+QtXKPkp37nWGc1nQ8/zQb/o9pv+7Q/4Jt7l/2ZOxR63chpsiEUjvhpf5+KxtJ
         jY1BgWXcaSKmp4exKx/He7UOnSH8GPjx33MUwaXWL7lhmAvkdVO1QHxk0qCY2FkmhOmG
         dFj4A1P1UrOn8aAvAg09RUy6q3nptaIy7XLHqql5tn4DG8P3tTpVhuQ9L6rEhqQx/LK3
         jgt1GX0y619Emu2pxN5BcWN838SC5+7VTPwwmuXEimLEmCRDfvTuzlaO/s3isxdpe9TP
         Z9gA==
X-Forwarded-Encrypted: i=1; AL+hErE8rZDl4PlUw50fytdndVVtmQX24u7peXv+yPxQ93XMwYaXcj38/f6KTMUXRNQky3KHvpfgk0tWhFGD@vger.kernel.org
X-Gm-Message-State: APuU4Z9frRXD5EjYuSxokPrijeWH3+x+t0qfuSe/02fIQ4ZHDRPMBp8L
	CKprgxKCThJeiNjJXU55L1ThWLW3AllFdgkGs4QcqJ0//HpuBBlPLmpIJl6irgwAVviHe3RYOBJ
	wmkumNJsDuMK/+X5l/c52vvnJBmN08BV/Qdo2QoCib/0VdZc97o32mQVRAd6kX8cG
X-Gm-Gg: AYBFou3loZM2IHv3GvcurjqrMhvxucOMMamzgzzc/fTxZxS06ilmzPNXV3ih/oassFx
	Zezyl1Tgsm+6jAP4I3V1//BSwKDrKdAupWurlCXq12opqfL9tfF3PAp/AJPYMr7iORzF0YINSDV
	SSL/Diz+MXFv6VI0Of1C6uL2+PedtylV6yZKgb7/8SzkChlgX6YQy2wJBpJ/8oQRS+hgpocR8zk
	UbmQg8AGHZr2+0vG08DaFOSJFGV4nNtRXtQkUz960XjaQx/DxP8/7SmJzxOkGLYV2sGxJPb/jEv
	ka7E14SuTqQ76w/iWZoAbYsRQGCw4d4jRwEIRVPsdeT2cnDJOtjdE93cOvb9Ir+NJe0Ew5oaJUP
	SPgQdYQ2tvCOr6uogU3qdoW8kzcgltajcW6L+wGL1ccW++paECO+/Gc0J3LufdsuRwP4qC7HIys
	IXlQ==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b5525f1012mr1583835c88.20.1795112035788;
        Thu, 19 Nov 2026 10:13:55 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b5525f1012mr1583814c88.20.1795112035257;
        Thu, 19 Nov 2026 10:13:55 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:13:54 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 19 Nov 2026 23:43:47 +0530
Message-ID: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: 7ni_ERCEC_GNl8UJM2EWlTd9t4vNhO8H
X-Proofpoint-ORIG-GUID: 7ni_ERCEC_GNl8UJM2EWlTd9t4vNhO8H
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6aff3c65 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=kgeSqXWK-NLqBaGKez4A:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX83qyopCnbw9V
 U7eB6yqYNhnSByRoYqfNMZR6K9z1i5XYhH5VnGQbbIOW6HKMmrRTPFPRNgogJOXByRvJ9hTo4Jn
 IFl4Qu4LY3k19mD7C1tW7VBcLMvxABs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX2fdxlxM4k4di
 mntBJGZFfhtGhstyrK4Z/9njOE+qJAJhAHCBvt/1NmE+NJGPpAZskdUjYne7oO9TSydN2aaEfza
 b7xSfb410kTL1CZxSqSkCWyYipSKizfAza/FpIIC76e7XXcHbMfmQxCVRuRaKavwyBbw/+wIalE
 U54NOBfzci0HcWgsWMtRnme/zBDXbDDLm9zK/AAlJa1c7ONrsNzAfin8yXQ0AxOBsKN6WKJAprA
 69EcFWKjqGPoYVNZPvscpeDmG7d6tVwg1QQVF1QvRvyxYBFbqYepn59VWHDlvbAzFnrYvxcKW26
 rXXs1XRlzcdj9u3/wjUpQnush8ZkM4HzYYveoiTREmQbuLttku5rC4J6LI51Sb+44EeY55gSraP
 6gfaUMmZK6KsKS3VztKznHMXc8YRaD/m6O3/foEv50qknQyS+jH2LTx+Mv7CBCLucErRbBlwMT6
 JWBLX6LyjQetP+3x4tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190072

This series wires up the CYPD6129 UCSI PD controller on the LeMans
Draco EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

Patch 1 adds the shared OF graph port placeholders and
usb-role-switch on usb_1 in lemans.dtsi, and drops the fixed
dr_mode = "host" override in the Draco SoM now that the port's mode
is determined by the role switch instead.

Patch 2 adds the CYPD6129 controller, reached through a PCA9546 I2C
mux on i2c11, and hooks up its two Type-C connectors to the usb_1
HS/SS endpoints introduced in patch 1.

Akash Kumar (2):
  arm64: dts: qcom: lemans: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports

 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 110 ++++++++++++++++++
 .../arm64/boot/dts/qcom/lemans-draco-som.dtsi |   2 -
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  20 ++++
 3 files changed, 130 insertions(+), 2 deletions(-)
---

base-commit: 42c51622f624d32187e9a833178830718de18ade
change-id: 20261119-lemans-draco-cypd6129-v1
---
2.43.0

