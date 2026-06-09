Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE93E274E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781039196; cv=none; b=Ll4TeSuzODR0RL4PIPAWrtNC97X2au4KVhiOOXCqfcZkGCCn9a14ZNaAlWvNhr4ko5lxw7j/jOEGmMWcAteNusnZ322ES7rwSRXUBxGFB6gZu1i2xaPOFz3JjqUQqet8zOqGiumkI1JokYounLr41hCEoEsJZD8l7tTdyEfjy6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781039196; c=relaxed/simple;
	bh=JnRgX0E23Ha/jYZIEprqGGXXF9FSZBw76QfDOqcYCMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNhK2LBX10VtW1yvnmMEWn/vU98i1IuCYwknrpnplqfAjXbveJoOtRYfpuYE4OsHpSY510w3nmENoUs9d6KDDg54b4rNH57lOo+dVRj5E8wYqjxTbcradvns2JeirInVQ3/Ov5reoMkBIUz+1a4G3uWHeojV8mwbTlfVSl6dgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqSyEBOF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqSyEBOF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36b900f350fso5323195a91.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781039193; x=1781643993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dX9Gf5auhZd7M2vITh4vuMczhC2UZxTRI4fFpUYnQg=;
        b=jqSyEBOFgvUds8fO6J2Gtp24254NgkmdmECVxkytQh+GQB+HUvSbhV8BtWOzEXqB2u
         bokxh333Q8YBWfdoUAYlgx8b1r16dLtVFihexId3K1jLQKBB+nx6JVQBj/ETaY3cbHAi
         f72Yh0RsjvFnaFndeMhifd92C/BhW2OZ9/FGqYEaZLdWDuYqIb+xUQ8ewsHabPrAjZI0
         b9VofjRhwg6lg47LcvR0Qi7vH3814Jb1UxIEh21iC4aUAI+noE6uQNwfjuNblhBkILxG
         NB8UU0JI9kf57HIllgSQdbV2DtAEoVt8EJTdSOcjtrqqUvQTzgayd8DARzmNHBJW8bdP
         QE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781039193; x=1781643993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dX9Gf5auhZd7M2vITh4vuMczhC2UZxTRI4fFpUYnQg=;
        b=nXc9Mcb+P2hxbWl3f5/+lDrb2fejMDLUZ3U8I5CDYRnJCtyaDsQOxSr8MB2+uCedCc
         ElFg3lbWhzOgj+k2A9AkOUeFwfQvPuYURUw4Mlxfq6piXeBlcMAr0T6i3gsDXtPXgDjC
         cayIR/mXKnK2uaZ2MnenoxK7XuxPfb551CmO/+PMwFc3onx24lozHrXy0b5ySjtj3Rtj
         6orlLet3T8MRUPevD4TMVJlNodZYfzWFxKvKBLguWg0TwFhOuLEVMU7ctr6DAeu8E+8P
         C2D5zAazhIJitMYdkDKV05f4hfZx+fI/S8pvpK24rLuxNS2FzUQy3azh3Pi8SjrVhVJn
         u2dg==
X-Forwarded-Encrypted: i=1; AFNElJ9Bes66UGynz4RvGuHmUGxyTBNugz4I/GjMhOA+qLwmpXjSa4NabzOI1tENWgpMOVEx5gx6/jvaGxEc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3bK+MzrXne+HaVH7c3bjbEAKlANHcu7KEA5S7C04mh7lhjZMY
	u3xUl93mAPqwUBSPIn4qO4FECaHSuNoOjXScgts31xbwjZYoLWGWVdqm
X-Gm-Gg: Acq92OGQ9jTiDd8V/dIafT09OJK0kVEIok6m/LRNVtShBcpUhMYUf1J9gbrvvo5/ksY
	Ki+mCoTxOMVdV5QxEr2yXEVwZdLj636dEiw9PlNruboROVqH4zeRjOGKTcF6DH/S8+IegdOm6Nj
	nmd1BIk5Z6XmumfDUulRqc3gJHef6vtvNwkFs+KcdI7j9zWJ/82MukMHcunOXrzEv4FbdnmBwDN
	CUfp5i/TL2ZO23MWUbS6T/3hm8bJ7coMCNosjrMLkQHQLejqWPN2yw1gSydnPgVDLhC1b+JtQBM
	RyBOLWcx04VQ07qXJQaqrIWG6A0hdWQnB6kFgw5y/BRDoLV1x16AqnsW+kxFY8gM1bcBV7O5B6W
	+dXlwXCnGeH90e5sfGruk7TOXfSaqPOPwi/bf2SmXnY/kXX4tknAuBDDZNIjViE6zShR/eNNZ/E
	HYr41jyA==
X-Received: by 2002:a17:90b:5345:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-370ebff342fmr22737341a91.0.1781039192824;
        Tue, 09 Jun 2026 14:06:32 -0700 (PDT)
Received: from localhost ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm20158546a91.2.2026.06.09.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:06:32 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:06:24 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
Message-ID: <6ycdvhpgygnelzp3ot63xtzcnlvac7emngvj7tviiclst4a7km@kjq7oqvecnxx>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
 <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
 <20260608-dazzling-hacksaw-dbe84766ec76@spud>
 <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
 <20260609-freeload-luckiness-7a143eae62f4@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260609-freeload-luckiness-7a143eae62f4@spud>

On 2026-06-09 20:54, Conor Dooley wrote:
>On Tue, Jun 09, 2026 at 02:55:59PM -0400, Guodong Xu wrote:
>> Hi, Conor
>>
>> On 2026-06-08 18:33, Conor Dooley wrote:
>> > On Sun, Jun 07, 2026 at 01:41:30PM -0400, Guodong Xu wrote:
>> > > Add a dt-bindings header that gives symbolic names to the SpacemiT K1
>> > > PDMA request lines of the non-secure peripherals. Device trees can use
>> > > these K1_PDMA_* macros instead of magic numbers.
>> > >
>> > > Point the spacemit,k1-pdma binding's #dma-cells description at the new
>> > > header.
>> > >
>> > > Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>> > > ---
>> > >  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
>> > >  include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
>> > >  2 files changed, 59 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > index ec06235baf5ca..0d4ac9849e27b 100644
>> > > --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > @@ -35,7 +35,9 @@ properties:
>> > >    '#dma-cells':
>> > >      const: 1
>> > >      description:
>> > > -      The DMA request number for the peripheral device.
>> > > +      The single cell is the DMA request number for the peripheral device.
>> > > +      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
>> > > +      numbers.
>> > >
>> > >  required:
>> > >    - compatible
>> > > diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
>> >
>> > Why does this need to be in a binding when there is no use of this in
>> > the driver? May as well be a header, particularly if these are numbers
>>
>> Thanks for the review. You are correct that these are not referenced in the
>> driver. My change to k1-pdma.yaml should be dropped.
>>
>> > with a set meaning that are lifted from the TRM, rather than made up
>> > numbers to make a driver work. The former seems likely, given you're
>> > indexing from 3 not 0.
>>
>> Yes, it is defined in the K1 manual [1], see 9.4.3 DMA Connectivity &
>> Assignments
>>
>> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
>>
>> I will fix that in v2.
>
>Just in case I wasn't clear (and I think I wasn't), when I said "may as
>well be a header" I meant a header in arch/riscv/boot/dts/spacemit.

Oh, got it. Makes sense. I will move it to
arch/riscv/boot/dts/spacemit/k1-pdma.h

Note that I already sent v2 before reading this, please disregard v2.

I will send v3.

BR,
Guodong
