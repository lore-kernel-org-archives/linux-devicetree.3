Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445217;
	b=JefzL0p7rJZpDtY/C+pAmICwo1kEs1b7Ck43Qma7RjYBb5PSQVb1MAnf6PTMAOYWf3iH
	 2YOJ2kgfkRDlTaOTMe85qkuIolzlxZVXzg+uRglo4JIGFsDJPtveQCMWVg4k23h1ffGy2
	 WWarKA/mLlyfk4zoMqjOZtGjmdAq67xMeZD349NozoHLV4iqq0X6NPmk4suBzSohr6eGh
	 GfylM0pgbnU5OD1natuuV6usnwzEBvWmF8naOv7Nv5nf6WLpksDd0XD6mIf7o6vGhsIxn
	 vJiuVyJjqXYEQc40TLKcDbQDT0eL+cgO7J+0bcAU+arcTwIbuxoIDx3naSVAIIYjSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445217;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2/oTajujBgQv2lM0tHVLlqdb7xrNZwTMKNXeSsiaOWc=;
	b=ZdO669GHwkK8QhkakuAabBiyLM7ymwR62M+JE0bQz2vHATddNgZNJg+L/gfQNa9V0+iT
	 ihFZXo7jwGHh0yiHlMjUcmedfekqxQNH3B8NrW5y102QjHUv93XVFGwwj04kDz/JKIWdA
	 VZKgeY68zFA+y0U/5me6dCNnFRj1aNUqsZoC/m8Qv+GDYWqHi0kmd66aB2SilD4R1Kr/6
	 z7gt/dC1X+jiWODYeGZuMPXJ/+V6qMuW2Ic1W2DSn7o0zOa8hdW45brMLENHdVnLC9DUU
	 f89KHYuExYGBijWiCbfqcnoeWen6EwrjkvUbdg3EzqvJBMTvRT6t0REF79kz6EBRXKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jr27XPWF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF7E606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jr27XPWF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779A81F00AE3
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445216;
	bh=2/oTajujBgQv2lM0tHVLlqdb7xrNZwTMKNXeSsiaOWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jr27XPWFooKKoEeXO0QG8u/hyF5wNO0Ouh7l74J4PhTBsLJpZBMh4KqS1y/0+kL4z
	 dtCdVOkZ8syA1Wc2nIspEhfWs4nm2M6Hauz0nnMHIgje7yBkdm+Efy5EaG+3CRB94Z
	 0KvnE5E9XoS537a1MkzfHucZcLsWI0b5qrw36Jszl6bXn/AdH+2wvG++t6xKhHpVqH
	 QLxR0H8CiJcL9O0fHHo6TAlqdENzs2hdaXvP9tL8zQ6UJyUobsaBrh5sHgOyF9JVs7
	 KM5C5SHyEppfUi9jKgfr552Bd6vEU3YHHchlRM+S2qRcTbW+d5HsfZ3yZP9yztQWnc
	 ZCCX5r8tmsWcg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c411e139259so242397066b.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:26:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzRu/XRKCgKBke4W+VPQMgECQWU5SLexYuPzoiuWrpOg1e0XWv7HjpPDI03DWFkajx592aLHUIM25YS@vger.kernel.org
X-Gm-Message-State: AFq9FYJJQn0R0vWzcsL+2dMeBM5GZlT0jjjo9qSKqjl0qsN2qukqzyHk
	UquYseVOfokwfUdvHxmrOiPLeLmbDlJrVASM3AytGR8akf5CvPpBC5G6LID4GBCiRNJdCYnYQQG
	XfasQcuREHvRjKBxT4FcyW8tflELUgw==
X-Received: by 2002:a17:907:b046:20b0:c42:102f:15d3 with SMTP id
 a640c23a62f3a-c42102f35damr377191666b.34.1792445215032; Mon, 19 Oct 2026
 14:26:55 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791623422.git.kyrie.wu@mediatek.com> <951691c0a3d4ccf1cdfbeaead6d576145c731520.1791623422.git.kyrie.wu@mediatek.com>
In-Reply-To: <951691c0a3d4ccf1cdfbeaead6d576145c731520.1791623422.git.kyrie.wu@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Oct 2026 16:26:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL3+ySM=XEt3SfT_ukXm_x0i5_Qa3p_2Etu+SMiA3mMew@mail.gmail.com>
X-Gm-Features: AclHuK8cez5FtL6SKEsML9LRxKLTKpwdtokleLqyHyBFJ3_4ydfzJsav_z0NLA0
Message-ID: <CAL_JsqL3+ySM=XEt3SfT_ukXm_x0i5_Qa3p_2Etu+SMiA3mMew@mail.gmail.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Yilong Zhou <yilong.zhou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:24=E2=80=AFAM Kyrie Wu <kyrie.wu@mediatek.com> wr=
ote:
>
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. It uses only one clock. At the same time, the decoder
> supports the vp9 decoding protocol for the first time in single IC.
>
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Withdrawn. You need to define the clock names. But that is a mess and
I just sent a fix for it:

https://lore.kernel.org/all/20261019212431.4109371-1-robh@kernel.org/

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
