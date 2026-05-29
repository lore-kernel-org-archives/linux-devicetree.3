Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD528134C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059080; cv=pass; b=rGdvCTGgg87oPMG9AOZQbsu4IrkyIznmaxvn3qBbtszjGfvFlani/4zpGqnFIvOf/z6UVVaa199uO2LTRDtK+HDE1dfyljnYVdq7ZzQ4rx5H9K7z6K4Y+BYAEAy309I7BBNfFnbi8on2CxqnZ/2z/T3HkEu7QiFRQLZrq3nbKGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059080; c=relaxed/simple;
	bh=ODkGxCw5SXtPHcQOjgdJU6FKSQ/m3pZ1pyOImUBC7zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qi94OFkYcZjFmWIJdi1EkAnIxHSwStqeh4lWbgP00P0rtyOcFJODzed+7214wwbAe29820A/MOQZPVfgc6xYXl/qIUgtJiZaNm2eoqFP9gfqcrWtWgUgG/nvYS6F7EXBDE0KRZekgZEAQ5Su0QJvVzVbsIIE2nQL0jv9h4+UGvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vj6DigeZ; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vj6DigeZ"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304b8ced372so4455061eec.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780059078; cv=none;
        d=google.com; s=arc-20240605;
        b=VVizqNXUL8ScHAZcH1A1dGEhgGXQkB5M4MK3eGtp2h55rHM8xKlzr07PKbQcw9WDkd
         qHnLo0eJW7jYIN6s6yr8rsuXVim7Ob9OtG+NXKJcMzaZbTWqPZhSeKISI5oI3gmwxJdC
         02hduONZf1cJuaDb0YahikcmEqjtvaSgtV4qFOFe9bhzpfCU/u9eMk6vQCB/wzcyzeHW
         NsLuy0Gmh+FvfPzcuIzEw+l/PglPo2uKqZwuQEY5s2JqPHwUdSR1mEkThqkLcryvY42z
         yfc1+b6tgZAQc6tId1hCreciqauqKgDHLAMIavYKz+mwYJ95jVifkY63MR/fXSM4b45V
         lIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ODkGxCw5SXtPHcQOjgdJU6FKSQ/m3pZ1pyOImUBC7zo=;
        fh=dEomsSBLquwCR217ceap/DHCcJHnH6bYXlNj2RPeUGY=;
        b=kRAIAWLk/F9t1Wx8rAp0FbKIVDEJE550D2Mit4fF6avKYs2OXcjcDZlbgb7L0VYd0a
         9rTuCoy6AEqnvKiw4T6WLMeFlDIbLRgHfdh2va5OpP2VvevvaA1TggCiHzwGhxehXikX
         4hAora8z8/OfE+/me1R4jP0kUrggNQOCXG0rfml3gySz8uTXoRpojVpt7ZMNbgHNKnpR
         7auXx4I1xf6Ssdy3LjtF31Vk3ISDC31Qqbl6X7AOvCKUn3UhJSEoyScpbr1wGNsSJTTg
         Kj7N2s8JhXdEW+gckN5Do6McOpASc579NLHSLK1CzWQ9Hs2zGM8AwqbAYUte6ukjETLq
         AiGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780059078; x=1780663878; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ODkGxCw5SXtPHcQOjgdJU6FKSQ/m3pZ1pyOImUBC7zo=;
        b=Vj6DigeZ4VYTLHSS0Ct8oI6PY7PEhHkPmSNBVaXxmkgyD0LpvFgbkfevU3di7JhBOR
         bzZwZ+F1btjPbZz0/O3IT+Gv6ge5wL4Wxos1f7U5fwvhK+VeZSLY8HM865KLvkvvki9c
         LIC152QURm7E0lVUcrs7IpVblyxiwg8VfI7PXNqLj8ANRpH2fcyybEARWnQ3gDDimb6f
         7nEEQHWWY3QS+06QCms6pPBgzBHDoRx4BkgWUkMHsG/vHOlUg/9waKL0gNXUPT1aBQ7c
         ccb8exeCXFi+UjFvXpmBb2fuWJQtN5BxLN7TW6Md3zWLoNX39wf1ryCXwpjQlqMCSPMh
         2QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059078; x=1780663878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODkGxCw5SXtPHcQOjgdJU6FKSQ/m3pZ1pyOImUBC7zo=;
        b=AAc5UVpE3EgdR2+6ei8ES5u3iC/zzpO7gkTW+LKj47QrwBF7wn+RuF5XXW9qP/Fv9o
         97pdk3KFaSw2K5S1d1QJ7TbEkvO7sGFeo6+/Ogk+x2/O72mzM9eq+TTZ6sDhDqHklaay
         1+CEEQnleHT7vH6fBdRHlHZxYnVs9BzUy2MrIt9sIzsI3R015yVyWlbAJwB3DUYYZz8q
         Yrl00wgYeSfcy6HzR9zBmIpvrtLbZr3/74oBh1n9OEWXxbvAjqViSI8Mv3AMzKlPciPn
         Yhnd9SchxRr3lSmF6K9wxwUjkJcbldTiroFmLpP8lATufzT9cA9GLKcmG9hrrC4/C38V
         tpTg==
