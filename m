Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60336EA80
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114493; cv=none; b=N0tooRpgf0eM3NPVpEY4lQETLF2phAUJpA463MzUwQrXL3AKDtcVOlaR7tpPGamathYLuVfbXPo2i3V6AgESmTblHFf7d+krwxd9JI9v+Wg7f0+1D6GlSLrWwNShP691GOYfRyOXq7DSyN+xmN+kZVMpnXmGeNVHV0LN0AtvIJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114493; c=relaxed/simple;
	bh=9j3LweGQa5h448klBDmx+S7b07p40rBJhjy4ltbUj4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3Y1MLUz5uh0RWC2OTIhYsC7YZ+vdN7xK5BwL/YgT0Ddw8dDhB8gGSRuhNYd5Nh+qSQfWYRqujQKoaatSBjoRYFiUnh8w1QyupsS27VxDow7Ye+sutaIQ47wuxlFK8OFZMkYFLaIYO99vAt7Mvd2j+0OFKofewckLYwJOpuOAu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6TDd2rk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6TDd2rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7691F000E9;
	Mon, 22 Jun 2026 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782114491;
	bh=hrAoLl/SaWHu76o5C5v1ETpbLKs1INlzXt/u6Ro5aOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z6TDd2rklmTh0XIgsy6gh493/mQ/hn8yXXB6CyBCTRVTmltJ9+BGEtezVudZgRGK+
	 LaguKCz5+ymaFUDHPszsXMahNWtB7cpUWxRar5L6J7zTLoQUrlgZMlwUcddzls5UR+
	 26DZjAJ4dIRiWyDOvCmFm7hZW3aOrif6ATRxAsM7PjqQEe74TY0tIWOl8+PJLNdZM6
	 hVm0fFFDZduGNvCUns81BPXDnlvhEs+hH1fViiz5O8n6CL0o7C9szX1pWSkqiqkDer
	 rlznA0Fmlm9EopJjAOolbOD5alUspqjXcgmB9FGeD1jSw9SFgHLF1Hnm3I9Yz6a5O3
	 kFYlqxhefc2KA==
Date: Mon, 22 Jun 2026 09:48:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sstabellini@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: xen: Convert to DT schema
Message-ID: <20260622-tall-moth-of-imagination-cf57fe@quoll>
References: <20260618151147.9438-1-tejasmutalikdesai@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618151147.9438-1-tejasmutalikdesai@gmail.com>

On Thu, Jun 18, 2026 at 08:41:46PM +0530, Tejas Mutalikdesai wrote:
> Convert the Xen ARM device tree binding documentation from the legacy
> plain-text format (Documentation/devicetree/bindings/arm/xen.txt) to
> the DT schema format, as required by the modern DT binding process.
> 
> The "hypervisor" node is named without a unit-address. The name is part
> of the Xen ABI and is matched verbatim by the kernel using strcmp() in
> arch/arm/xen/enlighten.c and arch/arm64/kernel/acpi.c, so $nodename uses
> 'const: hypervisor'. The node has a reg but no unit-address, so dtc emits

Honestly, this is a violation of DT spec, chapter 2.2.1.1:

"The unit-address must match the first address specified in the reg
property of the node."

I understand that you did not introduce this, but you do introduce DTC
warning into bindings, which I think we do not allow. dt_binding_check
must be warning free.

If I understood correctly this broken behavior was introduced in commit
9b08aaa3199a4dffca73c7cdec813b483b5b2d3b. Without any explanation why a
correct method of matching/finding by compatible is changed into
INCORRECT (nodename is not proper ABI) finding by node name and ignoring
DT Spec.

That commit message is simply terrible. Tells one thing - move some code
- but does something completely different - introduces ABI for node
name! ABI which is heavily discouraged and plain wrong.

I don't have enough of words to express the poor quality of that commit.

That said, IMO, the Xen/driver code should be changed to conform to DT
spec. If Xen is not interested in conforming to DT spec, then we should
not have in it upstream Linux kernel. This is that simple. Xen does not
get exceptions.

I also get that task might be something more than you signed up for,
thus the binding should stay unconverted till someone wants to fixup
this broken Xen code.

Best regards,
Krzysztof

