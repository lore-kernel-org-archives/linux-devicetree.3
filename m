Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628B132ED5C
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774186219; cv=none; b=pe9M5hVbgNJJ4eU5skx5J4GNAWNSZerInjAAUHPm1demJN0M4xlcZ5cGFQJkyYxxesU0v5QXRrhmyXWTI2kt7AyzE9JsD3VlAo+GAJLMQ2vRcsy+sg77l9bg7LI4hHc4+5Hl0NDCkJ2cLhlm0QOsGCkjdzpEKV2CgJSCg7HYNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774186219; c=relaxed/simple;
	bh=+r4DJixed9qR03jrcBvB9qDQ5jUMnFCb5a5xczMslvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAvBaUk8em/Eofb0/X3o+8eWtD1sYElAIY0SIFiaMSna10wHzT4pYuxfcIjKHZkix6/YJERsVAbBHdMHe8Px58ScBAPIrGcmbLGfCJ8Cq5jroJdLAsisoTQW1PXRwAGNX+078btfG17aSMDo0ELmWX/88kfBvpeoxTdJ11ssgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2197I21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2197I21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C863C2BCF6
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774186219;
	bh=+r4DJixed9qR03jrcBvB9qDQ5jUMnFCb5a5xczMslvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J2197I21+EDGgXuP57VuepKieRb0SJoWutc8YtqGKvDuw8STRwbp6/V4v3R++E+fm
	 Ar4qymbmxSbOVdGBq0JT7DTtVXj/N0ZVBNomnzE9HeiKwEoC8t3nFbSv/IICo/6pDZ
	 U4G97GpVeEc7I59JdVAMamINnYWbjm5bDOrFkEGsdeumbYLG65chLJdlLDTOGDb7iq
	 QvWu5Vqx7e5DIWsaoan8JuxsENPOlpRxqtbACIqaOzmvdnYGNvTHQ71di5HSLKpbAs
	 ZJBB6Un/o2kNCMrkFq1HmRfuVLPbWg1AW8VzzbPchKHuKJ3JTqk73TIUwZFVcnRSWB
	 grCrOsMrMxgXA==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-128b9b7e3edso4411657c88.0
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 06:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvI5rRttgusjTfOfwOu/spRNIpXP4sFDP2294WhqzcUZcIypQwpnX+ranCHsNt7F4CmuMCM47VIKs9@vger.kernel.org
X-Gm-Message-State: AOJu0YxZJ7vC9Njs4cs1peinPBbW0Gb5bl+LCAioq+/eUi4qi/jGK1Wj
	g5ZavlUcTEEt4eQ5fynNrpYxpcscvgjzLFh2aOpcZPfwPp/i1le7rNMBtzCXVYbxQsyqSskzOcd
	Owt/0MXJaxG4I9vW9VkhzjoXQxKSXog==
X-Received: by 2002:a05:7022:10f:b0:11e:f6ef:4988 with SMTP id
 a92af1059eb24-12a726e7fb3mr3981540c88.36.1774186218230; Sun, 22 Mar 2026
 06:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:30:06 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8JiyK0jbRsKfFkSguMNBgLXrMF07fZZ=7iNZWCb3p7Qg@mail.gmail.com>
X-Gm-Features: AaiRm51_S1J__pLk1a4D71_Q_McB7o8n-vG8FQQ5qEkWpejUVhVFdJ1R0hMpTzo
Message-ID: <CAAOTY_8JiyK0jbRsKfFkSguMNBgLXrMF07fZZ=7iNZWCb3p7Qg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8823=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:26=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Add support for the MediaTek mt8167 SoC: the DSI PHY found
> in this chip is fully compatible with the one found in the mt2701 SoC.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index acdbce937b0a..c6d0bbdbe0e2 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt7623-mipi-tx
> +              - mediatek,mt8167-mipi-tx
>            - const: mediatek,mt2701-mipi-tx
>        - items:
>            - enum:
> --
> 2.43.0
>
