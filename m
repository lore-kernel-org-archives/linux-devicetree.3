Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BD23EB11B;
	Thu,  9 Jul 2026 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586030; cv=none; b=dLusIWD7nMkwX2iv6pd+DenITtaRCxClBZGOr1ocUwIKhoDkQc6fFdEg5tlDys0zlbYLuddSk9DTPVy1aLVLk5sPUPKCIT4yY8V5so/nE1sg1u0plAm4B9kcCHm7WDD6oC0oiEqYydmZEekJNVlsE1TUjZM81HU9QkpicwUDL1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586030; c=relaxed/simple;
	bh=QWT/bqSl9yvrXdLDWIKpLA03c2jR2ehgD8DVwOebAoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vb23xomrQuzCTpaYkk0qY3ZT4eGfwoWZch1mJue8QjPTpMVGawyt/vqvbUv859LLuF6NfNhgzhGCv6WRZj6wo7C/J7sHbNb1htXt2KAGWIGYZR8QdFPzVBmFgzca1HV/5/KQb0hvypg+As2gUlkG04xRlgaMBEIXq11hDIS3tJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JlYSuHAa; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JlYSuHAa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NTniXkvlvMi9BmvhIr2c95Vz9qQLlsDpcx7w+MELcKI=; b=JlYSuHAaiZb9PcQRuRLewM7GY3
	IgiEpxzEoXnUljrHJXRGmqanXmRJ/MtjO0UwT4ly57ie51ZnEB8VXaHzICwsj07eXNm3hzMDfEHtz
	umCjwp7LexbcfYrliN0GtF1Kl5+D+ydLxeZXteEZvQ9or4HKqKEHPWc5Inc3qSEiynpRp3g4rGyBq
	0V+CypXkKBgHJwMd7F2dd+TGQxC95xVnPv0S01J2c5GcNOuCOOHkaSE3j50ta24iq4J0g38th+HaB
	uH5j+7IGAoKWAZaFV67sC+f5LcveUuwweJxsOi943Zuufb4VMfS9Xu2IXIxAsis22xp0ufK2IZX1R
	acxbcjLg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1whkCQ-000GtM-0D;
	Thu, 09 Jul 2026 10:33:38 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1whkCP-0003g8-0b;
	Thu, 09 Jul 2026 10:33:37 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Wojciech Dubowik <wojciech.dubowik@mt.com>
Subject:
 Re: [PATCH 1/2] dt-bindings: display: sn65dsi83: Add reverse lanes property
Date: Thu, 09 Jul 2026 10:33:36 +0200
Message-ID: <8332433.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260707070244.230546-2-wojciech.dubowik@mt.com>
References:
 <20260707070244.230546-1-wojciech.dubowik@mt.com>
 <20260707070244.230546-2-wojciech.dubowik@mt.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28055/Thu Jul  9 08:25:20 2026)

Hi,

Am Dienstag, 7. Juli 2026, 09:02:42 CEST schrieb Wojciech Dubowik:
> From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
>=20
> Add reverse lvds lanes property for endpoints. It reverses
> the data-lanes order i.e. <4 3 2 1> instead of default
> <1 2 3 4>.

Wouldn't it be more reasonable to parse the data-lanes property and check
for the order instead of introducing a new property?

Best regards
Alexander

>=20
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index e69b6343a8eb..44483e808af9 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -115,6 +115,10 @@ $defs:
>              enum: [100, 200]
>              default: 200
> =20
> +          ti,lvds-reverse-lanes:
> +            description: Reverse the order of LVDS lanes.
> +            type: boolean
> +
>            ti,lvds-vod-swing-clock-microvolt:
>              description: LVDS diferential output voltage <min max> for c=
lock
>                lanes in microvolts.
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


