Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060059;
	b=a8lLHQpiH6QW/w+eiAoLdsdSu1SDoxwCzh3VO+wD7D5bXTZfebVn0zNkpelZ6YbNz5dV
	 ExjduDPfv3cJSCvnsl1LygW8E9cH7GuiI1OkDuANnKp+KSXo0PC30BJAZ8KCIlY3j+lIt
	 +doeBeJbkB8tQhch5BC5FOWJTujhsrnRIu23RDzbXf1sB1Jd4lj7STJ7hi6Z4k9TDQLwg
	 7gr+nO5obkuzFY1PdOX7JdBajxjqF/KhVNI57hTOG6Q8r2YKedQu0nEMHbDQJDIFaXJ2M
	 ffiz12lrecwfpXqQRytVRB4RakSiWamiLoNpvMRH015lzoDO29pBtIBkyWESF8qgO7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060059;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=P3/ZtZc9uaQGFY2ihIoiddTSKQLXeow2WIExumNjyWU=;
	b=HjEvSTgLLM+UdawcU7XH2yqjOEjuGs480xMaGFlFghNBgYt16GpvQDxnUmrrWhR7MoFo
	 DsSsmk/wLbtoT1V+nR/YuERmKtA4SCsdivUyaf+74rlM7BsEntSLb/0UXUP8jWnMJegds
	 SWtRztPtAWUqCzSIFPmqZvadah/fFojWnvB7GURtKUsFTyEwf/RH4qlenpFcn3InubX/Q
	 kxwVmxt1WlXIGzXl2VwN44U5bKZ+GDKwM3lgapiL4cwtklZUIB6UWX80IsArQBD/A9Tgr
	 H4uNh5ODQHyuUWo9k24JTS5FrTBfkybfPo3omSKmMMR9a5Z8+ZgWYK3vHPEgaSNMlmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b="kFb/dtKx";
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD4606A32E
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61DD4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=kFb/dtKx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794060055; x=1794319255;
	bh=P3/ZtZc9uaQGFY2ihIoiddTSKQLXeow2WIExumNjyWU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kFb/dtKx0W21Hwap+7+8lga1HqsD4gxpdPl50pcvQ9e3S9KwwoYRPhb+Qrjm/49s7
	 7v9iGvxAW1p6TPLAUNDvDrRdgxAZHAoHpDMTfczNMAWo36XQCGKYb49v5VAkfu9y1c
	 gWdcVMQK+fAd0PlZgH/c7L6TxTYZvl+M4FVDX/qLL+Gr19LCcIqcK7zEBFxxu6MRxC
	 XATdPMFns2C+Oc9Fs+aTx5LUI0iDzaPlXsjviuVz1G+qfHrO8iIcPQigRxdD4d4d15
	 1jGpyBtntJOIQx7cMcbGAV266k+totjlYOv+551esKm92NBCxSd7lN8+5I5HPaELud
	 6sVHHm5qnQ/1Q==
Date: Sat, 07 Nov 2026 14:00:47 +0000
To: i@udp0.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: serial: mediatek,uart: Add MT6833
Message-ID: <joJnuIX4efIyYGdLotFbhAL7aSeQCOCIdfbE2p1dI3CIEHZuJ6cLh_xF34joTacjhgeBgBC_5AQfceHf9sCsdCStHhTeJSujzY7UNuVADps=@protonmail.com>
In-Reply-To: <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com> <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 68a5641e2b162357b5d491fe81981b1fa2444ff5
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, November 7th, 2026 at 2:22 PM, Rui Cao via B4 Relay <devnull+i=
.udp0.com@kernel.org> wrote:

> From: Rui Cao <i@udp0.com>
>=20
> Add MediaTek's MT6833 (Dimensity 700). Its UARTs are MT6577-compatible:
> MediaTek's MT6833 device tree gives them "mediatek,mt6577-uart" alone.
>=20
> Signed-off-by: Rui Cao <i@udp0.com>

Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman

> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml =
b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> index 5bd8a8853ae..8fb793c3408 100644
> --- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> @@ -34,6 +34,7 @@ properties:
>                - mediatek,mt6779-uart
>                - mediatek,mt6795-uart
>                - mediatek,mt6797-uart
> +              - mediatek,mt6833-uart
>                - mediatek,mt6893-uart
>                - mediatek,mt7622-uart
>                - mediatek,mt7623-uart
>=20
> --
> Git-157)
>=20
>=20
>=20
>
