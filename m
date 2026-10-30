Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339928;
	b=FMaGthMtqWvdbM+nZE68knaRRV20mSi4OwQhyXTMHSj4vE6Aw71AxxIGCLjGGOOgMyD/
	 h3UMV/roWJHX/wdo2GCh2v8JmtHeF/3kW5UhG8JowSkC/z1tkv0qKkBBqeXDHXxIh8jMb
	 8Ws0hnSw0ir1Lj6+kGC7ajfK6S47hzuyEmuNM7rHcC7Miy1UnBQ9IhewATqj6yH1OVreV
	 mqB65uIBacJS4Y4CiLgbAeM1Zy4N0nVtfdCbO/1d5GVW5Yf2I+/Q9q+f5F/2cO9odJftu
	 VX27Iy2WkornlfpFFCpGyQ+j/Q+9NMxiIuCWDFNIb5nYyhzuE7pgS4K6ht5BKS5g7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
	b=T26uJuy4EnlLpSnba24lfg3y4uDDSstrYa1LUlU4KtI07/aud1OfFHRAwPDl7YwzjV3x
	 cJAdxtxklKprGHFx+yZ3+s9BD6g12d4ynBOprgyi1ybidMaGIO51cNQHet7DEfnarUhlI
	 g/BFQaUy0H2g/FPx4HdS4XXlk4tVZPDb9/duE5a1qi3G3a4bOO70ZpYLwpdKDkgdQoBw1
	 8ywPQczsc2qQV1nw+Bb7npoRJVi8qW5ctapSMo4Fh6Ep7pGBF1QWhAFq+0Owb7BkkQnsT
	 6okV3XYM6ZCsn0WvamoAOWFjEcx6r6pmAtA5bR4a3edKlPP4uF1e4C1HUqwkylZV48Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxOWSyi0;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292D5606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxOWSyi0
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so259344a91.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 22:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793339927; x=1793944727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=UxOWSyi0ZLjT6K/CtEHFfVSX4upjGZhtjvTQuYaOgoghxRdqk6YuYKma/rstK8OnyW
         EnlMZpYbwB5JxxcbXq8zBvy+70m6AbbNzMP6+FwnV2skuLOZ6ipMEK7v5pYZrMDTRWMA
         AyTTdhQO6aHAZ+xHJkR7p1UXP7BbTaP+l3sXKECV2E/6YG8xkNC8Hzwx4lzFGnBXzpzh
         qye8ca0y3z2k++H2xxu1sQvDiEJY2Euq6dJmJ8wdUAnZTEfBMvK1RmzJsXaY7ZA4XjhU
         GuO0J7l9DqYUyarNsZNIDWJGksm/oUJs3nxPxK0HlTarEOkVg9jXhvNXEJBdgV3wfrIP
         naag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339927; x=1793944727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=imDiXMCq4mn0QXJAo7Y1HSnOJlOkmdrYBb27qh0JiXvShUgdnMDGfaukqoKKfUdZoM
         ujfrss2S59/n5ZBH95Wt9GYdBZ/M+0qFmNXZUKvQfj9vWFBDk30mvIKn2aOQCCOa7k/B
         0BbeHOcUjzK2ZXBK+ns3zZhNu6KB1QD7SWZ6PS+dNMuKe1qBmXUTxQhrj01Bt77eoQqm
         NLBlWPQ1cjOWc0tLdV5S8sIem4xVfpgeoVj/uVJDgujhzqlKJHsHZ7WZ4xFVCmp4XFX1
         VAGdToLTEH+u9hT6p2txT3nhm27kNtOr4Q1HoYs5IkYKSl6IUvfEU6Znzhwb73zengfb
         TlbQ==
X-Forwarded-Encrypted: i=1; AKwUvByXbazw4nRmrCj+0PamgGmo3l/eVL57Ie/f3IsPkdDhJnIGNF4aayDEyr41Fc8mv1mF+jOzrt3tM2SO@vger.kernel.org
X-Gm-Message-State: AFq9FYLFk+so5xhqV24VHdL4cCi3nN8zXisb6Q0UoE6XePwPXhfKvXy9
	rnhovYjArlvvpFxtnmuf+yuDZceKK/Tv8NxwrECU35cuFItFaBvR1XXz
X-Gm-Gg: AYBFou0nD1vvjkUD40HD+wg1wDY22AaaEE8y0JwE0ilsvP89GEYM4q7FqWNfiFUxRIU
	ToqdmYAkoYSLQ6aH121FQm+E8godnMIyhFlSPndG3vo90OuPgJBdTJpRDpLDFsw2e09vjSGrxPP
	qjNsMNBLBPnFGvOXzXhFfT5GKQYBPYUyCc3kwQ/BIKPVFsU0ZAGyNW2VvZT+TW/o6/z0OPiRje8
	ksTklVNmISY3Gy5AtCr5SJoZt1JSXw4g26jEwxDrO3RXEh7/tMSFaEuv/iBdbdEcNbmtCjHOBFz
	LerDa9kuSVJwe5sjykVLy/Ci4cMXZYWbiLCS9mo13UGhqs5ypF/SO8xDcbFQ69opq4M4ygEutdC
	W0fQjCum8hy1Q7jFRkWOKSG7f62ALDfKrtpEXAYERYAP8xTYap57lEKWrr+KiX7MSoDlpMA/bSx
	LzgI9Nov3B1s4rnRFv7Uka5QbTgkzbARZG94ldBKUAJ/X9el/bMnpEsrYGzP0sdq+JMjxBGTkfM
	9OmRaxmZ8fkzQk6v/bu25iy+0z1tNmTKETbTIc2cnvBuIo2dbM8N34O4L7Sul/DNO67cTKZGRSF
	oST84C9F/a375vNyvApB5Q==
X-Received: by 2002:a17:90b:4e88:b0:3ac:85be:cd52 with SMTP id 98e67ed59e1d1-3ae89867829mr983310a91.59.1793339927439;
        Thu, 29 Oct 2026 22:58:47 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2c5sm7211185a91.3.2026.10.29.22.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:58:46 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:58:38 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
Message-ID: <auQyDnBA2tS2MtxV@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
 <20261029-urging-dimly-3747c8bb9b1f@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-urging-dimly-3747c8bb9b1f@spud>

On Thu, Oct 29, 2026 at 06:58:41PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:49AM -0400, Kwanghoon Son wrote:
> > Add a platform selection for the BL808 64-bit D0 processor, including
> > the T-HEAD errata and common clock framework used by its UART.
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  arch/riscv/Kconfig.socs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -12,6 +12,14 @@ config ARCH_ANLOGIC
> >  	help
> >  	  This enables support for Anlogic SoC platform hardware.
> >  
> > +config ARCH_BOUFFALOLAB
> > +	bool "Bouffalo Lab BL808 SoC"
> 
> Ideally, this should be more generic because it would eventually include
> other bouffalo devices.

Agreed. I'll change the discription more detail with devices
information.

> 
> > +	depends on 64BIT && MMU
> > +	select ERRATA_THEAD
> 
> > +	select COMMON_CLK
> 
> This is not needed, there's a select of COMMON_CLK at the arch level.
> 

I'll remove the redundant select COMMON_CLK in v2 as well.

> > +	help
> > +	  This enables support for Bouffalo Lab SoC platform hardware.
> > +
> >  config ARCH_ESWIN
> >  	bool "ESWIN SoCs"
> >  	help
> > 
> > -- 
> > 2.47.3
> > 


