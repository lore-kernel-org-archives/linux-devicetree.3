Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC833C518;
	Wed,  6 May 2026 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073746; cv=none; b=X6CYoG3g6cTyzXTn6Jxc4L57WoNN6k+NVpuQzGKAR3aBNlojBKF4CNbnHc3xXq4rX+uIH3fJWcqWnkDZZaAI0ooIpMaHB8Zj4VNwuTG1J3q3A7uXhIfwidnMzOK60GuUL6oLyAUj2IWcpxEeDsd664vorEqzs592UveqJ982ZOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073746; c=relaxed/simple;
	bh=txNWG74hS7pwR6q9ysCCXzPNZmvNzSaAb+/IAkjuGKk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PYzLqmH446MZlZjA7fKchfqvV2YVGu+Fae4irGLVLVLV3DKsImXEs2gh3rQ9hWjqQXgGx5zMor3xG/hRT9vnhYb8DEw0/mNYOHspUqtNz/nmS98D+GW2L9XVZaJymAEvx5UYWGMUB9atNE+gnkmXRfZUUifDFfLUQhkmM5yF3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiRaMpBv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiRaMpBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1393C2BCB8;
	Wed,  6 May 2026 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778073746;
	bh=txNWG74hS7pwR6q9ysCCXzPNZmvNzSaAb+/IAkjuGKk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BiRaMpBvHwjkOgQ01obw9YRNpYyQfzB4tYh9vhxvwvDCmebFlcZrTBQBjT0xEshoz
	 2w2kMhX4dc81h4CzwzopUPmL4LbH+xLEAalsBigAX6a8FG556u9UBSWw0v/W7qyY8t
	 cS+j1reEozcasXSX8h4+NfZAPbxXc0HIyJHnPsAued5mO7VRF8o3WJgpTwRCeDHzop
	 ofAQ8rtcg1Pa9QM3n2uk/FjkVMTzQdhwzJROrXBpOQF1Hfq4rMHAMMt05+xSKHO2BB
	 46UQF+oLW+JjZR5KgE73yGral/ASMY4vRt7CAVwJjbDCQeKwkcgIcbXkzLBdYSv6Ne
	 bTe+ynW0Fcx+g==
Date: Wed, 06 May 2026 08:22:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mahesh Rao <mahesh.rao@altera.com>, 
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>, 
 Dinh Nguyen <dinguyen@kernel.org>
To: tze.yee.ng@altera.com
In-Reply-To: <09822cb8171f90d50c018f2f1fae5e5aab737301.1778070377.git.tze.yee.ng@altera.com>
References: <cover.1778070377.git.tze.yee.ng@altera.com>
 <09822cb8171f90d50c018f2f1fae5e5aab737301.1778070377.git.tze.yee.ng@altera.com>
Message-Id: <177807374335.1865702.3878759257634615890.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: document rsu-handle for
 intel stratix10-svc


On Wed, 06 May 2026 05:42:20 -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add the optional rsu-handle property to the intel,stratix10-svc binding.
> It holds a phandle to the QSPI boot partition (qspi_boot) for U-Boot
> remote system update (RSU) handoff.
> 
> Extend the example with a minimal QSPI fixed-partitions node so the
> qspi_boot label is defined where rsu-handle is used.
> 
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  .../firmware/intel,stratix10-svc.yaml         | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.example.dtb: qspi@0 (jedec,spi-nor): $nodename:0: 'qspi@0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.example.dtb: qspi@0 (jedec,spi-nor): reg:0: [0, 4096] is too long
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.example.dtb: qspi@0 (jedec,spi-nor): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'partitions' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/09822cb8171f90d50c018f2f1fae5e5aab737301.1778070377.git.tze.yee.ng@altera.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

