Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566542;
	b=ZAY42xgUvfC4i9pomoc9wFGpwBm78qklKkcUp0gHGRCYUlCyRKyf7mkTWmlUE3e/kMZ/
	 Z7raWYAFlj/smtCbUzSqgrAeCzTZZqruegYkU6CFxf32Rr2D2VLLLcQKyTBMzBKdKbPIR
	 t2sM9H5i8AQ8P6CjWMTlcsYwE32NwNIUxx5jKuMfKrWHP4L2GSdIhI+QvMbau+Hob6zsx
	 vN0KD+TjV2EK7oZt/9dy9bDTato7fjeRH3s3+rZFObe8xtEAxrTFkkGtuL9wWt5reF+5A
	 Gktu1a7RChfGp0+yiCdKWei20TViFy1ZZ1TIc1UTuFVcWiJTU4s3U9t8IOWYbxBrdrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
	b=v0gRvhrvKp6C0ALVl1orcajVzI87Sc3MW+HsBKjhB21tNA9Zcoz1UZe8zPEg7CsAnNlm
	 dIy92Uvrn2EcLARcTr21UTq9NrOMlSn+tDL4CAGNI5vx0H26K3nOjGdnbhTkBPRI0f1fU
	 K+VSi4t2/NkP2B1Wr8st+qh0KFc4umZULhMdqS9vG4b0vCNIe2Q8jvQUuAI67sIIuJr9k
	 ePhj3w1EqTB/nD/Zz2w+PL8g9RyeHN2uJE/W6osgH84SxV8ejYb6KD2T+vFbacZOWbunc
	 1OezklUN+xHumhV8IDDS2mdNYL/It88YHA2cYCa/9fx7S2gJwQ60lWgWhKhzyP9nqFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lyx/avOW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CneAYCpr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C70606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C70606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lyx/avOW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CneAYCpr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UvfU3164519
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=; b=Lyx/avOWN/Gzjezo
	1q2AESFfytV5VIPa/TFcWve/Mxfl/V+aCOt9f8aw3eNMHwK0VaiLSqaOxgmdBKTx
	AVDWT3kGjbqmV/Js6jh38h8s0VKLEBlnvSQTetiltKShQnuuzdn3tTmZ0Q10qy7c
	4a8RhL0pqt1jbknUii0S+rcLSTFW+SYa4urN+MPCDD02uqWnkP58g4QfcRz8G0cu
	5UzleEEAuvGCadrAoXU1Ya5Q8vbv+yFJNwfEUNKHvgwpIJwK7cNP2SNSju+wL3Ha
	i1waVTAMPVu8sSjEe2InKqDe1VC00uYQvQTfA26sKweQFrPZHUexdAcb2LEDsx7b
	K4DDAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2msb56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:42:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso3687070eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566541; x=1795171341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
        b=CneAYCpr0wMIDCWkKRKF2h68KOh3+YP2yTmojV37gyu+EBAjGdLKaO2LAsYhraspMd
         e9rdZR0ALKH/1XI3jlGW+7b5xFxhmhFmRcLpU2nqk2b6nHSJMxanqn6eEyzWuOns5F7G
         i+BWOLykmS4cke2Ek9nJ8LKizDIt2CsU59BjtZw63WrP7l9hDI7uPD96yaLP00hFlDH5
         DRAffQXIRqtJt2ps6Yfb9zO2DyCI4UsgEm5BHl9MWknjoCVheMDxIq12eZ6TdZS+EPZH
         eypgHFmxVxmOzMmFLUZ4CsjwRXK5FHKUrS7q1PaaonGMih+VN9fDBMW3YStu0bMbdnEQ
         5dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566541; x=1795171341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
        b=RHoUJGxYgnAho2l9HFMLWfs0D4ql+ykuNeosirRU8EnQALGbBh+v44sDO73YHfC+Vn
         6En35AGnHglTn0XB7Jhz+G1jy5i30NDvitFQg+wB0bGXigyEL8ikr0Xjeq1RmDSDPx2J
         DcyhVOk3bd5Xb/76m3dLB7ORqeEKMlEaIXWQBSLs7bsrHGLFWExBJb+Xzfr10gmqXKq9
         H24SWf4UfDLjzETG+ZSGSpDuZNRYxTCJC4f5r9gV26reEpn8OoBXczCErAI7sOKLlQ7D
         Jh1Fa7xA3Pe+k5we0fSRg9K/C3OziHqKINd+lhC++fkAoBinpypsXiin0Dn1x1R+C1oH
         vXig==
X-Forwarded-Encrypted: i=1; AL+hErEpnBeSrYmWrchiUpuRqc3DfafDzeggadn/yAv45Qk181rPly7+21cqJc9uX+juUo8MxlxaJsqrMco9@vger.kernel.org
X-Gm-Message-State: APuU4Z9OzfcOH+x9CIBDYsRjeCJT+ZypHd3N/KKIrRK4ieTaDtc/r4hY
	NAeCe54iMOs6peWmBkVuPIOeAoLueb/91ynFw1Iq6LQebdsFx005Kw+d/Z1Qm0mVsUwNkFBGl7a
	C6nmd7t5NxoGmIZ1zVaHbfyVWOEFaDFIBbn+yBTDHFtFfQq+g28x1fO8SjNh71COsB+zftzWD
