Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540CF1A683E
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776041777; cv=none; b=rqwi7pzycFffDy96SXeWAgfxk8AawTQT5MsZ9G9k3AJNzsJFeqLSyZ6Ph+UE9/O27l/MnfPE9RbLU0doTRqWEJBY5T/Ks1Je3B1OzPb9mLu56PsVLqa4F+Yei6Y0DslJZ2UiNH7vSTBI3eyhD+l1C+CLUe/+sAtP4JwtAZBW0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776041777; c=relaxed/simple;
	bh=V5ifw+ouAt9/h76UJRk28uWOsbTjGziQXpcaQNQUtmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkDZLD/cbvYXMaa7TesaMCo7qxBMCW0xuBaJMhkqmAKX1SgKsa7SfDnJ5p9xwpZ7hQ3cmsR7RSTiH2NfkTzh0MvlcI7HcD/IxrmlUEH1A1lnuvB4OEIkjXK03P93jxCIhpFLR9g8PAvK8VUeXqEyi7BKFvi7HOaaTUFONG1ci+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ouj5s11M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQS6KdVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ouj5s11M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQS6KdVh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4m2x3830533
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HijQAzOwombW0sXEz2D/Ph1M
	agV/nyykDUHyc/yg8Tk=; b=Ouj5s11Mh1U09Z/e3VoJZM+qKJ5LCf0cZdXI/iio
	4fLEtDaRgbRAf+a4WkNBJV7KUrGL16XzNJt8/ynV6mCkj25Ba+W6Z44NufE5nRKM
	IbbrHcomYp9PchajxCDdn8ufUTgvbhi8lcJykAlPrA2Yxc38rHYDM3wD5AiHwgfR
	16vXbBfPWi7Hsfaa0Ukx7zi0/kflDeOqI9brP2N/1EfG8WhXnJJZ/W97MRiIhi1a
	bvBTk8WSRTRzn2WG/xdeG0vhAwpWcckaw02mIQr/BBwgbFYUnphpcniqU1Me+FCV
	zwBFkpDT/uy80zo+mO7PNv4HuI8vdDJtMqtGNl7KmtKMJw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew037uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:56:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d831e8083so50875091cf.3
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776041774; x=1776646574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HijQAzOwombW0sXEz2D/Ph1MagV/nyykDUHyc/yg8Tk=;
        b=BQS6KdVhnt7fXLLotDhEF6zrsE5N5aqGrQhN5qA9MAA6SgmAG1wZZCWhxThum/PmAJ
         R3qsdqIg4JaJ1oJbLNZNp83lF+jvaijXzRtxsStC+f9KE8w8pT3Krksgh3B8XhltFut/
         rYrXU9/6EcYCVGSHcFjipSqLWO91PWQRTN8aTSWRL1+SKpGpSIWYEsmJebH1NrTmuYLi
         UBRUvb/SKDSpQre56wZAhPjl0d69qFFD/vN0G8d0Rm77K1ptY4jlDaD2IaXp4KQRCWOE
         3zZUJvmO4TEk4xRvXJgY0tCzTl9GOh6UAmQFeWCEsvPH+2IC4ij/5iY2Iv1hto+qZrIc
         T6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776041774; x=1776646574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HijQAzOwombW0sXEz2D/Ph1MagV/nyykDUHyc/yg8Tk=;
        b=cSMHbC/0LJ0OGg3zsf5ORjz/82Ud0Uu864mK78Q5EJsJdL4rtz9PUH/UaxW2Qoy5Ia
         1if52QppmeMNu+Xo3hnXCP5+LuatYYD0CdX79IcekpMe88srmBWdhZS678LL/1K7TsCU
         y/HLGA0z6XoAZjQrdQdXlrmCs4dd3huQFzuyX/q9dVmhhQudns80nolZTXZGXPQqGqDJ
         b175y6vfyLwKJ4PAvhKSRAmj2EZN1cL/IBddfyJL0qb59VupajOwaEv5dYcgH9blJE5/
         XTLIwa4Wr3uEElKFNq5b0TEZvTfMkDWnCMvX9BD08EVXunQzOV49D4+I6xII2GMaBeow
         Btmw==
X-Forwarded-Encrypted: i=1; AJvYcCUxWt+dBYKmpTTwsHs6ZF6VAYP/t1gum4AdEie0pvrl12IJJCbCg0sb/UW7sZxvj/3ZKtueClucckap@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8FDDOIufyRF6XsWntQjEVVlnBLDHIoXonRc+Xbm1zhXeHBUrl
	cmhV3TfjlrEwv9EEGEW1G1sWYvCz4c43fcOfdFwoQU84RhxnSfZuCeB881uUINOppELYYR9EZ5F
	vHMC7ceXuSWYrBnxMFOUzPWDGRuxf/JDIneA66x2vIHN2iSx6VDvOMAv25hqts1nF
