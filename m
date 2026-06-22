Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B585A2AD00
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105406; cv=none; b=b1crXZwuMl5TI/Ew9P0bKGdRGKLVKBPC1tBGUiqPQW6GVSKqa00COur4J0TTTIHDb+wtK8cBUNCr9tP/ltFrh8V4VVtEBwr1bBw8G+x2QmfBMpS3W+c5ap/rKwYmuVJcust7L82YcKEqUeHiLyud+vM0ecWpFzu162PvzeysMwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105406; c=relaxed/simple;
	bh=lyfrJP+9qrZjgKUa74ruf1k4OQzmZ4jf9LNnj1lxqR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GjAUun4oGK+VhElgNkw1dfOCDBrbUyNaV/ck4N15oZcL4O7jHraQTB693pBJ6lXly8uadoL+Vpdaj9kWv3PJIIsM7sFZV3kV2GwfKwUZ3pbPiFH+zHImK8gIqpjjM7F2CVf3faTuvwlVNCgbs4xUwKbNZi3dX3pQMFxflkZiVUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XezrkuyJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XezrkuyJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009541F000E9;
	Mon, 22 Jun 2026 05:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782105405;
	bh=m3a/aOICbme09ZgZjMHiY8yhPDqZKnTBomrGh9YbxDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XezrkuyJxVBxInuy1pHR+W5j/MiaM9rAahsD4efTiwFI8pV3Sw3vTNYd6kNNt/WXI
	 VATb8jCEXbY+9kUBYfCbOMksEtQtrr/6YF8t2ATb3vMJEe2mdHhRjovr3+WrNo1HBV
	 dwRfjyBa/96fORp4lylMUQPe3duJ1R5qTg1TGAMV8kKMNMQ6qnypoox7Ut4xaywecs
	 fGU/CORGif5LNNZZ3o3Cye8Cywef6hHbk+/arortyHLcrBjK1yaMbkBGMEV4TJUzx/
	 N+55LNv7LlD+7kdHelgW3JI7MTRXQPIgjXO/vWBSyDIKDJ4ENqKyCyTxA5nZFae/43
	 uLIqU3PuM5pYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/8] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 05:16:44 +0000
Message-Id: <20260622051645.009541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The binding defines clock and reset provider capabilities but fa=
ils to mandate `#clock-cells` and `#reset-cells` in the global `required` l=
ist.
--

commit e33e967e97849b6db5ce0ac256cca1e6c9d83b22
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom,glymur-tcsr: Add mahua support

This commit adds the qcom,mahua-tcsr compatible string alongside the existi=
ng
Glymur binding. It updates the conditionals and required supply properties =
to
account for Mahua's single QREF block topology.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> index 16fc6ab87f9b6..2b64226271657 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml

[ ... ]

>  required:
>    - compatible
>    - clocks

[Severity: Medium]
This is a pre-existing issue, but since this hardware acts as a clock and=20
reset provider, shouldn't properties like #clock-cells, #reset-cells, and r=
eg=20
be included in this global required list? Without these mandated properties=
,=20
incomplete device tree nodes might silently pass schema validation and caus=
e=20
runtime failures when consumers attempt to reference the clocks or resets.

> -  - vdda-qrefrpt0-0p9-supply
> -  - vdda-qrefrpt1-0p9-supply

[ ... ]

> -  - vdda-refgen4-0p9-supply
> -  - vdda-refgen4-1p2-supply
> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260621-tcsr_qref_=
0622-v6-0-c939c22ded0c@oss.qualcomm.com?part=3D2
