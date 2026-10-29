Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237310;
	b=MtAYgIgJ5/T12Pabva6WuNZFYdgqYgj9EzqyranPvBezmsJbLFdHIjdmxIzsUugi+8GN
	 Muafg7EIvy0aARYg11kD1QySniADGxzRkHCVJEhTOoyMmwsYOTI0fPuyamTIxEQ4O2y/h
	 dOG5E93YSU0wli5eFU4BGSOyms/9t6TZ4uEuAvVxg2IDmA/FN6rTxfOhQ6mVahfR4oenk
	 muVR3E+u+kKzomNoYVnIUASoQPqdVyxnSJkpYOVP4n0E197HD7jNz+MWlCcWVTBbhQIf+
	 Pw9XFWQEp8Mrw9ZYAeNX8umHeY5KbVO+C9S2oSb4xgMybHRz3iZKAtAo6Y6MjKkUDOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
	b=LdXzEc7REOndLBE4SXr78cqFHNJYlFDHw1hervOPb1jNWokYqPPeRd/4+EzAN1bdAMW9
	 wff6UfYr+bG0nER/W6VbfnIiRfHsCxYYAsjebht3R7hGZpzc+jkiqBwhWsW9SfM1ISJ4c
	 Nltv0RGZAhpQPiY5MdWyXWyuubB5qPXwNWJPkzlW+z5YVt4WlL9wOoqOxAMA8wPOKPAYn
	 JMwEUDFfjUoxZw0rrQNK3NeDDwk25posYWjjooUIEJd2EvdGjzsXYD2ouf0Ito8h7XTwq
	 6WDPP9KwQOEH8vROQ31QzmEMDEzJlk/cQErUyxD/Rv6U07Ed5TAlhdbVm1o/5ijT45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FLtbhkCl;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94BF606A31C
	for <Devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FLtbhkCl
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4682977f9aso203719266b.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793237308; x=1793842108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
        b=FLtbhkCl/T9uskZbozG8+JOV8cPqlt7sqX4jvzfXyzNqs75VJBgIaTfy+vZ48v6Nep
         7jetwMapu17boSfSpregOzQpEztnCs8GCN1Paq/4v94bDEodGXSjKvV66tutnTpZmV43
         sx9ECGWm4JLV5gnx2VKbeNcdYlU3aH5DbQ4y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237308; x=1793842108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
        b=w72mmpOqWbC6/3awcvsH9y4b4TP1mN+Gt8FpyObFrjMgMtcCC/A7hSFRxTub7ZfOhN
         gs89CLppA8c8gmDeaq0RwW9BkCF1H8yQxEX4VLsNXKWCeJ/v9K87w8jrG5Hqa1gPWwRx
         pFIRsHp9Ce/RKglGhFSRfeXauAkZX2RH9pNnEHH8uEhvxhRoHe1qa9vzzZ0gcvyLgvXE
         ZGs+A6GxM+T//gBWYV08+8177vP816FZzyZ476xOUEBwdUDadEvkfqO0OSKxziNth5Mf
         nNZ0WSJ3eE8qbIQhlVjp646vBQrgG8L5tyJHHVQeCdYoQvuTvh0f9xoyFWa+VFJrVLVL
         zYrA==
X-Forwarded-Encrypted: i=1; AKwUvByIsFldUcM66xJh7PkOluG5MFmcXZYbVaokCyinuH1N2JZQcilx6dcLCdZDt/39DdleN8xYgH3vrkHr@vger.kernel.org
X-Gm-Message-State: AFq9FYIAdjb4S+AiILsoPeFfgyxF3EVw509Up+35gXCo+gufgB2/Yf1j
	/4xsyFSQPkkRW+s+z6Fcy8T8FnTKQ9elXDaOOBQuH3ZfaoHW5ZLiICWk/9ZBxzKyqJlfBQF3Ei+
	5xZUbgT6j
X-Gm-Gg: AYBFou3/Q9gM9Nmix0PRQSEFDjEErI0WBu86gz+v5r69wNf0DEEDbUwFQfaUl5CCPyE
	EVvC5sMkGc+MfdC2ZKVPTLULrJUAi2LhshRd1YIFpVZwePhIFf5fJMdyUnL/Rm3uw1WdbY1Qkcl
	cat1nR3v9vp3DF2B48dZn4WKdv6GU8E0SFogfWo3gA93L7OVP8njlEGrxoUYzJ3c+/zotf8tLNW
	TtbsKhOdFZ/+P0Te7J/Jka2Qa1ohkCMCMKVle4jqKgeYn/JVujFt7HdHuKRq5FhOAjeUGmSGJ28
	Jat50eg1Leg4Ie80lV8njt8RaOtW5a6CV/VuZsUbaulMTs1SQP2yU/8UvF2xh7seVd8HuEzuk2P
	S/5qDO7onnyxBiizQAyUqgPUFvYNko8nfDm0fzqo9FQaBTK4XUDUimAq6TA10TgVcvJSVe7JB7L
	vXWRHtlVpyV6lrnBHMIfpWNVQXahLAT3emvX2gGNhyuxkssI10FRE27LiWvyIMRSC/tQUTOcCBd
	o8g0cbfC+BQbxaHNH+pwQYRKoEw/AjCwRwFqmEm9C6UzI+UVy6sQ5PiRtTD/LZa5pvxAsvHo058
	SQUhCW00gtvl2QwpEbhmT6PuyQBOyM7OpaQtEKkIqMNe5wpT6A4oxlxV0mRvqTeVKNhS
