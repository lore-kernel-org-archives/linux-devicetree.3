Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B44325701
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783624; cv=none; b=FDEa40Igp2nGKUfwH7EWmqRWOkBDZYBmOSL5qUyrtuIrbi/kAt6Np3gRzRKx/0NoFAUMtm5tC/P1BLbrUTErn5A14RdNgNy0LtElHzpf/+AI8e0gldrpc1s+Z3v7fNN9gHU1q0sMNqezMTrH1zaSgSvLDg2RwDDyO1d5wuSXcpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783624; c=relaxed/simple;
	bh=sm6MTsP9qhLWqkvfQQRoOf0J3IszYytlixy6bwpMk+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MrEe4kjflTXyTx8keZZpHJZaugCxdEuSD9PgiEDqyMD5TTgAqVYZccvdXR1Pegt9JO2AJfBJltfYwhp8OEPCgstSGgKh1U7OSfDtcdUipe92iVb7f6H2KzwUGKe499Eyk0+RBXWHGXz0GHAri3PiZduKWzCbJOFf3za10EHcvK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYApnLbI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYApnLbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77F71F00A3D;
	Mon,  7 Sep 2026 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788783622;
	bh=8rKQMjL1pIfq/YMjvVaxbaLCvVZ36ebge7Q/Xi+0LFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYApnLbI3Sd6Y2i/hrXn2dUguk+xUwYxFJiLaRYR9oZJ+V17nqWY2EQ+lmY6G0VwL
	 t3G4fVqkddxJhXUR8Rkrv1fMB6yUYqZi8W4w9NDeLQxipMaekjmPYUuz+NXlCArWlS
	 a7OQxYAnnJJ47cwbbhORGiVvAbkYsUlRe9OEjxIz1eaB66xObP0tkIEYgHZAPZ90tP
	 OhYY/ZVWs8PN6Ffva5IF/hDS/ej2cSVu9uWxfQcE5O1usZGPHDbMKC/HnG6UMSZobT
	 Sf1gL6D5EMgjYb58iWdz++Hyzw3jRsxYeRiLeP0UawBgT5gLw8G3VElUjPoWh3NAc3
	 Jw02YeRnhhmSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:20:22 +0000
Message-Id: <20260907122022.A77F71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The AIF child node uses a directional DAI ID as its 'reg' but ma=
ndates bidirectional configuration properties, creating a structural confli=
ct.
--

commit 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding

Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
controller used on the Shikra audio platform, together with a dt-bindings
header for QAIF DAI and AIF interface IDs.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu=
.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml

[ ... ]

> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).

[ ... ]

> +      qcom,qaif-aif-lane-map:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Per-lane direction map, one entry per lane starting from lane =
0.
> +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).

[ ... ]

> +    if:
> +      properties:
> +        dai-format:
> +          enum: [dsp_a, dsp_b]
> +    then:
> +      required:
> +        - dai-tdm-slot-width
> +        - dai-tdm-slot-num
> +        - dai-tdm-slot-rx-mask
> +        - dai-tdm-slot-tx-mask

[Severity: Medium]
Does this binding structure create a conflict for bidirectional interfaces?

Since the reg property requires a strictly directional DAI ID (like
AIF_TDM_RX_2), but the schema configures a bidirectional lane map and manda=
tes
both dai-tdm-slot-rx-mask and dai-tdm-slot-tx-mask for DSP formats, this
appears to force both directions into a single node.

Looking at the driver in sound/soc/qcom/qaif-cpu.c, the function
of_qaif_parse_aif_intf_cfg() also prevents multiple nodes for the same phys=
ical
interface:

		if (configured_intf_mask & BIT(intf_idx)) {
			dev_err(dev, "Duplicate reg %d for interface %pOFn\n",
				dai_id, intf_np);
			of_node_put(intf_np);
			return -EINVAL;
		}

Does this force a bidirectional node to arbitrarily choose either the RX or
TX DAI ID for its reg property, preventing an accurate description of the
hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-b4-qaif-sh=
ikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com?part=3D1
