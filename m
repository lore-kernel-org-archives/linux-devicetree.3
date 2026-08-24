Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A944E04C
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586072; cv=none; b=oIT/e7QGvdE+I9jX1znNXM/COfPLFvM8nbJ7E7Ej0Xtsf2SJZBGVNPKA9N0v7Ym5vMrYJnrvy2ci9UTGYUsdWpPynA8FvK9HeOldKbwIBdw1HpwYdGDA9/Da0wiqVi1x9/+UacqLimzWJnwVLFwTGfSRvOTnGPbEDNZnhnLHgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586072; c=relaxed/simple;
	bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHxTnEXhyqG0nKHHqfDZPcvV2I3S2EdOT5TcxDWZS7FJ6xD6jfpmBb6T4g22kxzAqLS1Uw4wQqiA7hYygeh9lJVWlo/Sk4u8+zTpug7JXzJaWNHpCDP9XzG2C6i6KXnnwlgjkZdy2Al8wbk/Pi541SQcI6h4NSp85qb6v4Nb0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKibyAV3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKibyAV3"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c169ae1cb26so1197966b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787586066; x=1788190866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
        b=VKibyAV3UsWTK8leJAWm/QLEqyzuS4ryXlhjMlOntccnROVPgcJKJVgTjAtlc5dM21
         +ZdXPFxSUWIDgGZR5zUEuOToqhrPUdpKu8K9EZYcfoXWF5Lj5uBBbd6FafimRP20Djzy
         CB0twU51pV/tnXCZJcEEKYvIv3pP0I4Fzbmwdn44zDoHjcQxH2pVQrHCAhmQyo//ltsv
         6ddMMOZud2C96o8IALOu5s7WI9XxlwHCbWG6m4AZ/ynt2zlEBH+yHFda5eErMHGHvDlt
         yP02ATm5uAQzz4MWPwu090mfwmNHjxtCoIDZ0N3yEFwzfR0b4FTCcK99t5mtozizubpb
         h6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586066; x=1788190866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
        b=roeqt0nDbh+i3r1tYKYpN6norNJVxULrYQc4SEzY82nFtnCPzAxU48l77vYHrLbp3M
         ylS5LUUhFRTAAA1EO+XjrOAbBu20CIlYSHPtnNhFpUVuzVU62Ow6kzXeJh23yMkOdDgp
         atZsSlFBVbByrrpJjH3tCyjLusTH2Ie5FRw4cpKPEcBZQPAv2TS88yyyPVBADrPYIoVc
         ZR1vOlRTjn0DdqoNj71fvdpVnTSZZiObZ+NTS2Q3McqV5wWJDNYaWotx7afTW0oHv7Fr
         0wYjTyXOJP1wn1Jgy9mCXohfz9cxiRhHL6+11aPqG1xd/lWgGmlSJBGYysfMPB0i9YTT
         YKgw==
X-Forwarded-Encrypted: i=1; AHgh+RoKxWeOYz1pmoIFcAgxq22KJyE/G4UJrxKebuqbLuwMDz/d/XeF22iyH60MT5KruopG7UGVG9Ef3hrq@vger.kernel.org
X-Gm-Message-State: AFuF++kLYQ2A+ROefnJvo+eNiQGpJVuISY55B2VcezHGf7JyKdMIiht/
	4S06zK3tRj5oGBMt9rKe0rBaDi1osofuOmCO0JzkId9S7zdDVmoVOAbhRISfdw==
X-Gm-Gg: AR+sD10yCRR2mo57rO1FqyRpbwDDW7q44BfAlVaPST4zFwHfySP/h7jF485WfTQCCUZ
	ZtgyiLC5sEeVd/1dGg/xwM7LdUsbPuhRfopriVnEAz4hLBFBo4XRjRrGw/FNFp7lwhpqzrWSnzY
	/cv57UHvunxF0335i1gWwJfBvD7P9gOJ1E1/j6nkgCKKNFh+hEKDv0VNsb6xRHrAqj0X5X7CJUk
	pej4YHPphXCqA5Y6lJBB4b3/1p8QpMFR8zY24yHPMU3t4s2LiJ4Esyr4X+i8IE/Wbg9g2+H7GQJ
	mNJUL54P95ZFTgslvEQaPO0YD1ogKdRYkrHslMRt4tOTGHSYskwT+vrKsM5FzlJVrr6u2KyQ8Sq
	fLtuczPcauxaZa2hpPioA+9+5skRUbU2WZlPdrrXJ+qW3bEFHyjjhFGr/jmjUUjgw4fda1jHf0Z
	OBBg7UGe8CuyAdsQmO7O3LPHD33bfUR2AAvvSM6PD8LSKcYNL13qsgLolYKuoGXynzBDqM/JqK5
	HtVfzgmpwSXbVX90FHSXvmeFXQxCMXRVxbA0IfZ8jTR1YTX27vsSCt64Z94kDKKmYw=
X-Received: by 2002:a17:907:60cd:b0:c12:8a:7d7b with SMTP id a640c23a62f3a-c24e2aa65c6mr12519166b.1.1787586065638;
        Mon, 24 Aug 2026 08:41:05 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-208-169.net.vodafone.it. [5.90.208.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b60asm1230685366b.9.2026.08.24.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:41:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:41:02 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <aoxmDpCMITmyuHHO@GLaDOS.station>
References: <cover.1787583584.git.stefano.r@variscite.com>
 <aa8af884a709961f155f855b8a480488ef4c47d1.1787583584.git.stefano.r@variscite.com>
 <20260824153400.119F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824153400.119F61F000E9@smtp.kernel.org>

On Mon, Aug 24, 2026 at 03:33:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The ads7846 touchscreen specifies an active-high GPIO for pendown, which conflicts with its active-low interrupt and breaks touch detection.
> - [High] The V1 hardware WiFi regulator (`reg_vmmc_wl`) lacks a `gpio` property and relies on a userspace script to enable WiFi power, breaking automatic device probing.
> - [Medium] The `wm8904` codec's `IN1L` pin is configured as a digital microphone input but is simultaneously routed to an analog 'Microphone Jack' in the DAPM topology.
> - [Low] Non-generic node names and invalid characters are used for the touchscreen, audio codec devices, and regulators.


I'm going to fix these errors.

Stefano