X-Forwarded-Encrypted: i=1; AFNElJ9FmBHE5tUQhMhnL0ywGq4pP5tfTDKG46eqLLMv9cCJPqPBvjigWAZQanPKaq/bOaVmXQvlWtmStxVP@vger.kernel.org
X-Gm-Message-State: AOJu0YwFkF3Q+SDltOFMZJo0/kG4QKfpvgxLpXhFEopUxxsHUGSPMj4X
	DjiEuGLiK5iw2GdmIkRj7Gt7o5Ds1EyB5gLLH3Mklpbs1n0EkXLLH3AfsKwj+C29iwZEsdWZdee
	tMGmfbZ/TagIXQjJA148E1L1BrqQUzRE=
X-Gm-Gg: Acq92OG29rEdP4TzXUm/RrHaoQxPxnwjbr9s/fcsBTMzcgKrG5n/ofNCfoBp7HsCf1w
	Mbd60/xfF9ks+s/CcZZTJZTUtcp8sO29T/EwwomgeBb0XEVNYc0wuPdgKinyL6e8a9m8aXvENc6
	OY6I5GdMHAHu7v0XWRajwZpNNbarBro/W6cZiEO1WtVPERkgMxEAAHTodYe9ZCufU9SOF8K5lMI
	LCMG/G+44JCfVOPhYokoDgI6u2FF9agK6TYIW2C4fO15BHXrFAAZ+QLP7DUB1f7uhqurMH59fQ5
	F2+DK22sMzsoS1R/+A///WYpR8Uee1fITzroHJ9Tw+lUYSpvjPkRkNjZp8jZqNAMPftzIfyS6Gm
	EHoUdOA==
X-Received: by 2002:a05:7300:bc0b:b0:2da:2ec2:64e5 with SMTP id
 5a478bee46e88-304eb17d833mr1328199eec.18.1780059078543; Fri, 29 May 2026
 05:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
 <20260524085312.15369-8-kimjinseob88@gmail.com> <20260528153126.7be7c765@jic23-huawei>
In-Reply-To: <20260528153126.7be7c765@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Fri, 29 May 2026 21:51:06 +0900
X-Gm-Features: AVHnY4Ln9TX6I_0W0MRyaA3N1oy1elL0wOv-HXney8IDZR5wMdYVBqFAwE78op0
Message-ID: <CALMSewL7RvTSet3DSk7cQ5Lqi+EDduUOSAVK=vZ5TKz65_9qyg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/7] MAINTAINERS: add Open Sensor Fusion IIO driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2026 at 11:31:00PM +0100, Jonathan Cameron wrote:

> As noted, no need for lists. The appropriate catch all listings in
> maintainers cover IIO and DT-bindings.

Addressed in RFC v3.

I dropped the explicit linux-iio and devicetree list entries from the new
MAINTAINERS section.

> Bring this in with the first file, then update as you add additional files.

Addressed in RFC v3.

I removed the standalone MAINTAINERS patch and folded the MAINTAINERS updates
into the patches that add the corresponding files.

Thanks

Jinseob
