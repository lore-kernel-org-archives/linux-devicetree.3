Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563773F54C5
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 13:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194840; cv=none; b=DPzzpTHyVPFlJNNIb45X00dN7ahVUYoy0l55tQrYct2g69hST/ai7KjYT/B0Q8A10RG/ARVJ9Hz2lgtQ3ENzjMvxeW/Gv8hhsVGqdW24KHHLLFKSsVNR3ars/UB5X1vIPyKJPcYZIIeuc9ugsMEapGwrUoVRr4G4gBXYXUHwBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194840; c=relaxed/simple;
	bh=5zj5cVny3HN6fWRY81qPYH+gMaDunYylU1xaHHlRBWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cgMuHAOB8csjorM9eO8mw8Fmv5Kmlsdiw6t767sur9RH2du3R6xzdRIIsOEs9tRoiKyi9BRpsOl2vhmNnXw6L5HgFnQW39ntyHhJD9EtbNcJS2uh7B2baK4BhkfgOLA9nA9Bk9m+qbI+rWnrBJLTzn+z+5NHsg/J05vL7HkTSXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zlju881Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zlju881Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192E51F000E9;
	Sat,  8 Aug 2026 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786194839;
	bh=bL+zCfpMIb0g6lu/T6HgnlbrfMnERSA1fpAQRfGxc7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zlju881ZsmSkjGI6YUVZ6CKiPUupM5D/cqN8r7SmLCyUakfgrqckMHV8QWp5iKsqh
	 xxTsepyfAJaX3hwdZcWcd3Y4EU6afKdnqlR90xOA3IartJtGiIXIQgvrDWc37HmCCt
	 2UOH7v57iFdobMdG5Bsm3tdoFBzu2ZiRqsaTkSuZEAvHgJ1yCOLraVUZSWJ9pp6AR+
	 SNMFJYuR+EqCtKLRvJpUgNPBrOnSeLYPzJq57ijUmC3iPq+TQQtMp3Sw65FOfKcYOr
	 3V43m/u0h3kswzE1Aen25n0vw4CD24KY1QqBhuwq81PQApg9dDVP93CTSdoPdnGY3T
	 Kp6gVX8+5KzCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 12/12] net: airoha: add phylink support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807131301.192060-13-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 13:13:58 +0000
Message-Id: <20260808131359.192E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] NET_AIROHA unconditionally selects PCS_AIROHA, which leads to an=
 unmet dependency warning on COMPILE_TEST when ACPI and OF are disabled.
--

--- Patch [12]: [PATCH net-next v11 12/12] net: airoha: add phylink support=
 ---
commit 60178eed84d4f34367e6ce74cdedc61c17f52abb
Author: Christian Marangi <ansuelsmth@gmail.com>

net: airoha: add phylink support

This commit adds phylink support for GDM ports in the Airoha ethernet
driver, configuring GDM1 for internal interface mode and GDM2/3/4 for
external PHY or SFP cage operation via PCS. It also updates ethtool link
ksettings to use phylink.

> diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/a=
iroha/Kconfig
> index 1f6640a15fc94..5c54a07d2a768 100644
> --- a/drivers/net/ethernet/airoha/Kconfig
> +++ b/drivers/net/ethernet/airoha/Kconfig
> @@ -20,6 +20,8 @@ config NET_AIROHA
>  	depends on NET_DSA || !NET_DSA
>  	select NET_AIROHA_NPU
>  	select PAGE_POOL
> +	select PCS_AIROHA

[Severity: Medium]
Does selecting PCS_AIROHA here create an unmet dependency warning under
COMPILE_TEST? PCS_AIROHA selects FWNODE_PCS, which depends on ACPI || OF.
Since NET_AIROHA unconditionally selects PCS_AIROHA without inheriting the
ACPI || OF dependency, can this cause a Kconfig warning and potential
build failures when both are disabled?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807131301.1920=
60-1-ansuelsmth@gmail.com?part=3D12
