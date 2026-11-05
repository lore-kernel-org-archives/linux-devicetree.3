Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921365;
	b=GBWDiSrqfOfX0cg9se4T02kGh3jcFLRYZIGvAdAlUdsMMmpc03YGbse6OuBvCSNUOBwi
	 JK5ZGZJSMDM0t40N4q5czYPsRfvjbRWeEoQFPev7mSjO1zqwH+k2X/gqMUJj25Gc4i1MP
	 8xEii2F3NKAY5q/v7c2ks6EQNf74T3xTLn30Ud7XP0fjDQXQ+m46/yPc8T4m1yeOXGNXC
	 dO6iS11+CRPdv/Wyp4I1Gz8A8yu04LvE+UdNQ5U4jAAgbFVxzB9ySlz8kWTKKRya+Zdl2
	 rMY9xi0ihEXcnOXEb/phxOdMapknNZLI1Q0G1crXUrpMYCTbWumfTrzsksDt5jPeGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
	b=fzkuKzNdFyS05dUjAHDccZY6TuhK7sK0ovjhPVsOybQPF4o1uExjbSPDb5BEVA1/7kzb
	 rC7BmXW9u0bckPdSb6+PXOCvzr2QBKUPJSKJEoYGJAaJNf8bY9h2xpUCQfn2cKnOOwn5t
	 W1kYMlm8JRy8D15GxyQCk6ZxTem3KN2ks7FOzQDp9nYTUDF1PK6cCUZ62iDfLj9RPTd0b
	 JLaaXA6sSOW35wM0qSSr62PwSeBXg3ewImYfYujG+Bv7ByI5DLcu4lDXWufavhBUvLGqc
	 tAuaAjgxWmOpfwwdjrOvpHF7apvCEG10Ffo4IMfijNpYGbhqjrmxaJFX0KvzJOqEk5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KM9ccc8p;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E366F606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 23:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E366F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KM9ccc8p
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c445c95d553so7609466b.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 15:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793921362; x=1794526162; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=KM9ccc8pUL3zaVcCtKg2l4+j7LI+EF4HRgV7touPpkb4jkn4Zt3L5oGCtzGQvcf/cb
         lja3dphyU9fYtJz07Yt8PyDb1jcIIGm1sz3FOhdoqcjLPhb08TvjY5sPyEsN0XaMzSnl
         sFjP+DgvkL6L8w8JCs9ywYkdY69tq6wpmmWRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921362; x=1794526162;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=sOD5fNVy3OdndKtRVBVrOTqlPTsnjHrMSJdh9MMSoPh2mjv+gGMIt2Bi/iUdxsG7OW
         k4hy6F0Kw/2MYDzb2yD/n9LSEtGoqpNmE5Ale1Nw5sSD8NDFgGVwXXq8omzA02Gfr8Hk
         EhSQiDH27G0lWGwuUIT71Mg+pQiQOgV8sNuaMR4yLQ/hDKp3O/iHndJ+Px5rdXv3cjmt
         S5AYcJTz9O9bQ5cqXif4p/9yQsgfGdokUTP3oYK0iRO6LrB495Xa6Ao/FMvRN851EB2z
         evbDibUsolMaaXdInTSEBAhM8V1+NMpboR8ZMaAqgP5Dkfh8gBaCy3KVkmDRx2Vb7NYb
         fcLg==
X-Forwarded-Encrypted: i=1; AKwUvByDPGpvfH6vlA/szXXV5Q5OO6RG+/znGqrB4h9DgM95fM0PLhHrrl7/0KdAGn31PhXiyan6fz2fPvIK@vger.kernel.org
X-Gm-Message-State: APuU4Z8l5aNsWgQq0v4+BZyAJFRTnmgjukEW4hsV+gd95eJMAF1aNtLW
	4JV7hpqSzr2rdCs+6epJIAnXMjcDixjDIwPyODmoFA4rL3HcjxnKax+p8lF4NwZ6+DUzvX5g0/L
	+k54SwANDCQ==
