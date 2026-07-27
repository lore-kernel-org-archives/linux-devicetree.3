Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24F037F74C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163341; cv=none; b=dk0vChf6ga7m/rj/421z58bPXAtP1CZTewCOu8Vmo5GkRgCtcsKaelGeaZvnFf5EmsulOsUACBZLsiR5vQX63tMTIxNK5cm5PGIJOr/R4EtKYRLwnXwupH6S672Q2eysQYZqtTwwjLKr08yNVVSe0VYawJhMviQpnzrp3iUrPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163341; c=relaxed/simple;
	bh=YD0UymCDWvCVhyHZgVslw0dtDn3zgJ0QSsp7pv1B+5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUl/HdrsDYE4G++w9dpQYvy+5GkpsGFDoL50om9e5/3HoXUjnmB3I47HmHfrmKw8tBMc4ASYn7GsaTvGJfsAxhgIeJTF5jTXikwCzkqeZwyt1RJaNb9SfHclao/8fVNpfGHN1kfa9sbCORmfwpKl8fhqIjLI7J6+wWhbEm+BoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMrmNSxs; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMrmNSxs"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2587100a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163339; x=1785768139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dQ8QD5HYV7j6QVAlE7qJa2eaoG8v8Hk5kMhrUWBN7qA=;
        b=dMrmNSxskvii+Xc1E2DKltI1lQlCGqzxeT9bRwN4VZdv5Ywv89QTg1FrQkwAbS+12i
         WzHa2+HSEW/9p81lr0FPgK3dImQvb5TOOMzPiU7ZF93MO13NOMqKVrX/cUsB8cIzTGkK
         a2V6WN8nUZUbczURXKw6gAOVtPp5Lc4GxwkEf8KbtXM8gKstTVbVOeLwMGnyQ5RHjBe7
         gt78jYhmJ3NY2/tBdb+Jf+Gz6W0a//M9dhTtZSWnHdfwV66TyJVMVu32kJ+VtlMR8l1Y
         CxADjHmcStU5oxtJPbOYr/FacNhoboVAbew/UfcEG1CVvFYqxq5tLYkH2AxeMucse0q4
         dx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163339; x=1785768139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ8QD5HYV7j6QVAlE7qJa2eaoG8v8Hk5kMhrUWBN7qA=;
        b=rE8XO7FCcUv3D7GUI/f0w9MXYsesDyanitFimjX4KjdZ7lidSIOQbuxa8TWGBbQcaj
         seml4B14n5Blj01dhDZI2fr178SxDL4hoNjju7gCbEVsEWVT5723++C9BTGF0dSWkZ2j
         bdjDFeTUZL3Pr7IQEJ3T7s63b+fVyxHwa2DFHfGPM9GOC7jGTbps/itN3Cd3/JDETZzp
         5PJmo9YXsw+qf/ytTGCQ/OmrGGmqOI+5yrhuo34L3IILc4OPeh1nQxxQ8/YhQWkA28D2
         /Rq6U5V7OAO3k9ybdH9syp2KWGcz+DhdOQDJvqwIOOlDwqKtep2T2cMgf7HXnfsEB6+b
         ELJA==
X-Forwarded-Encrypted: i=1; AHgh+RoW/p10VU392UKED6TY8xicusj0A0nQD9Z9+M+W4gQQmawvj6JeHcoagMIROYlohKccjT0HOiJNg44J@vger.kernel.org
X-Gm-Message-State: AOJu0Yyscc0L75XEyM6ZLU9QfkNQNxeQrvGgRRi3+MByR8xhJDhj3o7L
	myaq4geS9Sq6du4gnYSPToSUiyf6WkrhcpxEsS2GW6pgk1CCZHEbLk94
X-Gm-Gg: AR+sD125tFwvlG9p28RjJ6pOfSUL00/TEGl3POeEKbCxbYoKzANE9IDE/K/io0hpv19
	W4n6AoPbni7iPy5yZjIA91vtnyydWvDqGrOQ/ynB8UGrawZXoziWQLo95Q/XZemOFA2MObsfWo9
	NKXvtKQMTtZuJmdd4BrxqFVU9e6OV1VdCIgpnZk1QdvbNyn1sgcHNo9zUKjCTY/KB4ZHNCsuFt6
	I3bran8HA2jeQyPcXaSyv7WU0T1umOaBjcFWrCTFo0asYMkQ+clc+7lfL+7cqnsCy3QVVJF5B2k
	nzxsZs3ayGfR4/VhEPq6z2MWsaZGWUvdqF7DLqWpr6pEQhgrb+6sHbxESTKTadMqX9AddBs2KLQ
	aq305bVEYC/Pxi8OAluSfE4Og6Y0lkDeYlNNOISNFge3Fgte8PLFKsLWnJzw76OsDwtmPazrC8+
	lHtzCSnXNekRcVmPg=
X-Received: by 2002:a17:90b:48cf:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38f2960eb33mr8297161a91.27.1785163338620;
        Mon, 27 Jul 2026 07:42:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e52f0c6f2sm27211956c88.11.2026.07.27.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:42:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:42:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Message-ID: <6d235e17-c067-4cf1-ace6-dbce05280d8c@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:40PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
> driver.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Applied.

Thanks,
Guenter
