Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F05C2BCF7F
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876254; cv=none; b=f3bcdooJX8utYYR40AS0kqSLXyou3nAhxf1bubqlap8djl0cHojIvzNbrpfCYAnoVBy2U6KkdLpotOiay+ybiTkHCEbrieo21iKnC5jtbkfpzwQPeK6LHIrppKmpWJ+9AKsBzs75W+HH284i8MjEEYOsGPp0HPGGS+BRakxIf/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876254; c=relaxed/simple;
	bh=ENHMBd9vubFLuMx4Ca4BhnRzNPwVkroclRNaRk78DAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f2/N5LXUgr5ztbGBZABuEFRnpeTf1sQ1CwmgdNBSUHXsGR02WH227QuV0R1f7SgrbibeSsQF+qtZUvpFLUJQm3dPQo3qUUCyuI1BNKmq2iL4XrsAWFJRnMUmtjL94BwnERnq5+ytPNzK07G6j8xNIhmOwziuCk3So3JtbPvye1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9pq9Vql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9pq9Vql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692211F000E9;
	Sun, 16 Aug 2026 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786876252;
	bh=B89bwKtLCzvAH0Xb9TqcJlH58nuREdwnUG0lNgJzR3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P9pq9VqlX58/GpULh06FVLXK+8bYMjwIC9sX/QCiMJWpTGi9SI+m35V+t+vY9ftPX
	 QqocrP1ks3d24GHZWOHApQCIQEVBW0YcpiqdUpMPIYS+ew7nDGtcFBqypAqK3yT85x
	 l0Z+x465Uxvb5PVJ+DZ/O//74H571aGbCPYEQn24uKdDmkjX4PKC4ENsqUzWazSy5/
	 LtcA7kuCZ7acwKr45/OIo5YZ8uGxaHxM7Zs/BJyzgukutLtdOe8thuktJoKh2lOIL7
	 Py6SU9R9e7g5JLbDp/ahuUzzn6TdgBbMV8phBJOyrRQgwMcmgDx75ycwKsd0R4h1Z6
	 75nlpsGjJpxrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: spmi: apple,spmi: Add t603x and
 t8122
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
 <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 10:30:51 +0000
Message-Id: <20260816103052.692211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding introduces interrupt controller provider capabilitie=
s but fails to add the mandatory properties to the `required` list, violati=
ng subsystem guidelines.
--

--- Patch [1]: [PATCH v6 1/6] dt-bindings: spmi: apple,spmi: Add t603x and =
t8122 ---
commit 55496611e1596aed1ddc4ec7dccafdc5fc8fb28b
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: spmi: apple,spmi: Add t603x and t8122

This commit adds t603x and t8122 compatibles, interrupt support, and
support for SPMI controllers that are not always-on to the apple,spmi
binding.

> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
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
The commit message notes that the interrupt controller functionality is kept
optional since it is only needed on 3 out of 10 controllers. However, does
leaving these properties out of the required block allow incomplete device
tree nodes to pass schema validation?

According to the subsystem guidelines for hardware variants, when new provi=
der
capabilities are added, the corresponding properties like interrupt-control=
ler
and "#interrupt-cells" must be included in the required list.

Should these properties be added to the required list under an if-then block
matching the specific hardware variations that support this functionality, =
or
should a dependency be added to ensure that "#interrupt-cells" is always pr=
esent
when interrupt-controller is used?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-t603x-spmi=
-v6-0-c5ab87aa447b@chaosmail.tech?part=3D1
