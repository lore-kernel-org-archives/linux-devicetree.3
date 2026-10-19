Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441296;
	b=2zSlTwzZlttZ0b3TZXNWx2160/likdcwKpMG/1rEo4SEEryCbkO3CpMlBBnsijNLQ67V
	 btH6ZMHaJlS9Nu8MlpiHrWImn1+Y+4UoxOdM9yxFoDN32MotCnKCIVpZkW1yTN1vZ5hm7
	 zbgO8A35hixD6QUhEDvz/ySbN3uyXpAMvgX4Lgojzjj6+loAe0DdEqWBI5gC/Y37IecJ8
	 JU02sJfkvrRmLQXOjst66JC8eDsa80XQexFRunkiaAAFZZ7DkDo/+kqMswpMAb6NWWpXd
	 KKV9o4pdLUnK5kfkUYiENa8sd8Uevqb5gKFrEv+j2meluV5sm4N9atd/+BXEsee5R4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=lxY+bUlnXkp9HLTP6VBDyo9xmYaSPEc8yORJWUbNihU=;
	b=jJ9zPbLAFR/dysR50umzqbr6NO214DxMkrHBByT4b6SLVFLamZHWGW5zfafdUjuxXuku
	 Zrpc/C/8yYgHuIh4MrHsM/Ln5z+sxb+NGtpNL19XMyE0nUodZNVyZaxiNQtfmyTq81ovX
	 NNHDGnrDgT2htBUeskOAWVT2DEkaEeHWP8bVWNX62VijVF4A8Wyqid+/jX8eJ7zoWzw7M
	 tS7jVZyDUt43YYvjN0gIOLfa4ZxIf5iSAsej5XaQDs1L5TwHGMVK9jptrCHkVBsfknkxV
	 SPbfI3YuhBa4LNQDSenagTK+1vVFh1VCQmr4amyTjezf2x4eB2Lm8WXs+ZmCpG8gqNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XiBEVISy;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E1E606A31D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E1E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XiBEVISy
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c33cc572e6so35192137.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441295; x=1793046095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxY+bUlnXkp9HLTP6VBDyo9xmYaSPEc8yORJWUbNihU=;
        b=XiBEVISyRUSaKTM2KkccmpCYmSCxtkzIT9pO0e1ILZqqpIDrCarUcKeRKwEiqGqFjs
         eTQ9qd8be3XLJSDCMiafjEnEUjd8zt1HB16T6EqvAo0fhnwhTkEWS0MStUFlZOm49U5t
         jcW42PITAbU6s1v6JmqyMJCwYN0hkuXsoj2oP6T+Iv97KQ7gA7ICDvzCgsYE5TjxO6wn
         UYYeAgUoeOlxW/2tqeR/V3WkNnyeZVHXii+Q/vMNkX7r+pROjGz2tKzAzWPwkxey7DAJ
         SvlyEv1Olggw8DwwpfLuv77Ht85Lvi9uB8DN4EZzuwSYDA/hnvDofsVInA4wxHL0UUwy
         g8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441295; x=1793046095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lxY+bUlnXkp9HLTP6VBDyo9xmYaSPEc8yORJWUbNihU=;
        b=NWhG1whIU+g5auEbJYVVTdIgYcN3L2wIxifv/qnnDUiFHRGdwEzF8w3uDHzaoBGKge
         FIGcrAo1dsh8T2ktvhAxisQnwscwdQctiIq6GxSWaxNfT0+zeW+nuad6Jo0PJVbgI08N
         fgpoW5J21Thq6vZC6Jn0KEss1Q54CvYS2EqNuzooWrvqfAdV6vwnct4B/cIPrP6wlaK1
         CfyW/2ZtxuHHwB6Kmgo45D1tqOP3p6ypPKX/+TN/X2Eup86xNDzZ0ramgcTWmYNE46jS
         yitDkUZbk1EKZn+79E3rGZz1VSjgugv6FstqvDlbDP5NUj0UhylxGyRq8439xCRNuASv
         2YiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO7KZ92150/6iUKoBS1nkxJmIx3k+h9j8s7Eov1Sfj7Z0jXD8ve1RyGnFjDk2NEVVHgLh/5K7GZLtX@vger.kernel.org
X-Gm-Message-State: AFq9FYIjcjDdo5sBt6TvJgvGDwgWUv9IKhUXIrF+YmwicY3dK1XeEhAE
	G0BSFihhKX8DpgfwTTH3UgdpBadPyopSnfN9OevyXqsqmss0JwwL/NYr
X-Gm-Gg: AYBFou0BJG503A1hsxIg+hSd1z8oIWMmaxkak4hTy727LPSNDdjky/guemQvtvhRQLz
	YpZzXjnLsdGIJ2UEFr0khS9q5V0haPL+hm3J6WKu635by8mt8fRqDZljzYiWGT6sA2EbYGWEvPm
	V0a7d76eYLdI++1pNU4XPINRuGr9KRT0kAaHjrTAsQGGsbbgdJl1et+AOEGfZ32VOziiCBzMD49
	USBfMo4k30nEUdR2ZpfU35viLuU13wXpjrwdDSxVqBJI4ZwOhu7swzFh2nI+eDRk6Tz5q0i2IB7
	NDJ5Ec6gkRhWJNezUoXFs7BX0IeVMuT2htLuQJf1yHbYpIqkvbAgixyOmKLriic5xh46jICV2IG
	OiI3qJ2K9I1g2FdiXwpHZLjX/JqbmLZt9ielQKH7mx1GJMUBnps2GRtcmLK17uHULdNtI3HgAaR
	VmUfdQ57C7PZmLWILfcEJV89TYIVlVH8ZjBesPjkEknYMbVpvYHF5iwKu4aVTkEsoOWnZhMCLZE
	aURyMcAB3G0bebjZw==
X-Received: by 2002:a05:6102:4410:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7cc7bac38f4mr58992137.6.1792441295093;
        Mon, 19 Oct 2026 13:21:35 -0700 (PDT)
Received: from localhost ([2804:30c:4067:b00:a68b:4892:7af1:b51d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc77264634sm1081672137.9.2026.10.19.13.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:21:33 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:22:36 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@analog.com, nuno.sa@analog.com, dlechner@baylibre.com,
	andy@kernel.org, Michael.Hennerich@analog.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 05/15] iio: adc: ad4134: Serialize single-read
 operations
Message-ID: <atZ8DPLg1Zqzhba0@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <fadebc9f9fd6fe3924d086bdd7f549555dc069bb.1792200021.git.marcelo.schmitt@analog.com>
 <20261017193929.12ce61bc@jic23-hlaptop>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261017193929.12ce61bc@jic23-hlaptop>

On 10/17, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 22:57:47 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 
> > Protect single-sample read operations from going wrong if two or more of
> > them run concurrently. Serialize the data read operation so to avoid
> > single-sample read requests disrupting each other.
> 
> Why isn't this a fix (with appropriate fixes tag)?
> If nothing else comes up and you agree it should have one just
> reply to this email with it.

I seem to have forgotten to add that.

Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")

> 
> Otherwise LGTM
> 
> > 
> > Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>

Thanks,
Marcelo
