Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B72ECD3A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786071; cv=none; b=pUQa5H0AwX6fF3jo1WClDYoGHXaeUqTVNowtdfjvVckeiKAqb19Uj0ngbZiv5vEhKNDNt0db1iX+8B2qDm+FFx6wD7GT9v0Cc+nhimIFvlRqbi3Vk1NxeIThMgwZpCrjKtHiR94IvSqVI9UQTV9k3uhcx43kFpGCAh4TqyNQWt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786071; c=relaxed/simple;
	bh=d/XTvh++ZoVpS7u6HViOmvDD1iqZ9qdptFqdjezHOPQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SvHT42UOEWLi7dLjA/gAcy95OoA5rQpM89AgOMurdtqbIDavaKKzXBgRZvxPLzrGKN/LDT6wrMYD+8QNOLXT+gW4iB9bJTHARF0zjgXfkbi9sDJr4SbDylDABkJ6zGZgl4N2kDyNqCJUS09yR7ExVcjBDFFQ+HcqZH1Ks5nHsVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkWGGHeO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkWGGHeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34E21F000E9;
	Tue, 26 May 2026 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786070;
	bh=a8/mZDWg8lAWNyqLHZzmXiC9XhbVjEZnjJMT4quTgn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AkWGGHeOhf6fZ38TToyusK87N8QSXpqD1a7eG1e6G2qlTxDf8CSKGqKOtJSUFIDLO
	 v3nGT+nHyvo/aofAUXNgWR9PIEdjg9kokFx4j9NcqAUG5JedjNes5fM/zlRGToUr21
	 p8btisyEv4IeOjYNmCzEHv1CU2wN3QWWD6MPsZmNuGAHfE6/1udaaWh99yvs7bcpEx
	 CW1HN77rEETetrHSNW3BAoKO7DSOJ8cStwax0Uz8RmXB36Vr6YPAhtNoFZMOJp9vA/
	 5nKhYrIJ1sFVr27n6n/nRHEDQHXgoqsGPcz3FgmXdIVAwi/GPExIi8o7WvJZgfNb18
	 876BmYCyXmFiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 1/6] firmware: meson: sm: Add video
 firmware loading SMC call
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-1-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-1-33bc817f93f4@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:01:09 +0000
Message-Id: <20260526090109.B34E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The identifier `SM_LOAD_VIDEO_FW` is used in the `gxbb_chip.cmd` ar=
ray but is never defined, resulting in a build failure ('undeclared identif=
ier'). The fix is found later in the series in commit 7da77dd38d2ea56fe7b57=
e246847b5cd118fd85e ('firmware: meson: sm: video firmware loading via secur=
e monitor').
--

commit 087141e411e53f403ab8bf5aa5ca58a00cc95fd4
Author: Zhentao Guo <zhentao.guo@amlogic.com>

firmware: meson: sm: Add video firmware loading SMC call

This commit adds the SM_LOAD_VIDEO_FW command to the gxbb_chip command table
to support loading video firmware.

> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/m=
eson_sm.c
> index 3ab67aaa9e5da..5da6c65d684a0 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -47,6 +47,7 @@ static const struct meson_sm_chip gxbb_chip =3D {
>  		CMD(SM_GET_CHIP_ID,	0x82000044),
>  		CMD(SM_A1_PWRC_SET,	0x82000093),
>  		CMD(SM_A1_PWRC_GET,	0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,	0xb200000f),

[Severity: Low]
Does this code compile on its own? It appears that SM_LOAD_VIDEO_FW is used
here but is not declared yet.

While this is resolved later in the series by commit
7da77dd38d2ea56fe7b57e246847b5cd118fd85e (firmware: meson: sm: video
firmware loading via secure monitor), each patch in a series needs to
compile successfully on its own to maintain bisectability.

>  		{ /* sentinel */ },
>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-b4-s4-vdec=
-upstream-v5-0-33bc817f93f4@amlogic.com?part=3D1
