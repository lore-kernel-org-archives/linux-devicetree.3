Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964943AA1B2
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560190; cv=none; b=S60xnqBAoq2k8fIH5d+oBRgPmmIA0CqtgD1xrXPxzWXEP/Q8Mq5d5Ag/p0qWVncMlfOHBMYYJHfNJGvTTTvhU6j/5FC9+Ug3bkMUv2swLPZ0zZkhhs5JMMPVitJqV08sxPXu4q9odJy8InfBAOvdPQzGUVr4m4MF+Y/XCEsILDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560190; c=relaxed/simple;
	bh=6GAyjq/gQbQzlatX5AvAy9PCMUY6k/966rJsfggjNd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANh9pegNkRIsumiodIO5t/WURbWm8Y3YarY2WwHbYKxntbdXWuAmJxZ1OsGeoTWVoC8gv1AbMZwyooBmiulw6w9nZdWm8WLPGrj/y7Dpdwa9HkZ9NTxf5eA9A6Jl2BeHCH+WAUb9zbOkadNHEy+ITPyOIFidxCMNUrA8+9wlHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSbQ8xt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikROfZgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSbQ8xt6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikROfZgX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376HLog1407039
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eiccQO/e38UrZ6Zd4wBRS4N1jpEVerQAlu0qR352HE=; b=PSbQ8xt6vfHjLk/T
	6rE4KjXDYII7BcW9mZcFNICoDGuszI0WijhVva48m2jWbtSAITuaLcr4q7EEd2bX
	9hNg//XueEHZPkejgpSBq4ecniR6QN2zAlwYWwmlhj5/zQH0+OItHPEb2AvnXqv5
	LeSaDPm7fXCu6o60sT8CjQYiL3vbaFJgzIyDHTPmz9Lxfrg+mRBnFxrL7QRVMand
	QdkZHGniJywuTInzYB6WNU5vF0icdwNGLLo5maIdeYRFaCrjwJQTrSy5MhQH+Qod
	JMwNswtNd6ivgrHP3WtEDDKlwjAHKq+3AoPzCcFF7c3sZVAOYO+ReX9ZzQfDAcWi
	3l9t1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmratdp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:09:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24305cb3cso59928565ad.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560188; x=1776164988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6eiccQO/e38UrZ6Zd4wBRS4N1jpEVerQAlu0qR352HE=;
        b=ikROfZgXPHc/cHbiXvhFlJJypWYTXxFW7vTZpSE/Ol7ohUKei7N37HJ867zBeZDUje
         sD0pshXPbRSvOXiRMMuEs6HF7xvGxT0dCUD8hziutRsK8Q0xu0vfR28rn59HntzR4zWI
         w1h/TYCS5TP7wXIitv0veCyKpo/r5XHW09iBOV5sA1IJkCVlbsPXGOKPFMc2Q35Y4vET
         XCgFDYzC6urHSDHWHTrDXEOi8ASX7vh4NaZtfuGOBtR3+LB3Ouj09YJ8H310GLUeUWqr
         fgmNSN2p4zWrWRQR52Xa93fnVrWRbxg+uvE7bPAnvT7gTZoM6cfUNSatkJ9B4HLbXX+N
         vpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560188; x=1776164988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eiccQO/e38UrZ6Zd4wBRS4N1jpEVerQAlu0qR352HE=;
        b=WoaUG4VgDszKf13ijBB/suzf5wFrwiZgTent8RUhBOGDK8QL7ZZLl2PGJAqvVxVric
         tS283xadHgLFBdexT+d5rGj+1hb2gECL8PQbXBg8R5qbFETMaVZxkFGg6igOl9pV4SG+
         A3J9xsOJNg6zyHciqSfzL1qYR6+k+6dJMb1bZOAMx9F4min4q5Qidd4ad7hPL075EpCr
         WaxJgOEWrE7c/mkwh9l11F/QgBxD8LILoH4D7guyVn0unn3A3w+BBZqJ2i5lJMj7AA30
         z8NuyKaBEBTE41CxaL1NW9DL/ZGCvh5ebAw5DDKND7grxbKR8bndCdxIlXQS1htMwjsZ
         bU+A==
