Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392921;
	b=llHA8zuROzCCxIss+J1eWsfI8KwswIxsBBBbCRNKv37e6/ylwkAw4O6utA7yuDB5YU7a
	 tbjn4R6wm0PcPf5zcs0buGQ/9UnlCS7t5HzPobxz8nw2gtma2gesD0x7Vrw1Qo4AcqKlj
	 yaZJK5A5N3cnojopXQj4ErF/6UUrYYIJ+Wt6XsQvRD1uenuQNRlnBsWnfXk4seVf7yl1x
	 NNmHoCCECIB6ldBPPwMn/J7+74LrENNgvI6dUkFnRnWTNg4j9NmgB42W5px1S6FS+q09r
	 /Z6zIbcJ21otbVwtHeJFX7NJo3PcXr3UZ3YXA6u0Q9uI0vUqFjtgxyWthQxQjtfROaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
	b=Vbfe+bHvvNdwunDODgeT+VrMtprk0k352IrgZtA5N6WOs3jJVr/z0I4NsxKlAOPIJw0h
	 B5sP1+Vfq/wOF2BbCwQV3EHwzRHUYZSSI739iurBoeLQhtOLrnjZeKzLVzIj3iNBBaxmH
	 +ZA7CaB0Le6NkQgn3wOyFr0chXBiCgjW03P1EOg7PG+iBpZwYzqM5YmSETn5AGjieQ92C
	 I3hI40NHYQfD8ohlwvOBdQq4mKNrfvLhFmKw1D9H02kaPSd6F7pZop9bxBL0ZczpXS86Y
	 ePKRbpDmlQShQcREgznLmVx/qBysDaQIgkZGeCwAn3qqdEaz+ugySioJM9So0qcJrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWDbBcPl;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7F606A33D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF7F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWDbBcPl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa5103so801202f8f.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392918; x=1794997718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=zWDbBcPlqS1AC19c/HKVJJivTF+W3QDFDNQtIKOvb3hEChlZ4gd3uHJGRCqzbATgi+
         4WA95HRAW2CM31vuAQddh7JXzptPeou2EnYnKEFZGeKj3eOKR3tQjEXWHFnPKbtomdzT
         qYebL4M08+kzm+fecTEfuUPhgT3cf2mQl38aA0zBrA/RVjVllPMR7+CI+ypkaVRyCVHv
         JyASfAk8iIqtIvzNX4yFl994GJnBbETlTTUETK2oIjy7wEOHZ2MHdtCi1gKcVIEdxh/5
         IXw9112LmYt355Rq2qfFzl+8sFHcxLKC9TnUDf617SM9jDHfoqgOW4LLz/zDpS2v6VsY
         vYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392918; x=1794997718;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=2O7EYFYyajWaZyBFhFRz6pmO0BOKRMLFsdHnGUd/ed/u4CCqBu/QlTZr2lfF3ja0zj
         faYuy0mg0TtjkEEV/3rQR8aFx0O2le+VHryUcQ+0XoFFVwJzWRDu/TAJIC1Yfq6KcCbr
         01qqzeh1gTguex8O1FS+JBZGCe02KEwnYp8/N4tpP0c93pmiGB0tTuTfhb0ZJgiozuk7
         m86TB2c8MPBS4w6vduN3NrMRXmOCKfaux2R9oq7IEuDl8iXI0lnuLFTEW0wp5nSj7cu6
         njFD+LvBRcJF+UKxJ+cyauRGrVBs9ZJmHydteJg9I5e0kcQ5/IevnngKnFHLAj/oXfp6
         ER6Q==
X-Forwarded-Encrypted: i=1; AL+hErEkFCp9IpsXQZY+QHzILyO8aeqMmWP1f7xKaASMAqPWmo5N7sUTF+pSsGcMBGINBoxeIrFA6sy8aq3b@vger.kernel.org
X-Gm-Message-State: APuU4Z8qWlpvxvdrEnXWN2a7/BbuwfPtRjYrZvviHiQlynD5Wb+6q/n/
	t5torRKjoYh+kdlVe3XYr3vO47rnec16kwJAppNVmrKCUX6o1BF193PQ
