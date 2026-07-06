Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60C38C42E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358247; cv=none; b=upgNsADeVsLd3P5sFo4NwJ0zYpspoEliuYjLUd2h3u5UCcjbcL+Mhfl1V0JYkG4TnmhtrzYtmSJ+UauFBK2MieLFiv0gA/tGhVOWBWsN3x6ENCEWT4hOw8bQLVS1KcMt5KIYDhVEGo9LubP120YbGSbQweiPSS3mx2ljZOjdLNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358247; c=relaxed/simple;
	bh=riyPIwYaWjanobtBFBZvlBfXuKQxg5Ymzh6XyZLN44w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Md2aCxUknWXquGmeDclWhI2A50/IWu+t4THwcCGF738Ntn9HgKquvGYzerF/YulBnDlXw11zlBKE87dJXC1ch70yWZHpWdFO8Xevy9BiR6jhR6uzFEH3wAIaG9barzNGpwdyNqkSEsCW6d+NntONe6GDZYuVNJHAXzdv1utFrv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VJJUdRzD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VJJUdRzD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4758bd3731bso35179f8f.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358243; x=1783963043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=riyPIwYaWjanobtBFBZvlBfXuKQxg5Ymzh6XyZLN44w=;
        b=VJJUdRzDJstq7do+I93a2hlibySHmVC4E++iAXc9GQWRtHjKd9USPAzi3QkeeUee6x
         JnCX77eelSizw32yXyjpqCq/ttANOgsTN+p85NDRcHpnwZwL9BcOS646v9wCN/+Ctdk6
         slhGPwBQ8WCDRruLFZdD2VSuBBukEe6rIrjMFvii1mS1JysLYmkrugoivczVTutovy1U
         3LcZyFs3ps9CsC6K8SZmLFbITj3nbbyfmxQYF99uQ+INsxkBb3NytuqBfgaQqgqpCiZA
         SbRq0oljCS4+2JJUdj7CHFYATbNU5x/yF2/3orLMEAr2LSrZswVAk1flF+/9dcLCLYKs
         iKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358243; x=1783963043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riyPIwYaWjanobtBFBZvlBfXuKQxg5Ymzh6XyZLN44w=;
        b=bbQsqaDM4U2YDhdMDiTSTLpIV1nH0vcwkPGEK0EvzFrS0jKYY+xMC0dFrjetObQIlc
         ilEm26w0C860mL95XAu7rDG+p1yWgETRRQ6VS727xFdyAw/W2D4/LBEzPPvYL5gzHKLA
         b+wXRAG3oca5w1UMrLM2v7wFOLi04Opu8CMXx7Lt5Yb/VNvpOCRUjtRavNoc+4tjxGD1
         RXlJKJ4SNKlc+AG2IdgsRUpYl4NpZdXd5NYdWlBmwZ8n3bOmWJgBoa/fzn5GfqocE69x
         oJQ8sQlsM8Vq/iHxdQjbiFCtD0q2n3ioGj0kDm7sBlaJ6kfihSy2nskvtsPpUqzryfhj
         bbUw==
X-Forwarded-Encrypted: i=1; AHgh+RqSMxE5TOEyzICCOoLhG+O3jdq81uwE6bSfkFi5GmOpvORR6mGuDaPEUc+OAEAuUqRWeelPvxyeXUJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YxPny5ghDSqKfsdEZwmqD72cMagXTM/4UhK/Zv0FEQ8YNG0jr9C
	LrEEmfkYNAvxWg7Gie3Jh2+VtllwhfMujn8f5Q5ORjIR/X3g+dcHjhDXPuDTEEFyF6k=
X-Gm-Gg: AfdE7clRnQh32XWyCBny2T8yF32Fb6n0x4etyrAKoALgKBSWkVAAXuizkriZ1h4XjFY
	wHVj41hpxGOhfizebFNh9RH4ysvdlLVJX54Xzrd9nDoQHZGe0w7NJ/uhLs5PB+JOjOPR4QNGehS
	LrvmsrgWlbmDBLEfn2clbHIX7BwFyKv8FiMeGelQO4jrkynffotcCMPxu+yoWzeok/Qmlv13ltR
	QkoTFE55U5xvgR00SUuw9UXqrsumcVw0Tpz77mPNvLtF1cc9G77XLT7P1XC78ktPQo1spTYWjtH
	aa7f7r7b5+N0Uz14bFmyXt9bxey+AhX4t0pJXez+NOGQnE+2aYqtBva5x/OoUBMM22Te5txEKpP
	4z2pBvbs5UsbzvicdofsuHHHJG0Ub4okZrteyrlTPpAekyWe948RFqaJutcMtOzoTSya5SJdSTJ
	nDjE2Ak9JJQVVlkCKyVsjNMEixE75eAPlET9tdTv6Fps8hW8k1+nd7GoqrC8Dil+vVPdamc/NoZ
	LU=
X-Received: by 2002:a05:6000:29d6:b0:474:da39:e5b3 with SMTP id ffacd0b85a97d-47de616a802mr1404209f8f.2.1783358243111;
        Mon, 06 Jul 2026 10:17:23 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960af0sm24130355f8f.30.2026.07.06.10.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:22 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:17:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stefan Popa <stefan.popa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ciprian Hegbeli <ciprian.hegbeli@analog.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <akvjDLcDs63GkSIM@monoceros>
References: <20260703102941.1141341-1-stefan.popa@analog.com>
 <20260703102941.1141341-3-stefan.popa@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="52hjmcpertgn6ezx"
Content-Disposition: inline
In-Reply-To: <20260703102941.1141341-3-stefan.popa@analog.com>


--52hjmcpertgn6ezx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
MIME-Version: 1.0

Hello,

On Fri, Jul 03, 2026 at 01:29:32PM +0300, Stefan Popa wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need.

Thanks
Uwe

--52hjmcpertgn6ezx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4x4ACgkQj4D7WH0S
/k4OSgf8DQWgYxq1HIHOhV7EeCERfHLiVVK+1CooIxZytaorfxY5D0qP2G8TpZzj
Io7nOriRpX8R6Fv4xq8BK5GcaNB+Pf8XIf3VTkKEYH1obpipUYDCCpFjVWPDbK7T
XsngM46mRk7R0V+7tXdKU2CjVfz5pFN5ad9JlskEiRCc7S2ElAEh757pZhvxwXAv
oaQPtWHZ5j/RL8pHvVP9v/NDoVseoq7CsqCXM/opageTrh/iuF60wUzHsGyHbtsS
+HnWFFv5zOmypmTpqyrmDZqpwwzI5jCIkMIP1LADlobJRGRph/+qhFryjdyreUiX
FPDuibtl0Wkm3O3Ui0yDFVv8eb2v1g==
=HJOQ
-----END PGP SIGNATURE-----

--52hjmcpertgn6ezx--
