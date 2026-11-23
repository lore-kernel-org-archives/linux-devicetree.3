Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424525;
	b=MkzJXTfvSSzddz2jT8uJszp4u3S5PH7hd08UcIbMUCDb4ChaijbyDdZ6XQ+SiMeGvc7B
	 6OwuYQA32brdACK/hA/iDnvDNUZF5sV6tqiFqX0xQzzIBnYxV9CtEtkkJKTJJFwFEg/KP
	 a/nve5Dl4wkZw5BI6WeXXlZlJlBVi0FxVH6B3TS981Mst0IF++uP9tM9bCvHJMpobAml3
	 uWvZj5L/bHsPmaAOye21ZwylpKG6f/+oVIpk64wTfRKcfBgmZaeyGH8zYpeiM5CNrZ/mh
	 SvURA/lJQjd2wv4g9hcw6vC6Y8zrgb4sCbfjMTCDmoF4QFn62O9bxCviQRDj4rVr/0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
	b=RVSQtHdSJ8TVFnzWC29nJy7WkK+X2btLDA2fzjawHNU1b2fVky0F8hVyoWVEsnd/3MYL
	 4yYZ+/gFZZmKfGqR7LKiq5zvogLqxLSfzoGKRQwV3WCliaQWDuFlQuAo/oGPwyN4I4Rc/
	 58vMNC5iBRlZwfdp1I613JCCe2/rBbgIHQUnXbhZZk0vyOWZ6Vv7+LAnQfrbXG3wQzRKo
	 tJQCHDruIqSOzi+G0gsnHfGx1CTQygFuHdvZPIZhos0MAyBj4wIBDQEEcY1psEQxevDcE
	 g3nUQYhaPZQHB1XgaqXJuA/o09fBXh4Sb1+5uTk2bZ/ZGwNytIi51on9eFDs5ZyeqjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWgfoC5l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyK316T8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FD3606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FD3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWgfoC5l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyK316T8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50taZ831208
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=; b=MWgfoC5lSh/4ndNX
	TV4zc27Ncqju6gqjCxzGB+eObjVZar16/cqqP5u4PeErJ8dvVK1ZHX8RY+IS1Jzu
	InN+7M1y/f/xG05MbpuknMbok8YjAgBfa52sGJIdysRsOKlfG7bB5ItSmbGAwKX7
	6gG/fZabpKwZeTwQsEyMpxI744QUiXK/zCW26KcVx6h3mVNprCQ+SVBudmUBoFAV
	cr+PcCETXXPKKkp/rXf6tDpx+WMlWjRr0AGLy5PH9aWzm5icdQfRXd1Y4N8jtJtD
	OGjNNRUNdXHFYspXlsMj4N+nA7Um12b/fggX3C3uwfWWh7sPS/fGf+AkTerGt5w3
	X4fSAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx0tbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f08491d837so5892275ad.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795424523; x=1796029323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
        b=FyK316T8niyh6gOP4Dl9EnF4boMi6mUx9eSSoiwcTN2O771S4d8kgbUAj6lkKP9fMl
         ATRd/c81q9gm/0MFJQINgSKqWXTgp1aNJ7LZeDrjNwY6gPkfsvEe5b+tXE+iw8S4dRni
         7fEOFkCIPgSjmWf94KIq5HeV4qrNfnfyGqcUjDEv7B6w36zsK57pXyk7laHw7j4czX87
         DCcj+pPey/VbLJ4UN1DVcLsipEmncJDYKtm6D1OcyiAyeDFK/LB80Eu5mhryu/AgiIe+
         6L7ppSVZzrd1eHiIOWNs12g02begytDPu3Y2DkjtFTec30TpEXha89YmuD7LELfBVNwG
         1e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424523; x=1796029323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
        b=A8LcJFMFsmLGEnDIXPjkZbRMQSN0Xsl3HG6atue1CDukGi6SkQ7hBCr2fM8OsTkJfR
         fZBWbKpuOSmHlPzK3u90E3QfGr2FyU30b9kqh6TAAKT4RPhhSeZMNSaG2HeBB7Z0s7m0
         mFUcdQ50wZWPv89x2rtcQLDa17XXYHs3n6cMCAgXbet3OjPM+7oIqMRqjj7P9hQMOdQ7
         9u2WYabrO7ftvAONMvuDiMDmwTFJHfy/+0ZjwrAHS7a3jKWu0MjqtXxsjXS2p/JehXHw
         Zs/WRD15P1730b6MEttGS0aYkze6LfI9tyULbep06pL3EptK4BP8nPJyvTErvSCUNtYB
         D64A==
X-Forwarded-Encrypted: i=1; AL+hErEg4+2buGreonKBYVGtfJN47z8jzbYNj2h/H2nNzotASwAU4Jb88LlmUZjCpYPeMLou5/t+M1Tp5OlW@vger.kernel.org
X-Gm-Message-State: APuU4Z+TNCOGMIKQz2gsxcjSsb/h27qw0pI/y6vGY5dFdhQCmG+4OiKc
	D5qZPWrAVyRlmGFlHOllQH2rCO8bwUU34sJdvBW+60/riGwvLc9QtkBNXsVUPle4bEFRPouAzEL
	25hVEmuljqG6LFl2497TsromDePeZddGW8mPFc4wb6I0ZcYfB+6SQsalxN+fRqZoO
