Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348853;
	b=TQmQLC9sEZviPyPPgnpw2VIEuILWkuRfTtxdd05dHxCOWQ1qZX3zUlZttD8c3QJaPpSS
	 Fza/IPa84xuW96yLanJ8x7gl4vskkn2fFgKJf41ubCmEFsUCq0G/WpsIqBqXCWsyQtTGf
	 14+bxVFhWZkAOYjKgR6jn9fPNlhVgxRBxzmyE7bhH/Ib3SubtPtbzzTolEOtTDOzCQB/R
	 tPQwi67Y73KI+DIR44e+O7e6eqcA48MX0fFGnRswwe7zdK4pubHR5c6GixOIetRaQBMmS
	 CwmcRF0DTD4YaFlXuPxVACuFRcf3RXcZh85yWrp+Eca2tVbj62cT3M5whka6QPIf/eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348853;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=DuycpNs03sYP9ydt7WVrX2PCxcSg8L4E7hZlxQgjiS4=;
	b=csYtMvnToOLbKF0eGnhF2UcU21n/rAXgpBa0MfgNHFvr0TtDU4ilHGtsrPwVweC9oSJs
	 zv2+gBQ9fEUVMwAhS8N5wiZzwxYQMyU56iq9P3FlXstZbd36jHA9ZpQiCPijSwBSI1kBe
	 PkFKzkHHUbxdZGSTS1eLO0BYHI2O4njTk+jE2iLb2r14OYSokrgpIWIXTCyigrfVrSqWp
	 V/TgNaQPmnXyQxmon/+2EutxBDyO3tzWK/TQ2XAhbkUrLMyS9aR3GIZ9G3an8OCgwqMyd
	 0q7iDBfmw/8RozjOKmFN90haCLibva1ZHT82YqzqIk+A7wBDklkLDV/+YAYJfikRepA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eTrGAT8S;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF445606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF445606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eTrGAT8S
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 900A4C49F5B;
	Fri, 30 Oct 2026 08:28:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCDC8603C2;
	Fri, 30 Oct 2026 08:27:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72906103286AD;
	Fri, 30 Oct 2026 09:27:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793348847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DuycpNs03sYP9ydt7WVrX2PCxcSg8L4E7hZlxQgjiS4=;
	b=eTrGAT8STLItJqcniH/UbKWcFCTwjL3yAw/OgOMWgPOAfvQJkY+nz/Pr8yA7oX+vg0alyA
	n9nfeOayX89kj/Ws56JndFquD/ivnKTFTXwd1Ash5/zOnFORffGVy+mmYFTJrnfRqtOq2u
	vw0Oh8/4ntgM8RRK7/RIIW2jxxG38BHlmVa60Xhp2BF0GEPWp7/eBS5UnZxRjlKkBbJuJU
	Q1Q89XfDkbG/9s82iG2Jk0O9JXhuiceXm+VPtkbCZUVtjOXR7I93+HuA3CYliBZNzCdMHq
	5HhAOQIw7HScppL+8RCtHh7MUeEbA8zFS7HzlM5hUXVIkjQ2q1pfvZ8zpY03Ow==
Date: Fri, 30 Oct 2026 09:27:17 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <20261030092717.2039a8b4@bootlin.com>
In-Reply-To: <auQFaTMTTMFZtia3@gractus.seuss>
References: <20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss>
	<20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss>
	<20261013190347.4f1d9b9d@bootlin.com>
	<atGzdxETQZ9ovJFh@gractus.seuss>
	<20261019151121.26d99f30@bootlin.com>
	<atgi4rMsw5W6kKkS@gractus.seuss>
	<20261021155923.55e48904@bootlin.com>
	<20261030010228.34d9daca@bootlin.com>
	<auQFaTMTTMFZtia3@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Fri, 30 Oct 2026 13:48:25 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Oct 30, 2026 at 01:02:28AM +0100, Herve Codina wrote:
