Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4955317173
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776145321; cv=none; b=uwXCCHQ9zMkv3/lphgqYSsGpFP92YRok+1AmagRu2dgdubbiedlL1jCkcOL9mjaFbeAvr5cxORvjbsllZgl7g0ObQhKShfqPYHkFXIN7zrRhzQ/slaMJgw12CPfp+hExwgcPKKpbHNTZ72cMyY7t9yh6TVVGKKab9Gf2xNC2qhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776145321; c=relaxed/simple;
	bh=LtdnZ8FR0aviWXKs9GJN1OQYxTDYfEOtXeZLhXjDzxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kx5x8C/ZZ/MEJ2xg8hRWSQF+Io7Rr12QYvkiOF7t0yvTji4tnohXBCw9x95YgH2iHLeF0F1W3/ILZB6SxIkoDGCeCaW0y2WfNOazxMmu3Q7P7fUA2KIDSoLehN6dcjNcTalf1zM6JfshoLpQ2Y33n+HALMlKuotVsgO+451Zrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCKYoKIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Am7feVcZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCKYoKIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Am7feVcZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLD75g395277
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFFW49Vrq2GL+YPrqogUlIu/Va72xCQWUBmREywYvBs=; b=bCKYoKIe1ArQqOZa
	4RWDrxP7aQl7CvzwV+gHKVKXpBgJZOsVvrV0RjuH33YiI9sgaWI7GuPK3rXZ1YlR
	/Z6Y1/1Hvbb9gSgdMrdfKa9KUagiW+K6IcZdhmzEd/myo1xDpHMWo2fo0HBZ84Wo
	YvDfp5t4o4jIXZPEYJp/aRLJKcMb5IM2M7OGskyNH0YHxnrKri+UVLt0U4ZsF11t
	Yd6vzn/5D1gtBG6hRblw6VsvMOKX2YUNMICegoRVUuiVuOia9GsW9VBiquwvlymm
	FLKqjOPdHnWGiZ1lC/j5/1YRkrnVCQol6lI6qsOLNrDKadhqvUdgdqYLKFh8dyNA
	FnB1qA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870s73h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:41:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fb6cd0879so1751759a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 22:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776145315; x=1776750115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFFW49Vrq2GL+YPrqogUlIu/Va72xCQWUBmREywYvBs=;
        b=Am7feVcZ7dC2PB5Cy+fiOzft5zVHii84//tpUpLrqa6hqLR+wxDo8g0AzEhWeQmTTu
         h7GFdsLxceLD6MRGlhq5R7SsJ+u933hfgYD7C8NkDwuXtZb4IOg+BKJui8Z9WDjHb1or
         opX3PnE7IhFpgGfzWNwbb1MNT0LTzPfyTgw6fuTN8qwFmjTq64HkA6vAYK+dTBehjNAk
         U3Le3BnqIro+piSfJD/U5kX4RrpVLtQ/UaJq2EuLGxll+yUzekrl8lR+rd572r9WvC4e
         tPSxNt1XfiFfLDeUpBAqUXIvP4xERPvDPseuUOZJO+wQcyaZ5OOvjMAHFxcwQk0lXOEK
         fnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776145315; x=1776750115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFFW49Vrq2GL+YPrqogUlIu/Va72xCQWUBmREywYvBs=;
        b=VgUgo/6lgvDL2VqzpWR4Di89YgRPbQjpad/RmfUMkrgvx9UiGseiKH2ullkwsDAe0w
         ugvzJWb0zvMZA9cUVKdxU109xpeEC2dLDWusZ7WWsFGwgTfR0oXuefymae9YhlynZmwV
         OYvNc9WROATSGJPNP7q3opoKBYfFuj3sDVxpaFal9OJGSZAeGYJBGR/MFnfgSGMXttGC
         o3eZSrx4narbdtMecZAB+rNN4KNk4xpsWe8pYK04OWT6TnV8vpe+nnUgcQoU3w+aR8iR
         Wj7drpjrVOpbwTsKg47UvtBt68Ye1KD0eIQKxs793NSS1Nzh1IOOhTwbcd1XSH4YoIx9
         RUvA==
X-Forwarded-Encrypted: i=1; AFNElJ84hliJYM8ljqWQtNetGM9OU0tOjH68WHSDZyOw410S4YKLaN2g8lorqjj6U69JAmsB0+jHMkYcyU1m@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpOkA4Cht4QK9tmp+d3y1Qg9Le1dcFYASILMH7344ti9jtbH9
	3AHsIq3LOtMsgn2vHNYnk6niUBYOZL26TN/ReRNwCu4felWi+4oPfFxPC4Q4V8nIdBBdBSjQ6eB
	XxPfii60T8Q9mwWCMcmo+dvvlxOIL6fKVacF/ElQ3c4vGNHTXmORTeSPMtvMWuYQR
