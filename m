Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793318567;
	b=13/ZjMr/PzE5aQZvJt3q+oC+cGwi2bP34WnoOjqP07cY39dQA4BOek2hZNeqcMB50Z14
	 gIfvoKj1ucjll1iq0OfwA6IaLoslaMJ3G82jKnW8MOHiSE3KwPHaSABnsXF3HVdivDp3o
	 95OR9otKe26UBGCGpFaur6ZkDbyeOlLn4r+E4AfLdTGH+8fNmuGIW9WsCJJfrK1KWwA8j
	 8HlD+BFmr3dyg+yv8y/D2ZhdSwFZGVaYIIPhMiFULWsdZEjYsS4LJhxCONzBZtPGxErvW
	 tkLrsSevjtkFccxAs4E9fjX2g02ZhkHR+RQjnjLeK8Xnrwao8qrc2DwVRGfBQvbxIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318567;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=EekVTKvOeeC7YsplvAwGdEYQ+UvW9EdugEoPsQ9stwE=;
	b=nnSmN1WpyG8M0vyaDOSdtFb5rN7KNJVgoQEta/blo1h2hjtw7FkaYGQgfPyCm4NoemZO
	 THvZqURszeFzobhccRRh7cSFdibdiuagNPZwzzEYQCLMkKGyKzgqCiixsjea3IjIyGf4A
	 NHZqyzemugVb8lO4MM2W+xQj1RctHTUf/fRYhgmv/SjFbjya7pAENdB1TfiQKDNG1LV6z
	 zErm3ivYjjCq3PJu6+ltIYajLUI4EOxeneU7dbGeQeyYeO9i7AA5C6WTZyU/MWAUmqwYV
	 ixufw380/Jc2bVmVOZQ80jNhBbzaUdPnJZUmk1LOSgLVM2E3Jqp6bi08U6MO71CPnkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tFz8MHm1;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7C606A323
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 00:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE7C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tFz8MHm1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C0F2DC49F56;
	Fri, 30 Oct 2026 00:03:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 308106076A;
	Fri, 30 Oct 2026 00:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DE84103287DA;
	Fri, 30 Oct 2026 01:02:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793318557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EekVTKvOeeC7YsplvAwGdEYQ+UvW9EdugEoPsQ9stwE=;
	b=tFz8MHm16YurNh2mIlIObooIYNsnhPs4cj3xNZ/bT4oXGpWFRAXR1ilWe2CvEdZ5RO1PPx
	LhyyqVDYi2l57JpiH2vwFLCfaXHw1WSFaUPT8lQhGdQl5+SwHOV2+aID9eeHE9ifID4Wnj
	3nA3XaC4DTitcDWgnFv0F4kTYhzVHCu9tp7Rw3UhlDTsz5lsgoYVNvWjROitSNF0IQtVh/
	nwZ8O+4cpqdUpl+WWRjg2mHAW577eyN3bJelcrmO7CGqwExB5HkygFQiZKfppR0Di1N1vs
	3MpxzOIQoXLBxqp3BTjtANZjLfu/lzlXJEwhgbHETx9IGMFJP8tXiYr2x7DDLg==
Date: Fri, 30 Oct 2026 01:02:28 +0100
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
Message-ID: <20261030010228.34d9daca@bootlin.com>
In-Reply-To: <20261021155923.55e48904@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss>
	<20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss>
	<20261013190347.4f1d9b9d@bootlin.com>
	<atGzdxETQZ9ovJFh@gractus.seuss>
	<20261019151121.26d99f30@bootlin.com>
	<atgi4rMsw5W6kKkS@gractus.seuss>
	<20261021155923.55e48904@bootlin.com>
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

I know you are busy but if you could give me your opinion on this last
message that would be greatly appreciated.

I've started to prepare the next iteration of the series adding support for
"structured" tags and their definition need to be stable to move forward.

The question to answer to complete the definition of the "structured" tag
format is: Should SAFE_SKIP bit be re-introduced?

IMHO, it should.

Best regards,
Hervé

On Wed, 21 Oct 2026 15:59:23 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi David,
> 
> On Wed, 21 Oct 2026 13:26:49 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
> > 
> > Correct.  Btw, I know I suggested "skippable tag" as a term, but given
> > how that gets kind of misleading in the case of writes, I'm coming to
> > prefer the orignal "structured tag" term.  
> 
> Ok, no problem to switch back to "structured tag". On my side also, I prefer
> this term.
> 
> Now I think that the bit indicating if a structured tag can be skip or not
> should be kept. I know the we can use "old" tag format when a tag cannot be
> skipped but I thing that using structured tags for those tags can lead to some
> benefit. For instance, in fdt_tag_next() we can benefit of the data size
> encoded for structured tags for all king of structured tags (skippable and not
> skippable) and retrieve the next tag without the need for parsing data related
> to a tag. When tag has a string as data, without the length we have to scan the
> string to find its end. Of course we can add the length if the tag definition
> but this is automatically implied if we use a structured tag.
> 
> So for structured tag, I can propose:
> - bit 31: 1 to identify a structured tag
> - bit 30: SAFE_SKIP bit (1 if we can skip, O otherwise)
> - bit 29..24: Data lendth encoding
>    0b000000: No data
>    0b000001: 1 32bit word of data
>    ...
>    0b111110: 63 x 32bit words data
>    0b111111: varlen encoding (1 32bit word added after the tag to encode the
>            data length in bytes.
> - bit 23..0: Tag id
> 
> Without the SAFE_SKIP bit, all structured tags must be skippable. IMHO, we
> could regret this limitation in the future.
> 
> The cost of the SAFE_SKIP bit is not a lot. When we check to see if an
> unkwown tag can be skipped, we are going to move from
>   if (tag & 1<31)
> to
>   if ((tag & (1<31 | 1<<30)) == (1<31 | 1<<30))
> 
> IHMO, this is acceptable.
> 
> Of course, if the SAFE_SKIP bit is re-introduced, I will also re-add the test
> checking that unknown structured tag that cannot be skipped leads to an error.
> 
> Best regards,
> Hervé



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
