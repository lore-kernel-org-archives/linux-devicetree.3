Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E0230F92E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662091; cv=none; b=llHWjUxxalCFCM3fmsAq3ygSCwrgyLCBmGyctKKDVOppV1ZuOT60CHzxVNieyTT5CZSUn1YxKPSPMYM0BFD61t9sweGvWoV2RwAXY09usygCpD6gBiuxUnJqCAvkMop0BU+vl9fvjbi/KvqCUe6ROL/JPGRkROeRMQORSZ2s5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662091; c=relaxed/simple;
	bh=y9OXC0iXqButq0JjjXpeWv0G8IxN4toU3G6J8bpckjQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KQzs1I97lt7lkvFVYkUbG6woiqDgvClCu+T838PIlA98uCIA6K2STLYxqNsLQ9po1GZ6e/jA9rLGk+dv1YBEZuea2Pg30SjyiMDBq8TfHunGR8wfCXLE8CGWacsFYe3m/ZJCWo2jnY6Gp1L9I1JpkA0pKqOBNEArAnxeB3b4NMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aF+O4l2H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aF+O4l2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBA61F000FF;
	Tue, 29 Sep 2026 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662089;
	bh=U8yCARos4Kw5l0GNkj5myUYQj3i7NVr+92u387TNiUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aF+O4l2H9DCJvKOpRYyrmm/5DU38HwJKpUgt3enJVDR/oZVYe/HHZchDisw3QGTfO
	 uHxzIvyZnqnjdDvC8OKNspp5tU0Fjf8CIwKNS49O0tqR3PkHY503MA3BpyzJyC5kfa
	 bFK3U2kzITHDDZxJSbYePI2NIGyIDqk7ql9DeN0iIBR56NKbHxxt67r8w0Dfh8xKnl
	 LG3ubPWwVCyNUb36O7aYdh3YiQ6hZCL1ZOC+aL7ekGoebtoEfSMwhBxAh8af1xjz8q
	 2/qHGNYDavziWPZjJUkXK3M8BrJFU1vFBEhTu6RY5vUf2fHCoZ6tkg5CiDfUTYhNXv
	 XblsSbdQZziSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260928-kaanapali-camss-v17-2-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-2-dcf3fd37f76c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:08:08 +0000
Message-Id: <20260929060809.5DBA61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: dt-bindings: contradictory port count description vs schema
--

commit eaf675a1ac25eea3cc950df0432cfe59f97c1517
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: dt-bindings: Add CAMSS device for Kaanapali

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss=
.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 0000000000000..1f8b18517e13a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
[ ... ]
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports, one per CSID. Each port receives the CSI data
> +      decoded by the matching CSIPHY.
> +
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY 0-5.

[Severity: Low]
Could this description be updated to clarify the port count?

The commit message indicates the platform has 5 CSIDs (3 regular, 2 lite)
and 6 CSIPHYs. The top-level description for the ports node states there is
"one per CSID", which would imply 5 ports. However, the schema allows 6 por=
ts
("^port@[0-5]$") and the nested description mentions receiving data from
CSIPHY 0-5.

Does the "one per CSID" text need to be updated to match the hardware layout
allowed by the schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapali-=
camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D2
