Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C652D3A93
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697257; cv=none; b=ZMCc+Q3g8Mb/amMvJqJwoFhPxUHyayHeZrnRWCk44P8a4fucGwEWtk8uxXuUbQr9pe5cYKuq9MMFWWOnRRUADhRy/BFqv91gAPbc4URNRKTNC6jDQLi80tJO+HH0rNeVbNqvz07MupmH7ZdE8PwlXJ10YW14v2CgFWbFTU+eOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697257; c=relaxed/simple;
	bh=zlVhxZrlB1D6v2jaiwur+Qc6DOX20bQ4Kcn1ou+Q8Wo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XdwaU+7nztxCUlMahdMSzqBPaiOxIjMF5yJpAb+gEW6J6qboZOPiezzlXaHwIOgifMJCrzeU3qwSZWqseMR+4BkMIatxA9hug4m4MFK/xNNFUqr1iEaoPd6u5Wv9uPILvoX1f3uo8PYL1dQHw1zGeaWPA7/RMzhbZpPl+j3NRh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ox2tV6Cf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ox2tV6Cf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833DB1F000E9;
	Tue, 25 Aug 2026 22:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697255;
	bh=/U26UxgTBE0UiVlynhW5ium4qP1OQQ1NQbA/ruvW0CM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ox2tV6CfW/EvIRTpsLLO100TUeF3ytufRN7Zghm3Q1qV14N307kSLcJaPMHs6XxfQ
	 4bUKZ2+ZV8sLC7S2FhcJzv0hO5XNPlg+6eJo57Ua2A6DQPLWBMBoRpEAB56d88mdtC
	 hecrU+UDtd2effgk91hOzoBpkiY9Rmz3ZHLyTZcmTmFFO/gbQsl+WQ4TTNLDgEGY0S
	 u5u4ieuGpGip/KKZcZAEOIITbD7jlhhuvLZZjEeILiuCjqkG88AQ5ti0IEFIItO7PV
	 nO7TF6ymtngS2S4Xq3uUfUgrDFbnJDFzSLJmfQT33x1en5UIYJflKJQ3feXa8iHmU+
	 PTQC0BkGPlsCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 17/19] Documentation: ioctl: add CMH ioctl
 documentation and register 'J'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825221539.255951-18-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-18-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:34:15 +0000
Message-Id: <20260825223415.833DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch introduces a massive vendor-specific UAPI for standard c=
ryptographic algorithms (RSA, ECDSA, ML-KEM, ML-DSA, etc.) and key manageme=
nt, bypassing the standard Linux kernel Crypto API and Keys subsystems.
--

commit 46b4cfa2c3a26b48cc446eeae37ca79f94c3f4db
Author: Alex Ousherovitch <aousherovitch@rambus.com>

Documentation: ioctl: add CMH ioctl documentation and register 'J'

This commit adds documentation for the Rambus CryptoManager Hub (CMH) ioctl
interface, covering key management and cryptographic operations. It also
registers the 'J' ioctl magic number for the driver.

> diff --git a/Documentation/userspace-api/ioctl/cmh_mgmt.rst b/Documentati=
on/userspace-api/ioctl/cmh_mgmt.rst
> new file mode 100644
> index 0000000000000..c02bac1287874
> --- /dev/null
> +++ b/Documentation/userspace-api/ioctl/cmh_mgmt.rst
[ ... ]
> +Relationship to the in-kernel crypto API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The main reason these operations are exposed as ioctls, rather than
> +through the standard in-kernel crypto API, is the CMH datastore key
> +model: an ioctl can operate on a *datastore-referenced* (hardware-held)
> +key, identified only by a ``ref`` or CID, whose raw bytes the CPU never
> +sees.  The standard crypto API cannot express this -- every

[Severity: High]
Does introducing a bespoke ioctl interface for standard cryptographic
algorithms (RSA, ECDSA, ML-KEM, ML-DSA, etc.) fracture the kernel UAPI
ecosystem?

Instead of integrating hardware-bound keys into the existing Key Retention
Service and Crypto API/AF_ALG, which allows user-space tools to transparent=
ly
support new hardware, this locks the kernel into maintaining an immutable,
vendor-specific ABI forever.

Is it possible to integrate these operations using existing core kernel
abstractions rather than creating a massive vendor-specific UAPI?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D17
