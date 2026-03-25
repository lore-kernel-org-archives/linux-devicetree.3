Received: from abi149ajj125.mrs1.oracleemaildelivery.com (abi149ajj125.mrs1.oracleemaildelivery.com [129.149.100.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90843E0220
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.149.100.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448690; cv=none; b=hCfgCtzte2WjjDHXezKzulV751bZUbwo8GQMVlKCgyzr3RvxTdngnJIkW4TnINl7Fqt1jdY9iPW5iMLOQMccktOb+WqqNudqaqQwgr6B0XSNsEHGSkCi5fZAOU/oe84VfBdgqi1XSb8jnL3M/rN7eEF5mIhYFmP7XQZf+gn0uho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448690; c=relaxed/simple;
	bh=xlYyUZ7qm8LRKa9b1Hkp+8PMrJFWf5+5nn9p80ukUko=;
	h=Message-id:Date:MIME-version:From:Subject:To:Cc:References:
	 In-reply-to:Content-type; b=EjJ/MCg8rubLg01pGlrvIIKKcETWXOj+4vuRKv5A2FPk5k6oeoxXK81+R+xY67EQgXxGJSIuXMXDIUsV2VUTFxtxWS6b4ostex6kVv7OmuxkYE1YuWEJ8sUc53GCwxXnbb5Je586jneu1KSQc04tNvWtYVALLf7bAHlB0wt6RpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pta2002.com; spf=pass smtp.mailfrom=mrs1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=pta2002.com header.i=@pta2002.com header.b=AW1Kg0Rb; dkim=pass (2048-bit key) header.d=mrs1.rp.oracleemaildelivery.com header.i=@mrs1.rp.oracleemaildelivery.com header.b=J5PElb8H; arc=none smtp.client-ip=129.149.100.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pta2002.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mrs1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pta2002.com header.i=@pta2002.com header.b="AW1Kg0Rb";
	dkim=pass (2048-bit key) header.d=mrs1.rp.oracleemaildelivery.com header.i=@mrs1.rp.oracleemaildelivery.com header.b="J5PElb8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pta2002-202603;
 d=pta2002.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=4J2bs+Xgq5dSGZ9Mv94Ovt55+98SGPNbD1rG7ZHb4uQ=;
 b=AW1Kg0RbB358hctzef6qGnnbSDg1obdbUtQF/8XNxjqFymvZAMYz/gsbn0k4Wt5xJkATelktmxis
   lX/YQQOu4flG+JOJUtMnNuapCfGAzjdumpTDcGz2RfKPshgkPMpOXzPSU9z1KzOagcrwMi/Ng91K
   pE/DwwtjSs4BAFYYaAy+QgcJgnkvSx5KnUinKkPJ9YrivdMgkaN1eb4bmPq2x+4oqQEm++58jctr
   Ai7E3rZD9E9HapOcxP2pv2GxtFw/GgFvVajsra9YOvKM+VIV9JtEBjwrWHCn0VATJ/pOdiL3GhC6
   gWNKxUIbtDFLuovG05seHzwq2WN788HOctNOoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-mrs-20211019;
 d=mrs1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=4J2bs+Xgq5dSGZ9Mv94Ovt55+98SGPNbD1rG7ZHb4uQ=;
 b=J5PElb8HMhvLOxZ60pGNUmJIaUAi7chNvMAvYu5M048LrWNwllzzCdgJdq8K5YeBjOTzVuzrrih7
   kWe8bOtFtXI3ckkX2i2CvMlXJpixjM7njCzjb+7M7WIOSUiiqVqIwdYnKBHLQOtbw2c/gsINjdFq
   KsFTxGlNgDkC3w4tqdhPol/88vlv/YTpf3SsUALRDDm0a7NkMGNBdV8Pl97Z7PVC6UVFk2tTsR4E
   /eych5b5mRlat1Ff3Hak1MWQNazMmJoJSRZmgiiHYOidH2tmJcGZVnO1bpdUYP2kQOMjSgE5tmVz
   hKodOKXLj8ugA5uHcPONKUsL3NRUaznzSdE3/A==
Received: by omta-ad1-fd3-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TCG002W7LDA3R60@omta-ad1-fd3-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com>
 for devicetree@vger.kernel.org; Wed, 25 Mar 2026 14:24:46 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <1331010f-1446-4892-9d81-2f18b60f6977@pta2002.com>
Date: Wed, 25 Mar 2026 14:24:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
From: Pedro Alves <pta2002@pta2002.com>
Subject: Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5
 ITX
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
 <3407927.44csPzL39Z@phil>
Content-language: pt_PT, en-US
In-reply-to: <3407927.44csPzL39Z@phil>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta:
 AAHaB8rt6U4pRWPuzg6HYoL14PsnJ3SvWR/H0/t4MAxeSZoxpcePWCN+kYBu4Dv9
 oyx+yTPV6GooNsUjV5QCIcVW9vm8S/sArtST4vygj+j9y8F8xyBCS60fXjfiPj4K
 3FEOcWf0e3M1NYMX6wdoso3WSJ4ukJ4mv1Zmo+oIfzluxRZsTbZ6vcuhmaVL0hZw
 FTbHWJdpFD1BJ/8gwxPQh/QeIq35RsTKCdvkdbc5g4Ga8DHtBF40XYnpwLRHpf5u
 OLb7UuwZVAULkCOWna5qI2CSQIuq4eq1P31bpGQSVomQf66buGR3m/4Ln/uOi0aM
 Gy13Yngy6+Dg7AySQcjttd4wBYyjFFCetBLXP4O4qcqPrRkdpR9kuZq/7srx4qd3
 nGZilBU1PobO1GG0NDao+enNkj7ngvfOIs11ijvHvTMflxaGRgSZB2E+gsOr9ps=

Hi,

On 24/03/2026 14:18, Heiko Stuebner wrote:
> Am Montag, 23. März 2026, 10:25:33 Mitteleuropäische Normalzeit schrieb Pedro Alves:
>> +&hdmi_receiver {
>> +	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_det>;
>> +	pinctrl-names = "default";
>> +	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> 
> as said before, please also add a pinctrl setting for this pin.
> 
> gpio1_c6 is not part of the main hdmirx set of pins, hence needs an
> additional pinctrl entry to configure it as gpio and possibly set any
> additional pull settings.
> 
> And yes the pinctrl-driver does "implcitly" set the gpio-mode when
> a gpio is requested, but our more modern approach is to always have
> a real pinctrl entry even for gpios.

I am probably getting confused by what you are asking here, but I don't
understand what exactly I should add. There was already a pinctrl for
hdmirx_det (which is what the gpio1_c6 pin is) present in the file,
hence why I did not add it in this patch:

&pinctrl {
	/* ... */
	hdmirx {
		hdmirx_det: hdmirx-det {
			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
		};
	};
	/* ... */
};

Looking at the other boards, they do the same thing, but they call it
hdmirx-5v-detection instead, but as discussed in v1 of this patch I
ended up keeping the det naming to match the schematics.

Sorry if I am missing something, I don't have much experience with this,
so I would really appreciate some extra information.

Thank you,
Pedro
