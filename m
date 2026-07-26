Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9407437A48A;
	Sun, 26 Jul 2026 22:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785104921; cv=none; b=gjfDinenJucEw3KrZ7NtNwDcD0n4boP6PHWVq8WAKyVIDLlXwuPnY73XRfXzOJ8/ual/Yg3S8Hh5N5tG8wTlURk0G+ajek4tXstRIbZ6+bNEIRHfQTZKTOuXDcGJO+W8Fi8Ukf36N6osGqFM5Gkhk/w141zMhEInlHGb3U+8VZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785104921; c=relaxed/simple;
	bh=2r0weuECXaeS2pHAAfZLICmOvKd9Jo+mcrRosKr2Ggg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=umln6VlM+zOc0i13ZtI9cjg3QlJzXpQkkkrGmGHDBUMt9dzBh5GFWTCVTZ2IbLIs+BAwiFijjE+g/nxu/jWnA/vcHDx/67gnKnUXn2pMswlO6l4HgBqB8d88lXpiQ1CDUMUmaoJAeniOIUs7+oacfeZu3Fw7AJ6gXfhkrDxrfXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+hT7vnj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+hT7vnj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F211F042D2;
	Sun, 26 Jul 2026 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785104920;
	bh=agXXKbagGkgLFxXBmfBRGqsRctliVMF3Wid4vsSYwfg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=L+hT7vnjMpSg8IyDiQRtu37ye8mQR7cmeUddE+sRl2tWpH1wEbj2YBqYgLAZTtYDI
	 Xxm97BbE8/7DBhI0b6sk7ljh4ECuZOCVA5cDGBhqIj4GBP4+3Qknc0ZHo5PC2edve9
	 6EIYxWlWijDmxLYYP0g4trr8jh95NIWj39u+m19EZwjnR6h2F3T2PK3Dh96nzsc74W
	 k2t5cLzd7UD7Lrhmwth6u/Z1c1ndeki7DYzDO1NlwkZTX4xhNMn+YhnIvU10FNSgV+
	 uwkylE6BGW3Q2xicL9ng85LjvGtEjKmUsQfWBSOVOnkstlAiEQw9+6fTdZILxyLgjO
	 5bre7HAqGm1Tg==
Date: Sun, 26 Jul 2026 17:28:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hauke Mehrtens <hauke@hauke-mehrtens.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Rosen Penev <rosenp@gmail.com>
In-Reply-To: <20260726205518.6698-1-rosenp@gmail.com>
References: <20260726205518.6698-1-rosenp@gmail.com>
Message-Id: <178510491939.3431692.9862516903607892948.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: bus: brcm,bus-axi: Convert binding to
 YAML


On Sun, 26 Jul 2026 13:55:14 -0700, Rosen Penev wrote:
> Convert the Broadcom AXI bus (bcma) binding from legacy .txt format
> to dt-schema YAML format. This resolves dtbs_check schema validation
> warnings for the brcm,bus-axi compatible string across all BCM47xx
> and BCM53xx ARM SoC board DTBs.
> 
> The schema documents the AXI bus node with its required compatible
> and reg properties, address/size/interrupt cell configurations, and
> interrupt-map for assigning IRQ numbers on BCM47xx/BCM53xx platforms
> where automatic detection is not available.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../devicetree/bindings/bus/brcm,bus-axi.txt  | 53 -------------
>  .../devicetree/bindings/bus/brcm,bus-axi.yaml | 77 +++++++++++++++++++
>  2 files changed, 77 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/brcm,bus-axi.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/brcm,bus-axi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/bus/brcm,bus-axi.example.dts:28.36-43 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/bus/brcm,bus-axi.example.dts:28.48-67 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/bus/brcm,bus-axi.example.dts:30.36-43 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/bus/brcm,bus-axi.example.dts:30.48-67 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/bus/brcm,bus-axi.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1705: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260726205518.6698-1-rosenp@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

