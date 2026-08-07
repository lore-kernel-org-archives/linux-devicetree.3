Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03CF463B79
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088725; cv=none; b=qw4f/UbYwaA12IUfi7GCIiTGIdGLdSA64b5xeT4r5HcTnF6kGF2ThhYhFrTwy5k+rRTrc8diZVdYmpweo7yhsCf7VJk5OfCniNiFAZK4jBnak88mECLJGsTRdYXK8YFTX0CpRR7D89lsN2NArKvee9mtG65qwgEVCj9J4X1HR6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088725; c=relaxed/simple;
	bh=PYiOMj3HJW4uUxiNnDaMDTsU7ntwFoM1F4Ed1kjwHpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qCGa++Mrkdxtmw7xzEfEfieUlNnIi2dnrlDprBO1gQKxfBaj0RdEPUD6tF5sIeGMa36Ic0VZKVom1rKgU/YXWlYO56Js+oAs3oRPaHdRw+pv9aIX9Pn6DZNtmNAJt2a86psWPlx/YT3EfA+sc7AqRe13SZjkJJqbQQzYSP6oXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyLaq5v3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyLaq5v3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B371F000E9;
	Fri,  7 Aug 2026 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786088723;
	bh=sbfHJ/a6AKB7ZU6OUCHXYj9vPLua7+UrXvw3fMTE5iA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iyLaq5v3oVT4tvWVCOPaqXHEnHj2ZHy2VsU8JE5Be0jyWeiOkJF/ulqcoUWMAgCl+
	 IecTaK/8tyorRpQjTze4IdSUki1BQkWBbdZnZ+sCjwsjsgrVxNUniui1720A+k3YT8
	 wW/PmrPmm1z21x8DwBny6cvzXBy0bu244Un2BDB5N/H3WTrFIzy0vw6ELc9ZTfcCoN
	 0HN1Fv9JmK8a1lTW/HsnwQHwfYv831GYGFDw/XrqAX4HQsFZPHjuQdiXs6At1Jwwdj
	 59N4gYm9BAKNydbwoZULF7+DpCmBlqwT1ghC4iE4mxp4r+8v05tQn1s4tfl9PzWlg+
	 T8by0XYAPyORw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 1/6] dt-bindings: bao: add IPC shared-memory
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <7fe7fbabed8d932a9d8d82e64c9c4d76100964c6.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
 <7fe7fbabed8d932a9d8d82e64c9c4d76100964c6.1786010512.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:45:22 +0000
Message-Id: <20260807074523.37B371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new vendor prefix '^bao,.*' is inserted out of alphabetical ord=
er in vendor-prefixes.yaml.
--

--- Patch [1]: [RFC PATCH v3 1/6] dt-bindings: bao: add IPC shared-memory d=
evice ---
commit 41886074b8a6e75abf127210a8dc6414ebf6935a
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>

dt-bindings: bao: add IPC shared-memory device

Add the device-tree binding for the Bao hypervisor IPC shared-memory
device, used by a Bao guest to exchange data with a peer guest over a
shared-memory region.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7c..b11b3dd995a53 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -231,6 +231,8 @@ patternProperties:
>      description: Shenzhen AZW Technology Co., Ltd.
>    "^baikal,.*":
>      description: BAIKAL ELECTRONICS, JSC
> +  "^bao,.*":
> +    description: Bao Project (https://github.com/bao-project)
>    "^bananapi,.*":

[Severity: Low]
This isn't a bug, but should the bao prefix be placed after bananapi to
maintain alphabetical sorting?

>      description: BIPAI KEJI LIMITED
>    "^beacon,.*":

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786010512.gi=
t.jpeixoto@osyx.tech?part=3D1
