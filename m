Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841030;
	b=kvuqPT6O8KkSt6MCvSELPveKbGZ0h19ZA3dy2bYJQF3PB/5Zc4NRGTctTwhQZbhoeL3x
	 WU+15cXNhGTj83VO0MyCQXqOkcdINrxk3zxy93FdZe70yPbfp+4wywBESR5IBkLUxQJGw
	 nos818GDLzgFRmms5sFyOHoH2cFEGGDcOG1zLTcGv0/v2IlyvfF7NCiqet1GqdfrgME4r
	 dD01Mlc1lWGKSkMAPsdWZ7fy/lC71XyC127OCDa0dBXsQWKuKxQ1KRTr2TXa23CzAHDql
	 UCx+7XyintH/fnM5QyhvocqxrHRxUkYck9IUHFUaYEBIn0muuw6T19wEQM17t00urlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841030;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TVpfcNVE/OZy5SPIHU/hIkn2zdfdyFe7kvpM7L+wpCQ=;
	b=fNqYWgB9WZs4GsJB0ylQ0A6/ABccYSIZJ5Hzj7qd/NUw25FqD5L1xVuzykdgbVGAIG9h
	 SHjn5C24hqvDZZ4l9s40E+93EjNF7PYRBCpy3tvLgRBkuqDnZ81RpvnUfXXs9aP+7TrPI
	 g2MhbRcqQTSVrl0vYOYYTW1QZVxwzFsgHBCaQ/yFqViUHKqyzPweWIgyrxjcSnww3qLeE
	 CsVu0HzLysJ6OQcyhew9YS7sMV7zNFR00KwlQ/Tv86rRgUZF2FMISr/SPFSk9JAjj2cIU
	 aTJBBYN0+6mR2rW7rp45QgvEuqyfhACdXblc+SdPwFh8uQcHhS2L1sN7+6lLkNxkWRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRunurm6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD29606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRunurm6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753991F000C4;
	Mon, 16 Nov 2026 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841030;
	bh=TVpfcNVE/OZy5SPIHU/hIkn2zdfdyFe7kvpM7L+wpCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IRunurm6nzSUsdIkgzy8F412/w0zkHDgbPiS6fqoTHOKdLlMYaxuotdwEWXsQASmC
	 wsLUuN6q9m36Er1I92KQWTpjgysqfjTQzPlnllSJkD1ou2dRFN+gNOqGyv3TKpQkBx
	 WKfnG63Z3g7MUmn9EwmNaDg73UOThcmQM1lSW5mK0wpy1QpPMXHu+9U2KB7ReTxRKa
	 CEHzGcDmLTcg/zd9ZYB67JfrU9vdP9HiHxOTkbgdrfEzMhKJDCjuKVT0lCvopUw/Gj
	 N8eWAIyKXOWBR7bOn+yYDF5L3E5OQs/RUuiZXSjs4RB1VR6sOtpHP8X1XWiTYGItdv
	 sUML1G6q+PpRg==
Message-ID: <sashiko-outbox-217206@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Note8
Reply-To: sashiko-reviews@lists.linux.dev
To: nhansp <nhan.094.vn@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-upstream-greatlte-dts-v1-2-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
 <20261116-upstream-greatlte-dts-v1-2-768d49fb7d85@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 14:57:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: exynos: Signed-off-by and Author use handle instead
  of real name
--

commit 8021703a8198c1194682fa663237169e91d9a877
Author: nhansp <nhan.094.vn@gmail.com>

> arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
>
> Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
> from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
> 8895 SoC and a 1440x2960 Super AMOLED display.
>
> This initial device tree enables SimpleFB, PSTORE and GPIO keys.
>
> Signed-off-by: nhansp <nhan.094.vn@gmail.com>

[Severity: High]
Both the Author header and the Signed-off-by trailer use the single-word
handle "nhansp".  Per Documentation/process/submitting-patches.rst, the
Developer's Certificate of Origin requires a known identity using a real
full name rather than a handle or pseudonym.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-upstream-g=
reatlte-dts-v1-0-768d49fb7d85@gmail.com?part=3D2
