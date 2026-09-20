Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F553D47B2
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881332; cv=none; b=uYDtpVcbgtJ46cMbZSQIXTNJuz0/T8mm5YHmtvGfWMLVkO+dvIDLZdZ7YG/g4XbUxemr1zPHeHNuU9LAHB7xwFSxJZWCIU0+UxdB4XHh4GpPoGGqtsZGdoQgROl1wlb9ujEb16w5peugykzNOOX6RFMZmpxBUMzkhOHEZMM9RIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881332; c=relaxed/simple;
	bh=WJHPr0X/7zNduQhV5lEixRMfZBGXIYMtHm8lvyOQRHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pZtfb9YBkU1iWfcTcjJcQ2rElSEAUtNcsgm4RgLUkL7joU06CSjWBY1Fsmw10L8rfK6DyrHZInmJj/jpAKrppJOrwA1X97QQSCg9BUhgWxOHpZixBMn93GF93cepdKpPDjeA0xUxCpVMGJ/RH/yAnclUIWlNIN9q1mJDJbMEN6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTwLz+Oe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTwLz+Oe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10E21F000FF;
	Sun, 20 Sep 2026 05:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881329;
	bh=KFnCnRiTvPIcQ5L3kCSP92XE0FFf/veMG4lzqhT+Wo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iTwLz+OeZ5GsLqnIYFxtZnf4TtSIKNd758tqBPecQgbNVNOTbVr1jE72QuRn1o0d3
	 C6IhRKKTXJsENbz+2n48e+A5e3psrHXv8yNU03ZphMovUvo8DmYl33nT8tjTUslfRL
	 1opaR0nfcokdmK+72bs5E5vvDvJRyflSmaR+8eD30hFRjgF1CjEeq1ODgATeb1xsmF
	 k7Qiu3bzWeNnuFQAdpPD6qnh66qOTUkeuQTejU9RZK5qkps7JuKF4/UI+zom9IhNTq
	 l6JkOqX/UZvGvQynQRusVhvdtLHo+ZI6VZgzxuxz1CKDjJKY1shWRLY/YRMad3FAtN
	 IGGzOIsNTlKKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 28/28] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920-macaudio-v1-28-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-28-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:15:28 +0000
Message-Id: <20260920051528.D10E21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: apple: incorrect sound card model string for Mac mini J474s
--

commit 633b43ef406edcf6e9ee9884c46d686b36ff8900
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t602x-j47x: Add speaker/headset jack nodes

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/=
dts/apple/t6020-j474s.dts
> index e3c2635d84fad..e79315b15f114 100644
> --- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
> +++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> @@ -46,4 +46,9 @@ &pcie0 {
>  			<0x300 &pcie0_dart_3 1 1>;
>  };
> =20
> +&sound {
> +	compatible =3D "apple,j474-macaudio", "apple,j473-macaudio", "apple,mac=
audio";
> +	model =3D "Mac Studio J473";

[Severity: Medium]
Does this set the correct ALSA sound card name for the M2 Pro Mac mini
(J474s)?

The DT model property inside the &sound node defines the card name used by
ALSA Use Case Manager (UCM) to load the audio routing profile. Supplying
"Mac Studio J473" here means userspace might attempt to load a Mac Studio
profile instead of the Mac mini profile, which could break out-of-the-box
sound on this device.

> +};
> +
>  #include "hwmon-mini.dtsi"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D28
