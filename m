Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB73F0750
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289575; cv=none; b=Q/0lGCmKeFLfHt2OiQYd1raBP0pOiKfg/fbHsyttmCnyReH0TvSBGT5WOArNm0ahb4FJgVBvOuMJgCIxFEAE4B1hchTWPTx9B3kUDScDmkR/SvmHdK+nA+eIZYirB31Do+FNS0lwQX7GEzyfVyKaAQSxeXZK5jggXZ+V4XcJkbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289575; c=relaxed/simple;
	bh=4nW29ZsDPdoDfRzL0itjwADUNqk35eX/f3+DLF1LjsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVGowYW24Hc6k6lUAHi+2diW7VvUZ3BYWDtORFsdFag7lwXmXND29NQOBd0jr20lVGAvePRY9pTrItfnQKt+b7517ynGhQtGNjMxNQRezMfNe3yLNuS8TOwKLcSuGrx+/uFohYRQJ7ypXalSr18Tww1HpPyWa2kptcA1QtQ6nKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbftYt2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5yd0bMo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbftYt2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5yd0bMo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nYZm446952
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ucp0jQG/I87lDUm5pF1K1vCe
	SDfAsNpNDdsrqtrG8ck=; b=NbftYt2AnGAsdRAYG/RP6oSSbGXqghAnrkPyW7yo
	ODKly3absVdYcR5lUccwxOQbg2DQURdbvfB28aKa8OQN8JnNJv6bZzG7nQFaQdhu
	nSMAbAbHY7QMxbQNX08l2kyjZnmuiyYSWuxhFhbEsw5WcaHgm7NFsfAvfw0nFcGU
	NavdtmBQcqaKCEjUuPY87zobfIPEzoADgEkGPn+1nhogFX+X+/qIYldP5BpXSUDa
	qQvWxQIbI1Q3k14h2mLkyJ63mzTuaw127gM67mA7BX2dxnMIRrLGtqD2wzPx9nGB
	RvgY4OR8vOLJ66GAH6av4oVNy44CLPSfJp9ixIjKDt4wNg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrh6xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:06:12 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcdeac07b1so14125723a34.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779289572; x=1779894372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ucp0jQG/I87lDUm5pF1K1vCeSDfAsNpNDdsrqtrG8ck=;
        b=j5yd0bMo/Rxtyf9yV9RaJuX/ESdIcf7EutSK3iK7QMYfnBN4q1kvgPhnbedSjTQW+8
         PP7SonGHuJOl6Hsv00Tp2qYrYPOV137LfB5jlvlktascQMiGPqXwSGzSlL4eJaz09MaO
         V1ZUxViJ8dpMMIOUw+I4J78WzH0jBPfzrI+ns1FHqVmDHydMCy81olKswX4rgUuEDepm
         41m2VUCOKPacOqOfLCNEMyZriJIduBdc6JmnJ65CG1rM2qeP0X3t/tC8DUWkVvmXYVcS
         ninj6w3zTFt2KHyldkpZATWrq8jAuWnFVdVpRHPcXtoTRLQ5y0lNQtP4dGEzXJUayQow
         kiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289572; x=1779894372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ucp0jQG/I87lDUm5pF1K1vCeSDfAsNpNDdsrqtrG8ck=;
        b=tNxNEZSTIIGRhE5we0HDimewHf6qk7M1Psa9nYA2R+OtmjoDuG6bSL6Xn4QwzmHO7P
         IZedbkvN6QXtZ+YtdpELIQBKYc1d5nnOdw8XFv0xv2Zm9KbypamqsacUUAZNXKpGcefF
         X5UMSxHFQU5o64SA0HJztTT0pjQZhefPWAIYTjB06PQOhkZaMlDK9bYZhzJyq3GJFccW
         gZkHVhQb0PxFUc1GcJF7pTogYW8B6hcxvJHiTTZDusvPiSNxLX8Z+wZtty2iWVWjaeD2
         n9wP6YlwOR7uYnmeUWUwQC7hz8CMG17a8wfxYKR8V29cGw6M0tRqZbTKJoghA41QHKAL
         sjYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+v65QpeIBohecgOIbzrNLJEeekQ4PYRCNJVh7zNXkZ3pBq17BoGe0YJqtJlceQd5Xv1swMMELgLgWU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw20ngRqJsR5YLu9o3cvzoaYHqxCnI/uzQE8CfYra0fewe36RSI
	iOwjQ5iXXovwPlnvIX78z7AzMIp2jQWFEiVyGivCnMoUDjM6nzw3OR6eReLS6XwrvWQ2SQaEohL
	eRjJxlbz6sOPlpcd18CZzQpVGFqcQ9hHBwEJPswba16A5v7lD7GxiCOb5TZEV+mOL
