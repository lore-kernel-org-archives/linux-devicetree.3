Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653C248F57
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078746; cv=none; b=a13z8sxNXSeHRbMnB0dsfE1dUkPQyGP4F1XzCRIhXUuiTbunbX6EjmyHiEFsxd0bHLib+WkqGGp/othZ0PXN05z5fpafy2E6ZCP0WLZMe+2SouPpoEDOK1tkeU8QDTP+Ry521hQ1rJKp+Ni1xmC68ZTPwDpCiRIbYYQPQAYwMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078746; c=relaxed/simple;
	bh=l8SuxMOy8sO56luseahvr4+QTMTExd5/mTcfmgrX++I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=szK0HfR0ErKfiywP605IQSCoUlOTYJyJzOHZdqQ512OzoHbyQINQc4Mbgd3lFgh2MEYaYoKBJ9vVPBnNT14NCc/N6xrvtEKgTH0I9LzHuA2/jLtcOggKrcPVrGnZzqCjL0crpiv4oL5uJKgx55MtLXbzFmbA7Q/w7spHNoktH9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWnxOxQx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWnxOxQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C001F000FF;
	Thu, 10 Sep 2026 22:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789078742;
	bh=Rw2LGAUPWt7lqZZjipZgxgmpChenqfsnF1p7Rzc8HG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NWnxOxQxQ8aLrXJFrb2HQNFcyt1Z8sD25o86LvMv8Z4LvndxjvYAY+HRRqhZC1OfS
	 C8asMe5DigRaygy8XWu52p4vyIN8WKyHhZfu+eJvtQau3NytvIjJiD4RIES+5RlJak
	 P09old4TVRPj8kHB3sFeUTGcuK3SPreCeDyPYh8z7mptvNKv3295c4RikBcjSjdJ2w
	 RXTm+DsTj7P7oyAIih/8O3/xaes6sQDwtRtDgjHra/0iGnBzyD+4jiWlfhKzJH9IrJ
	 JwRxyiBpD0/ADyQSdIGp7BZoXmCWJ5dAVuDyo4u8iu3eWQ21kyJra+h58ELF2lUvcp
	 NbKHFNOYPmLdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: ti: omap: dra7: Remove clocks from crypto
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260911-ti-dra7-omap-sham-fix-v1-1-c430f01b4e13@gmail.com>
References: <20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com>
 <20260911-ti-dra7-omap-sham-fix-v1-1-c430f01b4e13@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 22:19:01 +0000
Message-Id: <20260910221902.53C001F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Low] The $id field in the YAML binding schemas for ti,omap2-aes and ti,o=
map4-des lacks the required 'crypto/' subdirectory path component, breaking=
 schema cross-referencing.
--

commit c96c7ea0473045fc72e713eb6392d7342cfcdd4f
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

ARM: dts: ti: omap: dra7: Remove clocks from crypto nodes

This patch removes the "clocks" and "clock-names" properties from the
omap-sham and omap-aes nodes in the dra7 device tree. The crypto
drivers do not use these properties, and their dt-bindings do not define
them, which currently causes dtbs_check warnings.

>     The omap-sham and omap-aes crypto drivers do not use "clocks" and
>     "clock-names" properties. Clock management is handled by the ti-sysc
>     interconnect parent wrapper. The dt-bindings for ti,omap-sham and
>     ti,omap-aes don't define these clock properties. Having them in the
>     child nodes causes dtbs_check warnings.

[Severity: Low]
This is a pre-existing issue, but the $id fields in the YAML binding schemas
for ti,omap2-aes and ti,omap4-des lack the required 'crypto/' subdirectory
path component.

For example, in Documentation/devicetree/bindings/crypto/ti,omap2-aes.yaml:

  $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#

And in Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml:

  $id: http://devicetree.org/schemas/ti,omap4-des.yaml#

Could this break schema cross-referencing ($ref) and cause dt_binding_check
to report misleading errors or skip validation?

Should these files be updated to include the crypto/ subdirectory path
component?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ti-dra7-om=
ap-sham-fix-v1-0-c430f01b4e13@gmail.com?part=3D1
