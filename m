Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C371C3318
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748017; cv=none; b=ZnNs6y26F50cm0+rKyJPrlXpsV3gF/LhKPEquxmJDmjiZAv1kXKw13uERcobkbEA3eLBdGOuwTLmuq58mzTLDD17PZr0wW7rSaZDnp6qgliIXUwMCNZ6vere/Im89jpdvlNC5JIkXZaPbnkecHl8+EkK99j1/93zdYNIyHXB9IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748017; c=relaxed/simple;
	bh=wZKSA5a9f2Sovn4xLrrhWJwAYYgvMB2xCPCl1W5rkGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAnmCRzjrv+OlakE6EFoEAkAFjNwoOTM7cL7Vwf54ECmsV5GxSXBFP438dRNsRLWSs4SvrqjgPfRKkXcUq0+falmIxPI55D31GFgj2SSoEGGg9oidG7pP/AXz0euHFO/hTidgtxIqBE0e2DNBAYS+2bTJUrCa3liKJJsU583eKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlVCOqnv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrYC61sU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlVCOqnv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrYC61sU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHIrN1250779
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SqtGoBVXuWmBmxq+hyY5Aee
	WbM95T5UuiKyeUwR3/I=; b=nlVCOqnvI9dHtCJhpU6XQbAxyVBFHxyqOtS3JuvI
	rkARy5cPLRffcwuHgYNaMS6xu+CdLUfa0acd6SWVE+qiLP1UMRVqx8g1E7ntTs8f
	99jmN4IiYBOIo23znWntO6wRixUgGKJmzc+OACjiiEKCix0YBh5pj58P76SSa0wx
	1+F6tEGouLiTpaJQesrbCXBVDfrfchaCxsZ/4A0/oo846MDDWEzFBRRYaZFMJiNy
	45yZZtiwF0n5yo+IOV/XhVG8oaMxUOHqrHjPzHCyBVdzdH9scRA2Ys2wZBFRb5MV
	CjYBn25wl+UY17Q3Tr8tdjtaWyvUXRBv9cMVJymKNhOWuA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf175m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:13:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso1418959241.3
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748014; x=1781352814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SqtGoBVXuWmBmxq+hyY5AeeWbM95T5UuiKyeUwR3/I=;
        b=KrYC61sUAf3l/oRXC1OdJws9ZUGIIldZGBhCsAhZxwKGvts6WgOMHoJ2Z9IQOdATY6
         bus1EKxmuaubY7pU0l41lYta2PeRlSrFZ04dkD3Lsx1ay8zhKlZHIczfJoDvPHBQJYDt
         gXVqM1ojze91BsqT1fhilQ/7y6PQtvaCIDg7xUqGJk+yECzpn8ximAT8S9xYIUvHQ0iC
         t2nkme1p0Gd8SPLz4WrQwAKWGiQOwVowU9SpJv8eA9za7aXAd/q7Yds0diGMsO7it58w
         sgWQVTPqPuqMGhkYbGQ9/tsJDC4o27P+JTTbjZw5szD+GIadUEGU9PT5P9bvH8VnOleT
         AyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748014; x=1781352814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SqtGoBVXuWmBmxq+hyY5AeeWbM95T5UuiKyeUwR3/I=;
        b=JJjvU5KOTv6GChXUgXoE/vujWR1IV0reute0SudMAz7GZIHEyYqw+LPqgC0Ev9skES
         rOdMzj0K5wRwAIIq1UKnsT55wjoSHI2eTSYJhzHr3MZhGxMNV/4E2sECudiNMHa19D+a
         aqg+KtugxKjXoj+XtnujNzXaO5lerqfnJN/xMf3R/BTG0/hYqYijWqH9YST8v49/7jxu
         f65Lu830c5YzxjhlAu54NteEydLsm4N51IjQN8MCYvzBNGmKihW10SG/RWtd4DNU01o4
         ti0iqqjzu8LYE7rNbjoyeAhRiwbf37kkT4dnaF+p4Ok2udYwMA0e4soa3CmoLJjU8p4x
         3HTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wSJDwa5Q4jQWq+18p5sPqMqbRj8zExccfLFKXmOvzjs1GaQwjHgiLEy09Ep10dc+wu53VpBRp91x0@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3kVFyLxpa3IPQAFtmqCDd0hElhbY28u/uds8nibQaBA+JZgW
	NmUJ0EZ9mnlFHfr9Gc+FqdgB0gNXEjIkNFKcjXYZrUFKC/tI7YzH/YsQApoY0Nau3i3PvQ4SXN8
	QU6o5/ZlvzdYGtcwv7njgX8RR8mIAUNiYVWAQQ/WluxJtJq8eMsTP7dFFTo5+8y+r
