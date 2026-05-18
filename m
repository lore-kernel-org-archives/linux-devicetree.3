Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7704779BB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118699; cv=none; b=P2nYrrZvUhWE2+ohLNPXr4EUkvfF+1qNR1VdHj0fM96UVLqz4ahMd5M5eF6m3rRwDTjoDJuqKpxXPahOcaONxjFzK1LVOREoVOT5/6fhedO17Do6NGK6rfyX1PJNVTohDAyl/2pZMwesdRfdQOCajsgSEcpkwnygz2sdxv97BYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118699; c=relaxed/simple;
	bh=Ez5BPJqKfI1OCt/jDfjKzG2ZdFJrrCuxKH2eBUqW3bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heqiFxVD0ZGVnKmHJM1MIeyO98szL5tGiKGQmh0yrenFGhrygzJYjLLC4EvAWF9xu5XnbONPZqTMXW7cQbbNQjKiIsAXLZbF8hyKYSkftvUqnXzFqyRO3IMdcXI3V1Vd9l+wsbNlxJerTtzWg6/JHLUtrT3/+3Ybi1iW9P1IP5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXQkjpz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNvL+Dp0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXQkjpz5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNvL+Dp0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDOK9l2188790
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DvFJrq9I9ABC+0ql4mQB26et
	oExjY4fLiuus2BHf9CQ=; b=FXQkjpz5bvBvwsTw99Vs63ysooJb8eRAsiehkzTG
	nKwYg2GpZSipNyc3Y2J7drn2N9gMjURjYjmJVl84zYTZtqw5mZFdvqVSOMOCSLYG
	TiM0zc0TrngUSKhAb0MdTjLM7wRK4eZ0VkiiEdyi6LBExoL9tm0sb4YYSk2BsmoI
	1LXxww/Gofh3ydIyIieXncsWCheEy2tQ2rjrTFGBj3SDM2nfQyjt35+syylQ2VV6
	dQg4zFIdcpJWs6NHf/QFfkih3Xhi2cxG5UU/dp3i362UN83WabZPKmMp3oH5gtYe
	ir6JJG0M5EZKNHVpqbkeSPKVHP16hkAvlbwqsPkdQrirNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xkuhx5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:38:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57525c1ed46so1611376e0c.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779118695; x=1779723495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvFJrq9I9ABC+0ql4mQB26etoExjY4fLiuus2BHf9CQ=;
        b=PNvL+Dp0mAaHSbNrimNpauhEI2NVYhv8BdOWNDuP3mcc9GQ+XaB67kS0s575l8Hc10
         cRtiTqd+Cg3zHe5NMr7naqZKIUyTXWzlYayNYVGxXdS2vcWEWir4NoicyeUKaDphFK6g
         oas9NZfvAX0/Tbc00Xn4DOrUAl+oN3+bTUoi8Dk5B4SUgsJsuRut3NXvaL7/lNtaG7rQ
         VKHXD+aN7/uOqttmGqIADG1PzH5GUOcwHKQpwzRylG4l6b8ltUZMzFYGkPYoHlZT3ZHI
         8WFJqOeenfkayWmtA6PSZFcfF8tdIb2DAWfSD6yUJVMBcJwZLL1mkVSELSGmYiulTSrX
         HiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118695; x=1779723495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFJrq9I9ABC+0ql4mQB26etoExjY4fLiuus2BHf9CQ=;
        b=gkYMiPXpU3hHSjWXoyi31BRg+jf7rd7AqJ6e2FGqtTEIA8kA+j3zjDL54xczdwfu62
         Lq2GIxF1cQ2o5sxFNg6QfiQ+tjgxbFoRJARYXHPPab/TVX5mr2eYkvCdd44ckZHZantV
         xjwDCXvq5ZwfTE+MmHzHdy9yR3dWcqsEOOnlXSFsqySGGGN8KTwOmyr0P3HKVPdyU05C
         Wby5mmCdYbLnEC3N7UVbNaCEoB80SL4MH4vj65xcIpW46tre2iveWzhDQooLK7jSIw4B
         y6fAOolNQwW9O74suhWI/v42bsSCpfA00+O7UwwLwahehq96gGr1XVKOmhNvjyPg9BCC
         rd4A==
X-Forwarded-Encrypted: i=1; AFNElJ/L9dd9QodV5QKKtJXe1nlSjIyi9kMwAFoZxaiaQ2VBlpTbVTp59d4TBRqCEReeec+WfPSxyBug82dD@vger.kernel.org
X-Gm-Message-State: AOJu0YzbI0pdEP67hwEO1aWYo0qEtUagXmbepIn/TdSgsvHP+ugrk9qh
	h61cjKCLnyYrtg96DE+GqWODF+SkWLAQ9dHNzazDjCm0iMtSg0TYh79NGbT8pKnvMXcXPZa2Ecx
	1SnYPPG4DPX+DQ+mFm0dQ4dXhvP3UlNlrJ5suWUiF36/jtbfytoEVbR8COvW0ufj6
