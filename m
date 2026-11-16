Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869722;
	b=i0x7C8NWkgiBVDhyBSc1zUKhlPorHUGnt6Gq2X9g+Bz/1xXw5WsoF0rJ63rDtQGTqMle
	 YJupObY3VMPqPNz/MPEnJI6Phor2SLzdWCvN8CRmoOjx7nAa9S3T/AknBqvuWWEqA54Mf
	 JvHmTpm6Xjl0MgAqcFCdaX0VBIBElUkx10W2rrRQjTmy6OnW4t73XSbapWY5dbbG0FJhH
	 s9PxnZEKptHyLRP7ZiqGUMHEPP/ddYhOA1D/ZMnTnJEAfysLhwQXWNfvwvXh0YDfidBtv
	 J4sjBTNV0ZNq3NmWFO0RL5JWzajGl/In4KOkNVuwOpA28H62sr5wY9/tTP1Xdogcpww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869722;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6ILmD6WJ5SOGZ9tLOSg8rzTcRhAmn9GqK1te8apL6CI=;
	b=hKaJIxdNa+dF/tqIFZgEodMaMVxK9AvZ+gpxn3+vxk0MaubEi4tKb2HvuWTz3Wae07cM
	 zyXwp7wR28ZB1Uu4Q5KpYt57tyGnFIAnAjK//M7M32sxUNI/VDnWfQ3AkWkZtdcv+sHFn
	 gfK6rzDiYP5zSg+lfjtcBfteYNxzWQrj2rIlXArLdHcpx9iPyNllIPzvdWGncPt/4bH7r
	 NSr91ZAdFxAYO7uBiZumD+rW4ilyUJ+7Rz3Dlncb9Y4XxNlfsP2TrArtcZz39a32DT5s4
	 z9F7b+3I5rzgF3o1SiXaQQ1zWF505dvGASbFHSXPW4ud3oq4u8NGz6QMebc1QvKihJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrhOs93A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC15606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrhOs93A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5177E1F000C4;
	Mon, 16 Nov 2026 22:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869722;
	bh=6ILmD6WJ5SOGZ9tLOSg8rzTcRhAmn9GqK1te8apL6CI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MrhOs93A5dYEPQhPF0rndRJAdi3y2zw4CblfveLXP+xsOTdjq1u7iVPfMV/I5NeCk
	 jVhdc+Jn/llPDfXSJ8Iw3ce1/7huVxbADAKaGTxhuEvzbYXtSvp2SR7TWXAvBYjKkj
	 2VS7TuMu6NnR0nLqfcpCedo/V6GrYI1XA6d2rmi5azeE6X3g6u5mASHaaNE1jlKibR
	 8WNLpmmjS5JYLLhyqzlk+T4ziy6V0/vpgTX/IiJhDSFj1FijUcgMqQ5UD9u0EKB6z0
	 ghMnIgTz8PdbDfLt6PaNfgCwEPTSZACjy56n1x12PI9L3NUnLpisuRj9oQaNwvtt9M
	 aDVm/x3ocnw4w==
Message-ID: <sashiko-outbox-217820@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-1-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-1-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:55:21 +0000
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
- [High] arm64: dts: qcom: username handle used in Signed-off-by and
  Author fields
--

commit 200bfc01220f58fe7a2271ce6cb6b0cc0d743227
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add flash LED
>
> Add a node for the camera flash LED found on the Xperia 10 III
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
As reported by Bjorn Andersson on v2 [1], the Author and Signed-off-by
fields use the single-word handle "erebion" instead of a real human name,
which does not satisfy the Developer's Certificate of Origin requirements
in Documentation/process/submitting-patches.rst.

[1] https://lore.kernel.org/r/arnF0u2F9ipfnNP-@zenbook

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D1
