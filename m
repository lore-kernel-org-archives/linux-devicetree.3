Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B741CB31
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611342; cv=none; b=too4Eiu67bOtbbZ4vRnwLVmVEZIkFGwWQejLBY6JTFRyr3ODeZ+og5KgF8SxbJFuYh4cHB8oJJOkhIBbnRjCEBqEqY7uD029PM2EIDY1YKQ2tl3/bA+W5gL3ayTRy2WJF9dXJfByfjKCBfVtShGeo1yZjzVHSq7Q6hBEEWiLZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611342; c=relaxed/simple;
	bh=1/4PW6x4FDuSiAKRM2GIt3qqfrjfK1WNCmaLbjGSdZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KC9/JAJ50X0zPBDLAGvPojY0i57YOGyGeQLMUgQeDgkFdXIVNE+j8lMkCvaNkAGwoXFf3VB8ZK4miTw/ke1OuyyDXaoom60n1ruSoQT2rsTlBv+f1jezBHtn/2MfBJJIMpPLTdL/id5vmIlkhJc8iAX4URW46OXKOJBJt6HBKGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdUrnyrH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdUrnyrH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso52980a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783611340; x=1784216140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K/uvklV1w/Xz/LNQ35vn8qa1x6r5k+6z8Shkoe94KN0=;
        b=YdUrnyrHTE3rrDDaR8ilpXdhNmsZyK4iUduagsZAAa7uZ/Wk54+BdRQBb5pnwxUWxm
         nGwMbEhxSWVr2m3eD4f2RQooINJDcwwTJptyEp2d0dp4+viO8f4UIme/AJwTTTVecD8i
         QK5L3KPlnYX+ECakONA+hNsGFzdxB4OOFFfU3pdrZgfw/TNXa0AQ07AYnBIN2/YAr/vK
         Fcu5FcWvxis/Iv6OrfxqNNrjiupyCkje1qS/8LBaNMypldIgQLC8/sgyopDjFEqgmEUY
         P8HPLAbV0E0HDxummXW28ky4CC1UDeirqzc2ehKm/rBos/rg7UlWLwvooGpbo+iL28/F
         x3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611340; x=1784216140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/uvklV1w/Xz/LNQ35vn8qa1x6r5k+6z8Shkoe94KN0=;
        b=GtQWKOFQjOMSmr1gMbnhJWHcJsf6W3GYoWJ83KYau5Xb71BObB7TWuRVgnjP3nT0eq
         tTolGUraRsUvVSARniGh3wsVrvBGMfx/yan7ddVTt1f9mALGSdKUdJvDT2IMlENiNaAb
         jlLJ9Zkp6IN33WdMKjmMtjXRCeuG6cUx1Fyyb7NrpwrpIqVF76P9w9GjR02AaZBySX65
         w4zl2Tv65/9foOIIMTmfCC277c3diik8PoEZ9TF2gjKpm7AJz4Idx0bbLL390bIPlvgY
         OKkZnrUcpab/yInz7CEIlR0XuOuXs8wGn2KwuZ7pVUvqEIH2ZCGAppFFeAfnizPeNlUm
         rxUw==
X-Forwarded-Encrypted: i=1; AHgh+RqUqBPGVgu8hfc1l8UPfI9Q6rJajVGwSsFtchbwAmVFv8sy7i1p4PLDEaOnBjKdBT2UfaJxTzbs2FVu@vger.kernel.org
X-Gm-Message-State: AOJu0YygmgZQNZYa86hsj7dp1lOCC6OFdEl0VwbyejmuymeXhSR4woUQ
	aAaAS9Rqxb6V77MgzCbpz9PcUpnVDFTgLo7vIRtWkpyzAySFUMJ3Jmd7
X-Gm-Gg: AfdE7cnUHt/Mx2jGoDkM1vtvK6R8ygoPJKeiJQSUFl19ACilQ5CqK+wMvcJtq1HzDax
	6R3VZuLdYpwC2s6Mv2vF6hsDC7ZIko8CbcStcpit6ED8M7QtduNJ5MBNUMDN35OdFe7hy4/4PZv
	r/culJ4HfSwaGAJAHBkcU37PgYcjQTAtURCpAgti77o9QBwri/yu9j4cDIfhyobPnEVMet2TkK9
	e1m+mmonwL2ak2QVjR10PQj28bW4A1IOUuon1RjHIBjKL2nyQBLtnkPD+6d7T3r2YLKLeGZF49n
	ADWWvhXCExuHQHirxK0u0Y+73Hg52ClqNSwG5JtUhLzP6iu4XMuCwaer/Bqa7K0sjkw60FppYkp
	0lAtIsaDfkyXvtIYevYvNP7jOoLO+/WDXiGZKS+BxleqgBmAXyHf0XyNwF3VRH/wphMvm2WwX3m
	TN9i2Il1m+lp4+pKDQx2vYxnZpvw==
X-Received: by 2002:a17:90b:3fc8:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38941cc4cffmr7418024a91.21.1783611340144;
        Thu, 09 Jul 2026 08:35:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5888e974sm1466015a91.17.2026.07.09.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:35:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jul 2026 08:35:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Fred Chen <fredchen.openbmc@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>,
	Colin Huang <u8813345@gmail.com>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <c3485773-a782-4115-8bd5-8db31dfa88d9@roeck-us.net>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>

On Thu, Jul 09, 2026 at 12:58:58AM +0000, Torreno, Alexis Czezar wrote:
> > >
> > > Yes, in my series bindings are not in trivial as we support the enable
> > > gpios.
> > >
> > 
> > Same question I asked before: What is your use case ?
> > 
> 
> Hi Guenter,
> 
> Unlike my MAX20830 patches, for some reason these chips (not only Nuno's max20826)
> hardwired the bit 2 in ON_OFF_CONFIG to '1'. This makes the use of gpio to enable the
> device a requirement.  (as of the latest info given to us)
> 

Outch, that hurts. Ok. I excpect that to be explained in the driver.

Thanks,
Guenter
