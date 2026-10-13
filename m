Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40392492187
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871595; cv=none; b=qICdJAd3yQ+PLqOYG8g4w4EadC77QBOqUrWbH7qxiphPJ2IDFlTk54h8o8RSbeAC4tNN4Ix9HqPK79S/Qlany/QARb4fWl383vQ8PU4Nl5UHSeH+4tWIUSiePLUPWu92HpnC7WAVY5gNc4dh38xzy/EiynuUK+xF6/lCtREgC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871595; c=relaxed/simple;
	bh=jKBCUCn+td6u/3sbwm42C8Jz26hnQBdGnVitYLh9jlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvWpthNykQYVvdYEkYChzLqsVF8o4/I2MyutrAwhoUI4kUm1bYOcX/HwlBkNPTW6O/Oj6Lme5PDH8nNlTLvoO7YsEcCd+dZinJlSxdjm3TdjGI9stmvoeUqTNGhY05+4j/7eA5KfUUv+B5llWfBQR/438awC+wM1kdDe5AEFtQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xp6MWfu0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UckK6tNs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xp6MWfu0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UckK6tNs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D216ll989363
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=; b=Xp6MWfu03rxCXJ4X
	9WoxFhM/UBuwwDdjrTmhhS4hQxjt7O7WKG7MLK2BMtKMMjRpkJWC3or5TmXXgOKa
	lGX19fmYFMpkryFjBG0drysSKqO8kbtOdQX8gD9f6WpUjRsUMbay4u+cV1xbDgJF
	Ycs1r24wen8yZwCplQ17VSBqYJxFb614Szrg/ynnYXVp52aOr0utTttf0NaE3HiF
	Xwu/UXpjh86KjAi1hpmtU+RYGMLA5fpc+NHcZZJEJVCQCe1M3+MJYbU5S3VTX40N
	pkPEvWJldnVl9Kbz70Y2tc+9fgnrFnqV9CtJTL9IQ4+SyeqzZ6vv+1VPYFTdThs+
	nmuvGA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc9c08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:06:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso6743793eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 23:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791871592; x=1792476392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=;
        b=UckK6tNsn077NJ7m/CsX3Pgd81sdYkWpdcQSs62Wwp/froDLNy4MTwJNawm45S/AqH
         NjzyCJFGrhVbJ3vcJVdGBmADFcuZqyQjLIC0uRWtB6JL978+PrWLbVgtaNm4NJ/FUMod
         Kzvt5YzuM10hVh/jIOpGPTraofWKWXLtX2qU9Uors6LrBMyLiljLx0JYx6GiccHeipdm
         TumBdon7aHojoEeLZ2pz5hNGO1GsGJRgNxXxl4I9maMIkIReJsHOYDuIDKJflp1PIoXQ
         VSxb1Pz7ZxKZVrIeBUo//ES98NuPq7yJgIs+8LNADjiF3y581sAR0lrGt9dhWljBXEyx
         pqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871592; x=1792476392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=;
        b=VZLUzPYHqo3Dt4zhMeiOw1LDwZm02fbBUh/gFsv5SlV9tC+15xsKtnvjxMb+KEWQzv
         dkHTaHaQo8sQRkOcWy7JWCsyFPM1JOWQbD5V7bk724FNYvOt19LVJ1uNCLcymZF/Z3VX
         MxBDwcBp2uh4kW34m/A+1iNfe6GUWq83iAv4JclyX+Rou2Ro9uWa5Q2NdnaYgafSdsdo
         hH3vc7B8sy6h16EUu/oo+LaANDpF7vGIkLxkL6/e7+DxbWeGhlvrONcLHSWlkFnpItEP
         fH+30Nedq5x6AJxN6/3VI0O1g1DtI4auV1kX/Tat5fcX9mks0ChtHF0W8R8CQf8rxVBW
         k62A==
X-Forwarded-Encrypted: i=1; AKwUvBwx75DIOscX+bdbnZYcoItJU/3++1xEkj0kXu5zFhb0u3ItQFAJOMy422/qoPNg0l+K0VcGnH0vaKV7@vger.kernel.org
X-Gm-Message-State: AFq9FYLbq3RtHxbjtNAn+26Jc7sHwl0SLdQAJiM/m6ydP0KtJZkg+BR1
	xejHuIU37pVkrOvYjWY3Haxu2POa5CDBmsxcVG4eV8HdpOKWa1q3AHWu2Me0wWae5XMJVEQUcjY
	BoYqEecvELupmXsO/zq2SMkiaiEBzb2gTKNyQNrOtdCh88s7ecl2fmN4DVt7a2hHY
