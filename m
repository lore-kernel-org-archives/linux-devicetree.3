Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A363371899
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024607; cv=pass; b=dbZGji16ybBLxsWzxOvtn2j110X8yVsPldTOwC9+Ag25ualzi21ep4JY9ToiNBNp2wX+XFRdsIS8cZkmoMNTrGeMZn7fixVZVD9Z9vyRFMrYDYYuYQnwK+BGDRzPXmexttOZ9KaydfOL5CfM4uP4fNoucu+0BBHfW0SKvTjif9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024607; c=relaxed/simple;
	bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4hCvspbLPsW+tnfFLjpAwplTrvz45ZZLBVkuKLftoaKq0PxGajqhrkvl1FgfC6C10PAJrw2pZtJ3rTfs/QKQmTT0T8Wn84BY/aX+tpCfrAjHYh+AcRYBtMO6QObWszKoBPHLnHKaWPV/vc3ohIXQCh2bwopWHdGA7zt9SWDS8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/cn6Iwl; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/cn6Iwl"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a20367cf82so54627151fa.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024604; cv=none;
        d=google.com; s=arc-20260327;
        b=g0KlqlS+7gHvYsrHypaMhS0ZTAj42pXOHu1G6NXv3ilQN0GC9tWbst2kYOOCWdpe2+
         pP+e3ot7KAvjYTXjvwvCLYWKZ5C+UdPFR6oX1oUgLTRWunlGk9Kq5GrKw+v9zHDNkqa+
         l92KPKxGe6jQvk5HOnlhxSFf9piipPYP2uJwvFyhhgq4H+sHThK1FuqyBiz2B9ooQaIK
         KTaJ+Gi8eV2nVi0vXxaSOZeXRWhLzt8lMsmWJ5dZhICkPJxrz5xhsRcB5lV9mjtcX3vi
         PP82gqQpLFLicFQYAnD/8CHBdIAawEsurogUX6M5F03EIEBkFvrCswi/qIkvQIupnvIR
         1rug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        fh=7YsUjyVewiOfpIdpvAdWpn/yZg4/ytsakhna9YVpR5U=;
        b=emqPA0PiYcw/y5k/XH2r8j2Ay2ZGELYryRzn/T9IwDFMVSXB1rm8q3O01KopBU3m4d
         semDXd/59evshH+fGR3w4a1EjBQrTPBux4VrUEkvwMAW4wF1NjFNmt/318Yu6iQ7D3Zz
         PUrAzQGl979fNt7hRwROvXDfrJMfQLXqzd7lxBr25km4UQd3FdxW89HH8+97u9fgKtY6
         Z4fx4raiCsobp4VnvWNvN4arM8KuYkHQvO7VxU0e/A1z9jRObcfBdt8RaQM0EJZ38sKS
         hMK5dbmo6Z2mm0gW8dMZRlHJiajTK4Ulqh0mBd2R7vzQhFTZjoWMZkZUKhYkwk3hXWz5
         Fbzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024604; x=1789629404; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=E/cn6Iwl8/GWCIxXZ8G1tRxpm0XYE5xhRkNn+WU99GZqPHISawocCzTDDgtXCYPgwJ
         kcJQUDjpq54CfifQ6b3J6lv+tRiqtr/G030ZwEbwQJvaKnpAJuVCtuTS7zoL3j4OQODH
         Qjxa9YHcUmYIb1972AirjTRn668ntemP2xxj5hJz0768SGa/UGvwhdimpdn4cdl1LmSl
         YT6DfrpCI9ftwzTNlgPUEi6QBHmjh+MJsHJxkIzVbMMODhYi9kpKaHOMEh1UGoQs5u2k
         1DzHtCTLGkWkEvNov9n2ZyNSGDzpJE9lBTvWshK23QJIvPXY+tMWUGOWnGPyZjm+8EJQ
         Cu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024604; x=1789629404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=WfJE4J0QsXZ6aNp0t3yaNkTiHhjATYO3U44m4DO4aiQ9iUbRLUxdrJfH28U54bt3vP
         sHVhXBbrNQJIFeDPuDXcZdVVNLqkqKC5jXxb2cBWoiox7izLT0iOqzOsleXlLtREd3T0
         Z40GD3xnY1QqRA/dkb0gEnP3zAoOcO0NNUyEmuE36PB6DnW1tIsD0gDToiAPjglLp1Mb
         bhqpBhVF5OJA3LQ50wzfYlH4XKamPMVZyqCcJJUNHGr4Q6Yzwbfbo4vbnpphZ/HBFpOJ
         i/gvgoVLbFcm0yidFtPQ/OS5z+vrPh4OIFz70+KNI0UNFDBQee8AppYSzOLGlCN87jAg
         SITQ==
X-Forwarded-Encrypted: i=1; AKwUvByIXWUZw1rtE60jmXDnQp5h1AovNi2fuqmbimDk2ajKgx2QrNCxlxeZNKTM3YmTIBfytkG0llYR2Uvk@vger.kernel.org
X-Gm-Message-State: AFuF++lC61zSqLEM0XxZFMIkWI1fIlycFiK56/STTtDtJEgdHaapku4i
	IZDRJvrXD8KSFgrG47QzmQsAaN89MHSG6/XMevUDLes/rmrq3aWzb7Ca0L4cmA8FhcI3JHO5QSK
	KsbVxr3u2R/BjnCo9ivjt7NFaIa/OULE=
X-Gm-Gg: AYBFou1ZVpHWS7DAy+GGTnZvKvoVooS2QXdU/FoQo93n4IRO39geAIUnKG00Tzz7WIe
	eoTCBrDjRrJZIKWFesLcGS1Cahl4gjRMwVyogCyd+j7ElMYrdZ8F52gea6Br52QpfgxKU7xjJNg
	S0set6vX3DPe//hnOxBvkGWJB4GA72MqUPtZuiyfC98kECjmKe34OaHUEZQk8vO7KNBBmqoOw3Z
	oTVylHGP4ci/IJ8NuVu0NvmT2fik1LFQHTpzbg4jhR09s6pOMQwf6NoJEjLZPP0dJLpYZ1QVkfb
	iydvlc8kbMlUL2bnlA2wUqY5Odm14Z38yWPdqywrThRJeFv+FU9RpwU2Q6h/B48CZuHCHYD+KDV
	EDOO6LWVcFIg=
X-Received: by 2002:a2e:be1d:0:b0:3a4:9b64:9811 with SMTP id
 38308e7fff4ca-3a49b649b3fmr11090001fa.15.1789024603607; Thu, 10 Sep 2026
 00:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907080831.11281-1-syhuang3@nuvoton.com> <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
 <CACW=pY4mpuC1+Z21egn3jJY6jtMhMx1PFFbM+Rcy6giuzXpJ1Q@mail.gmail.com> <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
In-Reply-To: <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 10 Sep 2026 15:16:31 +0800
X-Gm-Features: AcwNN1X4FjemE5ofed7LBWR6jnl8AHuWB-oy0Ch_I1mQhfiWyKKr_gD5QY--0ns
Message-ID: <CACW=pY4e84hBiJxvLz09r=LD=OfssBFF_tXduUO0YJxqS3xf3A@mail.gmail.com>
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 09, 2026 at 10:02 PM, Guenter Roeck <linux@roeck-us.net> wrote:

>
> Sure, it works, because your code converts the bytes twice, as I said.
> That doesn't make those conversions necessary.
>
> Other chips also use 16-bit config registers. Just use the same approach.
>

Thank you for the detailed guidance and clarification.
I think I understand it now, and I will send a v2 patch soon.

Thanks,
Sheng-Yuan
