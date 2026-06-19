Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82357380FD7
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878275; cv=none; b=j9un8kJyKZ6A2VnQ9aRU6jwONb6JpXW6GXoMGyirpI5Yoa6BDT5juCLjt+7U3MN8NS+MJCbqF8qTtHMWOntRMER60zjE1vpg6ZwdFgv8EQ/rNaxXrNqMb/dhDy6ADD5wI50iu3NiIh0oWghPOZX9BjikIFhwX/pOibHmICntfC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878275; c=relaxed/simple;
	bh=X08CaAplzEZRGe1Vw3VZQNKuJJUmXo5y1DfXmGZzuns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NvQHHO0jbaHEjIduE+JD0AX/JSm8utQYmCPn8k4zalsNXJGpcHC0ACSvd5/uJTwgpkjz+Ry2sCN/IbzHVXH48LodHuytYddlsD4aGEFjrAuXNrpzMSR6hcjJ4kBe/NfrXLiNKtymMM+ifz1lRMuXQtw43qlItKOpIxxPQH6GesI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBkIegam; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBkIegam"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9271B1F00A3E;
	Fri, 19 Jun 2026 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781878272;
	bh=rL4Hc3MJX8g7OP3j7hG/zb74sjCMRYqEaVj4wHgK/+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eBkIegamOQmC8z0F/TgaGJupfLw+w9lKho9ruXl8fgKNd4jBBQaM4gzWvKlfap1pU
	 yXxzupN/kPFqv0at1+3SVcms6KRZ6vQv8s9E30+r+UiBbFWmo7pe+JTfvZ349kcl5Z
	 ZHcr9FRZ+4MwGMlCnV+V5ch8N3Q5Suv4JX9WwHIKH9ycis6vCqcDQ3pBEO3H9yl5J+
	 1HrPxN2VW3Pddus01VgLw/STMEQg5vkKUnbwUw86NMCI4ki8ZMcvU5r4L+Hg+VIIHY
	 rq+tVmWUh/Y2ovKce8FaDLEZv9WN6LGZyB6Z8W3Jq1kvNQVvsRPS4/yBgGD4iIDnuG
	 N3e6FX62wswbw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618125752.1223-4-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 14:11:12 +0000
Message-Id: <20260619141112.9271B1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional and unbalanced `phylink_link_down()` in `phylink_rel=
ease_pcs()` causes duplicate `mac_link_down()` callbacks and corrupts the i=
nternal phylink state machine.
--

commit 2b29c68aa2ea3d8d4cc5979668a733bbdab7236c
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add phylink_release_pcs() to externally release a PCS

This commit introduces phylink_release_pcs() to allow removing a PCS from a
phylink instance. When the released PCS is the active one, the link is
brought down and a major config is forced to trigger a reconfiguration.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index c38bcd43b8c8b..064d6f5a06da4 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_=
link_state *state)

[ ... ]

> +	/*
> +	 * Check if we are removing the PCS currently
> +	 * in use by phylink. If this is the case, tear down
> +	 * the link, force phylink resolve to reconfigure the
> +	 * interface mode, disable the current PCS and set the
> +	 * phylink PCS to NULL.
> +	 */
> +	if (pl->pcs =3D=3D pcs) {
> +		phylink_link_down(pl);
> +		phylink_pcs_disable(pl->pcs);
> +
> +		pl->force_major_config =3D true;

[Severity: High]
Does this unconditional call to phylink_link_down() cause unbalanced
mac_link_down() callbacks if the link is already down?

Also, if the link was up, does pl->old_link_state need to be cleared here?

For PHYLINK_DEV instances that lack a netdev, phylink_link_is_up(pl) relies
entirely on pl->old_link_state. Because pl->old_link_state remains true, the
scheduled phylink_resolve() evaluates cur_link_state as true.

Inside phylink_resolve():

1. The force_major_config block sees cur_link_state =3D=3D true and calls
phylink_link_down() a second time, then sets cur_link_state =3D false.

2. Later, the state update block compares link_state.link !=3D cur_link_sta=
te
(false !=3D false), evaluating to false. As a result, pl->old_link_state is
NOT updated and remains true permanently.

3. On the next phylink_resolve() run, cur_link_state again evaluates to
true. The state update block compares link_state.link !=3D cur_link_state
(false !=3D true), evaluating to true, and calls phylink_link_down(pl) a th=
ird
time.

Can this state machine corruption result in multiple unbalanced
mac_link_down() calls and cause clock underflows, regulator warnings, or
hardware lockups in MAC drivers?

> +		pl->pcs =3D NULL;
> +	}
> +
> +	mutex_unlock(&pl->state_mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618125752.1223=
-1-ansuelsmth@gmail.com?part=3D3
