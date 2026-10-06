Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F413C10A9
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 20:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318563; cv=none; b=P7YE+bg0lWmVuRL145NHy5WiHOiN7v2WkzEEpiExwH7n24B8FtFILONMkxAcn6Ew3y078bhPK/C9CLF07oT3feLlI58Zi4MgXuadD/C/KKOYI2Jr3N9aH5gxZsLmIBGum8S6ivzsJSHwjHJPaI4vzOud4bqaqp3SOuj38z58GxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318563; c=relaxed/simple;
	bh=FdCL41z+mPyDdT+GGVKdIirMDVCUqYIgtLH0fI8NX0A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GMpPNcUSymAdy+HXjtOJdIF7Kc3yU9fNMsIjrQw9SetTH5n78zYCVXxglxjsaOvr2Qel6r5ZM3jB6UeCqrPiTj9hUWbanQmjX+tND2RGrrT6RrBP74+P50m/6IxbubUUPmS0HJcjNrwTpTd7692MGbDFz7lTPR3cZdDJOt2sDuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=np+kTwGt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="np+kTwGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE321F0089B;
	Tue,  6 Oct 2026 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791318561;
	bh=5blqR7lxzulprqbUkBL2gOOw8Nr9lZXU+sKMZdlnHhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=np+kTwGtFhgHeUR2FTxUWQRnforKfXo5D5ftM+L/knVggRBV5Bt+rnQY6QB9kMzrr
	 546gNhQhJqpAaMed6c+7Z3ydpRtt1zWoMY47sxaMpG3ZzoS0fMkXdKpRxF4LMTuB4y
	 yl1O/aJoQmjdqsdhYfKcweixxZMnFJz3vSwwQejgTlhwiPqwwuMl+fjs90kTF2mP2t
	 sTtanmCJufSRzeesz0AO/nW6sRQ8TzFMpJHPAG9F7dNNZxxMdLS5peOboXL3NqjLIB
	 ntzK8bFH689nZ4pzaYjxgJKRST1jrNfHHVVQpVMJ4psddw5TPCNpVvcXSHUmJZ7mnP
	 NxAeya5ikuHDg==
Message-ID: <sashiko-outbox-162430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3] dt-bindings: net: Convert HiSilicon
 hns-dsaf to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005202808.1982164-2-robh@kernel.org>
References: <20261005202808.1982164-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 20:29:20 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: incorrect additionalProperties in port node re=
jects inherited properties
--

commit 1a8f2a688cef19a71010006753fe6e776c15501b
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: net: Convert HiSilicon hns-dsaf to DT schema

Convert the HiSilicon hns-dsaf binding to DT schema format. Drop the unused
phy-handle at the top level, add the undocumented media-type property, and
drop support for 4 reg regions as they have long been deprecated.

> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.=
yaml b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
> new file mode 100644
> index 0000000000000..4629acbba8104
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
> @@ -0,0 +1,170 @@
> [ ... ]
> +patternProperties:
> +  "^port@[0-5]$":
> +    description: DSA Fabric port node
> +    $ref: ethernet-switch-port.yaml#
> +    additionalProperties: false

[Severity: Medium]
Will this incorrectly reject standard ethernet port properties inherited fr=
om
ethernet-switch-port.yaml?

In JSON Schema, additionalProperties does not consider properties defined
within a $ref. Thus, any property defined in the referenced schema but not
explicitly listed in the local properties block will be incorrectly rejecte=
d.

Should this use unevaluatedProperties: false instead when inheriting from
another schema?

> +
> +    properties:
> +      reg:
> +        maximum: 5
> [ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005202808.1982=
164-2-robh@kernel.org?part=3D1
