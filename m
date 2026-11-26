Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702547;
	b=Z5Dw1f7RY9Qaltdy4pfhvLJsw/Oj3Fmv/yC47rWtxk1DCHL5y3r3dWy6dbsmbA2vD0gq
	 niZHtGL3OVlH8DaNSchjnliYYScAC/9yNjQGj6nSWS3J9K9YVzjohePCQJNcwsRC1U1Cb
	 zY5bTNzjUW4Ky8CDHWSodYY/o+T2nBu+SLMuN20y7i2obZgv77k2/xq9xQ3vbUU5mWPUa
	 DRzwLHk7ylB6GPwyGgKYBfdn9sVrvK9gtVyUj/a9nlS5FrcJFcTOubiwJAEqhpszaGD/4
	 vUtD41r5EtwgoatbXMJkqN0qlAeIGkDmL5nvV8kMKKakRsdjk/CFF5JEkMQbdZE7hUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
	b=Q+d7p54HnN65Rnn1s6eOb/ObO1lVisCuBIghzq2PImr9ziLf+34u/4lfQCBJRYLkRvOm
	 S5ajB1suEsRQEkkQUejDRBf2IAiqqdXIYgNX5wqmjXyz2+z4ej9bb0MfTxI2oiVn7rXTx
	 q0dP/HHRV63cRyi6Jk+Vwievhiq/E7p02VvThBj9H9mFp8GWU2pd9ZIPKFj0e2x4vMIIX
	 QoR9J1kTKhq9SGSVBhd1kqiExNSSyBR12YFPrlpgk9x+bMoggJKmMOi3I8F8mSeUzU+YN
	 +jFmAOckaDifvijtSPxv7Q+8UlfTwtPV+eZdKUgdWZPTJpzp/eXy1O4VmocM/Ll9tvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vt1B19sW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2zcEPJ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B85606A333
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B85606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vt1B19sW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2zcEPJ6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVc8d2758861
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=; b=Vt1B19sWIBBA4mMW
	vnVJHGWXmelLmC7j9BsDV0rHCG1XZiAo9Mjc8NNfGKQRkudTdyJaFO6fQEW5Kq/p
	UFigf+BLWjKt87EiEaq8w05xNwSUUKucQ2jBzkU8CtxyRb7GzUk0Df4blpTzWoKk
	iXwfaRxxE6jIng6Ii+ZLk1pGMzXdC9qhRN7nbgAhexaDMTRT1ydU70V+aAjxEcJu
	LXSOiQ5MS5xLN2D3xMBelA4kdTXDaQK2y/hCB26gmUW9WokQivphwXqJMXr0cui3
	gheHH4YotDyfMyuEisLUnjLqqljhA6DBgdJktjmikGhgwla55DI/iLiGvLeMaf+/
	4Pu3gQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvquc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:15:46 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67c1c64551bso10112543d50.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702545; x=1796307345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
        b=O2zcEPJ6jI/T0F5UgRn19bhDF3s6TlHA7Djz/OBkeevV8Otlr0m1eVKP7JrAiCGuq0
         A+pc4HqqgBTJMJzGxTTj9zMzIqx0rkroqix6beabLgspv5S3TC/elS3lkH3rVQLy5N73
         t+n8h7qu2jKNviTV703EGDe+wN4gywTLDOnxIkZ9qPfLaZhxf7Yl8WESP9ujy1DA9ikb
         vui4Qgn6JEzTUjgc7K5K7akUGygnH0I/hEBWFa7mdScDWaL4HFLm+ksU6SqcIEYrbJLd
         6IHDqd48WPiTThUMq9akn7APkKZOdcrN7tmHcBmaOVVnQkz2rRW2bKo+N7ch49tvh08E
         MmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702545; x=1796307345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVzLW1gzyeQ6HMEDoCweQ+7lKqZtcED3bCw7TBJO0f8=;
        b=kAD6Fc0vAS831RZCuLikHxreJw+bD5rI+qXhY95tA97xMeuIGaT4RL6ze4MxXJRkMf
         ull/O+xWNkxCaNSa2OxsgLtv8OYY1qQFhHKmZr+dZdzTp9wtJ/NBdDP3j68Ymi6koad9
         y2pp+7tRiMbt7c4/6Y/+JDRwRR5QglG71IVG2Svx4S8iqHOyaZRxLZEzA3feKmNK7liM
         5YR+8sgOgbHWrOTehkkQfUdLwqghZvBhXLCDG8Vx3i8zxjqWyJekJ/hWnVBJLQMtanE0
         Bfgb5ccYxfcWbWuicvTCTi6E3ZG7hhwPV3ZZpCfy0Xx5eNyOP1vVgzBNReWWi1B/NrsD
         xoaA==
X-Forwarded-Encrypted: i=1; AL+hErEaA8+FGV8BRh7RLf22jMwb3U0xuKvcnCIkjCwCD2fgNIUqAHx1Y/QtekkatqwEV9eNq10d7yEIpokb@vger.kernel.org
X-Gm-Message-State: APuU4Z8d3uSGD4VP5BAwdP6KYA/KV2QJSZZY6dX/Vntklv9Pegi5G4JP
	rwHEfRXdptfI43/JVphmgInf8sfAmQle0RTqYjMfc78Z/iFupPcQJ26TgNSN5jj+32oQEEkbFRP
	xgrgeLkJovWu+Bfd/4hIF/cbdOD4tbm7lZv00cHvSMGbkuNqB7U/xwVZJA697awoa
