Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED0E45DF65
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776792; cv=none; b=F26oLOb9y7tjvvOX6v48HAma6i0ARE282olJUZmS3r7zv/8kVFIv1e1FkhFlOkM9ntqkQuNoTj+KrER4NIgIybJmGeJJVWMizAGvHX9xdjjOwD+H40Y3v3WJVLUBlrgAQGS/vzX7Qbj8yRwLG7wP3wYv8bozoVcWNhvsU2HYqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776792; c=relaxed/simple;
	bh=lRWmVYHmNeTZNZaaW+jRBROShj42pPHUZTJPQCB7Jls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sx6eOTnl+p/0LgweIX+v23+LcwILiSwCJKVq797EbI/y/EpRFl8KHvFsic1BgGPVZYM0f0R5rJttYI3aWnue2qAZYJSP5VqBMkmTJbZRYr3EImqWnH/hDJ9+sOrjZxkUcThs06zVAAzFdB7sEo20otCYMhiBcxluVGWlnf2pEDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ht0D/efa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ht0D/efa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D591F00A3A;
	Mon,  7 Sep 2026 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776789;
	bh=Y7pKv1J08pMwQrcQ0JiNmKdoFvY+pm9u1QRvrER+kQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ht0D/efaRtyxzlxjIsCZ61HGvQoSHYRoGx2Awp9PUhLvLIlEriML8kur3ubzdtEx+
	 FC8TlQhhMTmsZyTHDUDQC4CZQEGhJZ3uOYNaJnHSX0SZc+IkPmIk5rSSfV4dM+qzTm
	 XIFmSlZTTgXeS9ZunIF/2bd9tbej+R/2GuwWHq6E6iJoNEd4OQ7eN7Sr/A9ehiDdTg
	 9cNrTzd3w8+YCC+UHO8SddPiNUBYvwNv0pfiteN/MsPVmMFIj/46JMTvdAH43EeYF8
	 wFeDz20GQKrLXZWxQe1tkHpjkU8WRq+HNGxjIc8sEpIsk4wM6cs2zZvNO6LYQKiSsE
	 03XKZ/9wuMhvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY
 nodes for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:26:28 +0000
Message-Id: <20260907102629.04D591F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Out-Of-Bounds array access in the CAMSS driver due to using port@3=
 for csiphy4
--

commit b61951f794c7b5b6c37a3dd0050221dc787080bb
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes for Glymur
   =20
Glymur shares the same IP as X1E80100, with three CSIPHYs that use
the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
on Glymur.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 624a9edd602cf..c463cde46cc41 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
[ ... ]
> @@ -1842,6 +1886,285 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
> =20
> +		camss: isp@acb6000 {
> +			compatible =3D "qcom,glymur-camss";
[ ... ]
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					camss_csiphy0_inep: endpoint {
> +						remote-endpoint =3D <&csiphy0_out_ep>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					camss_csiphy1_inep: endpoint {
> +						remote-endpoint =3D <&csiphy1_out_ep>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg =3D <3>;
> +
> +					camss_csiphy4_inep: endpoint {
> +						remote-endpoint =3D <&csiphy4_out_ep>;
> +					};
> +				};

[Severity: High]
Will using port@3 here cause an out-of-bounds array access in the CAMSS
driver?

The CAMSS driver parses the device tree endpoint port number and assigns it
directly to csd->interface.csiphy_id in camss_parse_endpoint_node().

During async subdev binding in camss_subdev_notifier_bound(), this csiphy_id
is used directly as an array index (&camss->csiphy[id]) without bounds
checking.

Because Glymur has only three CSIPHYs (csiphy2 is absent), the future driver
resource definition will densely allocate camss->csiphy with exactly 3
elements (valid indices 0, 1, 2). Processing port@3 will therefore access
index 3, which is out-of-bounds and could lead to memory corruption or a
kernel panic during device probe.

Should this use port@2 instead (mapping to the flat array index 2), unless
the CAMSS driver is first refactored to decouple DT port indices from
physical array allocations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-glymur_cam=
ss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com?part=3D1
