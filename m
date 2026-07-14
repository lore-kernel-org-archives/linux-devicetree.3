Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8E2EEE88
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005795; cv=none; b=nehEC7TZVBEMgyeOzbaTDplxofCuGWnGpqG6SoppqHHGbowXr2nU6tOk+j+LJrcHvApP8aySQ7miNgAb9N7Lx8JhF4aQtgUV73ew3BajJdYhTMX6TaZmoFgAaHOATm4o0Uyud9DZzPkG+f5X1bkdakxY7UUCqP4cO04DZte99BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005795; c=relaxed/simple;
	bh=ET2aT6q5/MDR0ejxYJ+058aGiATeq2HruGeYqbeZAuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JDsCze9e0WQ/JXdiauOOdpVChPEzdH4N0KrqA78UPQIPa8TMgiGHXpLu9ozdSDFzMTxlzXdeziyW9CyY7w8p341WDxKf5caOq0P1W0x1o259Mq28xjrMTKGJmHHWvcVv6FPF0y1arG6zXGUS57QZpoA2P0rDFwmR7IHyzEEjoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc/SCVTm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc/SCVTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACC51F000E9;
	Tue, 14 Jul 2026 05:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784005794;
	bh=0njb/l4wxD56mQ5y0lLZ/F40ma/ofszLddj+tBqNSlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hc/SCVTmmR67L4EEC8RqKtf1prL6ln0oDyZMk1NPBywjKoIwqOVg4PCsRsXxHHovv
	 /X+SGDUmSmmxP61U9rcTLK7ayWUfBj2afp2V5DfOpx8o+RfuSDX/AgVap4PB88mV0M
	 zTKPmo01QbeMHv5PSIwwEFuy29UIDZG3vuR432o/n6/+BXQkozaUexbzzB5Sg/Zx0k
	 QmxZRgbGUye+weTCYiJQR5W5iNnIlhinJuLYDdQZJNNU732oSLQU8GIaWy5KZzDgoh
	 Bq6xYhp8hUd9YzuYCgKmCeWpKbSUSF3V+nbq1Ez6KWhHjs/G8F36Y9jCg8dkk/BVgD
	 lPh83E8eOdoSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: clock: qcom: Move glymur TCSR to
 own binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260713-tcsr_qref_0714-v9-1-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
 <20260713-tcsr_qref_0714-v9-1-373670ab15f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 05:09:53 +0000
Message-Id: <20260714050953.BACC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added qcom,glymur-tcsr.yaml binding marks 17 `vdda-qre=
f*` supply properties as unconditionally required, but existing device tree=
s do not provide them, causing a `dtbs_check` validation regression.
--

--- Patch [1]: [PATCH v9 1/7] dt-bindings: clock: qcom: Move glymur TCSR to=
 own binding ---
commit 6bffb0197809346112dba264dc91035d8e1ed982
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move glymur TCSR to own binding

This commit extracts the Glymur TCSR block into its own dedicated YAML bind=
ing
file and documents the supply properties required by the QREF block. It uses
an allOf conditional block to enforce these supplies for the qcom,glymur-tc=
sr
compatible string.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> new file mode 100644
> index 0000000000000..ec89feff89e4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,glymur-tcsr
> +    then:
> +      required:
> +        - vdda-qrefrpt0-0p9-supply
> +        - vdda-qrefrpt1-0p9-supply

[Severity: Medium]
Does this cause a dtbs_check validation regression for existing platforms?

By marking these 17 vdda-qref* supply properties as unconditionally required
in the allOf block, validation will fail for existing device trees (such as
arch/arm64/boot/dts/qcom/glymur.dtsi) that use the qcom,glymur-tcsr
compatible string but do not yet provide these supplies.

Would it be better to introduce these properties as optional first, or ensu=
re
the corresponding device tree updates are included in the same patch series
to prevent breaking schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-tcsr_qref_=
0714-v9-0-373670ab15f9@oss.qualcomm.com?part=3D1
