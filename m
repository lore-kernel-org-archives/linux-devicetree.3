Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0135B63C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883167; cv=none; b=rSFf/WO4CKD3BAf87rG0jv/PPmBcDrdB2Kh4yFuQfRufAaJdiJ9mfM7pxvNenzBfcFY0trpdKkymSp4MqrBUthTaglYMetTOoLMKA0daub99HgJspMafWNJZMAPHOXm/P0OKUcEuO3+NBzX9Ga4TSfEcl0RQo/7eZP9Q3GKtg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883167; c=relaxed/simple;
	bh=Byw3HEJI3dZ1MQ7hAoE4nHm94wBBnYmzNPkcwewTFOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkB1+1Vc/dXNtI4ptvcZLj7tKbkaq41yBhuOl7vYaNaXjY1Uv3cigkj8h9ZGASmVJ9/7fPm5m+XfvkmGWH6rEcGFgQbE4C014j65JfOGoc54ZxFeVMpXAuaPJWtSfGIUPVuVyp6KyCCEJ0z/vpvIpgqbV4TGdjJxA0rVCoNcYMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqWJg5M/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5w7LUQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqWJg5M/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5w7LUQ6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3kjg2012125
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2/vpE66mfP4uz2lk0mlRo3rInfiNHI7eH+lPLc4PcM=; b=hqWJg5M/6x/mZMxg
	7SfUXFlyQ0G0yDUtaUTFyiAdF32HQEy8l4vWAQjMhzkY4/qxfiu21cT0xJFAVLoD
	t4WBzmefAxtL2XuqPXOe3lEIuaqoGyrkXbj50cdYI9JWuZnAfPhpkoRs1D7ZDm/K
	c9z6k0s2akjJFRTxtQp3mzONWUzd3/Ly/g+F2KZNmVwy5PBOEiYeR/cNZIgKpDM6
	vrAY+VvzftcJnqBDP7Tl5vhD1k275VphLgdHBr1sMl+ZFKyZQhrK5buAwJS+prAG
	OZ+ywHew/K/w0H0pR2H1WC8gy4LNJf0TiRAZ+I+3vuAzZdme3OdOKOcKVsdaDg4k
	zc1uBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h78jmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:39:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso157219551cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776883163; x=1777487963; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2/vpE66mfP4uz2lk0mlRo3rInfiNHI7eH+lPLc4PcM=;
        b=Y5w7LUQ6zTI/swczFWazwCK+rit/LahYEGmh22BReHe2PSQGR4co3cUIpWiLY9RaNI
         nzCQVRtCdurcwX26CMjuwEQ4rPuNky0cABQhhiEKmKgyT+ja7faaCv24xdtcG/1HLKm0
         yjuIArSpqTj4trvoSHrH9iPCdp7oM60MzbEbwDxc4/lCm/R0Ql6lrsVcIXAKA7lLYTdE
         BdP0qopPUCVQG/lzuIlaVByZJqm/0iMpByJzaXjmiuInguWlnh5E8BBuON1sr8xAEN+I
         STeItd08G+jyEfQ/H+aHiAWkH2lw7a52n/W6BMJrOnR/Dulhwf5RQAGmt9/ujt516HBo
         lBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883163; x=1777487963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2/vpE66mfP4uz2lk0mlRo3rInfiNHI7eH+lPLc4PcM=;
        b=ljpjZsn+B4X+PlamynmSNQ1BCCcBPdTQntfEE4QGCC7m51qg/dfr6dPsJl7xL7eu4E
         tvtiqblGcXORxA9wp+N8M6FL2iomLNHwQ3zIQ5S3j8UK9JB2V/OE1Iacmi3MGJPVa/Bw
         qSAufKEN45G6DSte1IF+ZCvfpznE4TO4l9keDOxb1fXcU+KoR9CWFQWbBflCufe8Y8mI
         fSu/bwJtVRIew2y0Wjn3CVBBftAsqmB+mAq8LPNaIqM6xnneLqZ62vnvNWqWnqWgUQzd
         wa8mV08JQpoX/OHn/+EOtqXqslmThNJ4ncvEhM9fLalhjMjIAdbQ4KZwdIaC6UkYfOZ8
         mQaA==
X-Forwarded-Encrypted: i=1; AFNElJ+jNH6wp64Mq/E0PtoHXMFiG//UywWy1hRkjvb3RFhDDReEklJtfniiGR7ec18u/sns15hIuoaN8GbX@vger.kernel.org
X-Gm-Message-State: AOJu0YypmFKD/8CMdXpGIROatZkgWlZOT6u7+NNFs0ytqNgmVvIAecpY
	e1MmjwqoI/qaenJwJlxEqydo84oaEsn+UzEQLoMg3v3fO/Ic8IGDXdQFCPEWT4qg+85cgQvlNnn
	Kl+cagWrG6tiyxNN0pFVbGApp+gwwHZ23tWWN0fFYq+0mlU95CN4tMAp3AlfbfUxX
