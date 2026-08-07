Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F562C15B0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110470; cv=none; b=tydXO6eF01HJR1qy2xyBS9U9v7cejvzunwpuIa0IPnDkU/fTgbeEyilJueK+dgktmKqmwVjSjvqdC+qQ6KeXjPpyrQLDO9NOdJgJRSIZlURocjOJVOjt763+sL/7yni+DqdMHjGQRL2Xo400ib/EvM+a9DntAvP9mWEvJskF6Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110470; c=relaxed/simple;
	bh=M7sKdeBMxBBbhlhPjNkIxve3tVdakyazFX4js55erzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=doyNRpw8m5+yqim1euppa5FmwnPN31LK06tOn8Z5eI0Gw7pTQXoRKKdpEv0Cc5LHBeu3+EcPXHbe1PXCyCdUUy+Bvo+B/WIOv6L6qA+iy90+OQaDoqiD1KyOr1io5NtXNcF4JDz/lzQx3E38Fn2ojowG1gnMll3ZiKfP4rPsOHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WW+q6xW2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WW+q6xW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930E81F00A3A;
	Fri,  7 Aug 2026 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110462;
	bh=3jAm0zh5F0fcGfX9bHvtN4/kX1CdwBGr7tBKfzWuEZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WW+q6xW2HdkXJb4xj3dQIkpK3TyjfWtBIhfFTRepZUvPcCZ04RdghNmqw2jqRuni4
	 x1s2I1ynPCbCE7/qlBrPa28xKPJLAKl571LfsVOWwkNt+mHh3SU0d8AgI7Q8gQxmgM
	 cj/HnnzkPwlL3BDee1zdkuKXklFn3g9qsPEmc+Y2LQ7E3imzN5oxJIbI5Szec9ay+Q
	 2qMninHJfqV7YJEf5eBSc7AClq/9018oQP+wqeHahD1C16qY2Pe2mKNlJrlWc/uZLH
	 xSG5APDsNknhxCBpT5MqULt/cefs7YWmARs4/jHb/0FQwI5+ma1KviUsBv6PJH9mXX
	 txSuJ9GQydTIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-19-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-19-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:47:40 +0000
Message-Id: <20260807134741.930E81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The arm64 defconfig loses support for MAX96712/MAX96724 hardware=
 because the replacement driver (CONFIG_VIDEO_MAX96724) is not enabled.
--

--- Patch [19]: [PATCH v15 19/22] arm64: defconfig: disable deprecated MAX9=
6712 driver ---
commit 20e07e4ca371980348da7922e6ddc12b0da43b35
Author: Cosmin Tanislav <demonsingur@gmail.com>

arm64: defconfig: disable deprecated MAX96712 driver

This commit removes the deprecated staging MAX96712 driver from the arm64
defconfig as its functionality has moved to the MAX96724 driver.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98e..e0bdfffd9c525 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1420,7 +1420,6 @@ CONFIG_GREYBUS=3Dm
>  CONFIG_GREYBUS_BEAGLEPLAY=3Dm
>  CONFIG_STAGING=3Dy
>  CONFIG_STAGING_MEDIA=3Dy
> -CONFIG_VIDEO_MAX96712=3Dm

[Severity: Medium]
Since the functionality was moved to the MAX96724 driver as noted in the
commit message, should CONFIG_VIDEO_MAX96724=3Dm be added here to maintain
out-of-the-box hardware support? Without it, the defconfig drops support
for this hardware entirely.

>  CONFIG_VIDEO_MESON_VDEC=3Dm
>  CONFIG_SND_BCM2835=3Dm
>  CONFIG_CHROME_PLATFORMS=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D19
