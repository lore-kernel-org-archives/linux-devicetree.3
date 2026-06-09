Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7625433F597
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 05:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983328; cv=none; b=RR4T6rGzK3KBDBdUwPzahyxBoguRIbzqSS9+SfKgjaYhsnRhFCcRPZ2kfZXDOUSNixKsfTBq1FB1gKLY0oBLUKeY0fR+W6j4MQQz6bjJ3uX4hftD208KcdTAOTqndySU6CMJ/SSX8lL80KGLaQhq0mMzR77Cg0vK0836o9UiVXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983328; c=relaxed/simple;
	bh=f8mZuRJM1Xj5UTCzYVtCxP6hZpPvwo/hvNTtsESfDEM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hoyt79uPibQabr0ch1hGeVnQK8tsl1uY5hieG2E7+F9zw5LgSVtXI/yIUz4ulhly0tpEaPVtwIWDB9AJW1V5kn69tzEaprJVjAuf7nn0Ly2OgfIRjyw9WKkOlxY3RUw3k24YsRb84uMCfHt62k5Gcn/3ntIg2o6xhzQyOs97IUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnwvTIbq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNYRjo3Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnwvTIbq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNYRjo3Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593we8A1061045
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 05:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8X/m6BpotSV0s2wlIu70ir+Zo0Bu84qxjgZXHCPBHk=; b=PnwvTIbqhaocR5C3
	gMnO3Z+xkNWMNDC9UUaapGPH6ugZiKrj1hcJQ90vC2gTdNFfBVbjJ6Bs7aPn4yKa
	Mfy9dy8FYwpFf9tzaNBBAEt/8DLU/CkCG/cX4Mbx1fzBSZswIMWxXaTGN3M7Y8yL
	zZuDUYt7YM/KGFYBZKTLxeWwxHamC/BymfpDI9UbXgh1hx3wHvLUiprEuCwrLk71
	Pvr2A4f+Zez3BvyGvs+WcjEAMpqIMQeZi5DJb4FWkM9kkblszGNcN5pQXRefJqMG
	rEVGuAkCIEOP+f0jwecG5ej78hTyCDUsU3cD3lsHTXtWcxNcFy8kxgTgmnqB4wQ5
	AfTqVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun44jxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:35:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0d0516ad7so53533165ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 22:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780983326; x=1781588126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8X/m6BpotSV0s2wlIu70ir+Zo0Bu84qxjgZXHCPBHk=;
        b=BNYRjo3YojkezcgwToT8YPcHzQLbiCIoSFIoWxFIzGjV0fHykR9dAszMSpdVeD0dYv
         65TnPXER5vD6zWUNX6UkHvHz4aQoj7AADlRd70Lvi6/TP012YLvGp8z/6eqeVc+HD3vO
         FJOYbk4zzSgtV77igaE9j5ytkZ6BE1WMMnYW3ydIMi6U6g+feQSRbmRJYIT99GpJ4L8/
         vJd+IDudUfIXpqJkfNefiU/DYCABHnPaGtwGH0OuOp8iNkloeLAf2eTptwMuAoWwuEDW
         JD/QtoLeievNrJgoyKZ+Tz3QuQWFpFFIC0sp3mFOQRins3Zc5IFDp5aoufn6SO1oX7ji
         WUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983326; x=1781588126;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8X/m6BpotSV0s2wlIu70ir+Zo0Bu84qxjgZXHCPBHk=;
        b=R+mKnWSpVcEBCwFt6YiIZ894LIqCXfpLEgY4s8mL04SH6L/D1ImfsxCs6V6pjz9pTf
         /o43Sp4iX8rpBKE9C3k0oxixk/GkNUNT/gyUWQPqMbjyaz6UpvilsSShXQNXuplzhmwz
         f+wwDnf/3csRSfa6Du0zizB77VbV8sehWXMbUufzlaWgLyjHhrtWWGjmc3SUTj6ily6I
         oof2jiofoTxDR9EtS2uXY3EANwpJux076YRbqJU3vmQMu8NWE6gLyBYYvvXde/bS5SSH
         bwsELC0EHGRcm9pe4/aHXKR3jn9aYFBMCx0RA9YoLD6KaNAc5OGJRERNLOTxpbF8euOp
         4ENw==
X-Forwarded-Encrypted: i=1; AFNElJ/iBzudaU4+uYPGEiwYJaQmn5bEAAgWcTQlNELPMOxLTGAtRDlr4d9AQRMGA3lIE4h0uZoNt0cgKT9h@vger.kernel.org
X-Gm-Message-State: AOJu0YzQeeoquO3hqRTDRCY2gg2XWvRlc18J6czZUaJOnVPGzdTAUQoI
	d1sMxzZv9J+mRTer9KlB/aR/a3jH3qbjZ+XJ65KPXaZWdOcWfpkIFQPYZqi6Xyh2jMT49Pwi2kX
	T8nvvNPqV1R3BZTIkUm15meYQJv10jepcRXCjDneJEy/IeQVYfkd0vCwvcoYGdIDy
