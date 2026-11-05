Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793878075;
	b=DHkx6G48lX5577mkDH9fbwLmupPRqsu1frIbUa/dNwDpWKBBxWQxYLFEOWAagMrkR4sq
	 ikHQX3h8/Bh2nk6UTS0RxBdXy2EWz3wpwYHUn29rydTJ/1UiouJtSzCJd05VYahNriMYt
	 IswfUS2B+nxkEhLKi02qpFSozPYuSAH5oUY6wb2CCC3LxH+kpuFo5XV72+8qqt9Zm57q4
	 ppF3+tEZsGr7s6u+NwpoW6gYVVyUboSVvrTU1+rU76GSQkY6AR2VkLN27lqFuqgz65qA0
	 zChmJgM2O/rW8P8ZIONegzC+fulDMb0JOb471h4RpkXfaTlbb+r4qcmRvGmJhHfpYOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
	b=yviSjqACm6kBePn/Sw0qnmCvd6zMIjnC/kjv+OK+ZANGCTggQzz8/GtEIVD1OvLCkGMq
	 Frq3gurw8jU2K5jYT4ulBeTrw4P87hiP9AHepjBH3ogVps2j+Hx5/90kYOPQz/baOSmyd
	 nSPC+XEw/ic9a2KrDlLlsvqhvwCpsOrFcOJjznaGPRMNSwcEtXLK6vY40C/BHHc31adR/
	 Ck0TWTC6EFNacgnupqzEM6/xW4nrj1fHiOhRqm0/Cd8AqSYMOPXTKFuwoPNFhVO82t6f+
	 Iln8mB/G1yvOvGLNdUSyL/YsEkVOIJyS8BLef/iFAYeZ7H2Z29bljhjIzUZQ6OVWreg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skgm5fm6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B0606A32F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A69B0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skgm5fm6
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4ced671398so270330166b.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878073; cv=none;
        d=google.com; s=arc-20260327;
        b=IxKIBdqqfBSF4y0ocNYzUuwthdFw6OsCZoULBGhIsvlsgfU7FgZiykrg0TPq1qL5Ue
         BioNcUTfj0oBRk0/m5w6JVT5BJOuEWO4ZtrNRk6I3260owMOc26NZ3zhHib4DqM9TLJS
         mAfTK0npdUJuIeFpqn+B2DYi3o12gOQhgAY9j+0/hVzWxzCROQxPTRMz1lLkKrt6GyzM
         qIxQH9XDf2lAcIFv1qBzXYz8ahGW5mf4nBrcRuLqh5InP3n9gg4bbZhipuS3Wo3bgJxd
         j9T7KzS/Kx+6kcAB2sePfKUR8+clEHUiIwKoSrYtvcCizBgXtFAuESuUsu/aUyBGgAjF
         F/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        fh=PMQYGtxQ8LcQNgNxmOr/zDGeBLDHKPmKUg/n/nZ/3+4=;
        b=WOgvyWjwVtHpyfxnvDB9PyFp0GvvMzsOjlXr8dUIJGvRRfY4JruThviCsuoAbJ9CcM
         0KeSt6oLG17juTzT7FVrab553F+9zZ7h3LuUtkue0OHEjnK550LTRm41xMnh8z2e4s9v
         lmCdec3u0MOrcDGYfO555DNi2ZSAeyeFtu+tZhk4Bf6k4YYKPj0ZVoFPgFgt+EdG3lcF
         53r107a2bOuWgJLFyOh/FMFhCuUCNof6+3thgGKdxZ+m4To39QF9LPQJ0YSvm69kaDc3
         KY+TCWOSYjxpW8vwxKOUIF+EgHanqxNitjB994eMJVC4P2U7u0i+fzzJzEtpOKtBDsCQ
         tAHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878073; x=1794482873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        b=skgm5fm6oAWAgv/QVCq1EFm/mHk6ogMQEriq5kNbbrdxCpxscJsl+DVbnoxhuFlxLd
         vpOEAXk4t8Us8lYbydo4Lkh/rrArrqli9+hvlvKBU8YfaDLyI9GZGKoooB/b0vdPaMYV
         JuKkZi4KuhaladOnnC30rn5+5auFXjI7odgfwe3bCKV6tngTAW6ACSoUfVCWKJqsXKIX
         jxEtLNpajovzg1ZAn6mqM9CQndl7qv0vcjhh+A3vKBUj/zkiqZVv5xWyOSeziy9qx4zd
         Srk8GDlwmg/wA20VyrcEYyztNba9JvovUh1RMB2E2C1KTO6V0On70HG6wXIEyNfWKBLP
         SN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878073; x=1794482873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgymWUGDvRFV30kELqGcA8Yq/kp5tSw6vqhDEg+/UkU=;
        b=VX9E3ZUeBOdDhpMmoO5RZFSIyb0wHzpAqO/eD3GWe6rKefHWdiaG1mfTtlwhq6UEEJ
         GzlRdwm/MX9pjK7JdtkqD7TAgc0BkBp5Y8hrtM7fynuox7cLS+lGFTLJeNDmMDZ2ZtRa
         YIf/XuLnvF0jy263lEsvwito0sT7KNsPgLU7EvljNb9IEnK8gCxEt78Ln0DanDvqYA/f
         8a703QRRopncd0r7zDfu+J0bcSPgkr90tcEgncgch07KpWddk5leE/ulNdkdZGf8+j1M
         RtXU9hKHcytWLwvo9vZtJjITzulpk7usXLnM/Bl3fJXL95NvVoyd2RP8Ne8iDWL4rQA+
         z81A==
