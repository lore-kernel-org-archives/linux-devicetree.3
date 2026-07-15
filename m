Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75979320CCC
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143014; cv=pass; b=amlKiug1DfgnofLLk+GwkqVq6SUx1JCzPDNAe7DQWau2XuJTKhIyOSeLEIU4g1SAuhELRiiumS0hD6oFSu41u5UVuVcagUOk2ELS+dm4nFXk+KEOjl4EOmjnguvugYXbOkWVomltSyfPtrYZwwiWggNffxjIv8tRsiHnpcc1YrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143014; c=relaxed/simple;
	bh=aIrgBTDaGKbHi60MuWiqEbjkCwmSMECQr/l0VD3Vtyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2JjqVcsWKphOIG2X2c+9Bc9lrO3NOGLb1jWy5uifyP4VECPVpDsIX7jND+TS6P2Jsc3jwjI7CvgMHcFDivjAMVYo1CqgoTsxsf+pavlno9R4gLT3dyqzxna+u2i7Wbh+XXArW+aRj/olSg8SJ5QcQKNgJS2h2HZgaGCqYwKpeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=kYjS8uHy; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="kYjS8uHy"
ARC-Seal: i=1; a=rsa-sha256; t=1784142993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LYcr0N8qbpdREd0byDKZ3MBm+lLW9I0Y9sk4UJyNU6hrgKqxD6dc96GZBh/zmhyMrhLhYs0lds4fo/RVR4DESodjeia2fOivhsi74WoKjl25INVLtk7Jcc915N9b+rDLG1T9pZJQJjInr5Zk0juvIDn/ZUcVpW1Tf1JdDfa86yE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784142993; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=09JIm2bYrw4hSvnoipMr6olQgKBUeyKwwBq6wlZYhsg=; 
	b=LCy4+XqYQbv511aYJOdVy6qU9FEkHnpwBJD60ExMUy94CrLPTW7jQdtGVhFwHnPEURtXajTxVpQGEBlLhY4zU0nzbB9JZggwhfCgsVsfsNM4KnLUDiCxIbIfx8AHAtGbUMi4gSU8obDlfHXLHRmAL69XjtWJuoDHQEcSXJGUZBU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784142993;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=09JIm2bYrw4hSvnoipMr6olQgKBUeyKwwBq6wlZYhsg=;
	b=kYjS8uHyB9w2WWbGcHw0EBAtbE+h+cUbFLCS9pyg/ddfz987xPANA7b2J2EGXeMG
	XMi4oAKUWHtyoRXNW0h8ckyHkaw+al4s0TcarRkjfeIieHp+dbqeKwTKx5/HMmhW4Ld
	l9DazjDh3mOWR8GbYA72dB9jbV1STjTOiO7drwKM=
Received: by mx.zohomail.com with SMTPS id 1784142990210370.495977626671;
	Wed, 15 Jul 2026 12:16:30 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 0C8A6180820; Wed, 15 Jul 2026 21:16:27 +0200 (CEST)
Date: Wed, 15 Jul 2026 21:16:27 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH RFC v3 09/10] dt-bindings: display: rockchip: dw-dp: fix
 sound DAI cells
Message-ID: <alfYxIkbJMA36qdt@venus>
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
 <20260612-synopsys-dw-dp-improvements-v3-9-dc61e6352508@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmlwreimakep7qlw"
Content-Disposition: inline
In-Reply-To: <20260612-synopsys-dw-dp-improvements-v3-9-dc61e6352508@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.121.97
X-ZohoMailClient: External


--wmlwreimakep7qlw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v3 09/10] dt-bindings: display: rockchip: dw-dp: fix
 sound DAI cells
MIME-Version: 1.0

Hi DT binding maintainers (& Dmitry for his DP background),

Can you have a look at this please? It has been a month, since I
send this and multiple months since I send RFCv1. Would be good
to have your preference here, so that I can implement it accordingly
in the next version.

