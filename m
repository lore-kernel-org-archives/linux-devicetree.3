Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464204;
	b=sCC+3YYlci5wPEZLr55kwca1YPAZ9tPz2WDRbAVurViXql69OKy8EJqapbD2b/Y0LFeu
	 GFP+j/EtRAul5sxP1fk1DT5o6OgBuUpy1JxJsVl0N0F4/lhnjIciJT09nJEy/R1mmjYYj
	 YAwgKaOfGWcVRFxj78t5YuIUSGKf3Fx20o/q8YPaw7JyfInEuWVFfvkOIruhgHS8ITn4j
	 LjkVSxDmqT826d233e4kx3NwlcJzu8DKVOi8K4wfkSRGZHWGfVJimrigZPlCQPVeYhVJL
	 ocIsdXDwel+pfzRF4VhFxIN5pr9J5BNgDLJPq+0I4Qs6kz7ZaMnfvQBbxpQiDvRZGQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EgmEJPMkjbYM4FRPkppwPSirxq+mxfkqTc2AOCI0TeY=;
	b=i7TpJ+79rsm5DnpVjrEBh8Zue/k413R0LJNDzd0VvQWIa+aNSVCvfozoHivn9Vv/b5ft
	 ryq6i9AS3qmwRBAtdy0WoA54OVdYX+bUVya8VxVPxdr0bv78Ex3gFmZyuw7FE2v5MViXw
	 VuLoJ/6E75ZErWT9EGuDe7V0eADQUJLtS7c1xEv14uWSYMaeRpC7Idrjsh5fRC3Ih2Ksk
	 BMEZGAG70bgN4YoT3a7Fqv/eQPY1yzdvkBw4LAJqlgS1hiqgbIVDT1Hqw8plB98VuQkOi
	 4K8t/JWH9QBRBWLkuAaYpCjaAUqdxFd8JEZreSWWRI9OOLP15MZzyU3zUb8ewd6qjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaCaOq1I;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBC606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaCaOq1I
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c7d1fc8f9dso111725e0c.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464203; x=1794069003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EgmEJPMkjbYM4FRPkppwPSirxq+mxfkqTc2AOCI0TeY=;
        b=NaCaOq1IS4vwEHlRWQvnbsS9HsMF9dwaaD0vhkRKTrgIcVBZDkggWXU8/3tG46OTdm
         cpg6OM1czuebilGZOLupqWhc2EKGo3X/Gis5gz7rTdzJVzbdJIeV2LCJv1TWzJL5DEWN
         JxQeHBTv4vFWePfOxdUvRpDpzpHzgd+hrOSG3YEOlcvtJZa782VtaK0deY2K8j3uFQnW
         1XwmOXkCjWyWeI2h+QC3wE//RKwy9MhnGX1cOGQoLEfUxemm/XvK58do89hhvf6zn/eO
         gV/Uz0ZyhF7uGHPzptjbevWf6qPBT0ntpJg9jgGW0q1RNqoRMh4R/8+p5hkxDnnIkfuv
         8LHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464203; x=1794069003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgmEJPMkjbYM4FRPkppwPSirxq+mxfkqTc2AOCI0TeY=;
        b=0sk4w2SV5DcraMtUXF+BuhSHGtUQ782DvJEm7+8qZYubgp0ToHv/44u6xVRJzVuaxt
         q/703sC1M++wZ+bkapbf1Jod0h30FpvjeSJwONtli6VvyER4Zi0XFYHNYC0+zot8nJ0F
         JwhhfXn1tEDoaK67dJaCA069u25V46X40sph9Mss8pj/gDmy9qTn8CkouVkWsSe2nX9p
         fBjn/prXCBzpMStYA0Gu91WnJCh54xyEP2Z6OD+83y7NliNb0ifnPFKsXGL3ZE2p5HDe
         CqWyXxQnElfR8WFLOU01M13RRfMUZU0Y4Q88zBn0o7Gy3eoCO9QPxR7NEdotLWqtkd3r
         jUQg==
