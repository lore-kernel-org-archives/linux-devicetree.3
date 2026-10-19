Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FE950F137
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419001; cv=none; b=PYdF6KIdmUW86rdsN9B59XOfqSOIGnxMVQ/qoW0cYgds4LqxrMEh+9PTgj94d8U+Mm5yPykyRO8dX9P1tZB2RQULoO5qrWoJxDb90HUooPi7xiUSLbLGjC8elnLt3KJ/vhp9puxbzzxN/APExBnT5aF99Wy3oAYda3k/kkOAQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419001; c=relaxed/simple;
	bh=2zRswY1kMWQs0gXfYi4Jh01yqYcUt3kjlN5/njNXAJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqPl4dhgDMqZerIqioLWOOocYz2vrXvukg8SRCaI3KI88MYInd++o9tZUaHMoZdW/SaEzdO4IulX2Qg42UT0AVdaYe4xWbECUb4oQ+h7PCb7Ix8H+UDxca8cn0uCmShAkQpXaIojDfzvT/LSCcfkVXrpD5X5V9cLNRUM7SVRcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gv4xxKaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4MAUhmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv4xxKaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4MAUhmr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Zbu2401860
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=; b=Gv4xxKaj8Cit20k/
	57e2jFRI5tvJOAlEdVycQAm7aD75a6O52Om3wlOvEffPEIz+R0cn123su6ldFroY
	uRCx/1kEWkanakST5W+jF3LNsjT6A4HJTgNuFzwZHm9tHl0YpqhZARp7YiWs7Dvr
	TXqdcIfDJwEAq+Yy9MF+4Pn9WyIU1y4JkwdQ+J/4MMz+yMFLx31NdZp0pcSi70fc
	pcSz3jny5qvDcEVP+/z4ILWaxN4gCuNTASCuxVdXLB2XBz5k/Ow+fj6MuWuxiUFw
	iqQJHvVlIJTLfWaju/LyZAyvF4K2GkUmGJvcoIrwdjEJsTGer+dMo+bA1JWO1jT8
	eSZsvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1j2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:09:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so18255905ad.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792418998; x=1793023798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=;
        b=h4MAUhmrU82l6rJ/SL3QMlLa+Ewc9MjBbvuXWUiiHrcHg7vS7OOucEiXE1qmQfUjSM
         4K0rki5l7HQVpsjEye09we3SOi4uTm7ocB7vQmyHQWb6rWTFCRRaBbRXQH6dNbgYl8H0
         TNfJXlIL1zsE1PYGa37po4rh1H5XnVcQgq0N/o+U5wtI8B5bxbtetNA2w/FGrd9mrVT8
         kL2j/OvWTLnWwzDe2mVWnAWdHKzZF/2GPt+UlpWmO3y7KxiKLaRIVfTLQTzpwJGzcS0+
         lEIQiKGBQcH20m+H7csNyt7b62nIYSvd7xZcjUNYVbaLhW2fSl69nX4FzJomlPQaDaJa
         ORwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418998; x=1793023798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=;
        b=HT7EMzvu5oPWRSyDSGwFmN1yUWEjugBuW4q4TWkmbo2BTfxkl7kt+JiiAOnVOh28zv
         EdYb6dIM1pCk3TeDKd3nEpQtBJTrNWxUhQs+SXKL9/7sci2pfIwAl69T4LRHo/WhsDn8
         aCFQmeiVLWTrTe7yYIulFpXRlpT6ztKsgbzQQS+r7GeRuEjSCwW5YNaUw7Vx23MB350U
         HvFg8PtuIGqDn9dfAlD51vBxSB+R1yqyrlHsuY6u0Cek+HIVYR9E7jHA3aiZi4Efzhls
         IUvwymJUsQGkVHYUr3hCZ+ZET36MPFzDuh5lKMxgt04VUyOj+tf2OWtuXV1n2cMy4nXJ
         Ltrw==
X-Forwarded-Encrypted: i=1; AKwUvByEuLWESeC4JsIIc8qiqEvgnrhS+MpizAZpExNVZcjOukyngTcrAtRKD9EjGz5zXMuLd8F4i3dPdTzf@vger.kernel.org
X-Gm-Message-State: AFq9FYKum3E2v/9eLNdp4avrKQF4ZNnJivj1eZU6lTMTE9Fs8CX4EFrp
	hCU2s0dcvUhYKsPwxEj0PIXPh67rMnnpxfHA4ojAyUs9ofKO2l+ixewOxceSSTX4hzAVaRuEIJl
	HdyO6hmAC90o7r07eS6XHah0/1qK32hYfsd45IqzW8qwm8nsJfWvIdQmIYlncy6mw
