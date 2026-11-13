Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533381;
	b=KWtK+Y/ZQieRjKvJa90+QcNuwEMcqKiBQWDW/Mb4bynt317xRedQCYMX+mpDqX7FS12o
	 /QPHLdl7KFdFAqk7gunxooHh8eJS65g6ukGBUZlK1HqZujGExAnaBMzpy7FenG/jj6rPG
	 VQQYtX/U2xJv/SVSvBtwaxL+6cwdGcApxah/YVwYqxFf+SsJjdKiG6rxDaUkegdvIY23S
	 zFqIWtDWcQuaYoLscMpf2e75EY/G8tNxxQ4FT2uGK5bzwcZTswIKZgY+Vp+MlS8j/KxRK
	 J47MT7362vSVfrhTs8SAuvqQgqbqfUmRUnEp6CfI1sIlSJ2MN/EOzbHZVmBflto6nrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qbsYeeiLbyQOTRSDakpkIbCYrFVqKgt7jDsatt2o3OE=;
	b=5WTTue6IjqlIiMq+GoLFIV2li7+kNyiUl5+j6xGze7x4+KSTAcwy17YMZPu7219ILJ3E
	 rxyZgNNYvinnh2XcPUaVRXq9Addo3xyHBkzKZvi0i+G1moqgeumjAX60/jVdxXWqnlhuP
	 FQ5KN930h+17n6niZouOWIXKHQaWrS6H/HwtD8wxBFn/DG35neN7AHtIg4YK4gxraZNyn
	 YlwLFfZgw0EQBSOK5tzopY5ZEZS117uRuB6jLnQqd+4GUlWIof4zBYoo+OeuWk0c+0K8u
	 v+zQh7OgEM9ByeooPE6Gus1Qz6YP6zElclPsBRmqF5VGKGS6SinIaN2oi33sLgoPmOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXeSsEu4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04FB606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXeSsEu4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7DD1F000C5;
	Fri, 13 Nov 2026 01:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533381;
	bh=qbsYeeiLbyQOTRSDakpkIbCYrFVqKgt7jDsatt2o3OE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXeSsEu4BV1Yz/j2nuWNjcC2BzLU5ajQB4ZAJW6nAbTFqlqhwlL8sR8g+2FfOzCDU
	 Cf0e4XSgqAdeq710W3QjU6ndvCE8LYjybIHB7RDfH1RQUfFzM2x5DyZoOJUV6cwhZL
	 7r9GWkyF9w8rnbwvVzOYmrs33w/MdlaIUuERma/1yOZuCMlY1vNwGCqoWiZn1fC0Oa
	 /ZUpwIThDmnCsRK/LTL7jwwoXCCUwEw8mEWosozGNoWpE7Kv7UaO/dwPz0YLhO6Ez/
	 nX0+eqTvCs3L9wpZuS567OZH/VOZM3wsHAo31JPXv3ZKY3BirY5TAcujqbkoegPHm1
	 6O4i8Skipuw0w==
Message-ID: <sashiko-outbox-212056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/12] arm64: dts: qcom: sm6350-lena: Enable wifi
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-6-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-6-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:29:40 +0000
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
- [High] arm64: dts: qcom: Signed-off-by and Author use handle instead
  of real name
--

commit 24a3b1f3ecac1502767c6ab922369282c14e2622
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable wifi
>
> Configure regulators and enable it for the Xperia 10 III
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Both the Author header and the Signed-off-by trailer use the single-word
handle "erebion".  The Developer's Certificate of Origin in
Documentation/process/submitting-patches.rst requires a full real name
rather than a pseudonym or handle, so both fields need to be updated to
use a real name.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D6