X-Gm-Gg: Acq92OFZkmQqOR4FbK8Ur+Yrmj6+WTryAkuGeK+5XJang3CrGNYdk3ItS1PeZS6WIOY
	bqTXUxd65hLkETTgSkbYShtiPVENSuQl8/iGDX81O+wRU+a2BlaeIlfqoecwZ0OzYH0AvE8GvAo
	s4Hy+tc2DY01ypmGBtD2NWMdOrxqAZjPAZGRXc7g4VdX/eWN7T+bm8UjVX75Ut6h8h2dSluG4gm
	GJoD6uva/3xo7V4X9GZwiB5j9dSNyhI6zjXpLV2N0xnkLigyo0ggd6GztPZUBF4N1Pp7h/cu+EH
	XzmQ9Sp/aTUhMReXX6x/wB0VPZeE3atQQA3yFdxeDtU6Js5ANUvjKJJc/S/G9qaji9WDv+Boz87
	Ru57jyRy+Y1MhgziTWLpCYfrBQaGmtxa8RICfzJco+jKNoRsEi1h0tsC/4gq8VMFURDVSWKW8Pc
	g3
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr219153705ad.25.1780983326027;
        Mon, 08 Jun 2026 22:35:26 -0700 (PDT)
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr219153385ad.25.1780983325599;
        Mon, 08 Jun 2026 22:35:25 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f94a7fsm202031215ad.28.2026.06.08.22.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:35:25 -0700 (PDT)
Message-ID: <dfe6eb1c-4205-407a-9193-a27cb2e3b72d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:05:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
 <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
 <c59579b0-8c88-444d-947b-615a623f42ce@oss.qualcomm.com>
 <26374aa0-1db0-4d90-9cec-b546df598155@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <26374aa0-1db0-4d90-9cec-b546df598155@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0OCBTYWx0ZWRfX/TK7uh4wfqrq
 gRkXAVENtQcAYevaYbS2lhXrdzCCHvq1T6IPV+yTTu4z3q3b5u7s8S+cu+i9wF2EBaTLtnsXKnH
 iYcpcuSlU1dGb7jIpKZGXv2YykJXvT/YEBjNBf4RrOxfsWrpdI1bV9kR3/ZGxcMmq77sA+8mK+w
 cT36LhdwCWA6wlgr6owecPIbHMxqLe90LwDuiZTT3fHzj3pXE7N8yOcj4pfzDv2+fdqaX+GPDE5
 yiGaWMybHU1JjEJJMgz0I2NUQFMWhcEq/M4eUlWU7LodUuwXbfQSBXm5EacjRv5RrnFene/A+F6
 ft7QQaSAlyYwMNDGykEQMAWKlN0LXTR6X8xLX6/jLnh8sekphVSrL3VWzdV50ycXbFX7+mF3hSb
 tV8myUtKfQVZQV5N/ZX8vrgV8arv7YdsYTCS5tALYuOuEI4ByN6Rf9lguLXY9PfoQ8dt4JgHSDH
 R/JU+hKuNy9Z6M8+mtg==
X-Proofpoint-ORIG-GUID: tjSjcPNwXWb1MvNQIe16wXKWChjHYRaO
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a27a61e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=o1Qc89-7ai6OhWUoDCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tjSjcPNwXWb1MvNQIe16wXKWChjHYRaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090048


On 6/9/2026 10:55 AM, Kathiravan Thirumoorthy wrote:
>
> On 6/8/2026 3:52 PM, Konrad Dybcio wrote:
>> On 6/2/26 6:34 PM, Kathiravan Thirumoorthy wrote:
>>> Follow the new binding style by defining PHYs and PERST# (now RESET#)
>>> under the Root Port node. Avoid mixing styles and move these properties
>>> to the RP node.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>>   -            pcie@0 {
>>> +            pcie1_port0: pcie@0 {
>>>                   device_type = "pci";
>>>                   reg = <0x0 0x0 0x0 0x0 0x0>;
>>>                     #address-cells = <3>;
>>>                   #size-cells = <2>;
>>>                   ranges;
>>> +                phys = <&pcie1_phy>;
>> nit: other socs (like hamoa) do it like this:
>>
>> pcie3_port0: pcie@0 {
>>     device_type = "pci";
>>     compatible = "pciclass,0604";
>>     reg = <0x0 0x0 0x0 0x0 0x0>;
>>     bus-range = <0x01 0xff>;
>>
>>     phys = <&pcie3_phy>;
>>
>>     #address-cells = <3>;
>>     #size-cells = <2>;
>>     ranges;
>> };
>
> Ack. Let me add the 'bus-range' property and move the 'phys' next to it.

Just checked the history, it is dropped due to default values. Given 
that, let me move the 'phys' before #address-cells property.

>
>> Konrad
