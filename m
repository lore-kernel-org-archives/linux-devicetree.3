Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5633AC0C1
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988530; cv=none; b=HNs3BAdZA+355sQxz4pU0Oc1/AllTkFnZj/i/eD/XS2dy/p0ZMAWFjJE/7l+mlnPz/pH8Q9HhhYqOclOSzadrwTeZoKIjXbblFww1cBgpDorrei1uFm6dUJEfa9w2rVkj+P7lZEijG4KnO0O1WgQfeEdvuPdSpQzCBNccs15RlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988530; c=relaxed/simple;
	bh=j0GGMHg1diw/qhZYdIqWwYOIqLRfFgkBKW7hsoCV5Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpcYbtW7ETckfL3bb//MWgbw/DUlCqE28dwuPK2ZC9FLIfXPHDU4pjGk23PDJw/y2wxlPTzjLCuXIXFU9k1/ew3mV5inj5AqSsH9Sca6Az8wbYltsvzcBNf8ze0x6p+NR22OgYuyqzINsa0fBT+dvhHgdF4nFfgvjxzLJh94gY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbXVTwLD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OW+mUJQv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbXVTwLD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OW+mUJQv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nXI44139672
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DgYb6zsewBl7d28TB+1ifuWz2yIUGyplVmY8SkZ4A10=; b=QbXVTwLDi+dti1oB
	27At7urc7lkUQF1OYt/0BPgOjwR7wdpmaI9ax6viwpuNEM+thvFGUdgjfyqyWGK2
	Y6AWUkIUTHM1MS63VeqmZCWtxI5pv/FOgA+xpApwVceTvs1DDy+N0A3bcI6jB+tD
	7bb3ZkHZxDvnYAg+WheFn683Fvq+0dczq/s2Q0DYdEuVIlPVEKlj0goppnM2RDas
	3Grf9Xt6XaE0ixfGyq6n0mvbdYmL4GXgkefiUgJcTA8jCRhrQBOhE49jFgm++YB3
	sSO+c8ZX54u5Rnw22VHSAc0vnX6vBZgOCW/zq1qA2nrTG+I2jfxVEBJOx8RCXcua
	w/Myyw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr85gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:35:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0c6ea10e8so4075416d6.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782988524; x=1783593324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgYb6zsewBl7d28TB+1ifuWz2yIUGyplVmY8SkZ4A10=;
        b=OW+mUJQvF+Fhncc4PLez2yqF1NdhVW8Z/Fn20qChon/8OFAISX1mw/t51JAmuJ+RHL
         W1VQqfAxS+HLpWcQQYDJUc5lWIsIew7P7Nu7PrNxOQY0uKRvkMaCwxIye6ytU9dtTGWp
         /8yMsJKwJW4aHalfpxWxLRadKpduXLRCPGC6cESJAk3IMDIewfvl1xMh/+vXjoxXukit
         xivqBP9qJOHBmYJzDoW3/XXQj/iDqA1kG3//thiJruIWMIJqtoPvZ2HsId9lwloadfz8
         hWXTlvSwPg72LGc1k02Xr+uvszwyNWy6pBZNj/WqtbzIAWJXZzmFWhamC9p9IS/XQpej
         QKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988524; x=1783593324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgYb6zsewBl7d28TB+1ifuWz2yIUGyplVmY8SkZ4A10=;
        b=fpKJNkgLBmNa2GlharNQE5XPnq76Gd/vdbBunnFEmrqaopvlWCaxagnm2dZkfGyNky
         /Ys+ZAKLFCRAQfoBK6tVyS2j3UOGGzhh3EbrgJTEUqdwpZ5ki6PO8ExwYRS4Sf+t8jRi
         TNg6vF+jDrTbC12FjYxWAL4VMxUD3iHkNjk4khDHaG+sPyR8DcelzJZFmo/PuF8/e2P+
         TkUs+vg193mVwdZzUYDjvfGjLtx3iNxoj7IAdZP1d/l/mcinj4ETxI82O7+v1aSGn6PK
         6oQAVOP3mjFi98R9hXxOC0OasmDDccW7nonHPW5P7mVi92sEJM/W824y//iYgCHhtCRD
         RZfw==
X-Forwarded-Encrypted: i=1; AHgh+RoNjAFseKsrHdFlzVLiG4sM2Gi1Uhu8XalM+EhUhzCB4rR86gB9Tv/vMnSm3vJ7UvYR6y2IySkWx1XJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzcAnck9h5Ug6d/39dMJrzc7CvJ0gRJgkiP9AMUGjAflXi6R+l
	X9fcpOEH4Vc/k0tsvZHgg4EVbtb26q3yRuVCjkTFkuRDcZhxfg+SmYQS/2hIE72VYu40qOccaJt
	J5i+hKIhtONRExUcBVhCoxH8ubvOH3Mws3FPSMQS/lPzHDxK43MuCCFw5ZSginzvi
