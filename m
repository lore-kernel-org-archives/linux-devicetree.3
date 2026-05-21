Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25881332EBC
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376818; cv=none; b=DvYMawPZPVRyM/58f7BBwgukIMaZAJI0lLb6Ad15pxnMWNfH3dubptJ2ZgWVmOxMa1wjVv3AVEWNl2OLFdK/KdSV8IyresLg3NY+JVjjTm6xpCuNwgUuAwFWeLKzSxjh/8jaIXtrnMI35ivArSvqU7Q6MIca4OspTXWv5Eg6Mx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376818; c=relaxed/simple;
	bh=DtO0BAlbmX6xMYwtb1/EsgdcKlKqEDfHynY80XfgCj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tRMTdSu/2nn06GBJ3oRS1OxLE5KWPaxEvAkwLLtbnAWKkvcYWEdLKZe4/RvQBFCFPp46/AQungR34lOFL4oQNiy6zFDe1/0MWjHEvGFZW+Kgkhx5HLAnRUzoy9bwhpLZHl0saCf+in7VgAa4j43G/oBkfRLew9vrX+GwiQaf/Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Evr0pmry; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Evr0pmry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DBB1F000E9;
	Thu, 21 May 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779376816;
	bh=IHI83RwU6C83TjfPMvZrWpRnO3uDCNZqQnspG0l56uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Evr0pmrycxGQn2s5ebFX21AijR2Xq+l+6fte29/b1weHr6MKZC6xs50T9M0NzaD8f
	 ZCae//E4UWk+2Exi05XtPXpr+VeNesn98mo4qXfcDmisoGQnkapdJWlKkjekJALxJ+
	 /yM7DJkbKEnitaCA/s2T+9bcRPvLK1rAAkO/wQ4Meyq1Qp8jOos3pBKkwsdbO3j15w
	 30UriCA2Qb3pBkyTgEvxkwM3GiGAsPwNEVnVea/Hnb5m5vLKicWmon3WJsslDQS6Vj
	 fe+1BtWMzms+UZdz6+T4dIOKowtYEEiqYb0sJrhARAAQIE75UtaWO3FTqAyIMpQLGC
	 m1SU4xa8IO1NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-2-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-2-a4dd5e0850f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:20:16 +0000
Message-Id: <20260521152016.A6DBB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding a `dual_panel` flag to `mipi_dsi_device` forces individual p=
anel drivers to handle system-level display topology, violating the separat=
ion of concerns.
--

commit f6f95d24bc09251a7384b7ecd49f09b146258523
Author: Jun Nie <jun.nie@linaro.org>

drm/mipi-dsi: Add flag to support dual-panel configurations

This commit introduces a dual_panel flag to the mipi_dsi_device struct.
This allows a panel driver to inform the DSI host that it is part of a
dual-panel setup, treating two independent physical panels as a single
logical display.

> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 2ab651a36115d..889ef1421207a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h

[ ... ]

> @@ -186,6 +187,7 @@ struct mipi_dsi_device {
>  	struct mipi_dsi_host *host;
>  	struct device dev;
>  	bool attached;
> +	bool dual_panel;

[Severity: Low]
Does introducing this flag to the mipi_dsi_device struct force individual
panel drivers to manage system-level display topology?=20

Grouping two independent physical panels into a single logical display is a
system-level integration detail. Typically, panel drivers should not be
responsible for understanding system-wide topologies.=20

Could this information be determined by the display framework instead,
such as by parsing the Device Tree graph to see if two DSI hosts are
routed to a single CRTC? This might prevent an architectural layering
violation and maintain driver reusability across different system
configurations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sm8650-7-1=
-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org?part=3D2
