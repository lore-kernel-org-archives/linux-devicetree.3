Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638B13777E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083650; cv=none; b=Lv0+kCjuZroqc5ztwcb5fguATl1o3ryn4tFKKFd0Ts1NibX2wGwrjMpw0Rzb5VbtO3uGOmJLZ6IOrpe8OG+PCjRhM2kOubh33Ztex48zDNdrj9wjGvFWycsE1g1nJN4wQSInH5qQWn/BlNuxZ/Vt3g2wAheWZHdDjlvmCrvIGS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083650; c=relaxed/simple;
	bh=UGnW4be6bFk6CDnpLjwkvBI/hxMAYub8hILypQd8INM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JCf27UwJS0gMwu9MoOH43x4TfTCItpaSw9qOgkCkxs9YUMrPfrpqBGhPfaElwtILCj/WGZSkaqtYWaT4O9A8GS72j5eSgNCdHsnesm1zPKd/zR++wUW0gvDlla4AF1g6KWgL/vVwMgYQKw49NJrPdXVR2r5pnO6IDe3KBqWdXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n75kZBIq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n75kZBIq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6811F000E9;
	Wed, 15 Jul 2026 02:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784083648;
	bh=GrtFvTpDVlfVZrFBLkhnAJfTVkC8gf2GOqlBMk84z1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n75kZBIq8s8jDXfub6J/CeJqb57A4hCD2e9hSurkxjYTLR30pKsPtXIGeUQXH6Fck
	 gdpnM5LQcIV24T1OggwmjPU6f0r/iAT5ZtKfkX3p5k6O2qtHEdkxpMQ9eAo30rnrVT
	 u3nwq/KoGAEEM1yN08e8NsqqXsMMaxFN8ux3cGPt1ClBOL4LjvbW40vqjlyadKSItK
	 9g94bAkc7+GrGeB5d8M83PrQlaWTEg0lrtGittmel7nvVhfHEaNMjbhoQeFQN9a6GO
	 i0JjKAlFBrXg91XLEvMUoKMhS6ASke2DBrVzPLeYmV+DTDD3lVcL0QV4QtBMVH+w9b
	 UWKjQ0GnagBaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
 <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 02:47:27 +0000
Message-Id: <20260715024728.6D6811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `qcom,x1e80100-tcsr.yaml` binding defines hardware provi=
der capabilities (`#clock-cells` and `#reset-cells`) and mentions power dom=
ains in the description, but fails to include these cell properties in the =
`required` list. This violates the DT binding subsystem guidelines which ma=
ndate that hardware variant provider capabilities must be documented and re=
quired.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to =
own binding ---
commit fdaf487663a160c0f437f63e82dda477ea7a20b5
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and requires
dedicated LDO supplies. This commit moves the x1e80100 TCSR interface to its
own dedicated binding file to document these supply properties.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.y=
aml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
[ ... ]
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
[ ... ]
> +required:
> +  - compatible
> +  - clocks
> +  - vdda-qrefrpt0-0p9-supply

[Severity: Medium]
Will this omission allow incomplete device trees to silently pass validatio=
n?

The new binding defines #clock-cells and #reset-cells as properties, but th=
ey
are omitted from this required list. The device tree binding guidelines
mandate that when hardware variants introduce provider capabilities (such as
clocks and resets), the corresponding cell properties must be explicitly
required.

Without these in the required list, incomplete device tree nodes could pass
dt_binding_check validation, potentially leading to runtime failures or pro=
be
deferrals when drivers or dependent subsystems attempt to use the undocumen=
ted
functionality.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-hamoa_tcsr=
_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com?part=3D1
