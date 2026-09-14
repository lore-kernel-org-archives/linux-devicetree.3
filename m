Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0A946EC7F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392562; cv=none; b=r7iJoot12rjpJ8jRdNVpCnVR0mrYQHvNE18KjzJZvFveEYt8SzE4Kbgh8ViTuUAsCd+KMYby6dMpsWmHoU6OqH7Cppui0lOaXBhlZplnV9Ey0gMNbSCRcjF36OV4i72RXS7TZYP7C5v76IFTYqD7ExFQb0TOqkTFV/KcC6fIfhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392562; c=relaxed/simple;
	bh=qg/RBhESd51ajr8WDi37wRKO0z5KsP/UjDdEMv+gNuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5ckyMNDFjNSX00UOBsiYeQsHawmCM/6DUw3DtoIrNZ0pjd1Qee8+rYScDop/+v1L32uqPGZy0JP3mTzAk/8TlQF0ivYqAuhJFLYWf0LBUnL7d34KXj1mi87uZJlGPQr8XaUNM6RsHaXGZlb7ohlAwbu2kbQ9DDsqmX3HnJk4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdYADE78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1aLWJWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdYADE78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1aLWJWt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0WBZ3588175
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=; b=CdYADE78z/zH8CyG
	FRA32jzDGmlkiHgOcX90VEsNibqKg/uouUN9JLiWmCTe8cYgWKsizhKfQukbbUsq
	LLZx+/1Qi+Dh//KFH6kJwoOOFdS1heOaaKFHktKpOLdNugLgGTIksinRlhfJ6fM+
	m6KAKvmQsb8NadTRgzZ7Okrwi1LvB/bSttjNBdMc/jJM/oscOCjSc7ndzJBhz76K
	uBB0+EGKpZ8GUJ6lg/OnGguFMWCpNfHLMSWOq4UgNBS8kIAPWhCTRgAzDargEb0/
	Ly51XRROf1cLP+1/UDZQukfmlDs3dW5Q1JUlkAYYLyiQnsst1o1h/FFfKQKudN1Z
	4+66BQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8u63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:29:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so3154492241.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789392558; x=1789997358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=;
        b=d1aLWJWt55cLMxt8PvstfPgip3MC57q8Eme6zEjGGPNjYwwxpk0DGAKlF/95HBx5zi
         lTTP542hXhv8VjWH0a7OWA2732wcArVRB4C+VDeUJffDUDlCIfROFTL7RYVR3sjPGNNZ
         B5CoHWfTO89igDxoU6UwhuIuORf9kQUTdiNCfLqtkykInCVD0l5ZegJF89WF5/WysY/t
         6bwTQRujgfnuyZKMEyg44PFWlRiKBavG1nq5Xn5O66vVyl3b/8jeZirSu+cHzp14Jdfm
         x1cBnrQkgn6E8p+LOkmUe+sXVJd8R+oCqGWeY7Gl4z5t83wR5YblbwwPSE0UBMqzuYn5
         EY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392558; x=1789997358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=;
        b=PAq4WgGkLTkYxWbE+4s8rF1EvB+DGf+4yARaVcySZ0il5YAmz/i2lOJpUnSWbZBwry
         sCUAALfcZOwHC2u1p8iCVfkKJnXhhOdHSX3d3SjIO+2fyTOLV69mnQnye/o1+/mdfNwa
         vMHkJK1H+dykDTIp22p3Vo7BxigNXPjo4BtR3GrLu3LuDTeoffMH9xMEDYHP5fbCsHb7
         MtyYthbtmLGG9aSufi0vipIYBVMA2/i5gRXvMMpq17ENC9QApLV4AywBUvX2/53Tbn8x
         a4NiAgU8EPiN3FpEP/pe2tWgvWCt34zP60IL6XtC1cVepvZm72/0ZXJ99wC9oALVfmX4
         5u/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiuOpbUkqz92FWWySzpJdKCniniTFo7Xdv+ueYnPS9wAlKhpygYhFfPlCYl748W8NGGMYv566vaLh9@vger.kernel.org
X-Gm-Message-State: AFuF++n1kYxSaozNoh7qKdwkCokjJ/DWKaTMXpS6X/hdIQEZ++f1WBYz
	kVSvPxjkuxNLkpRC3i3KzxVbPytY9Qv8a4vVvMOiBYonJLLld2kj2mTpwoBD0Fa5y3V461pNGeo
	JbV43VZ6+MR5jqHt0ALvIR2gwQoyCeEb1Zkc1q+iwOysHEi/w2JSNEu8eVlg8Wru+
