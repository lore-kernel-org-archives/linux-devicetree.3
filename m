Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41F383C6B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714861; cv=none; b=ENUPh8MBSE5RDKCLV2NZJzhTbVqoBAxHyd0JCDh4aoj2pbvWAeePUorRdvr3d17Iq4OHg4LnZsCBQmjFrVXuLVRSX2cDyyjJkFrHGpwfP9pDNKRsC7Tw7EoebVtQOuOh0Knhf2HdSe6zHCG5U143qtkbo849c39dNOwUhauV0W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714861; c=relaxed/simple;
	bh=qE5EJYc1DlvLU7oXvi03MMUgVrP6joq6NrvGONO6KK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYGjZP7XuMOcZRYg5LNCvPs7El0aZcVbcHdtmocXlnssFylN/q2BDK68kh+zEk5g2CbJKMfBImKJTrCeC9Whp3hc3iaePzcOu69D5/7AOseWe0qilc9obdq5JWgbe02hYEFj7WZaju+iy/7A9MvbPwNQ+wiiZfvuig442en2dH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kg8ItYbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdeWFohV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kg8ItYbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdeWFohV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PApmHP3282561
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6b3DrpErweAr8LUzJdL3m0TUMj29KLE3BG5Cv+ijrck=; b=Kg8ItYblBODUolE/
	exqk3c9YhXQaEglM3cSAlIMksEKTE+zu/vPxxn3Ma9YcqRSLnQsTHFAFvj5ijt0r
	zHvzzpDuxlXNBKQfy0PmH3O0oRZ5dr2qGZaVX22AmfZ0SVGTd4mpvVOAgheF66+Y
	86V6KX49y6GkJ+TBp2EOo/4OdXAJzMURGKhgPAdjkBlOfhT2QTUrmDE+Ef1oQT5I
	67QvZRFWRVnyzo6FDEBB66v4fiverOsksZFYvgkLAKfJPyQ5FDzEKyG1QWNyq9jd
	ylieoyp68CzThnul4lub+/hRBYbPM+C6WCXyUNs6t3joKGN8NM1HjqyRjGvfyQNg
	OaOUeA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3eq9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:14:19 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5752affb36bso814549e0c.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779714858; x=1780319658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6b3DrpErweAr8LUzJdL3m0TUMj29KLE3BG5Cv+ijrck=;
        b=PdeWFohV8gQrTB0C4N4cn1JXGhcAL26wMfOGBJ9Be2xDKROBMDkfQ+EgtSJvrXh86m
         NNHftEDX8o4j1rPu0tKW6R4/u5pzVDx3WmTONAhb3IhZBXaWA0kEvjHVJiacn9H77uVT
         mXMFurem4poqi2afyplSWdhp2Ov/boYfit5699y3od3uUykxMIg1dZdUoimjpy5Wa83Y
         wMEzMLVGDptSGMdY2z5t+z1X5XAB2GqrwqIcpsxYT6giBomhjkBrTFscUPfQZ9nqBeoH
         Pnei+uX6C1ZO30jhz1myU273gFWguQEEKlZBA25fKdsUyuxiHxji2AtyFwUqMIsxR/jS
         qwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714858; x=1780319658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6b3DrpErweAr8LUzJdL3m0TUMj29KLE3BG5Cv+ijrck=;
        b=oyRCJ7Fa1F2lb9FJKsC7aAxltgpVR6F32feWYjeF+RB6GRnLg8++XbCiLFiA2J6gpa
         AidPV1do764jqg4YWOv2Agrn8CKb2udfWrWYbH014fcv7F5wX2XCrjq4v4k2HyQYDgYs
         vLsJJAs3VuI6H5NZDIHegmWMM0YDm7GjMroXDeO3qiz5ohpWFWWd77FpNaKLx8DPQR2+
         NWfqVGAmjqnrl3l2bgEOPTvy4oTyBrO6HR3n3dBFlq4yVByZv3S4j5y6zohbtwhTOSTZ
         xdPDrXNJCZhXDoUAjLsTkXMn7NAZ10Bl6Aq6txibwP12q0w1Uq9cw/f/QqNV3bdECy2T
         SF8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+1y/ENZOVJEAtydIwpK4QP5F4RelZAY/GKWypkGTE2KCrfFceUusczKtjmmkGMzdDtNZmlKaDWenAc@vger.kernel.org
