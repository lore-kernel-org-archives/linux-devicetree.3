Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9A30EF7B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809092; cv=none; b=uOtLE7tvBL5FBCllng1Q3rVUHcmfiZGjq84sS3HJ83foYE3SuWC8ToeI+1F7XPzi74D25bLqYM7llrvFm7/q5Mx8dTUC0zmDqpmTWw6VLbUGDL875J5/Pe5NMRz8ZXReRc9ca5DoX/WGeyl7p//eFe8fXaax20U4+GN7LhlsWls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809092; c=relaxed/simple;
	bh=0GNSbn98x1gG7h1PzakUbcrIAs9Vvl2GYzx1u6WVISY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PeQeRPejk5hyMmpDpUlZn0ipjg/ifFRfsjCyDbf853rgtrAjquFvSyNU/+a/mGdjvaNaGRT4UguOcBjNoV+9EYhWL9KWb6fRA0BKxJ0KkXNHf4CehHfR9cNWV7h2WC/2q6DrT6di70J7aCD9JWlBdqUzpqN0rzkg2jVxR3qyQQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2RfHixj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2RfHixj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BB31F000E9;
	Tue, 26 May 2026 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809091;
	bh=tzvXEDKewHZFDlDK9x5Y+W2NPwBogWPBvXFY8RK9vAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2RfHixjPn4KdelXfsKxqmTsQOkrwkoEHgBtYI7m6I5Cibe9+ekf1XvtoWEJCehZI
	 g9cIrbHe+97WtsgTRls9JpVCrRBFFdRjDW48w/VUmTFVlFMLIOXy8uCZ1RjYF8spQi
	 phl+ZUMw7ZctlQiD7u4+ZSkaJdRMTp1QI1qUt77Uy9S/Xc1A3rYSHBfEOHrjSLN897
	 SbPoeYQZLp5gR6F4DCz58nTsF6k1I/NZHDc8sbXkJPhWms4MyuPt/8gkG7p9c1qWJc
	 Hltm5VsGJ9uyaUTK5gXF5x2Z4/2dG6ftoKVz+E0iGqVRzt2MPuJu9RH1vRuK7MljLj
	 wBfbxgMqvdv7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/8] media: qcom: venus: add codec blacklist
 mechanism
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-msm8939-venus-rfc-v9-4-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-4-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 15:24:50 +0000
Message-Id: <20260526152451.08BB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The newly introduced codec blacklist mechanism is silently bypas=
sed and ignored for newer HFI platforms (V4, V6).

Pre-existing issues:
- [High] Unmapped firmware codecs cause a fatal probe failure instead of be=
ing gracefully skipped.
--

commit 940596b130019709f06d3571e5a70d611a9c2f28
Author: Erikas Bitovtas <xerikasxx@gmail.com>

media: qcom: venus: add codec blacklist mechanism

This commit introduces dec_codec_blacklist and enc_codec_blacklist
properties to allow disabling different codecs per Venus device. It updates
parse_codecs() to apply these blacklists instead of checking the HFI versio=
n.

> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index a87e8afb23dfb..bd88e2b484a53 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
[ ... ]
> @@ -178,6 +179,8 @@ static void venus_sys_error_handler(struct work_struc=
t *work)
>  static u32 to_v4l2_codec_type(u32 codec)
>  {
>  	switch (codec) {
> +	case HFI_VIDEO_CODEC_HEVC:
> +		return V4L2_PIX_FMT_HEVC;

[Severity: High]
This is a pre-existing issue, but does an unmapped firmware codec cause a
fatal probe failure instead of being gracefully skipped?

If a codec bit is set by the firmware but is not explicitly mapped in
to_v4l2_codec_type() (such as HFI_VIDEO_CODEC_SPARK if it were not explicit=
ly
blacklisted), it hits the default case and returns 0.

This 0 is then passed to hfi_session_init(), which converts it back to code=
c=3D0.
pkt_session_init() correctly rejects codec=3D0 with -EINVAL. This error is
unconditionally propagated up to venus_probe(), causing the entire device p=
robe
to fail and the driver to become unusable.

Should unknown codecs simply be skipped instead?

[ ... ]
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/med=
ia/platform/qcom/venus/hfi_parser.c
> index 92765f9c88730..8e762cf77968b 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, vo=
id *data)
>  	core->dec_codecs =3D codecs->dec_codecs;
>  	core->enc_codecs =3D codecs->enc_codecs;
> =20
> -	if (IS_V1(core)) {
> -		core->dec_codecs &=3D ~HFI_VIDEO_CODEC_HEVC;
> -		core->dec_codecs &=3D ~HFI_VIDEO_CODEC_SPARK;
> -		core->enc_codecs &=3D ~HFI_VIDEO_CODEC_HEVC;
> -	}
> +	if (core->res->dec_codec_blacklist)
> +		core->dec_codecs &=3D ~core->res->dec_codec_blacklist;

[Severity: Medium]
Will this newly introduced codec blacklist mechanism be silently bypassed a=
nd
ignored for newer HFI platforms like V4 and V6?

For newer platforms, hfi_platform_parser() directly sets the codecs from
hardcoded driver capabilities and returns 0. This causes hfi_parser() to re=
turn
early and skip the entire firmware parsing loop where parse_codecs() reside=
s.

If a V4 or V6 device is configured with these blacklists, they appear to be
completely ignored.

> +
> +	if (core->res->enc_codec_blacklist)
> +		core->enc_codecs &=3D ~core->res->enc_codec_blacklist;
> =20
>  	return sizeof(*codecs);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-msm8939-ve=
nus-rfc-v9-0-bb1069f3fe02@gmail.com?part=3D4
