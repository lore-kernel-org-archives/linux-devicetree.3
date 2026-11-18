Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993241;
	b=XtOrm100FhrDjqjKXpRDVur/++eHYYwDU8Wuu/O6J1JP1Ym0cidRYD3gH+QXrLTrCvOT
	 BkWnSVa3cb0z83NYcMbo2UyOFODQ1C89whN0pPi6n+tJFkgZFy4MRqKlJXZ1ZWSfqi6IA
	 FwFTDIJPaotWhc02bXROKi411AguTlWq3g4utRqtp1oHGunf/VZ45Nv4GkEPumCk+YY5u
	 szgztjUlF4A+AYsbn8ErwHNNwzqwvUJWxnY55mrTjX0Q16z9S8zACGoDqfosPKarB7+3z
	 C94ep+sqxFRMZGyA4f8lzdhCZwJQK9G0pBCnhp3JST+RZSRiFL/p0cIKk3P20tzIblA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993241;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1Mj/7zNTFxvoo0YnADhIrDpQzE4e1mgOjutHuCj90zM=;
	b=BptG5MOkiQX8RYQWtne+jd9+Q/SuFu+QV+St4gq2e2i5OWWQ3E9+yayDHaKQN5f4VfNk
	 ScTENpps1dBxkiJk2euvdw+rUcbmARj+N1WhnPxUCNJEG8HmpKDXDmGOiH4TnuxA0s+yN
	 JELeMR+847w8RH3v/3zKSgwzcFwesFAVf/S/Qb/YykqmIQfBV/VJhMY0hJJ69sPPSa4Ox
	 J81zgnrWAhgtLSr5Am4JUn98osEPHbo7imv9IXb8Ip3ZQaNYznGGHml4u6Ux5dHpzJ2pr
	 fyKciN/N0cWPXwWptK3d2Lr57s20aDUdkQQxBD6HjCWlj68SCRvSmtUn/xGOBUuJRzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oA37q7RK;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CAF606A31C;
	Wed, 18 Nov 2026 09:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38CAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oA37q7RK
Received: from francesco-nb (93-38-173-255.ip71.fastwebnet.it [93.38.173.255])
	by mail11.truemail.it (Postfix) with ESMTPA id C841A1FB3F;
	Wed, 18 Nov 2026 10:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794993236;
	bh=1Mj/7zNTFxvoo0YnADhIrDpQzE4e1mgOjutHuCj90zM=; h=From:To:Subject;
	b=oA37q7RKSzbZUDsZ4P4vc1g/8RuFjYJGzYdlZK7kKB4Ii+UXppDWqV40OmEqk9lr3
	 vw/nFFOfLGJQzf2guxqLNOvDWLiHaDAA1okMAL062eG9Fn1tpB3DtsC3s8iWcAiC9K
	 8/Cd360XxMCEtFqBM7ODnlcS4/pOH/YLz6bM7JWILQrkWjUSnWCLrULkWZSKfZjpRC
	 07n7PHWYie0II1fhplVPwyiNK/ZM32je0lX/RjO0QG2NcxpHDoR6z6kNvTHmtfh3zm
	 LdnnX5Qdy5lrWMR4l1L07jzNYs1EzuOsZhlrLD8WxK11JnFYHXKHQSgA/s7bvcpcPR
	 gm3OycSQdzKcA==
Date: Wed, 18 Nov 2026 10:13:50 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am69-aquila: Add ath12k
 calibration variant
Message-ID: <20261118091350.GA133044@francesco-nb>
References: <20261117174154.549590-4-ivitro@gmail.com>
 <20261117174154.549590-6-ivitro@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117174154.549590-6-ivitro@gmail.com>

On Tue, Nov 17, 2026 at 05:41:56PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
> module reports the same PCI and QMI IDs as other WCN7850 designs,
> and its board data also comes in variants for different regulatory
> domains (US/EU/JP, UK/CA low and high). The IDs alone therefore
> cannot identify the right board data.
> 
> Describe the Wi-Fi device behind the PCIE3 root port and set
> qcom,calibration-variant to the US/EU/JP board data.
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