X-Gm-Gg: AYBFou0MuBuRtfKtDn47cl2t8gMTILava1nsq7eEaoXgUiFb9ST3+GHbLIzbh3sbud3
	93LQoTZzEY0YkZAWLOI/dU9gS97tbKMKx10m70eJWg/+XBrPbGh+l2Pnsfl065413Q2aABMQpi1
	iKqAxnoBWmCzL+7ZsEZTwS1YAs7kbXfuNJRo9anB3g212UI4v+bHQ5Zkujty5CgxyuzWHB/7tQC
	PHg8p+fWyhiWKuPkEVSQl5/hqKOL3xNYvxOTJ603CqJK2AF/lKJULkceTM3UcKYyI9LUS7jtAdP
	qPOLBZm2Kcs7SI+pEK46cLX3fju28O932r8S/oRC5qTq1mCkgP9HwWXNwRoQ39HvmHfmHCAIENG
	tKSLk1c5hvDTw3yBIyG8ocmOYINI3+Qxi6BkOzSbP1p8UQx+DJIEJX+4GkoW9I1MXqvj5Qz48sy
	jmBogZa5QPpMvm
X-Received: by 2002:a05:6102:512c:b0:778:f972:32eb with SMTP id ada2fe7eead31-79b5c515679mr1850366137.12.1789392558283;
        Mon, 14 Sep 2026 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:6102:512c:b0:778:f972:32eb with SMTP id ada2fe7eead31-79b5c515679mr1850285137.12.1789392557779;
        Mon, 14 Sep 2026 06:29:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3144a4esm26968051fa.0.2026.09.14.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:29:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:29:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: kavakliyigitcan@gmail.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 09/10] drm/msm/dsi: separate host link enable from
 video stream enable
Message-ID: <2wj3y5o5edya4uifambdpzh2jkpo7xpxtjgrmtvdxk3z76uty6@tuoe2vkh7p6u>
References: <20260911-ginkgo-submission-final-v1-0-0e68e63a18d4@gmail.com>
 <20260911-ginkgo-submission-final-v1-9-0e68e63a18d4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-ginkgo-submission-final-v1-9-0e68e63a18d4@gmail.com>
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7f6af cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=4I8C5fWqZRg8XWo767wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: eYcuLh6SRgQKwZRxbrW3BnFASn0OPZKY
X-Proofpoint-ORIG-GUID: eYcuLh6SRgQKwZRxbrW3BnFASn0OPZKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5MyBTYWx0ZWRfX+UZC93GQ01Nn
 mGpZZ7W7VihQcxsTd/4x+HZbceT/u4we6kPIZh0A6aJyElVXOlghYRwAMNx+rjxKaAxQCaqhhSv
 AMEMZXIyxXq7ZOR+GQ/G9V+95fO2QVj37Y1YTN0t8HSZfgllDIzgGwrNpRYpv3klLEcVZ0/2Sb0
 2tBt0YSMuIvV+rpQkj8EQHoZ6wLP6Uo9D3f8zp5RQ1P+D+LSlGgTJaiQElLEiPSUJw2fmDAwFrI
 JK4tCUkz6Xm4XgIiiAvlVzBkxZAt/4WqsQc9ZLARBXpgoQbKw1nURwhpeagJ+43dNXSIR5QyZZ2
 7sDCNHoBRPoGd95hg0h3cfdRMOAOHzcrPFi+HlfwE2uNkUFG3U2YNQIwkLRbPjRleEcFrV4K9M7
 RY+b+s/fDGN20qqqAUt/9iDl06jhO9NdfbGWRL+aYC81yUpvTc9e/trTGAh0WFIjN8qcUyAIPGh
 IU9JejwRNu1MZMF0TZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5MyBTYWx0ZWRfX+V/vzHxv8eiC
 v+Sb0wFGJGDocGDCl+m2I4zy0bNJNSoua054O0l8Oi8mbgE43R+wfv7JhTwJsDUKgONvMYDdNp4
 wH7HeSk4xPhfhsZiyxQ99IjtMbMaA+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140193

On Fri, Sep 11, 2026 at 11:51:06AM +0300, YİĞİTCAN KAVAKLI via B4 Relay wrote:
> From: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> 
> In video mode DSI displays, enabling the host previously engaged the
> hardware video engine immediately during atomic_pre_enable. When panel
> prepare routines transmit initial DCS sleep-out and setup commands,
> concurrent active video transmission causes DMA timeouts (-110).
> 
> Keep the DSI host in command mode during atomic_pre_enable to permit
> clean panel preparation, and start video streaming in atomic_enable
> after the panel has completed initialization.

I've not seen this kind of issue with the DSI mode panels. Do you have a
more exact issue description or a downstream reference? Is it the case
that the bootloader has configured the DSI host for the command mode
transfers and you are reconfiguring it for the video mode?

> 
> Signed-off-by: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 23 ++++++++++++-----------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 20 ++++++++++++++++++++
>  3 files changed, 33 insertions(+), 11 deletions(-)

> 
> +	/* Keep DSI host in command mode (VID_MODE_EN = 0) during panel init
> +	 * to allow clean DCS communication without premature video engine startup.
>  	 */
> +	dsi_op_mode_config(msm_host, false, true);

This sounds plausible, but I'd like to check it out.

> +
>  	msm_host->enabled = true;
>  	return 0;
>  }
>  

-- 
With best wishes
Dmitry
