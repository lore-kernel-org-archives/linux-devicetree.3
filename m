Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2799517A314
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509302; cv=none; b=t6+2TINsUwzv68UppVxXtwpdaLK+j3GRZ+e1ICxtndFrVT2RkBor1kLWezNx50UQp8a861pPV4iLkTqV9Rocr/ny+wwcght6ZgUhbSP3ZKvfpbtj3/VBI3MUjt4urku4M00jITqw3ET/WsHIdIEnbM8+vKO4J2sMl1mpBzxnbYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509302; c=relaxed/simple;
	bh=7HQEZsOlKVsHUcXR0CkTKsFAkwWBvpZRVOVqYNUlxsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TECIX8d+DM6EzMUSL7Qv4kRx0mCQuvtnj9SBn0qtKf1uxeHnrhwsKPBb6AfnklqZ7iBpeorqhkOqTRD9u3c+iROwf9+N/MQCWpdp8ZgFQk6nCBSg5zov6HqvZDSeSBdA7Va+QV4KCMf3g4BaGwCWBLYKr7Pqwo07ChRSzDc31mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBnjN8sw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i56e9jCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBnjN8sw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i56e9jCQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBgejR3797903
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/Zio3QWGmnJick6iHRgb9kHOYoqIHzuKlZBC+YA5SE=; b=pBnjN8sw8Y/Y1Oq7
	BPQ6o1Rtn1Z1foPn4XKR6mgF3Qo5M7ArmpbLaogC0OzEf79FlP7RgSrmBxaQPI7x
	BLpeATtwEheE/nw+a22ahga3dzE6qLlITTjexa9tFEyD7fq8ikOPQU+iYSXafHbF
	HSC6GZSPLMlpNlLBbHKrK6rctbJgbS0AXh1WjT25Iu+xntqD5X577zqj3k1i0ODm
	blUJoju2cemfDd8VUtz2ce1NaAoUPNCU6NMQaURClIgIwSmGM6pin7qdJU4eOKj9
	4Syqz6lCIn9PGuCoK0Kon1Rk4KDsXmcMP/2xhM16k8VPprlppx/1iOL+dVlCYH/+
	5mULIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u0sga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:48:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so11070896d6.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785509299; x=1786114099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/Zio3QWGmnJick6iHRgb9kHOYoqIHzuKlZBC+YA5SE=;
        b=i56e9jCQ3aOPcdSCFMBuCQZQ6Vy62z0GjW7LumIwVlk/S/bGeDffetLe5Q3xKHFL76
         u+kZjFSH7FHcU31V6QQjlbzRo+QnbEB2N+jR7UIi08y2YCOWaG7qpR5VEZD2lghB7wuG
         jDhrVBCoOZcMdfl4+BtHIfgQ+UUozHTOujRNemF81qsptSX+Y+mSC8vJwhGzh8ljB+/w
         1ThlaYjpYMTjsfIh7FhEY91pvbIcbpO/SzfNAxegfl+LL+RIz9HcgkELY1fjTpJBo1ET
         dMIm1RIlH7YofOT5K/8sFG7F6HZ1d+JCD3q+pKHITa/6TCzPSkDmRP/TcpaCC3vUzsfK
         D6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509299; x=1786114099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/Zio3QWGmnJick6iHRgb9kHOYoqIHzuKlZBC+YA5SE=;
        b=Y9OKVmn/po6hhmwP0YXkhl00BAN/TMJzegIFshgO3F1dOEZ1uUDH67Kg+db6FSHITp
         g8rFC1lEIaoFLOVQYswRxplXtf/D6ThmyRVlnSI50Rfh43W6cRWY49veEUZSJJoVQxdU
         qzcBSPIoCZ+A6y3DifQXFHO2pAw4z4uQneeoRp1qdI5+SqGs5ajPuqOPK2QzKnXbnMLX
         ma7M38HpM//UpEJUkEIPdgdh3+Ar6+wUU1ap0ZJj1gxPfJAFqNkqmydATGMsMfmPdUoX
         OpMImA5tJ3Y1VWuOyIzsen0lHK3+TZferMuwkr47EPg149tJepb2bFQuWk8Xg2PaSHC+
         Sfcg==
X-Forwarded-Encrypted: i=1; AHgh+Rrvb72OO6KsW6PfAnQ5bDij059/3JQYyzJR+X0juABwFa5v2Otl4g7hgk62yqERsqqRFtONbbw07IRi@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZ9e/YMcSMY54v2ppQECyNBPsx5xjF2mjPp6B5uu4XNlYVJFS
	h+YsUJDdUT7YtvkUGRsvgCKl4cYYz/Yr/Aw88XFIgrrQg141w2pDxU17xszuYsP90JyD90j+ri5
	oXlORgobd5ojAPkiiXUKcY84Nntaw6vLPJlZVwEffGb112t8j8TxIQBx4G0Gw10Mb
X-Gm-Gg: AR+sD12CtpD2WxCjrKZQng26G7aJfNMO8MvqV2gZAr92sHmbhvVM87pzIm/+8ICYTXM
	S/EGZAaSzSRiEw+gE9czqcaywNL4bwScTV3gLHpTUDbOHGJG28mGtdIxbx5VULhlWR6v8yt3T2r
	hPlQLh9rqMqvYssVvDrNW9SVNhPEx+8pJL+/DHTXUYR+YzzxslaSUt0XvwbGNvv8sLaAqSprQBd
	9Awk8rjIMD5qyO9t0fHDNnjiF1b3xH/QvP4A2NKIJnxV3yPGyn1up/J20XDioAK+EBQXzb2u41H
	HGlccxB5qsX+wjjtWmOwmqOWYi75MMOlN4o2C2veT8X/wi/iS49xeJlKP7j7GWrzlkRyteyRmp/
	eSJPovOAGgWGQAEtE3z5k5zscS8emlfne
