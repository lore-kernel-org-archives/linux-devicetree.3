Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C53D0923
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310763; cv=none; b=ikrySKKANpS9oSkmWjB698WD0XGVascqP7yJdqP/1/IlIBRu1TdiPqBEInSoMckt/s1GIKjOFi/6f6RtsoSfQyG2/+7CkMhCynRtlfZJX++6OtpMzHshbvwTTjeTCXD89c6FNsXboKY1UzJohvNDwRPfBkNWlAuEepWJ8Up0Ol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310763; c=relaxed/simple;
	bh=kzGRfIQ3oqtNVAdSdf41s1coB+dfm3JIX+5LmmrnTNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSphmsOxvvj7tzwqvcY3uDuGf8aYvsT5/2C/2hpYL/VB5NnfqxupsqeiIdzz58dtq2FCRFz+RS3bFGN4u+pzOL6V0toOX53qo0iQGqZLPOYCACHDAFMoYFs8r66k42u+mNWPfC03mfwgJwRA9Y5NPlRqNmQpSIO9Qsf0bBd1US0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNlZlFrf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNlZlFrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6FD1F00ACF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785310756;
	bh=kzGRfIQ3oqtNVAdSdf41s1coB+dfm3JIX+5LmmrnTNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RNlZlFrf0Rl0AwSI35VT/TysH5id7aAGnWaUKhx6dy9mWBiJ9uKBh2I5uRJGgxSSa
	 Eyj+6sRUBaCosSBNn3zuXTHzXr6ok3wcLPUcaainbzJulhNM3D8SO/dyKQ+tSOrXEO
	 zS4i/qB0FRA4rMKt2xn7HcrSGIDSdkxR7MKHH+eoVR/FOKkZnltzcN3xnR9OTrkSnV
	 M/aWr2n3nZleRgPWwq6bWGZUtdU8c/L/pfCArr59lcwyAbscmPGWb/ZaoNR0twThb2
	 roYSI35tJiKCn5tDLb7aFYXY1vMdfvM2Rbv+fOvdhkJyP/7EdZKGhfdqCoZhWuZ0le
	 EtaxRk1+An4FA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b013084dc2so497558e87.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoknzU2Pj/VGvws7jdisMpqPMMy3bbUwN8Z8UasTXiQNNcjzmj3rFiM4dPSpxbq0zVSGuvbl7dCocx/@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5kfuefccHNn+vPE1pTEdQWUHO7IiVHm7Kn3GiiWdN/kBZ7Mn
	11rnRavJwpJkWCqA+NnjMXLGe0aogH1Z9oyiIk8pIQR9acP10teWfMIHUST6c7daWNBv9Ts4C2t
	6OnSjUHnjwZk2EvK006ebv6Ly8h0u88k=
X-Received: by 2002:a05:6512:3b9a:b0:5ae:bbf1:b9e3 with SMTP id
 2adb3069b0e04-5b2d0224c88mr1209890e87.31.1785310755111; Wed, 29 Jul 2026
 00:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:39:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLkLA5opt5hgc0yh4SpvAm8SRwUi3sijU8tjRk+1aZz8KA@mail.gmail.com>
X-Gm-Features: AUfX_mxASc8M5iyPxZ9LtA0NABJlGeVc6lS2e_-Z06vkwHiInWNGRjdZG92zxjI
Message-ID: <CAD++jLkLA5opt5hgc0yh4SpvAm8SRwUi3sijU8tjRk+1aZz8KA@mail.gmail.com>
Subject: Re: [PATCH v8 00/35] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mikhail,

thanks for persisting with this patch series!

I take it that these are cleane-up versions of the patches already in OpenWrt?
If so I think they are very well field-proven, so we definitely need
them applied
before the v7.3 merge window starts because we can't have too big diff between
mainline and such a big user base. Sashiko comments about pre-existing
stuff can be ignored or added to some TODO document for later.

As soon as I have the ACKs for the DT bindings I will likely merge them.

Yours,
Linus Walleij
