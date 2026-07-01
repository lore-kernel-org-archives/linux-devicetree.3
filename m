Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1933F484B
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782897402; cv=none; b=iackVcSlFwMGU4f6rGQJPf1kZCk9iEv/EIVcHjNQv7MSpiohOZ9b5wSbES2/1Z1Q056AVSgW2BolfiHLsGDCZkFeImhBoW/RqJBfp0NNyknMAogKRCCix3X0VhZiCSgy/Sef3/ZNxOmt8OqHU4Q10ppzcruLyU7sJJpZ+y7AJEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782897402; c=relaxed/simple;
	bh=YVwgQbUqvO/cXJu0uYhwMlWs0d9HSq0ha0qBi4Yel2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyslIjGt2bJwQcg5oAAUMEw4SFOGc5DPVXQCcWtMckkYtBUyAiuWs4IDXDphOIkAaScMj+wDTkFG4aqU/Tva6fzqLtUX9YaVmG9uAySIerJu1fIOp/8ELoh62DnZlYm7l1poZwlml2c/fbyDJH5P6HLNhoGlwC3zd1nsgIHBk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjmkdqYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCDtpt6x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjmkdqYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCDtpt6x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G9dP378960
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 09:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Smnh6dpxA7GSflHhp9Ym/+c6BAz0hfiEY8iMiw/ngGI=; b=IjmkdqYHauI3wt3v
	1jKzAQbzk1Lz8eAFWrYTXhsRSqmszQHjN1JOXEEy9MfRMOyTIIm5eO5s42XvTzGq
	LJMIJcBV6O/3hcLy6c7Cqxn7HtEtLWe8B8+TFsMR0JD7CS15YY36ITmE8FcfSW0U
	iMYWf37lsW7gB05Jdd/uu9xZmg514BOVRusw+vsdM2AsJ8rfdUKh0ujnlt1seneC
	66nm0XGx5V4KW6vn4+WEuVVtENESJhUjwY22y4aBnY0yqkcLrKujyOUlN+ple2VS
	bO+fgYhC2ES2vsZzgO+rZKWshrazOOG46Y9OV7N6DU3iRcbiwMJRs4oe0DHLLSEb
	OV6Huw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd3yr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:16:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so2180461cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 02:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782897399; x=1783502199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Smnh6dpxA7GSflHhp9Ym/+c6BAz0hfiEY8iMiw/ngGI=;
        b=JCDtpt6xKYX/0WX3GLk6UuwDnvq8wbVhhyzxglm7/mEfheLASyeN6AE5oRwVJyWvGk
         pnBNltx7di6jMOFiYqN59oelWnP4pkbJcBP4brttWkK/VLbr3G1gzrt6WIDbHedD3RPV
         2gQyA11Bxuiz7iiXZpotrB6m2lQKXX5M986PY8ECX8LEdlvEHFs2/UiiC3ZmTz0BUXiU
         cYYfM31xwVm4vpIDFlSMXcwy5UokDRg7PGHwUEbnG8XaQ7mfEGgLwcGFLnn96qu3MjTm
         +rWbuE2zfuYLf2nSBAheeYcKzyRxcBu71uwd5KfSsyNYe6YY0MTAkLqdv/phA+QJrhvA
         INfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782897399; x=1783502199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smnh6dpxA7GSflHhp9Ym/+c6BAz0hfiEY8iMiw/ngGI=;
        b=XdK8KajLz83lrRWo3l8QQEyKGiBP7ltcgt2u/crJXX+SNx0AWlRT4A033pKwuKZOjB
         wjtXnxYgczavnyr2Hb8QjokdZbjId/HKGKpW6jKTByUyOFxyp4Vr9qOxWrLMVG8uURvG
         PSnoiDEsEaH83QzeGdH6zzBIO9yPvTrlG5DQrFnJO0hqmZ0UZsH2wbb35Fyl9LCVA09H
         wIH2Q4sEf/vC6ciliIxX4iXeKOx9sF4jQ/wsLlx6d1pssDYCpRgQ3WBqR/9AUmJDQ+A+
         WO9O2Uzd6W7o5witJFa7w0eOz8fBczy9r98dkq29GuLmuYMBvfkw04ky41v4kYqApe9H
         jW2w==
X-Forwarded-Encrypted: i=1; AFNElJ/xETS3rsKMvFXfB4jXZhag89nTfv3OP/qo5Wwtufz11ijZwURxELaoCIIYNOhd4bPuoB6k5B88Jy7s@vger.kernel.org
X-Gm-Message-State: AOJu0YwwPGHF9xDW9C6uyulFsQUPTP0pLlUoPUFLua2ZMxCRcEvyiJT4
	AcjDWFWs42QO2Ehx4caVl4rvJk1MUAVR4GdcrXmirgyaA4y2LIQKWoQrMETbwS40bPMYt1XfG3i
	MXOWR8DHZfGhBCCcmnq0ErXaGgD4K80EiL6YC8gSo+i71XdU9JkvRTg8Eemm7LJF8
