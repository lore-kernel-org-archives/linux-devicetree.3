Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570717;
	b=vAi3/IbIMN021bnY+VPu/xRdkElzgziPjgYgvROWcftwmavUHsVFILJUBrW5gKHNvKHD
	 HeuhC5RRACuVLqzl1VFW+CecgeDjdnIL14r4GD3+LLw+EfbQbrix3DM6Z4Mgv7Ov7+p2X
	 /sR7GNZru045B/uxWVZgem99p5Ucp0o/qi1Sh4Fsn8iSU6uiwPnHjkomSR4gXpSqSmsWZ
	 H9j2SMFi779hmdj6LcjTobxka4IbvEv1fTPFlT7IfWmkEyNKRFmLxGHLzaz7/miOoKbB0
	 KX7XlazYFRq+6vCjLxZJi92oJUKrRxEn8HbBjlx8nqVNrZJwZjF60Ze2u2xey6ieugg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
	b=UVY0W9yE9k86ImV8Tkos4XZAD+ym7HKMpZ+TFVWZtE5Iy580rqfvFGQQKQsgPyF9gn2o
	 l+dLUOehbHNINbm0Ei5Uwn1yRPKgmOQKDmZpeYwbPNgOgUehg2x4DB6B0Atn53t3L9ZZ/
	 7FB55em7RP6MyQYvorXXDbUHHGmSwdj0iDBIuviXJWhy4awj7eM7SAknpx7NtHCIfFgNM
	 k2MdzlCUardYeI/AyFplEgqxzGfjszo3bdhORYW6g6lnVC2eJedxEUrPAaPsjCbhBSc30
	 zDIGw/nUrE0YP6IWfcUbRcFO1uKuq67XnoKijGnpw+pWEtO1iBplvT8Wi8JMs9o9hKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WLPinSHF;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6C606A336
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE6C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WLPinSHF
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4550d8ab15so276216866b.2
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570715; x=1794175515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
        b=WLPinSHFqC3TcsWmWyVrdbrdcYItyFZWUfz5t2xsaFtOYdfvzREvqeS7UEWUi1QrmW
         2JlUZelw2L7VFp//y8x7N9Zl9VpllnHyMATGHNQ25ggfh/H+xbJUW3p/2qTUOQNxwhvh
         0on2XkCLDUYYjDmiL9w8i1ui2sQuAwUNfMvOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570715; x=1794175515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O04uc+lDpCUwdTYjExULkpDGvmNI9e9oEputG6Eg5zM=;
        b=gxOV0+xRgLTTy65Rll1OijUoiC7crrNJY6M2gosuPkzZ/Gj53+LaZ0P8hucukoUCbh
         GeXkN4tQ4k3M1VkDP2+yFQotpNSH6onJLpkQ1kiSlnfNbDo193VYX2/2uWpZ3mGhXgim
         sPOV7okkSKSQSS79fXfBuJDDrvXyRKmVhUwxW8NXZ4hhjZFakG3oDtnxXZemk9OeXBnY
         9anEfjAmbL051tEw3v9CBM6gQmrP64SIR+oamc12rIvITbToRXCisUBoAxsfFItby2nf
         TpGYLk31PnjfXNI5USaF8MTUab1QlxhcUuJ9tPXhVnUmu68gmfzfYtyRQeejF/HYq8oT
         njsg==
X-Forwarded-Encrypted: i=1; AKwUvBwcZfVgp28Ttctiofz94VhNgt+N+H63AN270GYgAajr2eexiq7Vch4tuuejeW0vOUnifQgd05gm6Yt0@vger.kernel.org
X-Gm-Message-State: AFq9FYKsTI9kJWJyKcLWLBAE1v+YrSi/wuglDDsb3bbMjdg9cPIpbWIJ
	9Wbf3+qL1vkc9EnPD7MlMEYXQsa6if/cWrVnRSoZ/Oo/tOX6N2hl+fog21wVceHf+kT200lr+XW
	7Flj/UsX2
