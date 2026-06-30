Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53890382F35
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782796340; cv=pass; b=SpS0sFKB+blrqJWlwlRcXYhb+m8y+oBnMeYghmpGJvj38erRkM7gofzdHSu/fNHyeQ6TFdq61Qc1nGD14GGWq8c72phIAFGppOR2WmEPHpkx+wSYjB1MJg6oTC+sPixHpleXMSvpT9FNcsu50ziNWAHUDH3Vr4ng7vfOgAnlWZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782796340; c=relaxed/simple;
	bh=Jg2KFnUPXXVh2w7pTC0cl0+cUJGWiqwyAJlmxHSLgmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hI88figrJKgNxHiKUoFRLSEyO9gfEBZjiMDif2zQTtZKizk5L+mDHfl+DV+yqbO2gbVEOgRrWvkVo+yljFfNL8uXBCZtXCd3sbGNu8t+IbM4PUw9hlmRoLlcfl4ka2+/WyWifmaQ9FkPfnIlm88yRHdRUvP/9TngPou+ZSN9KhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV8ju92r; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV8ju92r"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so7520563eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782796338; cv=none;
        d=google.com; s=arc-20260327;
        b=rUJgKAZOqXU4RI+4cjmCAC1+GAlym6UGJNDHTt5dxuj6fQKLhmW/dqErwoTcAt/w1T
         QFjiVgR3rhisJhcdP4YXmwfD16E1G3xZuMQgO7MtDmbZWILmKjFREINJVT0VlJFid8E+
         uFe7GhWhPStwdYPZPgN/IPvXyYJVrJTubabNYc9TDmPQshGB5b7l1wRunDm/srqE0oTP
         SZVTZMvIzCWDryHJahiFrEtGZW5tlnmADC6ARlBPtDPPo6C4xWQG5e+0WVNQL0jGKs/R
         93iak6pBtpUr/8emPsUUnrHEoeCIxv2fhLSTQhCJCVIojRq0rKI0jyF3umzbA8S1QHdp
         F+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nK415PdI5kDIUChilJR/Nj79A+EUwz7TNDqGP9JEC+o=;
        fh=QhMFrJ+XqnGS6GuBXmuEFLdGYEJicMly/TUdJQr9qPA=;
        b=Zg31pjex4AjrAtYkTiDB54sHWuGGsvTPhiweKp9mr/gXOLU3c6ArTqbPoR8nQ2Wrjt
         2FjGAm+cJ85UB4tH4btuC7G5k6FPRUjhWAL5G6xJ+zyxXftuClGjhJC7IFAFRKInteUq
         /d5jqZ5uwpfytDcpcUnP/O56iA2YJR5ucCjbwdlDTFbkqIGmBLytpJ5zMIVWq2HomrMa
         78d+3qffy9MDnSlfy1YOCWec3JntlZ27Cpp1l/7v2olgxOsitliKAI13+QC9IMsu0pgK
         3BsB5xBPhVuHHUc7nA2Odo3R3XalgVULvqCeHccmIdApARKrEgltW2d2RBB+8u49KKSh
         6zVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782796338; x=1783401138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK415PdI5kDIUChilJR/Nj79A+EUwz7TNDqGP9JEC+o=;
        b=mV8ju92r7uOn2Vc5X3KF/aO35sAnvxGpHAEEtkEwxYqBpoRIC0O8HGBLhigIazDu5C
         CMz9Tky6dBMv+y1GWeiKmZ9I4WZJMSRswHIrJvBxWuXPD6RZBVMgZbK5A1dBObS+/mTi
         50EBpFSpf28gbnuCnUj3xiC/nAajU1slP01IqJnu4s+tUEtDJMS37gB5R751kNdkd9u6
         0Rl+F/wCIL8cCVyCVPqVCjrqS/iCoyFnWeBUfBI8eM/i4+kdmVpCRCCv+AGBK2OQc5eH
         QVbRS5M2jgNEEnPoYzRm5WwmgopdZNamqhhW2Ud/XzJl+fRjoJakmL2h0LJeFKXVkrQu
         jKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782796338; x=1783401138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nK415PdI5kDIUChilJR/Nj79A+EUwz7TNDqGP9JEC+o=;
        b=YpWrf0AdoWYCq0RDgf569u8bN9GxwzCNbpaUTlVAHgd4//Ngt8TDOKcxjmEEUms71k
         ryMdxR1DIhYXX3Z3umSaORA3TMIWRiLfJjCkvMA+V6VL0c7vyIZvsR1c53wV3VGORNEo
         zk3Yl7lHJua7KYlZlA8o7Oz7yNMaUJ2ZbIJ3wFTahGahtwobkPqzCSXtKlrdOC3M0HDi
         SG7M9PGVZBth66aFrCHR5qybDSGjt0UJw/4mms5ReQZTDTPPDkzviaAVp76no/af18/y
         RMozZmCtIgFjxRBljDNclFB+O2UtkarGyFMp5gwXKELEuUZ7nG4ejZx150joniNBc50O
         WtXA==
X-Forwarded-Encrypted: i=1; AHgh+RrDyY7PtO5aCC5VkQ5LrTbjCj6giWSAVAPfwaqCAXxz7q+1TEcb/MCOMtA1oU8zaS965RugFsTADMNF@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjE9MGCHyP/ZIocSjoNBhsuA1vZDIbedQl8RayX+YOTbxfMLM
	65bSxrPZXNL/Z/9Y8u7ftek44WMeR2FrQRlj0pR1MPQ19U2d/r1DNTR6vAdUooshGD2DTpb8arQ
	DNolndZ0mrTZlnkMSL2sV11nPve1ovpI=
