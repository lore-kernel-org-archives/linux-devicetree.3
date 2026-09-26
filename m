Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2637C930
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459977; cv=none; b=DpFLxuabIv+yjP+gvht8zkApzzPtd/mU8Zy0CKUv5ke8W+hQYWIWAduIbW89+/+Q/RBeV6I1WKissl0RXb2up1FkNELbRHtWuVTA9d1FtpANG9R7Na746+yC80IygSs0KHl+e26bStM5KvczY5T9+Kgkx5QSbleRNc0su/vgHMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459977; c=relaxed/simple;
	bh=PlrKuyRTGlwXZUqycKUyGHkiG/+H+j7JxHDTErULVOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YRG+EsDCz8+XYKuaT3SEvkFqZZttozrxWHA1Bgt7Qzk4SSjRPyr+SfRVn3QltqAgVV9GvE//r+mbzqqmb7Xcyql/F4rEgfCS3WsHvSCOedwFUSyoW8KFDM/l/5pJrNZsK+rwUdaFOH1BhtwA3/82ca0J95ncF8Co3K54d7FP2mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSGqwUlC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSGqwUlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8964A1F000FF;
	Sat, 26 Sep 2026 21:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790459975;
	bh=GEhi21bfMYizrDOOdutZ67ujwlmWb5mNqTnUeOwHRmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QSGqwUlCsvDd51q/CnQpw8TAJMsB2lbz0GYyjLbwxldpiL0szQ7mcrdlXT9Jh0ii4
	 JOgh/TL6TsFNYJN1StxKDtRn+wx2jxYotaB4OFar46Tr5vr/x8jqRBlf6TVddKeBub
	 d8JUBuH5jcNGxT65d5Qk5ggbGMGvS/zdcZeSY39LzoLQq+ggJCALftH1xCz9CcMJnP
	 L9LFbtG2EjLKwh4kXa8iD8g1SaoanjdN7RoHHmugkJ62aQNw1lkMY8VbMig67lZEuU
	 85DY9vMqNJ8yT62AajGCez7SoMbEroJPAvb66yYngwm0MsAWjtPujBzQQofIUCvUiX
	 vvRJeW+20MEUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Convert hisilicon,hns-nic to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925215923.2950950-1-robh@kernel.org>
References: <20260925215923.2950950-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 21:59:35 +0000
Message-Id: <20260926215935.8964A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incomplete port-id deprecation and validation constrai=
nt
--

commit fa2141e31377c486f984e5588eb02ffe70ed8443
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: net: Convert hisilicon,hns-nic to DT schema

Convert the hisilicon,hns-nic binding to DT schema format. It's a
straight forward conversion.

> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hns-nic.yaml=
 b/Documentation/devicetree/bindings/net/hisilicon,hns-nic.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hns-nic.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - hisilicon,hns-nic-v1
> +      - hisilicon,hns-nic-v2
> +
> +  ae-handle:
> +    description:
> +      accelerator engine handle for hns, specifies a reference to the
> +      associating hardware driver node.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  port-id:
> +    description: |
> +      is the index of port provided by DSAF (the accelerator). DSAF can =
connect to 8 PHYs.
> +      Port 0 to 1 are both used for administration purpose.

[Severity: Low]
The original text file mentioned the port-id attribute remains for=20
compatibility purposes and is not recommended for new code. Should=20
properties.port-id in Documentation/devicetree/bindings/net/hisilicon,hns-n=
ic.yaml=20
include a deprecated: true annotation here to preserve that constraint?

[ ... ]
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - ae-handle
> +  - port-idx-in-ae
> +  - local-mac-address

[Severity: Low]
Does unconditionally requiring port-idx-in-ae in the required list break=20
dtbs_check schema validation for older device trees in=20
Documentation/devicetree/bindings/net/hisilicon,hns-nic.yaml?

If legacy device trees rely on the port-id fallback without providing=20
port-idx-in-ae, this strict requirement might cause validation errors=20
when running schema checks on older configurations. Should this be=20
conditionally required instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925215923.2950=
950-1-robh@kernel.org?part=3D1
