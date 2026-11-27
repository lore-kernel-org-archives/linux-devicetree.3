Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793032;
	b=BWH02kxCPcK3RT9oBH9cpQulWm70UjRwrPVKo6HcY7fFUCWy7tkWBYxYahn8DLlZOjlc
	 BqOIQgO0pLgS/MTBrOSLaaY3jLzDqTgguagGC4RgqCAcGQenIq7NhxueyaNEiyOsjB0JD
	 6CXHgEyh3KzGh/adUHXvdbaigk6oZE2JrLi7g+Zlckf7mux1nHGQGh0+Ao36I08U1Gdmk
	 k9GXjHIvJV1podE7ET0ieqmNpKT9yvukDSxfxoYYQjSkv+JadlEnAguMKx52Rs7BSpvqe
	 HJQi2s2/ASM0nYUFsdQm6x9HTVmZHGZBC9wJ9Sz2cZ1iLeq4W1utWOT0suK2P36xaTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793032;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=9qm8gKQknLIHjCNA8iGQyl2nV5Vy3wPnee7iGG4J6pY=;
	b=266c9CrckZxGZbl4qbMZNHtuGBgJTheHb1LBCHiiyVkwDHs9tjnzy3WpTF/Xqk8w6jJ+
	 34uXoAMa/O44CkkjLt9SdrN5xlYKDqPz5Z8Zuxj0XzJC6ZryFQfXEI5pkK/kuBORXaL01
	 sPV4zARQB+aoCc1XAKu9A13pti0H9CJ7lhrJFdfJte4likD1zzXB08P/8+PFwh9ZOXCSO
	 PSq7I9gjcK4TQb00LJs9Vy4WkoFrXOimOzfT2ePLcPumCt0lCNYBM/svf/UznKZAOGBPf
	 WK33SXeP+QVVuhrF9gzr5HYYHohFU2gmwMnj+QUUdvRRU7RnOSd2x7sX3bXT89HqAqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jhv4dGVE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C8A606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C8A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jhv4dGVE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8F8FC6223E;
	Fri, 27 Nov 2026 15:23:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20D9A6049C;
	Fri, 27 Nov 2026 15:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE47F11E90C4D;
	Fri, 27 Nov 2026 16:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9qm8gKQknLIHjCNA8iGQyl2nV5Vy3wPnee7iGG4J6pY=;
	b=jhv4dGVE5/LuAMjZj1KaTATnjN7/6Kdobu9r/1C/0OjeCcqpUXC4NsLkcy3zihWtvJ48NC
	eoSmEL7+dXDO36TLUXr2FGk0kpRtLvZKXUug1pNoc3jtXUbvtvvyPebuB5uXBGRB22XiQL
	ztYdDS0L/uXgqQ+EBF7QLggm5EENG2qNFpUP2RXPT8yBpVfubipI85ynMxh9gQ6N6qo3fR
	NJVTJC9cPDQPH21QjQmQUAs9dcy2nHUWF8bJTlYEGaRuVdFakoCVqpm0aKyghhIX+53bLE
	NxhSPPJ+fWAI9NtSgegIYB3DYfrT9ALsD7LKRVJeBz3fpXuWVxaeKNIjPW3tGA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Quentin Schulz <foss+kernel@0leil.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: turris-mox: replace denx.de links with
 official location
In-Reply-To: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
References: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
Date: Fri, 27 Nov 2026 16:23:42 +0100
Message-ID: <87h5h21eo1.fsf@BLaptop.bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Quentin Schulz <foss+kernel@0leil.net> writes:

> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The U-Boot project doesn't own the denx.de domain and we don't know for
> how long it'll redirect to the official location (it currently
> redirects). Update the links to point at the official GitLab instance of
> the project so we're future proof.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>


Applied on mvebu/dt64

Thanks,

Gregory

> ---
> Found when hunting denx.de leftover links in U-Boot where we import the
> kernel device trees verbatim.
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arc=
h/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> index bd00e7df87c67..159515f95ef33 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> @@ -151,12 +151,12 @@ &pcie0 {
>  	 * for IO and the rest 112 MB (64+32+16) for MEM, despite that maximal =
IO size is just 64 kB.
>  	 * This bug is not present in U-Boot ports for other Armada 3700 device=
s and is fixed in
>  	 * U-Boot version 2021.07. See relevant U-Boot commits (the last one co=
ntains fix):
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/cb2ddb291ee6fcbddd6d8f=
4ff49089dfe580f5d7
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/c64ac3b3185aeb3846297a=
d7391fc6df8ecd73bf
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/4a82fca8e330157081fc13=
2a591ebd99ba02ee33
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/cb2ddb291ee6fc=
bddd6d8f4ff49089dfe580f5d7
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/c64ac3b3185aeb=
3846297ad7391fc6df8ecd73bf
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/4a82fca8e33015=
7081fc132a591ebd99ba02ee33
>  	 * Bug related to requirement of same child and parent addresses for fi=
rst range is fixed
>  	 * in U-Boot version 2022.04 by following commit:
> -	 * https://source.denx.de/u-boot/u-boot/-/commit/1fd54253bca7d43d046bba=
4853fe5fafd034bc17
> +	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/1fd54253bca7d4=
3d046bba4853fe5fafd034bc17
>  	 */
>  	#address-cells =3D <3>;
>  	#size-cells =3D <2>;
>
> ---
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> change-id: 20261029-denx-de-links-migration-f3880bb40e51
>
> Best regards,
> --=20=20
> Quentin Schulz <quentin.schulz@cherry.de>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
