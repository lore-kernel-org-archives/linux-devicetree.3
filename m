Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598719;
	b=jtMlJ603inQ+5l4lbvNG2PT2ervuekeOIqZDP5pn2T4DvtAH1GzXGlh0wLLE7/aacv/G
	 vVktN5zT0CMZYZ+32kd5GSvJzNaM59nraUtWVAi0W0Y3i4AvY9Oplp0YI1/lDURgduCjb
	 KMLjYF3/CALb4YglEMpwCI9SCsHfznK3H0jh2uBVllYuuy2yYFp1Hy61foTQKkHYkdk25
	 UwhQGuj7WSzeydH6A2vGcfM+gtz4iugjv/TS1WABrNhIhRyHevZPvf4RqfaX5vQEMo5qI
	 JrVYOOzNRZ0kxVhO6rAesaWZP7U38i3empqLUuViuKV+9xrqYR9B5Y/29KvE2jbsszg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=OO/jQ74sz4moznSOIcQuGfT4C5O0ZbLQA+114JVzDVM=;
	b=nmBwREjBKxPoXFOlDzJ3/NmZzZwO0VmOkAswLx9qMbQXUmeQsKAuZkeb66g6B3/xIN5N
	 KpBvv25qC6Nrk2HYPzEa7at2OdnUr+HZQoCty600XwtaGClI2wFsjVzxI8A35Q9w38P8+
	 tLrZuTAzNdAL3qxJVlX1/khT9nhjh+KBO1uiHAlsJUzrhd1fQxJvmrgvM0+bqwWuLU1hC
	 Ht6EJIZEM0tW735Rjnw/oTS/dQqS5rM0ZqsVE0N4bUR7GHojmU4qBB8/wD2hYT153BrrE
	 b/ssMJ1NWuUJrdzaOpDAYag4DzePNuVzrwwjzCQWLEEcM96SjEG58BWM6oIXFxn6JJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kC+JIqff;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437F606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B437F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kC+JIqff
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso138668066b.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598717; x=1793203517; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OO/jQ74sz4moznSOIcQuGfT4C5O0ZbLQA+114JVzDVM=;
        b=kC+JIqffK4rC46rQzGkmweYrHwrBuORYof+4Q79ymYrFiYUH108zupB7/K+ZHWFvg5
         6xOMEzcIQKk42FqsC9rXViLfn/HI7mrYkiMCwCjy2GLBSIHSe0jlf9ikeluMqB2xJCvf
         wuw08XQMARxGWnTiO3lAYlKBfESmd88wPoPL7a3CpuKi7CYtbUDBE+cz55xyBQx0hlxN
         OHpkYrJGlCPqGb7vqH8696iSHlKSLDP7PRnmkwVILribmC4FvskE5nRy0nKReHoeTeXY
         Ou9d9YdojPlS0rfqT4vfA5lfxBlWF6zjswU8Vkd/PQThdLBkIpim9CpG1Gp0SWIJnh3j
         nwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598717; x=1793203517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OO/jQ74sz4moznSOIcQuGfT4C5O0ZbLQA+114JVzDVM=;
        b=K7MtjKTGroDcmY479dQ3YdfMYlPiY3thBUdkfXNyrlJhla58ul55SwSC/Pc2ZXpe1Z
         ToGBUtaf74YvTj7x25lYsYhr5M6GH/Qm1Bi6buwYREEuXkmRHjl+PY1WO2taZNkx9ZTN
         srmmiXFomDbq5j+M9UPQ3dgsioVT4HjvXAEhUDECnzU9zz6PBla2r1wgvc2tpBQkenOL
         6Yc8NEIk1BzgDtPDaysNdH8gXj926kIdqLiuB9KpZymW7aK0qur8FS4eByr4679gQegE
         U1i4ZCMDSGQ+C/qTSl/fCjNWqk09y2TF5tKHYG3wLdI9O9RQH4VH73BhHAj8R1U5rztl
         NDjg==
X-Forwarded-Encrypted: i=1; AKwUvBzCNMnH6YFvlP2wT/ghGtG8DjFV57olVR1BQUFw1SZ+NhJT6xrzjpdGAHS9PXpRtjcePP5gYsq5J3r5@vger.kernel.org
X-Gm-Message-State: AFq9FYK7+pjBZqEAVKXG2VuF+810vuK80IYQQM5MaJ4FpLO3f4Nbz5nR
	l2UzwLIla1rcWHtFfsNmE4Vz/u4+uM3qhb/8pNUkDCDTnyO0RJBrS5IW
