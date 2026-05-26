Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92172D5C7A;
	Tue, 26 May 2026 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783844; cv=none; b=A+cM0MVfs+xz8BoP3JoU264kb10KnFGu8f13eQWiw3o0jyczYCfbEiE//g4qWEQF1e7cnmZNTgUTjOVBjde6o+m2ICQK0d9QpobDcT5gF4Yvdd6e4P0tjzC2b5BBnx/7yoXSEYOUh9lfpD7Idh0u4aFGFVSJR3ankAJLTmU2z1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783844; c=relaxed/simple;
	bh=jzPDUrYU5YUBI5VtcpGXBZDnsZJiBGb7cYlhvsOTwB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u7ok/vJhZ04RqvePX2WloXSxLtY5BCyCGOBgZmZNilwsy0t+L64udfg2R5Fh+ki3FfPvwMw8pOXYr8b4ai49YrUYQ41Rdu3gVDmf5pFYnvWDYs9GPgzjguEEdjnd7EfpqULCS25FH9s/u69XMwjWpqLzIqxl/MBb9lCWfbCg6LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ZyGQyVQT; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZyGQyVQT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Jz2YYHrj1dgz9D267IoLZDXvPm7YaDuL+I5moOpvFWE=; b=ZyGQyVQTYvZazDTz43A4s9V6U6
	RiYJ8cZTKGcPRbAVpyh2CSvaWNEwsxidxgPIBNUAcx2T+XJbHyGSh7Ih9laSNIh/hejE1Bn/XmX4F
	EabNmK8K64bIMz1tbBAZwGmuOXTF3253BwT8B9oRH+U/pUbRy1CGF1w6LeA3iltvR2/sySAiJNtvv
	NfbsJyltzrEARriRgXsdJTXJ1TCWCcl6jCTYJDkrrbOKQTjFGQZWzDrNKTKazDNoqe3s1AxTCekA2
	rl15FCUNp35Ws01m4aDnpvFn6vGyy8XfmGEuDE0zDnN3GuIqCeQbFrRSaEJg/H4vRPrY5nJHJJWbo
	oyc6dRhQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRn4y-00078m-0z;
	Tue, 26 May 2026 10:24:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRn4x-000EHC-11;
	Tue, 26 May 2026 10:23:59 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Tue, 26 May 2026 10:23:58 +0200
Message-ID: <2834667.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28012/Tue May 26 08:24:34 2026)

Hi Frank,

Am Dienstag, 31. M=E4rz 2026, 16:19:01 CEST schrieb Alexander Stein:
> Hi,
>=20
> this series adds small fixes and improvements for TQMLX2160A DTs.
> The DT overlays address specific hardware behaviour when serdes is config=
ured
> differently.

Any feedback here?

Thank and best regards,
Alexander

>=20
> Best regards,
> Alexander
>=20
> Alexander Stein (1):
>   arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties
>=20
> Nora Schiffer (6):
>   arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for
>     SGMII in SERDES2 configs 7 and 11
>   arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC
>     instances
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and
>     pcs_mdio18 in appropriate overlays
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY
>     reset GPIOs
>=20
>  .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 306 +++++++++++++++++-
>  ...l-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso |  20 ++
>  ...sl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso |  20 ++
>  .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  23 +-
>  4 files changed, 357 insertions(+), 12 deletions(-)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


