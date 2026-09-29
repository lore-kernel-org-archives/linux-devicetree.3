Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE493E2770
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664863; cv=none; b=MDt+nB7ADLUzwNfNRsXt5590yoK4BZQ+6w7hMfS/sWwj/q+TUSI9Yoy6totrbz00NQgxHCIvR5n7MzvZhgdEHkIdGHOvdprgEkSvOfXEELZSR9Yfz2m4kcasomdlS4DkxFy1phZ0lN9fuFdUl/xQ4HBT+/zSgler3rODqKg8qAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664863; c=relaxed/simple;
	bh=4AILTySd7UOFbCLB2VpbZnitKDnzSXWz3qknFH1+qvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTlHQohPMzJ3Bo+7XER1mKQA6qDnA6cT2bfhYo69S4GG8hklrhCg+YaZxR4M9TAeDEwmF8aEiU3iKXk/UdHZVZGSVGwmoraE9Qr4NXdU37rPkyp7ReKWIwjVIXtOpog9vzmmNkea1Cr+keiDzXndLpjVkl3TuRqNONfr0FdJ+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpnS3THU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OR2OwpGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpnS3THU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OR2OwpGB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Bap3643065
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=; b=XpnS3THUvae9pZLm
	5796AtzrKqWYV44rc46ERAsi0BZLg3saJ1J87xBvwPC2ulwMW4BE4eXMc/pFckEj
	/iKzpysOtbznLfGY7+gIh8a3Up6d6VhMKydLh//MTXkEABDzXpWcSgfLggTeWg8Y
	T1OhFu3jUnTZPIUloDnNCuMTpwoYBYwWefFka26WVHOtkpqZ/4lLve1peuIuvjPW
	d92e3HxoHralQT5yCn+1ZaJKO9xe5HIaPilUCDm/SzSZ8kE6IKOo2/O1dDwDsEnG
	UrxIEOyybNxPs2hAVxvtjUcIwYPjhyBlXvGuw2P4zDGpUbg1H8Fswu3HHOSomgfQ
	IDAuyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4sn2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:54:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so32055235ad.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664861; x=1791269661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=;
        b=OR2OwpGB/HqfLgX44YoSoIxHeqOYK+WpNj1fdS3wbtuREpP+E3P0g9Wo32IQBjMJw1
         qrdby+t1qypJLn7sIgY8G2x+WNA08Mv/jHantuH2ytWG+H9w9kC6mBCxSasHCa6jOi0T
         HBtjyjab+cqv7LVoQIOYiAHIQMxmGzk4S9M061zRYA55cedVyCQeZ0tgfMyPjRf/ry7I
         KBcJ8zvDKgK7YR7VsJvH0axcA86pqMtMIiNg+sxcikYzvXRI4uv0yjbWazNK8WsYQaKj
         xZyoPn6zIJeuqEZQpvnezWxEaYVpl9Iw8YMBbWvQChw8d990kd8Wepor9xutwl8XCql+
         gE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664861; x=1791269661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nptFMILb3QxNzc5p1LDXj34HfvgxYdfHtBcXmYZumTI=;
        b=e4K93EC7Kr/IRJnPMxDpVjOo7zur02RHT0A/n687i78tA3hDfMVsOYfyOdndiAEZvl
         ATjOgDnFzOOnd0PO8osNKI419KvG6vpOGVNxGIHJUhTjkrepLFTzCEV+jbQoP/c1VyVl
         QhLiIyVvxMFuyk0b/L+bBvQI4YFcZysbFps64ZIGYgpJnqesp3g7RttTBBjUvqvWVjxl
         6XHL0lLaU4Up9bgZS1pYs7uWMc2LljtLBbdXqbzw2Srpd+j4KOCoxr619Mje++7JVEwS
         sN3W+uXuPhlHhH+o994bTjqyLdQpCgPBUIyWbGBYvcVepBUYfa92sQQS2mtan4CtPW2M
         nzbA==
X-Forwarded-Encrypted: i=1; AKwUvBz6DOhwwt1RBLzzBVlDyOYMoa11NxDneX7+3gkarEmidRdwCY0FaPIaiwZudwHyibsdL6/wcaeShNiQ@vger.kernel.org
X-Gm-Message-State: AFuF++lNoX1eFp4wXeD3/Sno4SQ4JEnhafrge7Kh0mGfOPmR748QWdop
	0W82Dq8OYVqOoEcy2SCqEK3qZ8UR82zba6gflEK3gkiYLtb+ge5KNWubnVvEUFDV0b6lu0ZcPrt
	V0O1SI2Jplkjk42JKyQ4TGmQ2Lh6LpAhm+2pfuu7uQ+QC+zeZllOMPbO0vJL41eq0
