Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC97369D59
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641657; cv=none; b=niMdBoq1ceKDslsPHAirnVloB1RcMpufX428OnCXGV42VJaP22+dOrXLvchU2C9H4WbsbzzQe1j339mMd4L0P4U4zu79qxquxTtDqmDbOGFs2u4dsYnJpV8zKZSRTM4UH4ai7MdUojZpbOcbSy2fCnDoW+tsmwt5XsORdoc2SOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641657; c=relaxed/simple;
	bh=xTBFcM9TkpWzcdbid7SiEiRR1QDxfB9ux5nHJ2vCvfg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=enDoqewFbAqhYD+WeYmNvR87yG6jYfOKYguboJMF///9ULxmQkqRnE99rhNsnsytQfqPgncgizPJ1CqMc9VO1zGY+rK7Uzql2Relv4jZchuimuiPYXNcNuHX5FGWiJ+b2fzgEnZE73aOOZ/nwf4Xq5h88/826QrVrBE4rAzSvyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=m7q9Kgvz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M63IUeVK; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="m7q9Kgvz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M63IUeVK"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7AAD87A0074
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:14:15 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 10 Oct 2026 10:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791641651;
	 x=1791728051; bh=P5D41lw9AvoFAu/NxmqiIH7K74Pst1YSUgBSfmtz+LE=; b=
	m7q9KgvzaoOqlvH3uyt6b3NRUrb/XshVsTwIZQ2MkfanF0l4UbzyCYCQP5QsVdO7
	QObIizevkTWPs1J3Eyafl3+cxjni0izy+xUgCD4QSFJTAQ8NZ+IjQrl+GNKH+Sj6
	DTZG2joS2hA8z0CRIKW6hbCDPHPqPJAMQVTTNyjjrH5ejFNLlzzbdhg2i6iCgqiw
	ynpLL+C5qegRlpTwfli/z8PsbPObF2fc2zBJCzIvpnhvHKRumzg0vKaNGE+lWI2i
	YdaqaQzc/KhGDjFxOxm7D6F3P9/4wtXFW5ogT6Ksw154eCSThk+cmAUjnwlwBdTL
	FlenU3ZU3igC0stXSolVHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791641651; x=
	1791728051; bh=P5D41lw9AvoFAu/NxmqiIH7K74Pst1YSUgBSfmtz+LE=; b=M
	63IUeVKUTLQXGMaaDRVP9jD1qL3IvASSLQLZtYt0//+lXu/swC0urIJwP69vAPCJ
	2RPhlox0pNmX3eNXSgE3TfOuwYJo5EK4afJSOxfXFL2r58OBXMVZ9dGpxEiSeHnc
	cQtud6OJnXczfu5i1XhbZf59N37iNEDYU3bezEVubu5Ou5rUTQXmXA51KYmH20Dp
	ka3/pXMjefonMqX5UBDfs4qhvlJrGSUTlzTxFAc0qgIKlvEozD9FXFqPQnj4kmQj
	b5iJsJ/DjLecpNj57bCm5Q7sabACuBTkvbSTWtAvCLBAl+vGCGXPoyfs/QbWbE4g
	1I2XGdbnUWeF2V5LZqZwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791641651; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:oIjzidUlknl1FvcNAPZzat2zlkoCv0xMDbJufCetCog280O
	2qgqDXnFc4eBAqJlcaPbYrNACRUIA4s2RPOM1leHH2X107iDpzpyo5zg8c0RIis8
	wBhJeGCOrZHU3rx3PNuDtKdAHGgGnTFeuKQQ/hFv78vtwv7G1yd9WpGVQRlVtoEZ
	LQngpEyzbnO4yDzNohN++QbrrGAYYS0j72jNeFDAyFI4ILQBM/RDgUqv/9PSeElo
	PfHnvlF+sA9YXVKqf4xWSjMolbEJ6w6DvcXDh64DPka8JfEtSSJXUCXQ+xBwjNa3
	KOpFMuIPsLBptsTFWuJGQpztqmElkU09Sb1OhFg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:E0iXCI5C17X7FFLF5wpNyOXtmHUPYySvSTLL/Nr0UuI=:xTBFcM9TkpWzcdbid7SiEiRR1QDxfB9ux5nHJ2vCvfg=;