X-Gm-Gg: Acq92OHlujN5XoX4Eb8ygUSBYm3Z1IvF6Pw1HpbP9TK+fM4K7HMs7Sjht47MpQz+AMg
	yxqBt4R3eME4mVxb7uFymq1Tcp5gt+cbdztF76GhXcpkBKEv6WAxKmB4ZO91u8Sz+xZ/3A4L5IV
	rc4v/qiwIPveLReZBkWHRwgbhsdy2XFqL91f4k4GBaq+wNLfBE+C8wb8d1lPqb6pcgD+Gj11W+Q
	1sFe7JLMlKQnnivMS4D7nhIkaGzQ+Vc58G56mrWdYzTHB/1scNoBZIqmjlZzUxG57saRDQMdDkW
	d1eghoLwgVAcYVTdgL7dEb0fc16NUEK3tsskDJEv/oog30uMF4Odr/hs2h4MntLnTY6Kiy5d7II
	TICrfViBwFGlefAQpSaU7mhZuWZExt2YweNBP4Cm7A3DB3WQgzZKJalMdFmBu4oqP1xmV3o/QS9
	G/A+YyiLIc4YJwcXlJq0N4oF0uV5zXOFcVyxqGypxpVc7Kbg==
X-Received: by 2002:a05:6102:148e:b0:6a2:b441:e0e5 with SMTP id ada2fe7eead31-6fef20ffc89mr3999891137.8.1780748014368;
        Sat, 06 Jun 2026 05:13:34 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:6a2:b441:e0e5 with SMTP id ada2fe7eead31-6fef20ffc89mr3999874137.8.1780748013932;
        Sat, 06 Jun 2026 05:13:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66ea9sm30824371fa.2.2026.06.06.05.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:13:32 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:13:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <aiQO6RdkqVnBuzp6@umbar.lan>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
 <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
 <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
 <a5313752-17ef-4d00-9f61-7717e4f06982@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5313752-17ef-4d00-9f61-7717e4f06982@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a240eef cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=IV4c8OSHAAAA:8
 a=t1hzSAPpwDwDAyt0_CQA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=Q6n48rkgcAvIKCAITAMI:22
X-Proofpoint-ORIG-GUID: nhnAbpHfJYX9hmlkVRaNnk9MrICrAitP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMCBTYWx0ZWRfXzbxOLkBWZ/1g
 ehmX90BrerhuqrwxuzAW/ZBh+CBIOYZGC24SdKDoMPjkKsEzt1+mxEFbMW653Fibapa2ewzH88E
 8VE67nwlLtKvk0ze4Kz6Qiqim8c99CQvr/euZqWpNgQb5v+KcvbB10QGW2wZ0Opeor4z/dltZee
 yQeBFW3meim5ZJegAvP/Wc2hLLmVtINmNxl58pyCXlXJD7LSLNGZz1iBloowiYPbCCFxEh9Hhg3
 Bn+4PudVjw9mE9illPKrsXPK4Cm5/jumiqd4pKFi5HWPVQ2UIN7cdlZW3V0Vunwbt7Gfa5Dt7xP
 pPqOIQfMxpD5MV8ayCIg4iws2uJnPZ7OEh97pPwEMvM82qoVBDQfo2OsC1yiZh8m4/lC+hNJRdb
 pFL5p+BP6Kvv57LyHvajIhOmCYvasSnWiDDR4IjCap26+xw1GAX/KOA2mswLI3XXj5AuPeDnCpa
 HAeO68WVdUKx8k6+MrQ==
