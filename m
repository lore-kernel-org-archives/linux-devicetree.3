Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CAE40B6F4
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194837; cv=none; b=I9Fh6lTcr0A701g/01VQmSLqLKZu3CLOn1aF7UxRXoWa5ZvSWlZv5VfLM1IHwA4PUU1HumErjccj7qM6Qz++ODhp56wbxMyO9dCUcx8nWZTcdKxh2+D7gLYek467ktuf4LgFbqj49qcDddeFT++4aiQHEk+pgmbnI9mrajcV1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194837; c=relaxed/simple;
	bh=A/nw84XrEB+kt1Pth0sZbFSKvFfvl6moQvIMEZAEAt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JL+9VmAo/icvvG/zhWsB1RcyLXdYZyY3ibDurf6u6dEFP29GRo6i4YcsSVmqqQeDrfTcUVOkpWp51ABbew6mI7Nwdz6X9Rtz4mDX9Uqlh8MDpm1m+uH1bwh22sZsjd3/R/0NoUXHqYEOiu/i/a62mSmdMBdQ2kBWtuhRQnbWifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCrc5A2o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCrc5A2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D921F00A3A;
	Sat,  8 Aug 2026 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194836;
	bh=Ef78N7pzYTIlQBwkquXUwdHccWO6TSVg8et4D39Yi9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCrc5A2oCCk3z9cN/PA/0rxu37MDyvDnG9w0JzODjm6G8qR55GcBpur5nfF2k30jR
	 eb/FheLaTr/TZBcs/UFVyDU3n2rINaFXjus5+c3nDDveLg+rECLPSTcoOtxby9f74m
	 92Y/NF7Y1eISKQ2xhah04lTvGM38cpU7t58uFAdP9Pw/y6ZR5mbukc8QelnejosGnp
	 OyL3BACtG/ewDnw4NFqjFmP9gff6PeNyTqPFPzH46eiHLg+EZ4k4wlezUbnOt6ZPu7
	 FMuBwj5eaQMbhtKrVRJXyic2Lrd65Lfm32PPD7IU39oJHYeQbUV8BlPTl7zk99A4Wy
	 V4oWPPM/txBLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 09/12] net: phylink: add .pcs_link_down PCS
 OP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807131301.192060-10-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:55 +0000
Message-Id: <20260808131355.D7D921F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Lockless traversal of `pl->pcs_list` and unprotected modification =
of `pl->pcs` in `phylink_start()` and `phylink_resume()`.
--

--- Patch [9]: [PATCH net-next v11 09/12] net: phylink: add .pcs_link_down =
PCS OP ---
commit 7a2f38b91902153c2c82a86f0b98d881f66246ff
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add .pcs_link_down PCS OP

This commit adds a .pcs_link_down operation to permit a PCS driver to define
specific actions to tear down the link between the MAC and the PCS. It hooks
into phylink_link_down() to call this new operation when tearing down the l=
ink.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 69d4f6675db0f..2e8d11573e3ad 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1683,6 +1689,9 @@ static void phylink_link_down(struct phylink *pl)
> =20
>  	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
>  				   pl->cur_interface);
> +
> +	phylink_pcs_link_down(pl->pcs);
> +
>  	phylink_info(pl, "Link is Down\n");
>  }

[Severity: High]
Does this sequence permit concurrent list traversal and modification of
pl->pcs_list?

Looking at phylink_start(), it initiates the configuration path without
acquiring pl->state_mutex:

phylink_start()
  phylink_mac_initial_config(pl, true)
    phylink_major_config()
      list_for_each_entry(pcs, &pl->pcs_list, list) {
        ...
      }

Concurrently, pcs_provider_notify() modifies the list under pl->state_mutex
but without rtnl_lock:

pcs_provider_notify()
  mutex_lock(&pl->state_mutex);
  ...
  phylink_add_pcs(pl, pcs);
    list_add_tail(&pcs->list, &pl->pcs_list);

Can this lead to list corruption if a PCS provider probe races with
a network interface startup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D9
