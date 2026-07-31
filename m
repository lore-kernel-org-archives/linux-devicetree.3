Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55383546FC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479223; cv=none; b=sHq4rj2KKDtyYRQRHtbyEvA/45spErtW7+ejXpvhmIp9Pg1YMWIMOYpcWo44iajK6OqrVa4elmmJrW4WQ8rIkhGw6XULDCdNYc7eV2gM/Syj7kwHj9r4p185sG4+agBBoLhMm/1TCT0NYnP5JTtHraTZj03NfsGKHGv5D3HqdYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479223; c=relaxed/simple;
	bh=TaQ/Pv1Z2EWfDyvJIULKXcg5MIZ4DR0BVfDP+9gfR1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AHbtMBsqqIfYnXneMmIIoVsvSl1p2t50rMEZQ3p1L1svxSj2evl0WszpS2s1IbD39ZvEOjcVLW7P08ILMcSE7Yf7ie8Q1qHB+UFCajJ8EhP7lxa/RJVqWPkadajIIHEH3tk8KPXoesWwieEpzP0qWK8TLj0GRXjASkyfITEglco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTnc1z/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTnc1z/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD74C1F000E9;
	Fri, 31 Jul 2026 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785479222;
	bh=2dMuTHt5Y38T7JwctG1JKdAxIUIWYLxyze3Oi0HZhas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aTnc1z/bjOxIih6ifMz2t9YkTNd5fZ65RopDmjFEYQUCgqIajLxEOfSjbvwfdzaI+
	 nHmpH04UCthCV4oUkf+6777fmHiwBkAS68dZMPvnTekzIPhHHALQQxScfICh7v9xBG
	 6MICduzLWZzEsvZtPQymenCICcZqfsjGJrn0Urie84BonahAbqG4u6jn4Dnr9o2dyu
	 hmih0wCXNeyIQmFG+5Vmwc9av2FnvHqjOdlpKla8kpiGeCC8lZa/qzRghsQwGaUlJO
	 bIvp9wOHyl6BGIK/9mAvahY1Y01TVIqJv18TSk72+RHfNEuvw9E9WZHvFoi6KYqrT2
	 HT6G+v19gtrwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730-b4-kalambo-crd-v4-1-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
 <20260730-b4-kalambo-crd-v4-1-e458f8b08114@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 06:27:01 +0000
Message-Id: <20260731062701.BD74C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The dt-bindings introduce the Kalambo SoC as a derivative of Mahua=
 but omit the `qcom,mahua` fallback string, causing core driver initializat=
ion failures.
--

--- Patch [1]: [PATCH v4 1/5] dt-bindings: arm: qcom: Document Kalambo SoC =
and board ---
commit 0b31003941ba4b70a8690af4bfa949f21d29c3f3
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

dt-bindings: arm: qcom: Document Kalambo SoC and board

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index c7c9a92796846..b0c07a57bda69 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -174,6 +174,11 @@ properties:
>                - qcom,kaanapali-qrd
>            - const: qcom,kaanapali
> =20
> +      - items:
> +          - enum:
> +              - qcom,kalambo-crd
> +          - const: qcom,kalambo
> +

[Severity: High]
Since Kalambo is a derivative of Mahua, should this binding include the
"qcom,mahua" fallback compatible string?

By forcing an exact two-item compatible list, it prohibits using "qcom,mahu=
a"
as a fallback in the device tree. Because core drivers were not updated to
match the new "qcom,kalambo" strings in this series, they will fail to prob=
e.

For example, qcom_pdm_domains in drivers/soc/qcom/qcom_pd_mapper.c requires:

	{ .compatible =3D "qcom,mahua", .data =3D glymur_domains, },

And qcom_ubwc_configs in drivers/soc/qcom/ubwc_config.c matches against:

	{ .compatible =3D "qcom,mahua", .data =3D &glymur_data },

Similarly, qcom_scm_qseecom_allowlist in drivers/firmware/qcom/qcom_scm.c:

	{ .compatible =3D "qcom,mahua-crd" },

Will these drivers fail to configure the hardware on this board without eit=
her
a fallback in the DT binding, or explicit updates to the respective drivers=
 to
recognize the new Kalambo SoC strings?

>        - items:
>            - enum:
>                - qcom,mahua-crd

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-b4-kalambo=
-crd-v4-0-e458f8b08114@oss.qualcomm.com?part=3D1
