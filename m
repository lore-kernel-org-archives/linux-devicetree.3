Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB42E7F20
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354928; cv=none; b=bj/K8TW90sN2ahufIjtJzpkm3HLTME4+KMcz/Tk/Y7CaqnNeRuXecbETYr496Vb9f9qTnzve9grGyuz2tViyocyanfePzi9uSvoabR5yBUREUXrFl1b0KWmjIcizEj/Iyv1i9Yui4jgob8otbHN9DcjdfSHnZRNk59/DG7JnBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354928; c=relaxed/simple;
	bh=Nz+ejGUEBKOuoNRM+bk/mx/LGFc10/ZG34Ekx40Ccdo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FHyT3rSwRFsQ4JKUBCSQs42Gkq16Mr0ADyjtqGEOX/JOMHtr4nYarhJlttl6mIsvmWetvle1bo2949f7gbib1doSppWUcu2Sp/cFw4maOIFlVkjzgN1m6zw88jF5i2M4DlYLPKIEQewX4jtpxFUcEocN/vkeBiijEsSjo55GrVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ba/9RJNj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ba/9RJNj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A941F00A3D;
	Wed,  2 Sep 2026 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354926;
	bh=MvVTWHru7oTxmoETB/QTMFC/CYRwHzUT5rI+gzfJ+l0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ba/9RJNj155MSUTGbsYaY/Pe5sCPO6HWgio23d9LSf7eo647wJMt8tXasxWR5UEEU
	 /y/62vtz5scvRj+Bfyau91rlSW2xH8JukShKPSZDgCAiK4kFDl+rY0iglUHPtlD/g4
	 VCNmXUqdmgHuEE3Hg1EA/Pvkptnm3pSiTUyJTNApaOCA2ki4WQ1AUmeRLhH20tFpkL
	 pAbiDWA4mau5r6ar5fLFyZi2qAn2dq0rQ7qAnbYtQPVtCsOOgq/JvH3o2kZ5125CY2
	 Qxepxgwo5/3jm4JiRzM7Cuo6OgIkA5isFXp9d9RFBiJF621PlufdhgG1ZsWe3Cgo89
	 pt/fj5uorPv5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: nvmem: layouts: Add Rockchip OTP
 CPUID layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-2-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <20260902-rk3576-otp-cpuid-mac-v2-2-e4b7fe2ab13f@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:15:26 +0000
Message-Id: <20260902131526.A3A941F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The 'mac-address' NVMEM cell node provides phandle arguments but=
 omits '#nvmem-cell-cells' from its required list.
--

commit fcf6d128e83a760e02cdd15150b742b14d86fe0d
Author: Alexey Charkov <alchark@flipper.net>

dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID layout

This commit introduces a new NVMEM layout binding for the Rockchip OTP CPU =
ID.
It describes how the CPU ID is used to derive a stable Ethernet MAC address
and provides the corresponding device tree schema.

> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3=
576-otp-cpuid.yaml b/Documentation/devicetree/bindings/nvmem/layouts/rockch=
ip,rk3576-otp-cpuid.yaml
> new file mode 100644
> index 0000000000000..85153d480950a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp=
-cpuid.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: rockchip,rk3576-otp-cpuid
> +
> +  mac-address:
> +    type: object
> +    description:
> +      MAC address derived from the CPU ID. The first argument of the pha=
ndle
> +      selects one of the two addresses that can be derived (can be 0 or =
1).
> +
> +    properties:
> +      "#nvmem-cell-cells":
> +        const: 1
> +
> +    additionalProperties: false

[Severity: Medium]
Since the mac-address NVMEM cell node provides phandle arguments and defines
#nvmem-cell-cells, should it also be included in a required list for this
node to enforce its presence?

Without this, incomplete mac-address nodes in device trees might silently
pass dt-schema validation but fail at runtime when the kernel attempts to
parse the NVMEM cell phandle arguments.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-rk3576-otp=
-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net?part=3D2
