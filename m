Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05433859FD
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225219; cv=none; b=tJqC8vqrJq0WZSriRIyqdrZW+qR2kav4rzf+8DUl8mHeHLy6Qy3aeTaXn2uP20p3Ln8QOixH4pvFUEuauL1h/JwVQUaYwd2hzVga0ZmUmc2I6U2CRTJN2Sg3b6aXU2tdd40ha5/3Utd4zGoFkxUihTT90vuJhuuKC9hyMGOMGvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225219; c=relaxed/simple;
	bh=2Rq+QFwaFitKlYZYuDIDOkTg/23qsNYbCYbXDXNnmGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tZWQPRIvZu4TsTpn1lX50GigGV2NOyvtCs/+KxATG3fIqUhHYNsnQqZjpg/oti1rPmAqiENIEaKzzvwrE772Io4phslrCmP+TbH7WQfIVfNDyHZ32FG4MWU5Q6V+nNjnisrAH2BDVDYFiv5sMgRMrrPrXSbrVDboHGgEEBu6j68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDTV6pg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDTV6pg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1402A1F000E9;
	Tue, 28 Jul 2026 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785225218;
	bh=2Rq+QFwaFitKlYZYuDIDOkTg/23qsNYbCYbXDXNnmGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDTV6pg7Ysa4cVPVqYkbc5IqDbUGJPC00nCfRUBR0F+64pMmI3lKc0DRtq9bAdHN3
	 gi1QAvn5VC7SmQh7G0JnYtbpNjM0u86nbuQREr1SK+95MtBKkW1lQgRX6A65Xsyh9+
	 gsBEZKVJQ9H/GApcBKF36iklkEPkKdgheVp8QQWrndF2dpEBUNMxuI8D54yTNmho7g
	 pZZyNprUX6eL7qYmcD5fTPMpwm6MYExNcgpDi/+V8nkfDlHjjmGazOIVpe6Kq2JqsM
	 tPlVYR5XjCn3BGpH7jlorryG7aRsS3iGRfwPopcStEGjO54/kHMmjNkIZg6MuEi33I
	 cRn3UzHYxURkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727075324.3555446-2-a.shimko.dev@gmail.com>
References: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
 <20260727075324.3555446-2-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:53:37 +0000
Message-Id: <20260728075338.1402A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The vendor prefix 'dapu' used in the binding filename is missing fr=
om the global vendor-prefixes.yaml file.
--

--- Patch [1]: [PATCH net-next v4 1/2] dt-bindings: net: add DAPU Telecom D=
AP8211R(I) PHY binding ---
commit 6db277d294bbbe2617770040fd7c694fff198374
Author: Artem Shimko <a.shimko.dev@gmail.com>

dt-bindings: net: add DAPU Telecom DAP8211R(I) PHY binding

This commit adds device tree binding documentation for the DAPU Telecom
DAP8211R(I) Gigabit Ethernet PHY. It specifies support for configuring TX
and RX clock delays.

> diff --git a/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml b/D=
ocumentation/devicetree/bindings/net/dapu,dap8211r.yaml
> new file mode 100644
> index 0000000000000..ba9b301ea1f51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dapu,dap8211r.yaml#

[Severity: Low]
Does this patch series also need to add the 'dapu' vendor prefix to
Documentation/devicetree/bindings/vendor-prefixes.yaml?=20

It appears 'dapu' is used in the filename and compatible string, which will
cause make dt_binding_check to emit warnings if the prefix is missing from
the global registry.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727075324.3555=
446-1-a.shimko.dev@gmail.com?part=3D1
