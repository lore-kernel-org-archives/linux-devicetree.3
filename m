Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD7435A8C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442236; cv=none; b=qhIAPHb62dwgUx2jKgiE2AvLP45BEUa5ychO+jrlXk2ykAHYb10khnyRxqC4PweGc1oRF5HBRlHtZ5aFK6TH2ZmqBeuSJ+oAH9VWqPDDrKFqP6Z5Gz0UqGEOGBf2BLbs87p5k4BgxmCZYvQOZfa2RI7/2R8XbtDc8pMb+qufop0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442236; c=relaxed/simple;
	bh=Y+viPl6Si0nBgnbOpQgrpLEtz8pnhh8SMDQYSSO3ZQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pn/KxU5w950o+hNVokjcsWzHcGXXueG8MrKMu3NMKLpF24ESAAtB2GTYBMIYFQ2On6a6YsWgnfYJSJ9nBE08kABgwnXoOAobMzJmyCUpGExFv7DVYo2aO/MVDZteoXlRxOoMHVqqCxHdmjyFni8fKO5QKXzYq9WmvV/2sUzfgPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mH+ttPrF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMlyX23Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mH+ttPrF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMlyX23Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTiwY3996647
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e8uxuDprRAd07UajXGAdVmKyLIRz9/hqxAH
	QmoOCFqA=; b=mH+ttPrFSbeiO8sjzgUDoCK7n90Kybp6vwt+50wCGvZORH7W+XC
	MDg6RPhpAN5ImnG3JjgADzpULVEafJNZNwBtA7NPJynIT1g+DcawqxuSIS2CcRHz
	Z4eHPNfzzgk4gMrub6kTx+uOxsZ5VyM8wNA4V7QtY+BAqrJGkNR5huEBxqehTbRP
	v2+VJchrXm/tyvf+T4jJvKVsm6UyyD80d+wvJWWo+U5cvLCgxGAMvExLA3ih5isn
	ETcpQrA+fpgLvraRJmscB3tHge+kyybw2JhrbKQ2Xd1gZwk5fC/tkIxhGZJqKnT3
	e/rAoosoIAKdiXHLWHgO1VsmwhI1L0sPCeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su730w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:37:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so55026961cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442233; x=1784047033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8uxuDprRAd07UajXGAdVmKyLIRz9/hqxAHQmoOCFqA=;
        b=WMlyX23Q8kASMra8uV2+Kx/JcIhDV+fGmvUTib4zjKEjYmHwXstkSJ60xMYD2ow3u9
         6iFjUEhh3m74mJBC1Kn+4o2G7OuwKnrhnOr2nUFP7mv2/ywsaMI3HO2Kg53xyS9lZMXp
         PJBnUGTNWtwHo+BKbRvbGVydsDtsk1NCnVog/cWTqtxaNAONoj7GeeE8gbc/4XysxCpp
         VB8j6eo/TU8rLjItF/9MD8/HYDz4wmoPYptqXCAspnvvjXkAnsChgbT/OC7uVPMzK7pf
         E94vv9QiV8+H+VGALDZr/9SpN8i7SD/5MVdwfTCHcueXshG2idWn1gG8nAIPUpnSssGZ
         9i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442233; x=1784047033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8uxuDprRAd07UajXGAdVmKyLIRz9/hqxAHQmoOCFqA=;
        b=qT8sOzF3J9jmFK5WnCj7HwHGctD0/CGnLSijjjMXT4iTOc62j1EbK72rhjLQJfLVlG
         DlH4XGzzcxKojWWqUaNrLEQDGvgYLIFJ0W5sSJuPcadMYOghwb8WSLO0oly3OoNgKysn
         sMsDCD88IgOSfA23olsPN0sFilixKxRQuYKGjxlkl3uLu+YybYHzdGjsEhxh6TRLPeAY
         OhICWlG6fAxXLSyqPCn/ykctEPphIUVL8nYO8tS487VT1atJYRwA5kVZEip/6DGoOIbe
         mJbO7Qw27WTRFQzajQ6O/+aNg9v27hoxED4qv4j1AW818hg415/v388DwBVBlVNorX1U
         D6ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0/lNb9AXbYeRostPByYq/YSStwLos7OOxvlnUkAm4cvSkhQtXbG6JZIOUeWgYnO+u1wlMKBaJoV9t@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXn0EHxD3Bvq477M867p15759Im2Qnv0fhiGFGXSq9CedhK8n
	bUcBR8CgAk+EAai6+HZDqOJJESCVhrIPsva2B8o+GpxvSfOwcisLZMXHd2lF6iFB7KG/uDM+EQ4
	XRSuHFfubpzWjxjDw50tylfO140X/fVWVq3NbcYSVZ9bU4xSBbArxhWR89SBRdagu