X-Received: by 2002:a17:907:d1a:b0:c26:1648:a062 with SMTP id a640c23a62f3a-c49bdf32adfmr355949866b.29.1793237308203;
        Wed, 28 Oct 2026 18:28:28 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5206dasm674843466b.33.2026.10.28.18.28.26
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 18:28:27 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so825568f8f.2
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyWeNN7Z1mh1Uv/JGGUOmcvO+YdjowSG70e3Yd37aNf7PnM1fUrUP+fnpcdNxeK+9z7Ov2LpczKPdu@vger.kernel.org
X-Received: by 2002:a05:6000:2c08:b0:48d:bafc:a409 with SMTP id
 ffacd0b85a97d-48e5d2f07femr9584368f8f.26.1793237306160; Wed, 28 Oct 2026
 18:28:26 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <at7cBFtlAQOFJ8jG@gractus.seuss>
 <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com> <auKak7QsI_6uoCep@gractus.seuss>
In-Reply-To: <auKak7QsI_6uoCep@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 18:28:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFvoQbqoghJf14z8ykqu3NNxgLXT2Oi1Rh8d_E2Zq-gA@mail.gmail.com>
X-Gm-Features: AclHuK9jXgiNO3ZlmyYc7y4t6Q91zU5w_w9WcC5ZTNrECUt3_gy7-ALkR1xmn7k
Message-ID: <CAD=FV=VFvoQbqoghJf14z8ykqu3NNxgLXT2Oi1Rh8d_E2Zq-gA@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Oct 28, 2026 at 6:11=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > Yeah, I debated this a bit originally, and I agree it's a bit confusing=
.
> > How about this: I'll keep the option, but force it to be just a filenam=
e,
> > not a full path. At least to me that makes it less confusing. Hopefully
> > that's OK?
>
> Hm, the way the path is encoded isn't really what I dislike about it.
> Something about the "base-dtb" name suggests an existing base tree,
> rather than an output desination to me (particularly since in future
> you might want an existing base tree to do recursive factoring).  What
> I'd suggest is dropping the short option and renaming the long option
> to include "output".

OK. When you have a chance, take another quick look in v2 and I'm happy
to change this option however you want in v3.


> > > > +            all_have_prop_fixups =3D all(
> > > > +                bool(d.sym_props[path][prop_name][1]) for d in dtb=
s
> > > > +            )
> > >
> > > I'm not sure why you care that all the copies of the property have
> > > fixups.  AFAICT all you care about is that the set of fixups is
> > > identical for all of them, empty or not.
> >
> > Sigh, this is where me not understanding 100% of the details of overlay=
s
> > bites me. Some background. I remember there being some talk a little wh=
ile
> > ago of (perhaps) shipping device trees compiled with '-L'. That would
> > allow the OS to know for sure which properties represented phandles and
> > that could help the OS figure out device dependencies.
>
> [Not really relevant to this series, but that doesn't sound like a
>  great idea to me]
>
> > I wanted to make
> > sure that running fdtfactor wouldn't break this and the OS would still
> > have all the information it needed even after breaking things up into
> > overlays and re-applying.
> >
> > In order to test this, I wanted to make sure we tested re-combining the
> > base devicetrees and overlays and we could confirm that everything was
> > there. In order to make all that work, my agent added a bunch of extra
> > '/fragment@0/__overlay__/__local_fixups__'. ...but it turns out that wa=
s
> > a workaround for the fact that fdt_overlay_apply() didn't preserve
> > __local_fixups__ in the base. :(
>
> Ah, right.  Again, I'm not convinced this is a great idea, but if we
> wanted it the right way to do it is to have fdt_overlay_apply()
> (optionally) regenerate __local_fixups__.  It's not really merely
> "preserving", since applying the overlay might require that some
> external fixups be converted to local fixups.

FWIW, in the v2 series this is what I've done. There are 3 patches
in the series that just fix this.

NOTE: personally, I don't _actually_ have a need to run fdtfactor
without the `-S` option. It just seemed more correct to me to
be able to keep __local_fixups__ correct after merging. It also
tends to make verification of things easier because they you can
nicely "reverse" phandles for comparison...