X-Gm-Gg: AYBFou0G/7vdNF9vpoSNJ1Dlq4oHO4sc0lQMl/9n+8KYsR/QwjRZLi+s1H3hvBw3Zwr
	qjkiP0TyWCi2mvwm/pHy2KuSKPspQ8PvNGpOTo5n59Xfc2zJ6iXyloST2PP3JLN1OnBBaTDJNUO
	6Gn37DSUOXq2WhDTFWBQzCj/k9eNjeYBEQB25d9D5FbYjpOii14pZerG1diNT9VdZgDSr28DJWQ
	CsAWI130vpcdEtVYqf21kvTU1hsuyQx4bXWLOZrreUOKRdBXZtZkoh+x0pNCIbIH22mWH/lED9u
	08L5umi/5f2GrfH8ioRUkgl9icl3yHZTQ8NyHIMXoDiigkdff69hR3Hays9EDBWJHJz+s6Ob97X
	Tfm2MYp+ruX7FBJjo35SkPVRNEsT9vg6us5Rb4Rl3cwUwuiHU0dE4mMj7QsuN4c69s1xKpLKyWH
	VCUQ==
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr2219902eec.34.1794566540483;
        Fri, 13 Nov 2026 02:42:20 -0800 (PST)
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr2219869eec.34.1794566540007;
        Fri, 13 Nov 2026 02:42:20 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm6363256eec.6.2026.11.13.02.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:42:19 -0800 (PST)
Message-ID: <ff2e0234-3e9a-4ac0-9fe2-277735c8b1c2@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:12:07 +0530
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
Subject: Re: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
 <20261109-qualified-pristine-newt-ba1c0c@quoll>
 <f2b119c7-ba01-46fd-96c4-10b918f98d53@oss.qualcomm.com>
 <2cd4da54-1dd2-424d-a9ba-e3e4fdad502e@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <2cd4da54-1dd2-424d-a9ba-e3e4fdad502e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sZpOnvkL4QcPOZrxPxuBDZM0ktKGvhbI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX3TlcYy7WZry6
 gP3GK6YcBXy8kSdTCFLlQyVTnwi7ZEDWmg0ddbcgPZ58LiGBOnHXUgpROK9lEtpFNmaSrf+tIHC
 yDKPguSa842doEVjy5zJxPlvFXFgzNhaySbcqGotcpuG4+dPwfOjVlK8jULENeVqzkMD69JjWuF
 zt2d8IRJ+2ik7c61hHPmSMwoeRfJZojXEsypV8IeQWFXMTG3phjS4t28QAwcZ7DQuw9Qb6b+fEZ
 pOlOACYL+G+65C8vaUcqY98pCN5lyrrKOBTmQ7D09Z8/z/fkM4pCjK23yScQahC+oFbEzNyy/yL
 Jq80JNEHO+jqr2673lJ2F8rruHnCM1lz2QgWlwMRV8b6vFiRKIDQkGSRn5LuwxHpwtzoAngHc9N
 dALQh4jlqhRjm99QP0aD9B8JReAZILty9h3/EcP7T8irmGiM4apLhCaQhi6xDty4cFyyJJIBQhN
 mtdMoZjZke3Eealwb1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX3hSymWyWA7vy
 sigscNqpuBQ5v/LvCF4hGWokl1x6OzXqFvMadnaVSjf1CLHC1xxCv8SbCBcAfqFONQ5msigzEQI
 O4gxHyTnN0ypvOIsiPHdHlRHC0Jmvgo=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6e98d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=A8zP-s-B-IGqv6UKJQEA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: sZpOnvkL4QcPOZrxPxuBDZM0ktKGvhbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130042



On 13-11-2026 12:33 pm, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:31, Imran Shaik wrote:
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        reg-names:
>>>> +          contains:
>>>> +            const: etu
>>>
>>> Reason for same devices with different address space details should be
>>> provided somewhere, preferrably in description. Assuming in the first
>>> place, that this stays because how two devices can be basically
>>> identical (same compatible) if they have different programming
>>> interface?
>>>
>>
>> TSCSS is a single hardware device, split into two sub-blocks - TSC and
>> ETU, each with its own register address. Every SoC with this compatible
>> has both blocks in hardware.
> 
> This is not what the binding said.
> 
>>
>> What changes is whether the vendor/board actually wires up the ETU's
>> external event. The ETU block captures a timestamp from the TSC block
>> when an external event fires one of the ETU slices, which are driven
>> through board-level GPIO/IRQs. If a board doesn't wire any slice,
>> there's nothing in the ETU region for Linux to use.
> 
> This is not what the binding said. The binding said there are different
> types of devices, one with etu and one without. Look, easy to spot:
> 
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> 

Sure, I will drop this reg handling, and add all the register spaces
support by default in next series.

Thanks,
Imran
