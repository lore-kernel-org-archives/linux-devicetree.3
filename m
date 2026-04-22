Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0939134753C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 21:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892928; cv=none; b=So8TWMG8MxYx5jJUg/KJdxaYgfF9i6nL1Bh3YgDvLO2aHhsgzXAwEtwZMnec1v/tjBYRCV6gbfHl2rsazRKzRjwgg81X4ODgiTuusoldtxYoqeoPX7GPaRPBbtFlTT1Km/hOCtjbq/8nDfGUSpeJ9CV18blJge2JQaT+NPwrFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892928; c=relaxed/simple;
	bh=wIstlHSEg0K6odddbs+hCfsyF55kNu3uGKrJzLuxTrI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=k6HGfCny5CUmdhi3bnEEquP502Lh60puiu2dydoVGqLtz2TkyoOKhLga4uOaYFTn5FZNl4aNEzwG7uFCX+P2wnV/SeyOmvDIhKF55oRPXY8hAgz6IY5BkuC5izTsdnTSAvDq6H7o/6/gEfx45AR9njATlqKHnpL1uDX2xt7JgMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFe8xmJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFe8xmJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794DEC19425;
	Wed, 22 Apr 2026 21:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776892927;
	bh=wIstlHSEg0K6odddbs+hCfsyF55kNu3uGKrJzLuxTrI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HFe8xmJZCmmnMXmXspsCJ6/Zkb9mr1rJdFgJ5097XITc0rJK2sLnCuMvPFVS5fFYX
	 5OVC9MBmVcZxMlcypsD6gVpRjX9/nFsc0LJr851mLK3d9W4nZqVggtE3eFJirmOcUg
	 uMU8AJrrP3ODi9z9nUAagGi/P9uRUbaUZ3/P+8V520C+lvtKApvPDonubDxIXx7Yoj
	 wzHw4XIOkr2xcT0qSMi7VO5VQjRGkgtMTRLD2I0pjDbQvHHMvRjQUgpuFm6CrNAJSZ
	 XOani/NJOwUBitRP1YUB+0OiH9Mjf36Fqrty0AyIKdhDCbz2lpca2A9ujYrkLojzHQ
	 8GmKLYkcCQAYg==
Date: Wed, 22 Apr 2026 16:22:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, puck.chen@hisilicon.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, daniel.lezcano@kernel.org
To: Shaunak Datar <shaunakkdatar@gmail.com>
In-Reply-To: <20260422200200.126728-1-shaunakkdatar@gmail.com>
References: <20260422200200.126728-1-shaunakkdatar@gmail.com>
Message-Id: <177689292549.3261512.6277878749670947769.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: hisilicon,hi655x-pmic: Convert to DT
 schema


On Thu, 23 Apr 2026 01:32:00 +0530, Shaunak Datar wrote:
> Convert the Hisilicon Hi655x PMIC binding from the text format to DT schema
> to enable dtbs_check validation
> Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
> ---
>  .../bindings/mfd/hisilicon,hi655x-pmic.yaml   | 89 +++++++++++++++++++
>  .../bindings/mfd/hisilicon,hi655x.txt         | 33 -------
>  2 files changed, 89 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/hisilicon,hi655x-pmic.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260422200200.126728-1-shaunakkdatar@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

