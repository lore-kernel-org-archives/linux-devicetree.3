Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533545;
	b=kIi33jXrrAS6S9JqZrPumE5OtEEDRJb8Knb5RuZWGuiUQYiMs/wcylBNX1WiqCwdQnI0
	 pGSaebDnXFvr/7+BAkovIpuq9jfA7AL/eRLaWusP3cRyZRA+6mZq8W9r1byUBrMEcudvr
	 LTDOQb1KDXPz/vT15PsZwDDCqHLNx8pvvNAFfv8bx97Nu3XCClT50tlbNNXWEDbxLGDHU
	 +iXcQgNbjOooaz2UqDZs9EQOo84MkJpboLCHu50Vae1FsVMOl5LLFVnU8aoDJU7n8m7if
	 k4fO+v/tJN9J/5wr5WAA04QADvQ/baYzoJtq+Dz0Yqnr8Edk7Ur0176LctDQno+Vr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533545;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9y2sacLsjlr5JpUq2MRW6Y8Zll0tkKJ8pUYb8ltDrck=;
	b=SSQcM/eux12Ul+s8uKgpFCD+2aBkCDaZTLzBhzS0Lxuq8lkDgs1qzKlct67lDT7uXNWw
	 /YnsT/pG7E5+iSVvTCLRom65tvMKXwK6kT1gLtAybWAVc0dAHrtYlI8S9ifWwsDil8m5S
	 6BfqLjrS7qLMYGcob04ENDGJYftMaqlp7ZhwPe+GlHGxaJNO2/gMiwLTUkjEvoiQGKH2c
	 oXl0fvP/t7b0OOQ4OsM8mzof7mYUZEm0J764+UcJ4ZBRZBDpOHyasDeAispcS06qyUFqU
	 IenS3J0mc0bdX6kX9Bbn3KuPu2yApYUXW1v+x1dv5sEGtfhyLzwkXReyDOFqwxM5QPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNw4+UDN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C063606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNw4+UDN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96A51F000C5;
	Fri, 13 Nov 2026 01:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533544;
	bh=9y2sacLsjlr5JpUq2MRW6Y8Zll0tkKJ8pUYb8ltDrck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YNw4+UDNC9017JsHNlLemRe7oQMrIp58SE2uOANCmw2Tjk+p2IUc+YrfJUgpHrWaF
	 IE4djgPYPBg1/t6ZfUAINTtmRvv22Is//IA9ssZP6KFjfoRm9xh+Ku+wqFqO8MMu6N
	 g2/AWcxapA0gmm1u2/1vZH9Cmsdgs/BfK70xvITKqYs7v8Amlx+JiptvPdL9Hp4IHu
	 RC78YdilCdyyB1KPUvwn6nW/y5WWKuIIgf1tsLbydaAT35uKThDjTs8QGfBAky6kmu
	 L+0eSYdlWg2n2naDAsI88UL2VJVvtvOXwvEOq3x9tVfgLFxFgUgaRNdMSUdqCxN9DY
	 BePKZx+TC442A==
Message-ID: <sashiko-outbox-212062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-1-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-1-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:32:24 +0000
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

commit 9d995ddc664157d72483c0a7caa443b691f53025
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add flash LED
>
> Add a node for the camera flash LED found on the Xperia 10 III
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
As reported by Bjorn Andersson on v2 [1], the Author and Signed-off-by
fields use a single-word handle ("erebion") rather than a full real
name, which does not satisfy the Developer's Certificate of Origin
requirements in Documentation/process/submitting-patches.rst.

[1] https://lore.kernel.org/r/arnF0u2F9ipfnNP-@zenbook

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D1
