Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05C0376A0D
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963203; cv=none; b=feSjJiZS8uTAfsrVTqBXlVZkyvbKMGjgOWwZ7FMQ5ULWUuIQtvjRp6MMJJRvmmR+1qZ2IJGyOucoVxZ4XssFAcue7oP75mzAdMWfPi4AWOnOU1CiBAwQkUkBArMWrE75y/eATSZ+z1DCP/qx4uRJJ13xhJTDU31U2HzDx4J7yqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963203; c=relaxed/simple;
	bh=Wq4LKcjXbWVb03Alobz8at0kmkxMPFq/pqpfvKV1TdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cOZAZvifHFXNx1G5K0LJRJsktFdRva3M9d8g3mtQ/bkvdNF6w5PZwSs+KezQIKuHZ8splrUCSKUtZ+FWEQYipK0TXWJPyzv+uKBcDyY8dhfASvHgp5AOEzX7uZLtqFRuVkHSdLeOTl3jU1eM0zAmJ03i8Kk4pVfDona/2K3rf0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxvK0ZZL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxvK0ZZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8821F000E9;
	Thu, 28 May 2026 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779963201;
	bh=431mO+1IUnOxJUKp+ViKNR+9hOLqxx7HEGeI3l9pb04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RxvK0ZZL0Bvooz8ZBKILZGYPHxLpITry0fAMrsYppplwzml6H+TJUEEXUROsqv+pp
	 UMbSn8OBhH02cVnXLjUc9Mig+m6S/kL1Av0ybcj9mZiOM0iHaKmuWvlzeTVWOzXdJ8
	 P7foAzF95HFzlsdcp7ONcczxanrX5D3Nps9vJDLy+x2Xk398nGkI+DW/oMkwyOtAic
	 /dwRu8aQaib68SphvOIHlULyz8zxnje8gpmMqxvD38QinnItesbM9mg75HdRwrZ768
	 P5E3urttJDJcPDt6kImUHjyEPniB3URQ4wBXrV2sltzIZK9NkpWtcBlMQ6fHy817Qa
	 9f43V8e50240A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add
 ramoops region
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWFydGlubyBEZWxsJ0FtYnJvZ2lv?= <tillo@tillo.ch>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260528092807.1936177-1-tillo@tillo.ch>
References: <20260528092807.1936177-1-tillo@tillo.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 10:13:20 +0000
Message-Id: <20260528101321.0D8821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `ramoops` reserved-memory node is missing the `no-map` propert=
y, which causes an architecture violation on arm64 due to mismatched memory=
 attributes.
- [High] The `ramoops` memory partitioning and ECC configuration severely m=
isinterpret the subsystem bindings, contradicting the commit message's clai=
ms and failing to provide the intended ECC protection.
--

commit 9de1ef047c96e12c7b888c596f5eb04dcab13d7d
Author: Martino Dell'Ambrogio <tillo@tillo.ch>

arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region

Reserve 1 MiB of RAM for persistent kernel log storage via pstore/ramoops.
This preserves console output and oops dumps across warm resets. The carve-=
out
is placed just below the ARM Trusted Firmware secmon region.

> The record sizes (128 KiB kmsg records, 256 KiB rolling console, 64 KiB
> ftrace, 64 KiB pmsg) sum to 512 KiB; the remainder of the 1 MiB carve-out
> is used for the ECC parity blocks (ecc-size=3D16, one Reed-Solomon block =
per
> record) which significantly improves dump readability when the panic path
> truncates writes mid-record.

[Severity: High]
Does the ramoops driver allocate ECC memory from the remaining space in the
carve-out as described here?

Looking at ramoops_probe() in fs/pstore/ram.c, the remaining space for oops
records is calculated as the total size minus the console, ftrace, and pmsg
sizes (1024 - 256 - 64 - 64 =3D 640 KiB). The subsystem then divides this
remaining space by the record-size (128 KiB) to create 5 separate kmsg
records, rather than a single record.

Furthermore, persistent_ram_new() carves the ECC parity blocks from within
the allocated size of each individual record. This amounts to roughly 14 KiB
of ECC per record, instead of the 512 KiB of dedicated ECC parity blocks
mentioned above.

> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/=
arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

[ ... ]

> +&{/reserved-memory} {
> +	ramoops@42f00000 {
> +		compatible =3D "ramoops";

[Severity: High]
Does this node need the no-map property?

Without no-map, this 1 MiB carve-out remains in the kernel's linear mapping
where it is mapped as Normal Cacheable memory. The ramoops driver remaps th=
is
region using vmap() with a default mem-type of 0 (Write-Combine, translating
to Normal Non-Cacheable on arm64).

Mapping the same physical memory with conflicting cache attributes is an
architectural violation on arm64 and can lead to cache incoherency. Dirty
cache lines from the linear map could evict and overwrite the panic logs
written via the non-cacheable mapping.

> +		reg =3D <0 0x42f00000 0 0x100000>;
> +		record-size =3D <0x20000>;
> +		console-size =3D <0x40000>;
> +		ftrace-size =3D <0x10000>;
> +		pmsg-size =3D <0x10000>;
> +		ecc-size =3D <16>;
> +	};
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528092807.1936=
177-1-tillo@tillo.ch?part=3D1
