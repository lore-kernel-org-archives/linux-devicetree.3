Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF74A3412;
	Wed,  6 May 2026 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091807; cv=none; b=J4vh2H+Dqnx0uL1QLY3rocleTowf7L7MYorreiXHQ2EU1R1mRZwe3KIgTu5zOwzq4FbdTd1xweFW9EElXdm1id2pWe4wnAMdIj3F5hAEKuoUzdWjWVaU8X1Huxrl0H7eE2QMYJXxVadK2lRrKHJYkN3ox06BPgaV3ru/FDEDc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091807; c=relaxed/simple;
	bh=/SxnHXwXkcJ2w7XFQ1HeyaJ3OACr3W5SIqggah0abSE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=j9VV+ihzyKYNVkq+QhCM1VLOHpsBj/Wn5ZBGVrGvf3l0apyg8yz6pSkaUs+BcgoVNM4zdeu9r2IzGh4MZAZTC2ZKxb6UKed6GZhwUatX+IDG8hOpzmSQdQZWkbwxX5VM/Zt/g1iI/WUDzmveBN0UW/Taj8dEuoHRu9X0vJ0qFSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ4KhPTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZ4KhPTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB78C2BCB0;
	Wed,  6 May 2026 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778091806;
	bh=/SxnHXwXkcJ2w7XFQ1HeyaJ3OACr3W5SIqggah0abSE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dZ4KhPTeKCPdcIM3uY86WUQaB9adD2ubzosodrUC4/SwTpySCmDBdrvx67EYge27s
	 tNE9ZhkCenZ81z/D/SE6P01CwPW/ok2eBcI21VLgLzuObPwCSjREAKH+s1yRCg2Z0t
	 A7tgJMo8n3n7VV82r4DWXyiMHXSZmUynpjQzchs5OjVzEcmknRlUpDqnJtgyWzpYyd
	 1Lrq6sqOs1faA+8iVCd9c+aXXMjbONgx3lfar7Fu1uUVwXa7yCoMnCveVrRu08qOV1
	 KnCK4Wx52BWZEArM6SipxnPXahFsLVM/oQHlh0OEzyN9THeF2IFnZJK+Zhjw3ZavYQ
	 wMOZpnXGvONgw==
Date: Wed, 06 May 2026 13:23:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
In-Reply-To: <20260506170236.2610955-1-kernel@rembrandt.dev>
References: <20260506170236.2610955-1-kernel@rembrandt.dev>
Message-Id: <177809180119.2697484.15620649929174831633.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema


On Wed, 06 May 2026 19:02:36 +0200, Andrew Rembrandt wrote:
> Convert the ST Nomadik boards binding from free-form text to DT schema.
> 
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
> and keeps the existing example.
> 
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
>  .../devicetree/bindings/arm/st,nomadik.yaml   | 36 ++++++++++++++++++
>  .../devicetree/bindings/arm/ste-nomadik.txt   | 38 -------------------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 37 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/st,nomadik.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/ste-nomadik.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/st,nomadik.yaml: properties:compatible:oneOf: [{'const': 'st,nomadik-nhk-15'}, {'const': 'calaosystems,usb-s8815'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/st,nomadik.example.dtb: usb-s8815: ethernet-gpio: {'gpios': [[4294967295, 19, 1]], 'interrupts': [[19, 1]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/st,nomadik.example.dtb: usb-s8815: mmcsd-gpio: {'gpios': [[4294967295, 16, 1]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260506170236.2610955-1-kernel@rembrandt.dev

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

