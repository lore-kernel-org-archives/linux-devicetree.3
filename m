Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369990;
	b=NoVZGwIh09btlZh01rMro8IzSwjlNoIVxTq5k0QOsPhyQuyvfvMGdQJnaIR+IyzMk+NB
	 arlWu2zZQ37MI+d/vwA70foStobL3jHx94gv3Wd44zyHVlgnr3dswAWBpE9J6Kg6X5+6b
	 AvIB0eAMP3CinUQ2eiXr6uKkLTNqVVMt5AugluLKQbuKzRev6qV0c+R5gyoBRyP3vr/Kg
	 XmHRoIyFyZy5Tv1lEP86DR/ulLfFCFufMBdW6V5Ch14CUbdwswE0D40vpZUbDrvO2YU6a
	 wTDYZypPCB/Oj+aA1mN7/cQFMRw7RKOk20PK2+LJzy57c4ygvv7MzCrTWW8sAsi9Gvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
	b=goin1T3upMslSS2I3yVP6NYzl6eUYwM1gt4i4FJu5VnVqrzDGy1hvW2Aqw1FDu8hf35e
	 L+DlQWhiZKqZuaapbcrMVxwAPq+Zbwy3lxtJ3e3VlumTFHFCYoFyO9L//+GDH0zIy0LdW
	 GWIQ+g9nH/Gv+vrwR17iiR1ilnRn9nVL/fHGL4qOe59bLDRHSCuDX2eGckFNdoIYBpwXa
	 +LT1ao2m73SMpD6yi0pDCCxZ4aW7MyRinzuH9DHYXPx1rbC0o7iagtuGT25g6jGWqjnLw
	 wLJPADDzbOMaaMlXFZ5RrXotGyqVLDWuo9767ulcZQBmqA8yqFkT1cVr/8KkMAroivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHRtWC8a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08650606A330
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08650606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHRtWC8a
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tYdq923290
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=; b=mcL7E54ozQDbMzmA
	mNpGJabuuRSkm1Vm6Iutj5fzqHDToSWvXi1Z3N3PWkoqcXxx5lUE2AX6Uc7XxFEc
	Mw5xjro7woOr2ZRIAe3EJS0fNZOjXjSl06H7AZuU62I6JK1/Me3CuBDf51crIaBF
	vgMAMDAq8vodazyRJPY5s+zJkO72Dz8ARIEmFlsXyRqJbEfAlzndz+E1Kl7fFVkL
	X5fFMUGyfCy25vKKmnfYNEtpCUiDOwmevJm/tdNyUw9+igItkG1DDK2V8Z0quL9R
	fxpLRcNdUywVS0/ql9XKrAqLuFAdVS7JmRWjhsKHXOSRjEFKq/TrOT6t3+/lUaKP
	Ve+jdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpegwmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:06:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4782540eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369988; x=1794974788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=UHRtWC8auY3z1Wnca5nuuZH3nXi7e3tS4BjaiWty1RFvQpTPU/TmP56yn2+jKxqQwm
         s3JeDROmjTn3ux9ju27A9Y7x3rYkenKGlX18cTq4sUVSO8bjB6K2KhkdFwkssAexfkyi
         3qSP0VmlW7ABZqkpAgtJpXAdFuR3us65ZFXgfKdfWKdCnDh0reuMIJ1jHvyEuR9a1Sfk
         5BTiZlo0C5qgA/57H3GT+tKfS1HNTVlkvh2No3oj5rfC8f5WB4lQnoBD8FbiFOfIRZjF
         x4ORIETRiYpadsjT49gI2MxMlwvejMH9X9RCpsCFiLtQJg7DwjFsnuYxSjeL8iYyQzl7
         fe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369988; x=1794974788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=RsXyFvtwOXYCK8ySGTUHF+3/AYETdP1/vAFJDhGOR75a6pEtVW8OjFJi7TftKppf5P
         hdOOjRPEFyCmrDPY9fY55MVP5W/hQoxnsfKDfhamFUHL23zph3IxiDQGwa+rqm/rGa0H
         u2hTUbnnL7q1QjTgFfYhMDyTh80wu5jFvfJHX94zVwGcXxlzerFUMl8h5AQ+d8glzVCf
         IbA42XQA5Ria0DyYTcJr7+2P9pbB/nSbJLSyNVH20YGtaIdTimwowVxn/QnhOUaROrAC
         WnFGIEuiAV6Yn2E9RJFbPeCrhpfGWR3JHckbtfQZYvDpBSTouCEWKcfT4O7EWYu30vqa
         9Gcw==
