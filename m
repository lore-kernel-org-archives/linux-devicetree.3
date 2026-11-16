Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870153;
	b=nSVespSDSohbtfRaSF+mxw2LAUyVQZpbUwJRpEOnfWDCEXKRRXUe0Ik8b9exPWWXyLLH
	 m2+GcvQ0acxXrZy3vROcXl4w7em3VPM66zjE/qgsw1BEqi34mr4VL/qOJe3hdUVAaBdww
	 1Ph/09b/OSslYQ3iE98XaZuOdJBAvPXDO6g5ag9m8hwIXHm49ke1YNnwJHhL7OUm46qbJ
	 VWlm9O43SShxtFsY3t3JXPEAkE8dvXtjmEhxnI02099RBCqeqkA5HGfdoL2H6+luSf9Qz
	 7dk79oR9uSHmsAZEm1/tzW11GwpIf9Ctn5n79a8udy9qi8uBlVFNACXIVsHR8Gg3MMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f3o26bIzfyne16hL8JnKeMhCi5MH3p/6srBSWEJzAhg=;
	b=48Jpxt68CpBMVNk96EBn6qN5RUIQFTibPGs8Uyt+4dOtv+jMfzPA1kBBwDyGnSttQFue
	 qioASHJGtE6AUpjZrThfmtN2wzoEPwfTpwkmsiNCgFuhUVp8L4sWgobscXJ+YCD9gU3rq
	 iuB57Z5xJx1HJBEmSzAiIQNLQZVNsDuErMaqbyPMw8S8uPyKYx1InKjppolXxT5PsOOH9
	 UWyFkf1SRTnJvYBT+o7fXPzx6wCUHTqPs8u7MbCRPMGoIxMGOcWQGmsYv8EuS71MAX6Vk
	 SpJoEAdVoxds+DkxUfPel6uW5VL/Dfc11Y3oTQTAnvDohlRgyQJ4kQz0HOQjOeaIPfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPijFNvz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7E606A882
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPijFNvz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E421F000C4;
	Mon, 16 Nov 2026 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870153;
	bh=f3o26bIzfyne16hL8JnKeMhCi5MH3p/6srBSWEJzAhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPijFNvz1K2MUzLKGrPdRh0Fe0yA4j0QJdazTblb2lHDwZVh/bPVNCW+V/YEWSzRj
	 uID6jUEgLOi+bovlXyus0RYTYLqFROesu6dNnl6Jm/+nHY0MiLc9YsJfZS6uabqFg3
	 7/aTOLSYzV1Mn8SF1WNKu/rCRUg+O+pryNE7E/3nEyj+ko2ji/58pNceudTS6hABIJ
	 h8lJrqcEQeu7ogTvFJaK3AHTB2iK8fo6yLk2JosWyKjx0v/oQrmXzKwMS5fF9IXM2G
	 M9x+apwoUH7wANTtmkx5mexKY3iW6Cmx9mCkBJPQsLiPjDQlPAW0XNK7SSIYB9FHHL
	 1UWxMlnKblB5A==
Message-ID: <sashiko-outbox-217837@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-11-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-11-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:02:32 +0000
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
- [High] arm64: dts: qcom: sm6350-lena: handle used in Author and
  Signed-off-by
--

commit d20fc6eadec7147c231c438c85d32c1e09b43db8
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add PM6150L thermals
>
> Configure the thermals for the PA_THERM1, MSM_THERM, PA_THERM0,
> CAM_FLASH_THERM and QUIET_THERM thermistors connected to
> PM6150L.
>
> Due to hardware constraints we can only register 4 zones with
> pm6150l_adc_tm, the other 2 we can register via generic-adc-thermal.
>
> RFC_CAM_THERM is intentionally omitted for now and will have to be
> added once it is clear how it should be added.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Both the commit Author and the Signed-off-by trailer use the handle
"erebion" instead of a real human name, which does not meet the
Developer's Certificate of Origin requirements in
Documentation/process/submitting-patches.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D11