X-Gm-Gg: AZFdTZdiLJy1ajuYYp1Vbpt471qKQqcYG4N/l8bvCcTTQ/X9ccmsfZbj7ueRH6CbuW6
	tEbEaSBgSlRWyr7PKnfZt0TeGdrqx8v9aYFXue2ywdZmZ79g0vSxwehAmGhd1xHe0a2vWK0nqoj
	1GqOp9h6aT33tBkg0oN+WUW6l//tDWQNIHDqCHxwneAoFG1eTrT+kXux3K2yS40HEDh7n8NhcUc
	m/aHy+FWy0hF32W+G5oD8hvJFVWqxPg5n7YJJsO/LlC1ucuQlpr7yJWKTSbnm2/c/bLRAygmbzS
	FaI58ZnnPxLcwHH4YT3cS6M9tHmny5Za3+6ZQEK/STDaAL9TA1ozhiiQ04r1l3R3VnPZ01DbB0o
	iDI5wcjvSR9c3PQFKdCB2c1sVvPJSuiTqz32VUbrHM5E1ijyL3zOqPJXfEueP3Nhv0pDHR3mQe0
	WrHw==
X-Received: by 2002:a17:903:b4f:b0:2ed:4b23:c417 with SMTP id d9443c01a7336-2f03f1d85a3mr95386925ad.11.1795424523474;
        Mon, 23 Nov 2026 01:02:03 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2ed:4b23:c417 with SMTP id d9443c01a7336-2f03f1d85a3mr95386675ad.11.1795424523035;
        Mon, 23 Nov 2026 01:02:03 -0800 (PST)
Received: from [10.217.219.74] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0667679d8sm30774935ad.48.2026.11.23.01.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:02:02 -0800 (PST)
Message-ID: <7830e840-d0c8-44b1-b3dc-185560fe9fba@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:31:58 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
 <20261117-ucsi-ccg-cc-orientation-v2-1-2e3576a11eb7@qti.qualcomm.com>
 <awBeRhkkKwWGYxm1@black.igk.intel.com>
Content-Language: en-US
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <awBeRhkkKwWGYxm1@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04010c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NqQFgKtdHuj9WFOUiwsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: R7x3kkzZF2TtrRVcP5Erah-oFdNp3hXZ
X-Proofpoint-GUID: R7x3kkzZF2TtrRVcP5Erah-oFdNp3hXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNSBTYWx0ZWRfXwPomCDY3foew
 hUNKQSUtcJuK0lRYa2pU8buDnCG4SRQAJXz9jHa1bRJUDl9jwLykwbMhLeIJrv5hoGRKMtyyj4j
 v4dSrxBflDg4AdvXXrS2D7WFJH4NP3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNSBTYWx0ZWRfX5TqGv0+ndExl
 ST3ZQBWZN/HnXmlQMLpY8JNMWeTabJLT72B/9Sn5gBJTnDEHw3mp7cRpMK242IQJCbiBiQS7vjP
 lUwJZUvxPGzhquJ3R1cvQTMX9dbmny2yh/iN+10+wmBI8LAN3+GShrJ0IykJYIlowS1Zug5s0Il
 DMZiAHk54l7sqCjo74Lw/qOzyQz/CELXpLS//wJDHweW1wN6P4L9MoEoQucf3klIdHelVtj76T6
 vSnaaDGEiNlTYuciPdKEKXwAtundDCqamRo0IKHCBy0cfzN/AXn5VseB4BU7yIzq2JB3MpeVIIw
 d0fFzcwLGiSEeVytIArPJZhau4GihbYqfdaJhQa7HAvqM7jUQxytYCWG4cl9IcEQ91GUer7Mg7U
 bvgRiAGkcKnaYtoiRYLws6OB2WwVH4IHJ4YfBjkT+GomesJkp/QBv4YLYFhYMSCtNJpsuv7a0J8
 k4T9phiSusw1XmqWDqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230035


On 20-11-2026 20:20, Heikki Krogerus wrote:
> On Tue, Nov 17, 2026 at 07:39:47PM +0530, Akash Kumar wrote:
>> Add the optional orientation-gpios property, used to sense the CC
>> orientation of each Type-C connector on boards where the CCGx chip
>> has no HPI register exposing CC polarity. Entries are ordered by
>> connector number; an entry may be left as <0> for connectors with no
>> sense line.
>>
>> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
> This one did not apply on top of Greg's latest usb-next. I tried also
> linux-next.
>
> Thanks,
>
> Hi Heikki,
>
> Sorry for the churn - this series isn't self-contained. It builds on
> top of an earlier series that adds cypd6129/cypd6229 support to the
> same binding and driver:
>
> https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/
>
> That series hasn't landed in usb-next yet, which is why this one
> doesn't apply cleanly against Greg's tree or linux-next - the
> orientation-gpios patch edits the cypd6129 example block that series
> adds. For reference, the trailers are:
>
> base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
> prerequisite-patch-id: 0ffa67d7d9ce66074ffa2e070249ee5b0cbedb2e
> prerequisite-patch-id: 65ba14bc52b50cdf47ecdce1f4b3fe678704955e
>
> Could you apply that series first (`b4 am` on the lore link, or
> `git am` the raw mboxes) and then this one on top? I'll call out the
> dependency explicitly in the cover letter when I send v2.
>
> Thanks,
> Akash
