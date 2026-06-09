Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58F135C19D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044248; cv=none; b=KZnQVg0vWjIOh4oQWMqEPhsR6wggQRU6DvBVOiTx1vwFRyonMjn8sHTUetBQDs0qSOEH/Lqoi/61rCXVoNRrF35poaTxGGMRZpG1ptYjNDsMqBNgNxkbAUrGVC0jgmW9PD6ay2OVtGji1EVbzWJHyzU04iwrfLx1vO5lluAP2Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044248; c=relaxed/simple;
	bh=ycDCQVzs3bYcZrgKp53P5Z9+3Dh2LVN1jCfn9Sa8Np8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVPRhRbLAj5loUvtljSe6GqgFcxGW4oRaVnn/3vBCS/+Q55GSo6N0TYMSqSTEN/Uml4/JKFGja6XJFZib4s2TOA+IdItupqihMmsX3FR/Y5eBkpEIfXm+89z0pjEQIBr+MoVOeWix8nzzU7h0OwmhRjWJxdrrlD8/rZlHQm4Vt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YS8wolOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQpSLMT/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YS8wolOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQpSLMT/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MEMmA3503808
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 22:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La34ew2wgKgp7mm7zYqeehw+
	iy9Zo1DfBPTBVSWV4T8=; b=YS8wolOFXlrupfWiG2m0wui+utFzo4Odo5MxqZ/X
	/Rj+dd0MlpfZ2wFhtV9EpPc8h1eLN4hex0PNsC+pMERgI40TgUslRdH/BRL4kI0X
	d3JWZrZvG1ul6CgQ0DAsJbxFTfu60hNkDEiTjZZj1ej5uq7VUugR5hJ4rrUvFFOF
	THql6Hx6bI9dycwrRJOsHMfjb49iikxcWx3udysM6moU+YL07djlVe07L4kBdM1A
	Yhxoy4DnboaqFMYBUukKbhXlQN/I7oflveyMRbtVky+Nx0DG/AZvhNKfLFiqN7QV
	vq/U5pdQulAPiLR8Nog8Snq/dKy07J5z/+/KmeESvD0pMQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgm34s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 22:30:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c33d75153dso2504339137.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781044246; x=1781649046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La34ew2wgKgp7mm7zYqeehw+iy9Zo1DfBPTBVSWV4T8=;
        b=aQpSLMT/TXammurLabyYmktQ3OsvKP2Iq/yNHA2T7SVi3mW7o5EeSicpNvjmXKqVMv
         ybST9RTuGapgeu24gYJYYOKPs1Ut7fDGpxTRRdHhmK2ie5yUY4VXvEFxaoXLsYjjqLXB
         9ufZR8qyxtnsx3vW4pPblvP69sFE3SQXdUjXXEH+t9e/RtR6XG+7NyOwzS5F5XHQuBqm
         M2lkbYble3O7OEyPaSzLGsoSdYrpK+Yr5ft6hGchJ11wB7eCxvu30axKv7JxvTW7wxKU
         hbgFxReee4mZZ1wfcUqpyeLheDwngKyb+HjuB4Fdedz6oQn19kFfJeBWr/1b6LrPQIuD
         JhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044246; x=1781649046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La34ew2wgKgp7mm7zYqeehw+iy9Zo1DfBPTBVSWV4T8=;
        b=Y9GTBi1wPWxR8x2MsT9PVi6sqBgFdU679EqbehKGdsNn5XEmKC2UWvRrezf9LX6DFv
         fdB5Delrso9K5lNq17a+A4Rn788Ziew7waeDILmiZrq1t6F/3zLTM8MxFuqFelu/cuEW
         zNviW77HmxHm9Hz9VLIegQ+ePI/YCCsNcpRI/stYMe5wJzCCuzAeHDM/eb6ZR0ngrkx+
         LyD+cVu5EbMx62d4FQ5c+daRiGf6Kzyxuqy5QcqDDaUDDxx72qnJZC6KRxi/Qw2uknf6
         LyQkQ2VYGKepeQ14CZJ9kIJIHugBBZarQUGm6L1wasqns0WQcG+Fy757/DbOwG/EDaLK
         Tlhg==
X-Forwarded-Encrypted: i=1; AFNElJ9ckiaOJYzyPqYrizLcuVjHOlY/yhb6NrUywckKtnI8EMkJiNrRx3JVd4Ouz03aPcqUL0N7K51XS8k5@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWR/9cZkFrdsQV50wDzkuMsQXy4QK1zxx3z6bZ/mrRLLZIEXo
	vvQPQyzXqpCc3cxL4LqVBgW5pXfbVdXHM6rAQCQ9zFAlWOlpaqJZceQfucTA1dWzxtQfLRR57Ed
	1mRRw0B+uB4BfkyrinIMpeF4fI7mb/UrztjXNCOc+zG54xEcW23NuS6mQM9R/6pWC
