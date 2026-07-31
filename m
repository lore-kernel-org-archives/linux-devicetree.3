Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE963430CF8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508986; cv=none; b=uvXwAWdkGhxHRldTB2+JW2lcLU/Ue0Zkn8VK0eIul0uqOA7WlCJ7LdaUJCW+U7l0667N7Lcju/gCQTCFt+BqlcniIoRGAiW3zpeM+Ia9FpFwxDfRgbDvhTvzRxrU9fWpHT/bbGLDpH4yFOOoosR+NFOTLsPNWwH3PNr+5ViZBvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508986; c=relaxed/simple;
	bh=qx8l3UVS8c5euUQMfo4OmyRRN6xpsv6rGMc3uSXvTWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3dSZIF3aa6e08kZbJEICn/MtN4LiVSD2uU02v+cnHQxJGLdHSAkjbMoJch3ZxDNLQ7wOvBbVr58dHyUZOzXh1T227Gt03ZiOFzhMASpgQLdtndIn1ZNufFsc2bzJ0/Y8xFYgtIAMQZJOVs2P9epx8aLUUTv3bchxq2rPHRultk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqOeYkg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6229nMq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqOeYkg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6229nMq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VC9xHK4154457
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiH4hSb83BJjS6QAoHv3slk5Ye3oYZZALKE7uFJo9PM=; b=MqOeYkg8IoINhOnr
	SyxxEZQs2OU+VP5zShCKxeI6ntXBEu0XDXIPJYz6SZ9xlrokx9HMALzxj5z3QPR1
	ROOYONt9lwcekccytzHaLgGT+xZyVT4sINq6grnK9YRFxhlsD24LSRJ8OtRoYNsh
	RhYqW0K68pugh1XaltkZeRZzu0o80qPRbzgK5uDeUuSElcaUf9z03+QVMAIy5TUf
	NXzb5b+VBkn3Nidgos+CUyRKN46ZtSu3iJ2o01O0hkacuE56VrjglkbBJMQ4Suqw
	oQU9yw7+4NTRRexkNWSMv0izV5K3t8pSZBiD2KE/IC5gMxuX8SbsXqgpEP9GzJtF
	4VSz0w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkgnmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-756fd28d906so28482137.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508983; x=1786113783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WiH4hSb83BJjS6QAoHv3slk5Ye3oYZZALKE7uFJo9PM=;
        b=f6229nMq9HrDljVrY7Y8l1X2xOIKqP29V7NBaV6uam6FHVu+ipS6TXNxWzqfSAAia4
         A4nLkCLE8/pwBNb1u4jyxgdTUOnomNeSbrxyKOxW5swMMIvbVRBgvp1g7iM/43pDftM0
         qyshseGla3l5ttm9BFBrUfn4EnWvTyGrHnhNBjDGDElXSDptwF6tOxztisFOUBpHWXw1
         QVg29azgcXZDV5h5pgS/8d1zhGCX8/N3ZlYJfLWI9mI6DF8RMTkRW2I22mQBzw3tMhN1
         wAW54E8lAueJTG/SrYWo9FQpKQCzV7I/00qKfFi2idneJfeM1d5hvhVtaonvHBWl0CMB
         IbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508983; x=1786113783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiH4hSb83BJjS6QAoHv3slk5Ye3oYZZALKE7uFJo9PM=;
        b=jTKAF7MbTP6hQGzn3jdK1PliDZPc/QdN3+vb+xpHUhIZNWF4Pc09VLouPJbVPNiGaE
         jwc22abZ7GcR1AWYtV1AhMRo5tGL5rk7Y/HkCYwCaP9OzvQ4H0FySks6qwUirl1yzacb
         PU2yiBu/sayfu1b6WhR0AzudWHLJlL20uBruKi5uYbZNZEWLghg+O7iuva81luf6oCZ1
         m0IBjnqI9KBZSrrQ9rVEpuq/TiJCqFXIpQK8h04zK9+DYX+K9X6b9x96881OTp8wjlMM
         7Z3OOY+qTMKoFf3p9nYbO4Zpz1rrw0TVtR5YXKndbusrHuLHZg5m8nbqy1xcknHuotjJ
         e6LA==
X-Forwarded-Encrypted: i=1; AHgh+RqpV2dFPXHHhmSjWXeXqdAKI/umfYwgjs5xQVzR9cRLiUd6ry9CFYsIQP9K/P5f8GAjGZKC9W0P+pi+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhi+xBENxagJItOIi+TB17wtJ3seSy6omC54Sg+jhU3UUrJD1v
	b6m2xeclu1Jtd/06psXY3N6ycTHppfUuTISwseA6wpDy58tx0nt1Iz6DNqjK0mS3r6la0GK0D7k
	Iik/u8zZ1Kr0wVtNOlKxoPTqleBaTEtIe6run0zP1exc+TmLoGT0LJYLissJcl2BZ
