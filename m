Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E1E3CBE6F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960264; cv=none; b=t6NQ8GwSlwtFmCOXJk28T22CUqLdUVVoZDgAkmBrEpXGv0xd2GCpWHfEmmo6FUH4yVwerEtmPzuwDeUnd3Jv6xnNpEqR+6wkWRizmyelHFa471KP3w7P4IcxZG2JwbghxoNVTcxrHO/QKX5Tj06KfOX9BtBMJ60J1AatJZF9UvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960264; c=relaxed/simple;
	bh=1rLk13zS5YouEgsmH8ndr8LSlAie4T1FXLRyI4dIans=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bTwt+2J1e6qLZDZeJFGo/fZP1+Tli9XGPxKAS0f1SDPVwpr1LyiRke68KaIhMYtg0RXh+sHaaWcU6lHGwGHa7LgAM7TDwZTx3AjrCCxYGecathf9hpUECdkNKJW4P2epRkgh8JSmSA35hK4DQeju0Bl8JH1KnqWhufxj1Ki+eB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtdJ1KMW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtdJ1KMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4CC1F000E9;
	Mon, 17 Aug 2026 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786960263;
	bh=Do25FaiDbP947CkMH7ppTnZxvdH38+rZg8vIcy6uLxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XtdJ1KMWvQoDmEOw5yGIAwd7iboZEBWaykPqPYqOp+Ye+PXx/NGUzlN3gnN45NXtC
	 ryuUwxAaC8sF4Gr8Ih7O+49k2yoNbMO2hYpsjrq/r07JJ2Rs/hzBkjH7Xr1kp/n0en
	 rMci1jQ0qLIdlgvmeZm2axXb3fuFpjSTWhjuqUWwd6Prfrh5beawqmE3T+QrWqhELs
	 Bl7X51vnC+O+ReJwV5iVR+oVe5vdc5Oz+qf7Tt2kuptoSaDP1/k7bTgvQ5xn7xgo9w
	 shiQ9y8YFWPDsuPRlnpEgWYVVsgUe5He2QIpX6p9L5vZDmCgNn3c5eIsH/BZ4/XBSZ
	 VCk+6EcJt4DRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: vendor-prefixes: Add Xuantie
 Semiconductor
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R1VPIFJlbiAoWHVhblRpZSk=?= <guoren@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-xt_vendor_v2-v2-1-8d4eed65a533@kernel.org>
References: <20260817-xt_vendor_v2-v2-1-8d4eed65a533@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 09:51:02 +0000
Message-Id: <20260817095102.8B4CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Introduces a duplicate and unused vendor prefix (`xuantie`) for a v=
endor that already uses the established `thead` prefix.
--

--- Patch [1]: [PATCH v2] dt-bindings: vendor-prefixes: Add Xuantie Semicon=
ductor ---
commit 9230660a7e40e4df99ae36ef91b16bfb20d60e44
Author: GUO Ren (XuanTie) <guoren@kernel.org>

dt-bindings: vendor-prefixes: Add Xuantie Semiconductor

This commit adds xuantie as a new vendor prefix for Shanghai Xuantie
Semiconductor Technology Co., Ltd. in the devicetree bindings.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
[ ... ]
> @@ -1905,6 +1905,8 @@ patternProperties:
>      description: Xilinx
>    "^xnano,.*":
>      description: Xnano
> +  "^xuantie,.*":
> +    description: Shanghai Xuantie Semiconductor Technology Co., Ltd.

[Severity: Low]
Is this vendor prefix redundant given the established thead prefix?

The kernel already relies heavily on the thead prefix for T-Head/XuanTie
processor IPs (like thead,c906, thead,th1520, and thead,c920). Adding
multiple vendor prefixes for the same company fragments the devicetree
namespace.

Also, since the actual compatible strings using this prefix were removed
in V2 (as noted in the changelog), the xuantie prefix is currently complete=
ly
unused. Would it be better to drop this patch entirely and continue using
the established thead prefix?

>    "^xunlong,.*":
>      description: Shenzhen Xunlong Software CO.,Limited
>    "^xylon,.*":

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-xt_vendor_=
v2-v2-1-8d4eed65a533@kernel.org?part=3D1
