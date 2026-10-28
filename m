Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224687;
	b=s9kA4OpiiJkPxnaf8Ilyv++CdHyZus5n/sMIZ9hRFoREkkfOiIzsNNpQrmKn9DXZLQEu
	 gDhMCoARM7mxt8EHFwChw2xhM+dGEnVFal+SC3oz8dD2eABe/dyNh169bq6aN0gte6CSv
	 yaHKyd7Ng3Kb8s05Fa23QhOQVPCLR9Mu/0Ti7y3Les8rCvJeFtgpVtG0uEU8+5GwZNmAM
	 zriT52JBmcJwMvX+qjXHJ8nujBnKBCPnVe41TL2k/aRJm6xI51BtVG1LvuHT9bKgvjHB8
	 2lLmposeumnN3OQjjEqbfKBSg9ebrBV6MRTUIp7XZgj6QCAswdH6v+BV+CmyXs0KP+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
	b=giG3vS4lB6uvZVON0EJLR5Y+vsip1hGGMAfwzlLUYe0pI6EB6bSVszw7l5b+b44+sgkD
	 6dQZ2sjn02DngRHN7GXseFx8PiNTQO4+tAwGQGixp6Hn4n+fI1H1HGTLPOUUBMxlFsrWK
	 uz9H1sD3JeRkkuVDrs8cXmTmmDEotUwbEI8ZR3Zj6i2uv92IGG2ml9Xy9hqkIGyrbgttM
	 3y1HEshVE3f0cY7I41KJ6F9xI4pPApOURiqI1c1HCNAYMUsBdRFutgYUdDJa0WnO5KjGz
	 +yz5APi3KlweG45L3A5PgmWK9VgmyydTOmV+sjOW7h00wKrv6l1YGODc1sF4LQ/ln8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H3sqqk4v;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FA606A32E
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 192FA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H3sqqk4v
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2793425a12.0
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224685; x=1793829485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
        b=H3sqqk4vdHkGRmEmezK6mmqFXgIIfGKs9G6aUqLscb2kJjXMmMOIJpD/6WGHvMGHDe
         7cyWQDG3oUkG0Ne8Tg7ycN4rLAarxghHY7ehjVRUbbqhZKqD9pP8mJqD+k+Mcw8o3ZGr
         OhLeNILNcO//am7w3Y4lki/jEmpGTKFyoulMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224685; x=1793829485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
        b=gyEgEWLzz+d+9spT4XOoCxlzr6uUi6gU971jJYGXQQH2AePGIPEmMJElbpXPLigTho
         HDbZkErDIVyqf9GZ2epoV1rGv7r1I6HwHnUJ2p+FSFroaHT4J8D0ULJMvXzy2oyxAoOV
         lV7ps7IMG9JCB5i3eGRGo3z2pFCHr+cunrleZ97TeYxiNAZLwIZy/o6znWtEnT4V1y93
         zg3nt8OyH+5Lr8Hjgbi0JjaPt9eXnI5YHekp0FMtBXfyzL5fXSUZVCIshJ7DmvWdDhmz
         FYFHH4OdSHw05JGk02rnszBfJ4qvLhYM+rZh8GhkQr3rFeuxGGAaKrTfj2y+MLl8zczc
         pa5w==
X-Forwarded-Encrypted: i=1; AKwUvBxYTA7wt2790nxxJ9ZTMtsEifrIPnd+w+6KArHy7HtTUeSQ3QkM5NJ2WMQFCdi4ASQNYE5KY0HlR7su@vger.kernel.org
X-Gm-Message-State: AFq9FYLGi1LKrm+BjFJtcw+KohBPHzRabtI01uSz9TVbAQV7yDiIeiGG
	iaPfElMK5l6mKBLZAJLn5hpPn9HFBKjQiM4CvGwT5bhp7ZdUxNULqxJCNtMEdEgmlwhShnstVDv
	1fu+YdjkN