X-Gm-Gg: AZFdTZffMvbT10KKBQdZZ8fBaHQZ1X/820lLA97KDGQ2OHW+VYzQNIJybx57+D524j1
	b3mCktUuZOAcj9DNYe028XFPioNhQsY4SB6ny8MO+IGvfde8G1C8U06eNBQT2qexTmC9PdEtCCH
	N6cnZ4ANXGaDsahaQ3dBLgWrVLYgv8PNsSb7Gemt1kgn32KfVaHqI4LJ4QTx8F1Kg9iPkls7/hX
	XV2B1BzR0rxgv1OQInYeAUKlNgARiPB9JjoT1hdzMU2hFLecbjnMxy//3Xvv0jNFEwmaA38xyPa
	HMKITA+iQ4UfPTSLt2TERHnNTgxyipROn53OicDOIfguF23Ww6sIaQwqsGq1t26d4UgnEkJ2ypD
	L5EdlVknVzWGdCsJl36GBxH1h93xTd4ffX7+LyMjyxe0maCIFiq/+zAQ9sNx1GECDHLIaToWLGN
	H4/zjrDQLbDNn4l242I6RkqU/Qfb/ht5NHNUpsM/BN73ZYkSe1UdC66JvZWdcFHA==
X-Received: by 2002:a05:690e:4004:b0:67d:bedd:494e with SMTP id 956f58d0204a3-67df40be117mr12076958d50.0.1795702544904;
        Thu, 26 Nov 2026 06:15:44 -0800 (PST)
X-Received: by 2002:a05:690e:4004:b0:67d:bedd:494e with SMTP id 956f58d0204a3-67df40be117mr12076951d50.0.1795702544570;
        Thu, 26 Nov 2026 06:15:44 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39706018f8f.30.2026.11.26.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:15:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Vinod Koul <vkoul@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
        Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vincent Mailhol <mailhol@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-can@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH V2 0/6] ARM: mxs: add EVAchargeSE board support
Date: Thu, 26 Nov 2026 15:15:41 +0100
Message-ID: <179570253918.23340.11898101233717977206.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112130506.12823-1-wahrenst@gmx.net>
References: <20261112130506.12823-1-wahrenst@gmx.net>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xbEplkUsYyG4xpVVU5CRlqpHZnDG-rG3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX2tw72Pk1g/LW
 3KJXEy0Oc8liPHuy9DhxL80SnJ8k52/bMKqxZzTOJ619l6CEWmqANNiQF/tY/2WxqGkJxR+VMYf
 3x02u/MPu61RuWXFyzlKMIq/CAB3T8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX1bT5BGdEaWO3
 Z3v6A33tDy5VnYRJKKL8Dd2PCCFlvoE5zYCIiKhnJy2x2ZEZ8MrpZMMDj4857KFBy1NtmbCvVVo
 P02t8XZBw5C8nLYy2Sk1w6XJk56AgkHMN1OzdWgWF1MJ9bAF+WIMWq1MGa9sgUnCcXRVajECojO
 D4utaW5gFD3NEtS2YUOmZDNuDVJlNHVWUttXkPvYJuhnOb+54+JmltjzYq9qt3iIDraKc4kVmBQ
 RlYcSHWABMZBTg0KkFB1pOlmXVC2kIh2XyjrudUH0l4Ca/0aSVnW7kKf8DuOXVP/Gv/PG1LG/xo
 YbvrT0NWB/E2IJaSZlOH6OLkDJKIrIC0n79rsRj2Vd/aox0hqhApU2i/gykCgVo4LBlE6X7U/kw
 zdYxq9y0PSFMam8oAjLANkcrMA6ZYCtIKE0BVNxGt4/a5o03ZXmTs+rqSS+GxG8rbzuxp1t//QR
 sxRRDhgs7Sr0K6IIaMw==
X-Proofpoint-ORIG-GUID: xbEplkUsYyG4xpVVU5CRlqpHZnDG-rG3
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b083f12 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WIf87rlHEhZ3lBRYjGYA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Thu, 12 Nov 2026 14:04:59 +0100, Stefan Wahren wrote:
> This series adds support for the chargebyte EVAcharge SE, which is a
> ISO 15118 compliant controller for electric vehicle & charging stations.
> 
> Changes in V2:
> - add Krzysztof's Acked-by to Patches 1-3
> - align writing of EVAcharge SE (reported by sashiko)
> - add "dts:" to subject of Patch 5 (reported by Andrew)
> - add PHY ID of LAN8720Ai (reported by sashiko)
> - move enet_out clock to MAC node as in imx28-btt3.dtsi
> - adjust IRQ type of PHY (reported by Andrew)
> - add new patch to enable EVAcharge SE peripherals in mxs_defconfig
> 
> [...]

Applied, thanks!

[3/6] dt-bindings: gpio: mxs: Allow gpio-line-names to be set
      https://git.kernel.org/brgl/c/0a74985977e851196d69e5364f4787adb03a5fb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
