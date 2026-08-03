Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DD394792
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754906; cv=none; b=ijAnJ6yKB+YDR1JoMp2gdeLLq82vHCF5HKe8cScS/2DpIVRVGLT6TL9BrpR0/mseRSNl+mvyuYvj9CoVe7wwtB4wlskCjxa6yXvQ0NAOx9JexZiEDZQoc3BeNbrqevcd+1qNv4sxXVzLXgMWNFI/ialp0EwV0ljgOAsAbZNhaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754906; c=relaxed/simple;
	bh=gzBuzTCllhR4Nhw50u8+Ls2sW4LKCji8tQhMRzEWK6c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sI7RnHvYZuRZ0XYV47eUHt663W3zuWtfDThylJFPoCgIJ3xEjvue+YIWfl+ijV9Nwo3kp9caGf9Fc3WKapFdjpsg07lWegFiLLHXas+QAMhrWZDMAmbOABfn4810xcIOxNjnhkNFXTRIaxf7cAX3oNh8zBMVChkJsmqHKg1Hjzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNTUYxZs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNTUYxZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDD81F000E9;
	Mon,  3 Aug 2026 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785754905;
	bh=Ne8j71Vx+5W6zGM8Vgo9W5dnldGOSG89s2WsMFj0gVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HNTUYxZstlq5JyyCJ3lTNDH7WMpNA6kdTFjs/QmUcZKmklbPQKYIc4QjoRw1ZcTkD
	 lpm5G93yylXbhhL1GCpTWP4jgyDx3Q8MF/Ub9lvzYd9ec0UB64EwR79BiQAMPBEIZy
	 0izeZ7vY4FETHnF94Y1ilb69oomdi9tZckP2dG7LAXRBp4+UiKGcMCBYilwpA+bV/F
	 TgQBv0SG/YzlJvOc7W6gqjZKvJDhg0x3X/Oe+HTttjIpoGeJ37Cvsbv/MZEDnCav9y
	 /3i749jADhNLbqN3sV5dezSvpewzCwYfmaeUuC6npO+079lc2s94WBwf9PJQjlZs0r
	 tdnO2DJxsDDuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/9] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803-rproc-v14-2-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-2-a1f87b0b0ad2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:01:44 +0000
Message-Id: <20260803110144.EFDD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect placement of `minItems` and `maxItems` inside the `ite=
ms` list for `qcom,smem-states`.
- [Low] Copy-paste error in the description for `glink-edge` referencing th=
e 'Modem'.
--

--- Patch [2]: [PATCH v14 2/9] dt-bindings: remoteproc: qcom: document hexa=
gon based WCSS secure PIL ---
commit 8f051c37adcc2888cdf46122f432edbd580d36be
Author: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wc=
ss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018=
-wcss-sec-pil.yaml
> new file mode 100644
> index 0000000000000..1ec8df60d9633
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-=
pil.yaml

[ ... ]

> +  mboxes:
> +    items:
> +      - description: TMECom mailbox
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the remote processor
> +    items:
> +      - minItems: 2
> +      - maxItems: 2

[Severity: Medium]
Is it intentional to place minItems and maxItems as elements inside the ite=
ms
array?

By placing them inside the items array, the dt-schema validator treats them=
 as
schemas for the individual elements of the phandle array (i.e. the first tu=
ple
is validated against {minItems: 2} and the second against {maxItems: 2}).

If the intent is to restrict the length of the qcom,smem-states array itself
to 2 items, should these be sibling properties to items rather than inside =
it?

> +
> +  qcom,smem-state-names:
> +    description:
> +      Names of the states used by the AP to signal the remote processor

[ ... ]

> +  memory-region:
> +    items:
> +      - description: Q6 reserved region
> +
> +  glink-edge:
> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, chann=
els
> +      and devices related to the Modem.

[Severity: Low]
This isn't a bug, but should the description reference "WCSS" instead of
"Modem"?

Since this binding is for the Wireless Connectivity Subsystem, mentioning t=
he
Modem appears to be a leftover from a copy-paste of a modem remoteproc bind=
ing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-rproc-v14-=
0-a1f87b0b0ad2@oss.qualcomm.com?part=3D2
