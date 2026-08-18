Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00BE35BDC2
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024081; cv=none; b=kYfhSKR6IvHBbL9FAUnWaPnWajdSSrLrpB2hl9t42hFdgzUzQh+Sl3K2cqW0RUzmYDYAit5psxItrF3LMtexGCHcqR2Bi2xdATDSh1Pve846l4SI5LWeHhGn7FndZtuZdQHI8CZ6jWho5L7zRXEoQL4xOJqOceB2Rh7CqYcb0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024081; c=relaxed/simple;
	bh=Rbqz+Z4HDhh9m6jhwiqEfjl0hJhdj5lMBn8br7bWrkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkqyMBCnNPG09a+BMkensPoYALBzNScW91R4QGF94ctl3G6GMWh94SYyEmRGe/NiFFrKfYezTVZpVKPmaf6q3xA01rSRUd/A9A/jcA+0RytOwOa9TnZ7DEKRXINs5dbTJ6Vq1AV1Uvt8xMsArgxYzhKWWP9HYcUy4U+Dx0cpuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OV86uNgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yc/Jl9DA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OV86uNgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yc/Jl9DA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkY3E3464546
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mV4bn/E5aJAExPqBnO8XEUhQ
	tu3TYpO1M/Gy7gbSacA=; b=OV86uNgtn/v/nfjpEyytXetJUUsRMtKqvrOxjc8L
	Fr/dG1aHpOzR/OoqpWf6GzR8LRPoqMpuULDmmUU0u8VMySd2mVm3OTOIRX2KlAq1
	OnB+CZElSeSBwxwpkiuVKZ8kVNy/yxh/c1vClY9f/4FtAyQhCbTazGisJ3btLkWT
	3ax6S6DAc7YVrU1/Ri9ShVLox+mE7zvcxsBVve2w0yI8oHE8q5NtttbANNyRr+eq
	DqZiFB4bUXDJu6FDnAvKAYVR10ZaCt9mQaRa/oKhcCZqL0GpAjrRGUI090TCRh3d
	YzmyPjDwkbptOodY3SxTCqRwKp2d1ZIo2kl2kgRoRPpTsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611ae1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:34:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso7640631cf.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 20:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787024078; x=1787628878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mV4bn/E5aJAExPqBnO8XEUhQtu3TYpO1M/Gy7gbSacA=;
        b=Yc/Jl9DArpL4wCvsWfbT0sguPr5rYynUGvM0+mNtfc1+3v8w92lDCt/lixYs3Nl7kb
         pEFeJsbBCoeGKCojVT0aZNHhbxo9MRXvlhqS1NNw4laLGxnX/E0d1Uc8a/AW6paHm4VZ
         JSKBoOJ57lpEM3xVwHfwrKm0dJCrIhMbBXbUIrDiUFcFJrccRKEZcp4rI9AG8COUZkjV
         8UUjCtqPp6BD30rDhTBjt3R3gGsCIIooMU6pgJtqHC3dWCxWl9jHt8gU6zRuq+u4klfs
         GcTRi3JxfOXM71ZLf9K05gW5UrJTOJpbm+6MuPVMw1AdQ/NWddOeCBKLdsy3nernOJuf
         0bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024078; x=1787628878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mV4bn/E5aJAExPqBnO8XEUhQtu3TYpO1M/Gy7gbSacA=;
        b=puv/TJQquMUzzFm7emNUnf9JXnkvGa9GazmSqzHPR5ernc6LDRfq2cpuFm3z9PdvNP
         NH0tdAfN7c+dVqkkqAXoH/MpUZuaK2hozFI8UqcbFYCj7k1vZJJU6ATADTMIzOOMHOXB
         zmfbFyV0Dlz8A8TLCkWIhKIqCqHvG8su/83mpxLRDegqmaB/1NsD1dVzqYBGXSYZ579X
         gfQiCD6OIzL2rSLGG9g06t76s+fxhRmXrJBNUdTTeoEyN77QV9fS6i8SLWclgVSqstQv
         FdYzIfBZDJXyDautbWnp8o8KgcxdIAz7dH9pZdKr/mkRh+vq4m/QrmoghHfMsZD4rLiX
         ae1A==
X-Forwarded-Encrypted: i=1; AHgh+Rpsz7POeOewwt2qh5EGa0GayYxhq4l6x1WtWjU+cMsk6uIGMlX2pMWj5zQVMx4wTR+VdIDFNMsvCass@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJONhbxWcU7+QnugbdD5gMjpMuIbx1FfmF6rhar8qpyD4ZXFU
	Dyk6RWWyQzJ/WXr4fxc8U1bDm5bwMTpNJqWbgvaNs0h5YoY5XZhbTuO+YNsl7PxYGb6FKICVu2f
	FE161IPZlpWtig9LRCZrW29mjPuwkLI41NJOh0zOHhF2DOGf7lWKrcJpAQLyoJmWl
