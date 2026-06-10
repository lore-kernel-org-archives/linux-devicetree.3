Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0551176FB1
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096517; cv=none; b=M8K8v6sgav2S4Z7Sv0X+yTiXU58HzzUn2j2iV+J6h9ppyprFtlS7P2Tb2QXtj2oGwEbXPplEW0yZ3BFB8tAn9I+EpakosEUlIgWqtbvfagTDf+F13a2GLTmo7CZXtwUOryYHq/mEhClwLE2KH/Nwxx60AvIap0IeNCT4t53ruYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096517; c=relaxed/simple;
	bh=okMsujna9JJfzimgePHNP1r+SJyV9s1mfYXKGRXRj/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QivtswVB7ta2STs1UtrZ7YAww9tTWfVTwV5FC210LKjukPSZh317YUZiAvsWvNDJqkAq/UFgn1Gpb1bk9YAYB2TsOa5N8oPL/WCQ+tNGE5jyxKPSP0Zg2EM8PFE+eSgPeSskXpoPi5ehp3TBORsAYuzrrysj23tY3ZJ4DGP4ueU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXBnBGoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJFLIf73; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXBnBGoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJFLIf73"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC5Js3764365
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4oi/ADBZvkBBoAhp6aJh8JuOUiWJGJWcTxsjS16AuE=; b=eXBnBGoM1iagNaxF
	ENa1krqrbFWOIMIsmTXTP9ETW16oJ97epqYJoWMrwDD2yHv/2b+i0dPG0cjy9nZF
	Jno5eiBaesQD1/6fqNUoBLQS601Omy2zhfMCaFqUfaag0ldOLYzmsQ/UPQEii35I
	VuVuzUtbxXp8f0ePEaYj6zy2gGXHi59AnRGf1U9k2wyLiZtijEXrjFDZKb4sqPzt
	c4oeaXCYulI7YKUs3sGNJlXjygG/KBDZ/mCVL7mWo+9VnsIYX4YP4Qg03M9sNtKf
	ARHlQZepnr3IXSrjMFWWqnn9Wg/eFLmFf5P+6t3pJv4fITE8L9wMzYPy1RgKWU+G
	7aV0og==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnethkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:01:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915a547f4b3so159984785a.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096515; x=1781701315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4oi/ADBZvkBBoAhp6aJh8JuOUiWJGJWcTxsjS16AuE=;
        b=BJFLIf73q82Bsmay1VpEJvVI+a30wL5W/bUCGSRucvFueKYlpAvSOTk5YXreAvAfuR
         ZeJR24NKhc4dVU1sCHyQKNSaJo9KmOWvV10hMX3N1vXu6cD/6hjRIK9usmL34eCdgdNe
         SOu/Hcmci4OroDqMtsUY/aeZsyZVO27PasQBgXEwzw18CRDt50zhPcd8W4SFIvVPbKXj
         IDlvftdsTVAa38guEsF2xbF2KqS9Wt72jByiJ4f5Euo76bINBNrpqy5C9RlXwqZxNGpL
         omsjOc709x6Ig/voaQ4QpjTPXMvYt0Cv1iG3QroA57O/wJd9BGdbZuaCnBOr62b6Ci2R
         8Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096515; x=1781701315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4oi/ADBZvkBBoAhp6aJh8JuOUiWJGJWcTxsjS16AuE=;
        b=N53QfugqQ13xZ6d92t3hpRA7Z+5XRockq2+iawVhP6xL9RNSyegyx9fQWYO1pcM3xq
         ts6AIsbBghVi0RpP31fdpkusECNo0GmhK/l3hZkjBXEHIYQXp7obyDzsN0L1FMOr4GL5
         MrcDetEVZfpzNCE4XoTDYso72a8FfBueAoegzMKkDIQbzmgtsvLmeE1wiZgcrFbLcR1J
         veM1idgETCXc1WONJ7ol4XlzMihFTcmCJ9nYdT9y9phRMETJMC2Req2ncbwjgWzUMGBg
         MQAOK8aG68EH3dgDOE8CmNohTOjMTGQqpqDmB/OPxfvBxMVVV4TR7H6phlqV82xrl8mj
         TACg==