X-Gm-Gg: AYBFou1tUhR9MGvmCsSFIENI8Lu7bpUgFKM8/0D3ukq6d1MWNobi6NVrMzrGphWguvI
	pvAZ5pcAFHF2jgb5HIknwgmjbhz44zJOqB8L8sQyds8hOUF4R5smZuNt7s3xWL2i21wKBQxDxbW
	2dI7A8neUmlY/6LC5XkIZRoOcRFrYxb5olfrX9qgH5Ff245Bq79Dj/F9dLCC6BuuuC/04p5p0zB
	NckzxepVH/YJSakc1cmhQs1fneAJgrz3cME78Uzi6e4pY8QveRbabiTgEdZ02GByELn1smrxIl2
	GI3Y015rLoQ8G3Dvgr5EWpQhtBYo0piCNpZya+b/wrGCOrzWwdyUtHIOQRdX5xeWoIroSmkdphq
	0GIXq5gnkjfIxc1He3Db0V/a2+b2f8lkPeH+YAVvY4qogAxQkXOE6Gp4fSS9+DbfNuUA/WL2sJg
	bTv/x2Ylwx4rMqSM/t+lARTQPYBEKbZ5fJdEzDYvwrobXYV4InfliOZ78K/tGTJ8F/guu8olRja
	IacgnwbiRmMnLpA7Cl8omH41BZZxxJ0FkzKkFhNlYPHhE630P5r0tMudAbtlEJzQAOCejhy4LdJ
	FS6JRHzNMyGaJJxLqrRtQiMXHhe2e9A5XAFSGCXfsnNGV8sPqMAKFYXlV3/Ktj8LKA==
X-Received: by 2002:a5d:5f47:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-499c75528cdmr3034821f8f.17.1794392918442;
        Wed, 11 Nov 2026 02:28:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f674fsm10337668f8f.33.2026.11.11.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:28:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:28:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Joe Perches <joe@perches.com>, Alejandro Colomar <alx@kernel.org>,
 linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Johan Hovold <johan@kernel.org>, Kees
 Cook <kees@kernel.org>, Laurent Pinchart
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
Message-ID: <20261111102836.759ec121@pumpkin>
In-Reply-To: <avOn57pfHntiwcaD@devuan>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
	<64aa89daf23821f95780813fe96882ff61688578.camel@perches.com>
	<avOn57pfHntiwcaD@devuan>
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

On Wed, 11 Nov 2026 00:27:28 +0100
Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:

> Hi Joe,
> 
> > Date: 2026-11-10 08:32:41-0800
> > From: Joe Perches <joe@perches.com>
> >
> > On Tue, 2026-11-10 at 16:33 +0100, Alejandro Colomar wrote:
> > 
> > no commit description on proposed patch  
> 
> There isn't much to say, but I'll add something (the explanation of why
> the parentheses are needed around the function name, for example).
> 
> > > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > > ---
> > >  include/linux/string.h | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > index 9e59f9697c9e..55ca4cb5122c 100644
> > > --- a/include/linux/string.h
> > > +++ b/include/linux/string.h
> > > @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
> > >   * *  @s+strlen(@prefix) if @s starts with @prefix
> > >   * *  NULL if @s does not start with @prefix
> > >   */
> > > -static inline char *strprefix(const char *s, const char *prefix)
> > > +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))
> > > +
> > > +static inline char *(strprefix)(const char *s, const char *prefix)  
> > 
> > Why introduce a new coding style?  
> 
> It's not style; the parentheses are technically needed to avoid macro
> expansion, since the macro has the same name as the function.
> 
> Alternatively, I could rename the function to __strprefix().

Or put the #define after the function definition.

David

> 
> 
> Have a lovely night!
> Alex
> 

