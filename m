Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE3C37B02A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878095; cv=none; b=kUpONS5kgpBtab49sTXDe3MphhLJ7hwQKXsmJz479ot1FhJBpV5G4RYJsXG1BHD+7HcHpcx2xr12C8/RhmVVSIpUB3Dt/kYzNCBxWN3B95hgeCkJ4LuB/pFzHDi76RCGrJsViXna1MeEOseDObTv4b7WlGNxH/DxBtdGTBUH2Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878095; c=relaxed/simple;
	bh=TVMfo7WL4yh8bC4mZ8XsTXg7OF2WSi6fdk3AhOAhBD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ljh56L9E46pYmagFL1n3MR8O1ikTVnPEgRAD8S5jGtVNY0PeXoUDHR3dx8BpCLdpGkhuOkVaFr/agvfLrp6zEhkH+UCIIWLxUESjvSJdIRmdzeF8xiq/7hI1+bSM9YSmfm7saJxuRv+4FpmxD5RqUcFjlxkOrKD1jo1s4Z+8o7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gujG2TYr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gujG2TYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160561F000E9;
	Fri, 24 Jul 2026 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878094;
	bh=DLzazDKIqJPo8S7ftYlp7uS8F5PD9yqsG5UpPtgK24A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gujG2TYroJj+5BQ55kQ1kTduHjXOhdOt9hdssdBJI48Q/0F7Dv4YT6pg42BA1dFnt
	 pVMaV9FPwSmxvUSd8LqkpAKb4E/oS1D2QVk1klKAyM86HV7oD6ckZ8lk2WvJXU4GPA
	 MZ4i4nyB4q06jpoDtSB/dNfDippHcD95XJdV6bsIMyAravnXSLc5xw/z1mNkS+Xk29
	 Yl52Rxw+ySruby2TVtf1iOTvleSyScUgmRPCcmaJnNmcjRBNmgKM7zBNYy8lqdrTcA
	 Kfm+C9LefazvZQciFB7Cg2HX5dE8pBVcvmI5qSwhhlRalFlf+2C0GxHPy4GDuDc/42
	 1z4oMNie7emkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/10] dt-bindings: firmware: arm,scmi: Add Qualcomm
 Generic Extension Protocol
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-2-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-2-cb732bcff1f4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:28:13 +0000
Message-Id: <20260724072814.160561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding `qcom,generic-scmi.yaml` to the `anyOf` block in `arm,scmi.=
yaml` creates a schema validation bypass that silently masks errors in vend=
or-specific protocols.
--

--- Patch [2]: [PATCH RFC 02/10] dt-bindings: firmware: arm,scmi: Add Qualc=
omm Generic Extension Protocol ---
commit ad9e4b588cb16e4e6566d7094e38434deace551a
Author: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>

dt-bindings: firmware: arm,scmi: Add Qualcomm Generic Extension Protocol

This commit adds the device tree binding schema for the SCMI Qualcomm Gener=
ic
Extension Protocol. It supports Bus DVFS on Glymur, Mahua, Hamoa, Purwa, and
Kaanapali SoCs.

> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/D=
ocumentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 6fc44105f1c37..85f06a6a74520 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -24,6 +24,7 @@ description: |
> =20
>  anyOf:
>    - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
> +  - $ref: /schemas/firmware/qcom,generic-scmi.yaml

[Severity: High]
Does adding this schema to the anyOf block create a schema validation bypass
for vendor-specific protocols?

If a device tree defines an NXP-specific protocol with invalid properties,
it will correctly fail the nxp,imx95-scmi.yaml schema. However, won't it th=
en
be evaluated against qcom,generic-scmi.yaml?

> diff --git a/Documentation/devicetree/bindings/firmware/qcom,generic-scmi=
.yaml b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
> new file mode 100644
> index 0000000000000..a50e5e8fdcccc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
[ ... ]
> +    properties:
> +      reg:
> +        const: 0x80
> +
> +additionalProperties: true

Because the QCOM schema specifies additionalProperties: true at its top lev=
el
and does not define the NXP protocol nodes, it seems it would accept the no=
de
and mark its properties as evaluated. Since anyOf requires only one branch
to pass, does this cause the overall validation to succeed and silently mask
errors in other vendor protocols?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-rfc_v8_scm=
i_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com?part=3D2
