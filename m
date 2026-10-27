Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089448;
	b=lnTCf9JwwKr3yitsnKkIM0ZSlCXPCv0IErPbk1kSvEKSI6aUSvBJgxPGDyu93v9uXp2S
	 zrLwXVZBrXAHO/I64OMNvjk2cDDUtpHdnz6GDe2OHkVXdBekCvkBbuebgSRyTot+brfoK
	 5tD++SPgfqwqCoQSlmnJ0UjIeYtAdpHCqOzw+pKHThbLj1YpltRPzvVP14cPZZWW9QXEz
	 tDLpp8BkU+/xqfnmsqO27HSST/ygTo6kwnG1Ue1smbqsL6WPZBsNrUbS+U2cpustpzMhC
	 FCiqmtb2c3JhDptPVW/iFdodPO6jSqEFCFgOWMgnFx36+K25LjF7fLfTEXfRLyzkgtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
	b=YcDVQLlAimhB3Ja7Ht/2TAL4mlgSdkilH2DIYldRcEAyJsYvWfC0m4XHNKyh5S7/hsJl
	 mq7OxgKiMhid8KsJHpqurxmi2W0AEIom1iU65qqzhp5k/9K0r8Ml69K2qpM2zOGNrl5Jq
	 H8PeOO2361BUd+L6ncOIf3AV8SwxDwa9TmlV36cQpBpQwLznPwhf144OOq6xt35MflCig
	 Oxo6RuYgyWt07r1TkT1UOoV8iUvwJXwlaEQqKxxGw/zs95PvLJxOfb1ev+aS8YiCPrz+m
	 QQzgld/4KqLMQFX3AuXQkX50sf8VCR6WXR9W6yFHx/OobR1yvIKq45OPMKdefDMB0pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC4606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10FC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZADi1259194
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=; b=LFvJrAdXip0Ihrgh
	fPip5hp4MFBszTRstrAe0XcUxB33FbPuJKl830JUr4gYDS3EuCaSGe0EFIIDKy1T
	iAikAphw2+NSaW/ObbSvfb9KWD/bM17oU07HGMht1zmNpq1IKcywC+sXJvPveqqY
	P7sBbWJWSyaxSpu9RfkMSN/UevrlQWraYNpEOk0BeHR27BpgNoqhOOtjeKikeWQs
	So2ihwDj48SGLjIGx/UB5dkuASKgzEH7pZQCYcjQ8llBVI8F9nPIb7k5a26qup/u
	XchTRAp7SQSsbyqUUbZtsAm9vj2JP9P2TcHBUqQuOY/WRGtXDDbK1vv8AhGVD9W8
	rAxcUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavsv3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:24:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac76132001so3104618a91.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089446; x=1793694246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
        b=K9LabksJ8UWR5G65BHGxNz42MrvYkB7mZuUINkGxiaNhA8ZIM4RUNS+SH6R2U8fiXS
         trg9cgKiyTSQbFPYzl/Z9JyMGtivq63pAXTDW6SfsNBjYb+15UzW5FknH7P8NEeRulqY
         YNp70IFVLVYD8F0kxUFZJKeRmxpM9Wjalaq/OMm31tqYvskLBz0REi9a97MPc1q1chSt
         8E6gQZ7CBxyPCfJQ9vKA3CBImdU32Rt1nILyLyg3V5OPgwC+rAKJNfwkpRt3kxAQwOT7
         gRjP5xM2myyhKRpo+zs2bTFaGyzeQNxEonJAi0EAFMAJgl6ShJSxnbgl50mGmbXHoho8
         alVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089446; x=1793694246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
        b=0DoD1XeABpB8TTmt93BrnaKFrDVtDL/Q7gkU83LjZhO5mr5lr6oN7qbPBx6R49MuzV
         AVQVSeBm5PIYsuh9P7XibUzKYJylncd4apxzxVsd0zsGtdAcEXdoWrhZRXHZO1/RE8v0
         nStGPfloQdNsTS+VYc3fm+EL24Z9oZjTEgwih0zfDHskm8JOjpaBP8o7iedAlTK+hYto
         4pnbmMgXGN2O7PG/H19FV46xjh6hckk+Cq7l9SW5dOCT7VXZB+wXwZFEDRNxuOFCWoF3
         vZu9MxsN2NS/I80XHRNu+KSje/ukL1e+wybuCUUPdU71yXMSGTmFAR63CPz4i8K3P3jk
         0Hxw==
