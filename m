Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F164F3925
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412666; cv=none; b=cn2MdB50Xf89O+S1cI/yYQ7LTGqDcTuMUbKAuYFuhC8CBAUfFxwdJAyt93CV2QcqB51eQ+aosBJIWUvhFoECRNgY/Oc6r93ovIWqfDvsEIRYItMYJYtrl26GwKjqUjQlDeamQar6AIdbMRM/zzKGZQni4nNYTWlY2MIgAl7Muh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412666; c=relaxed/simple;
	bh=wd28aU++NdtOMWUJjRpk6EgNkx6fD22f8iP3kR6CsIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kolE7paP1xzkjSq+PW1z0oLIDzbPXRI397HXIhewD8FO3C2yuiThMVjLZdJKkfudHUlQMlyQdtA/Wppo7+V/xp4v/pQl91wmwZnq+fExEAYukBiYJARXA/UL4tBbqBG820+TYnaK8Y1dsaXiLponaMzRd8oRDgGralgLNoVGRm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JUXP5CJy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JUXP5CJy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so8591055e9.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792412662; x=1793017462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nCKEluHSWIFV51AHkRVTAd1QNSpPxxkrgvIjhQ5PXZk=;
        b=JUXP5CJyrMMjFmxa6xvURwQ3HJqNbCgVeoE9kApk/C3I8HLhyl6yflZvAtMPXTbAbq
         PZmVdIkjgqkqPo4RBL3iXj4+Gv2vfkhp8mEoTc33nuYx/hC6QXCdrRdFdxYQiAp6RAU7
         litVm9pJum2csacPR5Zeg6plHlt+ugelXA5+PbJRS63T3gFZ6csA36ec4bpqXebWJwBd
         /g8y/2cG9NKDw2mWEwo+Ctcx7a2skfoul49FHdgE2SthiXa/M1Rozb9lLYr8z9tqOtHB
         77rDdIM6UWUgYOc2WCdMXwRd4LIffiEiFux2eOgCF167Foas27W9/Py+bOht9IgfvYL7
         +EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412662; x=1793017462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCKEluHSWIFV51AHkRVTAd1QNSpPxxkrgvIjhQ5PXZk=;
        b=wsFHsreoS/W7nvBYikjF2Obg1suF7GtXNG7hCPdcwADNxnVyB6DN/Kq8YYhzOgWsqk
         9Ok03O3AVxeBYtnDuM6xygL+tCqI5tb8SE7BoBs/Zi8vPWO82gAL+KB4KDj612FbQYBn
         /AIaeW4Ew3l+QbY5SDFMXEft1ti/GGi1o8IY7t74V2eVQ9uMgOjML5MnLcPVkyCuzgh2
         WD0YN2capKblgnzYuvQV/U/feBi1C1Dic6HFKoOt4Q3k5h0djdNJ7yHsZtHP0cXhZpMK
         x4ThW2WsN0ewFRqjqpTIDQD7/lj7olRypc9n7h5IsjluJfr3Jarh3FYp+piR1IWPihHq
         Rrmg==
X-Forwarded-Encrypted: i=1; AKwUvBzezpjbu+cRe81cy9De1YZRE0QtKANEdFQ2NX7tOCfm9zw4KqQenPQ4CHESktGJaqIWXYhrWrGDLwmw@vger.kernel.org
X-Gm-Message-State: AFq9FYJsG2tZd6f+0pj2VI1pGQTo71mZXVopb6ECSxKTUS6ExAmpZ8Nn
	nyvxtdfnGnumemELXzWmO+zCY688ZeBKfbXapzzCQ9ZCOlGJVUinrlaeaF9TLgrOihQ=
X-Gm-Gg: AYBFou32pOCGI5ovyLY8ZvQ8raoVUQeDd4GhKAohlei/R2CkqBsSJMjhAzwg7+SL/Ai
	2OoyztyS0pZWLsxs8A/Tc9Xaegg40nC3YQ51RhAY5kKYyk2zh6E9CSZI56F0RQAIk1Cuj2VW8np
	NsbRE10AbOD/epZ3sKYvgHWeiBUa1DMpFxKDcr2LfVFprGH7gJnanz442jPIgt+lXX6mSLYEOnN
	IvOwun3S+pPVZLeeab8BKAoBuy1VasUbzKKilmluVtBfUHVN0fO7Aqm5V1vyWI0wOQtmBr07MIn
	frXrZqOjMV7S62/7rPXkXv5MFfLarShN46JXSb3msH4vQFfFfQZOtI42o00pUzPmC7dh0Xqqcgp
	rfx/48Tbfw79BXUTkXGeW/eWEZIgwFD5RdMIuDFe5+ez4Q1CvYSlUPwkAdcqu258+ub4yYB4U5G
	1IjcHGWAkW/rWfgp0M5+O6MrR00gMDZ+bVn2o58lHpNCkyUmef5FpEA/E1MKkjxTy/foaPjqAhh
	yQRbOfKHIJHbSSJra9miWDzNe9OjwrFJgbR4edsvHGAiTAy7EQ9UG2hW9i6Izr5cnnPyMH1Y+se
	6UHOe+RrEovxSD+i2uzBP+AEHORGP4CZpzABpQ6qWDJ/clAdSPoJj5uo4dM=
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr161218185e9.14.1792412661854;
        Mon, 19 Oct 2026 05:24:21 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc8ee409sm284385915e9.13.2026.10.19.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:24:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:24:18 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Luka Panio <lukapanio@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, deller@gmx.de, krzk@kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, junjie.cao@linux.dev,
	mitltlatltl@gmail.com
Subject: Re: [PATCH 0/2] backlight: Add Awinic AW99703 driver
Message-ID: <atYL8jLQmljt3ypQ@aspen.lan>
References: <20261016162912.64581-1-lukapanio@gmail.com>
 <CACi=Ov6Jg5eUxskBbmtWOS03jta90RK0nByhWf4EQs1PNhvuKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACi=Ov6Jg5eUxskBbmtWOS03jta90RK0nByhWf4EQs1PNhvuKQ@mail.gmail.com>

On Mon, Oct 19, 2026 at 01:26:21PM +0200, Luka Panio wrote:
> Hi Daniel, Krzysztof,
>
> Thanks for the reviews. Before reworking this for v2 I'd like to agree
> on the approach.
>
> Following Daniel's suggestion I'll add AW99703 support to the aw99706
> driver using per-chip data instead of adding a new driver. The register
> maps differ almost entirely, so most of the DT properties stay
> per-chip (dim-mode/UVLO/ramp-ctl on AW99706, OVP/OCP/inductor on
> AW99703).
>
> Following Krzysztof's review, the AW99703 binding will drop the
> ramp/transition timing and mapping properties and use the standard
> led-sources and led-max-microamp properties.
>
> That leaves the one common property, the maximum LED current,
> spelled differently in a single driver: awinic,iled-max-microamp for
> AW99706 and led-max-microamp for AW99703. To avoid that I'd like to:
>
>   - add led-max-microamp to awinic,aw99706.yaml and mark
>     awinic,iled-max-microamp as deprecated
>   - have the driver read led-max-microamp for both chips, falling back
>     to awinic,iled-max-microamp on AW99706 so existing DTs keep working
>
> Does that sound acceptable?

IIUC you plan to improve the binding for AW99706 before adding AW99703
support, and you will keep the old DT property working to that
existing DTBs continue to work?

Both sound good to me.


Daniel.
