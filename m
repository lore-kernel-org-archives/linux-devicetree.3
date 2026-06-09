Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E424E299959
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011595; cv=none; b=jU6bl/t4q8HO8bRwmwwu/X9CTEKjmYLdkL01Pl/e7+UEuyXUAvCUzFKtJQdgSC8TUULxwqJmRqPEpFOrXDZUwjvWzMt4rW54tFL1zkTWcxvZGmqXeFwZvew1FnhGcQc6jcdrJOYfrydNMsnN4ubpW9ZV5RQj0yWa9jJqOR0fDcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011595; c=relaxed/simple;
	bh=ZaS16NqBLf85S7mXyE0T5MBWE7dC4iKHxYJUfo8lKo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap+H7htrzbAo1QtHByViZN1nsr45WAF+xaljX2BDNzCsZMi4C1XR4bShPEGsSD6U2Kus7zqdMwvPhXnNTOcxBluW7huQSrDvstbXGjhwQezFZOLsQe/2GNZeE0j7USDShth7VzrBwQdZijqdn8J4etKRakLcTuHfczBtWu2ko4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bP2rw/br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6Yx1JzQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bP2rw/br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6Yx1JzQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClQuJ2286789
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fodeJ2QdboYj6AqCWNyQFWBP9D5W0x7wQGzJ+z4Dj0o=; b=bP2rw/brlwC6MpAn
	KOQE7tAJ46wWd0GziVu5Wf5bKNomDFDz0NLcdZoeXMhIOE6nLgHWt9DCZOuKGtIr
	Zn3cS7/axWao3HZr1p66Y9F8c3vOFy/qGcvjQCXOYDcok/t33Ba68KsiUoGySuke
	xoORlx/7W2K0VN+SESdQ0hqsZ6gnNDnX1H2dmirSwqLGNPkNjHoO7LyTrDNNODDj
	Ql5V6SX429vtyCt6aOHmf3i5az2ZLcMb6Q7evbNjigrxoIUXeXFufasWgKCi+vVg
	pOsiwFX+lIeZOyPgpUeuPrB4D8B3YhZJKvyF3YSGPizwVYOxUrHJgq6yI4DxoWpp
	s7Fzvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3js1yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:26:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b54cf2so4040136a91.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011593; x=1781616393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fodeJ2QdboYj6AqCWNyQFWBP9D5W0x7wQGzJ+z4Dj0o=;
        b=G6Yx1JzQREtAXFJbh92UrDeu57GyB/UIp+EEIpCwEt3g1IoIug20wqRBsz7eYM3FSR
         +zn3OhtRKNv6HWvWx47QwXJgq4x4guk4ADLMCtuj9ZMGskFH8GthHEHEnfzXoOspqsEL
         /DaGkkFel0Xl245/qUSZH7zpjQs6Ybmt9MOGMDF9FJXAoAuGVSv3hbO/zqTee+/pt/7l
         ximkgWTo9vOt7wtVNeUdJ9FkcC4bsO6z2c1GHy1sSywTLAJKSXRXVGTp2ByYf8gijbKD
         /ZJwl6KcrPXxpYtzSq9MEU2bppX0ZUfGyXavFHmJDeM/Ib8KgLZQgiSih2vhtINgXX5N
         5fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011593; x=1781616393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fodeJ2QdboYj6AqCWNyQFWBP9D5W0x7wQGzJ+z4Dj0o=;
        b=pFJY5ErkJmOyUJn/mZWb3djh0xgv33wOoG1CdnD+RtdLKm5qXyq9VoP5cQlC2d2Z1l
         bJOICVZB6PHMonbnzn0CSp59AJIwtayvdrhK+tnyG8sF3DZ29N2UXEAlpQ7dRscR8khC
         kdKXCIPTQkjM9V0++9d9iJIeA1bJ46AY5C1sjLyl8GJSBdPAVcAJLsGsvrYBK0Ydf9hI
         MMO2ZNNef+ax2vc01G2j7N6U7gi88e/IZOapsfaIwyQkqgqScX4ltgHvQRuwYTQ9Q3ig
         CkbGXY5+xGdCwbtmTezw1/AFgqQSOwhOYJV6MC5ggaRHW5EIRLw/g1zDjtR3+ffCHFpk
         5h7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8atTx7MAyE26+DTl5i+mMCvaubg2ggVQgx/GR59cUzQQU3L/HDiADuPxIjrTWGJSyF6O+nRn7SudDS@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeWvP5ykAaxTFiBGnjOTPMb7kSTRRlqBpImlVjtyzbbX0rMhP
	7isqEPw0SC9oQHiv9+EVOcRDWH9BqDSld46GVUbf3e0mIjY7bn8c09BruNDg4kb9ihj4hVHW7Py
	G4Q9YrCfEYLFgoAOK85lrEWkgeJAXdcJA2RMLaIDjPWSASp0J1DfWmD2bmpShJq+8
