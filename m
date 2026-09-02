Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6A35C1B1
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361481; cv=none; b=CTclyS5SuEa8NyuBTYuF3LjZVyV5O4oeK4s9Ad4ZRZKJUyfTYpFgQ37IKejMkaTheLpRsLxItgTgsf6LlsDyrk7Kbs3d1mGXH5+8X+oCe9Iycz38mXdWzF/YHYUQ1F5cBc7DP4OCKiWq25NvYVad9RUj4E62p0b/CIGFiFUoWwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361481; c=relaxed/simple;
	bh=GMBkObuzXfAHc7IvLNOn6y0gfD1fupFHxPmTioA84CM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pwG6k14O/9RPwl5cDr7T1qsGYDKk8ejU8JeYKHRXTaqEMN/QJzX7Fu8wLZ+bmoFkXsWKGU0ZDi8DMq3t0FRG61tknUpn1WXH59jISctQM185lPhWGoav7fTegh4P12aV9WmXA9EYnigZzn+8vSiD0hKiueK59TxcVR253vf5qjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfZ+3A1k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfZ+3A1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9C91F000E9;
	Wed,  2 Sep 2026 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788361479;
	bh=aa1jx8xU+AUP+tXE7YiXLIev4mWWNND1A1Q+YE2NzJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nfZ+3A1k4VZzmXQM0L+fNni3OPqy1Wk6vjYl1SQktfjBJ1rGXiuyNJn2CcE7+9Xzw
	 PD8TorrciyyaPQ1sXAsoReEza9a9eOkRcn5sue+42fFHkoIZ/VAz3KW80ujT+B53tW
	 NjztufZUvYFpkRpQN5sUy8Dss7izUIv/65mUO/w15dYq5q29OeYOe79bLmIOvkRIGN
	 4NAyhHwpGE6DyhGvw/GKAqodZTeYh4K8qS8YSxPEvHmP5Be6R7CAE2bbcgg/ztXpMI
	 eiXXHeHZ5m4SxXvDMro/fNo7XMT0rfG2ikrL1UP0X/sJN8MhzFhNdZsx6f63zrDOC8
	 peh5MSCvkHq6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 06/10] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260901150111.141037-7-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
 <20260901150111.141037-7-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:04:38 +0000
Message-Id: <20260902150438.6F9C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] State getter `xpcs_get_state_c37_sgmii` mutates hardware state (re=
starting autonegotiation) and applies a hardware-specific workaround univer=
sally to all platforms.
--

commit 71d0b44c6ef52210f70310761abecf6962cd887a
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add ANRESTART support for SGMII link recovery

This commit introduces support for restarting autonegotiation on the Design=
Ware
XPCS IP to handle link recovery on platforms like the RK3568 MAC side SGMII.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 0337e2bcc0125..50b9cdf94fdaa 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
[ ... ]
> @@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpc=
s *xpcs,
>  		return 0;
>  	}
> =20
> -	/* Clear AN complete status or interrupt */
> -	if (state->an_complete)
> +	if (state->an_complete) {
> +		/* Clear AN complete status or interrupt */
>  		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> =20
> +		/* Initiate the next round of AN */
> +		xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +			    BMCR_ANRESTART);
> +	}
> +

[Severity: High]
Does this mutation inside xpcs_get_state_c37_sgmii violate the phylink API
semantics, which typically require state getters to be side-effect free?

Because the phylink_resolve workqueue polls the state periodically when the
link is down, won't this cause the getter to constantly restart the
autonegotiation state machine and generate continuous MDIO traffic?

For instance, when the SGMII PHY drops the copper link, it sends an SGMII
config word with link=3D0. The MAC completes autonegotiation based on this =
word,
meaning state->an_complete is true but state->link is false, which triggers
this exact path.

Additionally, does this apply an RK3568-specific workaround unconditionally=
 to
all Generic DW XPCS controllers? Standard MAC-side SGMII automatically hand=
les
link state updates via the SGMII config word without needing manual AN
restarts. Could this override that conformant behavior on other platforms?

>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901150111.1410=
37-1-coiaprant@gmail.com?part=3D6
