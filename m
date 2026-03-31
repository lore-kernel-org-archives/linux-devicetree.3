Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A53A3E7E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984994; cv=none; b=DHrajulWS8ZfjyAdhTwmVveLMMDpfiEn49WAX3oWG1TGRtc8PXZVEf614xynhAyt2+iubodfdFLJ9FBi8tjRh9fzFk73qSJBZJ4eXhg0rtQX4G6LjFaucsBoV666FyxrVkS7wBz8Y1TA7lhKNqqw13VFia/Jc+NDWJyZZkUgBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984994; c=relaxed/simple;
	bh=faP8AAHgPQxlP099OXpj765A23NjRVUZEIinaMijVv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgScpHgr3c3gRW/fc1KqGSUSx/dtWS8TJwjrZPwBqX04U0zoqjdhu7iPeJZlidu+/7VsbB1FHAmGFtX769PQUfZCSBihIuo7UAr3Q1VsDOhGIj8f/4Ey8fD0rRgDk+9qwHmjXr3wpWeZfnz3QpmyW9GIoT3YtcHQ/lnzvTD84Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJHL9mFJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gzw5DtiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJHL9mFJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gzw5DtiH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VIGorH3081339
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLxO3ngnNXsOj1a/VldJvjpriLPrRoW3lDgtq44dL6E=; b=YJHL9mFJoR9ZlUjo
	LvpCZh9cyrYk0rHb7zK9CURQr6SD+LSXsN0JS1Xn45bDp04ZGHwhu+HvHh+VY7NS
	7pbC0B94r7jJqqr7Nsfe3J/MJgt8Px5bSRd8mBw9mnmPnbPyUsLpzrLhxlYXIueA
	WVeyDaUGucxvHPhBoSr9YkhMWc6bwpJvU7jhHWd3E6mvhRNIB3k2lDYwL7HM4P2O
	CtXbu1mUdeORCXBEyOMeHKGx07jqUoL3hpsP2LYX5ogXKZM0mc0wMH+AOfWCpES8
	4jBT28kzkFf2kuZsoTvQnJ25dEeXb6F09woyk6la7BAj++breYvTAFNrkR/2tKo6
	91GdKA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkr878-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:23:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b23c909256so52046895ad.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984992; x=1775589792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLxO3ngnNXsOj1a/VldJvjpriLPrRoW3lDgtq44dL6E=;
        b=Gzw5DtiHYaCc9nv8ziwsPcPPXBYL6/GxROynE1RG2VBie0kiHS536AxRU5cdSNvi0V
         jWK1x4lrN7Q2NMK350mWfCr6dNH2uxHdrkyxTxbSDaBANPnYQC/0Xg2qwcIanW2grisy
         xHpmoQU3h/eA2lEnm0cJgKofG0TdSX08sJdUNnKpWlUuk18b9qU0x9UeEcLItC1FDZ27
         ueb5mX87LYYH3oPc/VG0M/gIoctFPRdarrti0DfQWjLv8RO4NUOd6KmqgBmlsMY9tbJO
         RQ3qogYptnD1HILv0neXaVEMB/J0kWbd7hFLfuCggjMvx2dxAllDp2EGUJGfg4el+ILb
         Ivtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984992; x=1775589792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLxO3ngnNXsOj1a/VldJvjpriLPrRoW3lDgtq44dL6E=;
        b=dkKjeuiYEMMhzAd+TeycZZR/ahldKWSJq4Rqe077KapToknt3hG8XT3FZkVlkgzfvu
         oF3k/R3B81K0y5rvfDqVug5t2SHENFm3sMxJVUFNrcSIqCLxPMYaWblecHN8kiHVCF+/
         uridhgZIDoI+I3DVX1//K6n3dUgNajtKEI7xkhZuNUFrvxzWGk7FCPkT6IeLIkwzMkUp
         k+3TW4Pkb8jSkrLiVRV3KWtobst1tBJ0BFjZRzU12qrGnRPvX4WBHPjj/j4C3CBjx2d/
         Cp1RLmxS6hqo6gwCDEcbBoFQ1hghbX1o46bv3lUGb3u1MVyE+DoRTnQ16+mPnnEOoXr+
         GKQw==
X-Forwarded-Encrypted: i=1; AJvYcCX+mVeuJ/qXKNwGPuozVZK9i8n3R5yR4h9t2f4mI9xwsQa+IpMlcAofcPTJyX6QAVWhiQUiDBqqWgly@vger.kernel.org
X-Gm-Message-State: AOJu0YwFVtTvswvtncI0pk032IbgmX3UKaOxV5/FJKQJa8wPMye43W39
	aB78heuL8TDd8MWPNq8dmnvckYwSrFtsfIS87nTxkE926nVDs0KSyvO1GMcyckn4I6sa0oqQyMX
	1iHyCFpMJsr9XD75TSYRe28YbZFyV+aXdKhBzdpvzk0DF3Oveho7u51mmdP/DpWBv
