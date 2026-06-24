Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CC321420
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319103; cv=none; b=Jih0561x+Rk5YNt/V1U2fi0VVd826BByTsuDe1h2a/F2IMcdqnqr4c+OH6baYrEkDVvjOSrlY1oocGzJcX91HR7hP1czSBIK5bV4YvSVT4PIr4T+NN2kn8PRJitpLUNsynQCY0NU2O6g9eD5LDs0NRO+XduH8V3qTLuqCON70+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319103; c=relaxed/simple;
	bh=ZdXf+VPFSsehTLfmSxJlLgAzC/WYxAfrc1iYRA3886M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rlNPGPReFFvtJFfxJLJtKb3POe6uUNSRbIWLhPSIVI+TRhUtjf7E4y46YQNH3ZXRalSBBD/eFV8Ow81JjQPVh854GtA3ViJ1dZzMuPOXsb8Xjm+K8ulu6m3a1meJeA2zkjew7r338FL31S3MV0Krfgr1tDhn8Ps+DGE8jwuS8Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SY8voQox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SY8voQox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745D01F00A3D;
	Wed, 24 Jun 2026 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782319102;
	bh=CCu2Kx0eSXVav3dvyRBCxGEAVm4wCX5k3MWTpIO96Ck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SY8voQox7nPnRj5f0T10OSRkCBXgiJ0vyTegRkXDQIJ6ocCbsBrW/bJVplipBfhjY
	 LAr+DA2jPuWJWTmUPSp+i8qNqQDm1Gw5MF6goCh1xEMKvZ/Ex1Rx4mTyBqtaLRS4Ll
	 RiSJyN3tXu4uc4q8YCw+FDoUoBzRj+9rnJFklLKps+vSO1WmztfvFmPX6lq7HNtE9y
	 4McRkRGO/c38f/o1nUA+/cK2ZxSsZYjeyFlNXsvkK0rTqISqLcVya6KXzXQnwWFNhq
	 8bS4+IK3PGfir/0nepKDoubYMr+s2JjMxv+EUXZgcJyp+Cy2nabjW6U2Yn7NiZ4BBw
	 +xLU3QxgvXbbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mmc: Convert TI OMAP2420 MMC to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624163112.535237-1-egbostina@gmail.com>
References: <20260624163112.535237-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 16:38:22 +0000
Message-Id: <20260624163822.745D01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `ti,hwmods` property was omitted from the `required` list du=
ring the conversion to YAML.
--

commit 2529eee822cb54c2e574fedc2f1d4933627359c5
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: mmc: Convert TI OMAP2420 MMC to DT schema

This commit converts the Texas Instruments MMC host controller bindings
for OMAP1 and 2420 from a text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/mmc/ti,omap2420-mmc.yaml b=
/Documentation/devicetree/bindings/mmc/ti,omap2420-mmc.yaml
> new file mode 100644
> index 0000000000000..794d5ec0b58e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/ti,omap2420-mmc.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts

[Severity: Medium]
Should ti,hwmods be included in this required properties list?

The original text binding in ti-omap.txt listed ti,hwmods under its
Required properties. By omitting it here, device trees missing the property
will pass validation, but could fail to probe at runtime since the legacy
OMAP platform code relies on the hwmod framework for clock and power domain
configuration.

> +
> +unevaluatedProperties: false

[ ... ]

> diff --git a/Documentation/devicetree/bindings/mmc/ti-omap.txt b/Document=
ation/devicetree/bindings/mmc/ti-omap.txt
> deleted file mode 100644
> index 02fd31cf361d6..0000000000000
> --- a/Documentation/devicetree/bindings/mmc/ti-omap.txt
> +++ /dev/null

[ ... ]

> -Required properties:
> -- compatible: Must be "ti,omap2420-mmc", for OMAP2420 controllers
> -- ti,hwmods: For 2420, must be "msdi<n>", where n is controller
> -  instance starting 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624163112.5352=
37-1-egbostina@gmail.com?part=3D1
