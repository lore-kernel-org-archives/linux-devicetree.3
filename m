Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F3534CFBA;
	Wed, 25 Mar 2026 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422872; cv=none; b=OIx+wwBbkHiXCt1z7bddy9RC/qsoIUxDJ3gkBEBR+FOFoBiQ8MmNcO97hWVPON/5glYNm7vY68A6vGVwjrwvw+8z8RJziFUF9huq0LcR21jhI1WWuA3Lu903em+1ts3VG0XgsMOTwLw/XAParEPlyGl4a5eA8e8RppCTWrRo+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422872; c=relaxed/simple;
	bh=t2D0gqXx6BcqrPhdnvIgacoxLOD/hb/8WinTi7+TOzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rY+uVMbwZCNEEs20Pb11rv5YYNvaIcyCYCFsyi2m/1p22Qmhfv8bVryuwHGv+HlSPxrgpPn7gO8g8zdb7oM7w5Fos/v6942sVCTMkD96Oo7TaKuSJCsQeNnBmn/tfVXgOYZRF82mYV2ghb+gd9G8fm6keQ/8yzwSu5PV6c56uNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aD8scwge; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aD8scwge"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FC2K+wItbpPFKtlgzvEj6NfAE+x7glEF852PPsS25ZY=; b=aD8scwgePtav52q0wTQYYmCnxu
	9YK+eO0qM8z3I160jc+nfq33wPCyvOipoFPdFrs520QNubi8Cs1eJSCR9qKXSfZb5GPQrdL6lKHuf
	1ddeGFerFXcfn5iO4FFIhV2Ddf3s2s3XtqgKcVFKEbj20Qt1AYRqiZtjGwGZg95g8QfmQaXxnEhMh
	RNH6CSUKuzBIrJjkEroNZDTda22AnHMny9l6vSaxmRbiqLICXZPEI0HN0pWW/yrzkiFhzSUNtZzBU
	Dqr+pSc8KWUlKjnXfFahNrcCkl1/LYXzvvwiHvz1JvAkMjDMxMMWfxNqSixNTRDi6sgNg2anOCgIw
	pSYlgWHw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5IRc-0007bW-1Y;
	Wed, 25 Mar 2026 08:14:24 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5IRa-0000L4-33;
	Wed, 25 Mar 2026 08:14:23 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Vasut <marex@nabladev.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 tessolveupstream@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 valentin@compulab.co.il, philippe.schenker@toradex.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject:
 Re: [PATCH v2 0/2] drm: bridge: ti-sn65dsi83: Improve dual-link LVDS support
Date: Wed, 25 Mar 2026 08:14:22 +0100
Message-ID: <14590689.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <d93f15af-219c-4118-bc33-e2ddd2188922@gmail.com>
References:
 <20260312043743.261475-1-tessolveupstream@gmail.com>
 <3019871.ElGaqSPkdT@steina-w>
 <d93f15af-219c-4118-bc33-e2ddd2188922@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)

Am Mittwoch, 25. M=E4rz 2026, 07:09:07 CET schrieb tessolveupstream@gmail.c=
om:
>=20
> On 24-03-2026 16:40, Alexander Stein wrote:
> > Am Dienstag, 24. M=E4rz 2026, 12:00:43 CET schrieb tessolveupstream@gma=
il.com:
> >> [snip]
> >>> Thanks for the detailed explanation.
> >> Regarding the panel timings, they are not explicitly defined in the DT=
S.=20
> >> The panel is currently using the timings provided by the panel driver=
=20
> >> (panel-simple.c), specifically:
> >>
> >> static const struct display_timing auo_g133han01_timings =3D {
> >>         .pixelclock =3D { 134000000, 141200000, 149000000 },
> >>         .hactive =3D { 1920, 1920, 1920 },
> >>         .hfront_porch =3D { 39, 58, 77 },
> >>         .hback_porch =3D { 59, 88, 117 },
> >>         .hsync_len =3D { 28, 42, 56 },
> >>         .vactive =3D { 1080, 1080, 1080 },
> >>         .vfront_porch =3D { 3, 8, 11 },
> >>         .vback_porch =3D { 5, 14, 19 },
> >>         .vsync_len =3D { 4, 14, 19 },
> >> };
> >>
> >> The panel I am using is based on AUO G133HAN01, and the datasheet can=
=20
> >> be found here:
> >> https://datasheet4u.com/pdf/1257948/G133HAN01.0.pdf > About CHA_DSI_CL=
K_RANGE: what is your DSI clock?
> >>>
> >>
> >> In the current working configuration, the measured clock frequencies=20
> >> are:
> >> DSI_CLK: ~422MHz
> >> LVDS_CLK(both A & B Channels): ~70MHz
> >>> Finally I don't think the swing values are problematic, so I'd leave =
them
> >>> as the last thing to check.
> >=20
> > I managed to get this display running with this DSI->LVDS bridge on
> > TQMa8MxML/TQMa8MxNL (imx8mm or imx8mn) platform.
> > See [1] for the DT. What platform/ DSI host are you using?
> >
>=20
> Thanks for sharing your setup.
>=20
> I am currently working on the Qualcomm QCS615 platform. The setup=20
> is as follows:
>=20
> - SoC: QCS615
> - Bridge: TI SN65DSI84 (DSI to dual-link LVDS)
> - Panel: AUO G133HAN01
>=20
> I am currently using the following DT overlay:
> (talos-evk-lvds-auo,g133han01.dtso)
> https://lore.kernel.org/all/20260302121159.1938694-1-tessolveupstream@gma=
il.com/T/#m00e90e7ff95915bbdb21dbd786c232526e3360a2

I don't know your SoC, but at a first glance the DT looks okay.

> Could you please confirm whether the display was brought up on your platf=
orm=20
> using only the DT changes you shared, without requiring any driver=20
> modifications?

Yes, no modifications on the driver. Do you see any picture on your display?
Initialization of these DSI-to-X bridges is a mess. Most of them need LP-11
on the DSI (clock/data0?) lanes upon reset.
I've also read that some DSI hosts (Raspberry Pi?) adjust the display timin=
gs
in hardware as well. Also make sure your burst clock is high enough.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


