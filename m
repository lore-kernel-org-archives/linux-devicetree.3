Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B1947CC6C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756492; cv=none; b=DmJ/EzdAXOOTHHh6iBYbb1GLs4DEnfLkYcnhPNVAusxtjJQGHpDW0pREIiCara2nBD9XVaxgnbW9FR4lX5aVojJLRgtApEKl7xkXI8L90APTrFNxcFtl+JS2YSm2xqKNfazx3LmBbY3kxjcEObLOAxpStu35yDEBYW99xtZEVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756492; c=relaxed/simple;
	bh=HNeIgQ61GLVgdfWnttBSpoEg+q2oVNry+lvbgYOudfU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GYqvSyeCRBPOBx6NxmtEc9hoG7GEhBNkXGB4o+mQQ5lAwdCR/Ate0GJfK+nOYJLxkDRgbh1hE/gkcY0hMDP+FPUDSgBoY4EYX7ji8SKqBNI7FYWhEUMMURRpGWg7J3uXi4QfrOlbM0mq4Oz2mYyuht1kEQNz9eBxnLMTB7P88DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6o6Qh3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6o6Qh3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2A51F000FF;
	Fri, 18 Sep 2026 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756484;
	bh=ComFw1yPe4bmHNTtfpN79ciGz0N1Xa7CeH9UpdyKo8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B6o6Qh3tDlNtgMUBKLVsbRq2/caEkVaBEt+huaURAXuyeTDlcCu+25993Cy2AT6JR
	 u3TjIFbfMyeCF49q7z888+RU82MbvsAVFyuMpQNTO17xrhYotkjD5Fc9mKZijzEMZR
	 RtTVcOFdL3ELiC/VaxgxhzVRxOUasJ6dVwuhKxm85gb8G58bhmf/PBQjTsr12yZuAy
	 1VogHmOOznUNEcHXCdtr6iotZhFxdVK9MECwhc5hTaajKxP7f5enNEl6Ibyf4mT4eC
	 7oHoR87f0JkPnTrDJpkAwZZmHXxJi6pT1QHUMnm8IUh/R+84/uH+rWGUlm1Iu1sT0E
	 unQXbXQuoHfbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/8] dt-bindings: iio: add Open Sensor Fusion device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <499ecb38dc0b58b979ca1f38d2d30b4ef56cf825.1789753020.git.kimjinseob88@gmail.com>
References: <cover.1789753020.git.kimjinseob88@gmail.com>
 <499ecb38dc0b58b979ca1f38d2d30b4ef56cf825.1789753020.git.kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 18:34:43 +0000
Message-Id: <20260918183444.4B2A51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: generic compatible string without hardware identity
--

commit 3fe2d4345189668d8fcaa5a3baad45cea6d48946
Author: Jinseob Kim <kimjinseob88@gmail.com>

dt-bindings: iio: add Open Sensor Fusion device

This commit adds a binding for the generic Open Sensor Fusion host interfac=
e.
It defines a generic protocol stream over which capabilities and sensor
channels are discovered at runtime, intentionally omitting the specific
product identity (OSF GREEN) from the compatible string.

> diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.y=
aml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> new file mode 100644
> index 0000000000000..3998390828cc0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: opensensorfusion,osf

[Severity: Medium]
Does restricting the compatible string to this single generic protocol value
prevent the kernel from handling future hardware-specific quirks, power
sequencing requirements, or errata?

The commit message explicitly states that the product identity (OSF GREEN)
was intentionally omitted. Device Tree principles generally require
describing the specific hardware rather than just the generic software
protocol.

Would it be better to require a hardware-specific compatible string here
alongside the generic one, to ensure the binding can accommodate variations
in future silicon?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789753020.gi=
t.kimjinseob88@gmail.com?part=3D1