X-Forwarded-Encrypted: i=1; AFNElJ+3dpp7pz8LsYUtIHNuDM/pYlKPuYMDj+UUrUws/LVXoa+tXrxKjjGf2+tokacqCSQetKSfd82DrPmA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7r8Nnc5pYzanydSx4dngwQjXScYlSGrOY4jXg4PLxQF82vskY
	Q4B0ibsTkmk/T6VEfuG59j9bNehQ/sfgU0UK3H5vu/6HEGAHVm9X2Yxw9GXgOkWmNsCjDB3z2Yz
	rOwRBNHRruhPshTih0HG3/leQCvzh24PFO/217lCpf2VGdJ1jGldP1FZitUXMEwpU
X-Gm-Gg: Acq92OH/ctucVJHhajt/xII98H/CyabOhRuwo+Le6ubuN7wm+wjtBdi5dIWLQsIzunp
	Zby4JYhSc/EaBr8Lw7KbmtNyROiCiLRhnwh9A3OvxDxnbRIYqvtSvvd1rTfJsrzICQh4y954YqS
	ic7Iy7W1EX9o0KuOIUY7UdC2bJAohrrFKGO4Zn6NUJ/b0PYk2EtMTMnGmxnarfFGBJKyQx2+re5
	ItlbaRUDXmhL9ZnsWTYl+K+s74huipAE10p76mF0GvB++n0EXUhtQ4dbn0B8MVkAblGoXWV+3C1
	oJK/PueKvYxtSyvFPBn+TlyjWEATLQvjl4y02m7eTQOz2Xo8M/f88KMZI94x0AygVQ0j+H+mnC+
	E+d79UX0spQthv0fQ1jQSomwo3Ed8A24PWmVw5kU+DP5Z+pIKF3eba8kz
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2276736885a.8.1781096514548;
        Wed, 10 Jun 2026 06:01:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2276723685a.8.1781096512405;
        Wed, 10 Jun 2026 06:01:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm5866907a12.29.2026.06.10.06.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:01:51 -0700 (PDT)
Message-ID: <cc48189f-421c-4d04-945a-5905fa52357c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:01:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S_MHByEyiaRj8_Qec2cPi5hU16zDoAOE
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a296043 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=i4oUUBczqS0nELP1pzMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: S_MHByEyiaRj8_Qec2cPi5hU16zDoAOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNCBTYWx0ZWRfX68bCUGysSW9n
 FRPT4Mn41g+pVglEQnb7HsJfgI4XohLpCaAcqcuO4LOwlz/jHUq70RztQUYLO0YsdUAAGBMiSKH
 OBKy3pj3l1LdvqfWY4E75Su6FeW0j4zXCpxddDRrfuZf7mVLSSFUshwgqR0dI7oidMCr1c8o6HM
 QZIhfvsvlTZhnXnlCmWArn26fX1q9tcDwnQ+/UKihmIahK4TlxflAD+Ct8DTw/dosy839tcG36I
 VSxkHPnntHBCBFA7qzMfQ5K7uysyU8qnxMRhEgV6+JDo7hhftro6REY2VhjXjxu13jqidGw+JQW
 xrxHJUemt1KXvceyw8oNVw8oD0uq1ehNmCGH8O/K9jwT/vkRdzgAEsBudlpExOxtlca6Cu7D5YY
 xph11gRQ+hQ46QiLaEFwaQeuRWSaf28ylayuy0bNhxvYjaoZgDMrlcoIKneIUWbDDjyF4aFHF68
 YDgzEArGnofWtbxVa8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100124

On 6/7/26 1:36 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> The UFS ICE block is kept disabled because enabling it currently causes
> an SError during qcom_ice_create() on this board. UFS works without ICE.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

[...]

> +		vreg_l16b_1p1: ldo16 {
> +			regulator-name = "vreg_l16b_1p1";
> +			regulator-min-microvolt = <1100000>;
> +			regulator-max-microvolt = <1300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_l17b_1p7: ldo17 {
> +			regulator-name = "vreg_l17b_1p7";
> +			regulator-min-microvolt = <1700000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};

Any reason for these two to be always-on?

[...]

> +&usb_2 {
> +	/* Routed to an onboard USB hub for two USB-A host ports. */
> +	dr_mode = "host";

Do they need to be powered/power sequenced in any way?
see drivers/usb/misc/onboard_usb_dev.c and e.g. qcs6490-rb3gen2.dts
-> usb5e3,610

Konrad
