Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F331146D5A
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 00:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786841324; cv=none; b=Dj/ketTrDlKbRDd65fxp+O0ZHxHmKSkwtRXrS9ymapfzZuMRpMh6DKP0aNvcyVekJ9f7mOGJSGsP7cFzAjBe2OX4aqMoR89vDwXoorKTA1PVRxatLGoNmc3+U8HBZjum7VhfFgC2vCk6mZ/3Z3daXQvklIizz09ZFQoKlRBDBog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786841324; c=relaxed/simple;
	bh=XgY6LXjAqwzIh/Ck3QAlz2QHhQzKMfyKPtgyVitpdeg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FIyXGy3lWD+6v0q2YH6QtwItnIc3Csd4jQugpoo0cvjBHvVh9Ht8DfdRPq6y9flBASXlL8FsenLrjSz5oNuWcu/iam2V5gupe+/RcDt0pPCdoGgULnFCEyKr6PhOjI3HLtWJPwVVJUyfldHgMscSq6S4Ha74ZNyosgswpLW8qhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFsHySfM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFsHySfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44F01F000E9;
	Sun, 16 Aug 2026 00:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786841323;
	bh=17BZoAw9/Wn+XdMbG0jMpyJC9+S6S1oSF/Z/mkHYv7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hFsHySfMQs7Ik3Rs5opTarjt4x91xK1D6n/E66H7uf9LSM1zAnPpoThv9pWN9eTGW
	 ViyITYmM5EU71dSnJj5lIDWF1g+Io8tWNhBkvms+CiWeZU1xWYEBO/lbZ7DeRM7Qxx
	 HpI3iMFFSmR2LLC33h0sAg6TB0oRybrKk1bCq7fo4gqOVmR12r46zTXT7EcC76Vq5e
	 crTdk3xA44CiYMCiccq8k9ic3rwBVOa2tlg0sMFewUytCFvwrLZlkhTtfke0L+Lris
	 I+iS2wZ8s/LfD9wbY87Z0d2x4gi/sRUWrw/EO0VIw6TKW+LfR/uAAtBUYyfYOA9iX4
	 3kPYsvIXD1cZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] of: property: link PHY package suppliers
 to member PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814-submit-phy-package-fwdevlink-v1-v1-2-2319844f057a@gmail.com>
References: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
 <20260814-submit-phy-package-fwdevlink-v1-v1-2-2319844f057a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 00:48:42 +0000
Message-Id: <20260816004842.C44F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A malformed devicetree (e.g., placing a `remote-endpoint` property=
 on a node without parents) causes `of_graph_get_port_parent()` to return N=
ULL. This NULL pointer is passed as `con_np` to `of_link_to_phandle()`, whi=
ch forwards it unmodified to `fwnode_link_add()` and eventually `__fwnode_l=
ink_add()`, leading to a kernel panic when dereferenced.
--

--- Patch [2]: [PATCH net-next 2/3] of: property: link PHY package supplier=
s to member PHYs ---
commit 4b95d666e97ce94700e97701480015a01fd0a0f5
Author: James Hilliard <james.hilliard1@gmail.com>

of: property: link PHY package suppliers to member PHYs

This commit links Ethernet PHY package suppliers directly to their
member PHYs. This prevents proxy links on the MDIO bus from persisting
indefinitely and blocking suppliers from receiving sync_state callbacks.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 72cf12907de03..f29ba818ecbc1 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
[ ... ]
> @@ -1272,6 +1272,20 @@ static void of_link_to_phandle(struct device_node =
*con_np,
>  		tmp_np =3D of_get_next_parent(tmp_np);
>  	}
> =20
> +	/*
> +	 * An Ethernet PHY package node describes resources shared by its member
> +	 * PHYs, but is not populated as a struct device. Link every enabled
> +	 * member PHY to those suppliers so fw_devlink can use the real consumer
> +	 * devices instead of leaving a proxy link on the MDIO bus indefinitely.
> +	 */
> +	if (of_node_name_eq(con_np, "ethernet-phy-package")) {
> +		for_each_available_child_of_node_scoped(con_np, child)
> +			fwnode_link_add(of_fwnode_handle(child),
> +					of_fwnode_handle(sup_np), flags);
> +
> +		return;
> +	}
> +
>  	fwnode_link_add(of_fwnode_handle(con_np), of_fwnode_handle(sup_np), fla=
gs);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for con_np to
be NULL here?

If a malformed devicetree contains a remote-endpoint property on a node
without parents, of_graph_get_port_parent() can return NULL. When fw_devlink
parses this via of_link_property(), it passes this NULL pointer as con_np to
of_link_to_phandle().

The NULL con_np is then forwarded unmodified to fwnode_link_add(), which
eventually reaches __fwnode_link_add() and dereferences the NULL consumer
pointer without validation:

drivers/base/core.c:__fwnode_link_add() {
    ...
    list_add(&link->c_hook, &con->suppliers);
    ...
}

Should there be a check to ensure con_np is valid before attempting to
create the link?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-submit-phy=
-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com?part=3D2