X-Forwarded-Encrypted: i=1; AJvYcCVJVy5eADjKgwRSTadUjRKLIx0O47EdKlYEHeHXlDImArmAz41GnRe0q5nYmOjwLaS5qMhtI5i8m97a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz658ZoUUEOUOGuf8ptmYqDIocgPJXdruRxZnODujQje1ceEuvL
	oek6oa4VzmIK1z+/njWhYwI8P0kaAzMdOoGH9u9ROez0Bh0Jvwk7mcBwMyFGl7Qkamo4NqgMLxS
	21X2hBB5mJsuteOPDyFcwPKhwOzIFsyLMWDHpPdFg3aECFBaSA0j+QXE4JB0T+yud
X-Gm-Gg: AeBDiesZn21G5hfF26WumuvsNoLnMPqhrk1FA6TB959NScs7mk1QqnTHwO40yZhHaDz
	T8IRzLWUWGE26fVcYxNqg7yNWp94hjOswslotT0YYHO64yFGSsHFQEiQXPSZBrnSBMImiM6VRVd
	B4N59lU7WMD+dd19Dsi7xe5C08+TCaJvuF3VH0be3sjDd/KEcG7/fH2KNTUibZkJMwfr9bHljVP
	lDEd1o80ofn27ZLADg1DUVmDqvfoQWrUDKRBwAzbiUPRWyTU7TmZfifPctA0LA65aTl8MpX9Z3n
	KLaUBpdbEVlowC9r2UpKhjJSW4s3yADWKjCko+RzO0D0oH8H3GfRVp8Jjj91sDgqB2zJ3lefN00
	lqcfW3SmGUsGWz06UAyBlowjPHSPGVOjajizP+eZfiF9d+/mUp9Bc
X-Received: by 2002:a17:903:b45:b0:2b2:54c1:2067 with SMTP id d9443c01a7336-2b2816f3dd3mr166178235ad.21.1775560188285;
        Tue, 07 Apr 2026 04:09:48 -0700 (PDT)
X-Received: by 2002:a17:903:b45:b0:2b2:54c1:2067 with SMTP id d9443c01a7336-2b2816f3dd3mr166177925ad.21.1775560187819;
        Tue, 07 Apr 2026 04:09:47 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm15510846a12.31.2026.04.07.04.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:09:47 -0700 (PDT)
Message-ID: <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 16:39:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iQHxJDKPg4HunzV7KNpXvcJ1TgKO8uxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNCBTYWx0ZWRfX+vGsKO0Sm67y
 XSeRi9S1lTMc/pBmA18W98B+Dq84tPftkw3Td74fv5bIkGmM3m3nArywnCLuETlgjeaUcimsE3s
 OiI2nWyjMf5fQncu9VyQ4kBLugNQmBmKars3n89fTbO6Qe+HlpKaWJIurKokSoO81asmh8rkiEo
 i7yKuDDWJ9kGfbLDpwm7RxMolQeylELxJDXVr9LHzDEx50r4ie/lvQPqltEPHIBJqTgr0TEmc3b
 5V6ofvbWllEt1MEgIZ/cjhyMZdl+cZ8bzQcumjKIhorMkXGR1PfkV569Y5mG0j66z50q8DpCrig
 Gm/BXQxgl4vrbF+SMTGwsYwmR0RCtvXbIJU+B+l33ZSfz1L/YA1FDxICbW7tkGvvzygp3aVHCOa
 KVboFQVsa9uobOU+HI0VIfKCGy4No1nA/YS0nDJCjm7lkdfdhuHMeE2dYZdZJVc8oc6565hXdL0
 0lHfs2LHpG31w+qMCOA==
X-Proofpoint-GUID: iQHxJDKPg4HunzV7KNpXvcJ1TgKO8uxV
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4e5fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=yChZgWpjsVOoaIn_3ooA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070104

>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index dda4697a61b7..5e6b659e8719 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>  				     "qcom,inline-crypto-engine";
>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names = "core", "iface";
> 
> nit: one a line would be preferred, please fix that up as you seemingly
> need a v2 anyway

Hi Konrad, Didn't get your comment completely.

Do I need to send v2 to just fix clock entries in 2 lines?
Or some other comment to address and send v2 for that?
I don't see any other comment on patchset to address.

Kindly clarify.

-- 
Regards
Kuldeep

