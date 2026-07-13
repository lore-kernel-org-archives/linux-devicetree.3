Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8822F745D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973586; cv=none; b=j4FchNufr6+LSjSBUL7IB8iDi14RqdG/E+3CdiHKHGnsxPBehfIkTLdLWx5Nb/RRiCJEfS9xsdwJnf7Zyf9Jez6kh/OT8Twp6NwJ4pWqhwwpY8s8IOBNr/MI8LPc6m2nTO4MihnR1ev0XwSpOX5ov1gs5WGCeWzQ9SRMyf30lJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973586; c=relaxed/simple;
	bh=DRSTSZKlzjAFcQ1iHSI6JYo8sUBwYj7h89w8FoHR7S8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uAN0Jg0czkIPwD5YsnZPUSTwVzLvTKHcj55qbGOH4WF/G6qDnXeOYocbNyFpBk532ZFjEmiyN2/qqR2ttzH1tuUxGS9MRTYtbW6EkOtbQBmOT6qjBMWmD0pGOMlQoURdKs1mocuDHh2TyRBkQFaG2LTrdSvQqiky8Qmoc5JnXzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/0oYJaK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/0oYJaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D22A1F000E9;
	Mon, 13 Jul 2026 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783973583;
	bh=J1m5xnj1VNsVr1XwV3+zZ+xpCOqqiWa2ClFJlsla8Oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V/0oYJaKWOV3SrNH7/dNI6o1CkAC5T1tGFtOLnAtT9ZQ//fbWuAG7YCQ1xHR8p9nq
	 6AelUjCawWZxbxn3/6fGBnxJ/7bL9/x3svcY5MolKMKF+WT/48u0EFf0naVPFGBChg
	 knz3K6SrLmeNuYr96gSz9cUKpC3+F4LMu7fWCHAusELZh0JRFds0OM7AEvcCGDxbrl
	 0YHwkzT00wz2LFuWpHwQYfThAB477l/aZCWJmAHKWgSJk5Xtv1S2jZRw1iEJB0kSAz
	 6RYBhdNhe3Db1pEBG0Cop4cHfa+loYfPncvjq5dLwu21tZq6hJnJDYC8FZR2LFHKqg
	 h8GqN1iPc1xTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat
 pulse clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 20:13:02 +0000
Message-Id: <20260713201303.3D22A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Schema validation failure in example due to missing #address-cells =
and #size-cells parent node
--

--- Patch [1]: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartB=
eat pulse clock ---
commit 9f770d5091cc6e0fe9a0f15696b43becc2db0bc2
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat pulse clock

This commit adds the Qualcomm LPASS VA CSR rate generator node binding to
expose the heartbeat pulse clock. It also extends the qcom,lpass-va-macro
binding to incorporate this new clock as a constraint.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.ya=
ml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
> new file mode 100644
> index 0000000000000..794da92adcf88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml

[ ... ]

> +examples:
> +  - |
> +    va-csr@7ee0000 {
> +      compatible =3D "qcom,hawi-lpass-va-csr";
> +      reg =3D <0x0 0x07ee0000 0x0 0xe000>;

[Severity: Low]
Will this example fail dt_binding_check validation?

By default, the root node in DT schema examples assumes #address-cells =3D =
<1>
and #size-cells =3D <1>. Because of this, the 4-cell reg property here pars=
es
as two items (two address/size pairs of 1 cell each).

Since the schema explicitly constrains reg with maxItems: 1 earlier in the
file, does this need a dummy parent node specifying #address-cells =3D <2>
and #size-cells =3D <2> to pass validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-master-v1-=
0-1ebe5993225e@oss.qualcomm.com?part=3D1
