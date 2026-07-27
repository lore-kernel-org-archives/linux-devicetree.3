Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32860399372
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183527; cv=none; b=Hr6Jzxn01hzLzi0gQfyB3hwFPG/g8CaOLEgwv9vLlf1XOptxDe31ZmErChtELMszT0S/xKUCajLEHGt1uE3YcfYBT1LpcHVmKPir/fZSMmmo2ur+Hq8RqwrNP5+/L0ln9RwqjiejgaxGDz+ji3iip1UKx1uBB/CnPfoGDM9CRgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183527; c=relaxed/simple;
	bh=gNcf5FAeGwMO2eAYgTDqPg5NAC8YsKQ5n+TNGMBvLTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/Zhh+FwrENgDUeq7j1AQeMfNWOMePUZ8tZpFJTB0m2LXq/+Ta3ryIBz2TstQPTrII4OtBj2+NuiJQ/2Pv5JwI6omxKqlWusY+J5GndlESEPuFh4QSTM0F8o0E54YBjBfcuYI/fxr17FUbC06qeR9wRyAFfI/RZlDeT3rJ/0rEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WM51nznc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJX6av+R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WM51nznc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJX6av+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785183523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hs1FNANFvQNAtChNv+AEc1xU2AR9c2DWie+0JbesJzM=;
	b=WM51nznchwDrUwNEkpKepAXEl5baWbF9qSBYHrLRUxaM+ZpfuRMrzuxr47947St5kLx7J5
	QezKmZXNEbs6MYdHDX2GGHopX2b1D4VOKkHwnFy6d4qswm73Ztn6OMpLGEbZtAtLYvRL7l
	WvO7KunvN7ZPD5wku2tfNPqKVGQstRk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-RHSG9K8iNxu62-HbEWYl7g-1; Mon, 27 Jul 2026 16:18:41 -0400
X-MC-Unique: RHSG9K8iNxu62-HbEWYl7g-1
X-Mimecast-MFC-AGG-ID: RHSG9K8iNxu62-HbEWYl7g_1785183521
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso364664085a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785183521; x=1785788321; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hs1FNANFvQNAtChNv+AEc1xU2AR9c2DWie+0JbesJzM=;
        b=ZJX6av+Rnn9JNK628KK/KUJHk/KrKuENkmShin4uvC4F2jTpv1XhLuhNy7sRyLXo/D
         68bXG4OOMloU7tO4gmevmD1A5/O8j0LHpho5u/kOxRfGXz+ET4xizChlm+4O8zXOk0Tm
         KfqBeVaG7wGyvHo6xmtwrIVllPyaX1A3xREBpiIBDhVvlqJyBc+la6I2V0jea52kmpbY
         SJ1x3PHt5skK02RbGGxNHV/sWLeMnpW9IUYKFIFpQEweFr7+KKTRml37of5zoKyGWaW5
         oblpc998vLXpCi9zRC4rjaAR4aAvDPsvfkSlrxeiZ+v0oJsqbc/rlhi3Wsmi9QEyDYM3
         9gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183521; x=1785788321;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs1FNANFvQNAtChNv+AEc1xU2AR9c2DWie+0JbesJzM=;
        b=VKaynrhKcdQr3d3jlmAK6rZQG3g6F8vH5PHcsWV/7CY/8RLjG4Lrf/6lfJ/eZZ6qUs
         vK2LDm9xmu01p+Ome1aaTCS1dwoRI8mVPT3SUVF/d+ofx6Vj+Y4ezGZrMhuct2E5/bwJ
         HnI5XEFzOTi3c7BZEvxnzNhPAM1nRiBBqWP1V/Y7O6z0p1YhvmUJj5Z2R50VvMaFLIBX
         MbVM4AmPtzbG+FMjISxXdieEfUi+rDGJmpjsmv9fVdEgNPthJkQYoqtKTHCUjzOzmcyL
         eBtjHe74CulQ+ZNCqfWiZoJtE6Gui8Ziy21vPFoKq2V67KW9M2H9Wcnkbj7DbkjON/gb
         ZBjA==
X-Forwarded-Encrypted: i=1; AHgh+RpemQfio5e5oZvZFxNjDpSQTJCSrRI5EzI7ufF4T9TrZs5GED7CMhAs88ITABXL7qd50SJ8lPCEGGok@vger.kernel.org
X-Gm-Message-State: AOJu0YwouQckL6fZHbddRgFDtuR2rUhhHGSjjmo/AzRbNOe9QjxaSVQ4
	/EMecatFsyJ3pLIBF8piNshACr/Zv92jVPqClDbJzEPofqaeV5h+oiFDEZyITTEXpR1cOBEtZDP
	VZr9YzNUzpeOU+bevcDp9JRtI33w+y3K2cJzUzuq8O6EKYk2KzLpdUvqAP0nIDvo=
