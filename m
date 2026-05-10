Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EE2296BC1;
	Sun, 10 May 2026 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435129; cv=none; b=mQcc0HEFmrKI8q7dhkn+m0Jt4wHiOLbreiEmho0eLT5eZ3FPNGm84/LejVt+MY6V0jdIvW7BNMdkbnTb+xk1OFAls7ZAkh2NZHK9lzVzdaB+OQNAh68zA/yfxFWziHWfPSmij6ciRHYUMdL8EYhaRuBhs2WDXk8hI7zNIcB14fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435129; c=relaxed/simple;
	bh=v8tjPqJayiaNCgrRc6AGcAmRFyUS5dSgQnulgFX4+Y8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bOcVeDWVo8wb5Q02Jw4bY7fbtv+agZsRzzodDRrlMmxD7wee98umGTi+zGNuC2OKbep6yVF0bfbRmLj5Yq5tTqFIKppEiLQbP1tWi3OpXwdpSqMtyrPebpAcQ+b37frocNthDnaiVRcz72pQQNWjJRv5fct8CpvBNBNoHDflzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqSHgJQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqSHgJQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD821C2BCB8;
	Sun, 10 May 2026 17:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778435129;
	bh=v8tjPqJayiaNCgrRc6AGcAmRFyUS5dSgQnulgFX4+Y8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nqSHgJQmVur+TYghaQt0RaDSfZPJNsX0/krSTlPzrMrD7tSd79o4brCsLkF3X6CRW
	 4O0H4t5pJdxNIAUNOZiBDMViqK/3FZiHEBSZYs1OaHbOcSYQk5tiF9AxHMxmWN/cTz
	 llzgi1d35Q1Y9mnPzEE1NfgGXCqW2CeUjW7q/XItZ/d7yFQHAmEl19lq2GfrByTy6q
	 POsC4/8/OYYakZlw4KaciXnuwxGgFz+CC14xjEfJafV0hrYQXDTXZvTn0/aRF8k8LM
	 AYDItioNK2EQYYy+cE3ryhJ5SfS/15VxX/2aYMm1+WzuBoWJuRz/GGRnuWyYGyQwBn
	 2Mu9swwpuzO4A==
Date: Sun, 10 May 2026 12:45:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
In-Reply-To: <20260510-sgm3804-v1-1-e5e8799e0aa0@gmail.com>
References: <20260510-sgm3804-v1-0-e5e8799e0aa0@gmail.com>
 <20260510-sgm3804-v1-1-e5e8799e0aa0@gmail.com>
Message-Id: <177843512496.3129220.15229933494716911310.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: add SGMicro SGM3804


On Sun, 10 May 2026 23:45:26 +0700, Alexandre Hamamdjian wrote:
> The SGMicro SGM3804 is an I2C-controlled positive and negative output
> charge-pump regulator. It is commonly used to provide the AVDD and AVEE
> supplies for display panels, and exposes two reset GPIOs to sequence the
> positive and negative output rails independently.
> 
> Document the binding for the new compatible "sgmicro,sgm3804" so it can
> be referenced by board device trees and the matching driver, and add a
> MAINTAINERS entry covering both the binding and the upcoming driver.
> 
> Co-developed-by: Philippe Simons <simons.philippe@gmail.com>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  .../bindings/regulator/sgmicro,sgm3804.yaml        | 60 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 67 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.example.dtb: regulator@3e (sgmicro,sgm3804): reset-gpios: [[4294967295, 10, 0], [4294967295, 11, 0]] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260510-sgm3804-v1-1-e5e8799e0aa0@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

