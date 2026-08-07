Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC9837A822
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127857; cv=none; b=YAW64oamjhoRw/V4TS/aJfZ3NRi2D4i91VTvAc3K7ZWFRp2fOxccaaZuMpTA/EQ2ecEUyqwpzHqAfkXhko3FuGyTROPZPIQPqcsWOSnU/t0GxJjc8n87ysvZV2eyngKGHu3EtLJZtotBSfpEFy9aUYx+uSg/VxyqdFSj7aRxRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127857; c=relaxed/simple;
	bh=I7aVny6LONMXD9rz0vLYhTLOZVpRI6HVJeqalXIj9N8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jTGTtZuYR2hdAQaHjGDly74ho3aPC5dTYiZSQ/3qqswlDt7esU0GXV9CRqlhPCuTu/6ulAS1jg17QMVtYqUcMRSnUpKh8Oyv4aQDkjFjV46lOn8Np88GJorIcOQNMpEsv0fuoUXJSW/amThA8kR+BjbEnjAiiwCHZ4zEyFJsH0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlnXJUSv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlnXJUSv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDC01F00A3D;
	Fri,  7 Aug 2026 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786127850;
	bh=wEpLVx9G545MvfYyTMse3uO5fajmPs0fSoUMoqhuTCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dlnXJUSv+g2wg/hOr8KYcqE8cvY4aR0u+lKDzQuNI81a26beLa9j/QNekDU5Q9fw8
	 AMeE8sF6fyvU2ZSOPuwlWULNTobSVPTJ5iLfZ0UhLeRE89iqVDNmfKNDGtdJY5oIC6
	 qdZQAwM5blUB2WqOw3aqUvRJmP8hxoqx0xPok08tQ+wa4PatYvAQhaLTrHmZyFqzVG
	 nqKsOSPZXAHkaMWbiQvhAoXvAmlvRNiMARb8/sLHcbmXiKdcVE7SSsShNX9sYI029u
	 ayy3/zrdMSKsM2GuktJ1OqqY8fC40EgSIUzaCn79d9Fbevfrstv88gjd4pufI3RN+Z
	 aRPZjkBr4ikng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on
 WRT3200ACM/WRT32x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Georgi Valkov" <gvalkov@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807182124.41572-1-gvalkov@gmail.com>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
 <20260807182124.41572-1-gvalkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 18:37:29 +0000
Message-Id: <20260807183730.4FDC01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] A vendor/device-specific workaround property (`marvell,ignore-re=
gulatory-hint`) is incorrectly read from the global root device tree node (=
`of_root`) rather than the device's own OF node. Device Tree must correctly=
 model hardware topology by placing device-specific properties in the node =
representing that physical device. Placing a vendor-specific property in th=
e root node applies it globally to the entire system. If a system contains =
multiple Marvell Wi-Fi adapters (e.g., one built-in and one plugged in via =
USB or PCIe) and only one requires the regulatory hint to be ignored, this =
global flag will incorrectly apply the quirk to all of them. The driver sho=
uld read this property from its own device node (e.g., `adapter->dev->of_no=
de` or `adapter->dt_node`).
--

--- Patch [1]: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on =
WRT3200ACM/WRT32x ---
commit 3a34f3fd7103c1109fdfbb027f11821961b37978
Author: Georgi Valkov <gvalkov@gmail.com>

wifi: mwifiex: ignore ROM regulatory hint on WRT3200ACM/WRT32x

This commit introduces a device-tree flag to allow affected platforms to
ignore incorrect regulatory hints hardcoded in the mwifiex ROM. This enables
userspace to set the correct platform regulatory domain and prevents extreme
restrictions on 5 GHz and DFS channels.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

> diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/ne=
t/wireless/marvell/mwifiex/cfg80211.c
> --- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
> +++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
> @@ -4899,7 +4899,14 @@ int mwifiex_register_cfg80211(struct mwifiex_adapt=
er *adapter)
>  				country_code =3D
>  					mwifiex_11d_code_2_region(
>  						adapter->region_code);
> +
> +				/* Allow platforms to ignore an incorrect
> +				 * regulatory hint from ROM, so userspace
> +				 * can set the correct regulatory domain.
> +				 */
>  				if (country_code &&
> +				    !of_property_read_bool(of_root,
> +							   "marvell,ignore-regulatory-hint") &&

[Severity: Medium]
Is it intentional to read the device-specific property from the global of_r=
oot
node rather than the adapter's own device node (e.g., adapter->dev->of_node
or adapter->dt_node)?

If a system contains multiple Marvell Wi-Fi adapters and only one requires
this workaround, reading from the root node will globally apply the quirk to
all adapters in the system.

Would it be better to adhere to device tree architectural principles by
placing and reading this property in the node representing the specific
physical device?

>  				    regulatory_hint(wiphy, country_code))
>  					mwifiex_dbg(priv->adapter, ERROR,
>  						    "regulatory_hint() failed\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807182124.4157=
2-1-gvalkov@gmail.com?part=3D1
