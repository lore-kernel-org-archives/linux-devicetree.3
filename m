Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426C397E9F;
	Wed, 25 Mar 2026 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774481461; cv=none; b=Afg/1TFYTd4nY1WsV66UpZWmJ9ytQphdO1phiVxCppbK2sqccJHcnVaze+PbwxGXiEcXf1HjtkGLB6uj9s0th1viMJJVblYYrNVxKINt/m5ZZufD/yU4Ojsv+bFY9vG/bVJtdOdMLIzbZCxDWX+JHtU5tMod83roNZTv9mMpmiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774481461; c=relaxed/simple;
	bh=RMSeC2gAEh+2HdnAa6Jw3QK0vqH5MgV8KJw+tl+d6lM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iG3omFeXfjiH++Kp3UthUqDFicAptYlYBf+tHSMVM+CPUAv3NFwOmxXoOUaCivA5uXdUGzSB3SDlH5w1hXVx7Orn+JD9PcdbBPhppa6XkY3tn1urCZrmBkUtAQtNb9tAa16/d6bNiGfiqbpzyyMXSonMQFl+SHVZGqfo2NTgMWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ler/FPBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ler/FPBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6C6C116C6;
	Wed, 25 Mar 2026 23:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774481460;
	bh=RMSeC2gAEh+2HdnAa6Jw3QK0vqH5MgV8KJw+tl+d6lM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ler/FPBBGsKfW+vY5Xp5XWkUq2+2Eoo1J5IuMO+tsjyOcnObr13ZcaU8hEH3LS9OP
	 OxsP4VKOsESR4sRktrMGPJBk9M9ovQLyrlbjUBhE28CktfSmebsP3oxDNN6LMNb/3E
	 MZneOOIv4BC/hSX3c5SCrqPRKHuq1liwb++JMNAh4o3iOZKm3Qmdehb/NsuTIXUZTO
	 PJe3hGsFyK9k076rGdqOeoR6mLG0ily7/OFNGDtkzU1Iql4zVTVEpSn0zqyg5Z99gF
	 JS+3CZe3ARCydQ7xb4viSAWfHT4imjCZ/+9w2uFa6cRICRiJEDT84kjdh/jL5EXp2h
	 RnCIf9S6bFaxQ==
Date: Wed, 25 Mar 2026 18:30:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 skhan@linuxfoundation.org, conor+dt@kernel.org, krzk+dt@kernel.org
To: Udaya Kiran Challa <challauday369@gmail.com>
In-Reply-To: <20260325181509.3430-1-challauday369@gmail.com>
References: <20260325181509.3430-1-challauday369@gmail.com>
Message-Id: <177448145727.289326.12296113937712003366.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: mediatek: mediatek,g3dsys:
 Convert to DT schema


On Wed, 25 Mar 2026 23:45:09 +0530, Udaya Kiran Challa wrote:
> Convert the MediaTek G3D system controller devicetree binding
> from the legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v2:
> - Move binding to soc/mediatek directory
> - Rename file to mediatek,mt2701-g3dsys.yaml based on fallback compatible
> 
> Link to v2:https://lore.kernel.org/all/20260323180616.23333-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Drop redundant description for reg
> - Drop redundant description for provider properties
> 
> Link to v1:https://lore.kernel.org/all/20260315080302.454233-1-challauday369@gmail.com/
> ---
>  .../bindings/arm/mediatek/mediatek,g3dsys.txt | 30 ----------
>  .../soc/mediatek/mediatek,mt2701-g3dsys.yaml  | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt2701-g3dsys.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260325181509.3430-1-challauday369@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

