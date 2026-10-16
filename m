Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA536167F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144381; cv=none; b=ah+Iy2B4mTLBjga9dOusCFlREbTnzx9ir/1E1Fo1aSBB2NId5IhP8V21qXeEw4hr/LqHduzLA3DNfAsrNizN+tzBiy0xCGRWiEwvrw94K5uEo5WTUr06cBhmJ0+Gg4WU1uCEuOxZFHoZ9LT9xsnwq+OJj+KU1LbN69vaCmqQQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144381; c=relaxed/simple;
	bh=DDExj1MWc7Lt5pOn05kVR5vlfWagXEeRBS8CilbRSsw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NZgYv1hiyXiu+4n6RhGmge52uxrnyfnvSj7esB25PbEw6SUn34Uzp8vMPaTtxyM6aPymM8v4AQWfFcTueBZQ2hj4i2+U/WTB7HM9TdbAKNcjAV5uwLRu07kv0fAPmNhY5Z4K2XBM1Qnd5iCtN8V/A/tH/T6ETG2Zf34StM0GpSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewiE8pKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewiE8pKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB5B1F000C4;
	Fri, 16 Oct 2026 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792144379;
	bh=SXtJkfRpkAnzdF9kh/Hvk3Tf8j5iTeaB2s7MKsh6IAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ewiE8pKYf/mAvSIEUHUf8ulbY868tiNjP3wtNWnbTqt7Z9HpBLqq9UN9Cu7oh093C
	 jG87Zo0bBP/SuFLOToRJQkYe1fugpbKjU+cq6A/Hwq+D6wpZ3G6HkuTTmdKLZ2kXIp
	 cyTtYVIkck55mstR0bh6xHFJ85Hut3F5ooEX1E3+Vz1YCGY4y3AkGC+WVe2ayeiDXP
	 HAV7s3W4hR0Pf8OyeyQGQMJdCSwMwi+QbTMYHR/DelTVJLVctge9Ad0pid9eNZLmQL
	 ImJBZVHIIiOvsZAeaOUHr70e5YbPJTBzAbgeUpDh9osWNp6zgFBx819srFtV85XqiQ
	 6Q+s3jheZgQwA==
Message-ID: <sashiko-outbox-174106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Document SM7250 SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-smmu-sm7250-v1-1-e11fc0384cfa@brar.si>
References: <20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si>
 <20261016-smmu-sm7250-v1-1-e11fc0384cfa@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:52:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: iommu/arm,smmu: missing clock constraints for SM725=
0 Adreno SMMU
--

commit 858a7b55acf188b45bbadcffa3b76541e3ae0d31
Author: Ishu Brar <patches@brar.si>

dt-bindings: arm-smmu: Document SM7250 SMMU

This commit documents the apps SMMU and GPU SMMU implementations found on
the Qualcomm SM7250 SoC. The GPU SMMU variant additionally carries the
qcom,adreno-smmu compatible string.

> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6748351c78122..86844cefa76a3 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml

[ ... ]

> @@ -116,6 +117,7 @@ properties:
>                - qcom,shikra-smmu-500
>                - qcom,sm6115-smmu-500
>                - qcom,sm6125-smmu-500
> +              - qcom,sm7250-smmu-500
>                - qcom,sm8150-smmu-500
>                - qcom,sm8250-smmu-500
>                - qcom,sm8350-smmu-500

[Severity: Medium]
By adding the SM7250 compatible string to the Adreno GPU SMMU definition
here, should it also be added to the subsequent allOf conditional blocks
that enforce clock-names constraints?

Currently, the SM7250 Adreno GPU SMMU appears to be omitted from the
allOf block that requires specific clocks (such as ahb, bus, and iface).
This causes the device to fall through to the unconstrained base schema
for clocks, which could silently permit device trees with invalid, missing,
or wrongly ordered clocks to pass schema validation during a
dt_binding_check run.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-smmu-sm725=
0-v1-0-e11fc0384cfa@brar.si?part=3D1
