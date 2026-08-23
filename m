Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271C6328635
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 08:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787474556; cv=none; b=gkdY+W+t+36pzMKp1Wry/X9Z2FBPVlVUm4V94EkEY6eGRTmJD6E7doEcGWlt/5xN8vF+a7T6k9JKHaP9sEVdb1yXpIpZNHZNSI5CaaKKsF+oP8CIWrMqMDz9ZYmgDICw6YcEmJi1wTciuN9fzXyuBa/ha/XYCOPBTz3FSoH2vzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787474556; c=relaxed/simple;
	bh=U5NZ21QdG4CJ6dVyOaHlza3ICBoAwBoENCUhgyqClsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jx8cFn80ThKkXfiDDZYzX4esATyLqTCdklYsPR72mgDMRWNjretb7sCJAb11sQ+IMAI68kcdnSIX0Btv7EWgAvlIExt7cVHiR91RvOMYDTB3eDF92BJoc9J7GwLBUHscYsqNYld/3HGkYvNitD2AfZFYiEmvlWYr8jO8++Jx32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMq4Guzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMq4Guzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A1A1F000E9;
	Sun, 23 Aug 2026 08:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787474554;
	bh=yGdQbRiAz6GQheijHnrK4uc5aKlhUYXwYAsGkIrvkwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cMq4GuztyrkaEV65erWxVedkAg9pdgghtkt9WioWPRWK2oEvW16OTinOvgedWJtSj
	 VNZq4fip5vhG/idktP9F8tiHsYaP/YLAVexOAsPenH9eCbnvoxIgR8gEF6bTy5FVu5
	 E6qZbgy9PzSryZrejN45ccGGS+9eYyPlQzmt80p2OqmSn9nk49roctsb0/kAPzMGoQ
	 r7t/z7Le9rMVfesDIVD4J8/84YVfTrNDL/AhgPpMye00x0wHcKI6m1UyYwT1TTQ01N
	 HLumhvt1J5z5QKVIoh30Xn2haC1rK0V++/3m7vWhz02+aYynW7irwxZ+jXzt5q1no3
	 ZjDWCMt8F+Kmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 enable DisplayPort audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
 <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 08:42:33 +0000
Message-Id: <20260823084234.73A1A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete cleanup: `&rxmacro` remains explicitly enabled despit=
e being unused.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock: =
enable DisplayPort audio ---
commit 4708a7e8e11918bde7eb54762cd3ee403e70ce86
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

arm64: dts: qcom: sc8280xp-microsoft-blackrock: enable DisplayPort audio

This commit replaces the unused codec nodes, SoundWire controllers, and LPA=
SS
macros with DisplayPort DAI links. This enables audio over DP connectors
since the device has no built-in speakers or headphone jack.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/=
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> index 4f4b5f4285ec2..a94141d670f62 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts

[ ... ]

> @@ -858,17 +835,17 @@ &rxmacro {

[Severity: Medium]
Since the other LPASS macros like txmacro, vamacro, and wsamacro are being
removed in this patch, should rxmacro be removed here as well?

It appears the &rxmacro node remains explicitly enabled (status =3D "okay")
even though it is no longer referenced by the &sound DAI links. This causes
the kernel to probe the driver and unnecessarily claim resources like clocks
and power domains for an unconnected hardware block.

> =20
>  &sound {
>  	compatible =3D "qcom,sc8280xp-sndcard";
> -	model =3D "microsoft/blackrock";
> +	model =3D "SC8280XP-MICROSOFT-BLACKROCK";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823-blackrock-=
audio-v1-0-f319387fc6a6@oldschoolsolutions.biz?part=3D1