X-Received: by 2002:a05:6214:449f:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-908496af620mr580556d6.29.1785509299340;
        Fri, 31 Jul 2026 07:48:19 -0700 (PDT)
X-Received: by 2002:a05:6214:449f:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-908496af620mr579456d6.29.1785509298665;
        Fri, 31 Jul 2026 07:48:18 -0700 (PDT)
Received: from [192.168.1.10] ([122.177.247.168])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908432a0cdasm11912986d6.3.2026.07.31.07.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:48:18 -0700 (PDT)
Message-ID: <b47345f1-1c7b-4424-9c6b-3dd02c0f4ab6@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 20:18:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-6-2d100f30e202@oss.qualcomm.com>
 <794424df-4714-43a4-b4b8-e960998ad1f1@oss.qualcomm.com>
 <ce283ef7-2460-4fa4-a1f5-9757fd6b42b5@oss.qualcomm.com>
 <6d61d749-440f-40ad-82e5-e1e909afad06@oss.qualcomm.com>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <6d61d749-440f-40ad-82e5-e1e909afad06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DecToG-DV0P3gAof0L72aK93zFsAm9pR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMyBTYWx0ZWRfX0cHLoc2/Cih0
 GspPZZqOAwL3NBvA1vJmjJJb40Dd2/V9CDQpXi3PvwaI8K7jy/kncDSx8VAwYfZ8+RA9Tw27GKp
 Q4JSRLMsqrNHijSvLBUqPkk9ZVewM3kTJ1BJox5eMXPrB1wrpdQIF6AOuOZHexOeOdUL5jSVEzJ
 FpZZHsM9IDSa6A8hfsTm+1mym4KNnzCKrqgyGnyK9dYoV3l3R8CwI8F0B/oRBL1thMbgJ/2Q6DI
 PhdxLYZWBC8leUu8i76IKWCm6lQozQDgyigW8+Q438jilvyfzrCFZPdwxJU+O6azxH2VlWb4HGO
 zG6ZTGCc8Od3TS/4OoXUHLr4n1yxD4rMG6ptRcutMygh0qlidkLRjVD7a9Q8jmHJJcIdCcc3zWv
 P7P1pvmozq3lti56n4oJ6eUI3cnZZHyTprJJEXZalSL0zk8di5DDo6ribRKqxLWzauRsQ1R4ItE
 jVtoZ29Qs+iUcH4GMJA==
X-Proofpoint-GUID: DecToG-DV0P3gAof0L72aK93zFsAm9pR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMyBTYWx0ZWRfXxjvJb0x7Z0Bg
 jTjnfFjt+Z7fDBqBgon9JPiacUOA5gwcVsQdpDNsyik3PitidDkOlmAY/aTrXu/cbV+rJ0GJGUQ
 Zq6xSGnXiAwMEx8es2TBpcCdMZI1tAI=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6cb5b4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wVA5pQU3D6HtJETKl3oCcQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OkEJUsIZQkPH8Uu3lZgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310113



On 31-07-2026 18:20, Konrad Dybcio wrote:
> On 7/31/26 8:53 AM, Rahul Samana wrote:
>>
>>
>> On 29-07-2026 18:01, Konrad Dybcio wrote:
>>> On 7/27/26 5:45 PM, Rahul Samana wrote:
>>>> The reworked RB3 Gen 2 Industrial mezzanine keeps the common Industrial
>>>> mezzanine hardware description but routes QCC2072 Bluetooth over UART4
>>>> instead of the default Bluetooth-over-USB path.
>>>>
>>>> Build this variant by applying the common Industrial mezzanine overlay
>>>> first, followed by the BT UART overlay. The overlay models the M.2 E-key
>>>> connector graph endpoints for PCIe and UART, and disables the on-board
>>>> WCN6750 PMU and UART7 path so the M.2 QCC2072 Bluetooth controller can be
>>>> used instead.
>>>
>>> So is the onboard module disabled? Can we not just use two in parallel?
>>>
>>
>> The Industrial mezzanine variants do not support the on-board WCN6750
>> wireless path. The common Industrial mezzanine overlay already disables
>> the on-board Wi-Fi node.
> 
> What does 'do not support' it mean here? They are physically present
> as part of the SoM, so unless the lanes are somehow diverted away,
> why is it not?
> 
> Konrad

Hi Konrad,

The WCN6750 module is physically present on the SoM. What I meant is that
the current Industrial mezzanine devicetree already disables the on-board
Wi-Fi path, and this BT UART variant followed the same board-level policy
for the on-board Bluetooth UART/PMU path.

For the endpoint labels, I can move the UART endpoint to the SoC DTSI,
kodiak.dtsi, as uart4_ep.

For the PCIe endpoint, the PCIe path to the M.2 QCC2072 device is not the
PCIe0 root port in kodiak.dtsi. In the composed devicetree, it is
behind the Industrial mezzanine PCIe switch, under:

    /soc@0/pcie@1c00000/pcie@0/pcie@0,0/pcie@2,0


So placing pcie0_port0_ep in kodiak.dtsi would not describe the actual
topology.

I tried adding a generic label/endpoint to that downstream port in the
Industrial mezzanine overlay and referencing it from the BT UART overlay.
However, when the overlays are compiled separately and then composed, that
label is not available while applying the BT UART overlay, so the composed
DTB build fails with FDT_ERR_NOTFOUND.

Could you please suggest how you would prefer the PCIe endpoint to be
modelled for this case?

Regards,
Rahul

