Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD93F39F8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114717; cv=none; b=jXET/KPnZgKgwzftbEw/wcEFzcZ4eno7kBxCEoUDJGgICjTX3ya7sLeRU7P8qrLMc8WMAzLK0pfzpiRvfknlX4th/PKLSLbIdGXSHh45njOMU/bg+pIh+biWA+ZOA3bgL/k/lo3uOvoi31KWrbjMlr28VGTyR0KVFG8FrCz6CNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114717; c=relaxed/simple;
	bh=XapvubZBbeYrAAyjh9gzFPv+lTOc6fUaqaZry4ft/Uo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SeEReEsFxzVfb8X+o/ZUQoifYd8kqxq7IhER+HlGx0dt+f+Ogb+djo7QWRGtdrdX+/4I1ok8l+UbS5f6zbs5BMOjhOz6+XcJZ5xR9kz+I7B+77WMJ9zzvY0dzZJAgQqHDZTGbA5mbv+k3rVoAXBgTHqA+cunNH3gXSP/V49VL6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeiULzxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeiULzxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F58EC2BCB8;
	Mon, 18 May 2026 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779114716;
	bh=XapvubZBbeYrAAyjh9gzFPv+lTOc6fUaqaZry4ft/Uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SeiULzxe7DazaQSUhaksY4SsnACoBcp2lYnj0PZeHyOBtak8zsUr+5MqsEfRWi7ME
	 5a60/ooOfIc2Ewq7sEsdAjl31YX4FQmah6V+E2I8NW8iznlMWwd8zMaJHCTGPnYg8U
	 uIdCc3E7ILvaHxr/4wbt6fKIvrjWWDG1+oQoPL91sSfrUeeugh2YU5Ei0Yc6hdOmag
	 UY9GI1pto6IuSeIQ+7dXoAFn/9qI6NZXFuWLNgV+ezW7KoYnasOSl4z1s/mErYcXeE
	 w1/8FASfcPOPs2klcrACtG6+KnYIh17+UpM46S5GYbOfmphavMVIs6HnWczeQyC/XF
	 p27eAq46p312w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: airoha: add SMC eFuses
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518142042.8331-2-ansuelsmth@gmail.com>
References: <20260518142042.8331-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 14:31:55 +0000
Message-Id: <20260518143156.4F58EC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `compatible` property enum omits the AN7583 SoC despite the =
commit message claiming support.
- [Medium] The `#address-cells` and `#size-cells` properties are missing fr=
om the `required` list.
--

commit e333b70b463993a4fe3c97641d9aaa8019a4117c
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: nvmem: airoha: add SMC eFuses schema

Add Airoha SMC eFuses schema to document new Airoha SoC AN7581/AN7583
way of accessing the 2 eFuse bank via the SMC command.

> diff --git a/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.ya=
ml b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
> new file mode 100644
> index 0000000000000..e21ce07c4f411
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - airoha,an7581-efuses

The commit message mentions this schema supports both the AN7581 and AN7583
SoCs. Should airoha,an7583-efuses be included in this enum, or is there a
reason only the AN7581 compatible string is listed?

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

[ ... ]

> +    required:
> +      - reg
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible

Since the schema defines child nodes (efuse-bank@[0-1]) that use the reg
property, should #address-cells and #size-cells be added to this required
list to ensure the device tree is structurally valid?

> +
> +additionalProperties: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518142042.8331=
-1-ansuelsmth@gmail.com?part=3D1
