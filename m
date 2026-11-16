Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870695;
	b=jJj7A5ik+7om9UotzyZlsho28L5vAQX+Dnu5WEhiTHSSO5NPrZYSw21ZcNYCoUGTt6hY
	 Qec287HcG0563i1VM+sAkBxzzn6PoM757TE9ax/afs5cx+mLMMZYBjdbJNIDBnFdJL7aw
	 rukGxeyzrmZCe7ahppFf4pmUlJsZdcBcGrNoTsoBg+jj9Dvtn+20p7fDKPhWQGWy4cLyt
	 CBsvEoAE6biZ/4s50Su47ygQpSBeqTPlTbXaWzPHUdsZ7/EeWVuQPZkZLWGEr991F12Nk
	 h89qkgQ0ULl2flRL2bYVT2OIxle7W+ON71+W5Hc0eIkepD7cUvVmgg1UHjoDFKxFnXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870695;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k9mH2XB4VJ/aPR76VgexMnLrUk6Rb8O/7a77Qs8WdfA=;
	b=P2NnYzu7d0JgpAV7jWOEkIN1gEQ4mbnX7ClIItH0ZLoCjuxX42Bt/hdYK2NUbuANLDZu
	 rIV6EfdCVYtuQgyZbeGjU1TYuTBsAnkcmPPZtNx+f1V7v+CAuQeA2pTq5JKSZUkt4oXxQ
	 fUYUuFoeN1+kRbuVLHjhs/PGA7oVsLALMuGxgjgg6jfkv1g30umvZhP3mUpzixTVJCmU1
	 WP0sXWc0NQhUuZD3Qibeb4TUSzPIpJtzpnJfiIz/V3ZzVdhVdVwU73BD2bBFJoWcL2qdT
	 lDctepxwmL9cbPeYIKhaspwPU0PT3zPWRw1awW01z0alHQLKcX+eLuhyIGqdCOnuiCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dg7/Xeet";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D910606A333
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dg7/Xeet
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E842F1F000C4;
	Mon, 16 Nov 2026 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870695;
	bh=k9mH2XB4VJ/aPR76VgexMnLrUk6Rb8O/7a77Qs8WdfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dg7/Xeet2z+E6jr/Ho8xBqERoLEh2yPrPMoHVgkwNIvgvkDqizM/hXnfFEOxxovtx
	 u07g2cJacCjQz46S7vQaAIyR9jx3VFXy66NB4TfUoz5nsdLq3w1xt/V2xyrkF2duwb
	 N95pGp0JeG+JA0BIbCx23n2yE9mXbV2fga93Kdl0PtNk+d359qlDxSCySYilIBktN5
	 zWX4OeWvd9Y3bE38RrsocsSF+9z4oJOF97h8uj/1sO+RefgYXXf0utf++w4JsulhiU
	 PweniA2/9Upa4b9AMdZHpi6kAyq0qX/p1a03OOUKkqXCqAl2fP+3Cxj98zOPpq+fbw
	 gB3UXJNjE4BuA==
Message-ID: <sashiko-outbox-217853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/12] arm64: dts: qcom: sm6350-lena: Enable
 Bluetooth
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-5-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-5-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:11:34 +0000
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

commit 6f602bc892584af0dccb910664565f3b596a7794
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable Bluetooth
>
> Configure the required regulators for Bluetooth and enable it on the
> Xperia 10 III.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author header and Signed-off-by trailer use a single-word handle
("erebion") rather than a full human name, which does not meet the
Developer's Certificate of Origin requirements in
Documentation/process/submitting-patches.rst.

Also, the commit message says it configures the required regulators,
whereas the regulator nodes (pm6350_l11, pm6350_l7, pm6150l_l2, and
pm6150l_l10) are already defined in this file and the patch instead
configures UART1 with its pinctrl states and wires up the bluetooth child
node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D5
