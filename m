Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869808;
	b=mE6NKGnnMnOKPJldTZa36khCkKHuesW9QnFe0NQ6Y1a9PYlw3rlERqKKN+sosaVziX7F
	 TgwxrOM3H5lEzKazysJ+GRxyaTJ47CHjg3DXEysQrV/bJ2DiEHK4zB5wSyad70AA+B7Xw
	 VONBIlVCvEp6++mVp6phAkgUsk+kA8sOU411UsjjkRO5TH7FFt+S8cj6RLRf/OgV5/84t
	 WyQzc32RgiE4dVG+i7XlHHDItvQdv9kXuFWcnjZXRE+dDS9o2+QIN9xgXdM0RZdRSYJVx
	 +OREJhBGhOzeGqCvVDghDsnrsRkDR0MJNP5N0P414oNrp8KA6YNLnkRj4mYMTEX4n6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869808;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=06M6HxmxXCU1LMfcTdMASF41o20ftyzynlk79luknW4=;
	b=eh5iirvpV9cUm+seKqI5PBDgXmoL81GyI5FRzEGtRRx/870xQ21FA/itK4Btim/3nw2W
	 38WvRuTxVdvrFay9aQ9hYz+UhAUnfpg0cLXulKURolB/vwMc4FMcXotPXwopS8TnPu7B9
	 yzqDAcf6WkNjmNi7GTnaBZcKZgFL6p03i2ryOFgm2buaR5snflIl8jjDJZZHvt2STWusu
	 I0LILWsS+ELgP09jpnyTI24Gb9+PhfGqfz8sjqKf1DhO/96MNKvFE9wAjccCnzSzOfTl8
	 N6+N+A3qjorPuhIQUgpZn2bESq3h5HBIfLM95K45Kh2Benjgg97tDwf/0iYYAWkxS4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrENpHxa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C10606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrENpHxa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFF61F000C4;
	Mon, 16 Nov 2026 22:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869808;
	bh=06M6HxmxXCU1LMfcTdMASF41o20ftyzynlk79luknW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MrENpHxaFcwU+n0h7tqUu0qZFVtOIsBUcX1Ea4QTaL/BsZ00QZqYAYNK5aIBa1+ju
	 u3roa4BpGdG7cafsQ/gq32I127morF8CzQTj5vKuVGwf6W9FideS+BrL5JjRQmVw/y
	 aGY1hB5YfygPMwpYPxSFwD3/lTpBY/q3fnMKWJ4F7MprL6Y85EuWHdgwBKgBS44m8a
	 /e3yWB5bMY1/uMvxhYxz2Pt0mg5f3Si0FNIx7JyT8r4Y6cVQVVsEO0urMVh2fCz839
	 Yz4ezoUpu1iI0qgc7Gu+mOACxPFIr8r2f4gYSlaHL2biRZ/0huiVf03Ux2F7MLNBND
	 9bDjfw0P0ZUew==
Message-ID: <sashiko-outbox-217826@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:56:47 +0000
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
- [High] arm64: dts: qcom: Signed-off-by uses handle erebion instead of
  real name
--

commit 1d93b9305fce0e29369cefb160a67dae64e8d0d8
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP, IPA & MPSS
>
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author and Signed-off-by lines use the handle "erebion" rather than a
real name, which does not meet the Developer's Certificate of Origin
requirements in Documentation/process/submitting-patches.rst.  Could this
be updated to use a full legal name?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D4
