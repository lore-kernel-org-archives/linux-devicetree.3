Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167954;
	b=LHy1e+w7AeGBZywXiEuZsdkqK9v5RZ54b1sWNBK/faFgI4obqPSXJjVkSCdMPCF10B6O
	 VI4J/aASpnbzDEH6e4oLnc8gBKAT4ZNLchx+o2tZVBTaCc8omv5ftulYxTCYIQeNS3CHF
	 MHThTvIA10Nzvs5NJPwkm9cGuWKr7x37zkogTwt876K1GZervzY4sLLKcT6QjOMXo2S2L
	 D11pAKNalmzp+hdVCF8ed9WBoc2he7ddnW6a1RNIg6ZeTZssdXAkpBCc3Rm49TQNhlIF3
	 qjNYApetUdna6HzGY1nnj57yhfdWz+l7Y9wBbgsXXoN7/DfwI8wgGdWdj3bwjC/2ieg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167954;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lyqZrq+1VDfx+17rLJle9JHjC1P2n2bfSRm53uAOyLk=;
	b=IwMbdIxL+KbxH+t/Dvin6vrJ7JQzI7mEtlyfN5wUMQPie+bZNGtCB+IwB1ze9bH1YNAT
	 khgHshonhtBIJ9sdSfgUqktm7DSTen5+FTpPgxxz8ZxvHcr2tldrRS7Oor9WqSbf7ikTr
	 nykIzxVmHEpjJFkuCI8yca+6lTbFDqjp1GrOmpKOKLZ0uP+R8PJRsCTEuzbIwVBcg19Qg
	 btEKz74jaKEDJyxJm66YzZTjgPG0Ue3lTMCMEo74JrIX81Xs8vePD/v0ewU4Vs3pKWpZM
	 Edi7vtFebpE1HlmcXF+t5175FXfr4x3W26gpV9nU/NjPW66duR1asQydCxZgJpCjALQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="H5voM/KI";
	arc=none smtp.remote-ip=91.218.175.221
Received: from mta0.migadu.com (out-221.mta0.migadu.com [91.218.175.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDDE606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDDE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H5voM/KI
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MOVcWwUOWIJzHtjaEKy4VCowPx1uh/dz8Ha0zt4lwus=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795167951; v=1; x=1795772751;
 b=H5voM/KIJylIyoim6S9u6H8im5dFRTo1cSE8gZHtzVt1OLCDg+WzuXDshKeAlRAqvsUb624L
 O9xKvy9zkXJiQRKLfPcP9YUuSP95qcu7MAr6fUQYiSrhaj/L1oaJVV7IJ1Gl3cn4jEPyu4oUWsp
 z8tjs++YvFD2GvN1A+9P0kGY=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5ccc56c1eb29246;
	Fri, 20 Nov 2026 09:45:43 +0000
X-Mizu-Trace-ID: b5ccc56c1eb29246
X-Migadu-Flow: FLOW_OUT
Message-ID: <73e4df46-89ba-4578-bb07-acad3d319d88@linux.dev>
Date: Fri, 20 Nov 2026 10:45:42 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 21/24] net: dsa: rzn1-a5psw: Update CPU port
 comment for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The comment in a5psw_phylink_get_caps() states that GMAC2 is connected
> to the switch management port. This is only true on RZ/N1. On RZ/T2H
> and RZ/N2H, the conduit is GMAC0. Update the comment accordingly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - New patch
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index c0c1f45852da..751d03b0bde4 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -237,8 +237,9 @@ static void a5psw_phylink_get_caps(struct dsa_switch *ds, int port,
>   	config->mac_capabilities = MAC_1000FD;
>   
>   	if (dsa_is_cpu_port(ds, port)) {
> -		/* GMII is used internally and GMAC2 is connected to the switch
> -		 * using 1000Mbps Full-Duplex mode only (cf ethernet manual)
> +		/* GMII is used internally and the conduit GMAC (GMAC2 on RZ/N1,
> +		 * GMAC0 on RZ/T2H and RZ/N2H) is connected to the switch using
> +		 * 1000Mbps Full-Duplex mode only (cf ethernet manual)
>   		 */

Hi Prabhakar

I don't see the point of this commit, fold it into the one that adds 
RZ/N2 support.

>   		__set_bit(PHY_INTERFACE_MODE_GMII, intf);
>   	} else {

