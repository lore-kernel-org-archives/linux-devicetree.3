Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717137204E
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878276; cv=none; b=nkx9e7rloX0jAVBV/P6T/AIWIalouOXWwADdBZIK9lB/OrfBEegOFLIST1VhNuPF2x22axGsY4DVtVnYcMVSm9+ZUKOjF5kFSsdMa7YtDSzY0QDMbGGnhYc45WVo/nrN8tt3SMXzqJUhYFV560iZ+pIhaV7UCoerYSc3/conw/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878276; c=relaxed/simple;
	bh=rpMvLZfNYZNzzIOLzq0Mn+T9aAXFgQ9c3MLSwRhzJ5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SC3ciIe/OCXiVlHUopR19HBQ7giEoZftc1/x+8JD9cPWOPeUbX1J4b1mpb4hxjegR5uFve2vHfnxNBFvYfWJvfoFgzVVQ4TuWwOjkojdQI2G/s3JOOq5tLAGgP0muQQW7bVL/F7Idp86Gd2uHSmuA5rjHcjYYZGD8CWzuU6DiUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxpkGwHl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxpkGwHl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D4D1F00A3A;
	Fri, 19 Jun 2026 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781878273;
	bh=rHRJYCPKdpYWxLi4IVj7FpF6eZid7cHAsppzfxSTi8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AxpkGwHl4O+4qqUCQS5I6DnLZgYlsPbZhHDHvsgcSRMu06q/EnD1Xzwy/9+DWi82M
	 zEPmKeujjerEBwMjbgFCV5KXhtW8CC1uvjhs6Y4yOeR5wgh+1AGLZ9It8YXvsSGU8H
	 QjnmqOnkybWafwyUgiIKYl6dbsK7Hd3WoQASUKHcvC8cIMqBkNScclyryovs7wGSNf
	 oQNb1O33ozVyhVmJShS9IjsQ0yrDc9G6viu8ddpI6OLiWxwH2k99AdVYHZU+fLlMJg
	 /CtPW7hMsht79anFU6+FMFlxXBfE8ntssPgrT17xNBoHsSdVeUcBc13o6sfv8xfjlF
	 JmXFx3nAsE2sg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v8 09/12] net: phylink: add .pcs_link_down
 PCS OP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618125752.1223-10-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 14:11:12 +0000
Message-Id: <20260619141113.54D4D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Copy-paste error in the kernel-doc comment for the newly added `pcs=
_link_down` function incorrectly names it `pcs_link_up`.
--

commit 2d1df5800af742cd81f1378ff1f3f3bc3801c928
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add .pcs_link_down PCS OP

Permits a PCS driver to define a specific operation to tear down the link
between the MAC and the PCS. Adds a new .pcs_link_down callback which is
called after .mac_link_down during phylink_link_down().

> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 15e6b1a39dfe2..ecf4c384fd31c 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h

[ ... ]

> @@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
>  void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
>  		 phy_interface_t interface, int speed, int duplex);
> =20
> +/**
> + * pcs_link_up() - tear down link between MAC and PCS

[Severity: Low]
This isn't a bug, but should this kernel-doc block name the function
pcs_link_down() instead of pcs_link_up()? It appears the function name was
carried over from above, which might trigger kernel-doc warnings during
documentation builds.

> + * @pcs: a pointer to a &struct phylink_pcs.
> + *
> + * This call will be made just after mac_link_down() to inform the PCS t=
he
> + * link has gone down. PCS should be configured to stop processing packe=
ts
> + * for transmission and reception.
> + */
> +void pcs_link_down(struct phylink_pcs *pcs);
> +
>  /**
>   * pcs_disable_eee() - Disable EEE at the PCS
>   * @pcs: a pointer to a &struct phylink_pcs

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618125752.1223=
-1-ansuelsmth@gmail.com?part=3D9