On Fri, Jun 12, 2026 at 08:00:55PM +0200, Sebastian Reichel wrote:
> The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
> possible DAI interfaces: I2S and S/PDIF. Thus it is needed to have an
> argument to select the right interface.
>=20
> In case of RK3576 this is not enough though. The RK3576 has the same IP
> as RK3588, but configured with Multi Stream Transport (MST) enabled for
> up to 3 displays and thus has a total of 6 DAI interfaces (I2S and
> S/PDIF for each possible stream. Meanwhile the RK3588 does not support
> MST and thus has only 2 DAI interfaces.
>=20
> The binding update right now only supports the simple single stream
> transport (SST) setup. To avoid further DT ABI breakage (or complicated
> bindings supporting different number of arguments), it's probably a good
> idea to take MST into account now even though the upstream Linux driver
> does not yet support it.
>=20
> I see two options:
>=20
> 1. Adding yet another cell, so that we have the following:
>    <&dp_ctrl [display_stream] [i2s_or_spdif]>; potentially append
>    extra input ports for MST video data to existing ports node
>    (e.g. port@2). I would only handle the sound DAI part in my
>    patch and basically use '0' for the display stream and just
>    leave the option of using '1' or '2' once MST support is added.

My guess is, that this is preferred.

> 2. The vendor kernel creates a sub-node for each supported display
>    stream and puts the ports mapping as well as the DAI reference
>    into that. This bundles all information for one display stream
>    together, which creates a clean look but the subnode does not
>    really describe any real thing in the hardware.

FWIW that looks like this:

dp@<address> {
    props-from-this-binding;

    /* SST or MST stream 0 */
    dp0 {
        #sound-dai-cells =3D <1>;
        ports { ... };
    };

    /* MST stream 1 */
    dp1 {
        #sound-dai-cells =3D <1>;
        ports { ... };
    };

    /* MST stream 2 */
    dp2 {
        #sound-dai-cells =3D <1>;
        ports { ... };
    };
};

While the grouping looks nice to me from the audio/video controller
to DP controller point of view, it's less sensible for the
connection from the DP controller to the DP/USB-C connector as all
streams are bundled at that point.

Thanks and greetings,

-- Sebastian

> As upstream MST support seems to be quite limited, I wish for some
> feedback about the preferred way to handle this.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml         | 5=
 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw=
-dp.yaml
> index 2b0d9e23e943..1303d0e2145a 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> @@ -83,7 +83,8 @@ properties:
>      maxItems: 1
> =20
>    "#sound-dai-cells":
> -    const: 0
> +    const: 1
> +    description: 0 for I2S, 1 for SPDIF
> =20
>  required:
>    - compatible
> @@ -144,7 +145,7 @@ examples:
>          resets =3D <&cru SRST_DP0>;
>          phys =3D <&usbdp_phy0 PHY_TYPE_DP>;
>          power-domains =3D <&power RK3588_PD_VO0>;
> -        #sound-dai-cells =3D <0>;
> +        #sound-dai-cells =3D <1>;
> =20
>          ports {
>            #address-cells =3D <1>;
>=20
> --=20
> 2.53.0
>=20

--wmlwreimakep7qlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpX3H8ACgkQ2O7X88g7
+prDaA/+J+o4Ka0pqiKFsl6B5vJAD6vsP+iiE/zqMIa1Q6zE29IVyt3DySRofwBL
99yNQ+3ufn9nTFDyBr1qMAv4LegIqgrM+EucnxPvOD159SS9d+7bFngcVeUh7P47
fUfbjxLqw9QkzK0nQotCc9EyYjQV2a/5JUSqThcIGPPAx3uYdQqlS0hfCdR1GVCe
Loa64cD3EOyZ79O1lsDYJ4xEsAtUm+ztHd0t1RMSLUmaq68aNSus/Muh5eHuvzUH
AAAQELgud9U/TbtGEBR6AjM2KdthxBJZcnH6bkx8vs4KKAar8KGz9DuEF8na4Nmi
IM+k0YIyo2ESWsZGnjK7DmgmtnVk4j8J8LDmHUaTpA+Eg0/fUpW331+I+hLNXjF2
FzObpZ9JkumAZuPnczA2lfBctftuQ9voDHg5PbBfemgK7bdOy+PvgEle4H512bxm
nbg3H6BexThWQW7A3WnxvxifoATFhidzN/Awj3oXTjY4Yfemwb3X5jRPZ713TgkG
U9kky7/B3NPi19uunkJoDtM2HhA7PqjGUnKw4j06AhzPs433bdD4DVBL6FJRIrO+
UQ4JBJQW8t8JtDYRkvp3mFyBbQTqw8EjeIKxMAPdv2JHEEEOQz1/lyaHNSEdwIoy
AdualjvMfi6DKwBpBTfUUDHjMsiDtsiUxeVelpU8KbZeTRafk68=
=dfEW
-----END PGP SIGNATURE-----

--wmlwreimakep7qlw--