X-Gm-Gg: AYBFou3oTx2RbtJHX7EUDr4twuevxhq/07Creqpyb7J/lfi1xKbDeENW6lJd/iV4BpN
	Z2P0TYn8w5l4UpmuZK258eUAjrsij0rLcQLmo33ZABdb+eQ5s9UnMcoXfVBe7bW5+1g19+F4zmU
	UdB/wHhRhiZv7Jr5LyGSubpvsr9JiuduEyWCayVtgVpB41NZKovAOTOpnNdLsa2Q4aeoV7B61TX
	InAvS/CzChGAnZd+yfUX0qjKNaK0OVe94NNmyeUKznLrENnY8DpHnRnoadk/lU/NmIfHa+xElmt
	wrLyHSNvA8/oocYI5jhH9aI+fTwMizSftqhIJYl7ZMmCfKin2ZL+mdCGEs7f4vHb+o0caY98boC
	h8ve8dDp9NbcCQn4JQa5sAicXCqKtFDr9adErzc99FhdHwEHeMa5RMJ0V5cAyODDyoEBBlW0aRe
	lyrIt2HjOjlIQ/IygoJJXPHUM9fhAaBnbt9WH/s+XpRO/2bOE4SejXcUgx1HRvtVWkE5/7lAwa/
	IBlrtO7XQ/qc94doaT7TCvg6nZIvOqW3xiVlWMv8WOxWAMK7J4DIMMnudawzxXQOUSUYrbIaO/w
	45kKj/fZbF9OY/1CeWWd09vhAjWQSYbcW4P3Lo2C9cGjzY4+kbf1Obmbwl4kOeiPgbeL/sJClpj
	k8Q==
X-Received: by 2002:a17:906:7313:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c4d34cd8a49mr78993866b.48.1793921362061;
        Thu, 05 Nov 2026 15:29:22 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35631eb2sm27014666b.27.2026.11.05.15.29.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:29:21 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c445c95d553so7607966b.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 15:29:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzR1UhfY7i95JtcllkD7PbBLEXS7Eabq5eQyPxFDlEzlQ9PtEBmueZxM99maz+1+JWex86Y62x3OfRD@vger.kernel.org
X-Received: by 2002:a17:907:9c05:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c4d34c42700mr81823766b.32.1793920911855; Thu, 05 Nov 2026
 15:21:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
 <20261105111423.360f4ba8@gandalf.local.home> <auyuINXEJKc1KoG7@devuan>
 <20261105115019.2fe7c91b@gandalf.local.home> <auy0O467UqOzqYub@devuan>
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local>
 <auzxXyAU6zyHtMtn@devuan> <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
 <auz79Izf6Q5qOQPi@devuan>
In-Reply-To: <auz79Izf6Q5qOQPi@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 15:21:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
X-Gm-Features: AclHuK-tRyoIoIlVqV1ObINoCwGUeXX8nUrj1waZW-FHLSpz23irfQuKt09nDLk
Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 14:25, Alejandro Colomar <alx@kernel.org> wrote:
>
> I'm not a fan of git-grep(1), because it's easier to remember grep(1),
> as I already need to remember it for other stuff.

Why?

"git grep" is *literally* the exact same thing as "git ls-files |
xargs grep" that you apparently find so natural. It takes all the same
arguments as "grep" does.

Except "git grep" is way more capable if you ever go "Oh, but I'd like
to go back to an older version".

That makes no sense.

> I'm finding some issues with git-ls-files(1), though: it's listing
> symlinks, which grep(1) complains about.  I wish I could discard those
> with something like '-type f'.

Christ.

"Doctor, doctor, it hurts when I hit myself in the face with a spiky object".

Stop doing that. You're just being silly for no reason.

>         $ time git ls-files | xargs grep ARRAY_SIZE | wc -l

Just do the sane thing. Look:

   git grep ARRAY_SIZE | wc -l

Trust me. Just learn to write "git grep". After five minutes of doing
that, you'll realize that you should always have done it, and you were
silly thinking anything else.

And it's faster too:

  $ time git ls-files | xargs grep ARRAY_SIZE 2&>1 > /dev/null

  real 0m0.636s
  user 0m0.367s
  sys 0m0.307s

  $ time git grep ARRAY_SIZE > /dev/null

  real 0m0.519s
  user 0m1.837s
  sys 0m1.719s

(I used that "2&>1" to obviously remove the errors from the stupid
mis-used of xargs).

And it's *safer* too, because if you have filenames with spaces, "git
grep" does the right thing. Your xargs thing now needs to start using
"-z" to git ls-files and "-0" to grep to actually be safe.

So just embrace "git grep". I can pretty much guarantee that if you
use it a while you'll never go back.

            Linus
