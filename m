Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1103A335064
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692327; cv=none; b=ChWzuMvErDZ1gzN6rZ746yVAeqrVL83yXG3ZPtDkuyBCHfZaffQQYiTU4zlDzp6nmYrrpDuH3iVZuaNfnYVH6hfjKLCZDvQQmpYitR1TUw7nbKBey+wzquJW9LQuuzSR2V3v0ebfFBWupWgm0xzLZw0msSWKX54aSHeSUEPKqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692327; c=relaxed/simple;
	bh=JtQFAotAUz0/Imelt6e5xnTHMRCZ/1Ah4vNxHJyPniI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdrAISLw1pLjFR8+ZoeTt4m2N9q10vL+CyR8OAYPyrlpfQMobFVtq3pmjRBtM12OHXpHk6blGhWJPFn/prpGbu7IjWDPXL3VuJZnjQoZdlDCLcMMvfUn55oLZt+4iSYbeqS3UXZ8KKq/xVMY1XcgdDsRYVsR2TzFp3JwQxrZ1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVA4L9sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVA4L9sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8421F00893;
	Fri, 18 Sep 2026 00:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789692324;
	bh=ARPe08Kb8BHLS55ci/e/FyM2GJxYSrWIHn9nlSFxVxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CVA4L9sajJQZmOrsswYsQeuxll80AXwHyQY5tnQBCDHT6wbOUqlMuPcUCPDkln99P
	 8YumdzATruSSGNsuEFZHyoFDW4VGxG3Fls8NoV9gdufT6tAvmiE7c3/XIP62SUz15R
	 eu4O7NIqiNOWRmhe9Kc5CVAp60xX9tPdoArQTd1l6mVmFKrbbxVGZOpiWXGfD6N9aF
	 GP5eFFBF0mgVnYpUK169Kohw8rFETRhkAzOLmILd78OiuRWJ1xw/ZyPY/UaiamWMZh
	 PJkN81jD6k+rTdOT48FOja8KTaO5MWnlQkIUEdkHmNpOsWNnTt6I6qxdrto954bSh+
	 KD3pxMfPA6oCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 07/12] net: Document PCS subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916235200.20712-8-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260916235200.20712-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:45:24 +0000
Message-Id: <20260918004524.7D8421F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phylink: validate_mac_and_pcs incorrectly validates missing requ=
ired PCS
--

commit cc21dbb17c411b60be48a08479995c35804697fd
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: Document PCS subsystem
   =20
    This commit adds extensive documentation of the new PCS subsystem and t=
he
    fwnode implementation with producer/consumer API. It also updates the
    sfp-phylink migration guide.

> diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/=
pcs.rst
> new file mode 100644
> index 0000000000000..2cae702319484
> --- /dev/null
> +++ b/Documentation/networking/pcs.rst
> @@ -0,0 +1,234 @@
[ ... ]
> +Late PCS registration handling
> +------------------------------
> +
> +It's possible that a PCS becomes available after the MAC finished probin=
g.
> +Contrary to the usual producer/consumer implementation, when a PCS is not
> +registered and can't be found, the fwnode parser helper returns ``-ENODE=
V``
> +instead of ``-EPROBE_DEFER``.
> +
> +This is to prevent race condition with particular devices that register
> +MAC and PCS with USB or PCIe and require the MAC to be registered before
> +the PCS.
> +
> +The phylink logic correctly handle this special case and keep the phylink
> +instance in a fail condition.

[Severity: Medium]
Does the phylink logic actually handle this correctly and keep the instance
in a fail condition?

Looking at phylink_validate_mac_and_pcs() in drivers/net/phy/phylink.c, if a
PCS is missing during phylink_create() due to late attach, it appears to
bypass the pcs_validate restrictions:

	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
		struct phylink_pcs *tmp;

		list_for_each_entry(tmp, &pl->pcs_list, list) {
			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
				pcs =3D tmp;
				break;
			}
		}
	}

	if (pcs) {
		...

If it falls through without returning -EINVAL, pl->supported receives the f=
ull
MAC capabilities.

Because pl->supported is never recalculated when the PCS attaches later, the
advertised link modes remain too broad.

This could lead to incorrect auto-negotiation masks and potential link
configuration failures observable via ethtool.

Should this function return -EINVAL if pcs is NULL but the interface requir=
es
a PCS, rather than silently falling through to MAC validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916235200.2071=
2-1-ansuelsmth@gmail.com?part=3D7
