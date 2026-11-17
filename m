Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957910;
	b=DeR31WDJneqtFi/GuEvzxLny/BB5rJhWAcPX4wA+SywvcndaKMBhqGhQ5WpGhfUGfms0
	 ImepUc2U8xmVQqGtyIu+ODVC0ZDWH25Sog69BkYxyCem+LhegqlkXoLbmuRDkWfpbbDqJ
	 mSVLcvOhYACsJsOCMf7t4BI/nTrISq27pzVMf9p2wtX3DBhdQ0ClA5ncFZpVxzlAworPd
	 x8SZ5JQst/aJkA6jnMijRIKHKDd9YD/ELsGYpwx0ue0IIUlF536UUn7/OgT+wcjkkxLwx
	 dDLow8OGHYdwLte0VGNBnkmKoWme/JgyFwQjzNhdVeVMTAstLfRV7KkdeMSSktZIb8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957910;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=+MzJUlSHy4eYz8k3I9+Z1/DrWgXW8jRa6k0Wz5zf8Es=;
	b=Ln7mqVA2Be4SIVoQC74E//Vkx4qhgo3iMDKQY2gNggnOMkN+NxfI+x6irQX68DpTHSVr
	 PO/dHX2s5U0fTMaImQVBVBMUUJvrJ809o4/2/TiQW6Yg8Ob1E2dQjk9Q8IAjoOkxV8Nv/
	 Jofg88YchfV3l5MIl2LmL0TG4h7BOCQ4wEfG5XLJHhlz9UlRPJMOM1LmK2V2myKWfiYx3
	 5Moz30zQd1zlyMXH0U88UEuhV4w15rvvq0RNF6HX4QqoSGqb2a1FuXQhsCH75KW4MEKem
	 ifhsS/CiqFW62Pn3JPSfg+rdaXo37wffLUMOYj2ot+jDKX7tGBk2urkhe4eDxAD+G/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sverdlin.org;
	spf=pass smtp.mailfrom=sverdlin.org;
	dkim=pass header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=MlnVnObC;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=JvEiBCCF;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFC606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82FFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sverdlin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=MlnVnObC;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=JvEiBCCF
DKIM-Signature: a=rsa-sha256; b=MlnVnObCBZqCH2kEZrNce4+p2hQJguBuSDf8535IEZP5uq06sRAfiUmr/+4Nqsa7zgV1QwthqQhCc04HYH5d3bj+ND7fJlcJ/RSS+tkzsklu5Y/fJ7EYlxVgK91F7M/E6WueJSxpv45nRMKzUqC/AJaX+tBPFuGxfaoH75pIbaEKnixb0ik0+HLT/DlBasFi4pMBHueb4CptYHo0eiwpwF9owjdOD0gjQWXoTJMbUulOPEC9sJ8uYuxwBPfrlc2I/nV2S3OAxCVhT8DgBXAS4i4ySbBnyESH00Fdl7CDDkEyGYl8fAhOAaCNIoK4ME/PzqPBUaGunU+rVpIhTY1NIw==; s=purelymail1; d=sverdlin.org; v=1; bh=+MzJUlSHy4eYz8k3I9+Z1/DrWgXW8jRa6k0Wz5zf8Es=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=JvEiBCCFFI3HmL0ydlTlgWrchv77khmsFsDOYPbA7OBa9pAjlD5aSS//gQvsNgsbqgHnecjlVV9zO7d4OlUWUHBmQibjGww6PvlHxMnXrZI21ChoR8EzljicFg7dd332o4tEmefs/5ZDe/PuhmRITGFVUjxYBSEh8ROlFoOSAzsL/rsdcXgGP4cpMJjcrZY3kKqWFJXQmdpZiCfp1xveOr24t2womp0ehxBcADJRp8/hlua9RuMV4XHEKv5UQc42SiP7g1P8KNdcZUX0RiqY4lOw6WP03VtoFDHMeWWuefFbTBp7vJLlUKkN//+Byz9A2VtFCSGHyUvw72gI2JJzXA==; s=purelymail1; d=purelymail.com; v=1; bh=+MzJUlSHy4eYz8k3I9+Z1/DrWgXW8jRa6k0Wz5zf8Es=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 418562010;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 23:25:05 +0000 (UTC)
Message-ID: <9957d8679c44e695e22ba86224e4f853a0a65217.camel@sverdlin.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
From: Alexander Sverdlin <alex@sverdlin.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 00:24:51 +0100
In-Reply-To: <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
	 <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Enzo,

On Mon, 2026-11-09 at 23:45 -0500, Enzo Adriano wrote:
> Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
> for the accompanying initial board device tree, so it can be identified
> and validated.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index 28437c47ac01..37a7d713ac71 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -857,6 +857,11 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rad=
xa,cubie-a5e
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: all=
winner,sun55i-a527
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Radxa Cubie A7S
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: radxa,cu=
bie-a7s
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwinne=
r,sun60i-a733
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Remix Mini PC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: jid=
e,remix-mini-pc