X-Gm-Message-State: AOJu0YzobexjG3SPT0+HtAs3JhkFtNgtBJSQubjWse7D4eONAsTmSFGi
	zpOfO6EejsmmA5JOESgwkiOLdPeiOfPNP5qIw0x9We5dxlJVyB6+LcyjM2lATLPLYCwopwk+Jyl
	NyO53IzD3pBqf8FsRE9ADEDiveA0VpkN+V+HS/OprqQPn42V3w6MZ/2Jwq9zhBMN0
X-Gm-Gg: Acq92OET3L/ou63BcmJP2sGJOvt2Jn1CkT42EsuaAdGsnDa3u6O4dodJRNXbAIt6qZG
	6PtUWx15y3wzVaBbL4Nv548PGdOSawNdtRbiqqRZeqI/godKqBgbSYUVKhVEQzB1idE9hDGADX4
	Oz7RN5W7StE0YVcXCUuN6216SN7umtdAm/vYtEYLOgDpXZLKcR+1EPZcA8RJuWiJnCl4oPMsUBM
	Q6oU5Aov6pMY6LO2raOKnCqIdeXWG7pX7WXLepwTiKQ8pkgnyn0ANaAJ6UX7GgdKYYjEFzFoL/Q
	WybSYLcpdfRddfqhK1vWCcdCO/SSpb8SlE2SQ8hCwFkBDRpbkoRymwXyBoD1SXwR1xSjryHls+D
	+edVhkj5oazLKhWRperi9rc8pjVPvGQwcI1VQBkjppMSYGQ==
X-Received: by 2002:a05:6122:2ac3:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-58663e43d1dmr2314172e0c.3.1779714858152;
        Mon, 25 May 2026 06:14:18 -0700 (PDT)
X-Received: by 2002:a05:6122:2ac3:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-58663e43d1dmr2314168e0c.3.1779714857596;
        Mon, 25 May 2026 06:14:17 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bd00e751sm3915244a12.27.2026.05.25.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:14:15 -0700 (PDT)
Message-ID: <ad5e2d91-6166-4fb6-a9da-1464b161da24@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:14:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vhdd6Jg6WGAuesKx8hizypmNoJP8bV_b
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a144b2b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0ejU1cMun9qC18S2p54A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNiBTYWx0ZWRfXxDQOrLvR8tE7
 lhHSPsi2aZiXq5q4rTbh7FMX3THh3XwgpeAJqeJTvuOd4U+V2e50bTd4mZUhfHCbbCXLZq87HIU
 ukQMMtQsgjlUnt5ZStrs+xcWskcSGojgjJNseS2BQvQlwMMV24mjwKElbzuyEKqx9NiQh9kvfeQ
 QRVhD2GXKU/NBJQOc4r3vi4Q9+BKMccNVetb7y/hnEW8W62nTKVCjOOlSqV4lhhRUL4ea+g2NY0
 PyKD3mlOg76VuQE6jwYbTk/2vOLpg46dk4pU9HTPh0XF1GaZai5m5dcIcrT1iB/330s1r5TzbWV
 xAAoz0aXULZ/JkVv3s4QCXwlsLGpscAt4WmgxxFndqChTpSv29Gde8YysrLJlCP+xV5rXJ5VviZ
 awHP1E/pqarg1Hxg8i0wl/xA6HoAma6WmXCfYeZVZVD7cl/hHuaCWfi7bP1tB03+xuVqNVf8peA
 XtAoQwIPNO/nqEdnGAw==
X-Proofpoint-GUID: Vhdd6Jg6WGAuesKx8hizypmNoJP8bV_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250136

On 5/22/26 8:02 PM, Komal Bajaj wrote:
> Add initial device tree support for the Qualcomm Shikra SoC.
> Shikra ships in a SoM form factor; this series covers the CQ2390M,
> CQ2390S and IQ2390S SoM variants and their EVK boards.
> The series adds:
> - dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
> - SoC base DTSI
> - CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
> - IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
> - EVK DTS files enabling UART and eMMC on the carrier board
> 
> Note: USB support is intentionally dropped from this series. It will be
> sent separately once the USB driver changes for Shikra are concluded.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> ---
> Changes in v3:
> - Drop USB nodes from this series; will be sent separately pending
>   conclusion of USB driver changes for Shikra
> - Fix CPU3 reg address (0x300 -> 0x10000)

This part seems to not have gone through (have you verified it at runtime,
e.g. via reading the MPIDR_EL1 register?

> and memory base (0xa0000000 -> 0x80000000) (sashiko-bot)> - Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
> - Fix MPM interrupt number for ss_phy_irq (8 -> 9) (sashiko-bot)

Hm? I don't see a 8 or a 9 in either this or previous revisions

Konrad
