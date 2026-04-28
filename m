Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42D13B0AD4;
	Tue, 28 Apr 2026 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390220; cv=none; b=mShNikIQ3Bh4kKsyDpo9TIyMUyjHaJEBYmu7SzhRqnJI7HezOy7f/j7xic1uevwNfzGCmOjCm6IM0YVeXqVIsN+hcovpC1/XAp6QHHj2TQiOszAgCfJgYnjkOTuBX+0XUJV54C2dCEqT9y1M+3B9C0UbzIBGPAfyAXou39KzLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390220; c=relaxed/simple;
	bh=XzrMHAF1JiLzPgd85DH2hWdBbJJBg/LcbCEClJGvHKA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bDOSfhmJGaAJEuTVWDbxwLLABkwzBE6Kdt++hjKpOKC45ptI58SBR+jqKUPKxHrMlxDHtgsoEIWrtd7H1DjtPQsMne7fcENtvH6fdHvWiuURQfm8DkuiTeLVVYM670YjThbWfSR1xnTx+CqTLfHXQb3seMqvxuEUMmDPzAZe1RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIvuieUo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIvuieUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BD3C2BCAF;
	Tue, 28 Apr 2026 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777390219;
	bh=XzrMHAF1JiLzPgd85DH2hWdBbJJBg/LcbCEClJGvHKA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HIvuieUo5zJz3jUBNhY8wMeq0vuCnazYnSOXlh7s3PaVBwBjBNAjm9GnJMocFyPH2
	 Oc2V3vaM/JFVVj0QDsY2aezeTJWVYX8T1hgjF9MNVQzQS5Uj6xWMA6D5vYTLIWjU/x
	 DAMp8S0lr8VtWIhpKVc8dElUuNFB2tDQ5wvehX4KisulQ1JEjow2Bv1Umo7w0169t7
	 Vc+vplAOF/4PzxKJ7qYnFPhGsxM7tdRKrh+zLzQ5U82wgwPFFg/yIrWNzSktxatESE
	 SlrXVLW63vFurBqEeuJuihkWpN96EBYUfQxnDNuFv3eUGcjYx1nuTXo0Dn2mar8HFg
	 vV7nECfN4Fpow==
Date: Tue, 28 Apr 2026 10:30:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-1-1d8dc7620256@linaro.org>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-1-1d8dc7620256@linaro.org>
Message-Id: <177739021752.1965140.1805716611536838901.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: document the SGM3804 Dual
 Output regulator


On Tue, 28 Apr 2026 15:52:05 +0200, Neil Armstrong wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-1-1d8dc7620256@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