X-Gm-Gg: Acq92OH7Uo67Dq5Cw8yvB3y0EIJTWKpxMiR3tGWlv1RzZIy0CNjkmBvH/9hUJzk5Xgq
	hfGepq4n9yO2eGg3+C5PKCDviUo9WAKwu3Hb+4fydSIabZe8x3aWF1bMZW0JUCROT7F1JPZwOjE
	wRk1a0NdeJAp1waHAdzTuW5O4pn+KCwqAnfYIUTUGjESkyQoBQF/1Z98MdIM26oa0kGyvHgLO+z
	F5T7tLetKTg4SdmO7SaDv6HYRdUOJk/VKjw8ryro3O3P/Ux4VfA0I9NSwwOmV147b7N0rls0GUv
	8XDE4U/bpcXYvhIjyBY2yM9EN0WRTTwov6UsnqIhFHOwnUqQYKuvjHXXfyWoISqXovYBOQYAY1C
	rTZ3cvjRabfVu1IvG3fv37XOjjC0tHunFMENrymPROMGu4qHQY76xqjyL5PJ5jqtx1ufuUQqgnF
	qYGJw+UV4WXHYAFV+nLwy1fL6WIl2l7Ma8mE6NzxpQxxvfKw==
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr12012576137.2.1781044246002;
        Tue, 09 Jun 2026 15:30:46 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr12012563137.2.1781044245544;
        Tue, 09 Jun 2026 15:30:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a71fsm4952740e87.46.2026.06.09.15.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:30:44 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:30:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
References: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
 <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMiBTYWx0ZWRfXwYSE8HvMUGnd
 m66oVW1ks16PAdLG6Ecf6vXq+0vE54oqNCqCGEEYE2K6OJqoc5DAQ1kce7fkJvkJwF/6SnBJNIk
 wHQ3gQYLFHzu4/odAeq8KYmYzN6hkv38UBLOWKfFDZWPc0WHf8gVmkr7gDhnv+04W4J3RU8jZiN
 0dd1lUB7FLxboNS0XzXwJ8HvsfCGaQq5nB+HawYvBH8PECl7syELKhAuEcw/I2y5srNykCU1fH8
 WItqoec9hs1bUFbRawdgj2qpug4vH8qb/+d+4NT4HMvObuL+a0/1st1LW5Jd6Cy1ROOnIM84tmj
 rTStW1ilTUnQvSkSXdecR7ts+biTUB/A5sWbD3qbjH0YpmfsngqaTMD6wxWpBEvvUJFSNC96KdJ
 gZDE9pgD59ezfZJH8OmdU1cxsQyifZ0qL78Pc+8lHGcqssQ0qgHobAezcoZoD4WaLhhalIX0cif
 D6GOfUMX+YLxRpvSeHw==
X-Proofpoint-ORIG-GUID: ORdsGhlDSx2wHofSCyCGLqthML0LZcMB
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a289417 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=UJ8pcXwihaggFu0x5dYA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ORdsGhlDSx2wHofSCyCGLqthML0LZcMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090212

On Tue, Jun 09, 2026 at 12:20:56PM -0700, Vijay Kumar Tumati wrote:
> 
> 
> On 6/9/2026 6:56 AM, Konrad Dybcio wrote:
> > On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
> > > On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
> > > > On 6/4/26 03:30, Bryan O'Donoghue wrote:
> > > > > On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
> > > > > > On 6/4/26 00:18, Bryan O'Donoghue wrote:
> > > > > > > On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
> > > > > > > > > Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
> > > > > > > > If CSIPHYs are true subdevices under the umbrella CAMSS device and well
> > > > > > > > described as subnodes, then likely none of power domains are needed
> > [...]
> > 
> > > > CCI is not described as a child of CAMSS, here the situation is different.
> > > CCI probably_should_ be a child of CAMSS given the design we are going for here.
> > Yes
> As of now CCI is an independently usable device to configure any I2C slave
> that is connected to it. If it is to become a child of camss, it should be
> self contained, as it is now, and camss may have to become a simple-mfd to
> make the CCI independently probe-able? In which case, we may want to follow
> the same protocol for all other sub devices like PHY. However, if we do not
> have any requirement to use CCI independently (who can confirm this?),

Uno-Q uses CCI as a semi-independent i2c controller. There can be other
similar designs.

> probably, we can stick with devm_of_platform_populate() model with common
> resources at the CAMSS TOP node and sub-device specific resources (only) in
> the child devices.

-- 
With best wishes
Dmitry
