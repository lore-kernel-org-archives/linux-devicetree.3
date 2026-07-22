Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A962D8391
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722801; cv=none; b=uQg5PoriYjiN3rFWvs1cb0l3x+6fLXZ3L13NQJ25LrP/AAWzjGS+HByJ29W92UhCQOg0skBReKOHAcFj+ZO6UAh+V/hshlTCz1vAkIkj3aeLts+JgZMSLJPrTf/8WXWSMMRn0VNGXNMPaXkQymHvvz4/7r/sfYgWEGk9DFJQQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722801; c=relaxed/simple;
	bh=u7iFMbNvPt/ZXBk2jR+R5xzICXvlZhRIrP3MLNFBAOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m8WdhE+YnXJ3GnKhyjgtiP9QTexJI86ysx6gAN+NUB6zjUtdBvxQSQ7aSLg1Leo8iNcaKrHhoFCinWeEj5Eg42wlvGeAR9X+yPuVJ6Xg19678oOzCwZKAs0sRfoON6p3d0lQsnzEISEXOEvqBGUmqZHY4SesWLJ4JF8/RUUJ0CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4GM1Cno; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4GM1Cno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B0C1F000E9;
	Wed, 22 Jul 2026 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722799;
	bh=1My7FfV3pLZLrkwx/+TtDFO15Gzexp+I9GDi/+hQoH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c4GM1Cno8djy9dXdPWnSxXqMlHKFzvpRzhjpvxB+icQfsHNpKtXQOPZO6ddf5q09C
	 +tcnpt1CmaLkoXsZrs54jGGkJFsYZuaFT0lKF1X5StxQSvilw+YULefqbORON9wrjf
	 JMcZ+cUpUlWbedYPymp+P5nUVj5smQlm3Di1Gc0N6sV7CpmVrx2Epw/IfmDNTfzqtM
	 BGtFeupvS/zP9qr58QHbx1SLtM1bG7VJAja9QWmzDWm0AALMtrhb8su9H+GiUF9Tx8
	 4V0dNfvEMHu1SGZHmLlM2ahhNkbC2AcNTEWeThHaMO4A9ATovivylwVkzdyqhQcUZB
	 6UPBAFOclngDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 1/2] memory: mtk-smi: Add mt8189 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Congcong Yao" <congcong.yao@mediatek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-8189-smi-support-v3-1-ae00e13deeac@mediatek.com>
References: <20260722-8189-smi-support-v3-0-ae00e13deeac@mediatek.com>
 <20260722-8189-smi-support-v3-1-ae00e13deeac@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 12:19:59 +0000
Message-Id: <20260722121959.89B0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added mt8189 OSTD port configurations contain explicit 0=
x0 values which cause the port configuration loop to terminate prematurely,=
 silently skipping the configuration of subsequent ports.
--

--- Patch [1]: [PATCH RESEND v3 1/2] memory: mtk-smi: Add mt8189 support ---
commit 8db8065406833f4c96be551356fd00685313a57d
Author: Congcong Yao <congcong.yao@mediatek.com>

memory: mtk-smi: Add mt8189 support

Add the necessary platform data and ostdl setting to enable support
for mt8189 smi.

> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index aaeba8ab211e9..f2d5462af6817 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c

[ ... ]

> @@ -401,6 +401,30 @@ static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_=
PORT_NR_MAX] =3D {
>  	[25] =3D {0x01},
>  };
> =20
> +static const u8 mtk_smi_larb_mt8189_ostd[][SMI_LARB_PORT_NR_MAX] =3D {
> +	[0] =3D {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10, 0x0,},
> +	[1] =3D {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10, 0x0,},
> +	[2] =3D {0x7, 0x7, 0x4, 0x4, 0x0, 0x0, 0x2, 0x2, 0x7, 0x7, 0x0,},

[Severity: High]
Will these explicit 0x0 values cause the configuration loop to exit early?

In mtk_smi_larb_config_port_gen2_general(), the loop relies on !!larbostd[i]
to terminate:

drivers/memory/mtk-smi.c:mtk_smi_larb_config_port_gen2_general() {
	...
	for (i =3D 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
		writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));
	...
}

Because mtk_smi_larb_mt8189_ostd[2] contains 0x0 values at indices 4 and 5,
could the loop exit prematurely, silently skipping the valid configuration
values (0x2, 0x2, 0x7, 0x7) for ports 6 through 9?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-8189-smi-s=
upport-v3-0-ae00e13deeac@mediatek.com?part=3D1