X-Gm-Gg: AR+sD11nQsIbcrYDAXrmwbIEAWvRB1hP3vZhtbn0boJ4p7rK31KTw9M0BH4T7sfmlBK
	NvTuoOrr0mHXUa7MbE1sujvDHEz7JJlemjjoir3SvtT906tftC/PuJT+wLkPlxWvOgk/l9iC25L
	Uf+09NtzdxKE7W4auh79qiOEGYPtf0CBQvg1fOnyIKj33VZSp3uendpm4deoCpV+p+tQYQKA4U8
	tPdA0NnkwQh5wM6LOCzYJQ4MFczlFZd4ceXONPfAgWj++wM43W9iwr6EMPdULTY8ozWw53WitDC
	qIH+rjhPTgJ62T6ZHGdi6pFzsXl58I+3MZ426fbGNqF4p3yFJCGxv4JveniknB7XVzdLvDgDU4U
	bsoiW0gNeX5FhP2xUE+LjMDfzLN9t6u5RRXWCEOc48OHEtREmf3n8ntSio2PIjLzVT5o6M0Mu8B
	TteVGZY/unu7mb
X-Received: by 2002:a05:622a:986:b0:52d:3483:ed0a with SMTP id d75a77b69052e-52dbee3fbf7mr41573121cf.18.1787024078112;
        Mon, 17 Aug 2026 20:34:38 -0700 (PDT)
X-Received: by 2002:a05:622a:986:b0:52d:3483:ed0a with SMTP id d75a77b69052e-52dbee3fbf7mr41572851cf.18.1787024077687;
        Mon, 17 Aug 2026 20:34:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffeacfsm837664e87.54.2026.08.17.20.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:34:35 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:34:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
Message-ID: <gn43qixdtbq5iyfqvzibdtx4lmwpkt2ieahr7oqsxxjfpldb6d@xbxhbdrq4e6b>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
 <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
 <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
 <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
X-Proofpoint-GUID: zQ76D2wPaDox7a3jp4cfolbStEfk8Yoz
X-Proofpoint-ORIG-GUID: zQ76D2wPaDox7a3jp4cfolbStEfk8Yoz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX0EXnpn7NQBhb
 ptZPB0FVnFVmICy9iYbLgH2zNspgbR+R63+qT7i2Wq+muERSCts7A7HlcEGRdDJ8n6C/0Op7P0n
 UIHnYqzTvXwRnDuznNNTofOSmvMjn5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX5UIGBqBi8qVN
 g3QEHMeP2M2HxL67oc4+Vvbi+62RhcXZd0sizgGfPvoGWXBrA92Q25tnaCf4mOUNWgzs2cpUUkc
 HCeWkEs0GDxMyKIruO626JwW+w7JmsBwerYDFnkl9u/wYL7dEqYu6hPtD/NUMAeIwysYm4lfTkf
 RNhul6y3ks3cI1nrQgKX5ZS3b7ravtqrOWaMocQueAHnZbmJ7hOpYKnjh9PjtuyxWS9miggE8yf
 LP9OxM3iGh5Um8U3mjqx7hZSVNVAyyzVID5prRfJwAPq0w+b2HAG6QjvH43VHOLTtIHDfxHD5KQ
 jWlPjb+0S8MAJA60Q7FB/TcAELtx3iRNgQrmzXF0cqZJVtszkHPEs9DwU0X1SF7TobmyTJ4kb/d
 rnJIELdABGjF2Lh/SyYbyThXFQT2ofV9IIe/fg+M6qrTza+/HFvtkBUBthkanqmZS7hFVuKDHkv
 A/eub9WUYz825RUWy9A==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83d2ce cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=vud81D5lyguAdZXVQFMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180024

On Mon, Aug 17, 2026 at 04:45:27PM +0400, George Moussalem wrote:
> On 8/17/26 16:38, Konrad Dybcio wrote:
> > On 8/17/26 2:37 PM, Konrad Dybcio wrote:
> >> On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
> >>> On 13/08/2026 12:28, George Moussalem wrote:
> >>>>>> +examples:
> >>>>>> +  - |
> >>>>>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> >>>>>> +
> >>>>>> +    phy@4b0000 {
> >>>>>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
> >>>>>> +        reg = <0x4b0000 0x800>;
> >>>>>
> >>>>> That is the same address as PCI PHY, so you have one device, not two.
> >>>>
> >>>> yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
> >>>> same MMIO register space in IPQ5332. To enable USB3, the compatible
> >>>> string, clocks, resets, and related USB3 properties override the PCIe
> >>>> properties. In IPQ5018, the PHYs have different register address spaces,
> >>>> hence representing it as a new devicetree node.
> >>>>
> >>>
> >>> Same MMIO space is same device, IMO, especially that you have the same
> >>> registers (looking at the driver).
> >>
> >> It's indeed one device, fittingly named "PCIE+USB COMBO PHY"
> > 
> > so the implementation, matching prior art for similar cases should be:
> > 
> > - phy node with #phy-cells = <1>
> > - consumer takes a reference through phys = <&phy FOO_PCIE> or FOO_USB3
> > - new driver in drivers/phy/qualcomm to coordinate the two modes
> 
> Thanks for confirming it's one device. I'm already working on a new
> version using phy-cells and having the consumer select the phy type.
> 
> However: I'm adjusting the existing phy-qcom-uniphy-pcie-28lp.c as
> that's the driver currently used for PCIe only in both IPQ5018 and IPQ5332.
> So I'm adjusting it to register 2 PHYs and provide both PCIe and USB
> functionality. Any objections/concerns?

Please keep in mind that the updated driver still must support the old
DT.

> 
> > 
> > Konrad
> 
> Best regards,
> George

-- 
With best wishes
Dmitry
