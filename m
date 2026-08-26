Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF0B44CADC
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764217; cv=none; b=IgcU0KzhJWKIrjUIe7MUazy5MbwrrqKquUL/k2OPOQl7ySWK1eaXz83BOEfkYFeVf3xETkGumeH4uJftTjZxMoJBKA/Mdve2hqWNXTHjwYjPiQkVoOWJC8vtCPF321D01kXUapmCB0yb0ErCy8aUh0nu3nGQsVr5zE5PNjveOvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764217; c=relaxed/simple;
	bh=y67ZWxqcNg0X/qYwLU3Wox9tYJI0zm/9F1/DMNxHcWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C8+UbO0VSrOn8lHe0q3gk5tgjmBbCCVWpt/Hqn+SFlBrdbpsOml5qeG9+I4mrzCGq1tMS26sOIEjFw2m6/birBQkx1sq8/zyaZaGqYtfnJ6omCv4usdSQ3R3yPQXgq6OMY7hDKfjzMH5zzkqRAVwvKgXubYnCnRiwmUTGwMjm4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVOzt68j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVOzt68j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916911F000E9;
	Wed, 26 Aug 2026 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787764210;
	bh=OublWpsv4rC00qwkJd0KhdNQJBQqjntGx2xhBnEskEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aVOzt68jtIACyoKPiH4DTiXYqmVdqcg2HsRC3QFlpewSTnWR4lJ5lUzhJcAuzRiCD
	 zqeUEAxjrbsxVYcTyaft1+abMMS6LC0sH1Rg2AwXGO2hVELGNbv9I5OCs4QT+vHov5
	 3KWIqVhsg4Olhg4qqMNutpy7pWZweXY2YnJX6NDkU6DCJdxKJzAMaaZVtWtOcjjMVv
	 9eMqXalhQMpVAstqUqC7syVOW0TIGVHFUit9TME8kglCFRR+VWdRTdeo31iNaoJvIw
	 ieik6gCE+qt/9gk+U2QbEClxRrw2O6PlERG4FuMqrj3O+mHgbZ0k3wJ1lRT/d8oSlI
	 DFm71QXH9fHuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-4-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-4-ae2601cfa80c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 17:10:09 +0000
Message-Id: <20260826171009.916911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] m31eusb2_phy_init fails to propagate error codes and always return=
s 0.
--

commit a59148cf39dc0afc1f852eb07be581b93aa157f1
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

phy: qcom: m31-eusb2: Set phy type to EUSB2

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qual=
comm/phy-qcom-m31-eusb2.c
> index 0bec8657149c9..7e6b16b6952b5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but m31eusb2_phy_init() fails to
propagate error codes and always returns 0.

If clk_prepare_enable() or phy_init(phy->repeater) fails, the code jumps
to the disable_repeater or disable_vreg labels:

drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:m31eusb2_phy_init() {
    ...
disable_repeater:
	phy_exit(phy->repeater);
disable_vreg:
	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);

	return 0;
}

Should this return the trapped error code ret instead of 0?

If a consumer driver like DWC3 receives a success status but the PHY
initialization actually failed, could it attempt to access an unpowered or
unclocked PHY?

Additionally, failure codes from hardware initialization functions like
m31eusb2_phy_write_sequence() are ignored:

drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:m31eusb2_phy_init() {
    ...
	reset_control_deassert(phy->reset);

	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
    ...
}

Should the return value of m31eusb2_phy_write_sequence() be checked and
propagated as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-eusb2-inte=
rrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com?part=3D4
