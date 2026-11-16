Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841555;
	b=vXAfvmR2ZXVFkhUgob1wbB2sBW8dZxPEYZVNyys89a26rwVKiOU3Ou/nAgttadiBtx5+
	 k6W+/3tc85fe9P8tbdOcf+7vx+RFlZhv0Q6JeGlkRWfW05QAu3JbumxYRzAsr1E6OpCMe
	 5VrRAlWzNemehIM/B7Eww/FQeNaHr+cSdo/DR2WgcZpqB5haNAtN9W6gsKKXKeiRygs0p
	 9sZ4v9Tl+lB8vqzrv38O+0NBy5yiAd7bsIYo4LCsrTkm7GTqMeRmQhDJIqU9yCG7y4WCK
	 vVuAuU47qTyfl9S6IHrxGeL4Z/jPKQVj/TTTUfLoKVU6o0IiB3WYWIYZ/DGK/EH8brA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841555;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=;
	b=j9Ik0D/z3IAhv8/LXIb6TFVBKMFKI1FajDEQSn34DzrHOEumWiCIpBb8Ysg9ubgkLAeM
	 /VbhfgrbBSTz3C7XZck7YTRFKK5fJWZvecH/YzOt3KgUaFIQ4rpP5Id/loerqRmIsZnDJ
	 Fgm+5I8Z4/OvDfJO7TARzOgq4HrhJ+j9ISYG6r0t4oE7Nj8KvuDziMrPFN/ckwz/81yfk
	 fWw5lq5wwW9pwPqkhQHP68lVrCTtaRpRM7I+I96lHDpj5igUpAqi8SFW3bQ8fTyN0MSkt
	 qmrYQ6ecdvS61YtXasDv6qSey2ZXlj22VaVGYy61Q71ilrSoJ4+NSjhFs3iiDhu6bpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFWU1dbh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1C606A333
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFWU1dbh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F111F000CF
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841555;
	bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FFWU1dbhaoZvQa91GRdHI8OMpKROvy42/LGrcfuQXbdf73zihIiGdYVwNZODlPIbV
	 Q5czS1aAFUldNovu3EQYEfoc8NHu+qSDhm6v6a8eCG4NjUp76kfyw8lV9DsKKVk32O
	 CcIoLaAkJxaGHLILcqeNkWcM46hNELFAqOhyLM6uSFD20cXkC38iqTJWOeahtcSyYd
	 gl0YXDYAHTXv1NBld07Xow1K8b2g7I8++GShq7P5vme83fnO0wDP07J8foPfiJr0EU
	 +rycpV7xKfNuwSFM0D1jd7RIE4w+CF+RlYtMpdD4VUI53TH4XpcHTY33zunLN8yGxa
	 pKvVYF2ayle9Q==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so5639085c88.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGN1JmdlsxDBJbiwtdVNgF2826UZp4FGraGdqmuZ7NNTypkuqUR6Rix2dH06PZ67LxqDMuf7qRPMSXq@vger.kernel.org
X-Gm-Message-State: APuU4Z+xGBtG80dQyzOFxTl93XNzJSD8IQR18vmu0yDkC72nF0/ZMzFE
	GzsNIoCR+0qER/4iTzBZ+yfuLB3ajJlZU9/V9w2YO+qPFEToh/pr1erYIzHQ0H/vtBe9X3Ab8x6
	YGQDDt6aXA/BbQ0qE0DSmJgZwheJ5uw==
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id
 a92af1059eb24-1b503115668mr9409313c88.9.1794841554483; Mon, 16 Nov 2026
 07:05:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-3-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-3-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:05:41 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
X-Gm-Features: AclHuK__YOxqBRiQVL1fHhE6d4s71_dwL_BIXyQUunv6tKh3Bya6r5Lxps8nc8A
Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/mediatek: Add support for mt8167 Digital
 Parallel Interface
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=
=8821=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Add support for the two DPI blocks found in the mt8167 SoCs. One of them
> can be routed to a DPI connector and another is directly connected to the
> HDMI IP.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