X-Gm-Gg: Acq92OHBNNmwWrSerPtCvdzULgyJwGCi98YEwWUUZ9st5bk4BY3DXRso8sXkaSnFrvx
	UirjmJg1g6F0vVybMmD9+Hxvis1Hm1QE92bsiFQ+G1USAvHVCghTi4mNO6kZtphfu/FZaAUpL3x
	rW0adEOUfe6bk0zY/4wHCE88hYMgfVhaAXodtrutNMtfiujeyaWWOQF2h88xFt6aQOdJgf+0z3R
	4yFIgkSU+I8Q8SNBAFn0eWhGB3t5zxAxAKY2/VBLsk/8jORT4cUzwSqxxM4ek3wf7DvLYmXSE1R
	JC9YL9wiZVQUBUzAbxzWYwiieWa2SLVo5qh5qz4Umr5o2YVkKkspUumn7EQ4N5MTtPdDMRCa9Qz
	KIRHVxwvOpEKozKw3CQYKa0tLRfnBnspCT+2w34RBKvev0cFV8DeBA7liPev5wBL5BYjfcodklS
	9tE0l2aHdwDvwZPLNcTQeAe+Kjpxl32Twq6uxaeHM1CCMxgw==
X-Received: by 2002:a05:6122:f93:b0:56f:1ea2:8609 with SMTP id 71dfb90a1353d-5760be3dda3mr7944414e0c.3.1779118694706;
        Mon, 18 May 2026 08:38:14 -0700 (PDT)
X-Received: by 2002:a05:6122:f93:b0:56f:1ea2:8609 with SMTP id 71dfb90a1353d-5760be3dda3mr7944368e0c.3.1779118694043;
        Mon, 18 May 2026 08:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ffbbsm12931391fa.27.2026.05.18.08.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:38:12 -0700 (PDT)
Date: Mon, 18 May 2026 18:38:11 +0300
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
Message-ID: <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE1MyBTYWx0ZWRfX4UryiNaQih8X
 utUTNiLYXGP7yrin+/t2qF4FWzWvaWNWasxCQ1VpHOCUNoni4JiTauFNYzs6EVc3dROxZn19ZEw
 3alxbfOFQbIyftdIl7/wOdAJcCvX3TzZ912v9ivFoehTK8xuLAEjymHDoSLh9G9/Z4rg6dQ2IeI
 v/+wUhV5MvM/PhNbvZhyVYmaIJYK11zcmT7MIoFEjwK4P+cxwYUUkbuZkOXDiNa9bQWgjSRB3/C
 W7hkpLKKoJnWmdd1n9ph+bf7sHLtPyIDEOtfTHbKijkKABDeiH8RR/uuwl0QCmLUYhWh7V3IeTM
 1VPy88mBR+rTismMkrlg8uRVC2j2MjHqK5bJwGU0hxSn3p1HGuGaXHwZdvG4JQ9u2bXO3yAtIEE
 uqr7v9FDO3R7OtUOjGcprY0CCj+dEdo7TZhMcfoB7M5KDd95rfRrbpG9m8NFXCHj+29vf6kjnZx
 0eRXglIXm3I7yqUg5Kg==
X-Proofpoint-GUID: ZMCUpqUM_QJ2ltni631PUIERhGfkH56z
X-Proofpoint-ORIG-GUID: ZMCUpqUM_QJ2ltni631PUIERhGfkH56z
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=6a0b3267 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6j7keePVoSQmJ3wzq-MA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180153

On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> >> a flavor called USB43DP, which as the name implies, features USB4, USB3
> >> and DP signal processing capabilities. In that architecture, USB3 and
> >> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> >> The DP part is roughly the same as on the instances without USB4.
> >>
> >> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> >> Only one USB protocol (and flavor of pipe clock) can be active at a
> >> given moment (not to be confused with USB3 not being able to be
> >> tunneled as USB4 packets - that of course remains possible).
> >> The DP PLL is still used for clocking tunneled DP links. It may be
> >> turned off to save power when no tunnels are active, but that's left as
> >> a TODO item for now.
> >>
> >> Due to the nature of USB4, the Type-C handling happens entirely inside
> >> the Host Router, and as such the QMPPHY's mux_set() function is
> >> nullified for the period when USB4 PHY remains active. This is strictly
> >> necessary, as the Host Router driver is going to excercise manual
> >> control over the USB4 PHY's power state, which is needed by the suspend
> >> and resume flows. Failure to control that synchronously with other
> >> parts of the code results in a SoC crash by unlocked access.
> >>
> >> Because of that, a new struct phy is spawned to expose the USB4 mode,
> >> along with a .set_mode callback to allow toggling between USB4 and TBT3
> >> submodes.
> >>
> >> Thunderbolt 3, having a number of differences vs USB4, requires a
> >> couple specific overrides, pertaining to electrical characteristics,
> >> which are easily accommodated for.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
> >>  1 file changed, 322 insertions(+), 70 deletions(-)
> >>
> > 
> > Overall it looks good. The major question (after looking at TODOs), do
> > we need a separate submode for USB+DP / TBT+DP?
> 
> The problem space is as follows:
> 
> After a TBT (collectively TBT3+ and USB4) link has been established and
> we have a link partner, we may (based on the HW capabilities and user
> config, such as kernel params but not only) start or stop a DP tunnel at
> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
> as a separate DP AUX host)

So far so good. But I still don't grok if having a DP-over-USB4 is a
separate submode or not. I.e. I see code (and TODOs) to detect and
handle DP going on and off. Would it be better if we specify that
explicitly?

> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
> (and each of these routers is hardwired to one of the PHYs).
> 
> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
> super high-res display at one of the physical ports, or a long
> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
> we would only need one of the PHYs (associated with the router that's
> wired to that port) to provide a DP clock.
> 
> This, along with the normal (logical or physical) present/absent status
> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
> or something along those lines to toggle that bit as necessary

I don't see phy_set_opts(). So maybe a submode then...


-- 
With best wishes
Dmitry
