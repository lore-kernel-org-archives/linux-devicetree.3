Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236A9419304
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425406; cv=none; b=g9rA5hn+hA2TTmEefOYaKVSQTlIPBHgal6uArkbEd3iJGs850RjVCFhm+i6nhUwPmg9mTOdkNW4wLuPWl5bukmY2zFM8EPzeHeu1VjCe20NthHRuqiNgjFOyhe/A89XY0zZclGffKw8ZVV58wGrS3VuAo1MfHEc4TrhHTSvXAG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425406; c=relaxed/simple;
	bh=w8bpwp5JplGsPMmyl3ZfVaSO5T+S+y2Xy8qZEQhm5mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlZfBsJ3eGeAqX+GN32fHBjOtY72tleLdsIXVkaBHTJ1aZlyH4OKwStmAo7xbBfSNMcoPcOXH9rTFhMw4cw3MXNwiGN8jSZa8wjxk1zjGtManNJ1/gqSSoGBg6CkF0DW1EspUvhnsOXunQErxRqafHBctL8h/PxbzI5UNajTv40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0cv/3X0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeotQHXf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0cv/3X0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeotQHXf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835ldJs722051
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=; b=U0cv/3X0wX4hnYLL
	YkCNlFieViraQLMAJdbfTInhP5YCVRC21a/xQeEy9BkNu8F4vTXHb2tU4iVESRta
	r46lm4MhCzcuB4WdH17gTsXdvyYQqz40Wz5SrpVN2U+aLKqgJdVBA99UqpSsN9ke
	WcbVrFymtA9mIXAx/YXbFeccTaMzhUGHexuTxoNq86k2Z5zTCqEvyv6X4Pud29sf
	DGV/0hhIW297uJU46kg7aUuG2xqf+fMCvVqAQxcGrmt4PR/OkLNWZrOSyDCHZT6V
	q/1ry+ZlJU2fWmsEnCoPCpe//mpJ8sXrpkZooYxAPkLcDuqw20K83/rGL88rMRyB
	UuwgRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnm5t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:50:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so54287885a.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425403; x=1789030203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=;
        b=CeotQHXfV+aYwlFLC8Do8SKNTBsUHVkGBJ1nSnUNfP9x05OB+R0f2eBZg6i3ugGdXQ
         jK2NqtzGJAngJklNJDgNU5Rxrg8S7ir5jZONWHFf8T/D7HdXpfwG2FcnHkKsG/NmCJdH
         xEDmy88zcx3/fxsSLCq5dmomCZIcTr18TJ5QP7xus+DSrgmwEPSiB24HYqv0pOrgMxtG
         /4lCPoAfy0bQFxXyulzq+UO6ndInltww2mnOnnSkThsqa6JcMG3Q0LsLb5zcxNoruksf
         0KpXpArqk7ttMW/grkwVDGxqeNviCa6K3l7WF912hUmEfOit7IMhZUinlNlW5cLUHKpW
         h81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425403; x=1789030203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=;
        b=SR8vYuF3yXFp3x7utMcRdoU7bVQ1vZa36n5npHmxesiXa7ufY5OUy5OjCZo4jmSolE
         e8rMRJTkzHPJKYsBfBIKJ73l4Qv/5JhKogNTXFs95whgbTv8583CkX+ypBYFevL+rUGk
         roRNb7wyCw1LYP4AQzYoJC5r2rEZGKbP14dWImJGL9R0gtb+bflUfYR8NTI0zJyLUQ3r
         QUUdTFeYP4FjIxFSIHSYpwVK8Yr1V1pC1ViFhrmDNZyizNz0VUwdQ0eqHbV7v7B/Umwo
         L9MkAE90uMQaG6RfNxwatVObhiOdZ19X5RiYhEUgIr2SFvhXIC7+usFWiRpvCNZYrk5i
         9VfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1VHBOiXw88fA7pilBb2d8FeYKlZqEXPpzlkOS0TeGykuPkfcdSWejkW/jHrgrnIJMHiajtFeSwx5R@vger.kernel.org