X-ME-Sender: <xms:MEjKaqDEMS5-Z4qDa-vxFYxQbwCbgjv7Q5GhXah7AisdAUWP-AjfEA>
    <xme:MEjKavVL50CGShenTs_TEkfnp_CIQFtbhAI8U_J-cDh38mxrvCPGI-acbk5jvRrca
    8W-eu4PAjtzObfXv28Q2zmOmotic-u-yMWROrpqztCiR9q28ZrDjBFc>
X-ME-Proxy-Cause: dmFkZTE+WwUgTuhZ2nzPZll+5Ah43fS038CZn0JVBdoDxLdBIrf6sxasJG3xkgrPmZmn4S
    HSz2okafCVJ1UU1wacBv64F4E4AzJqa09Wmid+lUqrRFlVxtQq5+o9SKZQkBVDS8p2U0Xe
    ZkCVuL+d8f+2xvCMm3tYEEqqf9pbWbzbyxUylQj/AkyYsjmOO+eA/IcWRTNeZ3/SEMN/63
    BRKYQhYRrQZ36bwzTVQb0yzoz6qjb2pLS2DVKRr9EfCvuuFP5kfxAv/DhodSQSQK5WcTcT
    Q98csWRayBVKvHWUbdoa5rjo55vzsfCKSVcrxQgzoSIyi3L0Nx/xi2bdx6o6e3zrGca3jd
    qMN7jcmH97a0BGjwQgNvzFUwHwjK7NyjQwXb1eOa7QiaA1LWe4HZdNyqEG9RGQsId2ewYp
    sJtojqacXOn7DegbHl+c5dm//Xiol1oBYzekMNb+zvdVEZ+TGi/vh4YifLjOz+Sr031+XU
    xp5INLx8XqJcWp3oqE/JWo55Pxv0mjgIsr317yMNKsFT88ez4dLYZ6fmITIB75BNr7kesL
    ENUES6w9SddiCBsm18RmZOu69ZYJqAdBVo/59AILBbJD97kQ3v0YQ8eeakYszncABuVusA
    MnxtTmhjQ4hQlt/KVdIHEiyzJX8MaUF4DPy1gJAZHFxTuu3x3Ncm50HpwQEA
X-ME-Proxy: <xmx:MUjKap_lO5Jvkt0XXg630MQAcs8mUah5St7s-Xc_OQnY8g8IQMgqxw>
    <xmx:MUjKaipU7rEH2vVmznbM6JxoQgfIXzTIilnb5w5lK12hb_Rge8J4Ow>
    <xmx:MUjKarTBT2aLbgQW4oUoz6SoqJelhb55zBuJPQu0kHLeCyWFJ9eqEQ>
    <xmx:MUjKatPnjvP79VNggcDZPrKOeUVkhuhGiP2IrxlW2QIN6RyzlGJv7Q>
    <xmx:M0jKau0LLNEyKw5bAbR5ZuLzklBYbtsT-Lg4v4-X7M682hqR_OJ0lhYL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0308532A008E; Sat, 10 Oct 2026 10:14:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AV9a5Jwtb8Lw
Date: Sat, 10 Oct 2026 16:13:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
In-Reply-To: <20261010130024.177503-6-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-6-ghahramani.navid@gmail.com>
Subject: Re: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026, at 14:59, Navid Ghahremani wrote:
> Support the dual Cortex-A9 platform, second-CPU startup through
> bootloader SRAM and CPU hotplug. Keep existing ZX297520V3 support
> intact.
>=20
> +ARM/ZTE ZX279128S SOC SUPPORT
> +M:	Navid Ghahremani <ghahramani.navid@gmail.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscriber=
s)
> +S:	Maintained
...
>  ARM/ZTE ZX29 SOC SUPPORT
>  M:	Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscriber=
s)

Hi Navid,

Since this is really the same platform, I would expect to have a single
maintainer or team of maintainers. Since Stefan is already established
here, I would ask you to work with him first on reviewing the code and
deciding how the two of you split the responsibilities going forward,
but I don't think that having two separate platforms with separate
maintainers is going to work.

     Arnd