X-Gm-Gg: AYBFou2+cIwxY+pSS4OGPeFx6zVYikdX31FOVdAdbZSZvCIK08YhoH+1IzIHbwjSaCh
	X15ScXoUtAWhGoqGgjCjp2AqZ8L/OQrnIM+DYltd8gtx/7Tuq09+Z3UhrnZTCQwBbgqpzAPCuvn
	x+cdBox6LnZvp7ZOJv3uR3fxLIWzxhdBzILK/KdjJGXEug5XUG5ef0uCK0qH0Uj753VkVpN/nON
	htt0LlbyBrArOsQCYEGX72xoc3dpiqEFdQqLNsdhzjAvcgleBTCmF76c7Wg/NrgsyADwa7S3G0m
	Rekc69dqhhKeze6UxVqDHALfYLDu81UUaSswRDGK7HVbWchIOg6aSO6JYLvc9Hi+vyVbcF2IoJ3
	IlZDv8FcO8nozc8gR6JsiNiZhAyi8a9iYKycjO0WpP9QIky7CwNRqJGf0L6NIOeqaVPKkZFmPVj
	Ps36P4p9wnkRkt
X-Received: by 2002:a05:6a20:c784:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3de0e73a73bmr14325975637.31.1790664860867;
        Mon, 28 Sep 2026 23:54:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3de0e73a73bmr14325957637.31.1790664860412;
        Mon, 28 Sep 2026 23:54:20 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78773acfasm5579201a12.0.2026.09.28.23.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:54:19 -0700 (PDT)
Message-ID: <41953b98-571e-482f-aea1-6c3ff78f09d2@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:24:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
 <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
 <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
 <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX5t84OrawuGZf
 wO81nRtr4968zZEBu59m1SkBu0QBkK6gPfRWndlP8e5nB6gx0rVxoJ0LelxquDAIpkkqmrUKDHZ
 AVWzqAvNlPWzLXTn/qfSabiXLvNBT3s=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb609d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=G7NnfM6ISWE-AksYWssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXy4Fl0AfLmzA6
 Y/RmtfrP6ZtI881emibNPcmjMceQJvU/RVt7EfKM9GJXIlp5b1sswc6XgAsB2frC4Nno6E3mCep
 MK6RlpJSh0jJdmuWh6fsg0zHKq/d4BQZG2FvOlj3bNiLKWgpDI4/PyfISwjQvyEBADidNrH2XpP
 K1vNc9TbTwQSdTDpXAokOp98ej0xQbSTtuEyStycBWA+DmLrBSyOGu2uIlAQqdU436EdEhBf4Hb
 m/8CBkNFfleo+9LjvEAHZfG6t7mZ9bhFnwmUSX2M81jD+ydHf8uTFvLRBcJKDFiE9K3KKELWwbB
 qd6sV60PjkO6XvVlzTHzfvCAduoKNlBks6cnWfE9385h56Blnzm/mvzYWZoWMiJFYd4KO6YV4Of
 ORXkCNJM61MqDZmKxupXM4Iyw0lxNbKtjkR3N+Y77DWntXRJx8UR61OgJzcT0o5WMSa7tXCjSnq
 /AIz6E8xVNe4ZBn4nRg==
X-Proofpoint-GUID: 395lsnsRUfX-MGK1Lv5OjL1FyZHQre0o
X-Proofpoint-ORIG-GUID: 395lsnsRUfX-MGK1Lv5OjL1FyZHQre0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027



On 9/21/2026 5:53 PM, Konrad Dybcio wrote:
> On 8/19/26 7:19 AM, Anvesh Jain P wrote:
>>
>>
>> On 7/30/2026 11:51 AM, Anvesh Jain P wrote:
>>>> Is being on a (powerful) charger a prerequisite for entering this profile?
>>>> Currently plugging in a 5W charger would trigger the switch as well.
>>>>
>>>> Should this instead be exposed as a fan profile for userspace?
>>>>
>>>> Konrad
>>> Fair point — power_supply_is_system_supplied() only checks mains
>>> presence, not charger wattage, so even a 5W charger triggers the "best
>>> performance" profile. And exposing this via platform_profile instead of
>>> an automatic AC/battery switch would let userspace make the call
>>> instead. Will check on the feasibility of making this possible.
>> Even at 5W we're still not battery-constrained, so best performance
>> still makes sense, it's about wall power vs battery, not wattage. And I
>> don't think userspace needs control over this either, it's just an
>> automatic fan curve pick, not a performance setting users would want to
>> tune themselves.
> 
> I believe fan profile control is very much within the expected
> feature scope of a personal computer..
> 
> Konrad

Fan-profile control need not be user-facing, since it is only a
thermal-management policy.
-- 
Best Regards,
Anvesh

