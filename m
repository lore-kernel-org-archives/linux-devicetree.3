Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996833A6B6C
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652355; cv=none; b=TDVbzWg1EXQcK9F/Qi6Yh638A3giYqIHIAlcBefqdmAp/+tJd+15vHirMl54/3Ne3HzBTGAN6wYDkkGlXXJLXk4VTX7vbKsMM+X365LlxXOuZBVOmnjjAB1r0A1q4OH9Qj6Qlcc7l50fnMiCyiGXDb8ffthDACvHTUuajyVLYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652355; c=relaxed/simple;
	bh=UXZiBLRmmHqLBYPlNiCigu99pKWzJmkFsuG0BB/fd+U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=H5ee2JpxzYuZck4Mt4AYjo5z2OlGEXdHvMJEeQFAXFudslIqMaIqKTmcIuYfTgLn8s0bZhZ48hzY+UvUGjIQT8rENVE64uRQ0eTmwtmMdFaF7UjBbqDHpeXiU5u87Xhc22NtMJ9x3jtuph34B+QoFn0hMkAKnZbXHzMPpKFarMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUHs6PED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUHs6PED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324531F00893;
	Sat, 10 Oct 2026 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791652354;
	bh=h7ecmj00wQ0rYaVxlVBSfyRmSH0iNBnkx9wKteCVvek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kUHs6PEDST5T8yOlP9CEzc+K5O9fvIK4OOkwB1+ms1vYss4I4L7ck3+KV1bv+VNYJ
	 Y7PYSg9+MOHR1L8bBr9zsoD99f4rTV9PRwnqAbCc7Xsie3tTBFZnFUQkXDK6G4sXYq
	 mywX+C2T6LKwtr3RpJSKZWFba0EDVSW4sfAmFZsXT7TCYknE30WtLGNaFbmG6L905a
	 kCpwwcZUmknIdjSnbDYklnN64nWo6yHCpwL84Y3uXKqNk3/eGxeHlTJVYaCOKMlRtQ
	 EZstIfOSA1+4wl0Ohh994FCYGryF7ubjPvGaFbX2hg8hRJ/UjUSBUzlWnV7wjmVPNI
	 +HttsgJszZvTw==
Message-ID: <sashiko-outbox-166772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 08/11] onsemi: s2500: Add driver support for
 S2500 MAC-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-s2500-mac-phy-support-v9-8-dcefe1d0bf0d@onsemi.com>
References: <20261009-s2500-mac-phy-support-v9-0-dcefe1d0bf0d@onsemi.com>
 <20261009-s2500-mac-phy-support-v9-8-dcefe1d0bf0d@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:12:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: ptp: max_adj exceeds 32-bit scaled_ppm limit
- [Low] net: ethtool: duplication of standard rx_dropped stat
--

commit 00c8e30757f8b1220a6ef1275c224d8bbca5148c
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

    onsemi: s2500: Add driver support for S2500 MAC-PHY
   =20
    Support for onsemi's S2500, 802.3 cg compliant Ethernet transceiver with
    integrated MAC-PHY.

diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/ne=
t/ethernet/onsemi/s2500/s2500_ethtool.c
--- /dev/null
+++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
[ ... ]
> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] =3D {
> +	"rx_mismatch_drops",
> +};
> +
> +static const u8 s2500_mac_stat_map[S2500_NUM_MAC_STATS] =3D {
> +	S2500_MSTRXDROPPED_IDX,
> +};

[Severity: Low]
Does this regression duplicate a standard uAPI statistic? The network core
guidelines indicate that counters with standard representations must not be
exposed as private ethtool -S strings. Since there is a standard representa=
tion
for dropped frames, could this private string be removed to avoid duplicati=
on?

[ ... ]
diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_hw_def.h b/drivers/net=
/ethernet/onsemi/s2500/s2500_hw_def.h
--- /dev/null
+++ b/drivers/net/ethernet/onsemi/s2500/s2500_hw_def.h
[ ... ]
> +/* Frequency adjust magnitude, 1 LSB =3D 0.000125 ppm =3D 1/8 ppb */
> +#define S2500_PTP_ADJ_MAX		GENMASK(27, 0)
> +#define S2500_PTP_MAX_ADJ_PPB		(S2500_PTP_ADJ_MAX / 8)
[ ... ]
diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c b/drivers/net/et=
hernet/onsemi/s2500/s2500_ptp.c
--- /dev/null
+++ b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c
[ ... ]
> +int s2500_ptp_register(struct s2500_info *priv)
> +{
> +	struct ptp_clock_info *info =3D &priv->ptp_clock_info;
> +	int ret;
> +
> +	info->max_adj =3D S2500_PTP_MAX_ADJ_PPB;

[Severity: Medium]
Will this regression cause the max_adj value to overflow on 32-bit
architectures? The driver advertises a max_adj of 268435455 / 8 =3D 33,554,=
431
PPB. The PTP subsystem converts PPB to scaled_ppm by multiplying by 65.536 =
and
passes the result as a signed long to the driver's adjfine callback.

On 32-bit architectures, 33554431 * 65.536 =3D 2199023243, which exceeds the
32-bit signed long maximum of 2147483647.

Could this mathematical wrap-around directly cause large positive frequency
adjustments to be passed as negative values into s2500_ptp_adjfine(), drivi=
ng
severe clock drift in the opposite direction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-s2500-mac-=
phy-support-v9-0-dcefe1d0bf0d@onsemi.com?part=3D8
