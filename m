Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FCC3E7BB2
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831940; cv=none; b=QSD4KK2s8ZvksumtNEUQSnI9tHMziEAmU3BHHjkGIO2rZp+9eK0zkrLwVe1KPalVW/ponGfFHEb5BECayLzfU8dOG3wTBNaVBPZX8/drzMhop8tTU1GSbCgynyM2yqdLQgLX7GjG1RT3rl/b3rvlUa34Xgxrq7faA8w6f6CEl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831940; c=relaxed/simple;
	bh=JFLe89ORv6CtpTIOWlPLJ4jMWK/w3jKTnLrwTPVsSmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxCALQ0VXNjHdYxcRTY7yeSv6kmXQhJOJHnf/Tso4qLWp81UO46VDj5QfgUAXilFP67WYdkFGc8UxCvfGhEzku5prz/+pFZtwYqEqBrwtk8E9KTveqgoBGvkkoLmmCLKoU7iL4N6GGVoyx68q8pjfNc4XFfGPtJUhk96hL6D+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EkoxFlBV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EkoxFlBV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ced3386430so43185525ad.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785831936; x=1786436736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pIRJZIZuQtpYpVv500fQ7C7fCRBLkrhOWthKpIbWoU=;
        b=EkoxFlBV7wRAigeq34KveuCoyQo+eF3JY8RKb2gQ1r10BDRyB0zjUdyx3d6xCMjyY+
         vEhIt/ZoSQpp01vlVV5nw3un1g4jR+Lf/mUtign0HADX2pOdUvlEOHd/BbEDOFnxlKJr
         N9hyLy5BbZ0HQeeXzvzOzPfOCmRpP4Sh3aZYAg7qpweC5K6xEqSlZIgo8CCYlgfsxoT1
         82pqi/I6fQhrnBu/TCJa2ZuQWrw0xuWKkhOr59/NCTDLr5akxAFTIgU/wx3zh0SK2iCK
         LdLZSCLzCjeXa6pIKK9wJtXeIr5p1AJdlaygFrpq+lAmcVwO81Z97WRKTK31C7uRNdRz
         cnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785831936; x=1786436736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pIRJZIZuQtpYpVv500fQ7C7fCRBLkrhOWthKpIbWoU=;
        b=IsJtJkdNRrrYP2KiWcYJKy823z5tNK64bRukETvjd/UZdN/Y7SgQNGSdOJ/bFM/pzy
         F8a8mRlOczrDIdZRhHi0XTqR5NxJ0peAytJvOBg+GCRWU3Dn26hq/csmFqm/OYGbPBGb
         dgvrlXJNZ+Si6z5s7qdlHGCmMvpWGwRpT3H+QGRKvL9OYwXWJqbcbXRu0YjiX1zb46sv
         a+Ove6HChgGae6S9p7XV1Ac898Vxzum5kgFJsulLD4LgoCu2ISXp/+zEMfBByED5LxtO
         8iGWST3kdGbKClblCs4/IJ9fWwcpOFVv6GhvkUdEK8P8hP2/luikDbFa9/RlSAno6Z1r
         PRIg==
X-Gm-Message-State: AOJu0YwRCJT5xfC0NUPFJg1N+5ad4GvC4WYpC1jLZzktBZ8ysNNJdYNp
	D2K1xyXKBPh5gnAvvtyohsY3W3WyVUQfYFV7wqCdptC3kbqZPy77kbnsIMSF+8Yq7oQ=
X-Gm-Gg: AR+sD13fFYs5IieiW6GZsoQOuxg/gmVyMqiUM5r+3matHrr5v4zl6PVsExGTODFg78u
	mudj/jJAhhhzMwHmeWjNG/sKb9aBoSUptPBscFaDvEX12U3v/0kFWihYbC09lf1+NPUprlMzn00
	F34PokL0DXFht3WBg7e7qGZeVuSEcFbK/aqUPfMknsdIyR2VoFj8Z5FRUXqAQws4DkRtiGrkpOL
	jxSw/ySIm0YnDZQWZc1gobFCbObuDsELY+3OBAqDvEnnU6iXWFHQDPSik5tkI5sHQNslcGFfLEz
	xaf64ge8mDGKyAqGm+F0Q/OjeIshA4TMvmQ3k1003u9fywaX5ZrovYYDY3Q9pJy4soLY9ufCEok
	6fqdETBPdWwpZcYWxjgF74wG2AMjkKrXMc1a6dplUVdNP/bW+c9a+O6QQXL9LOQFBd6/dQsoROa
	EuXFGgiMwO4PGOuNciqEAu5L5j27Jk3otTdGcTc3BnheRK3IktOmU5msb2szo=
X-Received: by 2002:a17:903:124c:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2d0523b7dbamr119193075ad.28.1785831935707;
        Tue, 04 Aug 2026 01:25:35 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4930e1sm2426415ad.41.2026.08.04.01.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:25:35 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:25:29 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr
Subject: Re: [PATCH v2 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive
 WorldGuard DT bindings
Message-ID: <anGh+dr/5dCX/cHd@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <bf39e87c-c077-4ccf-a791-42ae194b4780@ics.forth.gr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf39e87c-c077-4ccf-a791-42ae194b4780@ics.forth.gr>

Hi Nick,

Thanks for the questions.

On Fri, Jul 31, 2026 at 04:43:56AM +0300, Nick Kossifidis wrote:
> Hello Peter,
> 
> On 7/29/26 19:39, Yu-Chien Peter Lin wrote:
> > Add device tree bindings for RISC-V Worlds, a standard extension that tags
> > every transaction with a World ID for fine-grained isolation. SiFive's
> > WorldGuard Checker is a hardware firewall in the system interconnect that
> > inspects transaction WIDs and enforces per-World access policies on memory
> > and MMIO devices.
> > 
> > wgChecker specification reference:
> > https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> > 
> > Yu-Chien Peter Lin (3):
> >    dt-bindings: riscv: Add Worlds ISA extensions
> >    dt-bindings: riscv: Add Worlds per-hart properties
> >    dt-bindings: sifive: Add WorldGuard Checker
> > 
> >   .../devicetree/bindings/riscv/cpus.yaml       |  61 +++
> >   .../devicetree/bindings/riscv/extensions.yaml |  53 +++
> >   .../devicetree/bindings/riscv/worlds.yaml     |  86 +++++
> >   .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
> >   4 files changed, 556 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> >   create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > 
> 
> What's the plan for this and why do we need Linux-specific dt bindings ?
> This looks more like a set of firmware specific bindings, like OpenSBI
> domains for example (https://github.com/riscv-software-src/opensbi/blob/master/docs/domain_support.md).
> I understand adding the ISA extensions in the list (although the fast track
> is still underway, it's not ratified yet), but the rest don't make sense,
> not yet at least. How do you plan to use pmlwidlist on Linux to associate
> processes to wids ? Do you plan on adding a driver for the wg checker (and
> the markers that you mention) on Linux ? Do you ever expect Linux to run
> under trustedwid ?

We do not currently plan to implement a wgChecker driver in
the Linux kernel which holds the untrusted WID; wgChecker slot
configuration is handled by OpenSBI only at boot-time.

The intention here is providing a standardized device-tree format
for describing wgChecker hardware and protection policy, usable
consistently across Linux ecosystem (OpenSBI and possibly OP-TEE).

Thanks,
Peter Lin

> 
> Regards,
> Nick
