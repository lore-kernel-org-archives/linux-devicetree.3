Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F9134B1A5
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101275; cv=none; b=a6o5BWHbrXSJVAtZvGGaUwhzg2g7D3YS6s+gxpX4by/QEPukX01ohfUstO6QJFr4VoGABGQ7YDcRRuvGMIc484HyoEingL12PEqXAmBLrOJ/qrFOdVq4UsbDKucnWMQkvpotNnxWawFl+ANvOtQ64PDI6Mewz7oPF6D34ywtjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101275; c=relaxed/simple;
	bh=15Lrki1qnue4iCVlWxRlamDE2lMl6PPjO95TQJWLv9Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q0OKwF6sMmlPh8Q0dVj07KUaMXzXE4/VznMS3m6zgCm4EtW1+Osf1ghouObSL1HvEzqn0ymsqgMICbh0rIJ96or3cqnksoAvMV+P4keSLATfGhccGAzAlY1My8AhgAnkIDJvHxkkkjUAvd4AGIcRFglwsrchMpy7VZ3dvh1pU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMaa6bdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMaa6bdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F5DC2BCC6;
	Mon, 18 May 2026 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779101274;
	bh=15Lrki1qnue4iCVlWxRlamDE2lMl6PPjO95TQJWLv9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UMaa6bdCoBvqnIs0zEFu5QT/pGkcP5GN1FuBkF79jRhT7CrA8LHyJO1/7thsg5iuF
	 A3qbrBfSRzjNoVT7qdu9EoV1B6XwNBIYvVbn1f44NGtsjxUmnaJsoJKDpdajiUCKcA
	 kIEjPhuAynhRx4j+gQpba5FfBgEqkgeFgws1ml3lWWrIY+62IBzDkBABQNjjJeMKMt
	 /Xbf+GfoaNfuSrP5LHrM8xaSof55VhWqhRVWIWqRq1eqPBy25IHCIfnpcQnITQDRDK
	 H3OLU4kQNJfkhw5/waoyTEfi2+TzVbm/79z+2Av1ByUQY4wFP2idP+/+m3l6QSZ5sR
	 JlnLQeeweIQgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260518-topic-usb4phy-v1-1-71d827c49dca@oss.qualcomm.com>
References: <20260518-topic-usb4phy-v1-1-71d827c49dca@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 10:47:53 +0000
Message-Id: <20260518104753.F0F5DC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding incorrectly relaxes clock constraints by grouping 'x1e8=
0100' with 'sc7180' and 'sdm845' and globally changing the 5th 'clock-names=
' item to an enum.
--

commit 54d1f0fd2346d0dbf486ca5212767ad33f59fde0
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4

This commit extends the QMP combo PHY binding for X1E80100 to support USB4
communication. It updates the schema to allow a new clock, P2RR2P, which is
required for switching to USB4 mode, and adds a corresponding definition.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> @@ -52,7 +52,7 @@ properties:
>        - const: ref
>        - const: com_aux
>        - const: usb3_pipe
> -      - const: cfg_ahb
> +      - enum: [ p2rr2p_pipe, cfg_ahb ]

Does this global enum change inadvertently relax the constraint for all
variants?

It appears that older variants which previously strictly required cfg_ahb
could now pass schema validation using p2rr2p_pipe instead, and vice versa.

[ ... ]

> @@ -186,6 +186,7 @@ allOf:
>            enum:
>              - qcom,sc7180-qmp-usb3-dp-phy
>              - qcom,sdm845-qmp-usb3-dp-phy
> +            - qcom,x1e80100-qmp-usb3-dp-phy
>      then:
>        properties:
>          clocks:

Should x1e80100 be placed in its own if/then block?

Grouping x1e80100 with sc7180 and sdm845 means the schema only enforces the
maximum number of items, but doesn't strictly tie the 5th clock to the
specific hardware generation. A separate block would ensure x1e80100 is
restricted to p2rr2p_pipe, while the older variants remain restricted to
cfg_ahb.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topic-usb4=
phy-v1-0-71d827c49dca@oss.qualcomm.com?part=3D1
