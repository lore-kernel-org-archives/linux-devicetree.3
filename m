Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668241D133
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663261; cv=none; b=EVlC0+oA6BdvWgAC2OsrPqOGLrDF70OVu0RiH53d43Uqi52Rq1wRBpmvDSPKVM07jwWc3k0ID73bmSQw9Kailqjv5KHRPcAbVIPUORcDl6l3S+FaQIS0Gu1qyoS0pXFG8G7cj4wiA6YGV5q0vSdE6dPA+VfYB6ajYF2d2glSSUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663261; c=relaxed/simple;
	bh=Y3v1B3nfPvaOW1ksb91wXH+WD6N0VB7OxuQ1MxfTa0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k66vDc6FJCDNqlTmZ624xO0WQx8K5Gcc0rzArs6Tsazy7N1hIc/hV3ROw/64k4MDWsC48WDPUoMuUDUe5fzO1W5nRniDdGj9B/3TsfKdU19u7rkOrpPlBG9tCtP+R1ItZutTwrC6+AysRRpZBC2v/sedS7Igwb18sopIi23Xg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8p/NClP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbGMtmzy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8p/NClP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbGMtmzy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47G7x2126871
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qb/axtgMA9zbWBioNFkhk8Pb8rwsYA1UmAFuy2+Kzo=; b=f8p/NClPX+iE9efi
	hQDdD2nRku/ZneUsvfN9J2/8wBKvNuwxs4ZVWLe3xOdYh/gprlxZ5Oyb1/McRffX
	K9RGK3mxzFvmebxKR7jhMXefQ5a2LUUpEkRqZWiFwuanAXhEYCTOyoV0qaDG6eq5
	+2cK1CSCCcwHxgGy+mHN4eTeXOezhfYavWgu2dL7nXU0EMBoSuoBvHRwVgByazKV
	Gzd3T9Cp6PSU9LcmsqM6PO48HV0Ks+rlz2jOtY3B0n0hk+yEluLF51GkpfWbS8Ad
	QPfarDArF2CJMP6vthoUPUhRpz0sYJwHeQ8Vehiy6T2+Vph5I8KUL/kNMZSWB2o8
	1OYGkA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn950u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:27:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so5881999a91.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790663259; x=1791268059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qb/axtgMA9zbWBioNFkhk8Pb8rwsYA1UmAFuy2+Kzo=;
        b=bbGMtmzy5VR2Xx5uwPIKbwsD8a4cUu0o2lqPhjCSBgh4SLOjI3u6qfFwofwi2nDfFA
         oGJfvHjzb0tP4KHesnz2Z0iJ9dmRqWP9w0BO2GC21nzjO1k99MNWyIPlVv8Ejvb7hv8Q
         DkNGvue06CLhdwdKuzigf6cUHouHgTZPprAYO1ynzAwTnGyUaEqhNZkqCwf7+kR7ulZ0
         aWkE8KMQVNU+DTOPl5/aGroVxS6vFRc7hnd2rvs2LVb+osnXZMEp01X5hBKTdJBoYvqf
         P8nEqAMyW9qoHypfpAtnjYFN1UARVjamf/ZidjiqCIswyD+k9rgCi+rrIe75HwkKFhaZ
         k3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663259; x=1791268059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qb/axtgMA9zbWBioNFkhk8Pb8rwsYA1UmAFuy2+Kzo=;
        b=iGyqX0ndDSrn+bAXzG/+H1VfvlLXH/gtHbhiYiq8LzUOIxZsCJlESBWSY3Bt+Kkujv
         o5U9QFXGbgv4LHOWHzWo++h+Nr8hrMuwqHORq8UkFakJc8ofe5unokbQcDVyrsAiBaJK
         lX/l1Q8mxummzgIR00zWlnrmhjmXk6xcP1DDpxcC+wCHczK2DUHN3exfSD7oHNbvhcfj
         QOI2RtIMtPwvTv0q3W4ns/Td4wFixADun66j27scYUNlSrTHTBCQwxbvyb785n6C1lCO
         KyFuGmjcYxsHVeywyzXAWSY/paYxRUxzdU6/Ry6DDIvHNLZDaJ3Ui3sd7Zf2w54pRGF/
         2TWg==
X-Forwarded-Encrypted: i=1; AKwUvBzCjEAiY0UwNeU6fZ2bBY4gmUlSfJtQxiJnMBhPXZ+XUc6b4gmu/fWe+gMCh+vT8BhTv7EibNIUwZZb@vger.kernel.org
X-Gm-Message-State: AFq9FYLlStyasojb7voIdwSvQkUwjyruJPXLh6un82Po7bLloZHk535y
	fWRjJDqnNcH+0Vy3WE/1ond/zKwipGZqhLz8r2M2INL/jDaXxW7Mo11l+5nE4isRSfilxGRAByi
	lRJu9Rd2IOYX517pxEbuPrP7IoZ1jr88FltKV/NgFevw1o5AffpRSO4iJJ4WVr5zm
