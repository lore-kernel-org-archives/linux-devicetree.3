Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE3374A07
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829631; cv=none; b=DENPkVFpPHBigpHCyPTRs8e+kh11p90Gdj8VbDsWBONda9W1RoI14vT5z2+YMkPCzF1srFngH6scUkjQzLiglcqD5U7SPBhdSVXHsa9//ybV+WTvkpei4VfpDDcw5EffbCCs3xRp42YnnnH/9n+T1HEz6wHO9Hjc5KjDRlqmDtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829631; c=relaxed/simple;
	bh=qqAJzQUvbP2/VcxG9Vz21T1bAzsK0bmp/G1dbY1J1F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdLbsvZeFOIN/G+R+cED1w+Y93u7RorJUXNqkyiJqKsgbaOX7r6Y3p6MknJd8LgIaprzjBOIn7AlOGvGRBqqA4kuGY4qrpnLHymXw6jqEjtAk7dCf3x+kUwQ1Pko2QAKPeczHXryfsOieCCH+/DWrcU3MYWzeOqs9M19LoKZvOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrTrWIdZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrTrWIdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889201F000E9;
	Tue, 30 Jun 2026 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829630;
	bh=Hhft/ju7/4nhjl76EseN/P04gAXvPUruHOVXYFau7CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jrTrWIdZlGtR5mwQuYyc7S/msmWQOQUGQjXDMpdlXZk1cPa214PnInLWcKBckGSaf
	 +sX8NdSx4P4llOFhpJZdO2OMhIQCTrsbk9egRtpYHTRo8Pq1rNl9TGJWNz/m7UiF2x
	 jVzbTA1mIqiHANfOS1MolrAVO46HXRt0F6I53eHsGfZ55ZfNVVJKX39I1qccnRjrbJ
	 94+Kk7U0gnUBvPf2ruIAY23ix2LpY20rpBEEv2J52P7sIkRSX3bdF4tIonFTb9cxvb
	 IPptdo2Ary2ZAwaJDfwdYZG9k3y4fehKqkMbBJOB9STHuSP0qIOjcZnV7mS1RbaO8p
	 AyGxluZbeDwKQ==
Date: Tue, 30 Jun 2026 09:27:09 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	sstabellini@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: xen: Convert to DT schema
Message-ID: <20260630142709.GA2993298-robh@kernel.org>
References: <20260618151147.9438-1-tejasmutalikdesai@gmail.com>
 <20260622-tall-moth-of-imagination-cf57fe@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-tall-moth-of-imagination-cf57fe@quoll>

On Mon, Jun 22, 2026 at 09:48:08AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 18, 2026 at 08:41:46PM +0530, Tejas Mutalikdesai wrote:
> > Convert the Xen ARM device tree binding documentation from the legacy
> > plain-text format (Documentation/devicetree/bindings/arm/xen.txt) to
> > the DT schema format, as required by the modern DT binding process.
> > 
> > The "hypervisor" node is named without a unit-address. The name is part
> > of the Xen ABI and is matched verbatim by the kernel using strcmp() in
> > arch/arm/xen/enlighten.c and arch/arm64/kernel/acpi.c, so $nodename uses
> > 'const: hypervisor'. The node has a reg but no unit-address, so dtc emits
> 
> Honestly, this is a violation of DT spec, chapter 2.2.1.1:
> 
> "The unit-address must match the first address specified in the reg
> property of the node."
> 
> I understand that you did not introduce this, but you do introduce DTC
> warning into bindings, which I think we do not allow. dt_binding_check
> must be warning free.
> 
> If I understood correctly this broken behavior was introduced in commit
> 9b08aaa3199a4dffca73c7cdec813b483b5b2d3b. Without any explanation why a
> correct method of matching/finding by compatible is changed into
> INCORRECT (nodename is not proper ABI) finding by node name and ignoring
> DT Spec.
> 
> That commit message is simply terrible. Tells one thing - move some code
> - but does something completely different - introduces ABI for node
> name! ABI which is heavily discouraged and plain wrong.
> 
> I don't have enough of words to express the poor quality of that commit.
> 
> That said, IMO, the Xen/driver code should be changed to conform to DT
> spec. If Xen is not interested in conforming to DT spec, then we should
> not have in it upstream Linux kernel. This is that simple. Xen does not
> get exceptions.

The kernel has lots of things which are exceptions now (see PowerMac 
or anything older than 15 years). It's our fault for not having tools 
to check anything back then.
 
> I also get that task might be something more than you signed up for,
> thus the binding should stay unconverted till someone wants to fixup
> this broken Xen code.

I think we just update the nodename in the schema to allow (but not 
require) a unit-address and add one to the example and move on. It's not 
clear to me how much this is being used.

I've updated the schema to do that and applied. Patch 2 will need to go 
in Russell's patch system.

Rob
