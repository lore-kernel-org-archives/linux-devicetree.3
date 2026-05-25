Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB5361DC1
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690949; cv=none; b=VVIoL4bG45BYfDIiju0p+bmgAG01XTx+8ZfetmOyjT/rnIk35hpyz4rZYduq4c3wtRooCJg05jtpoodLfj14WPWZACT3EvF2xd8LJ4PqRxSmxzAYSUWWmZwsNfR4a67USdLzTNnk9j9p/sKbuNYGcZbHsNNXkQorcfuQArX/HK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690949; c=relaxed/simple;
	bh=Ll5OxlMbUQc1lUxvXJQgVAS4bZ2IieD8tWnYz5BA4NM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ipvh1wwdpWJG1Teli1JjfMr39czvrJ12SB6G3nvgRDSj/7hRVOIV+kAOlVA9qbXscIqLfIa9sdiHjS8Q7Ay7Urz4+2ueEalih8ixEaZqc1SN5ZxW7QC1quazS8e80ImOOTMkXjXvAMC0SK0DQvEEU0uU6MbzWiw8edDLJeQp56Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emxtNZcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emxtNZcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BF01F000E9;
	Mon, 25 May 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779690947;
	bh=KnmKX9i2whTcWGWVicS/utHP3fq10sve9Y6pqNq0IiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=emxtNZcOOlR18rT7t62U9ASlWVHxQP3qTEUpk43QPx+A9TP5aZJPRNjqB2qQRZrhZ
	 ReKt/KFeGyLqbcqUJkgIvPL5r6AuWaig4XCM91Bptr8/VXZPaF3jHubbBaAUXnwxiJ
	 rb1wnZ46hLzEQUeB+NPiLhHAbkA/uhQvP4BEhRCoFyTL5PgHfSHtWcnHOqMIQ7/Th1
	 sWznShWaD1naGEDnduvdcwsD0118/uH45IG8XaX+/iZPrO0KXClLTjQBm4dM5qcqIk
	 OdZhEW+eZU01Mh+1NxrMk4SAyxTBhhY7oEVM/Ttuwc+SuS5JbHFI7WqcA2b5i407df
	 mnWtgb1XohJOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com>
References: <20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 06:35:46 +0000
Message-Id: <20260525063547.75BF01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatible string `qcom,maili-smmu-500` was added to the=
 top-level list but omitted from the `if-then` conditional blocks that enfo=
rce clock constraints, allowing invalid configurations to silently pass val=
idation.
--

commit 2acfc9080d8935af07ba71f71f6ce29a2da3b7c0
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
   =20
Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to
physical addresses. Add compatible for it.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547c..4bd31aadc4059 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,7 @@ properties:
>                - qcom,eliza-smmu-500
>                - qcom,glymur-smmu-500
>                - qcom,kaanapali-smmu-500
> +              - qcom,maili-smmu-500

[Severity: Medium]
Should this new compatible string also be added to the allOf conditional
blocks that enforce clock constraints?

If qcom,maili-smmu-500 is omitted from the corresponding allOf conditional
blocks, the schema falls back to the default rules which permit arbitrary
configurations (up to 7 clocks) and bypasses strict validation for this SoC.

For example, if this hardware doesn't require clocks, it would typically be
added to the block that disallows clocks:

  # Disallow clocks for all other platforms with specific compatibles
  - if:
      properties:
        compatible:
          contains:
            enum:
              ...
              - qcom,maili-smmu-500

>                - qcom,milos-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-maili-smmu=
-v1-1-ec85b12fda83@oss.qualcomm.com?part=3D1