X-Gm-Gg: AYBFou1zuVr4YZUjqKd5qTdo8vIuDjAN76sUITIEEsik5GeYqRxFtN/6pda9WcmvJS4
	f4MnueKOl243GyYd1kiSNi5Fat4rb50oBkJWqHCyyBz/hcaQihR/S7pgwCZBXZf5xzuoSz8bnnl
	fKvwhA8PWNqFFPJIoqSkfkmz1jpVkkfuNcLp2OADt68ddivp8F2wtbpVU+qW/Vj056JliKqVIwp
	a7aa1hGklFH9w7MQX237AUqCGlgKjN6r0JNKpCmQwZlt5nyb8UOiBZnUIEibBJma2q4Z9PGhX7E
	bO+uoZF5+epR1PIff3wNbMwTU4CgcfyuWPnYHDpFGHK9Ydmgpb8nhbTc0PDO2xOfGwPCbtY2CN0
	1KSjNAX80zbAoXWEvirItQU8UY+ljO+GxnHr920hf0MPpvLVQcRwVh6fl7ReBc6vSBAPt2lbARK
	IDuAxubBUjjs/RUtdSD6MDrat2d2vgcGYMD7S8eXI+zjknwXvVRyg9X5EJ+GuBOSyOgVzFM25ie
	wVcXiXDbX/Om8p6h9/vyziuyo0/riyv2Fo5OMUZ5ATTkS5+d0SAiNcEC8dBj08uFaTYrNRkxC0o
	GnxtjLi2JyDBKRvn4TOJ8k/qrKhntLReBEk5ucJwczAcINnfAeTyZiI=
X-Received: by 2002:a17:907:d08f:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c4679623434mr231451966b.20.1792598716864;
        Wed, 21 Oct 2026 09:05:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c98sm6093433f8f.28.2026.10.21.09.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:05:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:05:14 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/8] of: base: Fix stack overflow in
 of_parse_phandle_with_args_map()
Message-ID: <o4uzbsrfnpm4isk7kh7f6tsccd5qghur7vkjkyumgwrylvu2xl@dbeuv5cuxvxj>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
 <20261020-fw-devlink-nexus-ready-v3-1-fd6f1c17e16d@toradex.com>
 <20261020155841.59037c99@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020155841.59037c99@bootlin.com>

On Tue, Oct 20, 2026 at 03:58:41PM +0200, Herve Codina wrote:
> Hi Ernest,
> 
> On Tue, 20 Oct 2026 15:00:12 +0200
> Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:
> 
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > 
> > of_parse_phandle_with_args_map() reads the #<stem>-cells property of the
> > provider referenced by the consumer into list_size. It then copies that
> > many cells of the consumer's specifier from out_args->args[] into the
> > on-stack initial_match_array[]. Both arrays hold MAX_PHANDLE_ARGS cells,
> > but list_size is never checked against that limit. A malformed
> > Devicetree with a larger cell count therefore makes the copy read past
> > out_args->args[] and write past initial_match_array[].
> > 
> > The cell count of each provider selected by a <stem>-map entry is
> > already rejected when it exceeds MAX_PHANDLE_ARGS. Apply the same limit
> > to the provider referenced by the consumer.
> > 
> > A plain reference to such a provider, without a map, now also fails.
> > Previously it succeeded with the specifier truncated to MAX_PHANDLE_ARGS
> > cells by __of_parse_phandle_with_args().
> > 
> > Fixes: bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> > Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > Link: https://lore.kernel.org/all/aq1CSswlo57jZpMH@monoceros/
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> > v3: New patch (Uwe)
> > ---
> >  drivers/of/base.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index f63a9486b130..5abadab22392 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -1587,6 +1587,11 @@ int of_parse_phandle_with_args_map(const struct device_node *np,
> >  	if (ret < 0)
> >  		goto put;
> >  
> > +	if (list_size > MAX_PHANDLE_ARGS) {
> > +		ret = -EINVAL;
> > +		goto put;
> > +	}
> > +
> 
> I would be stricter here and avoid the usage of MAX_PHANDLE_ARGS.
> 
> First I would check the arrays size to be sure that they are consistent and
> then check list_size against the array size.
> 
> --- 8< ---
> 	BUILD_BUG_ON(ARRAY_SIZE(initial_match_array) != ARRAY_SIZE(out_args->args))
> 	if (list_size > ARRAY_SIZE(initial_match_array)) {
> 		ret = -EINVAL;
> 		goto put;
> 	}
> --- 8< ---
> 
> IMHO, this is more robust against modification of the 'args' field
> definition in struct of_phandle_args or modification of the MAX_PHANDLE_ARGS
> value which could lead to some inconsistencies.
> 
> Best regards,
> Hervé

Hi Hervé,

That seems reasonable and like a nice way to do it, thanks for the
suggestion. I'll incorporate this into the next version.

Kind regards,
Ernest

