Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646CF37E30A
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477312; cv=none; b=u9wyh7cCC+5BLYcZd46kqKumRwcdRkP07pKU/7LlG5tFfEFzuVldvhL3hDzs4DZNvKH/iIYplXpEvq1FLADyLqQznLzE9KGF6Ak+42ISSN3lHLrP99U3zOYMPYGItDoRp4JK5S0GGHvuIUp/cTb5PZedzmHKk2QbnI4yRXAcNFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477312; c=relaxed/simple;
	bh=ptDOA8oXfBcLNX1p/12OZLzqrk1BS6t5onLGu8IEt8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VybG/Zh66nYnqf0dNaP+nx7E4J+Lf78Y99PkxTHdU3tb6FinavHpe8n+ppdjQ2n9aEataa2iFc2ktygMkhGrEkeH8hZ4m8oZa/CLc6e6u57OqNNggyAcMzPzpRo2er6e8YLhvY0G8/8AGG1n/JOraXyUYizMcueB4U116aCJF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/27T86g; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/27T86g"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c7973f67f4dso390774a12.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777477311; x=1778082111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=x/27T86gUyqmFKiprX3Eig42Q7FCCl2TkTqFhm0EveKwg9ZNtlWgGtuOdD71R4J+Ad
         g78mNZ31VSgKne6xap4Qepafn42S5ilLNua7qxaSqlGILcW3T+z2bQ8Onr+lKHKaqLUz
         cznRYN1QngzriWUdnBiD6d5nrtXBdky30GuxtsXzD0yTGqYvnmw9pfeFqbqnGUBA1QMZ
         noNSnrmA4VbtXWXRnOq84eXCnzAzVCCDrq8P1m8cjOrlfTBU+9M1Wrm2LXmz0AleFyYA
         uFjd5HdDCgfQRMFWCsTRbWjmvinnIJvlHiTzSX46+ofmFs9Rv82jxzsk7zpV8m4ZSYkC
         jUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477311; x=1778082111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8L+nXE7L85P9lNyL2I2gs9CTUVcJOwgVrd7ZFlSaCE=;
        b=aGMU0iaN5ImgAPKgXM4WKDThDG3VlX0NKLKGz42UxwcBKtR3Wg23LvkhGbG9IwHliL
         IKSJLvrF3LUM+JiMWmg9ynNH43qhKvbWH8wpjf5bJLi0nNjDp37pLzV5j+F1QWHDgZok
         KPYCGsnJIc4M1DNFTZxKa/+xheYMTmU7nT8UTk2ml5B9mVZ4kJQiZQblfNFdVA6+HEVZ
         GlSTAi0RbkyZokH4XxbCncbAqFiJP3i7cVpWGmuJZflcpsRNE2HlKCXxF+xftU6+7s1j
         hQehRJeowujkxadoxMUhvbXLdcAE7hz5fVSrvvsoqBBJhPE7k5GLBeOYPxBDh1KAUHiI
         c3Hg==
X-Forwarded-Encrypted: i=1; AFNElJ9bD4PJm9xq/dKtNfuCNoN3PuUUc8pbj1EWz8CVlf24GOXdd2RcozTAhO85DTyrNvA3sI8QV5L8Ruig@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2FBBF9+QOPaqjtPD/nBtru97g5o7QtB6Al9BX516nBDdnyqk+
	FQW6doWQsU9uv+hdaDWNrWeiJQwuZNJIcm53MydBTqtmjeSB6bfnv9SNy13PmbhO97I=
X-Gm-Gg: AeBDieu4Nmi12C7AeBsTQmNi61hLO9QTyXV4wAcFCN1ETB1xX72yzWusAyqKN2oQSdl
	JarRDsbbEIpftMv5mtHuLMA0s+rWdtMkARB6ugNAG8GZRUkhcs5800uERaOXivaIFMPnya/bz92
	9DBMHPpJZmx7bWkmA2weh/XSaRknBUJSMhJ4AeSGNTcecy5bRvYbE84YtNy8BzST+mIQa658VeI
	vAwV0ozgHS0GFVkHgjc07oa3CKBDiRQPcyBRjaKQHhLijR4vmZPvE9AQoEx8ec+zO8RU9/Cz0LD
	ijbHQ5UaYVdRzQ5C0sW32+x32vxC6oy+zHNuq80IY47xYwklFpg+MrjR/idXhHV4j87NdSGZTiP
	ixdfX7zV2XgQ5Kde2Y31yCNwHUJtW4CM55KBl+tO6KRmtUnjquVoqBHsfFjlMlsN3lIPDMikxPm
	QgmWAvylEGmuXFGSHDazwXW5spTsS09OvwDa4fEg==
X-Received: by 2002:a17:903:2410:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2b9882388cdmr33673325ad.17.1777477310614;
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8131:aef0:bb67:5559])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98899055fsm27045325ad.80.2026.04.29.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:41:50 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:41:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Padhi, Beleswar" <b-padhi@ti.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <afImuoeHolxGgw3H@p14s>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Monday, April 27, 2026 3:49 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij <linusw@kernel.org>;
> > Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>;
> > Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > > > struct virtio_gpio_response {
> > > >         __u8 status;
> > > >         __u8 value;
> > > > };
> > 
> > > It is the same message format. Please see the message definition
> > (GET_DIRECTION) below:
> > 
> > > +   +-----+-----+-----+-----+-----+----+
> > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > > +   | 1   | 2   |port |line | err | dir|
> > > +   +-----+-----+-----+-----+-----+----+
> > 
> > Sorry, but i don't see how two u8 vs six u8 are the same message format.
> > 
> 
> Some changes to the message format are necessary.
> 
> Virtio uses two communication channels (virtqueues): one for requests and replies, and a second one for events. 
> In contrast, rpmsg provides only a single communication channel, so a type field is required to distinguish between 
> different kinds of messages.
> 
> Since rpmsg replies and events share the same message format, an additional line is introduced to handle both cases.
> 
> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to uniquely identify the target controller.

I have commented on this before - RPMSG is already providing multiplexing
capability by way of endpoints.  There is no need for a port field.  One
endpoint, one GPIO controller. 

> 
> Shenwei
> 
> >        Andrew