X-Gm-Gg: AYBFou1XMCiRsVimVersWxmYIHxtp7vASWNJ3T/J4n8zLDaQWTHq0prIs1OpcnwnvMq
	53V6crK9S+OfpyruhMd4qBJLxp35fQullA2pT78Hv680GiIssk4pSgf48o6FONt/mk8ujz5zoLv
	LNaccifgkepiFoePn3JkbZMJX+JqyhWuleIx2y9XAdSZhPTavn7cC2PvyK0KHytyifnGdUko6Cr
	J4yDNZaE5M0lMih3/hOnROGZOeeKmt0JdTkHKHsCK6ZP9mytwdA2VWQVB6tMg8Q7SORN0cwh1dG
	O9CgbAisL6Jr2TzmXRTEf0EcBsTPysdr8AQiBigFucS1Deuo17hwD6wHb+nl1emU3Eeu6oQZk81
	5tIV+OgGS/qLg3FPL5Xe0ksrSOb1fozHf8gfeVqqHZrsCZ0GLMIkGxfNkL4cCmfFnOajCdzsi1I
	2FdOEWHcq91P5aMhiFiGyKLP1OskS2GHMQx76n6adAcpJly9fCW1eCdUEnm2pVBV6AQHSoNhn5V
	AQuZ7lwyMA5B1zAfGdsS+wbTizCH6jiupm+u1GKN7rH7HCTPxPQnhB9uoxKcx8aZTeyfHlv8fsy
	qGzSVmSI0ym539AMdubThcfaXWQ8OXDn/+UFaeyXrz5eVX1j1DhPP1tiWxqldaxdyx2o
X-Received: by 2002:a05:6402:4011:b0:6ac:c1fc:8a98 with SMTP id 4fb4d7f45d1cf-6b49cb9a086mr2653357a12.42.1793224685595;
        Wed, 28 Oct 2026 14:58:05 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b497ff5fddsm1857832a12.2.2026.10.28.14.58.04
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:58:04 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0728so493620f8f.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0NNQwi554fAG/A8AyJSBo3r54scjZrlblRCsr6h7k2xuxB4BX028QldGnqCgQymf3Se3vR3uiZVSe@vger.kernel.org
X-Received: by 2002:a05:6000:4912:b0:48e:c0:9441 with SMTP id
 ffacd0b85a97d-48e5d5988bemr9046706f8f.29.1793224683163; Wed, 28 Oct 2026
 14:58:03 -0700 (PDT)
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
 <20261015182221.2931742-4-dianders@chromium.org> <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
In-Reply-To: <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vroh_fcqxaOi2s8mBS7Ki2fQ79iagnLkTK_FxUFk1bWQ@mail.gmail.com>
X-Gm-Features: AclHuK9avb8muZ-xZs_aIYuQFeaeI3fXfNjJMJPbBXHmJks29iEzgyPnCpdYzXk
Message-ID: <CAD=FV=Vroh_fcqxaOi2s8mBS7Ki2fQ79iagnLkTK_FxUFk1bWQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
To: Simon Glass <sjg@chromium.org>
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

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -11,31 +11,195 @@ original device tree.
> > +LZ4_MAGIC =3D b'\x04\x22\x4d\x18'
> > +LZ4_LEGACY_MAGIC =3D b'\x02\x21\x4c\x18'
>
> Legacy lz4 input is detected here, but compress_blob() always runs
> 'lz4 -12 -z', which writes the frame format. So a legacy-format
> board.dtb.lz4 comes out as a frame-format board.dtbo.lz4. I checked:
> 'lz4 -l -9' output starts with 02 21 4c 18, while the compress_blob()
> command gives 04 22 4d 18. The kernel's cmd_lz4 uses 'lz4 -l', and
> lib/decompress_unlz4.c only accepts the legacy format. So a consumer
> that handles only one of the two formats cannot read the result. This
> doesn't match 'Preserve the input compression format' in the commit
> message. Please can you track legacy as its own compression type (and
> pass -l when compressing), or else reject legacy input?

Done.


> > +def decompress_blob(raw_bytes, filename=3D'', comp=3DNone):
> ...
> > +    if comp =3D=3D 'lz4':
> > +        try:
> > +            res =3D subprocess.run(
> > +                ['lz4', '-d', '-q', '-c'],
> > +                input=3Draw_bytes,
> > +                capture_output=3DTrue,
> > +                check=3DFalse,
> > +            )
> > +        except FileNotFoundError as exc:
> > +            raise RuntimeError(
> > +                'lz4 command not found; install lz4 to process .lz4 fi=
les'
> > +            ) from exc
>
> compress_blob() repeats this block almost exactly, so it should be in
> a helper. If the helper takes the filename, compression errors can
> also say which file failed.

Done.