X-Gm-Gg: AfdE7cm3YyklcT/Q3h0X6feKXgP5amU/xCNYUrVTa1y5YEuTk7P4r6rPujHUhWDLHZa
	WsRWlvKsgLA6FEEp2ZyP7f4s86w/RDsGN0Dd4Ad2GZKAEGu1Tfo//JterWfNdnhbgAK/6jqUba0
	aACqpcouaQvffykv2PcBe249TcfrTbrdMs/xe1gXPlOv4RHOzLrUzSAHRc/6Eiw+pEOzdf3qUXb
	2VzPgJAoC9kv7J2OwwBWX1eGIl7DInm6rbvpgyPqbIqU7yDoGruu7VuU4Jts8ETuuSordH4m/aI
	NHFBFOPbmGk1g4fAmyE0gtOMoR7ONs1HPkpVOBJoqI272ueeHiMgdaTJgS63sVxjKDx94ng=
X-Received: by 2002:a05:7300:fd10:b0:30c:b4c2:e46f with SMTP id
 5a478bee46e88-30ee13a132cmr1443873eec.36.1782796338376; Mon, 29 Jun 2026
 22:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628191337.937-1-kimjinseob88@gmail.com> <20260628191337.937-5-kimjinseob88@gmail.com>
 <akJ818gkVzLN7HqU@ashevche-desk.local> <20260630000623.0c030d5f@jic23-huawei>
In-Reply-To: <20260630000623.0c030d5f@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Tue, 30 Jun 2026 14:12:06 +0900
X-Gm-Features: AVVi8CdocNxkcjtLkEqmDLkN2xM35fTtk5KMTfZs6X8uWqKmDEmufDHm8OnrplU
Message-ID: <CALMSewJo-tnQL9KRyvABHpAf0-k=yOd1N=JzgK91rk0R0j_CBA@mail.gmail.com>
Subject: Re: [PATCH RFC v6 4/5] iio: osf: add authenticated stream parser
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood. I missed applying the earlier style feedback consistently
across this file, and I should have explicitly replied where a previous
comment was not addressed.

I will these:
- reuse the existing OSF magic definition instead of duplicating a byte arr=
ay
  in the stream parser;
- use loop-local variables where the variable is not used outside the loop;
- rework the stream error handling so authenticated and unauthenticated
  failures are handled deliberately;
- either update partial_frames where appropriate or remove the unused
  statistic.

I will also check lore for the previous versions and track the earlier revi=
ew
comments before posting another revision, making sure each one is either
addressed in code or explicitly answered.

Thanks,
Jinseob

2026=EB=85=84 6=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 8:06, J=
onathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, 29 Jun 2026 17:10:31 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>
> > On Mon, Jun 29, 2026 at 04:13:36AM +0900, Jinseob Kim wrote:
> > > Add a UART byte-stream parser for Open Sensor Fusion frames.
> > >
> > > The parser searches for the OSF0 wire magic, keeps partial frames
> > > buffered, checks header length and payload bounds, and passes complet=
e
> > > candidate frames to the core decoder.
> > >
> > > Rejected candidate frames drop only the current head byte before
> > > resynchronizing, so a corrupted unauthenticated payload length cannot
> > > make the parser skip later valid frames.
> >
> > ...
> >
> > > +#define OSF_STREAM_MAGIC_LEN       4
> > > +#define OSF_STREAM_MAX_PAYLOAD_LEN                         \
> > > +   (OSF_STREAM_MAX_FRAME_LEN - OSF_FRAME_HEADER_LEN - OSF_FRAME_CRC_=
LEN)
> > > +
> > > +static const u8 osf_stream_magic[OSF_STREAM_MAGIC_LEN] =3D {
> > > +   'O', 'S', 'F', '0',
> > > +};
> >
> > You have already this in the header (as FourCC), use that.
> >
> > ...
> >
> > > +static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
> > > +{
> > > +   size_t old_len =3D stream->len;
> > > +   size_t match_len;
> >
> > > +   size_t i;
> > > +
> > > +   for (i =3D 0; i < stream->len; i++) {
> >
> >       for (size_t i =3D 0; i < stream->len; i++) {
> >
> > > +           match_len =3D stream->len - i;
> > > +           if (match_len > OSF_STREAM_MAGIC_LEN)
> > > +                   match_len =3D OSF_STREAM_MAGIC_LEN;
> > > +
> > > +           if (osf_stream_magic_match(stream->buf + i, match_len)) {
> > > +                   if (i)
> > > +                           osf_stream_discard(stream, i);
> > > +                   return i;
> > > +           }
> > > +   }
> > > +
> > > +   stream->len =3D 0;
> > > +   return old_len;
> > > +}
> >
> > ...
> >
> > I stop here, because it's obvious that you neglected and ignored my pre=
vious
> > reviews. No explanation given, nothing. This is not how you should inte=
ract
> > with the community.
> >
> > Come again when each of the given comment will be either addressed or a=
rgued.
> >
> Likewise.  Please make sure to address every comment either through
> changes or through reply to the earlier thread.  Perhaps some emails
> have gone astray (it happens!). It can be a good idea to take a quick
> look at lore.kernel.org to make sure you aren't missing any feedback
> on a previous version.
>
> Thanks,
>
> Jonathan
>
>