X-Forwarded-Encrypted: i=1; AKwUvByVtQ6gXxmosZ3Bxl51SYxtFBKhdjT4x79inHJGfNyqK9oAagYqGina93mktWr/p1qgD+6pFFKDrC90@vger.kernel.org
X-Gm-Message-State: AFq9FYKIy47HuUuHdzImamPvHS+bNY71MdHhLfH66l+pUIsCbD/vdCi0
	w8S/d2AMgrd2rssTaMVrUE+b+irdJRpqCyiYPtLOqHcp8OhnFlaLLcf4
X-Gm-Gg: AYBFou3RwVpsdVvVM2PAXO4BIOrmAKI62D9vZ/56U2OTd0xCcEt4tuH7OQlq1J+IZ3E
	j9PlPq2WxEinObv1mWn3TOd6krF2ZygyBbXl3DgcuK1LYL/r2PxZ6EZcxXnA2XkFtMTrklZSIpq
	vtmvMZlgtzfBnSVsgXqFx1/TK3Qxnt7HG1/XiZiRxkU09RoNx1wPCF1LhsPgJsLR7REmYe15Mc9
	0XgLxtr3X9xk7qFUPZ5ErCcZ4duHNe6Q0asEnaBtQswJMg7sD/uxTHWiIzUMcqm+Xvrlstrz6Xe
	4RjRdmK+IfgAnJHKMkXPLk/pn3YbOc43pHfuK7EeH9FV9CT6/Q2Y1QEvz7BiVBzVpjH+43Go8PA
	L4uZNGfEpyd+yqfq3tySHQOiCkCyyaD0DYFJH0uULwcpG2+zMEPb+TllqLR0vbu3TbAGfS1cGgv
	DDwddZfO3rvzHkQbAeqi/2EMILkOad1biX9aoo5B9wZsaG4NO4eMqBUJDxgL0vYUXNmd78cOarr
	uz1ChCIKJrYGLCHt5Wd5n5EYPhgGG/GllYGXYwhVc6CQyTUzWMf3yz/IxrgAxIJDyIRGlTlXjv+
	3tbp8yRvyJjZUiP2yIT5KniXs/qbcZGkfPpLNBKCDTm6QjByOyx+0a1XsZWAORvok/SNc1Ir
X-Received: by 2002:a05:6122:12b4:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec685631b9mr2836551e0c.2.1793464203129;
        Sat, 31 Oct 2026 09:30:03 -0700 (PDT)
Received: from JSANTO12-L01.ad.analog.com ([177.112.152.97])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69caeccdsm6020716e0c.16.2026.10.31.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:30:02 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:20:26 -0300
From: Jonathan Santos <jonath4nns@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Jonathan Santos <Jonathan.Santos@analog.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux@analog.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	dlechner@baylibre.com, andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 1/9] spi: dt-bindings: Add spi-cs-composite property
Message-ID: <auWIqpIaegH+AWV4@JSANTO12-L01.ad.analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <e9308680e7b45ecf9ef2b6b2a752ffdd4d23b80c.1792435248.git.Jonathan.Santos@analog.com>
 <20261026020003.3f3fbe86@jic23-hlaptop>
 <20261027-colonize-primer-f994b88171a6@spud>
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
In-Reply-To: <20261027-colonize-primer-f994b88171a6@spud>

On 10/27, Conor Dooley wrote:
> On Mon, Oct 26, 2026 at 02:00:03AM +0000, Jonathan Cameron wrote:
> > On Tue, 20 Oct 2026 22:56:41 -0300
> > Jonathan Santos <Jonathan.Santos@analog.com> wrote:
> > 
> > > Some setups combine several SPI devices into one logical device, with
> > > each chip on its own CS line. All of those CS lines must be asserted at
> > > the same time, so that one transfer reaches every chip.
> > > 
> > > Add the 'spi-cs-composite' boolean property. When it is set, every chip
> > > select listed in 'reg' is asserted together on each transfer.
> > 
> > To me it feels inevitable that we will see a device / combination of
> > devices that want groups of CS lines together and others independent.
> > 
> > Seems less likely we'll see more than one set of composite entrees.
> > Maybe this should be an array of values that match with specific
> > entrees in reg?
> > 
> > I'm not sure though.  Conor, Kryzsztof or Rob, any thoughts on this
> > or similar things that have arisen elsewhere?
> 
> Why does the property actually exist in the first place? Does the device
> driver not know how each CS should be treated?
>

