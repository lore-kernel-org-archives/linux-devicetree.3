Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3914E4333
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775098; cv=none; b=tyUsusL+btW7nfoyt8bw+4m5v5CvX4PUEJdTViMx2aqrzlji/BeqsUoGrS9t7c5drDDzSpDDnZWFm6e6z252+pKrYAdEX3VTcRmUCICnmyoNZchsGPGcEeL4JxB9TiPdu0TCw0M6hdUeKuUy3TkwIpdX8JCqMf+Y9dmuQXbtl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775098; c=relaxed/simple;
	bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLVbBh8QycmuPCWDrgQe9CyykELR8SkPp6Jt2EtVu33MTob01Lsq2hGF1aU5om7VmKw30QUk8gv/ciRa2InCcYkTyotHk1g0kcS277pKDjfK8jNeRH4j1XYGODzXRWaJsDmArS+RdHLG7RhngLrfI2v0ktOWVvUsLXZJ1CTiYTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYOfnDeg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYOfnDeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3841F0089C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775089;
	bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DYOfnDeg98pIK7T/72t2R+Avlri5Dv1BeOAYrCAWC/Kf9a0liTJhpC2zQQ0Dvv2s8
	 KxixrrzeIjOuEl4GJZO51qVSw+MSq5SOvLt9ZT8rQoVf7Yc5AtyLqagZUKg8/JTf2A
	 xx24H+7iNKa3AAI57N4ZeqhH2eMp/LoIbNiCT1jfCR2dfJ3BPMnd7f8v4URTlpqsNd
	 Ypgtieg6HMVK8m5oWoV9QCG8sU2AakPUGhqzqO4YsNU/+70MjrdepxGslcntjGJeUz
	 VwBRt+AzX4jHVlZD29p2ReRzJ7MFQw80JuTEWpKClMLRd7MFrOgS680Ne5r+xuvlIi
	 hhWPE2PIZLzbA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a771ad2a9aso6752091fa.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLkVeNPpRGI3tOTe1SC7yIT/p5J6TbJ74dHjc0QtiAIn7BRzY9VVIIYW66N6S9XxrJ5LniiTQK3cfZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJm2OpDWGnbdwPiCt8kSadvwh33Hl4wDr3ZMul20VpRB9r0S/hI
	T897WU4rAv/0xyw+bXNOJGaqAhKWt41HLCRRX/pmoHSlfaW6RtCD6TWBF1Fv3RnomJ9ui+6X4Bc
	NlLfwpPTWINUE2+EPrJa+BBMj8bObiq4=
X-Received: by 2002:a05:651c:2121:b0:3a5:a1f1:ac2e with SMTP id
 38308e7fff4ca-3a77920036fmr5378151fa.11.1790775087724; Wed, 30 Sep 2026
 06:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918143846.30458-1-linux@fw-web.de> <20260918143846.30458-2-linux@fw-web.de>
In-Reply-To: <20260918143846.30458-2-linux@fw-web.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:31:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
X-Gm-Features: AclHuK9hmbqqQ-iAhBFOSqKzQS-M6vgJ1tGQehJYCcgvkhZw-sBpo6gT2urSL00
Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names
 for i2c-to-gpio chip
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:39=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Add line-names for the PCA9555 i2c to gpio expander to have more
> information in debugfs.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
