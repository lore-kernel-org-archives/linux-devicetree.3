Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49F0430CDD
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292751; cv=none; b=mGQI97l2Sbt/ebCZuSNSiVqULtBNbdmnZbNfxLMhO6qLyOYM3e4SK7OTAT0JuShCU+dmT9ah5NKX9LAOubYK4cTQ7ky5/OYpOFoDmlcITT3ogPxAB2/QsUkLIv9dcrW4bkughu3cuByCPGBV+BJVCx08SV63+EGeoHrI+dhsXYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292751; c=relaxed/simple;
	bh=eszSZMOJpj74kh0VdtVM25yFcD4ep3fqH84k7hrgH0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzS7kr48vSPaO7WgjMiqAQRD2H1fdgj+meKlUojfPRtEvHzctThL8VpUtnYtRnHbzZJgI1mhrjC4iMv/g63dp1Xaty2VfYJGgz81WpSLE6G3wlyzosPQsuzFpgUWY3DRSr1JCSB+7+21IAfuWEkyFzfpkCH7WGzYNeiXiHn2pUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djpO39YQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OquInDAz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djpO39YQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OquInDAz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPMDh1045904
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 13:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3977fqgFQopqrOyetisycUnU
	JNoVrBq+V4kqibqFyZQ=; b=djpO39YQ55MRcLvTrU8FokAtAmc25B8PO6rhSyDs
	RJU4RGI6ZtKkLJ8bTvW2KxxuFZFTSiujmfX1/X85RxYrkbuMuL1CgeaZnPL9i4qF
	54XN73PDYKUfTJzZ1A3S386RM5q3T2Sh5TRNp1ckEIAV07+4eJaoO/nPw/BG83Fi
	Hq3N/Fcw6MgPuaQSCfzrNrI8fBoqq5IpYeht+/An7rgZhb+bGiAgShgYGyFrIdpk
	s+cxaQhxcHjn0+TsjzuOfzlXjRy53E4l9GFJ8lea3j5Vdc77CMbIMIuVau5+QeXb
	siQygViHTHY1l1TttPP8fjQWhuqepsqUcAca25vW3utrNg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbgrcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 13:19:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5da613f7588so2309685e0c.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292748; x=1791897548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3977fqgFQopqrOyetisycUnUJNoVrBq+V4kqibqFyZQ=;
        b=OquInDAzKHPBlexKLw5dAfzB0MyjUhrgX66xMm2UkWAwUZ2xReEAxfiPp/yvk+ybUL
         Mf7cHwXFFg4HjqD8wibuLz7jX1b6mp0lmjgc90KsSx/ehABx1xjoA92jqIU8F5f+wy4p
         MX2xsDtuOhU+rdwMeRRwdGpxAvRQf/Q6T5H+KGPC9NCuIwkSvFZJ4SDc9anVa34jel6S
         Y7kZX5SfIE2opA/jSRCjmio0Z6YcAwnCrhKlsssgaOV5iPjeWWDc+K4Hsc8IBCILBYT4
         P9bkU0yeflx3FmdhH7LqXyObYt9TSfZPHUIJrs2pVe8YO6tlnO80L7a7aElYDrN9PJDS
         1+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292748; x=1791897548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3977fqgFQopqrOyetisycUnUJNoVrBq+V4kqibqFyZQ=;
        b=XC+dDdzLDZywUijB8VfSlesTOLjRLGQrCVw4JcICviA0OA6NbB1QFpsGEl2sBV3aIz
         O610dcVfgmb+x9SodorF6LCBfQCzVVE2ZmYEJ8ntJsd8nIPAHVOeJkdrxJSu6FYh3GDV
         Oij+xsIRWM5K0pmSOvC0TGYZy13nSbrnZQalSt9bvVgxUh2xAMe6gotCAB/Zgo5Vvlvq
         bgpKLw5ffiSbwZazFw/uY/iPZ/UZlBpAfFjBD6JPd8MC2K5pJD7+RMk09+LGJyjNncOt
         1SLM2nlnOucHEqnjxuphRkVLQtoRmPbwJczzDni+8F8aPyYMxX+m8tfhcXs4wQLOSgDt
         M6SA==
X-Forwarded-Encrypted: i=1; AKwUvBxQLysbWgvdHhD5atOm8L1BqutepC7aQkGBxDC/l0G7d2f3q7x13YWd1Ag9DprAh2IEgjtrFXxzPEPT@vger.kernel.org
X-Gm-Message-State: AFq9FYLJawGEPoiLw181Gz2MckXR/2/yxXqXTAE914rIprWmaxK9pmda
	rn0uyOqjCkhTYiTaYYnQcdEcU2mV8p0aEGanQUL9P/vzFmKogz8YbpB44qsC/C5T4zgPCRLCdmS
	mTT26daJpzf0ChQyHtUxuidHMKVgOJaJ3ETLSr9Wxdg3JhJ1/E7N+yzJABtalZgs+
