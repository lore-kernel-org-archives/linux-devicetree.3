Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E03822A3
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328782; cv=none; b=kAsyq2OkoqF8eCb4VbDnu8JJMAraj83WtqnCcpRRJh9Pi//ZDFPnx5JRv0a61KQzKTUtP4yNZmiNR4cEYqLIDO79CUa8lutIeTNYaP7ewJj+Wu2hg2tJNucCuvK3wRoQwaSIh4Y4madgSUKk86NczuAlc1T4S/v6lHBe4exEFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328782; c=relaxed/simple;
	bh=Nu3iqyNwKQib4WJMWemYragilzw3uW/EscXyR5dpvMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KCaYkKnxCnBXFgZ16VJnk9hdx6DbYAUPvpVtUUVH5jra2LuGv7oS+fkW4d+/UX2smuI9XBzx1upfTjz56pplg5h3YCL7KIeCbrZU78Wci9LnBkxhuwzBpsVm9fDexM2HNnG4iJkSOuX6IpTie8bb08X6ayGGhFY6Z7ZERAFwDWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjtISoCg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjtISoCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BBF1F000E9;
	Wed, 24 Jun 2026 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782328781;
	bh=XIdrsZTqs3IOhD9OEbbwrnzCfcMo646KeHZHcwgBZd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WjtISoCgrrdN8X6T710U8C/Mg6z49QjtOio9aohXq0uTvOP8ZPJ90fr4sikilgWkz
	 Jc/BHHipokbGmUDfYePeuQmPqecvzWo8l0wrgaLSdbV1GXuOmVNmMq3Ldvk3qiyzWW
	 npHpqz6pIrR96RXvWA1strDsifYEKdzPXrm9ejNF+kPy0YLoJLqmOSJ5S+ikvkc1NQ
	 +u1Ct890pFwZzAIRTbL3u3q1Wk448/96lxbianM3Nuk4gcbqYvFJk5rv5HsdZ5vv/a
	 cy2VC5KeYrzgXsBwFNqpf/cQqMEC7wg8rEC4sR7PprQaqQ6M/WH5bPc+eOaCkGCK0+
	 Z+uvCHEJkXwyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/19] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 19:19:39 +0000
Message-Id: <20260624191940.C0BBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing property type reference (`$ref`) for the `sram` property in=
 the dt-binding schema.
--

commit 6acd1cecaeb951d30398f9208dd4e87b7cfd156e
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

dt-bindings: firmware: qcom,scm: Add minidump SRAM property

This commit adds a new 'sram' property to the Qualcomm SCM dt-binding. The
property is intended to contain a phandle to a region in always-on SRAM used
for minidump download destination configuration. This allows the OS to share
information with the boot firmware across warm resets.

> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/D=
ocumentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 7918d31f58b4a..82c661db0b616 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -127,6 +127,13 @@ properties:
>            - description: offset of the download mode control register
>      description: TCSR hardware block
> =20
> +  sram:
> +    description:
> +      Phandle to a region in always-on SRAM used to store the download
> +      mode value for boot firmware to read before DDR is initialised on
> +      the next warm reset.
> +    maxItems: 1

[Severity: Low]
Does this property need an explicit type reference, such as
$ref: /schemas/types.yaml#/definitions/phandle?

Without a type definition, the dt-schema validator might infer the property
as an untyped array based on the presence of maxItems: 1. Could this allow
malformed device trees to pass validation silently since it won't enforce
that the provided value is actually a valid phandle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624190830.3131=
112-1-mukesh.ojha@oss.qualcomm.com?part=3D1
