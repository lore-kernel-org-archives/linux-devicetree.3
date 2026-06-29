Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C333A8724
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766586; cv=none; b=gphxAVc3vCMobcLrNQx77102wJMdkxXbzHe4ua3NSpr6z8aWOQC3qxnO4yFBCOg8zbOEpoK0Ht8L0/KoKyb3jdSnL1iKPW6KPXfHECC1mkMsGg53HRW+dCQUj9aKHr+FVZbElW9l/uShOLuI8pjXKS1GUNxBf+b58+LKxGB5COw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766586; c=relaxed/simple;
	bh=hOjA7jyxnCOr2nR/iV5EM553jiCr0R6uUQ7dUhFldgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpYR55zKUeULjW1LH837Y06issrcDpqgARNZbJtzK/cqJuCOB7VyUSQ08LOu2Ins3jeUz4DxARz9blUDlJEWy3v/6RKzGDVL6fJnOIuUUkWAK2s8fcToutfJIydzN2vPhSmeaQm1GfrEWMMra3y10f6CPx4WLrSiKn85RE1rBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCyy0+Ek; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCyy0+Ek"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13810b63a1aso272390c88.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766582; x=1783371382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUIpMiKwcHQA8nQw5M6D2Ujl90hrTvX4L+5YziVwAGA=;
        b=tCyy0+EkYc4eYY1TlhVukkRRUYhzDE6rf0LeSGOStApRRiChrbISOIM7LY/8yh0c7C
         0v/th3IJXs1ovn+OuYJjUCKmOGJzKXpyndQzFMd0K8ukdCJ+41em1RxZFd2OZiJQvjtA
         mZXrh22ZX78xgnKMjoeOyNdsxTUy+nRZuk+jOMFF8IowbpwEr6lC/kpKcCuPL6Q05MoE
         dAK3fA6pZakp0C7zx4176ISguU1WhAPneVCSpz8tO0rzPGfjtgXtTsSG6IQAHuZL2h7K
         vGxwgMqxs/uWVYQw7kUOPkwawM8aPgNe4RLXvVhmROt10mK9+0xBDgAq1S1n3WDd4B3U
         CEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766582; x=1783371382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUIpMiKwcHQA8nQw5M6D2Ujl90hrTvX4L+5YziVwAGA=;
        b=ASgIa13wb/n5Wk6I9SgkDThD1KKcXLJJ0kbVGvmLXv0vZ5sXGmiwu2xeDs8RQwF7C3
         QjVVM3y+qVOu6yAJFPF0FEPzz88ec/nJ117s+q8enbp4uNa00IDjN+ltssaiOhGv/Yjy
         fxpEZGgppRmn2303f9JKVVTZ6AjsGofFG38XKbe1B7+Nf6lEZFYPTWaz8drX/vWjKjU5
         Za4ILXzkY5nXxCXSLEflKnnsxQ8nWzC/rl5Z6mLKCyRTb3hunAmFFZqMDZ8VffuCxhHp
         FIBk80OZTrjTcSN/3901jeSMWKW7rztlU/yf4nsEb+DqufnxeBGr2Luf52xmnieX8aYQ
         hM7Q==
X-Forwarded-Encrypted: i=1; AHgh+RooQrQNnrf0aASDd3eYYpk0VwJmwnaraw/aO+yemOSXLq3/s0OxH9P6kbhWb1v77s92XmvD5Wgnq9hb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0bA4Z85L44GgOb8uRL4ij/OLyqzXPTiPTaNrluMV6Bar3wf+D
	dMMzYn37lQEzVntuuGdrbRRIxgLqgVGKH8b4WboXRFbukS3vd1huubv3
X-Gm-Gg: AfdE7cnxK7ewlJIIh/mBz7CI0PEnLS3gDb1URhiBm8tTOrcn/04OVn6FB8DmsPeBu4q
	Yi/bYgV95nSX6DPGjh2WQFB6raWkbLGplqr1SQOwN7L4r8vh1Dj96JTBQlUfhz86gnKgLLoc/HX
	JWK036Cv1unDrkjqPzLuVfXALjn22WhY8vdUVOaSAefJaWUwzGR6Tcf4X6Zb13ubsVgBVVAokBc
	JmL71yw+YMOeWT5QLdXtZEp2z7WfAJfcDWtgICScJLmn1z/8+3QE0y5aX+6pP0yG4e2Z1EA6awh
	TF/e9kqWc/n66jnMVFjUpICOOPriNwh3nEPxnv68i5OUyKEWNPyDgQL0F0OjnT07IVuXNRWWkyB
	fGWhOgc7VNRinX95Pg5SNUjD+kjm4OoXdZ6JFHcSoXT9RcWKWaNbEEnFf0AN4m5cpVZ2VA79i8i
	B9neVkyTifdlPxdJjnLYC4E3S6iw==
X-Received: by 2002:a05:693c:25c1:b0:30c:ab97:d7ac with SMTP id 5a478bee46e88-30ee13e74a1mr681617eec.38.1782766581779;
        Mon, 29 Jun 2026 13:56:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm1083869eec.15.2026.06.29.13.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:56:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:56:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 8/9] doc: adm1275: Add ROHM BD12790
Message-ID: <819714dc-0193-4667-9885-67f30b4b0bff@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:25:33AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add the ROHM BD12790 to the list of the ICs supported by the adm1275
> driver.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter
