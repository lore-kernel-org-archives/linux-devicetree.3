Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311833C4557
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928136; cv=none; b=MNWsYey0G54NI/0kZwu0seFn182fgHC2KMddp5lHoBoED7A7ZLv9wU6lWw1CW2trNwLOzQZI3XXbVeSYJ2k/yvdlWCl7HKHo9Mt92dl0D9b2gT1pTfBF1rmzB8L/8TNNdmc7skqgPYby/s+cXeRak+f+LXHH6GRlgzq5jZQ7eK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928136; c=relaxed/simple;
	bh=N27tHKPnVemnIIAT6lwlY7ksDoq7iZiZqIJ9AfRepmk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhZoSKkgeS7ApjvJ1RgZJoBppABrVFJy6s8IZ4B19cXd3zkZFSiA5EfCuUtx4OM4jMAh6735WA1c179z1aCvp6mb5DBTSIPs9YXXEA1b6IGsBj2+8sNL7hIPA0XYYtr85Td8SVgvss373CidyGqxZ/yjwXiMAa3EOHm6ndJ0OOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QO0oOSQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QO0oOSQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E919E1F008A1
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928134;
	bh=N27tHKPnVemnIIAT6lwlY7ksDoq7iZiZqIJ9AfRepmk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QO0oOSQFk8b7Wl2CTh1cEFBEJkkLKPqdUC2EtOBd2v5aksRlyzHe/Rs9vqvMeuCMx
	 SenJMHe8fB9kl2BiZYpWOZyCFtuOZB2vC8MyNoqzSZS4rc/3jdVN3KqoSeDHvMTW8F
	 BeYewWzr7t3XCBOs6j94TVz4AMjH9qZDw7iGPd1A2QN2hVmfYXSxCP8xQxtEakZe0y
	 KjRs3UtgsQBZMiAi5fQ1XB4RCFGv4M0OZDItRWNMftnaWAhhmdnKn06psge7RUJ5Hh
	 lyOGV2hzcXjYOhM1++532SoidU+u5ST4FMhRoYL6kN/eBEOZRER5OdAQkxXklJE7D/
	 +My9g+TxQHa3Q==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13810b63a1aso406569c88.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:15:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/c2XqLgVKHQXh7PcvSDfcGp5wCoKH4vfULMqNJupEbm1XS1E56FhAeP44XAwhUR4w4MmogdaERBepp@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBLyLmSzXZ60LlcAJ1LpYGEV9llNX1gN9Zl/1pQXIQr0amJZh
	/3r5ZGo/O+UuuT7uPMVS1gyBAH/bXyV3LpaPA4fSG41RPqfxhdHhcSqyIn8+BmQthOwwUZG7kmc
	N4+k02sOLueDoPwfTL6iEEOabzXZgSCahcnWnGP1zTg==
X-Received: by 2002:a05:7022:323:b0:138:4fb:f284 with SMTP id
 a92af1059eb24-138066c6042mr8166724c88.15.1780928134440; Mon, 08 Jun 2026
 07:15:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:15:30 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:15:30 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-8-6aa6f6612c10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com> <20260604-surface-sp9-5g-for-next-v3-8-6aa6f6612c10@gmail.com>
Date: Mon, 8 Jun 2026 07:15:30 -0700
X-Gmail-Original-Message-ID: <CAMRc=McrNhkSdiF=eM5cCthwMxdhxV-FFr4u8CCLw78syLFqYw@mail.gmail.com>
X-Gm-Features: AVVi8CfkKHFtbgMd9KBiYIvAWVC9h75Q3J1RD6g-8IvDVJvxojpGEdmkD1OmD7A
Message-ID: <CAMRc=McrNhkSdiF=eM5cCthwMxdhxV-FFr4u8CCLw78syLFqYw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sc8280xp-arcata: model the PMU
 of the on-board wcn6855
To: jerome.debretagne@gmail.com
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Jun 2026 18:18:44 +0200, "J=C3=A9r=C3=B4me de Bretagne via B4 Rel=
ay"
<devnull+jerome.debretagne.gmail.com@kernel.org> said:
> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>
> Align the Surface Pro 9 5G with the other sc8280xp-based models as done i=
n
> this patch series [1] from Bartosz.
>
> Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> and bluetooth nodes to consume the PMU's outputs.
>
> With this we can drop the regulator-always-on properties from vreg_s11b
> and vreg_s12b as they will now be enabled by the power sequencing
> driver.
>
> Use the fixed BT vddrfa1p7-supply supply name to align with bindings.
>
> [1] https://lore.kernel.org/all/20241018-sc8280xp-pwrseq-v6-0-8da8310d956=
4@linaro.org/
>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