X-Gm-Gg: AYBFou2YfqpOTJAcihdEkUgmihAJL5TkCQVun2XYH0mrNjKCVKAbuRf2X66XaelN4P8
	PP7Jc7dfPibUvOBrbF46J8tQLLgkSuGjlW7C7rP8Ol+Tk+++6GPN1xu5BQGzCQyazlCoptiz7b9
	52rWwvruxMUXAZkUnqpzHbYm/Py6moj0g3qaYj8/oCxNzVM9MepSIV3tc+3pOYr5v8r/mFh9afN
	TeajGk+9OXlKMXYuZUBUIdFhdvncHjKXp8m7agDq6hSzQzlR6JaY+MmkDKyCdWYSfDHw8bkBNc2
	i1JhrhsOt9Zb61m5cwtBep3khTdfipGPuxU//9G1Mq5qZAw2D/m5MpveUT/uIlk0GV5lx71yIVN
	wJzmpc/T7adlHqkEANmvoQKG0BR85xU8l134/jieG2XUMkASssHsWDpCfB0DZtqxXpPvBeid0ql
	NrDVrKZvh5PEhX
X-Received: by 2002:a05:6102:b15:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7c87c9235c2mr384651137.37.1791292747980;
        Tue, 06 Oct 2026 06:19:07 -0700 (PDT)
X-Received: by 2002:a05:6102:b15:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7c87c9235c2mr384647137.37.1791292747447;
        Tue, 06 Oct 2026 06:19:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a99ea94684sm885231fa.26.2026.10.06.06.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:19:06 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:19:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: muzafferkadir@mainlining.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 4/7] thermal: qcom: tsens: Add support for MSM8952
 tsens
Message-ID: <suzsbvsdlfrfsnvaerphqdycaaaiu5inh5uw5wups4jmfozkbt@n4lsb5pfdhbw>
References: <20261006-msm8952-initial-support-v4-0-ecdcc1ac620c@mainlining.org>
 <20261006-msm8952-initial-support-v4-4-ecdcc1ac620c@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-msm8952-initial-support-v4-4-ecdcc1ac620c@mainlining.org>
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac4f54c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Oh2cFVv5AAAA:8
 a=OuZLqq7tAAAA:8 a=Nmgb9aOmcCZNRWd-E-8A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=7KeoIwV6GZqOttXkcoxL:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: LW2h4f0JgH4PIHPx1vb0jet8ysMDqvuI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX70SvyWXLx5br
 Nlb80vdpsxLHKHLaj3e9O1ua7G6++/TN68xgBqY5xjUhF4EBPvT0RVzTCN0nNGvpi5zy4IASuMP
 m+M/DbE867Tb1anLa3CwNF8A3ZXd4BA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX4Q8fX76+X+Ei
 nzwNw6oTKls/by5amdewDzgBcM7sfYt9ZJk8D8/vUfKnIYR/z5ABYMVKhT+TRpy/sDLcmwh50Hi
 U1jqr9i6RC8KR6HBZ4HPPpxzbZtJR4udE30xesF/V/405AU3iY4dC92BH+RUK0h0txZw5Ztjssf
 xthHeWN/WuLSytmSYAdNdhuP65TQpXIt3vnT2nFSCQet1LOvtQHkHY1qQwy8Ll9cKCPV04Xr6w7
 se3pYDQrllBRLOnpa/a1be4a+IAAIASUFLOJykc+PRdlQ5Kmd4K33D1SyJrW9Z5GcXUhh22g6DU
 eDb2DLCyb61CZsEErPI7+rKnFoOPYOPd1GTV7pLyxMRXIWHu/8zQjL3HD9BpLi528I6CoZhnkXu
 O3ixMpmcrJO/ib3rSCtDgFCwcFM8n3gNE3ZaQDhFLdxzfdIa7jz/4NU1L2oItbUOfqpq6BGckkn
 CoRamW9ZuFqAp5pkwoA==
X-Proofpoint-ORIG-GUID: LW2h4f0JgH4PIHPx1vb0jet8ysMDqvuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060052

On Tue, Oct 06, 2026 at 03:15:11PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add support for tsens v1 block that exists on MSM8952
> with 11 tsens sensors. Sensor Offsets and slope values
> are taken from downstream.
> 
> Link: https://android.googlesource.com/kernel/msm.git/+/refs/tags/android-wear-7.0.0_r0.3/drivers/thermal/msm-tsens.c#1621
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 44 +++++++++++++++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens.c    |  3 +++
>  drivers/thermal/qcom/tsens.h    |  2 +-
>  3 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index faa5d00788ca..f4201748ea29 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -145,6 +145,37 @@ static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
>  	[TRDY] = REG_FIELD(TM_TRDY_OFF, 0, 0),
>  };
>  
> +static int __init init_8952(struct tsens_priv *priv)
> +{
> +	for (int i = 0; i < priv->num_sensors; ++i)
> +		priv->sensor[i].slope = 3200;

Where are these values coming from? The driver that you pointed out
reads them from the QFPROM (like other tsens platforms do).

> +
> +	priv->sensor[0].p1_calib_offset = 2;
> +	priv->sensor[0].p2_calib_offset = -1;

-- 
With best wishes
Dmitry
