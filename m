Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44633556D;
	Tue, 11 Aug 2026 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470577; cv=none; b=kWwXLrCEv9g04BeLdzDbpN1c8Sjqoj0I4CtlR2JZEFqhJ4e5XkMybsNJS3MIg7S239n8SpTxG3+uAAv9QFPsE2pnKVCGmpzzLV/civofDUlkulKhl3qgpeX1jYM6x4CY62+xLVikXjZKryVXpngUDs9M+5/unxrrC/sETO6vpTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470577; c=relaxed/simple;
	bh=ybJ90HJ2W2EZbDMXd1Y3goYC0ddsAkxutjyfl+91E1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vF0/kOnsgeSM4S8Ajy6c12SNP29igril4+beDYUmJxhnmAR4zEFQ+3F9IFKvGOLYz6oi0BSFrfFYIO3EYv1l4A0DLa+exZVJBCuMZy1j+ESMhxu8gUfd/4ZXJNANPcxeEODGSp3LaXio8B84a5csb59HoNXlfm1Cx/eHu1F0f5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOD8joRa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOD8joRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB361F000E9;
	Tue, 11 Aug 2026 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786470575;
	bh=YetqZXK5ri6csfHUyHA4Ck0Tw+XMaZiizxQUt/gVqQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZOD8joRaWcSt58CCNzkrFllqQWJ8/Re06mH6qgSdhsd1MaKUV+WpvtKbAAwgTFpjo
	 sF5JUjfV+70vfX8gaFvE9L/f/GBjQsj7BZ6Gmt/5od+sm+NFywI67muyLDvI1ySvZE
	 YCOXl0j8VgI6Wl94Ym22iXMwbHSWoOxKQsDB1S6F4nErrQpCFQsDL36TT4eaJ8hIJa
	 yTAO5YndGgwtPUKV8gaDEZ+zMXx8JQxPJEizfZNZw+TIjewKfVUlOK3hCNK7BFNgxr
	 lJmhms99R4iQa83vdARZ+rjESsogLAZzH5lmMN3eaq1ZRGfEBr3/v8DqFPceSGogSQ
	 3gKgfoBRwXILA==
Date: Tue, 11 Aug 2026 12:49:35 -0500
From: Rob Herring <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, daniel.baluta@nxp.com,
	simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: mailbox: Convert TI Message Manager to DT
 schema
Message-ID: <20260811174935.GA2720095-robh@kernel.org>
References: <20260811091847.686229-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811091847.686229-1-egbostina@gmail.com>

On Tue, Aug 11, 2026 at 09:18:47AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments Message Manager binding
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../bindings/mailbox/ti,message-manager.txt   | 50 --------------
>  .../bindings/mailbox/ti,message-manager.yaml  | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml

ti,k2g-message-manager.yaml for the filename.

> diff --git a/Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml b/Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml
> new file mode 100644
> index 000000000000..01d62fc5a7c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/ti,message-manager.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/ti,message-manager.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments Message Manager
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +description:
> +  The Texas Instruments Message Manager is a mailbox controller that has
> +  configurable queues selectable at SoC (System on Chip) integration. The
> +  Message manager is broken up into queues in different address regions
> +  that are called "proxies" - each instance is unidirectional and is
> +  instantiated at SoC integration level to indicate receive or transmit path.
> +
> +properties:
> +  compatible:
> +    const: ti,k2g-message-manager
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2

Just maxItems is enough.

> +
> +  reg-names:
> +    items:
> +      - const: queue_proxy_region
> +      - const: queue_state_debug_region
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      Contains the queue ID and proxy ID in that order referring to the
> +      transfer path.
> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2

Just maxItems is enough.

