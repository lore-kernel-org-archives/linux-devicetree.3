Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358258;
	b=M3xt4x9PfNLPC3VP4/HbweLGZmF+4q0CGzIX4na9D9kk2XAV1QewMpqHn97bVRdZDSZb
	 pU671pGjzGBo+yu0jhmuWt2KE/R2zBM1rlwDiEUC7BDrDMR0C1BIULJMGskmm38VdK6YS
	 RxyWDWBiXkFRDcGlW8QDgIrcZ/zOGEEH0DyBmKiFqRs32mjWHOCJLMgN5y4EYZd696xRE
	 fNh/pS5HCG3dYIzGBV+5kkzOcJAwBK07dqv8tDqMU0pY3+7YcRZgsxxbPrf+1nf//V6QP
	 Q9y4XW4BHhODQdaLzs5YyXEZ4p3SNmZTJTixKnkd5eOTDElmQTvcn4fcdgoMdJ10tRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358258;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EBU7rnFp3oNZ1pkjtzcdL/kgfbKnHYrr06MJchmz4II=;
	b=ittsQMQG+zE3HkVacDsBsOAbn3Hosz9rGPYtmXCJVJwVUuxHRsjDaYd7bjwxT7vt9McA
	 CVP/X+zWoIY1vUYrs/DrLtghP1rVCyiyJb6aZI2EXGSXn3bKsn82au9h5eZ3rmbjbTAav
	 2J1rl1zA/lyAzPILkiC+TOKutC7yP2U7XSpfHU1fUyOVKz5+ilCyJaJ8eta+YebiYh/7s
	 loB+sRb2aAUdwTY5U8HXTJwZxqhQ6nq0Aw0n3dL81YqWeshyI3VAfVwU0e3VdqLDEkh0I
	 p+I+ULoyj539IDEF77YXfGEHgSdF/HAi737+gSnEcatSLT9k/d26CwvLgG7MXUeDm7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGMYpIkd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2D6606A320;
	Sun, 22 Nov 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGMYpIkd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C4A1F000CA;
	Sun, 22 Nov 2026 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795358258;
	bh=EBU7rnFp3oNZ1pkjtzcdL/kgfbKnHYrr06MJchmz4II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BGMYpIkd/ioMH4S3kcMt+04VqtNUNSg931SSFKuMt8YlPxRXmAVTXP9IyxuwQbBpB
	 ffc+Ecc6wsbAhOVHs40Gq5Xuoyf4DFsIf+VhP6UKdlI9bhq25Ux5Rtr6OtGFMAJgDo
	 9vgNsQFFAO5L0TgpjnP2cMdlwH51CyAh9paGR1TUTviFYI5CFmaCWozTx5bOBRrUU5
	 R9iOcIsNplkKmu6q992OIc8UiAnA7ohOUb6HVtURnHCyfSLDooQMOCccXuwRKrvSPg
	 UkSE5Yvf7RROOeiSBUoajnFotCuguSbPEQKPPzuERmHrT4JhbD2XoBGQrPny3shxEQ
	 +9Mk2FmUKnNEQ==
Date: Sun, 22 Nov 2026 15:37:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com, daniel@makrotopia.org, 
	linux@armlinux.org.uk, arinc.unal@arinc9.com, Landen.Chao@mediatek.com, 
	dqfext@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Subject: Re: [net-next v5 2/7] dt-bindings: net: dsa: mediatek,mt7530:
 describe 'passthrough' hierarchy
Message-ID: <20261122-millipede-of-excellent-energy-33efa5@quoll>
References: <20261116183332.168858-1-cjd@cjdns.fr>
 <20261116183332.168858-3-cjd@cjdns.fr>
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
Content-Disposition: inline
In-Reply-To: <20261116183332.168858-3-cjd@cjdns.fr>

On Mon, Nov 16, 2026 at 06:33:27PM +0000, Caleb James DeLisle wrote:
> Due to hardware limitations, full switch hierarchies are not supported
> with DSA based on the mt7530 DSA tag, however it does support a simplified
> hierarchy in which one or more switches act as passthrough conduits with
> only one CPU port and one DSA port active. Document this capability.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