X-Gm-Gg: AeBDievo96PwzSsv6Os8QO1FvzSn6UI7xcm7BQ+5oMpxcp+gO8q9NW4Hzhx8KKlogeM
	q5foktUfXRDm2a8evloDKaOVykrjefIEZRxsgu9uE0Yw6eWp1EAWMKRfTTIcxi9ZOv3OMSwU1g6
	srxFNsyx2mHIy4zyxGC3Ndto+xacId9z31fJg7Nh0z17rQ1IgH0nWm5TZ85dPauz7PrtOe58ja2
	RmvIKZPkaNoIMv8Xa2waPMToPnBJzn8SDs56EK/NZZSvqjHnQa5rDyB5px8vsxoNxXRMxd+dfzU
	VboS+D0SAydR8AdPSrA/06YVhcz8tOv+chfERfnvWdkOS/oy678V+wqTUCVpZtejIClg837uDy1
	mH8Yo2cjjH9F1fgvnUiV51nI1D1dT4ElWFiWYk8O3Y18CyKbx
X-Received: by 2002:a17:90b:5283:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35e428452e1mr15762152a91.22.1776145315240;
        Mon, 13 Apr 2026 22:41:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5283:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35e428452e1mr15762114a91.22.1776145314740;
        Mon, 13 Apr 2026 22:41:54 -0700 (PDT)
Received: from [10.218.34.14] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41bca6e9sm6367684a91.0.2026.04.13.22.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:41:54 -0700 (PDT)
Message-ID: <ce8ca265-24df-41e5-a763-f9475de2fa9b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:11:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans: Enable DISPLAY-PORT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413043713.1659-1-kumar.singh@oss.qualcomm.com>
 <579913ed-4fc9-4eee-9093-13b1f701e018@oss.qualcomm.com>
Content-Language: en-US
From: Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
In-Reply-To: <579913ed-4fc9-4eee-9093-13b1f701e018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sUcmbS-wNOHJ4_D9R_EDIvqiedyG6geQ
X-Proofpoint-GUID: sUcmbS-wNOHJ4_D9R_EDIvqiedyG6geQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1MSBTYWx0ZWRfX/OIckCT4/Beb
 BLYRQiKqhj0lyBR+e6l1Zr1RW8eCsnTjYgwjRd5lJxYqLPkVLOy5IdVUXx6QvA5M27to8FshYWA
 2Tg881vTkFSM6OT3wfyki6D86maLVoYwuimSNfMUzOdqdLt96AIcrUNjEilkMyLgm9lRibxrKsf
 jAdxUvsUmPp3uYzcpw2B457tjQGdPewYUb+vqTgMNB1gr2x+iAZrTWqym9RR/KcrumZwNTNSBFF
 YRRqCd3saf9Dl0yGH01S29YwmoWImxCaJHh1vBLLjoTXcL7uWKgA+4eebauq5s8v3G9HIGeNISc
 6NLk0zu8mBHDfFXKCZ74LgLt2Mr/04cuxNOBMhzSTdwhyZL7d6c473r+Ewozhc+5AvY6Trhsf4e
 s6Avb0mSoqoPr0kuDjG+VaYG3E7/JiFPFdcScFV/IWe7d6UaPLnmyT4Gkv9smTPvC6lgBEuQ72f
 066H7tGU7R0SK3VeG2A==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69ddd3a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=781UgJWHOTtPPHFJrDQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140051

On 4/13/2026 2:14 PM, Konrad Dybcio wrote:
> On 4/13/26 6:37 AM, Kumar Anurag wrote:
>> Add dailinks for DISPLAY-PORT to enable audio functionality
>> on edp0.
> "DisplayPort"
> 
> The commit title is misleading.
> 
We will change the commit title :
From: arm64: dts: qcom: lemans: Enable DISPLAY-PORT
to : arm64: dts: qcom: lemans: Enable audio playback over DisplayPort
> [...]
> 
>> +		dp0-dai-link {
>> +			link-name = "DisplayPort0 Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&mdss0_dp0>;
>> +			};
> 'co'dec < 'cp'u, please re-sort
> 
> Konrad

In the other Dai links the cpu is before codec and hence we maintain the 
same order in dp0 dai link too.

Same pattern is observed in DTS of all qcom platforms.

Thanks & Regards
Anurag
