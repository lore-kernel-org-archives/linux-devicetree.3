Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447874;
	b=IEqrKkAjks05Oh7r3JXyQ/hawLE1rBksZY9yruUERjCW1j/uhDgOxwAvuO7LMLIpgQqK
	 u2zlJwl4z9BaAFJsQ7cJdpk8r2lvTAs9PPiWF3kpeGfLrMKNQZQbZtK5BN27eE4oD9WYs
	 /sdY3KUDezOW0o9yuiMX4IP6aJV4JpiRnKzc4bq/WQDPN7brJpDLFJhW4Z6ZmXav66Ptu
	 7BYAMrHhPGZ52H1+ITul6oJ02R0EtVijdWp+uPstKikE9eIVqeDWFb06wM08lzxpfSFct
	 wO8DFOm1nIBv+t6kQwOXkEdjkalnYu7OBBPjaF0beewQvhAR15nAyXuMCXXuvYn67fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447874;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Zmzfenaqe/ABUcz0D1nvMINiY0TPaqXO2ZTdLBhjRU=;
	b=xCqo165LJM3gk0geMJ4CYUTP8AOsNnZsspW3Ua8CfD5o5hBBfh+1primyZuszvYKHqTu
	 C2xDSAcFKlSNRKUVUr1M8n5EToU3D1+//3J7dHc4VpNsqWZnd4UUvQ9IICfYX3zpqiBRv
	 JKOl1L0bwXEBN8+vB5rZQFgVtersEq5kwMLy5pnDr14JPfciuljMf8Nk/g+YPoVuRUXLz
	 +cDVD4Lu3s3QyezZxq0rFoIzVOj1lYlZe1LtgSqJeBH7yHOIQoP5Dm5LOmUQtzbxT9mft
	 uoNXM9WqPUj9Pl/A4XsvFFtlIjv0oO9LqZfMAPIKUxYQV7NBMJapHEQ2C9Q/6Ym+kMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhHvVIeL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE85606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhHvVIeL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6282D1F000EC
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447873;
	bh=5Zmzfenaqe/ABUcz0D1nvMINiY0TPaqXO2ZTdLBhjRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OhHvVIeLj+E8jjACmZyxOQsE9LLq2TL2ftClvwugpxsJm1tg23lNcFLQd0SGWplHc
	 TWzlhIBDKuLOhLGZrVly6pVMQ6oWBArpvHDqz5nVxf0svxcdqjylyUoSeyh7z6xyhF
	 SQRLZ3bux7XcahS8tWzmVdaMc/RcYAbrfHXlzehjfQ3//xvRaSpcALvlJPajTkIdRH
	 CSmNEyCORb08sPFGiybftPt3O04fBgs9GzWRqKMudgC6VFdJaNPvO400OdzCN1jt/U
	 c4GOc9ynGtjbcKSXfGhJGFfckZq5SwXYVbgZi5/ymHi48yEFdJXlUmDNBNce7RSqHQ
	 nDPq2gL7TL3RQ==
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4302503c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFc1ncAQIci1um/RX2P0EJr6AyZbHTQd35UMZLuW2ro2scwmfqeNoaKpibL+ktoOU+njf/o1VtP5vGA@vger.kernel.org
X-Gm-Message-State: APuU4Z/HA/c1zBwGv17AnwKabBSfEjCaQxSKQJ7cUGhttSD9Ka69hAg/
	V78MjdAQbbkRDxJYkj7OmaQV8YMNWw8/f6zsRXLDtqT7UY6qmkyDIwa0REL5kyrkYlooKWQgiGk
	YZ81mD6jRTMuV1vJlkEcQYGVQ32nN9Q==
X-Received: by 2002:a05:701b:2810:b0:143:5cb4:30 with SMTP id
 a92af1059eb24-1b5567b3391mr10425170c88.3.1795447872711; Mon, 23 Nov 2026
 07:31:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-6-l.scorcia@gmail.com>
In-Reply-To: <20261010115539.9237-6-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:30:57 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9N7q8vSOM1R-i0JzidoSnVmf7E99KKi458NGU=WTSnCA@mail.gmail.com>
X-Gm-Features: Aa3M54qyF59hFKqLYZAT2WpV4wdT_KYkLyV_ony0INzG1Z9OlyFKt_7T9Q9dDAQ
Message-ID: <CAAOTY_9N7q8vSOM1R-i0JzidoSnVmf7E99KKi458NGU=WTSnCA@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=
=8810=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8811:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Just like mt2701, MediaTek mt8167 does not require an ARM supervisor mode
> call to toggle HDMI output.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 511cf7d12331 ("drm/mediatek: hdmi: Add MT8167 configuration")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