X-Gm-Gg: AYBFou3ln14Ec0O9/iDezxWVlCEC6bEr9jUIS9ao9+qZuhxRIDT40b25xunQxE9UjX2
	o8Wlu0bRjeQIKJtsMIbMxh19rWQThmDobDCrvtD3MJ7+TUUzr4VX2UR9Ago/n9raPYyqH2VM/ay
	LF35NCF3rYbvnUZYlM+Bt61UE7onXHXyXYljv39SmnPTG1x5rlyIYHCjUD39dRPKahZs+23zQQ3
	sqZAIsNaXyZGrkRiFDhJup47byeOmvV4Fxw30jU75bTKKiEsJK77IwkxKloP6nl9nlW8cdRY/Pn
	0GfQCgdSNCBVASZLu6yY4ryk30TzrCQ4VgXrJp/BEvWgZSx6IZwy9/MaGYTlwFTCW7dsKuNTQWC
	DDwQ7M2wp0/OCfOmL8KOGtBuGU/E=
X-Received: by 2002:a17:90b:2e8b:b0:3a4:a045:27c9 with SMTP id 98e67ed59e1d1-3a4a0453437mr1052928a91.27.1790663258723;
        Mon, 28 Sep 2026 23:27:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8b:b0:3a4:a045:27c9 with SMTP id 98e67ed59e1d1-3a4a0453437mr1052915a91.27.1790663258300;
        Mon, 28 Sep 2026 23:27:38 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4982d14b3sm3350642a91.16.2026.09.28.23.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:27:37 -0700 (PDT)
Message-ID: <9f689148-45b2-4778-b6f3-3ef2b870758c@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:57:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com>
 <20260924124118.858F41F000FF@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260924124118.858F41F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb5a5b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eshuTizPadOJQDWpBy8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: y-NpDgkeSIhkj30JGy3psYd5Zv7bm5Yn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX+jX0/NoOABzl
 7b5W6dIlWfq41SqZh0pdGIbCfZnqODMwdCTgkOEAl3UyWGAZbZrLTIegXhf15LjqzXynTVDSXyf
 DWu+LaI5ZD9DJte2h5gtjlyltC5F6Eo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX64xfX+JrHL3p
 bEovZQeieXKF/DB4w2azTaRWI8lE39+CMB8DN6FP9jP2d1lfOTcW5kgMZchAl0xa4StKHvoFrPG
 +4x/56ev5sQp4K8wabhXYZDp68E6Pb5QWMPhHFVidhT2H0sa+rUttwuPa1JuTO4yeuZAQHOFN/W
 NqbZ1+VPGb0HHdpLboi99xVF5LVQZk1cMUTaLfROir+DQX2Zta75PjROyJbsWx/1lcYVcRoXuM+
 m6posWp60dyhUajGzTH82cszpQopqWHAgXDjTdeXRTba4Lp6O+GSfveB/RR7jPBwMV0lGwQT03N
 kXSLC7KguA5S8omWx+I1tPRHbRqx+CgStGbXYsL5M30Zyrco3xWZH+hr0NodvN4GyXFXcA79bQI
 RwGnwtKZKUlQjF/SnWFs9mlMQ1XkCFlfhGd5BvaDpTtSkYDlYPXujLt6AbdKXlvBBsK6mX1kF5f
 l05RgwUtjFUu+6KJPOg==
X-Proofpoint-ORIG-GUID: y-NpDgkeSIhkj30JGy3psYd5Zv7bm5Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290025

On 9/24/2026 6:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dts: I2C GPIO expanders placed under UART node
> - [Medium] dts: I2C addresses mismatch hardware compatible strings
> --
>
> commit 32fcaaddae686bf893114a2f4648aee0e464eb7f
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra-evk: Add GPIO expanders
>
> This commit adds definitions for TCA9538 and TCA9539 GPIO expanders used on
> the shikra-evk board. It maps them at various I2C addresses.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> index 0115fc9095b3b..04faf09b21ae0 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -29,4 +29,32 @@ tpm@0 {
>>   
>>   &uart0 {
>>   	status = "okay";
>> +
>> +	expander0: pca953x@38 {
> [Severity: High]
> Are these I2C GPIO expanders placed under the correct parent node?
>
> Because they are defined as children of uart0, they will likely fail to probe
> and cause device tree validation errors since UART controllers do not
> instantiate I2C devices. The commit message mentions the I2C3 bus, should
> these be placed under a node like &i2c3 instead?

Thanks for spotting this.
GPIO expander nodes are incorrectly placed under uart0. I will move them 
under the appropriate I2C controller in the next revision.

>
>> +		compatible = "ti,tca9538";
>> +		reg = <0x38>;
> [Severity: Medium]
> Does the ti,tca9538 compatible string match the hardware at I2C address 0x38?
>
> The TCA9538 hardware strictly uses addresses 0x70 through 0x73, while
> address 0x38 typically corresponds to PCA9554A. Using a mismatched compatible
> string might cause failures if chip-specific quirks are needed later.

The compatible string is correct and match the hardware used on board. I 
verified this against the board schematics.
The comment appears to be based on TI datasheet address assumptions, 
which are not applicable to this design.
Thus, no change is needed.

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
> [ ... ]
>> +
>> +	expander2: pca953x@20 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x20>;
> [Severity: Medium]
> Is ti,tca9539 the correct compatible string for address 0x20?
>
> The TCA9539 hardware strictly uses addresses 0x74 through 0x77, whereas
> address 0x20 usually belongs to TCA9535 or PCA9555. Using the wrong compatible
> string can inaccurately describe the hardware and lead to issues.

Same applies here.

Thanks
Komal

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};