X-Gm-Gg: AeBDieu7VEurM6N2Q7zAkcSuzlwC6aHchPIuBTIqnXrF1n2+42tZBtpLHnBlgfi+tV2
	1v4tuWXUSYqAKM+O2ZUwiJb1RiI2UF96at4NbA4gMkTZx60RgdeEgXocJWfFa0iuSBPEP8cjuu8
	Hk7UWf7Q8ShmVAB7zs6zpPV3uONCx6CNC+wkTeahY/fmJeTTRuU2BXtocGGi7IgRLAxQl7e6NaG
	8guqdduEwppJ7+zjFunPD/TeomGG85sWB2iAzqO1MycU7S53ugraQl36Qs7q/SgjQIrs/o3Rsrs
	d+ts9pL3Fivhb/p8QpjdqCZwWIQG53r7O5iUu/2FM2LH6rJvEKxfHIbec9NfGKygeMJw5xQTArw
	vsPcP+RctCsOeOJSn98VqGBmm2efeLnERskEIChP/dUt02KBgKdnjti/aB9+vrm77XQAWlDBKLM
	kpzUmpNR4AANzV9YSpr+GdFnJ8chcpfK2r1yL5SJbXXX2LWw==
X-Received: by 2002:ac8:5a90:0:b0:50f:b2e4:ec8 with SMTP id d75a77b69052e-50fb2e4127bmr129767271cf.7.1776883163066;
        Wed, 22 Apr 2026 11:39:23 -0700 (PDT)
X-Received: by 2002:ac8:5a90:0:b0:50f:b2e4:ec8 with SMTP id d75a77b69052e-50fb2e4127bmr129766761cf.7.1776883162609;
        Wed, 22 Apr 2026 11:39:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebe3dsm4571337e87.74.2026.04.22.11.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:39:21 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:39:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare
 DSI TOUCH panels
Message-ID: <dovqowg4a3aet2f4gwd5lufh6xqopeq5slgyix2bqbf3v7z4fk@b6pwiyn6ppov>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
 <CAD++jL=zmd8yto9HuyjC8cmBj1oMgOa7C899yo_toP9Q+QJcDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=zmd8yto9HuyjC8cmBj1oMgOa7C899yo_toP9Q+QJcDw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: QDbeCY4Om7CcHJs37aOJHOg6FoY2965a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4MCBTYWx0ZWRfXzjlDL9P1Jeu4
 /kiRmdDjpdZZ98BjgcTxOWL9YIQ+SiNlMYGnOSkOQX0kJ+k3jISfw3QgwqvZwksnRNR753+MTVp
 wNABW0iG+5ch0+hDhUH5+jt08WeCV8EnnPWiWTmDKdgV6H92PstV2cNnJ9wWCGho0rKiiROh9I0
 Btwk3HLWQQuDU490Aga5jafC3EdT618/cvB07h/mz3B9guwIn8qN2mQclrylDWqfKPA9GSilDXy
 jBnEsIdVqK2zXxDX1jwzIEjornSLVYx4fMXTlWeqIMGvXy+A9AG6q9j6zHdmcEAXXJoBQgmOMaH
 Ps0KFKUoPbbbYih7mBEyGQ/yyH1jAgoOReMqAdlv5vSNS2Od1zrHo2DrOrnZxELoqqZnLIwK3x0
 S8NsJdfQ0SJZGkmTKjcOgtI4HSHTG+aRHe8Lw+8Uqza+Lbmk02XtJSUZJR7CNZnSrEixefRgQC+
 oDnSkHEi/5r5zpoGAUA==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e915db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7GRFYvq2Tdryq9sLJf8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: QDbeCY4Om7CcHJs37aOJHOg6FoY2965a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220180

On Wed, Apr 22, 2026 at 03:20:26PM +0200, Linus Walleij wrote:
> Hi Dmitry,
> 
> On Sat, Apr 11, 2026 at 2:11 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> > controller, which controls power supplies to the panel and the touch
> > screen and provides reset pins for both the panel and the touchscreen.
> > Also it provides a simple PWM controller for panel backlight. Add
> > support for this GPIO controller.
> >
> > Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> (...)
> 
> > +static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int offset)
> > +{
> > +       u16 pwr_state;
> > +
> > +       guard(mutex)(&state->pwr_lock);
> > +       pwr_state = state->poweron_state & BIT(offset);
> 
> Why is this not just flagging the same register as write-only
> in the regmap and just re-reading that same register from the
> regmap cache?
> 
> > +
> > +       return !!pwr_state;
> > +}
> 
> OK so it's write-only.
> 
> > +static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
> 
> This looks like it can be replaced with a few lines of
> select GPIO_REGMAP
> #include <linux/gpio/regmap.h>
> helpers.
> 
> Has this not been discussed earlier?

Yes, it was. Using gpio-regmap would complicate BL code since it
wouldn't be easy to directly toggle the BL GPIO.

> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry
