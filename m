Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8054B1C1
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085203; cv=pass; b=HQSyZ7APr3qe2gbOW2hgtcfyvqs/o6R33j2Zb/AeRvNeErBXL2nirbTKjNmxOpNxTKdgHHdvewj8c9G9dXn+4gqsnFfP7xpxo1c+6lHZUbu1wkLy7IgWkeebPZhoNpmc/GjT1w3ga9eYRl2z68DJ12fcupaCoVNH1pPmtJXiAgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085203; c=relaxed/simple;
	bh=0hurBNTkrVz1B/9TW5ipWegr4/ZEEZE2GB3faJsOdT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rveZ5qudHfNHc8PBETWiX+y3rAadG0G95jfJrv4JAmujlWEkQStxLeAu0M4wYv+6GPJY8Xjy4UrKnAFtmSj4H4uU8RSMPW9bnS3HQegkUl3VMWA/YZWkWF6CYywSCOvPZeTRpH/ImlvCgFohRUbX0V52SqvfmOo02tNWPRyIxng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBxsn/jR; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBxsn/jR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so6071521a12.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085200; cv=none;
        d=google.com; s=arc-20260327;
        b=kk9tF77w6YKLuz1jsLqIzZrZ5gfUPnMvELP4dPr6tk6vfgilX5lCEU5MY63ntDSTzI
         fe4AGZFJPLY6zBVIwTxW0dKTtCZHkeIY6OiTmQErsR+pC81lRLPaw9jN5GE+MfH/F5T5
         HamuTFD92SoyjBtBQn2dUMSm4SBRnwNKCRjCkT6q95M1yTJczINGbq1wHZDiXO6yI/W4
         bvXNoZZ0fbg2acbtURKfPRcBrhhkRAWipK2d7wxa2hbHNOKgiChDe1r/VIVmfN1PhmXI
         IzOFoy/v88rn2VErXfWFBztoCbrko0IvsKZUcPsGbinAswc+DmMOhzpD2la48a/ZvbWP
         37Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        fh=t7rHOIsf4AKC1GucOSjibJwsQzIJFYhJ+SJFDzHZ734=;
        b=kE+CJ6XUk6k5bOiczeu93lgWDB8YO9I7bK0LqgAThEFwp/LizvCIQDAQwNgyvuTMp9
         mN93dMW+JGPFzYdnl3VKafKwgXSofVHYH61L/+90xuPEucMF5ccx1uNyQVKbWaCSx5W5
         kejBZbZMS6X/oQQ3/7jh7HSbhZKFnceSkZb5IVVzjI6k6vEunKADef5+X3hxyW3EhGuK
         6XRBXYw3NmZWvRitfFpyauKFVtFthw4mh8cDHPMXiok0FiXxjR0MLgf0fQoGXahGQIWo
         kL4ym3Gzch17a7t8NopsoRWZmXmKyEnOYopJuA5aZFaXHDIVONDkJLWrY2Tf1+/JoI0L
         ulaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790085200; x=1790690000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=JBxsn/jRsaGBMEy12y39mOfB9BBGyuwRxzlayFrew8tXeXkG9tehN7PlX/5mljzimw
         gCF85PXhWZv+i20SnAc0zjcjbnclieOi7XMcA4UyVd2gSS39sSywN8UKdfFPHsmlEeuy
         hxnX5VRNS1ZNkcUT2sApSfd2nMQdUSJ/ERnEiUM1UuuGJZtE/Yz3eJ1BO64q/4zPMqFK
         R/TD9JAKZ3TCtSrybpiEG5nXpme8A9IVnYh6csgQFh6fXUxsVg/njZv4aBcrUHGYiRVl
         0lZO+lKjaj4VRtThlQANUrs5E3fFFqC5I2kGvWb2I6fKCQ0MspGPYqI4FTrpbgb02EfK
         EO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085200; x=1790690000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=BTYv0xm+NjPo0UM+hX9pICl5S0LIAEzTd9TD+uVhcy0cRbIFPEtqqO0P/9ew5JwiVW
         maB7JzzJ0oAwguWhxLjIy9dmDCoYzI8GzUdxMwFhTs1YgMuCAVe6nhVu3OpiewrgvBQz
         wLK1qlv+1UkIzs6xTRXxKT4rfDKq2MclYFY486yIEWaDN+qKSBZA8hETY/jBv2ExrUS4
         29Ia7M7HQlYR2MOslO7RCTYLQ7c05QVc/zx15Pii8FHed2hzm9VpFVW044bqXIMr+lUx
         7yPgznfQflHRZWY+sxGz/t4tBVJfofoGCykmrZBlGlwU7MBFpHhj5RqG0NNjmlcNf0Jz
         eQzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/1Q7rd7IIskA137Bkfb27r4jl0j3Eoc1tasUhX2EN/VCDHxanJPftYCSBLIEddC7zFJyFboxLaOFw@vger.kernel.org
