Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F085A4483B4
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247939; cv=none; b=qobjdZO2EewRdo+TLZIf0f4/e5vN3KOZp1hVWsT4YZi/HvueUBfCHFOjcyDoPc5igqG/LXsoUh8z36+kMKrYjQwvnrwOkS4hVpmytp19MrOi8VaAyDwVsGmkqAsJevh3eRs8e66QMpdDTmyWwfnXskle805y/cl2f1W9xCGzXgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247939; c=relaxed/simple;
	bh=nDt2KWfLvQLrc6MnFeSfB8I/xqqnX8ZfjuYB9IDuHMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QALb1x5nv2o8oDpyCciYPBgxIlLuRpf1df4D26lanJXPLjUECHc/oN9RksK07J3M0aOvQvFUUylQu4h+IcKL644JXCqEDSNpHqqksGPO3sRTwD1XEG8xCcE34cO+zDZ1Ax6KdLdRu+t3ZeWI/Gwh1S867lsjo+PK2GXUFgz9ZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ly1dbJTZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ly1dbJTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD3B1F000E9;
	Tue, 28 Jul 2026 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785247937;
	bh=xB5rZSGr/YFZvB/o+ckYhhqfvNV9mGMcCSkQ/ohcJYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ly1dbJTZHVl5AVLbw7xR14VevrChTEF9w1yT13+/7eyz+HSXO6oMOYIWC0OWa9Hl5
	 SPN6ZfBWbl2KMsJD6BB8xtSQOAJ3FcQh+3wy0V1Xvu5g1uaJcHq/s4PEo7URsiptyy
	 IWJC+S75+G3XTMdxKDp+NYbZXBBwTlaK/5O+BQfpT2Cb1TPRCy796+h3xKeUKeCxc7
	 xzHnYVm/H4IYRCshSfSt1gi7BrvGrOPrCGKTxs6sBIo4puQqcj2t/CifRj0Yit/tUU
	 3QvwE8AfCQ2eBW97SsN91SIKQ59/qX7qPxyB/Qb4/q/Zq0qq8Jy0Hr7xAaDb4cFYv1
	 X64zxMEuJuQsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-tscss-v1-2-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-2-beed14e72510@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:12:16 +0000
Message-Id: <20260728141217.5BD3B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The DT binding schema fails to forbid ETU slice subnodes and relate=
d address properties when the ETU clock is missing.
--

--- Patch [2]: [PATCH 2/6] dt-bindings: ptp: Document TSCSS hardware on Qua=
lcomm QDU1000 SoC ---
commit fa3eee253cb3594f0f82d586d18506452f967b6b
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

dt-bindings: ptp: Document TSCSS hardware on Qualcomm QDU1000 SoC

This commit adds Devicetree bindings for the Timestamp Counter Subsystem
(TSCSS) found on the Qualcomm QDU1000 SoC. It defines the required properti=
es
for the core TSC block as well as the optional Event Timestamp Unit (ETU)
block and its slice subnodes.

> diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yam=
l b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        clock-names:
> +          contains:
> +            const: etu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges

[Severity: Low]
Does this conditional block need an 'else' clause to forbid the ETU slice
subnodes and related address properties when the ETU clock is missing?

The commit message notes that support for the ETU block requires the ETU
clock along with the slice subnodes. Without an 'else' block explicitly
setting '#address-cells', 'ranges', and 'patternProperties:=20
"^etu-slice@[0-9a-f]+$"' to false, a device tree could configure ETU
slices while omitting the required ETU clock and still incorrectly pass
schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-tscss-v1-0=
-beed14e72510@oss.qualcomm.com?part=3D2
