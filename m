Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392739;
	b=O6e76S7v9+bGs6vfUzYIpV0gIU6QaRoBA13HFaoOv3rIURoCLsavfV22VpEDAhwkgqUs
	 KT8QkVRm9y9daYRW2L8PfsXz4e3cSu3wTmKDOu0sq6yXALn8/EdyFNooW6+MHvnhp6dtn
	 U5a81bSuJ4zsgNa26qznsvnIa4cjLyYJUhu7a6Ub8727wmE9beYtNl0mDKvFVgWgvbQ7O
	 HDM6kCVAPmnGu0EaYTWxkc7UkcvzJsk4K8p9mb3e9NQaY1R2MW+7B07mqcsaG1tw82AYu
	 JALhFVkNldwWI6g3gwbBT4PKPrWZPGor4RgOdinUdj6pu/zIV/lQWBQZUWfVHfhzhTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
	b=p9NFA6eD3bgLsAi9/M79sKrCrdpGKdN5Pf3gb9q1klBBXcfjMZeem+l+jJXINb77/1xR
	 xeuEhb9nsvKw5/1okvsL7h0z+0FHqURYiPPTADPmHrJoBkWIRQZv1UaO3ntf7db3W3T6O
	 Wsj5WfqZYhV81v8qI0dbf9q/VHIo+fGUCxQCOvVgMEbol0Q1KUbXn+qGthaYTPLHMR3D0
	 5H1monWDDi43VCB2XfQjhq8KjEJMkxiPsuBr+sRn4JLIe+a6Ar09En6OzPfWiE71sYxw0
	 lGFP43vN3OZ5cGuPLrerf/QW6gB2oq0evD0Ry3IX9tmP5eQHjxYJlBoMv/wYkkQoVTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb3uhiUC;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747D0606A32A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 747D0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb3uhiUC
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so27573715e9.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392738; x=1794997538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=Mb3uhiUCOo+9OL8nkk0DPqlbHMU+U3YfPJtQRGohaqBLQ8OevIfv8dsETu4ueSqwRn
         NFUTwQnpCyUxKUDcsxzqJiYueO55nV4pkpQgYg9LUK5WPus9n/ERdDgHae8RQ7j2Dw+4
         fM3ibr2Y6ts1e/OTqbgJiTQW3L8WDSaeJuxScEHyWMzPN+bGBiq2tlQqZ+g6LQEpKD58
         mnmah5jGdWJ/FHCGptkaUokAM2nmjVjDMlQqXY1Y0+QNVEBolaI9RZeQ+wAs3afJIVDJ
         0j7wdyVZa4FS6RKopL2kvM92RArS1Tu/5W/MXYkBtd4iocmh7ndrHYxmSyr8Mi6yyFzr
         +H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392738; x=1794997538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=CWEONjtZjqJhmJsJr+kTPKBK3B0vVNGD+6HhjG12HB1/zDbuS2OKIL10YUg98paeUH
         iJuNg3DtOwvibv6CWiUtkS5nwqej8lMw7+AhaiU7tfYbnvXISAJ65k1/rafFpuBf3BB7
         WZgn19+EeQRmyMLK1xXW+czyzb3SuwQjOraAfWGLwA+s5CFz7/mY/c5+YX1TqFWq35FG
         Mry/XRhpjcp1wq98iazNclwPHsvn87yQxf894CRapSg4+odvwVnYi2fTbCcdaD6eSIpR
         Z09jGzx/0fnW5V0oEYx5mK1OHbWdov+Q2GM2NICiieIZOwR75YS7aad2MIPRj8c9i3Qn
         5YLg==
X-Forwarded-Encrypted: i=1; AL+hErFXXccIV9u55IaFX6hF0MLqj3gz4J6dj1H92XxMHVD58IcKMmFj7a06GhhG2/J0jmuV3RTk3ePG0sJb@vger.kernel.org
X-Gm-Message-State: APuU4Z8KDHsXfWER/n6h7xLg1m39BuV5rT9igkUDn5VAiPy2edYcvp+u
	Newu3StOjjXulCzCCE/5Z2fNM6PpAsbe14bXq9D0v/o01EXn7reSqIg+
X-Gm-Gg: AYBFou2UR9xOjm+KM9u6ISOp4MGXGW1OZDJf6SD16U7QieYnuqXDMZEKgccinRIHS4F
	qXTm765JFOnTVSUKMw4a+Tt2McVpW0gC6Tb6OMAnVzsNkJaKeDY3HKM4QPlZAJ7iQEL7y4+YvSy
	R3RaeGQoi6XCRs6bDEymqUMJgfVUwWX5VRHoJOJlguafpnQSSDfRf+XixQ6oZkK7qLuZQ/f27pP
	tGb/Y5MtBFLEfSBIVpOktBAuEf09ud8rQ1bKE9UlTKtPHNg/01+8bFgF3HYUnUccBwH5/Jet/Mw
	O3KDVg7qgeP+PwC4vxItYOWEOdroVOtLpe8uBLjOVALkFC8oLSESXFw6NEAaxvO4tuqn4kDS2fE
	slRta92Rabh9weRvgEEfALY/qRt0imp/ViIYWd9IsbPBqO+Bb2lU39ORCdP7MsAjBCbzhJ76/w5
	rRjwKt2cJUTOd/KMzCDAFDp6zvZygWACBBs8pCa4L1SMYL75Bo7ChvOktT+6o0q2l3JYEJspnuU
	D3Zv7/mZAIYis5G1bLrn0TX/kabYLN2DxUzuKaS30XvlFv2ootdAIQPRNTLUSPr7jpQMNSRDIhh
	EaNtEJBv5qWozu6Ktq62W9esynQn2c8SaBKpai6Dj9LopgkWvS/wUuXda88eqtWwcFU=
X-Received: by 2002:a05:600c:4f14:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ba093b5ec4mr41235955e9.29.1794392737707;
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm8610917f8f.14.2026.11.11.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:25:35 +0000
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
Subject: Re: [PATCH v3 3/5] stddef: Add const_cast()
Message-ID: <20261111102535.434c2eee@pumpkin>
In-Reply-To: <2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
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

On Tue, 10 Nov 2026 16:33:40 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> This macro serves to cast const away without risking unwanted
> conversions due to mistakes in the cast.
> 
> It's similar to C++'s const_cast(), but it is more restrictive: it can
> only cast away 'const', and not arbitrary qualifiers.
> 
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/stddef.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index e1851c50c89b..d79a81406b78 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -194,4 +194,16 @@ enum {
>  #define TRAILING_OVERLAP(TYPE, NAME, FAM, MEMBERS)				\
>  	__TRAILING_OVERLAP(TYPE, NAME, FAM, /* no attrs */, MEMBERS)
>  
> +/**
> + * const_cast() - Drop const in the left-most derivation of a pointer
> + *
> + * @T: Type for the cast.
> + * @p: Pointer to be casted.
> + *
> + * If @p is of type const @T, then it is casted to @T.
> + * Otherwise, @p is returned without any casts.
> + * This avoids mistakes that change anything other than 'const' in a cast.
> + */
> +#define const_cast(T, p)  _Generic(p, const T: (T) (p), default: (p))

Should it be de_const_cast(), or just de_const().
It is a shame you need to specify the type, but why not:
	_Generic(p, T: p, const T: (T)(p))
so that you get a compile time error from the _Generic() if the type
is wrong.

David


> +
>  #endif