X-Gm-Message-State: AFuF++lG1WSqD1IYxiIlWgeISz3Ds/C0gRBr7+HJjLUelvn71Gc0Flhn
	mq89Deg926GhNi/Iov5GWs6M2Fp5CzKiKeLShTqpUHzFdZqtBGKMwJ9Wzei0EriRSI4SXu/zxjd
	JALxDUpfxcFu/kUJCee0G0xJEnCVLBZTIb7qpGhfxCxQ1vT7nC5apw87vApwFuPoK
X-Gm-Gg: AYBFou0fQKRrkTC0GrYr7DdZWCBUUAF+8yIqSX9OYgl7kcdQNvO/EBpugPi9UeHKucr
	jd2beu3FMjj1h2rvZ7kPZkkOKXDUDLzQh/BF3Pr4I53yPN00W5O2Cas25/36WMAvZ7T6Y8PKtl2
	9K/NYsHzoC7uKJlGQy+tcu9HlgjAmx4H00NK1WK7h32XGp+YqAOvBXXWXOT8jNSuzZtTxLv3uhk
	BMU5WnU98Hm//zaEmDrHpSNL+v/lDxpD+cTsZTtRxVL+BJ1VS0xWENgzyGf0Ae3NDYvJcQBl4Fq
	tX/AKMJt/dKrzhnJSbQE2NrxcUrvjr0g2prRXLwgRLzz+l9/i31RA71rxddDM1EpoI/SFH73r4s
	Gzkg+gzrGjAM4MTU3T4LmMQ==
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr834693985a.6.1788425401746;
        Thu, 03 Sep 2026 01:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr834689685a.6.1788425401360;
        Thu, 03 Sep 2026 01:50:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm2029048a12.30.2026.09.03.01.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:50:00 -0700 (PDT)
Message-ID: <52c023c0-a61f-4116-851f-ed19de4d23f2@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:49:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: glymur: Add ADC support for Glymur
 CRD
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wfadjQIj1ib3A5Xjj6jwURsGe0ijrwai
X-Proofpoint-ORIG-GUID: wfadjQIj1ib3A5Xjj6jwURsGe0ijrwai
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9934bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=R0Ww1y4TKyaFJa1J-xIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX3OEagmcHwidO
 JLKItkCjnrxOVmi3aD5KCTjVcaGsF9f29g82BnxgY+2v4paB1ptdBSMqgMebeayKwyNMYM6lkcR
 NnFDZis9yyDzpK3J4xapxY2fCIGkXYuxTtBdswgzphLoYLLovxGkKIjMYyslpZvg3CU2u4Rfw4Z
 GrRRyqNDVw3OS8Ozfz+v+Oh4s2+1b7dgXkHtc4QUiQ1dY5Gi6oM3XysIWwCaEIVxdfluLybB/hF
 kJoJrAxY5ryvKDU6WGGbIoluynwLsHs6VHnx7RYfLFri/GE4vuz3+pIU8ppsJ9270bZt0St8TyW
 NFsZMPW586IMwxA4dmQuB1mzjSvMpeN0P44JubLqpAegnX+whwUNaSeYoxsUc5vFXZs2MWVVX5S
 /7imj/pgEJF0HTkJEJRswrDsqBoP5qMYRppiExt4bXSzQ2rK8/F6u6o4ssLBmpah1OZZ278XChZ
 pr1q2lTcJTDgicTo8Pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX2LY/3qAP5dab
 IifNyOhuv68WBesHUP/pjwd73915IKeRZbb0hylH2d0M5uXFkzu5oi/zl7wVeruTxJf5y2r28dy
 bqIk+orclx33RAH/aOpCFzxcsPrXLw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030075

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> Add the ADC channels under the PMK8850 ADC node for the
> other PMICS on the board with ADC peripherals. This includes
> die temperature and VPH power channels per PMIC.

[...]

> +	thermal-zones {
> +		sys-0-thermal {

Please name it xo-therm or something similar to make the connection
more obvious

[...]

> +&pmcx0102_c_e0_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 2)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_c_e1_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 2)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_d_e0_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 3)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_d_e1_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 3)>;
> +	io-channel-names = "thermal";
> +};

Are these going to be always wired up this way on all Glymur boards?

Konrad
