Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94236F8E4;
	Wed,  1 Jul 2026 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923980; cv=none; b=YbEG07uBnrecLENSgU519hKVqihDbzWtn0SOe5HzdWXscoovoEN/uz9uTrBy6uvnShfxNjldwDEI6teDSIBFHUPkd3pATQ/iD4gBVev1Pu0mKEBkLcUJiJ0WXNJHNBUvcnfR98NaZpF+9xrGNv3LARw/4/RHHb5d0ZEXFL4y2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923980; c=relaxed/simple;
	bh=gLQxvbQOOLcY/4e+Bw2EjCkQkfwPZzWVFEDv9j/iY/k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E3PeruIbGLcviDDCCSQ8BARy8NXiudpT4AdQXL5myZ9IDAFfXDcdH02zNlLnv2xCikdyG7GBFv8/SnfxfZ8znAh1/ltrpzQbwPXqQNFwGjxMc1Bd36zEgXeO9L+nsKW4pRbaPW32O2joRlBzMrHbzUZMBAC8zR+7Z8yU6PDGic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOTlHssS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOTlHssS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA6B1F000E9;
	Wed,  1 Jul 2026 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782923978;
	bh=i2S2b9gwlzlrq71xUZnAbbsrQZGU2konPvu0kspaKrc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=TOTlHssS4K3aSspdhrVxeLftNotWdK7iHpbdaKmIjM4RlIP1tQpKAnW8SMm6VCRat
	 /39KMMz3+qgUW5Naj0+z7EEn2VMW7tj4PGoQW44+mu/3BS6defuPfg0W5coObmn/WU
	 AcF1n9KzA0Hh3hEUNDIjrdVU5sm0pegEydrZsMFQl2gRLji8CiW3poGMOtDItqDytl
	 mUMq3BfN/jtR1F3yM4y/+Nakjjewv7zf3/Y+OU+eWvLkQXAnuXm/4XxVbUz1D7B9DK
	 coxemdeSqIbktji1xhEiS38VZ8Am6tF49pdaGEb8EIqqpYPs3TCAhXNf8YLCiz+/TI
	 om/TA0lzfDh9g==
Date: Wed, 01 Jul 2026 11:39:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Sumit Garg <sumit.garg@kernel.org>, 
 Jens Wiklander <jens.wiklander@linaro.org>
To: Xing Loong <xing.xl.loong@gmail.com>
In-Reply-To: <20260701132514.186953-3-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260701132514.186953-3-xing.xl.loong@gmail.com>
Message-Id: <178292397672.969186.6837238120896509616.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: firmware: add mbedtee,rpc binding


On Wed, 01 Jul 2026 21:25:13 +0800, Xing Loong wrote:
> Add YAML devicetree binding for the MbedTEE Trusted Execution
> Environment driver.
> 
> The binding covers two platform configurations:
>   - ARM/AArch64 (TrustZone, SMC): two reserved-memory regions
>     (rpc-t2r-ring and rpc-t2r-shm) plus a GIC SPI edge interrupt
>     for TEE-to-REE notifications.
>   - RISC-V (IMSIC): three reserved-memory regions, adding
>     rpc-r2t-ring for REE-to-TEE command submissions; no interrupts
>     property (T2R notifications use IMSIC MSI allocated at runtime).
> 
> Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> ---
>  .../bindings/firmware/mbedtee,rpc.yaml        | 221 ++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mbedtee,rpc.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mbedtee,rpc.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701132514.186953-3-xing.xl.loong@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