X-Forwarded-Encrypted: i=1; AKwUvBxjdQxJpjlvlNZ0A5/e6ACH++2aIVSXCMYeiTPdgUusFTZ2d263qePfNnv+fv/QAUG7XR27/VriDm2D@vger.kernel.org
X-Gm-Message-State: APuU4Z99u3yUbBDitZn/jpEmU6WRkVwVWFJ3CvZ1dOCG6J6ibaPLHChj
	+gTRfQwMxgvoCojQKtU5X7/SpbiAMasgysOHkMQBlDLnbaDK7n11qiy4D8ge4lZnryDCcmB+WNL
	Q1jYptfIrZnGg+7tcwUl4kCaFBsRzeVg=
X-Gm-Gg: AYBFou2/5q3bktOm4FuakpBHG3d2dS+FIwZ9SJ78x1O6E6912/PJzfnn2oSUuLuvQ+R
	jC/pjZtOjxQNc+eFXeLLuQYzWJBHpKOZichZ1yNLoG/+gE/Bk7DKp6DolCsanxYOE7uNWvesUDR
	1DntilTK7RNpi8I5J5xRjahQvlz7YqtJTeBgQTOxG3Y6brkDHUd6TzjV/z+k1nfdHzt0+FsLuAF
	gpepcOR33e9mbh9ZCej3NCM6wUkQV4ur1G3CgCZlZ+zhF5fzrEtmq0x1kP4dBfHE9ZR839P8wJZ
	7hEjfi+PIJcgaFItiwisbX+iNwQfyXeq/avNaHB2f1qw3RSsn9gCPokUFk7Eo1x9pqKLuBq296U
	c/a7oWh8fKgPfoLyVUR2WkevyOjfjQqYDOhnAMSZuFLXo0+X8JF5hOrZgsIjEjt+PN5FliLnOYR
	yf2Nu3tpjcEJ+Fkil/S7aAcPYVhZpo0Wxvtpiw+mqijj0dDfORBVU0BtmhVieJdf3JkS7QHaRlY
	/tAREiRRuXS3YaX2NBVEMUBQSNT0gm70XCPcDnPgtVzvMUzxLpluJA0Tse6jw==
X-Received: by 2002:a17:907:2d8e:b0:c42:102f:15df with SMTP id
 a640c23a62f3a-c4ca7a0dc8cmr1782618666b.8.1793878072888; Thu, 05 Nov 2026
 03:27:52 -0800 (PST)
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
In-Reply-To: <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 13:27:15 +0200
X-Gm-Features: AclHuK9RJR52OSPl8iPokfz3apA8SScdKPa_SxHmGln1p0LZpPbZ_VJGI1ROrO0
Message-ID: <CAHp75Veb=TsXJcjqQeD3ciNGRvLebGr8t8TnZju6FX5ANeVNTA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, alx+linux-hardening@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> As Bartosz reported, str_has_prefix() has a bug: it can't differentiate
> between an empty prefix matching an empty string from a non-matching
> prefix.  This is a fundamental design flaw in this API, and not
> something that can be fixed.
>
> As always, this is a consequence of choosing sizes instead of pointers.
> Sizes are often the wrong choice.  In this specific case, pointers are
> more capable of differentiating these cases, as NULL is a special
> sentinel value that doesn't need to overload a valid value.
>
> Let's implement strprefix(), a function that returns a pointer
> right after the prefix if found, and a null pointer if not found.
>
> We'll slowly migrate existing code from str_has_prefix() to strprefix().
>
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Ouch!

> Cc: Andreas Schwab <schwab@linux-m68k.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Saravana Kannan <saravanak@kernel.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Tom Zanussi <zanussi@kernel.org
> Cc: linux-acpi@vger.kernel.org
> Cc: driver-core@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org

This list is twice as long as the commit message! That's why I highly
recommend moving it under the '---' line below. The email headers will
get all the listed Cc and git history will be clean from this rather
noisy list.

--=20
With Best Regards,
Andy Shevchenko
