Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44943CE74
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742854; cv=none; b=XdS1cDPkudSsevYMUQRNa8veY+91Jl0GSmzWcueOwX5yCUi+btptAgjqW+D5nQ31kYeixYjgXJwqSxP0uQrMxiC7EMTADzO7yvF2w3WDpSW5ZoLI7dvKb95hPhUSfZZBIrQgAs7cO+4uZVhbVqjiR6w6+1++OjEwJ2mjVCFrt14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742854; c=relaxed/simple;
	bh=usaMV1dIxfXj6MymHa2B9RrjjTnyKrAw0LZdEuuIEBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4h+MxBe8HG836cxbOw0gP8J7AJUKfdBtoU2UMkoBVUuHOD5lCSZotCriSGoLv1cYjWZ8rLO6W1I2/8dz2Hm4JpIgWAbjis/K65uU+58egPR3Wejpa9uFUWGS486hajACzek7xPsI44QErl/MkSIRFvzQ4nXBaN4CdLHQoiACT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmzq/d/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmzq/d/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1861F00A3F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784742852;
	bh=wpXWpJ/XepBYidQLS4RBKK5VuWb9g6pAC0cnJOX/glE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lmzq/d/YsVm++VKdefaHPw6n8u3G+Cz3jYzE4EbEkFxM1U05Gh4ajAdRQmCCKalIF
	 LgxaehzcXUmk30Qd3yXJYvwSn3WvN+WY3FOmGhKbeBzNx6RDGcWWtbyg0qA/k+4rMB
	 hjnjGiF53DnJ0W5XS1+tANf99npYBaCX4WSqRI/noHkO6exDliymqZcGRYcOqm+gK3
	 03maHksi5kRJwOhviXwnsiyFSDHn5qBqCezyJ0mexhNDvawjJ/GAnvv7aebfBZJuqY
	 atWo2Ad3w5mCAKFOulb8yT0vRlDOLBhoO2/EnRUG2fJIqcXgNL18DOutOzZH23dVbG
	 8InXvUW+xTlVw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15dd4b9132so36083266b.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoMKdyw7x5IChgyG8Gpu2oJp0cAwFW4Yoi7XEwe3Lp2zR1EQJbI2Lkqgb+e43LUIBtsK1Tfks6p9n5R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7scdtZXhTfWzhe8VmE2w/u7SbnOEvq4PEnNAFK0lEPo90S5BX
	OGuMMIVsw5cVHuAmOKxO6Zc0yGz81ZLxQmD/yu63r1/uUdl+lP4Ockvvk3mB3gzlnQrGo6Q3fn+
	hELG3lfAEunuEFRXmz+rf2YWhtQAqkg==
X-Received: by 2002:a17:906:478b:b0:c1c:4e00:3fe6 with SMTP id
 a640c23a62f3a-c1c4e004923mr15833966b.4.1784742851162; Wed, 22 Jul 2026
 10:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com> <20260716-tegra264-pcie-v8-2-23e51589229b@nvidia.com>
In-Reply-To: <20260716-tegra264-pcie-v8-2-23e51589229b@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Jul 2026 12:53:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpSTbJoxu6CCe_1LpG3gR=Yx5VydTKufTp13LRp5za3A@mail.gmail.com>
X-Gm-Features: AUfX_myKJ3ItLjHpG8Uc2Sapy4DnBxW0AxTenwVXA8NEdz1LrUYTCptHK5c-Gr8
Message-ID: <CAL_JsqJpSTbJoxu6CCe_1LpG3gR=Yx5VydTKufTp13LRp5za3A@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 12:07=E2=80=AFPM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Switch to using the PCIe root port bindings in preparation for using the
> standard WAKE# handling.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 40 ++++++++++++++++=
+-----
>  1 file changed, 32 insertions(+), 8 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