X-Gm-Gg: AeBDietZ6zc6gvLoWLgOlOE76VgQz6qmvYZ/cOJCLFu4+3Klbl/gWuANvU9tyH1F5af
	89aka/rnkaj2AMwmBZMZmt2rAfiw3g5xPZeITMChHauyWo4+8k9FGGV3uKV5IWqxY+COKfO5p6V
	xNzaAQd6dlG2YGrfXzOcbI6k/OzVflOB9QIcu7aSPq5mOElRL0nlgmPdv+vfqPx6Q4z2FmrjlAV
	Io/0ukJxZdoBG7EjZ3HgyK8RkJBzQNjsU0rOOevh4yzpBC4CcwoTl/KuYKgnLikfuus6EZ6VZ+D
	8+sgmmTMiQHEIoOJnAUsfOXMZV5sNmDnGJCDlHnoR/zGKCm33n+QuNIAJeYIQr5h9X+CXI/WIK0
	7qoWBxB9xkV0xw39iTEynGcXJcQiBNurh4y+w6O/g4uqOntMOxDpqeLegE1vqxwBQamOqzwbXaE
	VEJb8EUFLvXtpsGmGjU1u87nmcC+RPc/yb/M4=
X-Received: by 2002:ac8:5a92:0:b0:50d:a637:6bdc with SMTP id d75a77b69052e-50dd5bcef84mr180329431cf.41.1776041773620;
        Sun, 12 Apr 2026 17:56:13 -0700 (PDT)
X-Received: by 2002:ac8:5a92:0:b0:50d:a637:6bdc with SMTP id d75a77b69052e-50dd5bcef84mr180328931cf.41.1776041773128;
        Sun, 12 Apr 2026 17:56:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541ddfsm23293661fa.27.2026.04.12.17.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 17:56:12 -0700 (PDT)
Date: Mon, 13 Apr 2026 03:56:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v2 20/21] dt-bindings: gpio: describe Waveshare GPIO
 controller
Message-ID: <mzuwcmkg6u3l3b36wiemdliq7fjrmu3hx6bxba4k6nyhfffibs@a7qh6wcivc5v>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-20-75cdbeac5156@oss.qualcomm.com>
 <20260412-diligent-ginger-flamingo-f5059d@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-diligent-ginger-flamingo-f5059d@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAwNiBTYWx0ZWRfX/LiIdma+EDPt
 o1MuuMMWaFHyD8zwos5LVWUW8Cp5e7jTR45pizR880/RvpOt6sQEZhWtlCkp3tL8HV2kgm9bSVO
 iOkaBjtnOfwTZ5Bn/n9gOQNHP6fP1ZduZiQj6B22zSEhzn9fyiK6tFZXziOHhhcgD2RpssYZV0h
 kRmDshL3gUkRngkIZu/iWriKuo5lp441eL0od1rmmsCz6QT5pT/LntFfAszD+2+29UK8G5KMHPX
 EMvM+sqryLXTsvhKiL5upU0liNKEQXH/Qe2Z6CjWNmRIndDwzcsw46bvS8eIludGM+zC4u0np76
 Vac3rH42m8UldrVNmeNxwQ/maZ7RWBFvKP9atx9X3U6o0D5L+GLvCd7fP40Vdd1oxit5WnwWF8V
 Z4yXEQ/C4KcQUgUM7J70stoSkCsvXELGBWE5M7/tH6IyT/xAcUpUO7hqhGtSLppwQKn7ELRvCEE
 QnKB4uCsTlCCBBLNF8g==
X-Proofpoint-GUID: MhTV9OAZHAAyEODeX3dp8UWtmI7jeEwF
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dc3f2e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7GRFYvq2Tdryq9sLJf8A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: MhTV9OAZHAAyEODeX3dp8UWtmI7jeEwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130006

On Sun, Apr 12, 2026 at 11:48:46AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Apr 11, 2026 at 03:10:40PM +0300, Dmitry Baryshkov wrote:
> > The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> > controller, which controls power supplies to the panel and the touch
> > screen and provides reset pins for both the panel and the touchscreen.
> > Also it provides a simple PWM controller for panel backlight.
> > 
> > Add bindings for these GPIO controllers. As overall integration might be
> > not very obvious (and it differs significantly from the bindings used by
> > the original drivers), provide complete example with the on-board
> > regulators and the DSI panel.
> > 
> > Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> 
> You cannot test a binding, it is not possible. Otherwise explain me how
> did you copy it to the device and what sort of device runs YAML.

I'll drop it from the next iteration.

> 
> The tag was given here explicitly, so I really do not understand this. I
> could imagine tags coming from a reply to the cover letter, but adding
> tag here? That's just fake test.
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