X-Forwarded-Encrypted: i=1; AL+hErFuSlwaYYblBNXVvU2xIpJCD+wD/aiepld8kPcep4RMTGtkLBaP5m5Vhgmq3pBTeWDZ/khmxwAaJr8o@vger.kernel.org
X-Gm-Message-State: APuU4Z/YsLSa2woJw1yb8T5g9I/aM/P119DT+z8WM5pxL66gjSfvjQFk
	LScRa5ZL0noXkuesIx+hJ4PULG4zn/BbgunACH17VRCAFO9fkCAIT6Fyz0nJIwRD/bdT0dN6n0a
	+s9GlNxlZ/XjKz9bSvfXacKsSR550NRMfT77OXpFinMLTSEHbPrioFFTFnl/mUUAs
X-Gm-Gg: AYBFou3GW/eefIqHQaUFbUybc4NJlaRvKUs5JUQQ1eX1fgGV+7785+kyypogFcS8+WL
	fMy7XnVX09nZP8BGsR82zyCqLeiriI/hwzwxUO30OIC8xCrCnYTqFEAZgBZx+hIURumYPNVPFIM
	Qf+wLaA56pbI3VJA5xTyM4gcJVHrDHwUYsCbou61ZAOKsfienS3rTPr8wCpmU791YXSeEYaJn4O
	zEA3j2pShwPbFOkIiSHM/o88V+mAImk1jdGbngqTQEiGb29T+DbF8cz1gWgKR4g6lB7oyth1863
	WnJmXsp7EM5w2fe5AjmaRuxIIxSmw+aQ+5GILjDcY+bTQk0jx67abR7D187gqX9vUMkNf73gnDZ
	BArJGOqyZpoYjVulYqYsSHFLMVoesfEhHAOnz89X4dE9dtv4qbwJ9AUOQp8yer6CzbzK1L0QDCZ
	8nCpruun3VBzzZ/Kipqt6KZrP7mHDu6+A+7sHp+iGs
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051377c88.19.1794369987524;
        Tue, 10 Nov 2026 20:06:27 -0800 (PST)
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051345c88.19.1794369986889;
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11420079c88.2.2026.11.10.20.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Message-ID: <b47f5ff6-014b-4b4b-924c-bd6310bcbded@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 09:36:21 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
 <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfXzYwKT8hGzrHj
 DVglVD830a9b3Eh26hRs5zd8Hlo1gS2yHVPj+CD0URF4wcrLfCJytEnwMKqLknsloOMr9LzoGUC
 Zra/ymi9hdGqJoFN3pLTV93/kJcEs3NYZAUR+XXe9tTfbPtafvDuujcITpMRxmAFzaDPQLT0ulX
 WN402bodGp7IEK12yIbScmV9jsSkerPFrqRB2PoJfx6cK8NU0cHNArPUh+fP++ToT8B5ri5jf6e
 +TC6P3bMKp+TFWm4PMtygs4MLG6bAIZe1NkddsHmj+nqgrlJokJXqJBmKrkUP4MVCNxw2bXfhTH
 oPkXrkjs7pGwCX4x62SPfCpjuzq5s/ASg3rurn5AkUcT8Qc1q/1jf0twE09BPN8tX76YLuLsHly
 99G9AjdDN6xn1YiD2KrfBtNWiTM1xL0k8NI2hi8bHWRWlwnL4BhTu3buJHfYryNfUOq0zg2ZC7s
 taCCm9JPIMGBspx9wuQ==
