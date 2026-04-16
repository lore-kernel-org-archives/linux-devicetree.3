Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEC623E334;
	Thu, 16 Apr 2026 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776321579; cv=none; b=c3Q42Ds6JY3C8rUfTPWw/c0v2LFCKxbSGZ1A5Rz3OkIrdl5KH95fuX033xw6jhc5/jiJxtKiDeN9KlOJ2GPsCnSknUY5YytqQfLjLfzKgLj6W4pkSYecVAl+9rjTpCzwQ648vjL2XnjitMkQSp17wjbpvc7FaxmO8N60kIBF9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776321579; c=relaxed/simple;
	bh=3WIjP/+sCijw7xIP2FVSMbvp8tMHLcBLSWumuH9cqBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVeX3eBfnrb/pCRKNIuDKlijc5vGbxjANb44RQLN/dvLVSOiAHFff7pikmfAlIUOSk/nOSegUzwCsOdyPKZ3H4pOZ8XM8JiD6QVM/Byuqt7EC91oHgDlXTFaZJ4C91/ZOj5A+xASJHidsnAiLH2/fWM9tA0WU1Bh02kJoAqAc2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=P4OgWa9G; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="P4OgWa9G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3gl0Q5lzwMmxfxn+nsop3W8hwu06PK5GdVZhuc+ngXw=; b=P4OgWa9GwqfivTYMTkIqYFa4np
	aEWtzTILtPjzT9EZxk5Qk8REDpF4dp9C175bvElGoSsevjD3j5OI/JZvJd2Z9qufuhGQkmHseIpug
	lf39E6fx9xUrSCfU2/rGtLMAh8O7X08yE+PkuVQ1B7LLeeLy4Uh49eTGMahdNJ6i8OGlqBX3X+hDl
	tf7PJZyL7wT2XDldld2WW6Yf+B2hGdYdWDnf8EnJfTSPpS+tSKLcl3Q7MfMvhnjeXO98At2jqIoDB
	SegQtrwVi/nz0L1gWAsNfkibkq2Y4ZeszKb/NzQOdAvqoI/0/28vA57BYCT0hlQKzhZh9NI++u5I1
	kZkEGfVw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDGNz-000GxI-2s;
	Thu, 16 Apr 2026 08:39:35 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDGNz-0007Zf-0Z;
	Thu, 16 Apr 2026 08:39:35 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Thu, 16 Apr 2026 08:39:34 +0200
Message-ID: <5096354.31r3eYUQgx@steina-w>
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
X-Virus-Scanned: Clear (ClamAV 1.4.3/27972/Wed Apr 15 08:24:27 2026)

Hi Frank,

Am Dienstag, 31. M=E4rz 2026, 16:19:01 CEST schrieb Alexander Stein:
> Hi,
>=20
> this series adds small fixes and improvements for TQMLX2160A DTs.
> The DT overlays address specific hardware behaviour when serdes is config=
ured
> differently.

Any feedback here?

Thanks and best regards
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


