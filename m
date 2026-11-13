Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533341;
	b=TCj/PvXTYeI8R7N12v/0hUYGUm4FqKgQLEpfOiuv3LrArugFTpgEVT6g/Ju7u4Vgqe3N
	 bqIXniM4p6dsZb/ga377VVSmYoxZo2TjvhCgJXOismUnudBL0WAFBAdfHGgX2Qxkj3A/7
	 +qZGO47ph/eyEzSQpIXU9srr0kE8s0Aj5XGm8tpz9ewdhjXG41tmrPxPPcr+cNQLT/5aA
	 XfbVPrCfBwkHo3Hf1Qp7IHEOzgKKUYFAfNdkwKLc601NM/mS8XlkgdvPA4BQ/ZZZGfq02
	 zU0c4SDjBhHrPnPAF3+8jBx7y2SwPE/0lZHZuBMDPKt4prhrxYcr2ClA919aK5w4nGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533341;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gE7e4FF5yMDLgn26rdIlGJVy1D3mQODC6XJ5Rlg3uh0=;
	b=GQ8RHOZUYgbz+6/R5YZSN5qDmQ0OrFzpHOpOswetiEkC2lrLfrw9zcxxTW++AQrnYt8W
	 4xJyQXg6mWszVpgPFZAYW4R0vTis6BBqyzGTtf+ZxhEESLxNVQrYeGrfrIJ3+ghe8DqUX
	 LdLj7qx/Vq844DUnEy9KNrZ3ANVu2iI/K76r7NQCRvKWbPAkrQLEaYBsTDlFSVSGv8qz2
	 7O6MvKVsH7CY7LEr9XNmbfs0r3y2U7+OLeCKlPV0dr1e8+mhDXe+RqMzFZdHHZ4OyE6Sc
	 yrfJQNlxwdlrP2nOQ5skjTKgl50jwfQWcp2fvNilEN1+U5znxUzkhk7P4RDGXbw9HUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRR2ojiX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC4A606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRR2ojiX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A8D1F000C4;
	Fri, 13 Nov 2026 01:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533340;
	bh=gE7e4FF5yMDLgn26rdIlGJVy1D3mQODC6XJ5Rlg3uh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WRR2ojiX9QMfZMg14kmVEXQo2mUNQ5vpFsObv1PT1JpZRBhwcuzv/cQwnN32BL1FT
	 e0rUbTD8mDGTpM+HDLOaZA0Qe5VWEFEqW5AU2j06DrDQYSW+arqkh+wirZ1Eho5UfK
	 rRrDdrW5VxA846l+rhDboanbs9lrtotKG9V77Y4dCuJGAjGGkrp4GgWSxeUXwZQOah
	 RhmoVhqv9l3Ot0DwLvxovd8Z3FkkudTCECNRreJcUsUIy1bhUwwcP9MIjN3ifoJBEP
	 b6OG4GcmdRpUy3Fk3jIKYa/lXKbC9Ge+XY9a+dWCO6nUbAwRRXSZsucloT+x+8y4SF
	 v6T6FNSxLXHOQ==
Message-ID: <sashiko-outbox-212055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-2-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-2-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:28:59 +0000
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
- [High] arm64: dts: qcom: single-word handle used in Signed-off-by
  trailer
--

commit d12bf1b1dee33b26a5800faa94f2b6f60f9599de
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: rename touch-en-regulator
>
> rename touch-en-regulator -> regulator-touch-en, to
> keep any future fixed-regulator sorted together
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Both the Author header and the Signed-off-by trailer use the single-word
handle "erebion" instead of a full real name, which does not satisfy the
Developer's Certificate of Origin requirements in
Documentation/process/submitting-patches.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D2
