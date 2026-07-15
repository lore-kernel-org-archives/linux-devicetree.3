Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A93EAC74
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106199; cv=none; b=nUpu3ECbwRaDYIoS2oeTAf1gWMu95F5u7mbU57/npgNh5k84vJv+48eEDV/BUg/mcaVElQoyD7RGSoIznsBhJCHK+ersAYI3uv8c/rBpqN8Cc9FKC2hPq+oITsZoe6dMcaEojxHA9AoLHSXzbk5C971p3kTEJuSUTwWJe3qng1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106199; c=relaxed/simple;
	bh=X1XMTWVg3Zzw6NpTKuODTCrxrZ/CnigkcsSR1p77t3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P6YpoGsEb1NUBuPZfAFM5pfN7s54dtRcuhcG5e66Be6NewMagXMzAaBRotwZkHLue62wBmKSkycVb8ZBQeZ0C/crclwnRDOfAiU2sPBGtco5IUoBd1J0HCXhDGi3cTiHgBPmkzYw2hoxoASi9QoEiENEHphszHevStgbWJK6a7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dne2sUAd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dne2sUAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F5F1F000E9;
	Wed, 15 Jul 2026 09:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106190;
	bh=JWBQi35epvN8taOvpcmt7da362kMbsa+hjOixhsDKNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dne2sUAdjIJr0EG/hufEaRbC3SIA7vzy3j36QthznSg17ed+9Be8ZY2AcvuGFMuGq
	 FYxTwshvYPPMaDaAVJYmrPCnVd/bjMBCkS3g2G2FSsjnLFrlmE3VTXFtFI3TKGMtSs
	 wRoWw4ppNYihNGMPckvSkkVz6LzMXrh2o7e3/1SuSzBn0A4UW02pwXNqQ02qyNcvNb
	 juK+OyOs0WQ+XQLdkwc2IUnfrlXvGbN6Mz+jdtuu7sIuCML1f99yDp8X+v6Dcjwn8x
	 2mj1Z7sB2zFAPzb/JXjHt7BDbITnqdWC0hjjaAu3cjZ9Ne49MHPkzi3H82alqlnQuO
	 7SRhrBsfpgeTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/16] device property: Add
 fwnode_graph_get_port_by_id()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715085348.3457359-2-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:03:09 +0000
Message-Id: <20260715090310.26F5F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds two conflicting declarations for `fwnode_graph_get_p=
ort_by_id` in `include/linux/property.h`, which will break the build.
--

--- Patch [1]: [PATCH v5 01/16] device property: Add fwnode_graph_get_port_=
by_id() ---
commit 88979df4c2fc6de15d7726e00adc783bff896bbd
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_port_by_id()

This commit introduces a helper function to retrieve a reference to a port=
=20
firmware node by its ID. It includes a flags parameter to allow callers to=
=20
specify whether incomplete ports should be returned.

[ ... ]
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 14c304db46648..480ba8646bcc8 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -505,6 +505,9 @@ int fwnode_get_phy_mode(const struct fwnode_handle *f=
wnode);
> =20
>  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
> =20
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode, u32 id);
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode, u32 id,
> +						  unsigned long flags);

[Severity: Low]
Does this cause a build failure? It looks like there are two conflicting=20
declarations for fwnode_graph_get_port_by_id() with different signatures.=20
Since C doesn't support function overloading, will this result in a=20
'conflicting types' compilation error when the header is included?

>  struct fwnode_handle *fwnode_graph_get_next_endpoint(
>  	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
>  struct fwnode_handle *

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D1
