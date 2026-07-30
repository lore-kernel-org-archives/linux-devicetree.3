Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A9F370D4F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379332; cv=none; b=ktn47fwUShy1Dq4kfMYrSFcE4710PbmOY21eJP3wCdiOCQguCpcWk42L510dLvOgVrf0vUQcVCfjtFW2P2v1iLw+sYrRu5KhTOYsXolpgi/XJX665ZLBw74EppyL8u42l5rZK7FUgcxMrzlYf7ZpnGhKW2ujXXGCff8hH93qoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379332; c=relaxed/simple;
	bh=on3VzepDs/3MHHs0RRL/UeEpFoiTSFv8jJib0SgDcnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Actm0CCNdmHeu0+poqneZVlQ0bgvQdvms2fkTfw3yXzhH0hftthjsQ5QqQF4RpkKtan9o0/M9Q/iih1Q7acHgAXl6I3Yd27Oz47Z8QWGd9g78LymbNEycDzVm+srem0PKtf2YqpZ7AWxrmqdSZZKfENEAo7QfABpT31eV3q7RZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWBgPn3P; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWBgPn3P"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so1840907a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 19:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785379331; x=1785984131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JY27cQNaqzGYLZOQbmnzVq1JmgnQdsEEv2ezwPRKfII=;
        b=eWBgPn3PrZkmAc5r/IYJ7sPVoPhEed9Y2fKWWjjHpixcVfVyEdgdSoiBJ8q7t6WjZz
         Hm39s1jTW9W1lpVUscoLMztLdaNKh1Ge6zGp+9fzqUC5n9vW/eKPDlgjcx/F1wghqOIa
         bkcloqaYEmSDGc0C1fbik5MTfamYDqQSqanFyQ87vyqwybzTFBuvH2/g7LK+5NMa9Cp6
         PxbpRvPZoKOq+nICqNR3UiC8j1QJr2q4KBgRedUvPkSOcVy6K9kg6Fojw3907Zlj8Q1d
         lxbsx1cuYzYoYSJhsLFMYwX0cksXNTzAV8ekV5pRrJU/5NLZW4i3Zdr3PnCJl01DR20L
         3fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379331; x=1785984131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JY27cQNaqzGYLZOQbmnzVq1JmgnQdsEEv2ezwPRKfII=;
        b=qLS3sysjda6ojmnA39GMHzuLGaFBO1VrvMaIaQFL08HRL6IzPumkD8B5jPCQUm0zh6
         6P4pk5OpGZrEw/P0RvywfdKm6PMQ8ZPzxcBci1C+M+/u+yHA3jJht02iLJKs2LI7Pw9J
         nbCbrUnN8Ay0jkQtx3fukENWieqidbLcZ68LObsmfd8KPubbZvHg9Pn84tXugljudVtZ
         UBFfbm+jXkdSHK/dsrSVkWtuhPVEJ/Eu8/HB9JySJGoWON/usxcGBubhDscEVkA8Sxcs
         EZTj23Eo3ixotMsXdBaNEPxG5pmVMBRNq/2vrE6VYzqyJ59zOtcSt5niAPGLl5ZcGPWe
         T+Kw==
X-Forwarded-Encrypted: i=1; AHgh+RpDh7fHO8PHILJAZgISxaCWcPq5en7qwLXZ1t6WF7ubDs4KiTXxdHZ0V4kx2UXuwBuEOCY8I+LJ3K/p@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJKR3ZlHhIxAtp8Ahee0uZ8zQ3sEa1QW6GABr+x5jHn+DkPaW
	8V1+CFa66fsS39Lb66VUex6qOU5HFh1L/khdz/4v2iKup7Z7gwlorLMR
X-Gm-Gg: AR+sD10wustavJdytLh2NTqtzIi90fUI+j80EtBc3jWN6pNEXnKkegmh9CZaJicWL5G
	C4326lg1YW42fe3LTnqZnlBNGkxmQVHTAMfYKA6FVYCHTtTCzk816KQ+Sw8Z/bvchMtk12EQTOV
	NFOiSFOPH7GIRlB6LKDUMPYnTvUunveRdZSjLXjTSFV/5tEzP0jHmFEUctu2AL0tGAlOGZXpNyG
	9DeMPzUPhtS5BEbvRjZdM6fRRMEMM0wNa0FCQ84KAjvCdoUBybCvJNuw7pCF1OQU72IM/Ay6gjD
	JezsVivfgp/Y4W3z6SQGfdDhDyZ661SGfqLyDZhO66lZNzG35AY0jZ326jF0CNAkRuYhS3ZD2Xr
	V4f5LftJUGSZOymeVo6gFTst9jcWs3elVJQTntTnR3e2iv8ELNIsr120jkZiBTBF8xn1ZLNcZP7
	I8pBNAyaALSiGKb1c65sEMc5Pw2zZ+6wAdY1IDIHRownRnO2tlVwln+xdDhZqPzfyjNaqVaGDI1
	Q==
X-Received: by 2002:a17:90b:1a88:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38f9bd73f03mr782178a91.8.1785379330453;
        Wed, 29 Jul 2026 19:42:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc63fesm14037037eec.15.2026.07.29.19.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:42:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jul 2026 19:42:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Message-ID: <82c06175-35e4-48a9-9ddb-e60d3dcb974c@roeck-us.net>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>

On Thu, Jul 30, 2026 at 09:03:36AM +0800, Alexis Czezar Torreno wrote:
> Add support for MAX20830C and MAX20840 step-down DC-DC switching
> regulator with PMBus interface. MAX20830C is a different packaging
> for MAX20830, and MAX20840C supports 40A regulation compared to
> MAX20830 that is only 30A.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