X-Gm-Gg: AR+sD13sS0qxKkt/BjYRja/9+aJmBpZoHPMFQ+4UZu8evwD51VZP2vvXCNYvT6bQvVM
	3k47zd5o21YvM0E6fFZ61ienJRkZmZ2hVV4A6n5oBuT2+QxE4csSdByt6E3nronnKkGcsdVH5+e
	3a9bNhTHlQ273SV55B7bkmLXI4n/+wJLprCboPMzxKkex5ll6c+FK0y3HgLWe1aI0Fl1Zi6u4Y6
	ztFaeC5V0Om9MFWZfDb33zyeNMDBbiXVqpTsOwGtFRG1z6VLxeHCGHTuro9VQZPmn8xBVM2aPun
	VgbivItxTECmqXbtzsziokjtpM5TB822pUR2vsnEY9rklJOOfCoqF4zXBMoNjwbJ1kdauToRtA=
	=
X-Received: by 2002:a05:620a:2a02:b0:931:2:65b6 with SMTP id af79cd13be357-932df696a6fmr953272885a.38.1785183520907;
        Mon, 27 Jul 2026 13:18:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2a02:b0:931:2:65b6 with SMTP id af79cd13be357-932df696a6fmr953269085a.38.1785183520387;
        Mon, 27 Jul 2026 13:18:40 -0700 (PDT)
Received: from redhat.com ([2600:382:771a:ae2:b914:58a6:76d2:bfbb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8708de3sm72230796d6.43.2026.07.27.13.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:18:39 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:18:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <ame9HVDl-TkzYWCe@redhat.com>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
 <20260724184304.192962-2-ansuelsmth@gmail.com>
 <ame6F0auneo1dGtq@redhat.com>
 <6a67baf1.d9578069.494be.a993@mx.google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a67baf1.d9578069.494be.a993@mx.google.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 27, 2026 at 10:09:17PM +0200, Christian Marangi wrote:
> On Mon, Jul 27, 2026 at 04:05:43PM -0400, Brian Masney wrote:
> > On Fri, Jul 24, 2026 at 08:43:01PM +0200, Christian Marangi wrote:
> > > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > index eb24a5687639..fc37786ac7ed 100644
> > > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > @@ -23,6 +23,7 @@ description: |
> > >  
> > >    All these identifiers can be found in:
> > >    [1]: <include/dt-bindings/clock/en7523-clk.h>.
> > > +  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
> > >  
> > >    The clocks are provided inside a system controller node.
> > >  
> > > @@ -50,6 +51,12 @@ properties:
> > >      description: ID of the controller reset line
> > >      const: 1
> > >  
> > > +  '#phy-cells':
> > > +    description:
> > > +      The first cell indicates the serdes phy number, see [2] for the
> > > +      available serdes port.
> > > +    const: 1
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -65,12 +72,23 @@ allOf:
> > >          reg:
> > >            minItems: 2
> > >  
> > > +        '#phy-cells': false
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          const: econet,en751221-scu
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          maxItems: 1
> > > +
> > > +        '#phy-cells': false
> > > +
> > >    - if:
> > >        properties:
> > >          compatible:
> > > -          enum:
> > > -            - airoha,en7581-scu
> > > -            - econet,en751221-scu
> > > +          const: airoha,en7581-scu
> > >      then:
> > >        properties:
> > >          reg:
> > 
> > This chunk is new since the split out v10 series[1]. I see that you dropped
> > krzk's Reviewed-by presumably because of the new chunk. However I don't
> > see a changelog.
> > 
> > I'm collecting patches up for a clk pull to Stephen. (I'm not sure if
> > he's going to pull but I'm going to try.) I'm not going to include this
> > series until I see a Reviewed-by by one of the dt maintainers on the new
> > patch.
> > 
> > https://lore.kernel.org/all/20260702093812.15918-2-ansuelsmth@gmail.com/
> >
> 
> Hi Brian,
> 
> yes all correct. I dropped as the patch changed (change is trivial but not
> correct)

But not correct? Do you need to post a new version of this series?

If this version is correct, then I suggest including a changelog here
for krzk.

Brian

