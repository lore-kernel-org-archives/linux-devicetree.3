Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B28460
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876747; cv=none; b=d71GheVMbA9XboznNvVYkjcN0yB2BepO2VrvOLq7If4UIH71aXeFmxC+cGFGF72uNNJbYctCQdgeD9JyMjjQ1wkoJNteIL1HTWM5L5IIitU4qFY4gN7IoUBu+IUh5jf5qY5bFYHvryvEpUy6XmF1G8o+pufPY03gZGi0o7w366c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876747; c=relaxed/simple;
	bh=A7geDkCJhJk7zpvHPIcJfX9bOLRqtB9a2AcECszw5+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uMbujPfXqU95M/cgWo7IfvVpvT3EPdR6f+e5hOWeH8gr+G9fN9GoxCss/ZbdTYEXNEDaRy3UTvF3sLW/b+85O/ASeGMJSp8RkyJ2EFFQ06W5s6fpqi7ua4jLTm1ZtHftq51lmVdSSFyDbXWFlXHaWgGZJBTbEBRleMTucMcCHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaehvxW/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaehvxW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF851F00A3A;
	Wed, 27 May 2026 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876733;
	bh=vFOVTeyb9r+ZoLePYy8atx+Tk6L5VttwijcA1yhmpGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oaehvxW/lMKYivPbCs8EHtGeK6VrvXZjlrNBCwwuMMOzGcbxwJCocMcrAQuYp9Oxa
	 flL+fBboBL9IoHRuUobJGVSLbtoaC0unK6sJW9QTtVWcLjgCwWuzyxs78Ix3yApDOC
	 Kd3yt2JFI+YsymDXXTNbd0y3/EdxRJ0iF8rEOGsYX1n5JMTjuqH89sfBS0E1mdTyhB
	 1VjbrCht5dN1O/Pu5mEw5TKQQXzuSQ+VtjF0w0CjQ4IbcGQCycsv+CqihzwWe863wf
	 CfNdjbTYO9kUkoYDSHAyM9AFsU+eMMTDUVz+an6FrwHykehT25IpuQc9YovJQl9RoR
	 O6si+toZjDuag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/24] arm64: dts: qcom: sm6350: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527094333.2311731-17-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-17-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:12:13 +0000
Message-Id: <20260527101213.AAF851F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC register size to 0x10000 in the device tree con=
flicts with a hardcoded minimum size in the qcom-pdc driver, triggering an =
unconditional boot warning and failing to reduce the actual mapping size.
--

commit 69f94a7d9aef9ae59edc53727a9252af84f188ba
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window on the sm6350 platform.
It changes the size of the first register entry in the device tree from
0x30000 to 0x10000 bytes.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index 034545d2af2d1..771e25c63a2a7 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
[ ... ]
> @@ -2491,7 +2491,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sm6350-pdc", "qcom,pdc";
> -			reg =3D <0x0 0x0b220000 0x0 0x30000>, <0x0 0x17c000f0 0x0 0x64>;
> +			reg =3D <0x0 0x0b220000 0x0 0x10000>, <0x0 0x17c000f0 0x0 0x64>;

[Severity: Medium]
Will this size reduction trigger an unconditional boot warning on sm6350?

Looking at the qcom-pdc driver probe function, the driver enforces a minimum
register window size of QCOM_PDC_SIZE, which is defined as 0x30000:

drivers/irqchip/qcom-pdc.c:qcom_pdc_init() {
    ...
    res_size =3D max_t(size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", node);
    ...
}

Because the device tree specified size is now less than 0x30000, it appears
the driver will emit this warning on boot and continue to expand the mapping
back up to 0x30000 anyway.

Are there accompanying driver changes planned to support a 0x10000 size?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D16
