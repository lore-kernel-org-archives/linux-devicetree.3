Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863A01E0E14
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271170; cv=none; b=pis8+P8LJ177ALbwvmNkLc5pvfxDODdcYrMtpPck7/HfwI26OhBwekPIf+mmJg9Yg/fse8wlf82E3rB5M02z9eTsy9X+8dBArrgxFrMLFwOlrXMCUmnGKj+jnS5asHkpQ0CMghREShXggyLNiWW7YIxc7V64DLoj5hzkz1Cuoco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271170; c=relaxed/simple;
	bh=sCu3LiQ6BBeo8pTrcqgParOHaEylWJEYsSiKJNJK85k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbVXiwMqEBniw83E3fFe2O9fOxOjocAKSjWDLZHwGqoz7FsEY61+L74to13AaJYvLU6BqwmFwenh9YbkXdsJAePV96y/kYzoWh6XTvk1lxXcfnC8WQlwQc4Xc1Kt0rB0A1DnkOkTRhCI1S/8N+oqgzra5EwNGgS86NpbSNx7Tvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eql6VYLQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6bkvKuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eql6VYLQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6bkvKuQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tUnF1627059
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSsZlQvR1eCULORb/lRgNiwupNAmf/BLASEK6Sf3Ngw=; b=Eql6VYLQXE2eh9Uq
	80/JP0rN9ZVl+a05bwgsIA/6sd+SxtEIhEZB7KpkaAsNbgNafbaTdTuKOKkcnjc8
	sNqrX9kzr6oEB4R0vODg3HSyCz+ZeZyIBNzcEFEwuAsEncdbS5hesQDhnWd3yQIg
	Vut0UKw4mf9jhKczOM2SKp3h189DYD7khCV/04ZXnfW3J2FTyMVxr/a/vpkmSrgL
	I3j5MofmVcpu2Yd/6zlXLd/4f3fjaJFD+/AjqUeFhCO8W24aP8ANb7r1BK4f42CH
	Lioz/MXdm8gxuwexZ/1FYQwVHWYfbp7tQkcSfNGks5lp1PiFlvKJDcLA9xfpZuZt
	C4LYkQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc12hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:06:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ce66c736bso263236e0c.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271168; x=1774875968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSsZlQvR1eCULORb/lRgNiwupNAmf/BLASEK6Sf3Ngw=;
        b=I6bkvKuQy06rxdvMhqX9fCDGeoqE03Zih/+6u/zzav05U30dgh9DWb8oWcfpLGj4S7
         GDl+mStMWiBPTtLuATZFA0VvFV/jYN/tSGZiyIQHVhw86PE/xog8PLrLX3DpJs4Xe+gk
         C7BOmhDH/EcEY+LAGwRJWEbthHfuf2exef54CDapA5N1x+2t/3BNb2ZNrn/9Gmqpi31p
         85+UUX73DR3Wy/6qsVS7RzbgUWAswsD1oDqhk+PyqnF0Hrd6dZ0GQcX87nIsz2FhX0zp
         5iIa12xEPGL6KVBMe0tuQPTImuTeLMtuih6HyibVUiSv0KhZlO89LGt0i4TNMzWXVnLF
         zyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271168; x=1774875968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSsZlQvR1eCULORb/lRgNiwupNAmf/BLASEK6Sf3Ngw=;
        b=Y4HIAVvYxGSajzqozFnatWv61R6Ih6f1krpjRPkzXkw+YS3RbI0itc9nDHgDPhrDu7
         gn8awJRlEbZgpR40msXnfEf70Ky+bb8TK6GoDa1DbhR64db8I6LvC/5dylLNypdQo+OG
         2mljV8V+29iMBGPZthGQPvD5nBg2g4wjLcvFjmU47S4m6fblZwGmV26j/tdk/13+5SZG
         fhJcSzVPn7CphZN+xcqx0QFxjn55mJ8P6ddq4g0R7Qdr3NE1dm4vN84sxxOtBYu6ImlO
         Jg7IpSYqDkDShzJHRMOVrxwmaUHP/l2j6GEnQMUWIZH2OdY806PdaDdpFfqUm16nkmSG
         9nyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXso0o5dp6LcNOHiRkf+RXVxfhl+tm4X0+fgZcSm+6Iso6TFJZhNd97ovi0wRBTzwICY59GtoAwBCYf@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQ39OsUfvG5BsZuk6AGYKOCps8Y8UhuA+F3xS19khZJgRVpCr
	Bg1I8OsQfsQtuPZqC8PFlTM65/7tHqw+wAZmhygv1pgxSk664t4zM1yxlwYSQphBidajhkGtUQe
	6WoZt1KqEBGxFmlS3iFH7UnU3pQXHGx0h1fJghdSnYYSI/xwWWV5/lIrRfr/1Bw+R
