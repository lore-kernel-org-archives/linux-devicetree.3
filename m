Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771153;
	b=ueTdH6hqACoddwk+0otJD4IGVwRXpMtmgoZDl/lWlKmpe6rjFUObIPBGKgn2mIE8N67H
	 hgglRGW/YNm4zm6TlvzC4sdmi8ykMNCrjqWRvTx/PGpK//s012ilmA5LE1Nb/pA3g5YbN
	 DmvQ1jWIqf88G90TTfn4ytwBUGpw2UKUTVBjcKYbj1PiPywPy5KCJBNuLrA/ddyou9qlV
	 nxGNz6Wf+sMYQB2ucoyZU8aud4aHRPGmLY9fxgg/Ky+Q7wMu+8ftRAibb+4iQuDUL+HY2
	 5ME5dLjvqPsp881inNlbDSVVKsxu+UdCw1R+eqpAgKy4uVvuvmUbs/RN57v95pIOSJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XtZeL6hkJAHt8GsuhHRr0iFwvWt6NJP0WUvktsYOWp4=;
	b=4QzuAaxmquT7iZ1ts0EPEOLZqjet2de+5lcwlmFIzZPwyFSdrFBozjNLUYYZc9ydeiri
	 WjhATltwae9bFq2vyIIXDBO5CyH7WiKyoUqQXetJXYS3TEm4QlaaF47hXqtkScfPFiy3R
	 NDuy318YCrLtpD+pQ+Ko+ugoXn+eKGnEtBmsl37F7QDeCrmeK40lpQE9VS+/jZolG5q4t
	 Qh7M+G7bSnMBAvZq1DYBa0trhyCvVMSLMPyWG9fe8zrhPwU9ApjbJlumyEbrLwQuiBXYe
	 v3J+Flie/feCaggcHPA2n/iANCIhLc17TYVoyjybyl49fJl3m6MqVbKj/RpNOnYWJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSULg84N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA7606A89A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSULg84N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DA41F000C4;
	Sun, 15 Nov 2026 19:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794771153;
	bh=XtZeL6hkJAHt8GsuhHRr0iFwvWt6NJP0WUvktsYOWp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSULg84NQvN9VQg3Ht29fB2vOHcprHs+sBtHmGHXMfXZ9TQZst0YZPJO8yyCX1+im
	 JXbBEhTLwA3PaGafjNifOw3MWsQtvkpjTqJKmJBJ8msFE13e/JcwtfCc3BJPj6AtX0
	 UKl8TzVoqNsUfC7jkIcPQkxVP19EuB9Bw6CxhFw2ABn9YygwqSVJwdms5YCQX9YvOP
	 JHyk2EIME7YD/RHKFAy6z0W3oyWkAtY6v1OnkDzy+dnKH1UgIPhGSvQ2jtwISSBV5N
	 VUVh5tYWK9wBR2cFEGVWnwaFi3/Zj0npbxnAYzCXwlfb7kxoBe4UCSrC2OfBaxHnLj
	 MSmofhdCxLfwA==
Message-ID: <sashiko-outbox-215748@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] mips: dts: Connect the EcoNet EN751221 intc to
 IP2-IP6
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshat Singh" <automobilehacks@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115-en751221-intc-all-lines-v1-3-dc03a40f47f0@gmail.com>
References: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
 <20261115-en751221-intc-all-lines-v1-3-dc03a40f47f0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 19:32:32 +0000
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
- [Low] mips: dts: econet: missing Fixes trailer for EN751221 intc
  interrupt lines fix
--

commit ef45b82519d1615a5175bd08b37ea85f1395050e
Author: Akshat Singh <automobilehacks@gmail.com>

> mips: dts: Connect the EcoNet EN751221 intc to IP2-IP6
>
> The interrupt controller presents the number of the pending interrupt
> plus one, in binary, on the CPU interrupt lines IP2-IP7. Without VEIC,
> chaining it to IP2 alone leaves the odd-numbered interrupts, such as the
> QDMA, xHCI and the first PCIe port, waiting for an even-numbered one to
> run the handler.
>
> List IP2-IP6. IP7 is left out: the CPU can also signal its own timer on
> it, and only hwirq 31, which is unused, needs it.
>
> Signed-off-by: Akshat Singh <automobilehacks@gmail.com>

[Severity: Low]
This fixes interrupt delivery for odd-numbered interrupts on the EN751221
in non-VEIC mode.  Should this include:

  Fixes: 0ec488700972 ("mips: dts: Add EcoNet DTS with EN751221 and SmartFi=
ber XP8421-B board")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-en751221-i=
ntc-all-lines-v1-0-dc03a40f47f0@gmail.com?part=3D3