X-Gm-Gg: Acq92OFKwSjiRcQxnq3DNJ+gR2cBeaLG+BiKhVvrPzXcK6lmvIGke+LNrqrKIyAkRU8
	eF/6ejeKBGeEvQ77QkF5g8LT7OxUpOtyFKTp8goqcP762YsIiFKsTOeI9dkypZcQnrGXtuTM0OQ
	5qSi0JH4haqnGD0kZMNqjoWHyFxdIAZQpvJav44l66QZDyCsfQ5vTNt7EtikRKBzCeBFEMNKuzM
	KPs+bFOjHdFVGNeWq96t/ZwPntl/a3f8oZ1rRfPQx2NfW9JbjOsMnfg1YHgvVPJLaZ8UwQieQQp
	KIRGiTDpMtlialWkrqV4DJ9hGriAKuUcONSYsQHq+8mNL8I3YvJ0oAhU4DYu3By2CuVn5rPfY7Z
	XxIaYKlAVHQWta8pv0883jxWCCc4+Wg2ImTC3dVmRcwppcjoSTV2GAKWMQNrQZshAa+xU8RFylR
	IoLYBgkchAYks9C1rRlchAfgs1SHihhnyyRqA=
X-Received: by 2002:a05:6830:d0e:b0:7dc:67:8c9b with SMTP id 46e09a7af769-7e4ea020074mr17292017a34.4.1779289571671;
        Wed, 20 May 2026 08:06:11 -0700 (PDT)
X-Received: by 2002:a05:6830:d0e:b0:7dc:67:8c9b with SMTP id 46e09a7af769-7e4ea020074mr17291981a34.4.1779289571165;
        Wed, 20 May 2026 08:06:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc0ccsm5056179e87.41.2026.05.20.08.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:06:09 -0700 (PDT)
Date: Wed, 20 May 2026 18:06:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
X-Proofpoint-GUID: 9QMqIczlPyYtNfc5DgMs1n0hoa10Gtp5
X-Proofpoint-ORIG-GUID: 9QMqIczlPyYtNfc5DgMs1n0hoa10Gtp5
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0dcde4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3AD8K0hoVNDCmrBz8twA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NiBTYWx0ZWRfXylVVs37NQnLn
 fkYJjVHPu5MP/ImfRAdPalLwnBwfM+EDKyEwzHYLriozAwEJnGwNYyf3ofUsPOtVEKg8epdpyNu
 +UHVNoBO9XW1Vxo66WFN5MNBeRNdDQ5A6izLpigpq0ZfXcLZPVpCoVIyMO4KBm5l926jUaF066Y
 84riqyyixwxdFfXrUacGpWQIiQIkBBAv5e7HPPF8TQidPwjoSnCuX6QR54sUnbA94sXX89OS3VF
 VR08VHXIGcDwTOn6gDpRx9rklqTFPNNtiC4qNQT3TGLXNbkuYmxx0s8LDw6+n8CdaFivufsGN84
 BcbDC6+gN7DIra6kCWPuScFpjQO29QlNWDfaEVzGbXCDBkG8pmsVStdgWzEjWjr+DgFbw7TakJD
 /tL59Dn+OxwXdJiSpeNvgPsVPT4Y2t+W7v2b2Xxc14vT+sBZlY5f3PWnFmBLdvG2Eycgp1h6OQs
 ulUW4rcD81LGjXbp8Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200146

