Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840E3624A6
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113483; cv=none; b=rLjpfa2M9mhdPw1jwWFEiy+s9yTmTAssLbgLmJpQrtqcpHdrd3Rp5RmcyUi2ekFsCFGZRBSds8mIZ2ivGwIxB7SrrviDzfZIw4er4RFEF+oyG5tMFAuA0KG0sIGx5pwFSe8651G1rDsxuoAMYXVv+yzpvTAEea/OrcOwdkV42QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113483; c=relaxed/simple;
	bh=h7gVkfTa5QHeRim/stNXsU/SzV573sj0iQ7u9k7nmU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pisYm9jp2uvuMfbJpFx7P7kKbp7Xd2RhYYUM4gY2CzZZ7pMPswhkJ+BQz7JeiqFEXw9Z9QheXPU+pO6MSC4E229VlFZ7cOg48CWr+ax/MbGZjwYb8msLlrksLGv4O+yVkgTAOL1kWlQWevwyiYg9B5rzcV7PWPW5rafxAHMak3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryEjjJ6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryEjjJ6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC82C2BCFB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779113483;
	bh=h7gVkfTa5QHeRim/stNXsU/SzV573sj0iQ7u9k7nmU0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ryEjjJ6JWn+X5PFCMwVoRDjDgpCxRDbrTUHHWIIaIUJ65I5Efqt2Ea47ot/lc9mvm
	 kZiUmdTgEHsDz2CTJzMoYL5jCYxwjCmcp6JrWljg0A6VodksTJ3ebGI0XTbiUIwKdJ
	 wZg3dT8eeWcZIPG3nfZuqzgKbljHAKBuXYseOBEOmAzzitmh/BJp01IRTgOOGh9dzX
	 1YKLs5BWFqaGTdbz8PUW1Kpm28nNMSKz7hR5NWQtkik0zoA0Mm5Lxa8X7ib49SR6/2
	 5nkrSg0hUA0yTi3iSC2hE/uC7nNi3dAKKqfImpNVSqcBnZXFSYRgPebTk5HQQWLGn7
	 Ad5QaBuJspxLA==
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-132830d8281so9274148c88.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hYoZaauLc+QPLwwDUyV9PW1C9l+Le2TAxkBuOwJlE96BM4HgIgVA5bDgt6SACXt1YXWeI0BrIM30A@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvw8JETPd8p57FYPSFooihRy78FEi3l4aqrfmyoJ2Q4KHxgQpn
	C/D8PjzwhYODmdgROWCrSjcA8yyEEliXaxNRgXFJp+Rm1ZA8D5qxN52yxzxc/MuNZ35jGWmKMMf
	dtVPGjUInLKjUR4fz8zCpef4OHvlzZw==
X-Received: by 2002:a05:7023:b11:b0:12a:6ab7:3f73 with SMTP id
 a92af1059eb24-1350463608fmr6954781c88.0.1779113482382; Mon, 18 May 2026
 07:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505214541.333657-1-l.scorcia@gmail.com> <20260505214541.333657-3-l.scorcia@gmail.com>
In-Reply-To: <20260505214541.333657-3-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2026 14:11:08 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-ROn-9S1qfHgovv=kU8JOe-A40PAMA+5tsj2O4admTRg@mail.gmail.com>
X-Gm-Features: AVHnY4In4m85pm3lmCfr_GmIUHep1vnejd09hnbSXzHvVRUiJfd8Dukfjspay4c
Message-ID: <CAAOTY_-ROn-9S1qfHgovv=kU8JOe-A40PAMA+5tsj2O4admTRg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B45=E6=9C=
=885=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:46=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The mt8167 DSI controller is fully compatible with the one found in
> mt2701. Unfortunately the device tree has a dedicated compatible for
> mt8167 since 2022 and it cannot be changed with a fallback nor removed at
> this point. The only way to get the device to work is to add the
> compatible to the driver.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 5aa71fcdcfab..167e33fef025 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1305,6 +1305,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_=
driver_data =3D {
>
>  static const struct of_device_id mtk_dsi_of_match[] =3D {
>         { .compatible =3D "mediatek,mt2701-dsi", .data =3D &mt2701_dsi_dr=
iver_data },
> +       { .compatible =3D "mediatek,mt8167-dsi", .data =3D &mt2701_dsi_dr=
iver_data },
>         { .compatible =3D "mediatek,mt8173-dsi", .data =3D &mt8173_dsi_dr=
iver_data },
>         { .compatible =3D "mediatek,mt8183-dsi", .data =3D &mt8183_dsi_dr=
iver_data },
>         { .compatible =3D "mediatek,mt8186-dsi", .data =3D &mt8186_dsi_dr=
iver_data },
> --
> 2.43.0
>
