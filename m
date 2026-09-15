Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504214AF9FA
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473888; cv=none; b=eHKdZW48Cvrt9aGr33TrwpB1ap5+rtz+/x8f18riTDxP9o/4q6ifMMrNCOtBNIvj2jE+tB0lhmzXECRxBFS6WD1ZJhZDAtno+Xxs1sI3YHbfI05dvka+S2x93pLjN2B1zaOui9cLUoacTxMiWHmxwNvSSIefVLkkkmOXzUDon6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473888; c=relaxed/simple;
	bh=1epU9YLJOkR+Bary5kuCyWNV7Ej7XA0y+qipCq40FxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JV/LARpj8sSSbXHGLlLtlaeEHjvmyr1eGeX+nCgprc3c5bt8+9K5j02RYqvnvr4uLuXOlJYMTq1YB7RpjbvOHRMKM9gAwwSdUuUTFM+05syRu9Qo0Uagok1KU4mNx3C5ImcUZ6SDqzrxRIEitmnmFRevmwe5mA0NURKWKgnIx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSPAo8b+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSPAo8b+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E697B1F000FF;
	Tue, 15 Sep 2026 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473887;
	bh=C5uneN+NwdqiqfRmnbiWBODVBh9MVdgg7lwgybuEVwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SSPAo8b+GcFmrJCq/zKcbFWjdsPmiS9H7XFKU4CEbURaWHEOeU6vOSqsxzXZYYT+W
	 zMnJuA93E+7VEw7S70Lg+oyBgpTlRyQeCL/tQb/wLCAXFrpqRpA55pwgYkLtv1jZiR
	 aEVLog0YIMBP71VekxuusrNZChuvaG/JHHBhJDkUvGmwnnJ7bjsh1ixL8CJsUyBiHB
	 zNKNYwm0w2efC4LoqG2LaRKOxaiobsEsjIHCPlRj7rAxLZ8IKc7h8rmHAxFNRtR+VS
	 fy52Rtwh/dTwBhqQZBpwcCjsX5dFPhAGJtmK49GhWCH6Q0b68gJ09mMsDltkuHv29J
	 09hy382cHbtqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWFydGlubyBEZWxsJ0FtYnJvZ2lv?= <tillo@tillo.ch>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915135727.567145-1-tillo@tillo.ch>
References: <20260915135727.567145-1-tillo@tillo.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:04:46 +0000
Message-Id: <20260915120446.E697B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: ramoops misconfiguration wastes memory and contradicts comm=
it intent
--

commit 1ae7641b46f058deabfa7ee4bb83a27014f13e00
Author: Martino Dell'Ambrogio <tillo@tillo.ch>
Subject: arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region

This commit reserves RAM for persistent kernel log storage via pstore/ramoo=
ps
to allow post-panic console output recovery after a warm reset. It intends =
to
reserve a 64 KiB carve-out just below the ARM Trusted Firmware secmon regio=
n.

Link: https://lore.kernel.org/all/20260915064302.1595204-1-tillo@tillo.ch/
Link: https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/
Link: https://lore.kernel.org/all/20260528093038.1945245-1-tillo@tillo.ch/

> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index 637e5567c1e08..150b794c2118d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts

[ ... ]

> +	reserved-memory {
> +		ramoops@42f00000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0 0x42f00000 0 0x100000>;
> +			no-map;
> +			record-size =3D <0x20000>;
> +			console-size =3D <0x40000>;
> +			ftrace-size =3D <0x10000>;
> +			pmsg-size =3D <0x10000>;

[Severity: Medium]
Does this block define sizes that mismatch the commit message intent?

The commit message explicitly claims to reserve exactly 64 KiB (0x10000)=20
with zone sizes of 8 KiB, 32 KiB, 8 KiB, and 8 KiB.

However, the reg property here reserves 1 MiB (0x100000) instead of 64 KiB,
and the configured zone sizes sum to 512 KiB (0x80000). Because this region
has the no-map property, it unconditionally removes 1 MiB from the system=20
memory map, wasting 960 KiB of usable RAM compared to the stated design.

Additionally, the requested sizes are scaled up (e.g., record-size is=20
128 KiB / 0x20000 rather than 8 KiB / 0x2000), leaving the second half of=20
the 1 MiB carve-out completely unused by ramoops.

> +			ecc-size =3D <16>;
> +		};
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915135727.5671=
45-1-tillo@tillo.ch?part=3D1
