Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10E3043B2;
	Wed, 20 May 2026 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304411; cv=none; b=gQ1p+FmKcIwzGzeAEtQQr3/fBVUSRDRuADaYAmsMWaxEuRYzGVjcdkGz5etzeCtIVTZ2t0wXc/Kr4e1DHJk7s0PnG1pc3LzGphOJwJ2sDIskl+nZRtT10XSGKQb1+CkxHUt6NIovoPg2TL7NWHzeOcWki0dbIF7jazb4Mk9d1LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304411; c=relaxed/simple;
	bh=ZBDXZ1TBJKIHAKhS3hcJLJwp9I0C7De5IF2RWEissCc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=i3B87z0tWN5cn+Zy1dNMVXkS5ny6TxpM2dJyBUweZQ61nRuVHjei5zaiD2E3cb5TGC4tTiG9Ky7KTwzVvSh1+4WypcInp5o/EJmvQpmdxl12TDJSZYYhLSyjrSYRD0qceFBBwoVHeVrmRvg2PE0vGEGEt8vI1GQygSpBTpICtA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6ZbL5Ol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6ZbL5Ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED4C1F000E9;
	Wed, 20 May 2026 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779304409;
	bh=aZf/MJWlsL9cY3B7rpYGcrb+05RW9J9eyvAv6bfL6qo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Z6ZbL5OlWuSvBSPDzpSr0HmDz8cg+EKoKu6VynYW/HwwYz0DrUW36zsouZeIMJKw4
	 91pltaE6r8KC0PqGuX4yKNyTMmJo4Qz4QU4ivnUUmAKRrZNm4GAQfvm9AWzLHDTfqw
	 9guH99IHC8pheNT7sLIKN4qBIqf+4eO22atv+K0/R/6wNP6eJBLLoSzBSdPIX93Veg
	 waxRv27oo6TVVBxRbQCXw7W3dxNpgGKbS61gvCtJR/FjXZHlNdj9UnsnLkPTSZNscv
	 WgwtIRJdmO+9jxdz7eRR1QFoflU4Pc5JtNu+GGVWPDOa3jY5l2momm6su+mlBt/hXK
	 VR+EEU8vQz2tg==
Date: Wed, 20 May 2026 14:13:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 peng.hao2@zte.com.cn, devicetree@vger.kernel.org
To: Rohan Mithari <rohanmithari09@gmail.com>
In-Reply-To: <20260520164846.637522-1-rohanmithari09@gmail.com>
References: <20260520164846.637522-1-rohanmithari09@gmail.com>
Message-Id: <177930440887.676788.9065392133745048204.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: misc: add YAML binding for
 qemu,pvpanic-mmio


On Wed, 20 May 2026 22:18:45 +0530, Rohan Mithari wrote:
> Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
> ---
>  .../bindings/misc/qemu,pvpanic-mmio.yaml      | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml:33:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.example.dtb: pvpanic@9060000 (qemu,pvpanic-mmio): reg: [[0, 151388160], [0, 2]] is too long
	from schema $id: http://devicetree.org/schemas/misc/qemu,pvpanic-mmio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260520164846.637522-1-rohanmithari09@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

