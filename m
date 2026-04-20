Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B33AA1B0;
	Mon, 20 Apr 2026 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721912; cv=none; b=sqWNUFQVj3z5LPPUNce2zm+Ju2Smcgtikr89K8TWe9SuRVsbUu2n9A61HLEuq2HMbFJerx/JCxwE4mhqhqMcA4PkL7kVlLizh6kS2kzhCQP19VPIhHcPao8P0Bi30QoTAhuSUBo9pD2aj24kVlETZEn0REr8rYNx9uRlguNkSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721912; c=relaxed/simple;
	bh=I8nNv8NY/ksywkTVY0haji/kBEf+9HQMgNuDSyI9tNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfCgVQsuSoUlD2B3bkyOV+I6yWIXtip2q06NUTDlF3kb7ddlBupT9JVBcAd3HgSBD/Rciz2bV7WZu5zV/TmU+TjuX3NvmfPzvKI/xKbMOGIG6ml0Bnz11eh63sVpxWD8nYh5SW3caM0s6ZKcolvSF6V4mZTq1Fgzxw8EshUkJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FadkUhAu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FadkUhAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75859C19425;
	Mon, 20 Apr 2026 21:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776721911;
	bh=I8nNv8NY/ksywkTVY0haji/kBEf+9HQMgNuDSyI9tNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FadkUhAu/qfwKjLNF1r09v2jnY+1cG6mdmayDB62+hGhOHBm1hiWDwD9slpvXRs0A
	 6jtWa4p6CKpcmPPnSR7oWDjCDz0Raw3NOqlWHv8WcKhCEOcW0Z5KdvPU4B5jmofklR
	 0kmHWB6sD5857hQNdWaIPfgJX+pX92v71SZ00IiYMQK8r5V8q7oYtD9bv2vK+ovSLp
	 QTFMhHMtEnZNjmrVrCHfiAU0wsfDyLzDPEoiVrjEE56VtG5x2ZrqxwMkk/2CJDfliz
	 iFIPG+5xEI0tr8r3ERSsWk4pmv4Y1sooDL1XS3be45xLulcHTVHzY8HddLrfeBtM3B
	 YoeWVz+6lvahA==
Date: Mon, 20 Apr 2026 16:51:49 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dt-bindings: automated coding style check for DTS
 examples
Message-ID: <20260420215149.GA3324615-robh@kernel.org>
References: <cover.1776700167.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776700167.git.daniel@makrotopia.org>

On Mon, Apr 20, 2026 at 04:50:19PM +0100, Daniel Golle wrote:
> Reviewing DTS examples in binding YAML files for coding style is
> tedious and repetitive. The rules in dts-coding-style.rst are well
> defined but currently not enforced by any tooling -- dtc does not
> care about whitespace, and yamllint only sees the YAML structure,
> not the DTS content inside literal block scalars.
> 

Thanks for this!

> This series adds a Python script that produces a canonical form of
> each DTS example and diffs it against the original. Any difference
> is a style violation. The checks cover:
> 
>  - 4-space indentation per nesting level

I would like to see a way to disable 2 space indentation warnings. It's 
not something I think we should 'fix' treewide, so we can't have 
warnings for all of them. Perhaps just check for consistent indentation.

>  - property ordering (compatible, reg, ranges, standard, vendor, status)
>  - child node ordering by unit address

I would guess this is more a .dts issue as examples are mostly a single 
node.

>  - blank line placement (before child nodes and status, nowhere else)
>  - no trailing whitespace, no tabs in DTS lines

I think we already check this except for spaces followed by tabs. We 
might be able to add that to yamllint.

>  - node names using only [a-z0-9-]

This could be a schema. I actually have a WIP schema that I never 
finished. The check I had added was banning 'status' in examples.

>  - no unused labels (defined but never &-referenced)
> 
> The script uses only ruamel.yaml (already required by dtschema) and
> has no other dependencies. It is wired into dt_binding_check_one
> with || true, so currently informational.

One reason the binding checks are so slow is due to python start-up 
times. Part of the start-up time is module imports and IIRC ruamel.yaml 
is pretty slow. That's why dt-doc-validate is not called for each 
individual binding file for example and we shard it with xargs which you 
followed. But really, make wants to do things a file at a time.

We already parse the example once with dt-extract-example, so perhaps 
the best approach would be to run these checks at that point.

> Running it against the current tree finds issues in roughly 70% of
> existing binding files -- mostly indentation (many older bindings
> use 2-space indent) and unused labels. These can be cleaned up in
> follow-up series; the immediate value is catching problems in new
> submissions before reviewers have to.

'make dt_binding_check' must be warning free (with the exception of 
using dtschema main (unreleased) branch. So this will need to be 
reworked to maintain that to be mergeable.

I think this would be useful for .dts files too, so it would be good if 
the extract example part and checks could be separated. We already have 
code to extract examples, but then you lose some things like what the 
indentation should be. And implementing as a diff or automatic fix mode 
would be harder.

Rob