X-Gm-Gg: AYBFou3YLhn/p9aRQrDVZQ7QGwFyeNLVotmhdIZXoK4PlFJVuhh2lwtRTo6EsibijU+
	8Dodv9JfVdV6a7ZjyoJu2D0w3mNlLWbHC9p/BnBFPrXUXgqCpthMB45XLH/thfZsXQz6dVb2nvG
	bNJIcvJWqf9HFTwEf/4HRVOOoVtpI1KBzHSnG+KrPihE3yADYA9q/kWyHajY6v854vcklnM3lGA
	PSzURPl7esgqqgH7/b4s5P3WaZDTLZ7UQT8XtaUpgJyMHmvPkYX6PmfMZpoo77M+AiEIxRCK6k/
	xYeDQ7dcNUKxSHoUcbl9NB0Pn92HyrbO6Vw7gxN+7sWDduqrarEyNziX1Js/7nyy8eA3/IUTPM9
	D4gHrG1oDkp5THf4JO0G+UAlyOujKb679NQ==
X-Received: by 2002:a05:693c:240c:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-35cdd035d62mr237978eec.26.1791871592457;
        Mon, 12 Oct 2026 23:06:32 -0700 (PDT)
X-Received: by 2002:a05:693c:240c:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-35cdd035d62mr237937eec.26.1791871591944;
        Mon, 12 Oct 2026 23:06:31 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.141.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm37232595eec.6.2026.10.12.23.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 23:06:31 -0700 (PDT)
Message-ID: <43f487cc-c8e3-4993-bf1e-41e3a9aaa7e3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:36:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] media: qcom: Add support for the iris codec on
 shikra
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfX6hKwR4OOXv7v
 i9uAfdoQYrfShr8nu0ylHOuPLKg9IexkNU6wSCYiHDw+cUsvVksXzGXjlw3H+2EsKickM1OoMgp
 uIoN+jMe7L6DNFi+Y62yAKthkNK8jBNW+tWWmuaNRJ+REhKQQat+43kww/U1OHWL8SCwFTo9RDF
 1wPqPrybdUPNzzqwz2J9R07PcVMzL+oZGKpgXYNPrJIDvss5ILI4uGR+3odMUk1lOvDLCAlZnG9
 Ak8lADUqhQSBTSR06S+2WxUQ51aPUfuFP04d6WcWtuId5tlS6s54RNLzp1rBlhneQh1jcES4/nC
 sgyuQxSsQhdxam52LiIzHvz6p++qAC76W7OpaMg/ssuu41XukZ/4/Agnq8LCy9BqZ2a1cZBoh4p
 D1thbkyWvHPeFFdz+XimUmROEA6KY02AJxvvGdGJTPkYSgnrLRtL15vUqkYyiTJFygvZoNnJJEX
 NTEa3t3sJbgZ8gNzNtg==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdca69 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=bQUMaMctTmycBtt4xuJn5A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Q6wxVgh2rZIxxIaB2AUA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: rg1UKIbiPssUTfC0Fo8u9ORExSveMzrk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfX5V5EyOaQChPs
 IJKXdBQu1MvGLl9wedU1KiB97tb/P+FDvNL1+m7j39NVezA2qOHdz0M52SKMIap9/zOFSRG+D5/
 Tp/sgBUvVG3skaCpjwi18J4FTm6wmLI=
X-Proofpoint-GUID: rg1UKIbiPssUTfC0Fo8u9ORExSveMzrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130024

Hello Bjorn,

On 10/1/2026 7:11 PM, Vikash Garodia wrote:
> Vikash Garodia (2):
>        arm64: dts: qcom: shikra: Add Iris video codec node
>        arm64: dts: qcom: shikra-evk: Enable Iris core
> 
>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi |  6 ++++
>   arch/arm64/boot/dts/qcom/shikra.dtsi     | 61 ++++++++++++++++++++++++++++++++
>   2 files changed, 67 insertions(+)

Do you plan to apply the DT patches to get them in 7.4 ?

Regards,
Vikash