X-Forwarded-Encrypted: i=1; AKwUvBxboWiQ5ZyZp4qXOvTBOc9ekbuik0ozGPEtcH/jCHWQp4a7RJ/yL7azIvqlCKbBVaPbhsNFpO7o72JX@vger.kernel.org
X-Gm-Message-State: AFq9FYJvoHQmfE34XT18WM+Q5MmcYeC4OWuYIxZgrAG5cjyCuo91+zfz
	ZiKl4tk8WvJT/RhQHW1LDYM2RkmCV4or3ZgdrPze7EbmNu9v0ecgLbzRg+zZKEmgrrF4nieM5R3
	eq+1LE+a6cCEDYEpketK1HN8DWOJqd8NSHHcLQX2AbmUJwA5VOWOUhvEkSkOrBO0z
X-Gm-Gg: AYBFou228SqWlN6/Vp6E2CiqX/G3vF3wt3mZ1vz1BH1xTgNjWrrTIoTfYTJ0TNnfgI/
	hZCTRnoAQWRpQT3E6Fdp3JJl5WAucCV0pDgs4A828PcinqJ0rXqXZ6NeiqpS+qcX4rh9A1CFxnU
	6Nq0G5FBe174kFYG8Ezo7Nux8GHLVwSGYvP3rdy1iH2A5Kdny4jp+EGWV3+kwdyvvnpkSG6AxN7
	6ITtR33jyQWoWMWYUB+rvhlL6ylYibpfMFy8Ta45dGXd//BFAhGMAPHZwcOojtjfkbtYfs0smyZ
	W7UbTsnbRyrMr3LNtUpckLo4YBmEFgNYV7ukVdJKxHv/bJL3yp1rVxeYSkfA80+eRA0DB0M/5x5
	DJeUI2U2YRY2BOXddZaBrkLytUpKET5x8ZSs=
X-Received: by 2002:a17:90b:528a:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3adeae6db13mr6803705a91.16.1793089445987;
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3adeae6db13mr6803684a91.16.1793089445527;
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
Received: from [10.217.241.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebae7f3csm8147056a91.3.2026.10.27.01.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
Message-ID: <254c26ce-ef3a-4296-9981-34863db9fa73@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:53:59 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
 <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J7qGCsjV_Za6vuTz34E_pzdzqEPy5AI0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX5nufC7UcxNc5
 qxgnDTx9X3t8uaZclNoS7l4WIg7yGUrtQjXGVyNQopPdGbU05wuZixGUSU/STsQsRlMfviMKX0p
 fmecpU/q/o5HkYGxq3uTooDaaJpYNqY=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae05fa6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=3SUrRiYI98BmUlIlBn4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: J7qGCsjV_Za6vuTz34E_pzdzqEPy5AI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX+ScBk4bceqqM
 BpgNdCeM8ixRyKq0IQzTBdUGDUzvZBJ4Q88guWTS/stlYf4TtQ8oCAq7x1oF5L6YFbZ7PlWBgUK
 qPXXjzsHf72aV3BIeRoqNpDtaVM4JDPoaHUi3rwW0AqCSygWIefgOjN5a9xIQ+4mn0TGAwiuXqW
 FFtsnzIQPRXY9tCa8FPgjXj+G78jPCHvO6uS5itrLXG5mznFyDOlMWh22RtOiuOFANvkyVLgqrs
 VEQCo6omV2zWf9wMh/wC6w+U055SZLRMlp7xD3vBnaT+UOkF5Ug1MMoXKU0suZyFZgQMtLIAEYv
 HFchxQ5dtJu9t4FhBw0eZZfMmXwtU9Pl4OyRqP2MCDzxXb4W7hWzN+mg3gwpMNrJksKjDbv/uHj
 EXWXzFd7SafqgD3nd87AFCWpTMWTEqttxQKZdUpluysqHcghoCzLda2ULGbyoWzEvh90Q217zuJ
 fX/MQHbvSB9e0kyetGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033



On 10/19/2026 6:01 PM, Konrad Dybcio wrote:
> On 10/19/26 12:27 PM, Gopikishan Thawre wrote:
>> Add the device tree for the LeMans Draco EVK platform which combines
>> the LeMans Draco EVK SoM and Draco carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
>>
> 
> [...]
> 
>> +	ethernet0_default: ethernet0-default-state {
>> +		ethernet0_mdc: ethernet0-mdc-pins {
> 
> Please drop unused labels
> 

Thanks for the review. The unused labels ethernet0_mdc, ethernet0_mdio, 
ethernet1_mdc and ethernet1_mdio will be dropped in v2.

Best regards,
Gopikishan