X-Gm-Gg: AfdE7cm9VXfYvDqcdsqAQlPJCGq+viUHVHl5CVsMdrRwg61nvAp28YY6AQqND44OGlC
	ExYuUHAYgp1hAXykrDyfE/NweJJvK2gP2VoXs8w9xoQwwhCOaDw8ji73hSYFL0KFaRa5plgY4jZ
	5fspCQ9A8pn3wrpB6Zksmgrg2/lgTF8XMC8/PKsOC5DAyQVBzbphI+bHm2P2SmKJd3I8gzVFJxK
	vSumLNFxcGZRfupIjhKHneqSsMAiD20GMj5mT/nd6V2mDON9ZWS/raLdwi+Gw6wE4BzjSAtfHQa
	1cwpWoPUo6LlNEL2RCxC1juH7Ytto/LacdrEeq86KNJWjaYmzBnvo8AtYjBrBqVqq7p4+tUXddj
	I3libtQxVnRxCcbMhSdQKFomiwdEx2yBqpgI=
X-Received: by 2002:ad4:5c4b:0:b0:8e8:a3c1:48c6 with SMTP id 6a1803df08f44-8f3c5b017d9mr54477806d6.2.1782988523959;
        Thu, 02 Jul 2026 03:35:23 -0700 (PDT)
X-Received: by 2002:ad4:5c4b:0:b0:8e8:a3c1:48c6 with SMTP id 6a1803df08f44-8f3c5b017d9mr54477526d6.2.1782988523574;
        Thu, 02 Jul 2026 03:35:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698acf2960dsm802383a12.9.2026.07.02.03.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:35:22 -0700 (PDT)
Message-ID: <9cc33cc1-b7f4-4fd7-9bf7-2ec58283cc4e@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:35:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
 <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
 <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RdOSnkGohfHGUQtF_-ZklmnP-gTjbkvA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwOSBTYWx0ZWRfX9ZpXIYge2kzW
 YYYh5/Nx+mlM0ZKlv79o7P6oS/vRSb1GUBuBNN3+EEBnaE9N5oIiGy8SkPbR6IJc+wFLu9HF+B1
 CT1OFnLcnYxoOZgQgvF1S6wAaLe0nDI=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a463eed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0LxEN28Ofi49yOki0boA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: RdOSnkGohfHGUQtF_-ZklmnP-gTjbkvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwOSBTYWx0ZWRfX6IE8NexqRJdZ
 GTabuuNIOidIeOdUpjHt3AFo0O1pSKNyUOGYjUX11Qb6q7Hwcor+6+h5U2/B3sY+B+FU6qvoEKc
 S0x58GpkX2IZmPWAvDAsuM9Jz/GXIBjj/o6xItWqDIIbcu0pj6NzJ6sf9Y1EmY4KSAkr7ZhQdVl
 VABvb7V0aY+IFYuPqGuCNRWCimazT3gNXhhkzQVmTqDath95Xd/7DkqLxGO2IqKMtf2TNv4d42k
 RxLLnF3a1Rt/10E0KQQbNSUOU/kLweYxZA9vR+LfmBW+3pFMMb3eQmok6n9E34BWYJs2Z24ENGd
 0dCVlH9SaaSddI6+aN9jOzPqwq0pdOQ/Ni9X6tXNmrwvtnskJ7eo+rbRi0+FpqVnqdXe5Cq2Znu
 rKwhI+Ii9TYP18oiZ+EN0lIV1w3h9c8Gkg9A5GhUL7EREUfztVnk9LE37CfnU76thKk2s6UDP7C
 v4Tbe2vy19kQ2oTUfRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020109

On 7/2/26 12:11 PM, Yepuri Siddu wrote:
> 
> 
> On 6/30/2026 5:03 PM, Konrad Dybcio wrote:
>> On 5/29/26 8:02 PM, Yepuri Siddu wrote:
>>> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
>>> industrial mezzanine board when populated with a QCC2072 Bluetooth
>>> module.
>>>
>>> The overlay configures UART4 (gpio16-19) for Bluetooth communication
>>> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
>>> lines to minimize power consumption when Bluetooth is inactive. Host
>>> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
>>> SW_CTRL is mapped to gpio86 for power sequencing.
>>>
>>> Disable UART7 in the base industrial mezzanine overlay as it is
>>> not used when the M.2 slot is populated.
>>>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> ---
>>
>> This seems to be a single, unthreaded message. Please switch to
>> using the b4 tool for submitting patches - https://b4.docs.kernel.org/
> 
> QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being upstreamed, we will reupdate our existing patches to align with M.2 power sequencing approach.
> This includes aligning the bindings, DT and also BT driver changes.

This is a tone-deaf reply to a question I didn't ask.

Konrad