X-Gm-Gg: AR+sD10QaR3rRrDs7w/Roupqf9iUe052o+FBALr5SXtNuI5cGRBMpBnWxCRxaTO1Z47
	DJfe8Q17JfR42wg6SK1set8vjdnSh1rsM1UtPhIzGGhBZlrQ695ZS97FslxstITnSddaUQV4SFI
	Yw87PV3kUoSkck0YR5nnF1uMaVs1rIuQsqROhmL5WGEj8b8U5qGFbFv2Vh77VHKlRV2MvTXSu8Y
	9TVuPcb1fSZz4lABxjZHOzF65/VdvNY4POV10pVFQ1M+6tor8pit21RPg580h4o/O1hIoQHwWUR
	QB4ltoAtRO59ZhCCGUFU99A/vCJJmKsevOmSO/3sKxGkIMF6r3faYimk4fb42g/F520sbqNvhYC
	TcyWb9uc4jUwj+cRRobfl8UGX
X-Received: by 2002:a05:6102:3750:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-75b2447344dmr238227137.3.1785508983083;
        Fri, 31 Jul 2026 07:43:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3750:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-75b2447344dmr238209137.3.1785508982596;
        Fri, 31 Jul 2026 07:43:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2455607sm358942e87.69.2026.07.31.07.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:43:01 -0700 (PDT)
Message-ID: <7ecf9354-f292-425a-8a05-13346a4ec3df@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:42:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port and
 add M.2 endpoint stubs
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
 <20260729-hamoa-m2-dts-v2-v3-1-4d7ef9274575@oss.qualcomm.com>
 <8dd0680a-901a-465e-898d-88a17a9a71a4@kernel.org>
 <20260731073306.1895428-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731073306.1895428-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXz3Mxz+3AIRxZ
 HPQk+qIVPh2y3o2GqvUO54oEy08JJoEj+cC5SWwILBD0yiR0WiFtm6FEMCJc8GsXy3B4iljpmbl
 dZM45EiTkC44op5OMQuwH4lECdH/lKk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXwJimUt8jaXLy
 sf4STqv5iuxfkIHxwMXViqmcgA+MB263tQ/pcAmRco4tH2R9BahuAT/goakQ+/SYHNhY6cetqSU
 EgaUxZiP4A+Cezqy29Mst7VXGsYQcaFUPZdkw4rI+4lrYKkpAvQkIzq5Imu8pa6jqpFDG7H3Ur9
 G6El7fh0xJa+ebIqh+ll2g07EdL69ahNQoVvG2jnAiKCGTWZQt/6d05XK0MoTNwt3qtDXnJQaGl
 VD7edkWxGYBujHcKhSnbv8F56VCV05YwmxG5TCyt6w4ByM6ciXAey1cbaIAIc0M5PVDuVc6dGan
 FmuMoUkZbHY+jpjWX8hEIvXKf6UuX91FgmJBQapwQpCvzQGXFceLZHl35TSmTFicYMfBjKL2GDp
 whx+KW0SZxDRt8SWoNI+mD1CKJN64xgKwGAHv84eZcn0fB6aBO1ghBAKwZQYhJK9mnkT4gcmMqf
 SvjkgvtxgnGtFYkwDZw==
X-Proofpoint-GUID: BN8AzszFj2H3aB2VnWrsD3EwfIPdpPiC
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6cb478 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5J5LCJH7VlOFKgF9C9EA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: BN8AzszFj2H3aB2VnWrsD3EwfIPdpPiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112

On 7/31/26 9:33 AM, Wei Deng wrote:
> Hi Konrad,
> 
> On Wed, Jul 29, 2026 at 12:46:49PM +0200, Konrad Dybcio wrote:
>> On 7/29/26 12:27 PM, Wei Deng wrote:
>>> Number the existing High-Speed data bus port of the usb_2 DWC3
>>> controller as port@0, consistent with the snps,dwc3 binding convention.
>>>
>>> Also add an empty port@1 endpoint stub (usb_2_m2_ep) for the USB 2.0
>>> interface to M.2 peripherals, and an empty UART endpoint stub
>>> (uart14_ep) in the uart14 serial controller, so that board DTS files
>>> can reference these labels directly without re-entering the port
>>> hierarchy.
>>>
>>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>>> ---

[...]

> I want to avoid redefining the binding unilaterally, so two questions:
> 
>   Konrad: is there a DTS pattern I'm missing that would satisfy the
>   current binding and still let fwnode_graph_get_port_by_id(fwnode, 1,
>   ...) land on the M.2 connector for USB port 1? If not, would you be
>   open to a snps,dwc3-common.yaml renumbering patch along the lines of
>   Chen-Yu's mtk-xhci change?

Thanks for the detailed story. I'll respond to that series directly.

Konrad