X-Gm-Gg: ATEYQzxvPC9QECx1ZO737vT8osW1UHkFfmiNeI74/LbNf1Qj6iwwqN52D2I5eyHr5Rw
	Bp7N3rJb+9UHMyh4r2tSqcLDg7KFsYwzS6thIRrZyrqdygh5l6EmNnn9atI2jt+fOslR2hjuF3c
	RIT0EQ+vUsYumYWWVJFTbS/N1Z0YSvxuNBiLSjZsG7RHZbKO0a+Su3+JH/4BXUuvGZQVnc6yIdo
	IQLT2osBU3d/pDS5i/5iOpci63ADQIIhgRwA2YgsHgvhUJ1rA8iFmi3J/QquSTYEijtX1iXyCBA
	2eNSsrtHIL/ic8pTvCL+GuBqSLLuW5XcNp9UGrvaQnDzG9djDRuLnximYYUC1IY6HRlb3sJHVnk
	u1WxLxA+mPeRb40Zg/wmNqSws8bxGSNP3qyEIqYaYU9ZSX4EIDSWKUhMvpy46UTNYe4V2i343qf
	OHCpQ=
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr140010e0c.2.1774271167650;
        Mon, 23 Mar 2026 06:06:07 -0700 (PDT)
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr139960e0c.2.1774271167149;
        Mon, 23 Mar 2026 06:06:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832beecf4sm499648166b.0.2026.03.23.06.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:06:06 -0700 (PDT)
Message-ID: <b2ed0703-e1e7-4a32-ba1f-f4532aeb9f62@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:06:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
 <20260314023715.357512-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314023715.357512-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c13ac0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R9MQUlOpTqeLH9orQUEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OjbMlV3VoJq1nLRT8OXqqxbCET9rRQX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX+XR2Nylg2Fgx
 ji2pXwXCjM5G3R9mDobDvZDVtcOYUwA0+Db80fHcAGMhd605pzg61iANUrZdradYUJG6UJVgflH
 3FgHu2jY3kR4JJQmsC4URb1RTMQVpSbhKEsEIqT506u1ZvOkiBr9Sm2Fu/3covsc22s4f3Zv6zh
 tDtdAH8/ZncrSDi4VTUQe98gkL2nn3EI/e/OgbwhTG7zbwb1IK3fQDPw5dUXApiY3pLL+GYNVMX
 2Z3uYc3FTfwbUaUbuXXHQtN1iapQ8UKPnslUs4vknLVZ26hpaHD41e+7IhR2IEtQhGAjdnDe9DI
 XDnHcgDGkvS6Ccbm7EB/iAGo558Uada2R+MnFramMEcNvlJP+4ot07Cs6pMC2PXtJbkH9COoJmO
 9CuuTQkXkcwgIvvEiNRPAU20gFSJvwCuv+QbR4OaOiuoF3Q4X38m1xG2DGkhw5qEwgO2386i9HP
 xBCfCiPtt3Yr0p5aAkA==
X-Proofpoint-ORIG-GUID: OjbMlV3VoJq1nLRT8OXqqxbCET9rRQX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230100

On 3/14/26 3:37 AM, Vladimir Zapolskiy wrote:
> The restriction on UHS-I speed modes was added to all SM8650 platforms
> by copying it from SM8450 and SM8550 dtsi files, and it was an actually
> reproducible problem due to the overclocking of SD cards. Since the latter
> issue has been fixed in the SM8650 GCC driver, UHS-I speed modes are
> working fine on SM8650 boards, below is the test performed on SM8650-HDK:
> 
> SDR50 speed mode:
> 
>     mmc0: new UHS-I speed SDR50 SDHC card at address 0001
>     mmcblk0: mmc0:0001 00000 14.6 GiB
>      mmcblk0: p1
> 
>     % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>     1024+0 records in
>     1024+0 records out
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 24.8086 s, 43.3 MB/s
> 
> SDR104 speed mode:
> 
>     mmc0: new UHS-I speed SDR104 SDHC card at address 59b4
>     mmcblk0: mmc0:59b4 USDU1 28.3 GiB
>      mmcblk0: p1
> 
>     % dd if=/dev/mmcblk0p1 of=/dev/null bs=1M count=1024
>     1024+0 records in
>     1024+0 records out
>     1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.9448 s, 82.9 MB/s
> 
> Unset the UHS-I speed mode restrictions from the SM8550 platform dtsi
> file, there is no indication that the SDHC controller is broken.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