X-Gm-Gg: AfdE7clZpul9MsxHT0wiUJaNdJgycqzYkukej2AFvtL2f29NOEDjbhNKatxIx6OLUne
	2mfsLzzfZPn9pGTvCcbf+USgPMFAq5hHyBoxWxF03E3o6gXRVTeABYIv9Lg9cCPvvzJFf8vswsb
	7F9ldtv2l3QmblsCbwc5r3efhb+wlrIzmxu7E2VQao+m7KHK0/vbaYwRIQFy2rUROldkIyAAltV
	V6fhm4gQw3kVh/jgtaqGh2yAaWGCRhbPlAeQqz/1mGqMEcpP+AZGL27C0SoiqjQPd1Euej9DjAY
	097p2zPMIxbVNzSPENk+Mf8QPnLugLQqgDKxngPJ/1Dfxg29O17brSJpTgyaYpSpQjukQl+0FyO
	ng1tj5vHVQ5IfCNdEw5XDJgKJAHmHuAGlFyo=
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr62958585a.1.1782897398672;
        Wed, 01 Jul 2026 02:16:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr62956185a.1.1782897398265;
        Wed, 01 Jul 2026 02:16:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ef53sm243541466b.7.2026.07.01.02.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:16:37 -0700 (PDT)
Message-ID: <1f999970-1dc0-4eef-86da-64f555cc30be@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 11:16:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        William Bright <william.bright@imd-tec.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ram Boukobza <ram@imd-tec.com>,
        Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
 <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
 <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
 <c9f7b597-f083-4438-bf9b-a19e2f39436a@oss.qualcomm.com>
 <fd78f8e8-07c6-490b-a9bd-d581a28c1f04@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd78f8e8-07c6-490b-a9bd-d581a28c1f04@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NCBTYWx0ZWRfX4SVzeD72JJxl
 URYHreb33RBEfmki0tYzFo1gMPsZicG4GfXrcPt9H6ClwV4lxJoeDRWV7ZI5nxAqUk7WihrHR77
 18HE1tkoDC477qer81IT7Hb3p4/JPOA=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44daf7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=gNcS5RXMAAAA:8 a=giWfNUZJfUIx4I3DD8IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-ORIG-GUID: CuLzE1SQYM8q5itnQeWk3FLfwy-qO_xX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NCBTYWx0ZWRfXzJLmQ8r2b0Xt
 v0LxC9YwKMmv/PPcb3ctWLMnX9x7JSgBWT2malEvtKRTfbC4Eda9AXx5NDJTVEQ0gXNe6Up1HYf
 kiSr44qqTdO9ou1N2ugS7Iz7Ok0tmPgxPojYsBbVh22+WGugjLwgPZBUa0L+JfTAw2ozJMTeplW
 isHhnoJHIXQnKbFTfRmpXyF8/JMtQfNXCrFwWg6o2JrMJ9TGCuGaBHxClmZxypA9cwU20TUaoCe
 xDJqYytqa+1ggeo7mAJwGwXwe6PYTVFmSIuaZYfQCLfWg6XHMgG6X95YIYDaPb0sxAtAWxjArjw
 js3c/RowQmP8ohAw5N4JtdxPfMOBG8n8kqybwNipLkxB4OsQJj09mXec+tu2aELpY752UJ3QdN6
 +cQnB+c5dlfYYrWOP0bKm0knEom/Jgmxyad2S9kSZ8b77He1w24tP8SjBB0OGEvJd6VII8dK28m
 1I6KuMC9Lg9OtVT9u7g==
X-Proofpoint-GUID: CuLzE1SQYM8q5itnQeWk3FLfwy-qO_xX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010094

On 6/30/26 2:41 PM, Vladimir Zapolskiy wrote:
> On 6/30/26 14:09, Konrad Dybcio wrote:
>> On 6/12/26 11:11 AM, Vladimir Zapolskiy wrote:
>>> On 6/12/26 11:47, William Bright wrote:
>>>> On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
>>>>> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
>>>>> what may be the rootcause, I believe the lower bus frequency should be fine,
>>>>> so it sounds like a hardware issue, but could it be PCB/board specific one?
>>>>>
>>>>> If you find a chance to copy the SDHC driver (and its small dependencies)
>>>>> from Android and test it on your board, and if it also fails, then it might
>>>>> be well concluded that something is wrong with hardware, still it won't be
>>>>> quite convincing that the SoC SDHC is to blame here.
>>>>>
>>>>> Hope it helps.
>>>>>
>>>> My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
>>>> with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
>>>> kernel [1].
>>
>> I have a "feature table" and it says SM8550->SDC4->DLL [Y/N] -> No
>>
>> no wonder it fails the tuning if it's not present (or that's at least
>> my interpretation of this doc..)
> 
> So, is it a hardware problem of the SDHC4 controller, which reports "SDR50 mode
> requires tuning" bit in CAPS1 (see SDHCI_USE_SDR50_TUNING from sdhci.h)?
> 
> https://lore.kernel.org/linux-arm-msm/aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8/
> 
>> There's some notes about the frequency being limited to 75 MHz in
>> SDR50 and to 37.5 in DDR50.
>>
>> The supported modes are DS, HS, SDR12, SDR25, SDR50 and DDR50 (with
>> the caveat above).

I found another doc now and it says that on 8550 specifically the bit
you mentioned above is recommended to be "overwritten to 0". I don't
know if it's actually r/w, but the bottom line is that tuning should
not take place, per my understanding.

Konrad
