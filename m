Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476563C0A01
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822832; cv=none; b=ZmuR24zbV++euu9kzoe99ImOo4LSgvc3V/zGb+1FTvnRhjEdZubQZXaZuYcd2jqGJnTidD1xVFlh9kzdCJc+j5CQPbNv0CFd505aflnm9FFq2lALAG6xAKu2u/KlRSLgNKH6yNjNzQLU9x0X4gmu5JaZjibeaKmL3KlZVrDY/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822832; c=relaxed/simple;
	bh=sSyoCWQ0EaIIf7hejZnMYRdUelmYD/hDF+x+xIRmbVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kphskcwI8LOfhfiT46L+JECwe9TuhAw6ph7IXtNys2Wr0IheEUuB0LqnfsUAgmQTVH3lVCpKT0lvqeIX200Wp5fMIa4+GWCkJ2GXAvcsjYM1e3kn5ujQycRnot8fTdfkeCxcbTr1lsOh9YPCRAf8vGbU2VRCQxVPeLicjFn92XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPh/4jRb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPh/4jRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709FB1F00A3A;
	Tue, 26 May 2026 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779822830;
	bh=psuZW7mOZXB94hHb3PYUph3EZuHUiZ4GMJ9FsR1t+Qg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jPh/4jRb5Rr0QH8sMnIXI59hBUiGTVYaokvlAOe8Kggsj5TTtjIkVtPhNMjtKItU6
	 fczzxsZAuRb96nqpY7dLzbuJVeRE2IwEZPghBpU7j9PNzGjeizTyu21DgfNw11JBf3
	 hPQfpKj8CAKT6dKPdBeJaZZ4nd/kt4FRv/zcveISfLSLorgcQrbEGl/Pz97uWTfkem
	 VAzwyxwabqU8P2DhX5M230+zxVyCqdJnmE7hgg0f3qaX1WTzfEDnq961EObiKcqMJA
	 s0J8gnyc0VK096o1bWIlxvuBecfe/xXzvEfd2Gajj6vyqicc+vZhzTKCzd4zZr+SQg
	 Ci2LK5TivBkzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy:
 Add support for Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratham Pratap" <pratham.pratap@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 19:13:49 +0000
Message-Id: <20260526191350.709FB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] QCS615 is an invalid fallback for Shikra due to differing hardware=
 reset requirements and removed DisplayPort functionality.
- [Medium] Missing `allOf` conditional blocks to enforce correct reset coun=
ts for each SoC variant.
--

commit fb0664de6e00aa81793b7c92908a732069771e68
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy: Add support for Shikra

This commit extends the QCS615 QMP USB3/DP PHY bindings to add support for
the Shikra SoC. It introduces a new compatible string with QCS615 as a
fallback, and increases the maximum number of resets to accommodate Shikra.

> Declare the USB QMP Phy present on Shikra SoC. On this SoC, although
> there are DP registers, the required internal pins have been removed
> and hence DP wouldn't be operational.
>=20
> Shikra needs 3 resets (dp/ phy/ phy_phy) to be asserted and de-asserted
> as per hardware recommendation. Extend the bindings to accommodate the
> additional reset.
>=20
> Use QCS615 as a fallback since the software interface is compatible with
> Shikra.

[Severity: High]
Is QCS615 a valid fallback for the Shikra SoC here?

The commit message notes that Shikra requires an additional third reset
(phy) per hardware recommendations, and that DisplayPort functionality is
non-operational. If an older kernel matches the Shikra device using the
QCS615 fallback driver, it will fail to assert the required third reset and
will erroneously attempt to initialize the physically disconnected DP
functionality.

Could this lead to incomplete hardware initialization and potential
subsystem timeouts?

> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp=
-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-ph=
y.yaml
> index efb465c71c1b5..65ae4c6e09db0 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.ya=
ml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.ya=
ml
[ ... ]
> @@ -33,12 +37,15 @@ properties:
>        - const: pipe
> =20
>    resets:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
> =20
>    reset-names:
> +    minItems: 2
>      items:
>        - const: phy_phy
>        - const: dp_phy
> +      - const: phy

[Severity: Medium]
Will this allow invalid device tree configurations to silently pass schema
validation?

By relaxing the global constraints to allow up to 3 resets, a QCS615 node
could incorrectly specify 3 resets, or a Shikra node could incorrectly
specify only 2.

Should we add an allOf section with if-then conditional blocks to enforce
the exact required counts for each SoC variant (exactly 2 for QCS615, and
exactly 3 for Shikra)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526184401.3959=
717-1-pratham.pratap@oss.qualcomm.com?part=3D2
