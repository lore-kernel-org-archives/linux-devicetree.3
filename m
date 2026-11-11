Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393283;
	b=azlOU4Uk/+zSsdq0bg81OLYN3YkbC0Y0f4X8ChCx9ldbvEUYbRT6rwNRe+HH+iIcxWkQ
	 qiwT/WplIWLf7GJYwfiUMYOUlA5j1AMY8ocAM23RF+nebj3A+09yFOG6xI2fRR7C7OdSS
	 e4HhopT93Q1aosD43ZW66hBIAHLR53qb41LrnIfe2BWltbPXwePajXt80iqhVxqilvZg7
	 cVDSmt5MlCG1WAnB7XijoSlAuoFg7kwfbxT0jjrcULEC0EZRVSX/d/kUiFspaKAIK8X9m
	 N5IQiQKRyRSJ7WeinEI4unUCgiXOuKuUelYGI9Yi9iYdq2rV40vi1hdP3sGNar4mnYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
	b=Z3JevX1A+rp6KNfx/jZs1s0+Cq65l7vcwuzuINEf9c2USDNK5NUfupYMduEpzFuKdK+Z
	 tNvj0yf6+Nc6n6wQZjvaA9p9/ufTMb5O0SvLXo48+BiPzQ2fd3l6rn7yszDjiaqyt6Y+S
	 rylkMtDL2+S3OtGzRZ+JO55v3f9RchGdHWVRE6a02eWhonMMjoJJrfECnfDBSkUzEk4X5
	 AZZ5cvY+pLsJ3NHjkSS9/I6XFYHbOMu43aIrVW2U+pwpodDM6PL/1f5Py1XwMqqbSQXqK
	 oJVQ/AqDaSn+DoetO9BSpjZRqChCv84c0W9ByjNYbiQZaRStJK4mrwz2OrOtBH4VapQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wo4+YNlr;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD5606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17BD5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wo4+YNlr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38256545e9.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393281; x=1794998081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=Wo4+YNlrKrnltc3dTrFhFyp8o565rovrnVKvkcx3eVzs7mE3qiNP4os9f3zKzIUO7q
         Mo/E6HxBENrz/Twy6Hr0jn0S9RD9and66fqE4mLAn/XVoQ9oGhz/5FprThWZmcB1lSHC
         Xw3GiW0FU0e05EIYsy/TOTtxkzFOG4Rc7Et1sma46iXKPmLCVl1BoEbBdP3bAJIvboW5
         RDrss8nRI9XAY9vaYK8uPgGc9tmFypYAcAnxtmeiIEQdKL+6MGcergbBBIDQPsOYUs9v
         8reLcEbCJIqvaqTXvPspIf7k32+QOuydWVQAkHaiFp6OoRWnSK1pNXkuh2Jp185lV3Xr
         MWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393281; x=1794998081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=z6RhFzxUUQ8UawZcc6bHjwIbjw7L7ulgNRcbJJb/dlWaeFPWtXH/fH4Bg9VTquy3qM
         Kvktx0CBYuzUbK5mWGq0Yhs5Ya4cpaqowYbkXInj6WEZqoQ64IShLK6axwXU5NxHQ8u5
         WDowtUtLStJScwKyrX9vgZryU59XbKwu1CylqOcKVeSav+H3ZfLlADfPiDCWe1LQg+sU
         kTOwadm9g+xCmuxgG8Fc1E9fkQ9Ubd2t6s0Dz43ur3F8P0z8ciHdmq0rDSdlduEf4jI+
         sKOBTMRhFomhkQUg+hA3pZpvhzqQ/beyBqtG7dMeqW5U4hpIWRPgb1ANIg1spVB1UZ+R
         nCfA==
X-Forwarded-Encrypted: i=1; AL+hErFCXP3pI8DTqwEZj6SR48hn1X0bzh4zkrKVNnNmBRb4J1jkkE3/X6BvlrGBzhnSiTXQhQNEmj9bNxg0@vger.kernel.org
X-Gm-Message-State: APuU4Z/4cZNBHm2h1HgRhEKOMw6N0xL83ZStkBJ4bScNzIVP/VT8nFG9
	N2SsGKXIYHe7yQ8FoDvTrluvq+zJzbwmlnfeM3lJo1W5UH2YG5jHs12z
X-Gm-Gg: AYBFou2DpPhkvKIAGoZ5+bLMbUPxLTHaKz4JokGH+sHCySLIjGlYlHVhx6zU9EwJm36
	HQnkMR2Voj8lF/g1VL+Z8W1MDLjaAoPEw4GB5tbIaPeet2aJ6UnoRfzKOQJWV+/jxuhfp9b2GaU
	yo1BjnR8G4dXwi6kuTXykzHxGhI/06m3SbXnctruChVLraom9OFzqpqkGFUb3JxjdftPDjsw/4r
	aPFlm5s7it1OJoMqqIMX83WL87Y7NhcUffiOd7oJNbC4dOr5WWdc1Gqa4h8bjaQ4bcSDrr0eSjK
	8jdB0TdSk/+WfDz1BH+YATF4aFfS3OPQ50VqH5BpXIAW+Qn6DKBrtI+PSdGnTrgC4Sl1835feNQ
	xU4vUquOQoRmjkNhBorT4egX+NK9EOF9/viOjvgA9EMWKsI7E62n5JmuiiT3VSFJBXCPkmC8kOo
	l94ruJuSGLMBRKe0WwLNlyJKU9KY39QdJPhiQeLZR9Gc/Wfc/g/qxmvF/um2CJC2gf8c3z2A34G
	JVkTfDoQ+5Jgrq0eBdzXY5Jqkx/2zgjcEKQ390D7NSmQLvDobL4y4b5NszEJlA3e+4L61v/lAYe
	yqlN24DX6FKLZF3RLVJMonLYyMzcQcsmuWIAnsKX+U/8o9tJ/+k45GXBOC9BaCIJXmo=
X-Received: by 2002:a05:600c:b86:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ba09377b2amr30972055e9.10.1794393281331;
        Wed, 11 Nov 2026 02:34:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm157078915e9.2.2026.11.11.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:34:40 -0800 (PST)
Date: Wed, 11 Nov 2026 10:34:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Johan
 Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
Message-ID: <20261111103438.2f822202@pumpkin>
In-Reply-To: <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 16:33:56 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/string.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 9e59f9697c9e..55ca4cb5122c 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
>   * *  @s+strlen(@prefix) if @s starts with @prefix
>   * *  NULL if @s does not start with @prefix
>   */
> -static inline char *strprefix(const char *s, const char *prefix)
> +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))

Isn't in enough to do:
#define strprefix(s, pfx) ((typeof(s))strprefix(s, pfx))

which correctly preserves all qualifiers.

David

> +
> +static inline char *(strprefix)(const char *s, const char *prefix)
>  {
>  	size_t len = strlen(prefix);
>  	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;