On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
> >> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> >>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
> >>>> and DP signal processing capabilities. In that architecture, USB3 and
> >>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> >>>> The DP part is roughly the same as on the instances without USB4.
> >>>>
> >>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> >>>> Only one USB protocol (and flavor of pipe clock) can be active at a
> >>>> given moment (not to be confused with USB3 not being able to be
> >>>> tunneled as USB4 packets - that of course remains possible).
> >>>> The DP PLL is still used for clocking tunneled DP links. It may be
> >>>> turned off to save power when no tunnels are active, but that's left as
> >>>> a TODO item for now.
> >>>>
> >>>> Due to the nature of USB4, the Type-C handling happens entirely inside
> >>>> the Host Router, and as such the QMPPHY's mux_set() function is
> >>>> nullified for the period when USB4 PHY remains active. This is strictly
> >>>> necessary, as the Host Router driver is going to excercise manual
> >>>> control over the USB4 PHY's power state, which is needed by the suspend
> >>>> and resume flows. Failure to control that synchronously with other
> >>>> parts of the code results in a SoC crash by unlocked access.
> >>>>
> >>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
> >>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
> >>>> submodes.
> >>>>
> >>>> Thunderbolt 3, having a number of differences vs USB4, requires a
> >>>> couple specific overrides, pertaining to electrical characteristics,
> >>>> which are easily accommodated for.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
> >>>>  1 file changed, 322 insertions(+), 70 deletions(-)
> >>>>
> >>>
> >>> Overall it looks good. The major question (after looking at TODOs), do
> >>> we need a separate submode for USB+DP / TBT+DP?
> >>
> >> The problem space is as follows:
> >>
> >> After a TBT (collectively TBT3+ and USB4) link has been established and
> >> we have a link partner, we may (based on the HW capabilities and user
> >> config, such as kernel params but not only) start or stop a DP tunnel at
> >> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
> >> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
> >> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
> >> as a separate DP AUX host)
> > 
> > So far so good. But I still don't grok if having a DP-over-USB4 is a
> > separate submode or not. I.e. I see code (and TODOs) to detect and
> > handle DP going on and off. Would it be better if we specify that
> > explicitly?
> 
> I really don't want to end up in a situation like we have with:
> 
> $ rg _USB include/linux/phy/phy.h
> 29:     PHY_MODE_USB_HOST,
> 30:     PHY_MODE_USB_HOST_LS,
> 31:     PHY_MODE_USB_HOST_FS,
> 32:     PHY_MODE_USB_HOST_HS,
> 33:     PHY_MODE_USB_HOST_SS,
> 34:     PHY_MODE_USB_DEVICE,
> 35:     PHY_MODE_USB_DEVICE_LS,
> 36:     PHY_MODE_USB_DEVICE_FS,
> 37:     PHY_MODE_USB_DEVICE_HS,
> 38:     PHY_MODE_USB_DEVICE_SS,
> 39:     PHY_MODE_USB_OTG,
> 
> >> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
> >> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
> >> (and each of these routers is hardwired to one of the PHYs).
> >>
> >> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
> >> super high-res display at one of the physical ports, or a long
> >> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
> >> we would only need one of the PHYs (associated with the router that's
> >> wired to that port) to provide a DP clock.
> >>
> >> This, along with the normal (logical or physical) present/absent status
> >> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
> >> or something along those lines to toggle that bit as necessary
> > 
> > I don't see phy_set_opts(). So maybe a submode then...
> 
> Sorry, I misremembered the name. The function is phy_configure(), and it
> takes a union phy_configure_opts, hence the confusion

So, phy_configure() will be called for the DP PHY to set the DP opts,
but how do you plan to determine if DP is on or not? Or do you plan to
add phy_tbt_configure_opts ?

Another obvious option would be to set the flag if DP PHY is being tuned
on / off. I don't know if that fulfills your needs.

> 
> Konrad

-- 
With best wishes
Dmitry
