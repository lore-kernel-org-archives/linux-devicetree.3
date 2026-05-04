Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4837F00D;
	Mon,  4 May 2026 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901093; cv=none; b=UAMYGFW46/mZ2mrMQLrzDB6mlxdjcTGXeL5RwfAn+4cwsp3cDm5Wcwkq873CD+0rpNtAlExoNFHfPxPIe0ifUOq3wpDwwvzqjMxe0A7jc6/WKl0dkxyqPDrd9Q5/uP2yABy3o8zeNMFmnHh7meu4OilPvfD/Es78WgmIZ0DSxeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901093; c=relaxed/simple;
	bh=d+N16naXZK3ZcBUxz5pHX4aBroUPZ6XXDuRgAUPx3+I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JJmJyDZOc97oKDLsRxUI68GLT1imqWNFVxMUfjDSXRpaAVFV16NTuwOtoBkVWEbVsHYUVuSpQyF8yd2pqaOymFYTXG3AUMBxTePhwKC71jMp3rrdnfrGTEY4pS/4nC5OWdxTEZsfZ+oSYfEEEGIHrJVXMgOkl4oaPyThp6a5TLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUlpU4Mj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUlpU4Mj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF018C2BCB9;
	Mon,  4 May 2026 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777901092;
	bh=d+N16naXZK3ZcBUxz5pHX4aBroUPZ6XXDuRgAUPx3+I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DUlpU4MjWoO7VKN8XsTPxDMt4wlBsUdENYlXYqaeRhlBgqZO5HQp+2Y7r0+Ocd9By
	 K+9WRsAQtWkgdU6PqEpyB0qtxA18NCnBd64YoCde9Qx2P5aZ/GYu1X2AMeSQUlXQsH
	 8/OZ1kR59eUhKaSu05YqDY5tuTgVbOla5KP1O+s9PDHoETBOrwR8ejHgNXoK6ymY6q
	 mFEw2z0eYo/GcYopdsHec6ESrK8jBLHJCfKt9vib6UlSamXsDqdHxX7RDdSv7DnIba
	 d2gIFnU+4InP0FBLz5ZLdaBUjWGb2mC8lbqw0wIdycb6vdtuAqv1En7Mz6LMZYXAEd
	 w+A9XCB4QahvA==
Date: Mon, 04 May 2026 08:24:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 linux-kernel@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-1-c4783443890b@linaro.org>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-0-c4783443890b@linaro.org>
 <20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-1-c4783443890b@linaro.org>
Message-Id: <177790108990.3226681.10871496128113746457.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] regulator: dt-bindings: document the SGM3804
 Dual Output regulator


On Mon, 04 May 2026 14:44:05 +0200, Neil Armstrong wrote:
> Document the SG Micro SGM3804 Single Inductor Dual Output Buck/Boost
> Converter used to power LCD panels a provide positive and negative
> power rails with configurable voltage and active discharge function
> for each output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/regulator/sgmicro,sgm3804.yaml        | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.example.dtb: regulator@3e (sgmicro,sgm3804): enable-gpios: [[4294967295, 17, 0], [4294967295, 18, 0]] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260504-topic-sm8650-ayaneo-pocket-s2-sgm3804-v3-1-c4783443890b@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

