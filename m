Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870086;
	b=kMK2DLLIqyBy6tcBEAPzgiI70nOj2wHumLyx6NdWuC6/yIp58W6G54GtZlo+GBFyqPQo
	 rIonCOsFEh/L73Z9B81ndjoEVhs441XLFBDHRgYSK3MRAWpDqZ5xWhZWW5dVVYRL5byGB
	 HWMMVUYpD6/puSvLDczuiRmwRJCf/0HGD/MUEt2vcrfRm/G2t/XZysOujV5TPHvki+To3
	 guA2OF0fQjn4ygLHxdz3YUZ4z0g//mlffAg3USbHcVPNs7ez7T/UfcanvE2DPxIRkrizF
	 2NU+8bqq6gHPggpzmvKvBQ3yqf1+htfnLNm5pUp4cJPGZuwc0rVbueDo1gtxyuSHjEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870086;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8tc6jN4g7OSP88WbM7d+wPupEtt6JwuDiM5fSzoOlE8=;
	b=TrWdvYVLpEp2F39yV+otI7fnqzLSWOU1AdLb1fKCROA0XrdYn462yH1AEpkcSaTMCKrW
	 oqfsJ3pbXZlOVWuC4PrHuTFTqk6V4E9DG+S3eLHC3MWA6GRmMhY5ej83r0pugun7ghI+j
	 zD4vvFaHGbT+peM9KltiLV4DhVru+HTPwVZXmTh6pi5IbQ2pDez3YmlVMjoFd605X9wsO
	 EUKFD8W7VTQl32SZJpi32ZTWCpnbw2N25h7YyEmGHYgW00d9+yTcN7jcMoBGMKpY7Xa5c
	 6GCySzbyn//QSH8+OVVVBQ0kNJshIxBkIZWPqISU2gVUz2ACCS601NQWWTs7k0meZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I17tR/ta";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC153606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I17tR/ta
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448001F000C9;
	Mon, 16 Nov 2026 23:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870086;
	bh=8tc6jN4g7OSP88WbM7d+wPupEtt6JwuDiM5fSzoOlE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I17tR/taHKzrmrXSBN9S2WM2OQzj/g1vNI9Xi338vlQYmgDZOGTEK0eFfD1mQhy5q
	 p9GAqnxWWG0i6NN+XbEqx9olsbRJF4nFAk3yXvUd+A6dlY+UCpDdDf+Jk4jb7wwGp8
	 KmD9SUo8Dpw3lAUmtr8f2RrKrBQmE3kbcV3HT9sSzQoFqYNjxbJItv4PAbLKg1UnD7
	 ReBMaE76c1bUzB9crzwansMa/gTTr6CEt80QM5qH+/qr1Y766N7lgZtEu9VorUKNcZ
	 qhOXmICr7z/hPpuO9duQovRHk2JcaoNcdZ1fYZGhZxVsfmkc81zobt40b/AcF5aNVU
	 R6KwpH3Xc02QQ==
Message-ID: <sashiko-outbox-217835@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:01:25 +0000
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
- [High] arm64: dts: qcom: invalid handle in Signed-off-by trailer
--

commit 653bcdb19432d3b2792a7f5615a893fd67bfe22e
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable PMK8350
>
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
>
> The phone has two PMICs which have a PON block, disable the PMK8350
>  PON and keep the PM6350 PON, as only one should be enabled.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Per Documentation/process/submitting-patches.rst, the Developer's
Certificate of Origin requires a real human name in the Author header
and Signed-off-by trailer rather than a single-word handle or username.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D8