X-Gm-Gg: ATEYQzykEqdCX7TD+dlfWBzIaPGc98hWvvpTv0jVrV4w+QVQ1VlOkIIOywaPLbgv9i8
	paWiHJmEI2T9V7zDg1pbxtHOFBgjeLWgQ+LnV/8JW5PZEbAl2aQ8LklKpKnHcYgXNo1Gw2bj5qK
	9uwkm/W7Fhx8wc7ZdIOWC5t6xXG0rxAs9b0O0Wv1XhO1YRFpT1007zyFV/ASiH3FhFhswaLtZ59
	ho9MOUM1J+UMYAs3vlPtRZbj42GGORLwFRoC9bHTj/N56z83rwWaHJhbVJ9/AO5bRGLkIiY7fzW
	AeFRJjuLqBQjcXVUGU2fo3u7BXavMW4g7KsLm2C7EgCLcvjDc6IiKOryRSo6Dw11y6rD6Dql+9u
	Q6AlESSkTXcrxAv1rPCVhumoPtPIfYdkj2s+QotDCSHXQzUVsfQ==
X-Received: by 2002:a17:903:1a2e:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b269cb54b7mr3731325ad.41.1774984991740;
        Tue, 31 Mar 2026 12:23:11 -0700 (PDT)
X-Received: by 2002:a17:903:1a2e:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b269cb54b7mr3731105ad.41.1774984991209;
        Tue, 31 Mar 2026 12:23:11 -0700 (PDT)
Received: from [192.168.29.33] ([49.37.211.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242787bc7sm125209145ad.59.2026.03.31.12.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 12:23:10 -0700 (PDT)
Message-ID: <7e1fcefd-3a29-41bc-9cc4-41089f5f0318@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 00:53:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
 <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
 <20260331-fanatic-elegant-wallaby-913e35@quoll>
 <b1194bdb-75fa-4f2e-b4a3-9565b11bb3e9@oss.qualcomm.com>
 <0de0574a-04ce-45d0-946d-5fdc1a7b8181@kernel.org>
 <cf1d8b38-a5d0-46c6-8016-b366637d6c72@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <cf1d8b38-a5d0-46c6-8016-b366637d6c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NiBTYWx0ZWRfX+CZxn+qYzmlz
 I7hmL+kglCWv3XuC2boXqsah7Ya66jTsHADONWnc1W7fTTI1tkPkxcq9U1JDYd7EXPWAVFg1/Ud
 hz0N/paFsQXV4WFCVxNhwvGhs5saBsU3NzVlhU0CLAQ0sPR1jY9K+pYKI/otzjDGoYlxsxZDwMY
 v+S2b47mX/ev0cGx6rdmW7xOinUTys5YnhyWjAJ85sCzbg4Jnqc/POobevl25+VmZA1hEI6vmfd
 4RjJwBYpUdopy/CjDdMN/xBiJkHQvOMKnroFLjFATTjgZ5m5lXvRei3uC9m2TdiYY4DlCRYMx4f
 sGKd/EMDFcv8enYy6yH5zwhJgw8MW0Aj5qZMVssW+20q8FSvXZjw3FQwlzbi9m6I0cZdSfCkUgi
 H4QggXm1EKO65SU0S9Jl7YOSfxvhuRI0BH5y5UYlkXoGlmE3T9GF8GIAy7J+uD9CFjEKqrgeLY3
 IST2BxM0fY8DkdHsFVw==
X-Proofpoint-GUID: 93W1gPRG9kvYVSPCahFcOilsXZtJYSfx
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc1f20 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Q/qCPUFY8RH0zYWdMQWv4A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=68ybZe2WLJ7RObfeEjAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 93W1gPRG9kvYVSPCahFcOilsXZtJYSfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310186

On 31-03-2026 21:14, Jeff Johnson wrote:
> On 3/31/2026 7:42 AM, Krzysztof Kozlowski wrote:
>> On 31/03/2026 16:23, Jeff Johnson wrote:
>>> On 3/31/2026 12:24 AM, Krzysztof Kozlowski wrote:
>>>> On Tue, Mar 31, 2026 at 02:09:06AM +0530, Raj Kumar Bhagat wrote:
>>>>>   $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
>>>>> @@ -17,6 +17,7 @@ properties:
>>>>>     compatible:
>>>>>       enum:
>>>>>         - qcom,ipq5332-wifi
>>>>> +      - qcom,ipq5424-wifi
>>>>
>>>> No, use previous patch.
>>>>
>>>> I am annoyed that you keep making changes even for such trivialities and
>>>> require re-review from the community.  Previous patch was correct. This
>>>> one doing whatever you want to do in copyrights is too much. You don't
>>>> change copyrights just because you wrote one device model.
>>>
>>> Krzysztof,
>>>
>>> FYI here is the guidance I received from Qualcomm legal (links to internal
>>> documentation, removed -- I've forwarded the entire e-mail to your Qualcomm
>>> mailbox):
>>
>> As I explained already more than once, legal can engage in open source
>> discussions directly. I am not going to discuss with them via proxies.
>>
>>>
>>> ... Repos under copyleft license [...] QTI copyright must be added when we
>>> make significant changes.
>>>
>>> ... Repos under friendly license (BSD, Apache, MIT, ...) [...] QTI copyright
>>> must be added for any changes, not just significant ones.
>>>
>>> ... under the regular QUIC to QTI open-source copyright transitioning [...]
>>> all QUIC Copyright instances should be replaced with year-less QTI OSS Copyright.
>>>
>>> I'll follow up with them on this case where there is a dual-license file.
>>
>> You nicely removed the quote where they ask to follow what the upstream
>> maintainer asks for. So as one of the maintainers I ask not to change
>> it, because it is churn and pointless waste of my time.
> 
> Although I feel the latest patch correctly represents Qualcomm legal guidance,
> I'm not going to insist upon the copyright change.
> 
Thanks for the discussion,
will use previous DT binding patch (v2) in the next version.