Hi Conor, Jonathan,

Thanks for the feedback.

The problem we are addressing now: today the SPI core gives a driver very 
little control over chip selects. The main spi_device only drives the first
'reg' entry and the only way a driver can use the other CS lines is through
ancillary devices, but for individual access only. For aggregated chips 
(AD7768-1 in this case) we need all CS lines asserted at the same time, and 
nothing in the core lets the driver ask for that AFAIK.

In v1 I added a CS mask to struct spi_transfer, but that also needed a
lane mask to work, and after the feedback we agreed it was too flexible
and too easy to get wrong. In v2 and v3 I switched to ancillary devices
(each with a lane attached) for single-CS access. That covered
individual access, but there was still no way to assert all the CS lines
at once. The spi-cs-composite property in v4 was my way around that, 
letting the main device be the aggregator and using the ancillaries for
single access.

David also suggested two alternatives before that don't need any DT changes:

 a) Add a CS description to struct spi_transfer or spi_message, e.g.
    passing the ancillary devices whose CS should be asserted. This also
    allows dynamic CS selection within the main device. And since the
    ancillary devices are already bound to a lane, this is less prone to
    errors than the approach on v1.

 b) Add a new "composite" spi device, so a driver would have the main
    device, ancillaries for individual access, and a composite device
    for simultaneous access. The issue I saw is that the ancillary and
    composite devices are siblings and their CS lines would conflict in
    the core's CS check, so only one kind could exist for a given
    device, not both (without some more complex logic in the spi cs check).

I like the (b) approach, but we would have to bypass that sibling problem.
The (a) looks less harmful to existing projects, if everyone agrees I can
implement it on v5. Also with (a) I think we can drop the spi device
name for now (or not?).

Best regards,
Jonathan Santos

> > 
> > The most general case would (subject to it not working) smell like
> > 
> > reg = < <0x1 0x4 0x5> <0x2> >
> > 
> > Where intent is that 1 4 and 5 are meant to switch together and
> > 2 is separate.
> 
> I would expect that for this kind of device, the driver should know that
> the first 3 CS are switched together and the 4th is not. I'm not really
> sure what the internal representation should be, because if someone can
> make a device like this, they could surely also make a device where (to
> borrow your format) it behaves like
> 
> | reg = < <0x1 0x4> <0x5 0x2> >
> 
> and so on. But if those devices don't actually exist at the moment, and
> everything is either all together or all seperate, the API for this
> stuff in the SPI core doesn't have to solve that until a device actually
> shows up.
> 

Yes, this is a bit out of the scope and kind of complex.

> Worst case is something where there's a variable grouping of chip
> selects, e.g.
> 
> | reg = < <0x1 0x4 0x5> <0x2> >
> 
> or
> 
> | reg = < <0x1 0x4> <0x2> >
> 
> but maybe if that happens the thing to do is permit reg-names for that
> device, and again store the relationships in the driver rather than
> try to convey it via DT.
> 
> Cheers,
> Conor.
> 
> > 
> > How to do lookup on something like this is another question.
> > 
> > Jonathan
> > 
> > 
> > > 
> > > Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> > > ---
> > > Changes in v4:
> > > * New patch. This has been included because without an explicit property,
> > >   every device with more than one 'reg' entry would have all its chip
> > >   selects asserted together. That breaks devices that use ancillary
> > >   devices for the extra CS lines, so the composite behavior is now opt-in.
> > > ---
> > >  .../devicetree/bindings/spi/spi-peripheral-props.yaml     | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > > index 4894196c8f9c..456cb9095632 100644
> > > --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > > +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > > @@ -60,6 +60,14 @@ properties:
> > >        Delay in nanoseconds to be introduced by the controller after CS is
> > >        de-asserted.
> > >  
> > > +  spi-cs-composite:
> > > +    description: Some SPI devices can be aggregated into a single logical
> > > +      device by asserting all their chip selects simultaneously. When this
> > > +      property is present, all chip selects listed in the 'reg' property are
> > > +      asserted together on every transfer, treating the group as one composite
> > > +      device.
> > > +    type: boolean
> > > +
> > >    spi-rx-bus-width:
> > >      description:
> > >        Bus width to the SPI bus used for read transfers.
> > 


