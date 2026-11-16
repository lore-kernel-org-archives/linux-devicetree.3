Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841288;
	b=O2bliMQeXPWRvhUVfU0MfTP6XP9SrDqH2KM+170m3U0v8K8eR0umcUcAPo+Gy3ADMQib
	 FCt8ywyI/8cJDvFLuQxbLzaSAlEuAA/CzfThDhnhXq89LHCMltVsFpCGia0Jqgqwyl5Iu
	 NTkl3oENoJBs9KgEtvEFKkTesIs8Zi4aZud0kWoHxQmMydMz+xTlmY9jsmz0eiIYKMNRP
	 wxMJw/ZqQUxw/ulkkEwFjvnjDSDSr6zK4vZJB2DxDK4YlVl4G1Jng/qo2wvGEitT6zPuT
	 AtEaxnj2otkcTe+wrN9KT4PikF2iexnAsdF5DhpHkA91HUspZ00zJ7sFYBK09d2GpCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841288;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=;
	b=pMDzskgQd/rOYIDdxhewai5cwG2cMs5KLtbHsfUTYM3XbT9pXLpScNdLlzMmq4HJrZ+c
	 5PNjlzTXq/1oMS3VXTAMPXoxGyLlFkDBoJiTtZSUa7aB3xVK4QqXd3POdvdPTBBxZyi9W
	 uoKiB0gpjFTpdN7g53rHiaaQEfK3K7+AQH+gDQ4KwyDEiNq6hyj7TDY6CBXtAqfBdqgxo
	 OEUSuD0oEWlVoAwcD1r/zSTnEMR8QnUCuL8efDg5OrmQrk2Antd0IgXHa3dqqG97BFyDK
	 Xf9C7vw1whd2hqeGZ4TEQsZ6LJdiQzYwb7n6joxUc43Ar5J3ftnueEba15uOCR2m/aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKh2I4UW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13836606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKh2I4UW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB71B1F000C4
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841287;
	bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HKh2I4UW8urBSFUrtUHbQuwz1uPcC4POn0U8BTVb7KejMbcKTgiiMvkB1Gmm25liB
	 kJv7PCgqbShOR0u8F+r7n/QRCEEJAujbdR+CpHaW2UCq+S4bYSu8E6kodZ2CCmqdV8
	 RUk4aBXxZGJnapTndxlNM/KubIf9b1TS3QCNuKzzeIsnGlDSZ5EhWbHUew0yjT1PbS
	 LUm/DK0W9tLuC1jwPG8sDSwj0F60JVcBeCPGxQFMbYdJCQvTOeS7kPHcFwzOXE8zUq
	 8Qa5Yed6nZ+W+AQpcGVxYJUgDX01x1woMkdkKv9nBVR/BMdXCWDW02zAUN+3wo2rQL
	 O8W6dKmmqGGJg==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b24f4b15c4so1134223c88.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:01:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEl1AmYgbYpx7UaQxJqeB7fU73fXmpYOHIBr+82jWVVIvVv/ShPTGGNF0w3wzOdR3P38t8BumehGnwP@vger.kernel.org
X-Gm-Message-State: APuU4Z/z/JK7HvRM93KXH0ofiK4inCE4WlkRGe+M+EJ4bw8FFot98Ryn
	Q47tPj2t/hOcTYz4AX1DpzcRabbhgE+n/oxX0XP8Qpb77JcbaUCipWBUSyCwg/dWx3rmNIpISXE
	BsDv+WZz1R15WALyGPVKngDi6tsTw2g==
X-Received: by 2002:a05:701b:4648:b0:1ad:1574:aa9d with SMTP id
 a92af1059eb24-1b502f8a3femr9454273c88.0.1794841287247; Mon, 16 Nov 2026
 07:01:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-2-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:01:14 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
X-Gm-Features: AclHuK8ZIdYSrxKs1dMZwhPrKku_6kwGWxmzNQVSAncsA778TJy7Qtii6vDGXkQ
Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
> MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
> one can be routed to a DPI display while the other is wired to the HDMI
> block. They are not compatible with any other device, so add a new
> compatible to describe them in the device tree.

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
