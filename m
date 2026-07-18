Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC93368B5
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365281; cv=none; b=KIIs+nlbHS0HquWxthNqqX+WqveJ4qTZPMbBynAuAtD8qjt6EDSQmOXpK3MiQEzmnhMIYmpmoHAPCEcZ0IJ0tN3bTCCpoOU+6R6pL7b6FuhXAE8k+t+LdSYWGeJQm/VxXi2f4mCrFtFaVade3dQczo5FYmMvHJQNDWhG2CDJ2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365281; c=relaxed/simple;
	bh=MZOfKD2XGT/VT+ImPNgLmhXH8w+3qL99XgrXqq28zzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EviVjx0fIyX5jXlW+qKEfEASKPLKl2ZK+zzMWgEo4+0yYxBDCc0C3/LADE1DAtCtBlMRIysgT7QHLQMlMWF5VwbdTG3xFDC4TU7kNejPfot0pXRK7BjJ0OY52haBK1MaNYecEwGDBDiPOiBBMhi3Q70T7eoq+BMjFcUl4LL61R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1S5C+j/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1S5C+j/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43D01F00A3A;
	Sat, 18 Jul 2026 09:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365280;
	bh=RCSzL2+2JLFXycw1VAgABWey465RTihoLGZmIRQ81OU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R1S5C+j/1uztx7j/KvzjzmssOrGkLOOify+vU2//IgyhmfpTESnpiJ7YSyU+fbMfz
	 pPduzk4eof51cPdazFRcGuoQjUerch/lQdRwOcQ7Z7mQT7yWtUHRnfC0LFA5NMuZgd
	 F5IOVZv2gQMW5eVaKHRR9dPOwIK7j6Xm5vegfxaegzpPpp1tGssCf4N2kRoSUa9vNa
	 ABXhOTM0GZtmdtbUcbNwAxbVZUfHYiJp17lwDIZkNPRbOynHhyzijRb6jnDQf4xDR0
	 fzInvHPdJjur1Eeum81tDbrSJd530P0MHTJh/EMIy0IwKIFxGHnqlujAWIYnRVaHZR
	 738+hqu2uppdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 09/12] net: phylink: add .pcs_link_down PCS
 OP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717065448.1498335-10-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:19 +0000
Message-Id: <20260718090119.E43D01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The kernel-doc comment for `pcs_link_down()` incorrectly names the =
function as `pcs_link_up()`, due to a copy-paste error.
--

--- Patch [9]: [PATCH net-next v9 09/12] net: phylink: add .pcs_link_down P=
CS OP ---
commit 44243b57b5aa440d9df2c5da5110db53f51717a0
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add .pcs_link_down PCS OP

This commit adds a .pcs_link_down operation to the phylink_pcs_ops
structure, allowing PCS drivers to define specific link teardown behavior.
The new callback is invoked during phylink_link_down() immediately after
the MAC link is brought down.

[ ... ]

> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 15e6b1a39dfe2..ecf4c384fd31c 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
>  void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
>  		 phy_interface_t interface, int speed, int duplex);
> =20
> +/**
> + * pcs_link_up() - tear down link between MAC and PCS

[Severity: Low]
This isn't a bug, but should this kernel-doc name be pcs_link_down() to mat=
ch
the function prototype below it? This copy-paste typo will likely cause a
kernel-doc documentation build warning.

> + * @pcs: a pointer to a &struct phylink_pcs.
> + *
> + * This call will be made just after mac_link_down() to inform the PCS t=
he
> + * link has gone down. PCS should be configured to stop processing packe=
ts
> + * for transmission and reception.
> + */
> +void pcs_link_down(struct phylink_pcs *pcs);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D9
