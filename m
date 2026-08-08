Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085B837B00E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186011; cv=none; b=udpBxDH3y7TVVkYMwyJSvutksOCBbMxJLx7nethfCNUIK6mZpb7VGdLYtPto27kEoXoN+0VflL1aGi4TxyUYY5AFMnPN9qQKjY+ObUPQIf+spzBHDPVa5/w5JndBvZfpnjlEnspKGsMu5PEegP7xg5SA0J07oU+Th3t3PUlUYb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186011; c=relaxed/simple;
	bh=NRURPLcjMNVQbuP5zm0/yQ4rdENaeKdpYKqfEQMl158=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=owH9P/g7hCXIgz99d/zFKdrkxvV9RYC2f3DKKe7zuCX8/27EBpb8TSDN5K9LRZavr4A7JZxY6/dvwidh1lg6oE+bCsi9sQyeh/R60ZRIJxvEWImO6yrgxB9Pr3Us8CCW7aQsvckjVG8c9MIv7GzlMVNXUzffa5wyn4zsnCCMVFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7r1qh8j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7r1qh8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1311F000E9;
	Sat,  8 Aug 2026 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186009;
	bh=jdk8+Uekx8rvyACrpvUm+E1yl8yb0LYvr/MiaknNM1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W7r1qh8jpDlQVo4Y5ERBP7GrahADChmpKVYUeqfE789j2SWrT2Ws3/c50cSmkxaAV
	 oNYb5AmhFe/mKwp4UGbks892aPjE7sptUQY9hvKKZP5TcnYAWS1iIj9uVNfHLWiPU8
	 dEAbMPSP9mHUR9ncWQvFcTMOX4e4IoeZ/VdrwBx96zkMbjk9thZ/FMlLNj5cQZaSgg
	 y9sKeoWPN+OZbKOHdNFy9Bc7ZN4/NcmwWHbo93aXMSAL4gxdK9wtFBAFREoSLy7BRo
	 Ac1TU0lqVi3fCFQ/IapuozgMrbkFUOU2Q3XNkDT4OdjjMLeP11TV4b7jIpyFr1i/j/
	 AYzUKTtlgLp1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/20] dt-bindings: net: add Xilinx TSN Endpoint
 Ethernet MAC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807104431.157230-2-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-2-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:48 +0000
Message-Id: <20260808104649.3A1311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The explicitly named child nodes `mdio-mac1` and `mdio-mac2` violat=
e the `$nodename` regular expression constraint enforced by the included `m=
dio.yaml` schema, causing `dt_binding_check` validation failures.
- [Low] The child node pattern `^ep-mac@` is incompatible with the referenc=
ed `ethernet-controller.yaml` schema, causing `dt_binding_check` to predict=
ably fail.
--

--- Patch [1]: [PATCH 01/20] dt-bindings: net: add Xilinx TSN Endpoint Ethe=
rnet MAC ---
commit dd8b781a7775352bc408179a32dbb5d414517669
Author: Srinivas Neeli <srinivas.neeli@amd.com>

dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC

Add a binding for the Xilinx TSN Endpoint Ethernet MAC IP. The
top-level node describes the IP wrapper, which has two children:
xlnx,tsn-ep-mac and xlnx,tsn-switch.

> diff --git a/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethe=
rnet-mac.yaml b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-eth=
ernet-mac.yaml
> new file mode 100644
> index 0000000000000..00f52b7b623c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-ma=
c.yaml

[ ... ]

> +patternProperties:
> +  "^ep-mac@":
> +    type: object
> +    $ref: /schemas/net/ethernet-controller.yaml#

[Severity: Low]
Will this node pattern fail dt_binding_check validation?

The ethernet-controller.yaml schema enforces that node names must match the
regular expression ^ethernet(@.*)?$. The ^ep-mac@ pattern here appears to
contradict that requirement.

[ ... ]

> +  "^switch@":
> +    type: object
> +    $ref: /schemas/net/dsa/dsa.yaml#/$defs/ethernet-ports

[ ... ]

> +      mdio-mac1:
> +        $ref: /schemas/net/mdio.yaml#

[Severity: Low]
Does the mdio-mac1 object key violate the $nodename constraint in the
included mdio.yaml schema?

The mdio.yaml schema restricts node names via the regex
^mdio(-(bus|external))?(@.+|-([0-9]+))?$, which doesn't seem to permit
the -mac1 suffix used here.

> +        description:
> +          MDIO bus controller for MAC1. Registers reside inside the mac1
> +          reg-names window.
> +        unevaluatedProperties: false
> +
> +      mdio-mac2:
> +        $ref: /schemas/net/mdio.yaml#

[Severity: Low]
Similarly, does the mdio-mac2 object key also violate the mdio.yaml
$nodename constraint?

[ ... ]

> +examples:
> +  - |
> +    tsn_ip: tsn@80040000 {

[ ... ]

> +        ep_mac: ep-mac@16000 {
> +            compatible =3D "xlnx,tsn-ep-mac";
> +            reg =3D <0x16000 0xa000>;

[Severity: Low]
Will this example node fail dt_binding_check validation due to the
^ethernet(@.*)?$ constraint from ethernet-controller.yaml mentioned above?

[ ... ]

> +            mdio-mac1 {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                phy0: ethernet-phy@0 {
> +                    reg =3D <0>;
> +                };
> +            };
> +
> +            mdio-mac2 {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                phy1: ethernet-phy@1 {
> +                    reg =3D <1>;
> +                };
> +            };

[Severity: Low]
Will these mdio-mac1 and mdio-mac2 example nodes fail dt_binding_check
validation because they do not match the regex from mdio.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D1
