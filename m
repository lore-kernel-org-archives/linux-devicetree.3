Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66C6323417
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529608; cv=none; b=j/GRQAKX5g/67Ug67IVLU8aR0AA/tEr0+CgSi/uzwik5Vx02/PoMGOrRVOYqIrd67J3ONJ5VuCXscv8ojBvYa0aal2eTny1pGMwl7JIsX7az6Fb332/Ez43xgTidrNTE4BdgnhbG5KoiprQgHQyWG/20Nvjj2HMWurFg9lIjWTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529608; c=relaxed/simple;
	bh=VcKuCeSMQ4I5yw0ljiiq4L1snVizmWQm18XxRE0uO/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOLixvlirD9R68ZLNoMGKe5EkJ7and3Cun/7qtk3Gn79pgvq1sITv21ttzp3rWuceQA8vJmWH4/6bMdSI3u14C2wX7BsgYe/fjsNgtj9eMF7FfGLcFWEGqZk6BHGtuLACf1kxxuSQmZ1joKeQAL1q4R1TZwEPO75Hfa3ZqAoLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2IKQTFc; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2IKQTFc"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-46f53c8a5fbso343720fac.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529605; x=1789134405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=e2IKQTFc3YbZN3ypwX5yUCc+DsU03AvtA4towAyv1iY7augKUcyGpi7zcej+n0gH/W
         YlKp0xM7ph4DcCy4t6ngtLpCXzKtxdoTMHVfgF6voqG43XDO6wRJM3LsWYyZpsTiGqT4
         RAN5Ydx02OQJ4YqPRZgYahO2LuNoSaSFRysLwn8STC8lEap+t64mKmgiyeC0uqL5kokT
         4JUvv05WFRn5DptkYllwqBn5utqH3zuhuhp40osprNWxNympUw1AjEsHCvIDO4o/dbQg
         8phcTYJLtsheIpLOizcR44HtHc4w/X6s2Uu/yh9lHSmrkRBYyYaeT6hAVNfUnrqf+T92
         cYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529605; x=1789134405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=SEV1i9onHQuQzApdpRj/jBaL4DLZD62P9rDCh+18mDINEydCS2nKtIaPZVcWdChUdU
         QBm40EqWKaSacmjJIh726BGKYWhX8qMgAKDOmGKY4HbUrQJCnGl7TbTAXqBMVOrcpQbU
         qVuNZhll3Rpvh9777gsGA89Bry1Ry8IBPXLdoS2/unjudrugjaqIhsvjRvHDsGgxbmzi
         woJ9ZVEKefqgge3ti98v1RNLNWWCNG88awgiKmOD1UBAmCUKiW7vTaG3LedB2DZkHyeB
         j4eGb88ZEco/Y3MmdFZ/yKiHDrCC9ZBuo3bkESuU0J3RjXZOXDYNWpxBgNjYrNJ+2u3G
         zxvw==
X-Forwarded-Encrypted: i=1; AKwUvBxx8Pp+pKxsp20i4lv8c8alPF/EIcOcxIx8+iPXLSUzdnZiBjso4JD1pYScWLc82D0xJjE4U9rny28T@vger.kernel.org
X-Gm-Message-State: AFuF++lrzY3uNG/tENP1u2+or7dTn4yGhd0d/Su24WVSWSL5ku/iDEyL
	qMoDkiPe+MSrmLHVZ3l/vwURHiEnIfLfYT1hhB8eX/bCvwfTNRKiK4WI
X-Gm-Gg: AYBFou1hw3CBd6A5VqdU+YUhx/itzqelHCHJmF5NZFOinx/uHwVqL6QHnLg/nQ+fQpy
	qG+Sg5gHDha3SRBig2blljzhA5BfcbPth0emNc5Lv8NtJ9SQHiZWleLyGSFt+lB77nXjn1AvNCU
	+Ov9JoRJsjVyYaRHpnYibVVM1xc2/4DEEtav54ZemsFlCqOUfM0PDhaZg3rdd6cwZwIQT/GncCZ
	VicOQNed6S7KdA2JnY5i9h0bz7N6f2anuWbEkuUEQB8jcUTjrYwapqP4WGqo5Wlmdjp578HaZbb
	HqUf5JK6xJeMhUH3GiWeWr4R/FUnKaVo3j7I6tS7N1p8VNjdasrG0muztRFsAR9OFlYUI1c4Nin
	f0cIONEm0YTlyIJhj2Zszixj3ODBd+F+o+y6Uu+5QYTW1ZdD2FWPGDKDM9wUA/IjXy2ZS2CdJ4u
	5eLx7JL2Yj6O78wdg+RxBcPUy7N79vK7uP3Vix+LnVCtHgrDKOOoZPl3W8ETlOz4FttdMhTBjq1
	HQJw/0ENaVxiBkHPBNH3BrnlEnv
X-Received: by 2002:a05:6820:c86:b0:6b7:46e9:96f7 with SMTP id 006d021491bc7-6b746e9a200mr2294144eaf.39.1788529605201;
        Fri, 04 Sep 2026 06:46:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3ed6:cbf9:9a8:24d0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm7174899eec.5.2026.09.04.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:44 -0700 (PDT)
Date: Fri, 4 Sep 2026 06:46:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
Message-ID: <aprLYn4VzSTnZWuw@google.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
 <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
 <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>

On Fri, Sep 04, 2026 at 03:41:21PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2026 04:12, Dmitry Torokhov wrote:
> > Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> > data. This is useful for non-DT/non-ACPI platforms that want to
> > associate device properties (like DVS GPIOs) with the regulator devices
> > using software nodes.
> > 
> > We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
> > have the MFD core assign these software nodes to the buckv cells.
> > 
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
> >  include/linux/mfd/wm831x/pdata.h |  2 ++
> >  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> I still need Ack for this from Lee... and the problem is that you did
> not Cc him.

Hmm, indeed. not sure wheat happened...

> 
> Please resend everything or spin v4 with MFD maintainers included for
> acking.

Maybe you could take patches 1-6 now and then I'll continue with the
rest of cleanups?

Thanks.

-- 
Dmitry
