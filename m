Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D757B3E3DBE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717700; cv=none; b=J7HALRC+w7P4DfEEdThjxTmcAsV2+5OVrxuPTvNUsSk3DvpMstD6yc0p+GPA5DHlZtNBuMNMxNktH6WGF/KbDq0K0vIABHbW6QFbPVX8/ZQ+UuBoMZBWBEmJmwrXzZ644Qd8fENoZi+ESmzUsFSFkqe89zr76wlvM8ez+SPsZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717700; c=relaxed/simple;
	bh=RgCZUC4jS6Lt3v/cTnJJ6BDyua81/gzYiRXtVus8Qww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eB/eK0hGFjOwUTvQ3jRDn1UdiSfu+oeHC6C4ITox2Yxdg6OBmBp1Env5YG9vU8NFb3aaCZARbFdV3N/CYFAG6yus+DAeur9und61vBzrVCPy8RsOU1p/D7l8lmaSZnytPE8c26KLkE0rbV5uJhLqTlGDMs/JYzkaVhy3rAKVhrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQ9TpGb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQ9TpGb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F821F00A3A;
	Wed, 22 Jul 2026 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784717698;
	bh=yOs+EZ4nCqSapgpAkNyddeRO+JLtO5EayXcjtFvu784=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HQ9TpGb84wJba5tbaYa7mnaA9QlFf+Ad/b8P9iuBevIcVxzF84u3kTAzySa7rK2RR
	 H2lWhPTgInCFWXG0n26UKAZUm1z4lB1tGRvAJtrWtDyI8CADBvFYxgezi4HQ+ewMMq
	 +AcxZsXmEcWtIE4TW2IRrDVYW/NRQmWeax4TNWcSKUWcej9plOelTtB/UckYVjV9gv
	 KxEwavek+NZHOvBxwx2LNs7XALh06UH4pgYm0RubrG586q3I/JnFtT5gRig0y5Ywg7
	 6DJd76cfU8D8UNjUYHJcBHlSQJ95BDJjwVh92AAAUNFseW2k0wEvxMSfp1MJeLdgvz
	 NmCzYhsG7LcgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: cdns,sdhci: Add CQE support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohan Joshi" <rohan1sj@cadence.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-cdns_sdhci_cqe-support-v3-1-4412856a4488@cadence.com>
References: <20260722-cdns_sdhci_cqe-support-v3-0-4412856a4488@cadence.com>
 <20260722-cdns_sdhci_cqe-support-v3-1-4412856a4488@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 10:54:58 +0000
Message-Id: <20260722105458.76F821F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `maxItems: 2` constraint in the `else` block allows invalid=
 device tree configurations to pass validation.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: mmc: cdns,sdhci: Add CQE support=
 ---
commit deaf7bf4553d7883c61e62fdcaba11a90405564f
Author: Rohan Joshi <rohan1sj@cadence.com>

dt-bindings: mmc: cdns,sdhci: Add CQE support

This commit adds optional Command Queuing Engine (CQE) register space to th=
e=20
Cadence SDHCI bindings. It expands the top-level reg constraints to allow up
to 3 items and adjusts the allOf conditionals for Elba and non-Elba variant=
s.

> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Docu=
mentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> index 6c7317d13aa6c..10bc9ac2073a6 100644
> --- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml

[ ... ]

> @@ -131,13 +138,27 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            items:
>              - description: Host controller registers
>              - description: Elba byte-lane enable register for writes
> +            - description: CQE (Command Queuing Engine) registers (optio=
nal)
> +        reg-names:
> +          minItems: 2
> +          items:
> +            - const: hc
> +            - const: bctl
> +            - const: cqhci
>      else:
>        properties:
>          reg:
> -          maxItems: 1
> +          items:
> +            - description: Host Controller registers
> +            - description: CQE (Command Queuing Engine) registers (optio=
nal)

[Severity: Low]
Does this else block need an explicit maxItems: 2 for reg and reg-names?

Since the top-level property now allows up to 3 items, and dtschema does
not automatically apply maxItems bounds from items lists inside
conditional blocks, could a non-Elba device tree incorrectly define 3
registers and still pass validation?

> +        reg-names:
> +          items:
> +            - const: hc
> +            - const: cqhci

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-cdns_sdhci=
_cqe-support-v3-0-4412856a4488@cadence.com?part=3D1