X-Gm-Gg: AYBFou1CifZlZtb1cfmhfrR37q+fZT0fCKVa4H0nwx/G+IYwksh6+HKwew5aLNvu8SX
	HgHGNb1iuwkmItJLTqYHgAA4vf4IGUoPrbhQ1+b5Bpcov7EquL92At52i6MNU5PHtvuqhs3VSCL
	7Oy5nWRC5AUoYrSehAgNH9CZSSgZcrkrzUpSnLGWvTNaA5zis0pSk7VeHC0lJy5sbeEFhP32mYy
	4AyZP6pAio/lB0vco9hUMeJtQbq3GrWjY2T8mEiZgM3XRLMs2RSn5bkegU3nNMHAwDzJNHe4kKs
	IFBHoUEPMc6Y+o7kURAd64Z5MVxbMD+3z0Nrfoh5owsiBpHdc9PWGnLZa9sPG7tKzzUZruhLhYq
	G3bLBgge/HmLLE2lfAGv/QBQbAmOF
X-Received: by 2002:a17:902:f54a:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2e9a6c24bccmr68072785ad.54.1792418998131;
        Mon, 19 Oct 2026 07:09:58 -0700 (PDT)
X-Received: by 2002:a17:902:f54a:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2e9a6c24bccmr68071855ad.54.1792418996622;
        Mon, 19 Oct 2026 07:09:56 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b09sm1459455ad.69.2026.10.19.07.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:09:55 -0700 (PDT)
Message-ID: <84ec68fa-358d-4339-aefd-ed100a4b7da5@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:39:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-1-5a29be7e8ec5@oss.qualcomm.com>
 <20261013-jolly-abiding-wolf-bab43e@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261013-jolly-abiding-wolf-bab43e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX1pm+MZdyoGpZ
 k6vtzDuZ0P3nnHng6CSuNdqcDHxNJiy97cvht9VTjCIO99svRUNzb9arUPusLHu8I8yOl0GCon2
 E0p0Ol2F6DXGI+Wu7eOieMe9rPFjD9U=
X-Proofpoint-ORIG-GUID: PAOR4Puup3zxM5JYY3rK7SKjX64Gl1kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX1pjEDJ/xtW7c
 dki3YZ3pq4Jkf6iKUyeHjQv0fdNrFi2hGV5QqDumSY2848VGIwMogyBkF7H3Cs+U813eshCAkJJ
 OYjfzZmM5ebW+RyKxYxOFBziRn4xmgkA9o02TZxOYU9Gj0cH00SDuMTCl0ch3PjZxwoC1Z1nIYM
 w2o5314ngYME6AVfkGohQY7TgNYWSYLgJmvix4QbiITCPtpQZwpswNc/XE2PY4VKsJrh2lqIL1d
 acEz002+1cOindcIvZuWHe5pl8/+N8l0gFamMIUJxD0kFNvBc2EtAZUYoi9BtWvNA1T5w6QZVoT
 0z/5gnlMbeWVnDkznjRJvsBDx9nJnsqGY2ECc32jNH6oI8Yyth6JJejAqkAjyvTzoa6dMfN7G65
 2ZUNxm/yduH19iuQQ2A4C9r9rZBYInCchFGd6bA8t5aP1ABo/bUcV0AKcq2wfewNupz2KIC8UPJ
 Rvj458XrDpbkKX6GHDg==
X-Proofpoint-GUID: PAOR4Puup3zxM5JYY3rK7SKjX64Gl1kf
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad624b6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=A3JsiXT2jxe2NWqPQ1aCbg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-zH7FtNjIyeSShpWrKEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056



On 10/13/2026 11:54 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 02, 2026 at 04:16:56PM +0530, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>> different thermal and performance characteristics. The underlying SoC
>> remains the same except for how much heat the packaging can dissipate,
>> thereby influencing the critical trip point at which an SoC SKU needs to
>> be throttled. This SKU-specific data is typically burned into fuses
>> during manufacturing and can be read back at runtime.
>>
>> Add two optional trip-point properties to describe this:
>>
>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>      instead of 'temperature' when the trip depends on the hardware
>>      revision encoded in fuses.
>>
>>    - 'thermal-hw-bin': one or more bitmask groups describing the hardware
>>      revisions for which a trip point is valid, modeled on the
>>      'opp-supported-hw' property of the OPP framework.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 53 +++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> 10 days was enough for replies to feedback, so dropping from patchwork.

Hi Krzysztof,

Apologies for the delayed response. I was away on leave.
Working through the Sashiko comments and will post a v2 addressing
them.

> 
> Best regards,
> Krzysztof

