Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840985;
	b=0n2Zkyg7bPrGnqAH1n3P3i2FHE6NhVn2lKL5y7QSXueD4ahghIE+woAoyFPNoAvyGpzG
	 b98LlsRpVS3VbeRB5+OEvSL96Qse/fXDut5dNNwXcQTsmpD3xTuvaLECGXJVOz2fucd2a
	 2VY0ah66jEX89UqMbo6WVTbnl+yn9u+TXBwWVLM7FugphSMOFybmo16KbjHPdnEp7snlx
	 v3otDigrGHInFxtGiMejW7Nv5Z2q2qFwR8C2TutPgZzyeIJDcgQ7j/uziEGJ6R8WptU4r
	 yjmyCFQYsCXGPoPsi3pE0E3abFt2zAOcfBLGaykZOQdttTAjD9nww6sJmEp34kRcHbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840985;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LEHxsLARVYbvUYiMg3ANNuSVt2WEB+5+aJRpLTjb+hE=;
	b=l8YIQ4wMbtqYlJKtPb4YAC0/hk1V0+4aNJNXkIdKjq6A14YjhXLp7YUu5pdK6dLYnX4Z
	 fmqWCUL1SSK2EmrodPiFdsXWovI3eLh7Am/MsNO8yZOirHnKbuIapT5gskNz89pkduZ+D
	 ObPxH1TGeq6T1Y8q9gahicqJWvjQW6t79cSieh/TCEBuZznMa1kvUASGM0KDlI1Q+Nmui
	 VE8NLxJ2T7fndwogtqCmjTqPqiXoqg7b8dLLXD9W9Xey5CAKTPgdeVDdKTdNMhWrNUwmM
	 i8y+leXcmQ920/+ybhg2Mtb22m5qexDN0w3rTS43EOesPLcY5mZ+dvTR3jsRCCQ83mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C3RIrNPH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C806606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C3RIrNPH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BED81F000C4;
	Mon, 16 Nov 2026 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840984;
	bh=LEHxsLARVYbvUYiMg3ANNuSVt2WEB+5+aJRpLTjb+hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3RIrNPHCjKBJOGwrnutJxEpRlG2oA7dX1d25h/j2sW1m4TdY/Vvzoh1IrqdnPOWA
	 hwCLuISPulaDjOWfXIdU/XjxMSbo+BK/oPLL+ZYhlEZzUNJh5WAUJW7J99Dt66fi1k
	 UP4mQSQ8Qjq+hhCuPmrjNzuQguNWC3RYS/NjFvJCoQ862a37QeEd0dGoHIgvs5/yDG
	 zZ3VSwOE6GrhrW4wChX46s/XtNvch/Hx1xtALkIzFwpzYidZg/Il9XyCllgOyDBN9k
	 SzAd8BGAi/iZLv1jTHEuyL3YxQpJ4OJmk1jBsGEngmIai7U5DnafNedjYs71HR1TFs
	 JY0yC9FRj1ebA==
Message-ID: <sashiko-outbox-217205@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: nhansp <nhan.094.vn@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-upstream-greatlte-dts-v1-1-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
 <20261116-upstream-greatlte-dts-v1-1-768d49fb7d85@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 14:56:24 +0000
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
- [High] dt-bindings: arm: samsung: Signed-off-by uses handle instead of
  real name
--

commit 4517a49b2a0b8deb5681a06d92dd878703c2461c
Author: nhansp <nhan.094.vn@gmail.com>

> dt-bindings: arm: samsung: Document greatlte board binding
>
> Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
> greatlte, which is based on the Exynos 8895 SoC.
>
> Signed-off-by: nhansp <nhan.094.vn@gmail.com>

[Severity: High]
The Author header and Signed-off-by trailer use a handle (nhansp) instead
of a full real human name, which does not meet the Developer's Certificate
of Origin requirements in Documentation/process/submitting-patches.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-upstream-g=
reatlte-dts-v1-0-768d49fb7d85@gmail.com?part=3D1
