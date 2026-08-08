Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB12E737E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188972; cv=none; b=JcC3waZxNdgANDL8zvi91mxktG+BBX16qTBr9IzUsPEU2H/3EQfSkcGIr8emR5OspyJ+pQzkfe9NyqSFGo03nSgHchc4RTxFmw41y+TmPAt8tNTZpGqjDuHJL9O+zTHkFn7d4u4+ra/O+mlWlwu1wQvnbCNYOYr5hSSosBgQhjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188972; c=relaxed/simple;
	bh=Db8a9g1s1wjZx2ogIEKnEKC6pjAjAQ8WN5rogNd6M64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uNTyO22AMU4NaalFvE28svfYFIytD7KetATVR1VQoMXj4Yk7M1C21AObr3ug1hTJkL/VhET9eOpvSZKSf8RsEIlPSw3dKJSFveTjKtn/pN/AuFxFwgfBNr/0RqVZ0EY4GsS/ZwXWdMJXMdKRulxxXV4CyTtClfIjsMMMFGgnH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8xwWTka; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8xwWTka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4131F000E9;
	Sat,  8 Aug 2026 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786188971;
	bh=d0OOoQK4h7PbyJ8d21AcqPjCLt35Icn3Tc6FDXLHHG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q8xwWTkaugNKYF8J0Jl76jMdlI0wlZPTudZSSo+HSkxnfRM3plCLNQ3mlH1hf/iIH
	 2R+KvemzjUyeDFOGsRXu3Qn2L6P61F00959NprPkTqLe5VIAoEGPKJrtMm5l73lGYL
	 KvToAUoHS9H75nnODT2KOHHW+FPvLhcevu/1CxRaUET4h6gzOX0EpLFfsF7vMUL267
	 NUrNEW+Xk1SQBRxDkCxAeWx6KqKsv9xtlnjc/dOHfGIWzvUAe2CVh1tNYHnO87sJ25
	 cSirs2OIW5tDBCpvSvmY59VF26xGZwzWaEFmpacXnvNcDLhX2pjcd8M1YYJEIQvGsW
	 tB3WcssgiVBCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: spmi: apple,spmi: Add t603x and
 t8122
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260808-t603x-spmi-v5-1-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
 <20260808-t603x-spmi-v5-1-553c5ac2f137@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:36:10 +0000
Message-Id: <20260808113610.DD4131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-bindings subsystem guidelines state that when a binding a=
dds a new provider capability like `interrupt-controller`, the correspondin=
g required properties (`interrupt-controller` and `#interrupt-cells`) must =
be enforced, and the examples section must include all required properties.=
 The patch adds `interrupt-controller` and `#interrupt-cells` but keeps the=
m optional without a `dependencies` block to enforce `#interrupt-cells` whe=
n `interrupt-controller` is used. It also fails to include these properties=
 in the provided examples.
--

--- Patch [1]: [PATCH v5 1/6] dt-bindings: spmi: apple,spmi: Add t603x and =
t8122 ---
commit 65d257979c0e4c52b73ff9a4d1d799b2a91dd019
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x and t8122

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c317..fceed47b2cd17 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml

[ ... ]

> @@ -34,6 +37,18 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

[Severity: Medium]
Does this schema lack a dependencies block to enforce that #interrupt-cells
is required whenever interrupt-controller is present?

Without this enforcement, could a device tree node utilizing the
interrupt-controller capability but missing #interrupt-cells silently pass
schema validation?

Additionally, should the examples section be updated to demonstrate these
new provider properties, ensuring dt_binding_check validates a fully
compliant configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-t603x-spmi=
-v5-0-553c5ac2f137@chaosmail.tech?part=3D1