X-Proofpoint-GUID: nhnAbpHfJYX9hmlkVRaNnk9MrICrAitP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060120

On Tue, May 26, 2026 at 04:02:45PM +0530, Arpit Saini wrote:
> Hi Krzysztof , Dmitry
> 
> On 5/20/2026 6:56 PM, Dmitry Baryshkov wrote:
> > On Wed, May 20, 2026 at 06:10:57PM +0530, Arpit Saini wrote:
> > > Hi Krzysztof , Dmitry
> > > 
> > > On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
> > > > On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> > > > > ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> > > > > The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> > 
> > I can't find this panel on the DLC website. Do you have a pointer to the
> > product page?
> > 
> https://v4.cecdn.yun300.cn/100001_2012175013/DLC0697AAL21MF-1.pdf

"Invalid referrer"

> > > > > 
> > > > > The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> > > > 
> > > > If panel requires it, so should the binding.
> > > > 
> > > Ack, I will update.
> > > > ...
> > > > 
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +    description: DSI virtual channel
> > > > > +
> > > > > +  reset-gpios: true
> > > > > +
> > > > > +  backlight-en-gpios:
> > > > > +    description: Backlight enable GPIO (active high)
> > > > 
> > > > What is the name of the pin in ili7807s device?
> > > > 
> > > Display daughter card has WLED driver as well as LCD bias driver.
> > 
> > What is the display daughter card here? Is it a Qualcomm board or is it
> > a part of the panel?
> > 
> > Also you wrote a lot of text, but you didn't really answer either of the
> > quesitons. Is there a GPIO on the panel connector that enables the
> > backlight? If not, this is some external supply on your (assumingly)
> > daughter card. And it should be modelled accordingly.

Still unanswered.

> > 
> > > 
> > > The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming from
> > > LCD_CABC output of the panel.
> > > 
> > > DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN of
> > > Display Daughter Card (DC)
> > > 
> > > In the display daughter card of Shikra ITP platform, we are not using the
> > > external PWM for WLED driver. But connected the CABC output of the panel to
> > > the WLED driver. Backlight update is happening using MIPI DCS command which
> > > is driving the CABC output (i.e., PWM for WLED).
> > > 
> > > Because of above HW configuration, we need to enable the MIPI DCS brightness
> > > update on this panel. The below command of dlc0697_init_sequence() is
> > > enabling this.
> > > mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
> > 
> > So, this should be then dependent on the presence of the backlight in
> > the DT. Either it is a panel-internal one, or an external one.
> > 
> > > 
> > > 
> > > After checking this, I realized that this panel can be used without the DCS
> > > backlight as well when it's using PWM based backlight control.
> > > 
> > > I can add `has_dcs_backlight`  in panel_desc and set it true for dlc0697. I
> > > will update bindings and add backlight as optional property.
> > 
> > Why? Use backlight property instead. It's already there. Anyway, you
> > really, really need to describe the panel in the bidings. Not your
> > daughter card.
> > 
> This `has_dcs_backlight` in panel_desc will serves both the purpose, as for
> our current platform constraint , we need to create our own backlight.
> But this panel can be used without the DCS
> backlight as well when it's using PWM based backlight control.
> 
> So in this case I need to implement the backlight as implemented in
> panel-novatek-nt36523.c, panel-himax-hx83121a.c.
> 
> with this implementation ,I will remove the backlight from the dt-bindings.

Much easier. Call drm_panel_of_backlight() and if there is no error and
panel->backlight is still NULL, then create your own backlight device.

> 
> Please let me know,if I am missing something.
> 
> Thanks,
> Arpit
> 
> 

-- 
With best wishes
Dmitry
