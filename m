Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE42E4D597E
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888752; cv=none; b=TRxA6j96hFG4pe2iL35EqFYP4niSUPJA+CQRQwnV0fvSbsYmK9kSgUWMJvoLM9kVkC9OFTxijr/As3QYHeKnqaWIw7/NEV3LV7Q5VSuSKzV1yPkgoZytwFLJ6Pn5Npm1+kLYgxkf+UPBG+n2VqIW++/6kIzNWW9p70aTJKr9YYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888752; c=relaxed/simple;
	bh=HOkXUjHRh3yo4rjmyyhvH1RlJ9w6utXeFsxtNCLKq8Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JBIh3l9Ol+nG68Nwn+zm5E3QVuofx8chJmmuSgfqZMIRyJQbzjbaScIyvsFJCVC5WkBxNWIhc+++RMTvRaAyyBhmeXC2TFrxfZt/cx0H9Aj+1LN/UBLR3GsOdiZM5U+SxnpxftBbRoFEV41zB68pH4KSlQ227T9JjFRqxeO0qzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C48YqOTk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C48YqOTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160711F000FF;
	Tue, 13 Oct 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888750;
	bh=6yf4I1HZczU1HxPFOXhQtPwGXJA/vBTGpOut3pDiU2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C48YqOTkaOdI/JM5OnltwNnS4+p7WSVv5hahymWKRaId9ZD3pg/qjGUjPSSZ1dC7/
	 AtL3guOWkT+1FIYmpBxewaytiaokNE1r7EXEY0Sn+eY0XqjYHgu7Y4GhGIRR+6DnRi
	 ohacZL2MPLlkElbQvtftXHscBC8zhWHPzJnAsJtoKoClJq3NAO3mVGnxI8B+nmRnfq
	 vikIq2N3ZNKh6hqwVe99b9HdiHHWi5NEEXQT9txb13fM4MOCowzFmDI6swc624Z0Ro
	 B5l1i3ibCJdZVd/BeNSP3DGaOjPhjt4DdepPg1DWHwCYaGZvLAXC0kqZWvhP3P7y1N
	 CvOHFTajBfkiw==
Message-ID: <sashiko-outbox-169561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-1-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-1-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:52:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing header file for QAIF DAI IDs
--

commit 2a91d26485f5db137a06dc65becc26ee388409d0
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding

Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
controller used on the Shikra audio platform. Describes the MMIO region,
interrupt, clocks, DMA IOMMU mapping and aif-interface child nodes required
by the controller.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu=
.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> new file mode 100644
> index 0000000000000..acca6f6177518
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> @@ -0,0 +1,290 @@
[ ... ]
> +patternProperties:
> +  '^aif@[0-9a-f]+$':
> +    type: object
> +    description:
> +      QAIF AIF interface child node for PCM, TDM or MI2S configuration.
> +
> +    allOf:
> +      - $ref: /schemas/sound/tdm-slot.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).

[Severity: Medium]
The commit message states that this binding provides "named constants to av=
oid
raw numeric IDs in sound-dai references and child-node reg values". Are the=
se
QAIF_MI2S_AIF* and QAIF_TDM_AIF* constants missing from this patch?

I don't see a dt-bindings header file added in this patch or the rest of the
series to define them.

[ ... ]
> +            #sound-dai-cells =3D <1>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            aif@b5 {
> +                reg =3D <181>;

[Severity: Medium]
Since the header file defining the named constants is missing, the example
here falls back to using a raw numeric ID. Should a header file be included
in this series to define these ABI constants so they can be used in the
example and by users?

> +                dai-format =3D "dsp_a";
> +                dai-tdm-slot-width =3D <32>;
> +                dai-tdm-slot-num =3D <2>;
> +                dai-tdm-slot-rx-mask =3D <1 1>;
> +                dai-tdm-slot-tx-mask =3D <1 1>;
> +                qcom,qaif-aif-lane-map =3D <1 0>;
> +            };
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-b4-qaif-sh=
ikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com?part=3D1
