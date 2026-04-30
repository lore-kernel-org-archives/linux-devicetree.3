Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0233FFAD2;
	Thu, 30 Apr 2026 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544745; cv=none; b=MV6WFhz1LPY9XxjOYMqSiSYHI/AhWiOWrMOpM7YRfyMrPHGaphHwDO+xwm+2bx5gRsQi/cF3U/rPGj1W2kdrtuNpxD/KFhETMJt0VfNnex9zwSyVYNNzm3C/yioIMaDdY2f08h2FJpwklkRdZjQdmlGGwqlPZje73BtaGpTyG+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544745; c=relaxed/simple;
	bh=5ZLSp3NgrFsyhNCbm6Bir5TxtWe4BzuV/5TI8I8E0OI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UJDZfk7OTQaDM6MRJH0fuiw+XulwWkXQ8ZBOmITCJR8Q3DzGOEeblUmuiGkY7JOJmjI1clzgIkpHwCFhXBjeB7Aaj5Eis7R6P3ly4Q6IOFGwGh4I+us4MTSH6MSC2na0KizA5qI+ofruObAj4hLIx4Z45uJsC9/D50EPZW+oM0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlBmJxcP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlBmJxcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E61C2BCB3;
	Thu, 30 Apr 2026 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777544745;
	bh=5ZLSp3NgrFsyhNCbm6Bir5TxtWe4BzuV/5TI8I8E0OI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BlBmJxcPrKemJe6kUE+B0oB2A2Z6jUq+1AyzfERDn71xhDpf0PaLm7p9V8Hbidj4c
	 XRWX20TsCynaYcY2wKUAMiYoTTjUfkh3M3XfTxwlQCFxTS8vWWg0lfqzBo+NGlItxu
	 iWB0C0kY+3+JWIuy6gznXJOIMsnsdz63uPiOiIiPkD5K/HsgLiJUUp8+wr4GfctkIn
	 Azci7gXAZAoZIaFyw5tb+oj1EmarFE+gxASCYxVtmbHojBCnouSLTct/VaCDc0C/G8
	 r9wLHiNO9jugfOvmvHShMZ6JoLRde0lG6HpIPmT4YhLO0kMDj/tfjM1/j9EcS6eq/m
	 pWFRpbWHmxBUA==
Date: Thu, 30 Apr 2026 05:25:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: KancyJoe <kancy2333@outlook.com>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-1-76108c65a560@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-1-76108c65a560@linaro.org>
Message-Id: <177754474283.3882695.10370238345575676551.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: document the SGM3804
 Dual Output regulator


On Thu, 30 Apr 2026 10:48:46 +0200, Neil Armstrong wrote:
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.example.dtb: regulator@3e (sgmicro,sgm3804): enable-gpios: [[4294967295, 17, 1], [4294967295, 18, 1]] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-1-76108c65a560@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