X-Gm-Gg: Acq92OGT4RQNazxH9tPVfw3nG1sRf8sX4deHZTN+CRsaYRPd/wozPjAlaHS16nvuPFF
	zdcFqjLyPU+oUX8imQlaQJaj9W+04pZoN4OYK2yozBPOyHtmDA3AIZm5riIRPQ6cUZFRKutyLby
	79qiUzyxS3mZxVSQrvqUKPJUgqCjmIsqEvTmrC5reh1TzQw1dsX06pGu5RsuwNxLQ9iqY3cGfXE
	yv29Gbl8qp2nUPvAb+J8hjZ/DGuDDJCQ4FmWFo8LIGZXfrQDb0CM4ObLSWYwlK5tyfRDSzRCLHH
	vUMiJWZR1KWqaO5NCJarF10BWxVHpxVUUi+jClZOwSCjCQSj/QRsq1EcuVOBWnqpcbn2Rn8mgAU
	NU3HQnF2WC7gHDhbj19TrZWiup8axhoc5N8nqfLJx3+zMh8Ij3oDUlAG074JQln/McJ8=
X-Received: by 2002:a17:90b:6c3:b0:36d:6308:12fa with SMTP id 98e67ed59e1d1-370f0386f18mr22250707a91.18.1781011592612;
        Tue, 09 Jun 2026 06:26:32 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:36d:6308:12fa with SMTP id 98e67ed59e1d1-370f0386f18mr22250649a91.18.1781011591914;
        Tue, 09 Jun 2026 06:26:31 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f68bf99dcsm19245474a91.0.2026.06.09.06.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:26:31 -0700 (PDT)
Message-ID: <6f4da6a1-c456-4b3b-87c3-d1db592ad5ad@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 18:56:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <69ad1327-8ef2-41c3-b07f-61d00e862904@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <69ad1327-8ef2-41c3-b07f-61d00e862904@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9L7Y-7N_y2mO3DqL1dWpByQteXvPWzxF
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a281489 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=H6GCtRmxFJq2rLhnTBcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX9OUHQ9mn6q5o
 ZrsidEbO3dw2DU2h0gRg9GbK+/fzjb4qcPCMKSRM8chPs3uh5QU2x6Y80MApx+jAw22Uvf8+JO+
 ITjzoJa92iJR8jWvQxcbee1uaKDLOcLRbMbsxCd31MQbw3q9M0gz9vwsDtYFvUC3HcCKW1raWD6
 luOWQ70OlpwqgC8c8xmTRLqE8GEK4oekkYOI9GjdjfBI5J3bxApppvBck+1yTKgiDfGbZ/h/Jqi
 pGu8M9jTKEbT/D95wgyGRkBuGC0L75CWco5sP6mhhNcDQBZcnCD6g6CGkMefLi68hw+usF8E8gd
 Y8mbZHl99ReqWeGWHH0MXZg2Cjc6qiAvYnrYC3TeMiG8+Zce+LPbRS3oXhTAAaZZ/dfBz/M/Pdi
 GRUTv7JR6r1Qa9KuiP6PHR66RoCZFPqRNVanD7//yyYLnn50Y0JWO1dnS7Eo7mMIRVnQFlcykvC
 un07v0QtUNV1OU/OV/w==
X-Proofpoint-ORIG-GUID: 9L7Y-7N_y2mO3DqL1dWpByQteXvPWzxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127

Hi Konrad,


On 5/21/2026 4:49 PM, Konrad Dybcio wrote:
> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const char *const spel_domain_names[] = {
>> +	"sys", "soc", "cl0", "cl1", "cl2", "igpu", "dgpu", "nsp",
>> +	"mmcx", "infra", "dram", "mdm", "wlan", "usb1", "usb2", "usb3",
>> +};
> 
> If the domain data is not going to change for future platforms (but
> e.g. only the offsets will), which I doubt, please use designated
> initializers

It can change platform to platform.

> 
> Otherwise, please coalesce the names and offsets in a struct

ACK

Thanks,
Manaf

> 
> Konrad

