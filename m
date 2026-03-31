Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E45C36DA0F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979016; cv=none; b=WHyLv1/EYcwu04/YnYw72x/TnHzrn0ab7HKOSdDjyDzIH2nGy1r62x4vw6NIcEwhS6vIt4bGEp7BdQk9jVdm5HPK1ee1hPFJxEiQtI8I6bTSxt/LyuN2nERhmqKj1ncyXKUol/mmhd8Op2LmqgOPF3pKzTFl2QBblQDqWCflDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979016; c=relaxed/simple;
	bh=BPAI10K70e+CF+7qyTbXS4a+PvSEqRYiYd9lP4ZeYLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDE7dt52abK+BCdi3wxqsbFnGXPKu88hzHaB5UOtLQ76bu0ILCLYz6uADG+MpnkydpH45rlxevLNWdQJR6L6m8XJYh9NAAFUgE2DNwNHllw6IB28I/Q5Ck4y4IcsVqbPLBpu+1aFvTcTH1lQjmb37a7qCeeaZluXn9PhgF8VG/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6r5RCFw; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6r5RCFw"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cfc795ca97so535598185a.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774979005; x=1775583805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbKHKvhaSMoLy6eA0IPH3efMSPpQIB4QG87MfGtQ3zY=;
        b=c6r5RCFw+becEQmdyeDtY4HM/UIya/k/fTr9BAL5Y15NZIvcm1rlmsk1a2uQjMn1VU
         WIe/nrkvQzhpK6mdeI3qYlq8T3NejDb9YZID12258E7ggev1Rac5K4XKIZepGgJUyncv
         vfc2f1zdqR0U6Vv6JQa6ZsTXB0iwA9+ZLf+CsRdgCEmLyaB45UrHFI3kcQZmvKkX7Frt
         EUxKT7jPCoKlTl4wbStty1XUY5vmXFT4j9ZwJdinwk4y7HzNrTpsS9xsD0QlrCQaD2Jh
         A70uGAogasAhAjtLku/3NoQ7Rt6REEBAPtdJpN76+AA1ntLrjRQFklq+XZxFz1irFgO3
         Ku/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979005; x=1775583805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbKHKvhaSMoLy6eA0IPH3efMSPpQIB4QG87MfGtQ3zY=;
        b=d24iRcO2aVnIUgi1ufqm8H+QoEdd0luwDHyCqWcpcDQmzfHnSlQb1MlZS/GAuTWqXa
         1jA4vgYpVzJMOEjvRFurjpWtnw/YhdfORngkuKpSIpbZBVZKuwEFcBZPOWgmSA+93RyI
         YOMv4vquSzzU45i88cFvpjB0s/ePdZJfaPToM2whxufqLU24J3wFa/wgjIgHGhxle41B
         9e0cSzliDLsRoNts0Jx3ethZrnsjbFx/ceQzbzQJiCP/H77aUKBKj2noJChkFnjlx1cz
         HBeR9RvamcPTI40ZokwDUGFSDE/HIMD/4WClTYr7P4wpWNWGd3yBhOGMwWBN7jtxN2wQ
         xN7w==
X-Forwarded-Encrypted: i=1; AJvYcCUUAh9LUR48GPNGbFaGTyccarJYPr+Sl+IgznFfFOmGsbzijBENs96kz58PN2dn6md6269w/SPhHxjV@vger.kernel.org
X-Gm-Message-State: AOJu0YxsRBdPnuQHDOw/QowcoGX5MqX/kwPTu4RxfYi94WckOBBM2BM8
	MzVPj47cggsXgPP7QnNXDtQifXFO8TyZpGWxcHLeoTjt7CgV7FqLvMgB
X-Gm-Gg: ATEYQzzq7oulgawMf5ZYW47yG1z707qt98RT2fObrwgb+/mhXXKufQQOr93stp5cPn2
	5vjmUKDMTqQ7yN3DCn2cFa0ST9gSSlhLo/S1MchzcgVveMN0XHOmlck5MKlnYF4Lam5YCiQxQ59
	ZiI641y1QhEKy3WBMnTqhsDH9IBSWnluwSUTtGgJ2U9SUxkyZHj0Ak5UV7F7AYjyFD7hx7acEtN
	SR8+rRSvbJiSGfmyFKK+w254FoA5tbLiAHAq1beC/SQ7xk0kadswvXz5KaUbmT0GEi2FrCuD0LC
	Awf4bnqLlC5pdT7qt/nCuunzUHCSuU4m28BXRRgQ7KefJINB+u2vHrtIFajZEgVpliNb2DaijKF
	u3SnOxGUrglci56N1t9bxF8uO0v9FXd+hEyJlV64WIc8ebWXTt1TSRiZOsX1gOQriCUJbjCh/MK
	BLiUH14HGMgN7mBoQKZ3yJ6EHd6nI=
X-Received: by 2002:a05:620a:7085:b0:8cf:e0fe:f20e with SMTP id af79cd13be357-8d1b5ae8497mr88040085a.15.1774979005294;
        Tue, 31 Mar 2026 10:43:25 -0700 (PDT)
Received: from localhost ([199.119.232.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d0280374cbsm947500885a.26.2026.03.31.10.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:43:24 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:44:08 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
Message-ID: <acwH6N56W_ULNe2q@rdacayan>
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-2-mailingradian@gmail.com>
 <ca6c13c2-4e46-483c-bc22-0ebb6db704fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6c13c2-4e46-483c-bc22-0ebb6db704fc@oss.qualcomm.com>

On Tue, Mar 31, 2026 at 10:30:29AM +0200, Konrad Dybcio wrote:
> On 3/30/26 6:52 PM, Richard Acayan wrote:
> > The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> > some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> > the first 6 CPUs are in the little cluster and the next 2 are in the big
> > cluster. Define the clusters in the match data and define the different
> > cluster configuration for SDM670.
> > 
> > Currently, this tolerates linking to any CPU in a given cluster.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]
> > +	if (cpu_id < 0) {
> > +		dev_err(dev, "Wrong CPU id associated with LMh node\n");
> > +		return -EINVAL;
> > +	}
> 
> nit: try to use 'return dev_err_probe(dev, ret, "....") in the future

Does "in the future" apply to the inevitable next revision? This would
be the first occurrence of dev_err_probe in this driver and the error
path was just cut-and-paste.