X-Gm-Message-State: AFuF++no26k/XWmvzgJ79ngmM6i5c0g3ZmEwWUWHDRpl4cFX1qR1ZZGR
	HV9i4tZppxiaYHh8tN3rx7jdR1SKKcXwDTwFclKmF89CO5jwkfipCxZMjiDNSqt6iWUDh9QYpgX
	hX2ETvB+buhqtwPI93U06pXPeWhJGoS51epM4qUQKIA==
X-Gm-Gg: AYBFou3py9K7yoFPcuSdP0Vj+603N6YcBhH9qqmiwLXwV84Wrza11BnHV3NAoetJOxI
	p6e89OzDotXTwS+EIlGWq9C9wL7pTnpTk/UtII2SlTyEsFg/Ar//WOcs2iyi9jNifdQ4JzGj2QA
	of1UqVumk9myLzSuhB3J+7ds7G9aOGZTOUVv8GunzvUlSCcuEtJpBcPDk+rNqm581ndI3tdBqCq
	Ce0IITL7Gg5BHbQ+KKj2A5qVsmjZqmPgIVPB4We1m7C5XeTMusbhXDuID22oknZf1vGk71ViUsT
	ptw1X/9KlSFleja6o7Jmh1qgz5i+p4W9dB1vrGvSkMHxWaCfkYJk4tZ1v1weYGUYzDMQDhUEr+W
	3bXLmVWuDfaR7
X-Received: by 2002:a05:6402:20c3:20b0:6aa:9210:262 with SMTP id
 4fb4d7f45d1cf-6aa92100342mr3351155a12.22.1790085199929; Tue, 22 Sep 2026
 06:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater> <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
 <arIfj-1Ji6HEBHLJ@bywater>
In-Reply-To: <arIfj-1Ji6HEBHLJ@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Sep 2026 07:53:08 -0600
X-Gm-Features: AcwNN1V0zenE0U1QivuzVoqHQLJIIYIxl9SSuy2ocYOHZBqajP-1AfG4uh0OqKk
Message-ID: <CANLsYkzaxwx8NJAOki_wkzauL68ourd12qF8PzzVKW++PJXZfw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:29, Francesco Valla <francesco@valla.it> wrote:
>
> On Sun, Sep 20, 2026 at 09:31:11PM -0600, Mathieu Poirier wrote:
> > On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
> > >
> > > Hi Mathieu,
> > >
> > > On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > > > Hi Francesco,
> > > >
> > > > I have started reviewing this set but given the size and implications, it will
> > > > take me a few days to get through.
> > >
> > > I'm going through the review done by sashiko - would you prefer me
> > > sending a v2 with the trivial errors already ironed out before doing
> > > a complete review?
> > >
> >
> > We can wait if the errors are trivial.
> >
>
> Not all of them are. I have been a bit to naive about the bounce buffer
> management w.r.t. what can happen if a memory area is not specified and
> I will need to rethink/rework that part.
>

Ok, I'll keep an eye out for that.  I'm already halfway through your
work, so there's no need for a new version now.

> Regrads,
> Francesco
>
