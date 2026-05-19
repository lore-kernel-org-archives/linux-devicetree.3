Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3440960F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197744; cv=none; b=Qds3mW4VAJM6RD3I80UFCcfn8cyBudQlmPo+3OXxLMq0G923sf7bdt2SQVvvetTeS4fr2mIO+51hDlEvoUQ5SBmWVwru3rD9XerNObCcGk3xM4UM5cuLIZHFllXfgeL2iO5yxg6Odu9npnqTHc4MQsz2TxurkwfMG5puJpOMz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197744; c=relaxed/simple;
	bh=jMOXHS+rvA4wIs/DSiu1oq9FYYWijK8dd7kZOF9rnbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R/51aZvmTaEKUBoFodZSEAqyKyCoyJ3ZwcSnTCY1zBtaWqlWOeHOMSpW99gibGJYl++dsKAPUjr9kleeYwHe9DTEk+VOlSgWqvMG2+ltLzmgBSuQLvdsa6RDS4srVOWzPwnAJ6onFL9buTCh0XccQ/ZQDxyMpTzNiDJr7XK5gzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z69/g815; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z69/g815"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6878CC2BCB8;
	Tue, 19 May 2026 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779197743;
	bh=jMOXHS+rvA4wIs/DSiu1oq9FYYWijK8dd7kZOF9rnbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Z69/g8154c+XcDelVoVKd3RrZnV3GyX9tRurLnVt35o4SCBgf++BlLlXvlAsRK1eg
	 Xu5dnwyZG/ihXzDJKByRxF2qvrH9gdUaZg4t0QHdzrp+hy0KYZdQlJ1nNqmK7EUP4/
	 Yk0rcHwWZzbQ/gfSwZpfD07lhldc3puT4AESRQ99tPVQET8DIhokx6zuvNhyJJSAc2
	 opcD5DKWfIB7bPCUF5uQ2fWTYtCtQA622oDAGBj9KgrehVEbQpyllt9HweWYFYOp61
	 yzy1JZZ/Bw2xt2ASA0ppyxBDfV0+wy/wuRTm6xBBTnaSF+/XIE9QYnvorP/wUrAF5r
	 oaXBJxQah0/vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur: add coresight nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
References: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 13:35:42 +0000
Message-Id: <20260519133543.6878CC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `tn@11200000` node violates the `qcom,coresight-itnoc` devic=
e tree binding schema.
--

commit 30295a9238dfaa7e7f3c2a597e85a52b878ac32f
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: glymur: add coresight nodes

This commit adds CoreSight nodes to enable trace paths like TPDM->ETF/STM->=
ETF
on the Glymur platform. It also deletes the cti_wpss DT node on Mahua since=
 it
will cause NoC issues.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 0c5cb8532b202..a606235bdb4b1 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
[ ... ]
> +		tn@11200000  {
> +			compatible =3D "qcom,coresight-itnoc";
> +			reg =3D <0x0 0x11200000 0x0 0x3c00>;
> +
> +			clocks =3D <&aoss_qmp>;
> +			clock-names =3D "apb_pclk";

Does the node name tn@11200000 violate the qcom,coresight-itnoc device tree
binding schema? The schema requires the node name to match the pattern
^itnoc(@[0-9a-f]+)?$.

Additionally, does the clock-names property value "apb_pclk" violate the
schema which strictly expects "apb"?

While the coresight clock parsing logic gracefully accepts "apb_pclk" and
falls back to "apb" avoiding a runtime failure, this mismatch will cause
new make dtbs_check validation errors.

> +
> +			in-ports {
> +				#address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-add-coresi=
ght-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com?part=3D1