X-Gm-Gg: AfdE7cmjke8SyqLh4L3wB+ctJrdPdA6zXhHhKZpDkwHcUWE1voW6D8py6XLMyyaY3CZ
	o9qnq2g7zP4edYCdMAZzCRWpF2PLFxLuUXaJ8OvCuhgZHbAEIPUu6wce6SB9LO5DURF3+w25OzP
	ncmIhJqvtsKdWhS/blv5p1hha0iz+NkC0y1rBEr1g9/LPC57ga4DTfry4mhOojpxKuahdmuRc2i
	ud0CPad5EZhKctoH467bGEg0g1EGZWmlkR/0B/M9o0TNQ9LEIc8FFLTkeyA9rP/WQ4PbxBzf4vL
	8dHopCuWOg8jY4M8jddGVg1d5UMJKjvbRIeKYa4V6PUzPGeuDWFGTCrXTv8lHIFpdSOVse/oE52
	PC5yltqNOn3YWm2ST+VE1KLks
X-Received: by 2002:ac8:6f17:0:b0:51c:84cb:b9b0 with SMTP id d75a77b69052e-51c84cbbdccmr12008561cf.81.1783442233271;
        Tue, 07 Jul 2026 09:37:13 -0700 (PDT)
X-Received: by 2002:ac8:6f17:0:b0:51c:84cb:b9b0 with SMTP id d75a77b69052e-51c84cbbdccmr12007971cf.81.1783442232597;
        Tue, 07 Jul 2026 09:37:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: monaco-arduino-monza: Enable JHAT 40-pin HAT accessories
Date: Tue,  7 Jul 2026 17:37:00 +0100
Message-ID: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX8qgU9KVSGEur
 hwzZ0xQ1MtQYLkAPSXFaBtKiw8UGwbry4hLldm+YIUoL1dlM3J4sK+T1isStFOSeJ+LtqK3goYU
 LZgiCRKZh/w34/HdJDBBCckjbhMfIYZgcIjF4VOMFXqrdRt/M1QpWcGDishpgs7Hi8kgLNAs4zN
 BmrogI+YbHRSm6Xo4WTKkiidREnux7bDgOQ3FWCnkcAt4mnL07r2cXT8ZsIes0e7GOLRq+8zGPD
 1gE5E/6GslJsHvtgKLpKiwK2o7SgvMbc1dCe9Ky6/gcKnuZ8IohTzNltfLMQ//RC1EU8J1L/s7l
 dq2sgsyc5jVQLEwqpbXuyLE988sSG4OcLsHF1YEadHZhsDh+XMZMrpejlOebx09qRMnXCsamJeH
 h1rHtG3xZJ3PkmsBr21RkXMwWXvGVQpa760Ad5rxXKLr2S98rOf20QEOTBJ/DvybeFrwz2A5meg
 a/hR12fle7nbH2DQvLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX1+ohDEN3gaLk
 h9RGAX1LwVddzppDHU/IA2IUZXeX8bBxdMqXVMpbh/tso9PvDSMkkvJolA6pH56uMKInjxjzIfN
 73V6MGH9SEky18VRqRQ4Mt8U4KRek8k=
X-Proofpoint-GUID: 9v_-JAgsNnSMzI3SyIVDZHa8IVBNYepO
X-Proofpoint-ORIG-GUID: 9v_-JAgsNnSMzI3SyIVDZHa8IVBNYepO
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4d2b3a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=3ufCqafKAAAA:8
 a=V4Th9uXqAAAA:8 a=NEAV23lmAAAA:8 a=J024qM1I-9LGbKqWfVkA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=aIhU7PV4tMzn2raNFj2v:22 a=NPz-sUGDo_RSEfLfxCKS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162

The Arduino VENTUNO Q board exposes a 40-pin JHAT connector that is
pin-compatible with the Raspberry Pi HAT specification. This series
enables the I2C0 and SPI3 interfaces on that connector and provides
a DT overlay for the first supported accessory.

Patch 1 enables I2C0 and SPI3 on the JHAT connector and adds the
corresponding aliases, allowing HATs that rely on those buses to be
used. This covers accessories such as the Pimoroni Automation HAT
[1] which uses I2C for its on-board ADS1015 ADC and SN3218 LED driver.

Patch 2 adds a label to the sound node so that audio-related DT
overlays can extend it.

Patch 3 adds a DT overlay for the Waveshare WM8960 Audio HAT [2].
The overlay enables the WM8960 codec on I2C0, defines the LPI I2S1
pinctrl state for the JHAT I2S pins, and wires up playback and
capture DAI links to the Q6APM audio subsystem.

Audioreach tplg changes are at [3]

[1] https://shop.pimoroni.com/products/automation-hat?variant=30712316554
[2] https://www.waveshare.com/wiki/WM8960_Audio_HAT
[3] https://github.com/linux-msm/audioreach-topology/pull/67

Srinivas Kandagatla (3):
  arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for
    40-pin JHAT connector
  arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
  arm64: dts: qcom: monaco-arduino-monza: Add overlay for Waveshare
    WM8960 Audio HAT

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
 .../boot/dts/qcom/monaco-arduino-monza.dts    |  14 ++-
 3 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso

-- 
2.53.0

