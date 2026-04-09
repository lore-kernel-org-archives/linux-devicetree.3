Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6483859C0
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720930; cv=none; b=N/gQQlIBc7KZXKx6S5PZIh/zcOkqdCUI8630fxrGZ9xkiHmo7LXcQrnT7ormLPp7g6ZXhl+SVGKszglHXayztNajWyxyITjwxFL/d2AcjAIh/IuE4w3ZuKxAi8Q03H48oMPsJS/+HkWO9jbqYgjS4zgmSd9dKRzDdvaBMRqU8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720930; c=relaxed/simple;
	bh=CNFB9BCmZvykJHd/6qFTyqv7wQ8Bpi9RiQylAO3FZNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/OeN4QB5bEACAmhnXXQDSOdzhLviuTONYvLb6ahR9jL4qY42uNMiBV1iijoYFKOVuBU57jJEe/gSSsmL7skowA0NJRv5qYjKTDP7tjFGfc05A8LIWJ5DEyzAHlwKkpYX/vTJ9uxAqFf2hc1C4h9IaJD2uYAjRBBDqH3pkHE5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiH+tsrI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiH+tsrI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43ccda008cdso273195f8f.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775720927; x=1776325727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rxRaGky1PDExK5cCBC91gIZwwHEAgwUQ6PW8LpppLKE=;
        b=YiH+tsrIG4oYw2XUziVtbbuhrqNU94xHqsa5SkmKUB4Rtfrpjwo2HaJVEa43lx7abw
         YOD+n5AFfm5sT9po0PG7rq8dxSLj/Zq6ye/VBGujoVsTB8fQ9evxifsE42xBagcBJxEN
         ONDdiWxbKZU2Q0LB02Pzlp50V+g4N4CDndzdd7WdVzmDO5iaDbYOf8FgrM8Mo+lg3qXT
         KRADA7027TQHSS7olJqevLQ1FxsaGNK+3d+FUBfFcRAWpNZg1PrYOfG15eQOYUduFr9P
         r77kvnIvAyPsTsgehA6XLB3tFJU5SjAs/IwHykjS/ZhC0c7cd16+6pJD7CSApzMw1adE
         JiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720927; x=1776325727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxRaGky1PDExK5cCBC91gIZwwHEAgwUQ6PW8LpppLKE=;
        b=Y1hXEnRF3b5LKIJ8GZ6/sMjIkw+FJT81PaDRRc4az2zH+um52mHMuNNjnIz+Jg24b/
         fiRK6Ca1JHU3ChWmGncTrxQoA3SuvqT7hGiwgdSx8ryBknggRicK6+2W03xrgPoAe6Hm
         VAYPmzQH5nt0MSDfUmAMCgdgynNIhypa8pIo7DjXhowdIhs8wZkwktJTiklQGa1cKavi
         +uvrS11MzG98ILQ6JNf10OaRXgSrNaX1q3uB3+LMbsqFo8kRlmh1F7GZlFu+X5XWU1pj
         4d5i+sG2QliFdJTcCfVOeeDHKoezQ4G+GDZWxJR8urBaAbQQzmeSkuQE08L4jg+/Qnm/
         sxzg==
X-Forwarded-Encrypted: i=1; AJvYcCVDNPkexLSqwuGTar5cpcTvT1iqRIT9NgK3UhKlJKZTJicT33usOZ88TULcMJyE8p5X+uuhbDPibQ4V@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNt13S/0acHN5YNXtjAfm10OXXMtXvAiPq+UfBsry0C0NyrC4
	if7RpLQtE/VD+3aGWY4DI7BuXSL/z5jPYo0FB1utoSCUInWvkAavML7SmZSqXheo
X-Gm-Gg: AeBDiesoiBMg5hLv6OE2FdKrFK833c/EYPEBWewXL+7SxAoaxgSQF8hvrhX5if8nysm
	V8fbj7MfEEo7ip7Fu04pdXlai/zLgRTrCzXjTRYXbkkJThz/FDHQMWRj8/qYuT7kLyR+UYiyX0I
	tOX+8L+NdA1hS90i9fSysRA1T6IYVTgbMNI08oHESWmOeVBx+K2TeCgYMCcUUNCSNBaZ9d+pz/5
	fvkT2glGg/gVjQqpXChlzM9ZRJuripLYYkuKmPOA3/o/hagYEqQgWRANP3n4FQkYZyRp3N/pZA5
	a7oa2EwTX4wyDzH7gd179Dg6rggezUWyKMPacRnVo61vZj9+pWYElzRED4dsJaMfCTEQ+TbvGml
	sysexowVWUNNm/5cil48BaNrOIJBTfdm7aI36xua7X4yojh1AimqtMMslF/SDnUlkjT0rvoxvyV
	nV/TMMp/yqBmOtb5Vuzuj0ZsOLFtcXqyXd7E1p57++cP+G9CJKOafNnx3p2r6BwA8KALlQOLOiH
	M4Dg4mRUoK4y7d15tpV304+G20rnSa+wV57V0QJmI3k6Dd4I9KaBw==
X-Received: by 2002:a05:6000:2506:b0:43d:1598:2d6e with SMTP id ffacd0b85a97d-43d595bbc20mr3631331f8f.20.1775720926997;
        Thu, 09 Apr 2026 00:48:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f5bsm59805211f8f.7.2026.04.09.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:48:46 -0700 (PDT)
Date: Thu, 9 Apr 2026 09:48:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX91
Message-ID: <addZ3BNYfwIrFBuG@Lord-Beerus.station>
References: <cover.1775669847.git.stefano.r@variscite.com>
 <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
 <adcdWdTcVR2T2F5c@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adcdWdTcVR2T2F5c@lizhi-Precision-Tower-5810>

Hi Frank!

On Wed, Apr 08, 2026 at 11:30:33PM -0400, Frank Li wrote:
> 
> what' difference with imx93-var-som ? Can you reuse it?
> 

The imx91-var-som is conceptually similar to imx93-var-som, and I used
it as a reference while preparing this DTS.

However, it cannot be directly reused as there are several hardware
differences between the two platforms, including SoC integration and
peripheral configuration (e.g. pinctrl, and available IPs).

So a separate description is required for imx91.

Best regards,
Stefano