X-Gm-Gg: AYBFou25ndoDyaTuYqTiy28BDUr4T5UaMCgMseACGy6SfTua6+EyMssFK8otgzpw/Tm
	tX+nkVluXZEWXu86G1Fx7Aj9eWE8L813dN5qWp4Kc6drgmcAd+imdAIjc8I7nH5ABMIn1vHDr1l
	fZseSxRc+LiiOfZKi96NW2DGLNcLboa2O9o7acP7zC28gmgLskPzIsF3oCTtArnnxUoDbT0+Voh
	gNZQYIBwPLGsg7YhkvtiQ7+L6B7Y4XXdeK7OWXg9TGnoAt+nOIW46I6kjmww5ePvyrG7ENB/Sje
	Tf9RkIBcIH/r47FnJylTKVy8utl2UmNZJqwg+Fu/wG5wt9mA/GpMqZlQiTsi1fbPXpMXn4YE8z6
	R1a+ge5WWndvto/5s1KDbsqiFfPYPwGLm/P7TdToKKWHSxjYb7vtOfwoFUuxX5mgVqZpik62r1n
	QQDeNMgqdVP8rpoa11cMJJ2sMdKQSYaGaoLFNpnlrMW2o209SrOOsz1TqAdeOz9ZJOJIHbqzMkE
	muDJItGqK6gBjgy4c3lxmy8i7lkEmBKOakq1uW4wQjNplO3LtWHapJjNXJdqDWwmXFzhTDB0qX/
	CDOutngD5lhxGNelb6lwZlSorjFE1T5ePHRqyhxzR03gQbgBZwmzwBcgUr6PibYeVT0=
X-Received: by 2002:a17:906:c145:b0:c49:9632:9280 with SMTP id a640c23a62f3a-c4ca7af1510mr694048666b.46.1793570715144;
        Sun, 01 Nov 2026 14:05:15 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm312709666b.17.2026.11.01.14.05.11
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:14 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27233375e9.2
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz2GjIAWg+QmCyjePS8SYh/FE33E68x2kswst0Z0mlfMY7A0Y1ytspChgl1Q+X2t3XhMj0LJre0ZkaX@vger.kernel.org
X-Received: by 2002:a05:600c:19d2:b0:4a4:4d57:8487 with SMTP id
 5b1f17b1804b1-4ac1737c51dmr189043855e9.5.1793570710564; Sun, 01 Nov 2026
 14:05:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-6-dianders@chromium.org> <auQcDmZJGQZW7oB7@gractus.seuss>
In-Reply-To: <auQcDmZJGQZW7oB7@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VEeAWJziS-ifyWdJn035VhnOS1wCPGma3MZ5nBGuOGEQ@mail.gmail.com>
X-Gm-Features: AclHuK_QHzFjJVuNwhBeiWv5hUKdOqK33qi3pjq7aERX5ObdBWq4FdUnV4RCeTY
Message-ID: <CAD=FV=VEeAWJziS-ifyWdJn035VhnOS1wCPGma3MZ5nBGuOGEQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:55PM -0700, Douglas Anderson wrote:
> > Tighten `overlay_parse_fixup_entry()` and `overlay_split_fragment_path(=
)`
> > before reusing them to update the base tree's `/__local_fixups__`:
> >
> > - In `overlay_parse_fixup_entry()`, store the `strtoul()` result in an
> >   `unsigned long` before range-checking against `INT32_MAX -
> >   sizeof(uint32_t)`, and require the offset field to begin with an ASCI=
I
> >   digit (`'0'`..`'9'`) since `strtoul()` accepts leading whitespace and
> >   `+`/`-` signs (wrapping negative values to `unsigned long`).
>
> Huh, I'd assumed that strtoul() wouldn't accept negative strings, but
> according to BUGS in strtoul(1) that might not be the case (at least
> for Linux+glibc).  Good catch.
>
> This may need some minor rebasing for the suggestions on the previous
> patch, plus some additional minor refinements suggested below.
>
> > @@ -404,9 +405,10 @@ static int overlay_parse_fixup_entry(const char **=
valuep, int *lenp,
> >       if (!name_len)
> >               return -FDT_ERR_BADOVERLAY;
> >
> > +     if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> > +             return -FDT_ERR_BADOVERLAY;
>
> Putting the rationale for this in a comment here would be more useful
> than just in the commit message.

Done. Added a comment right above this check explaining why we require an
ASCII digit before calling `strtoul()`. Also, as Simon suggested, I split
this out-of-bounds write fix (along with fixing the unsigned overflow check
in `fdt_setprop_inplace_namelen_partial()`) into a standalone bugfix patch
at the start of the series.


-Doug
