Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0DB3451B5
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556005; cv=none; b=WtkPs2RzrBdVLGXm4Go/Q+adBqlhbi+8CEZiBgGG4Y6WzeqtrrWg2b6IcoWXnAMbKnwFjSmHId/nckftsN9lOOZ5JdzkT2fB5t4vfoVsD6UzP/iHYOr+dCXR8aGUv8PvP2wUnek2VMWuNMKSvwS9BIHWUTPJFI/TlvPeh78FJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556005; c=relaxed/simple;
	bh=aXL4UHrf+0humdIEef+4JRKRa9+MfpcNujWBdBmDGOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hf4/lzSmw9NtSr9xZB4h+5jrFFQtGsaHbVpySUw2bjSt4GmBEI64f8srsDJ7m5AfJYzgWQLpNqQxLm4wJYt5qbCZ6Q1MEfTVxcWKAAqEVXJ6ydMcFcjTg+BfOhT3eU6uJ6b4bzGcIditoBqM+vha43e5KtfGLjZe7GPIN4YUVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUFpmHPm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUFpmHPm"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c247f6687dcso344199466b.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787556001; x=1788160801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=CUFpmHPm1dpajm8kHJo/EBAKIRfUvFM8CCblNrP7igR3Bf8DjmaR1GXSQJwvGGexqM
         qkrwtSZnEB77wsfsRUASTLWuasfR7/3sN5ZGMTTNIdvs3p36/cJKb3FpuYlIgbwKuTHi
         E8QX4ghP/fMaLC4oRBeNXUclwjPfydI7y51tRwdps0wyA6rlKj3zruXeYQXWWrDrSEhw
         tbnowEjAVVGLWjTVx/6GE4zmj87DwtqhUOTkBdZYb7Qc7jb5+gKgl1X6PxnBMi3Kk+st
         x0IyJKR3Ehvm8kY+iHZ0Yj5gPTiRO0Wsr3jBIrb1jlxEiRM7skIaHEhfoVac+2BAQrkH
         Us0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556001; x=1788160801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=syHTbXius/FH9grNNeehrZRkg3dLO1r4O274BRBsibzCI5Kjb6FpTm4GWhxzaCMPy0
         jgQsKzrMZfuRBu2ORrzBQO9KyVa+eMW/uasWp539KybcwMJyT7xq4CL3SDTve4miDgLD
         Mj3zQmyDQ5Feg/nbESL2jQA6dW6mXHXdn2uGBrgOwDl1ape67QCUyE70eTLE5iMGBX2z
         PqCRxGaVj+l5f7awcv+4iv+NJkC2S3207rJWNRyaILA00iaykb3x491uKYSZqxRleWXm
         jumZY42QOmytvG4FhC0C2kUKePwFwJ3pT3Y1ayTxcYPvxhpQR/XQ96/k/qOGlLkGOXFF
         HN6g==
X-Forwarded-Encrypted: i=1; AHgh+RoYCVpHMVVBqa0OIGXlFBLsAWrxMBc2Ralh4ilvoLXjsGKzp9cMSA0gDfm35nwznMLIt7QUwl7XXVY3@vger.kernel.org
X-Gm-Message-State: AFuF++lnrOdO/fT7xEsYflrGh22IJooqFxrsPXVKVzNyuE0mMYPfnnFH
	y4uA7xPbBRHgMyRWcNwcg7PjzUSiviIdp7KjSJgiiaMvCAOKVBIuq1IC
X-Gm-Gg: AR+sD11f/9P+BZNz5/ic7iIpm9qkkOsenSi0Zqb/q1v/W8eseA1V2YdT/+kI0yUNsGn
	N0TNo36+dacJTgUWPjtgtVSlEWTj3qj4KMXH3osTe7tRofZlkijL5Rei8xOMFYJRACwryYNS6w+
	Wssl2RbD3xezYPTmF6k76n1hQ6R0zLp0SQiPY2adQFHRt2vfmXIm8xlsbN49V1HiTKTZvD/vQlF
	vED5NdDJdgIN/pnh6ulH/IdEo7A+5PFZOR3elNlUpMKr5NpnfHR67OHFe5qQkkupJ9T1WjJubLY
	f6KwAOPJ9JsXFr6qEvtGASeK1GFYXP9hHmcKbEXJc3yRtlptmH7KEdJMY4BG0uwepBXo8ZmV6GT
	w+ODR58rYz5qf0icRAhV88ujHQNF3nlIRrqVKmL7JUYWipJClOE0GKVQiLlPK83mna3n91fOGzt
	7Ycl/QqQI7gmK77Dlf53fT93nVIvzi2mhJkR84BThT3C1b2Om8k5hpvH9JD5aDSfrkc7UegOcWZ
	UpjF32YxAcKuhaKs15Y7m6bmWhZNoKBrFSEoJYAiwMVHJ6OrQQb8mpUzpsH3Bu2rnjmco4QgEzW
	fJX45U2M8qWsyUlTkHME1tVyG167h/pioac=
X-Received: by 2002:a17:907:7b93:b0:c20:5213:56f1 with SMTP id a640c23a62f3a-c246a60348emr2628478966b.13.1787556000424;
        Mon, 24 Aug 2026 00:20:00 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1137673466b.49.2026.08.24.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:19:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:19:58 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related
 nodes
Message-ID: <qyrzrmrvymwhoziwf3we4fxwb4nfyhb3s7hiuqauzoco52auns@7rihmyhkti2v>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
 <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
 <aohtVk57YIWkj05I@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aohtVk57YIWkj05I@SMW015318>

On Fri, Aug 21, 2026 at 10:23:02AM -0500, Frank Li wrote:
> On Fri, Aug 21, 2026 at 04:58:57PM +0200, Franz Schnyder wrote:
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> >
> > Add the required nodes to support the iMX8QM/QP USB HSIC host controller.
> >
> > Keep the HSIC host node in the QM/QP specific dtsi to not conflict with
> > the address used by usbotg2 on the iMX8DXL variant.
> >
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > ---
> 
> I already post similar patch at
> 
> https://lore.kernel.org/imx/20260720212401.C2BD31F000E9@smtp.kernel.org/
> 
> Frank

Hi Frank,

I somehow missed that imx/dt64-intend branch.
Do you want a V2 with only the changes for Apalis?
Or will you just drop this imx8qm-ss-conn patch from the series?

Franz
