Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5253D8132;
	Mon, 17 Aug 2026 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975521; cv=none; b=npB2OB5AacgoN0cFVWV1rdJZPUWzBPgTfo5EPADo0AntJHKitHxNh69kq95kn83jLapde3+bobyy27uZqioHBdThbD6W/fxO4Q5zUip439BRAdX3g4u5DmRBRjrEG0JpPfj0nGTqYyr570tRIeZSA4tfPiHdfmUpRsYr+v6pyR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975521; c=relaxed/simple;
	bh=t+wt2DFkSNMVUdbVmH1RGdQ+Nik193PAYalDe/hOfms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcH1Kl6KlUu7PNGOKCEZ9pxV67LmeKBuG5EuZvCZyr7ls0hS1WKeY2270Qgg801fC7vbtVKPj0naKH+8KywQ0/AyRcjtVi8DwhjmMLoajuM3y9wErXJkyXa4g2Sei25unKqWPi+WzsPFDqPlw5mcW9yvFvlEs6CCy5HDYPq4qew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKl/jC9S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKl/jC9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969491F000E9;
	Mon, 17 Aug 2026 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786975519;
	bh=sjsVfIgEBH24hh2SKxarhNBMmjJq46YIV0Vy4g8mMdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JKl/jC9SRLwz7Isn5PaYBSTub1cupE1SktR9aMZiMuzH708HmS1/9GWcpNECH0uNH
	 v2jyZphdSVp1g1C2sFqUtE4DrOlXAqINURi7dVtdBy1T84dV3JFKblOSnsgfLpmi+G
	 aWpYMjJzig+aeTSF1Z68BzeKLKHnlxuuTWRSrk75dX6kIa4/ZoAcnt1G++46YCBQe/
	 eQAyl1M2A8lxOrzNhlFEdN7n17czmFtOKDYBC4dQdidJn4ATxfiDRCa0B9P20qSryn
	 0qTE5CRq1nDnwgN2biZJVYrj3859svkvgIi/SGmcF8xCGek/oomEIFaddHpUeQ3l4v
	 SZXebSXD3dB5Q==
Date: Mon, 17 Aug 2026 09:05:17 -0500
From: Rob Herring <robh@kernel.org>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vkoul@kernel.org,
	neil.armstrong@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	johan@kernel.org, rogerq@ti.com, Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: ti,phy-usb3: Add aspcie
 reference clock setting
Message-ID: <20260817140517.GB18207-robh@kernel.org>
References: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
 <20260806091112.164695-2-david.oberhollenzer@sigma-star.at>
 <20260812022031.GA554483-robh@kernel.org>
 <3c11637c-8e81-44b2-8692-a5c7940ab7c2@sigma-star.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c11637c-8e81-44b2-8692-a5c7940ab7c2@sigma-star.at>

On Mon, Aug 17, 2026 at 07:19:51AM +0200, David Oberhollenzer wrote:
> Hi,
> 
> On 8/12/26 4:20 AM, Rob Herring wrote:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: ti,phy-pipe3-pcie
> > > +    then:
> > > +      properties:
> > > +        ti,syscon-acspcie-tx-rx: true
> > 
> > This has no effect. Invert the if and move the else here.
> > 
> 
> Before I send another version of this patch set, are you really
> sure about this?

Yes. The only purpose it serves is you have to have a 'then' to have an 
'else' clause. (BTW, json-schema actually allows omitting 'then' and 
having just if/else, but the dtschema meta-schema does not.)

> 
> Not only did I copy that entire block from the one directly above,

It's wrong too.

> (the one that is supposed to only allow syscon-pllreset compatible
> is set to ti,phy-pipe3-sata), I actually tested this by running
> make dt_binding_check.
> 
> If I intentionally break the example by setting a wrong compatible
> string, I get a "False schema does not allow" type message, same
> as when I use the syscon-pllreset property with the wrong compat
> string.
> 
> Is the existing check broken too? Is there something different
> supposed to happen?

I did not say it was broken. It is functional. It is just not minimized.

Rob