X-Proofpoint-ORIG-GUID: eph4P8Gh7Rt-xkDKSrt1v_v8fEn9H4rV
X-Proofpoint-GUID: eph4P8Gh7Rt-xkDKSrt1v_v8fEn9H4rV
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af3e9c4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dkA42MIeFly6lUBFm3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfX96roMzlErkjQ
 69pFVrxtlSfAypu/+9+gz4Dfte9vAJkTY/Qf+TrhHt9c8Aig/jhYSc/nWCEBUT/gfitXZQ1X4Sm
 /uJNxrL7AZ3rNq8R1Flcn7XThRwbpOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110016



On 11/8/2026 12:52 PM, Akash Kumar wrote:
> 
> On 05-11-2026 21:11, Konrad Dybcio wrote:
>> On 11/5/26 11:02 AM, Akash Kumar wrote:
>>> Increase the nominal max USB memory bandwidth vote to let DDR scale
>>> higher within its nominal corner, fixing glitches seen during
>>> simultaneous USB audio use cases.
>>>
>>> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
>>> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
>> Can we scale this depending of the real speed of the connected
>> device adjusted for the real data throughput? i.e. if we walk
>> the tree and min/max as appropriate, we end up with say 10G
>> wire speed, out of which we can shave off some static overhead
>>
>> 4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
>> any configuration.
>>
>> Konrad
>>
>> Hi Konrad,
>>
>> Two things worth separating here:
>>
>> 1) The ICC vote is not a USB wire-speed requirement, so it
>> shouldn't be compared directly against the USB3 line rate. This
>> number is a DDR/memory-interconnect bandwidth vote; the platform's
>> interconnect/OPP table is what maps a given vote to a DDR
>> frequency/voltage corner. 4500 MB/s doesn't mean we expect 36 Gb/s
>> on the wire - it means we want the memory subsystem's bus matrix to
>> have enough headroom that the platform's table picks the higher
>> in-corner DDR frequency instead of pinning it at the lower one. The
>> vote intentionally carries margin for the aggregate memory traffic
>> of the whole USB subsystem (descriptors, buffering, concurrent
>> audio capture/playback, etc.), not just the raw bulk payload of one
>> device, which is why it doesn't map 1:1 to link speed.
>>
>> 2) We do already have a speed-based split for this, just not a
>> per-device dynamic one. dwc3_qcom_interconnect_init() picks between
>> the HS and SS vote pairs based on usb_get_maximum_speed() of the
>> controller:
>>
>>      max_speed = usb_get_maximum_speed(qcom->dwc.dev);
>>      if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_SS_BW, 
>> USB_MEMORY_PEAK_SS_BW);
>>      else
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_HS_BW, 
>> USB_MEMORY_PEAK_HS_BW);
>>

Hi Akash,

  Rather than relying on DT parameter to determine ICC bandwidth, we can 
do the following:

  a) In host mode, we can register notifier to usb core and based on 
device connection speed at runtime, we can modify the ICC bandwidth. If 
its High-Speed, we can scale back to SVS. This reference is present in 
downstream.

  b) For device mode, we can register a post-conndone glue hook to dwc3 
core and depending on connection speed (DSTS regsiter read), we can set 
appropriate ICC vote. This is not tried on downstream but I think it 
must work fine.

Regards,
Krishna,

>> This patch only touches the SS tier's peak value; a controller
>> whose maximum speed is HS is unaffected. It's set once at probe
>> based on the controller's maximum capability rather than walking
>> the topology for the actually-negotiated speed of whatever is
>> plugged in at a given moment, so it's intentionally a worst-case
>> value rather than a precise per-device figure - which is also why
>> it's sized for the glitch we saw under concurrent audio+bulk load
>> rather than for a single device's best-case throughput.
>>
>> Thanks,
>> Akash
> 

