Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF493C1976
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760325; cv=none; b=SOpTVqMeIIugKAICTlOMbEeaHUx0t+WFXapSZDLja9OquwBLKH1VxsCfuQz+fTlH6JKw8s3QEtYHG+quHNLLrOBiSq7bbPesmKbOsEZINtTDlevgdxxFsWLMJCGkhVjiTquJl6tG0Q5Q37+HtjZN8+oaO8X+afGMzDflrsojE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760325; c=relaxed/simple;
	bh=zva+dUkpWGETYJ7mF6AsnBpM4TcXI9zS6K+u4RO42P8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ruclzxIm661wevzA4Eo1flZx+sGa+LuG26VVWRuU3yuFJMSpgHCBqie1++vxSW0z5fNdOcIzjSEszVmACUAZbyEjj8xSNYApy0HmmKNSXFfxjG2NId7nPNXtfGCK4n0vvY5XrdcrqQ9oIzkOMSoyxo6wZXfSrHWnURDHcigb+6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYFkKhdx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYFkKhdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CC1C2BCB3;
	Thu, 14 May 2026 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760323;
	bh=zva+dUkpWGETYJ7mF6AsnBpM4TcXI9zS6K+u4RO42P8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PYFkKhdxpl1OL7MQ89PfDL6LmSVRAin7hcp9FXXAfukHpXreWr/1IlWJKn2Agid1P
	 FcsaFQelwP01RXuz3v3WE+hY8sIPCH3HJhe7b4oD9mm9Gs9L7cB57X1BrWn0uNmatM
	 0Jz7tVk1cRvHxHrBDDXgttimci3LqEC/VWA2lgUX0ge1xP4FKiL5Qdl3B8OiitOfHY
	 +7ylBw+XVvYWARCzE9p3qydKYRfe9+l0MgajdrRATyGgAG+2Nqwk9qIq91lWTKA6V5
	 jpz1xUB3ZWYJ7xQBxS9kgzsZxbVGXrDy7nKMyb18AyjmDsdUhxe3NGbZKWhjoQlCxj
	 EWsldW1SjytOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
References: <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:05:21 +0000
Message-Id: <20260514120522.75CC1C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string `qcom,ipq5210-qmp-gen3x1-pcie-phy` is adde=
d to both the standalone enum and the fallback items list, allowing it to b=
ypass the intended fallback requirement.
--

commit 55b201f9c0cef59e94dd05d524ed71d29f4e86c9
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY

This commit documents the ipq5210 QMP PCIe PHY. It aims to use the ipq9574
bindings as a fallback, as the hardware is similar.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-=
phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.=
yaml
> index f60804687412a..1ac31439c20a0 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,ipq5210-qmp-gen3x1-pcie-phy

The commit message states the intent to document the IPQ5210 PHY "using the
ipq9574 bindings as a fallback". Does adding the compatible string to this
standalone enum allow device trees to omit the fallback and still pass
validation?

Since this is inside a oneOf block, a device tree could specify just this
string without the ipq9574 fallback, defeating the intended requirement.

>            - qcom,ipq6018-qmp-pcie-phy
>            - qcom,ipq8074-qmp-gen3-pcie-phy

[ ... ]

> @@ -24,10 +25,12 @@ properties:
>            - qcom,ipq9574-qmp-gen3x2-pcie-phy
>        - items:
>            - enum:
> +              - qcom,ipq5210-qmp-gen3x1-pcie-phy
>                - qcom,ipq5424-qmp-gen3x1-pcie-phy
>            - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
>        - items:
>            - enum:
> +              - qcom,ipq5210-qmp-gen3x2-pcie-phy
>                - qcom,ipq5424-qmp-gen3x2-pcie-phy
>            - const: qcom,ipq9574-qmp-gen3x2-pcie-phy

The gen3x2 variant added here correctly enforces the fallback because it
was not added to the standalone enum above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-pci-phy-v1=
-0-482429192746@oss.qualcomm.com?part=3D1
