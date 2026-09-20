Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D535E1AD
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915463; cv=none; b=HdlQ0qQdQ/lVq2sO7V9mIPUDDYsH3Skz8EtytVTFXQ7YOg5KNIo57OFX2n0dVBz8WjB79ghGjj2kJyg3G3fCRpMAWdXbLh3exHh3ffqObUqOm6FEinALzWpbn47X+AXUdDLrkdzc6H3D2d6nKVonbx56EDFHVxDCrTaLTPJn/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915463; c=relaxed/simple;
	bh=H89rlfhUN46UDhqcSnw2wUMPEYgQHg2IiRGiIC859ZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QcbOURNNDrJhJWcAFlvo7osh5MZujnswoL1ZgvC/OxLSvIh3y1l5ddKZKntJMZdymnj3WMVLEE1NHG40j3UjEq7QVqRNLyiWV7+NVfGXKjB7rcNg6gvTgwP4lK2s+QjNcn36xdijuRp1PIdziA+Wrmo6aUzfa7cX2FZiWj9FTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFhOzyYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFhOzyYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEE41F000FF;
	Sun, 20 Sep 2026 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789915461;
	bh=w7mmpycciOoBKW3mjyqHHv+Mm1I9rb6kpmG52I+4V9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NFhOzyYUKgbo64/0qo6phB9nG7+OI0hsHslmM4cmfPbnvH3RUgoWXFnQ7DehNUn7q
	 qdFx/v3/bvrwrF5UaS0xvPWr4iTEC12M1eZwtHOn+hhxaPJr3TDTZmrJ9Eda+ixuPb
	 Dnl+0mUrh9f8fQC2Is0PwImnFbHChKPcTqnn+6jI7BguGooZq1ceL4dBSfQJTvQHEu
	 i02WULJIIdYE8HUIqtYXcCL6HKSQthtVYSGTllqa/IplRdQzK+rBZP6AxfiTRXA7sq
	 OO+z6GXAjeq4RZYB6RWXCgDM77gzml1laZJt7tBinIginWqOEuoRn4GeqdFAPBXdlf
	 wq1D52+VAG8TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-types: require one of
 the VBUS sources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 14:44:21 +0000
Message-Id: <20260920144421.9FEE41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: broken oneOf logic erroneously rejects valid legacy=
 nodes
--

commit 91a069f510352e4c4e88b45ca0d906bfa22ef623
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

dt-bindings: usb: qcom,pmic-types: require one of the VBUS sources

This commit attempts to enforce that either the generic vbus-supply inside
a connector node or the legacy vdd-vbus-supply is provided. It adds a oneOf
constraint to check for either the old property or the generic property
inside the connector node.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b=
/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -91,6 +91,14 @@ required:
>    - interrupts
>    - interrupt-names
> =20
> +oneOf:
> +  - required:
> +      - vdd-vbus-supply
> +  - properties:
> +      connector:
> +        required:
> +          - vbus-supply

[Severity: Medium]
Does this logic mistakenly reject valid legacy nodes and allow missing vbus
supplies?

The JSON Schema properties keyword only applies constraints if the property
exists in the instance. If the connector node is omitted entirely, the
second branch of the oneOf block will vacuously evaluate to true.

If neither vbus property is present, the first branch is false, but the
second branch is true, meaning the oneOf constraint passes. This silently
allows nodes missing vbus supplies.

Conversely, if a valid legacy node provides vdd-vbus-supply but has no
connector node, both the first branch and the second branch evaluate to
true. Because oneOf strictly requires exactly one branch to be true, it
fails validation and erroneously rejects valid legacy configurations.

Should the second branch use a required constraint for the connector node to
prevent this issue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-fix-tcpm-v=
bus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com?part=3D1