> > Hi David,
> > 
> > I know you are busy but if you could give me your opinion on this last
> > message that would be greatly appreciated.
> > 
> > I've started to prepare the next iteration of the series adding support for
> > "structured" tags and their definition need to be stable to move forward.
> > 
> > The question to answer to complete the definition of the "structured" tag
> > format is: Should SAFE_SKIP bit be re-introduced?  
> 
> Sorry, I lost track of this one amongst all the rest of the activity.
> 
> > IMHO, it should.
> > 
> > Best regards,
> > Hervé
> > 
> > On Wed, 21 Oct 2026 15:59:23 +0200
> > Herve Codina <herve.codina@bootlin.com> wrote:
> >   
> > > Hi David,
> > > 
> > > On Wed, 21 Oct 2026 13:26:49 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >   
> > > > 
> > > > Correct.  Btw, I know I suggested "skippable tag" as a term, but given
> > > > how that gets kind of misleading in the case of writes, I'm coming to
> > > > prefer the orignal "structured tag" term.    
> > > 
> > > Ok, no problem to switch back to "structured tag". On my side also, I prefer
> > > this term.
> > > 
> > > Now I think that the bit indicating if a structured tag can be skip or not
> > > should be kept. I know the we can use "old" tag format when a tag cannot be
> > > skipped but I thing that using structured tags for those tags can lead to some
> > > benefit. For instance, in fdt_tag_next() we can benefit of the data size
> > > encoded for structured tags for all king of structured tags (skippable and not
> > > skippable) and retrieve the next tag without the need for parsing data related
> > > to a tag. When tag has a string as data, without the length we have to scan the
> > > string to find its end. Of course we can add the length if the tag definition
> > > but this is automatically implied if we use a structured tag.
> > > 
> > > So for structured tag, I can propose:
> > > - bit 31: 1 to identify a structured tag
> > > - bit 30: SAFE_SKIP bit (1 if we can skip, O otherwise)
> > > - bit 29..24: Data lendth encoding
> > >    0b000000: No data
> > >    0b000001: 1 32bit word of data
> > >    ...
> > >    0b111110: 63 x 32bit words data
> > >    0b111111: varlen encoding (1 32bit word added after the tag to encode the
> > >            data length in bytes.
> > > - bit 23..0: Tag id
> > >
> > > Without the SAFE_SKIP bit, all structured tags must be skippable. IMHO, we
> > > could regret this limitation in the future.
> > > 
> > > The cost of the SAFE_SKIP bit is not a lot. When we check to see if an
> > > unkwown tag can be skipped, we are going to move from
> > >   if (tag & 1<31)
> > > to
> > >   if ((tag & (1<31 | 1<<30)) == (1<31 | 1<<30))
> > > 
> > > IHMO, this is acceptable.
> > > 
> > > Of course, if the SAFE_SKIP bit is re-introduced, I will also re-add the test
> > > checking that unknown structured tag that cannot be skipped leads
> > > to an error.  
> 
> So, I'm not entirely convinced either way.  However, I have a
> semi-related thought that might sidestep the question for the time
> being.
> 
> I think it would be a good idea to leave some bits reserved, in case
> there's some more structured information we want to put in later.  One
> candidate might be "invalidated-when-X-happens" type bits which we
> considered when discussing the versioning.  I think we can spare the
> bits, since both tag and especially id fields are pretty generous at
> the moment (23 bits when our entire current existing tagset fits in 4
> bits with a bunch of spare room).

Yes, I agree.

> 
> For reserved bits to be safe to use later we must insist and enforce
> that they be 0 for now.  That means setting any reserved bit
> effectively makes it a non-skippable tag for the time being.  Or to
> put it another way, that means we can amongst other things add an
> (inverted) SAFE_SKIP bit in future if we discover we want it.
> 

Yes indeed.

The structured tag definition becomes:
 - bit 31: 1 to identify a structured tag
 - bit 30..24: Reserved (7 bits)
               Those bits are reserved for future use. They must be cleared (0 value).
               If any of these bits is set, an error should be reported.
 - bit 23..18: Data length encoding (6 bits)
     0b000000: No data
     0b000001: 1 32bit word of data
     ...
     0b111110: 62 x 32bit words data
     0b111111: varlen encoding (1 32bit word added after the tag to encode the
               data length in bytes).
 - bit 17..0: Tag id

Is this mapping ok on your side?

Best regards,
Hervé
