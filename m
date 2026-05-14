Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5262EC54C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729422; cv=none; b=Fms5F+AtaNZv981J0uzMwpDWxs74UlWCAPNAY+kfbfJc5lwCkwm2w3VGJsvS4UXCMgx2NhNwiRsyuZK1Hclu8E4M/leUlf4aVc13Ru1r1t2FaHDiJvsvPJHH7q/Z6itNWQRnXEB3H4C2nRCjl+L/hxoq9qV2VM5/2u18HmB9Cf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729422; c=relaxed/simple;
	bh=OxGnoagxW7dEhoqtpV8pwXIvZ7WOOPNW9+A+r7Z2aRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DgLYf26ogJdnimMrK8NeEjyJrKxR+8Wu+zbRoWzqaAqzK7wspDRTPxyUA/2joF0c0WRTmt/GuwDHbHyiq/B+1yVcmkfcI6NFZjxaUKXOBVdPaqpgJ0GqDLi0U65C7MGTW35G9tOk7qRDTGu+58nOlq05TQgr5C+hVCeg9jPsoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZ1WZ4cY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZ1WZ4cY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B53C19425;
	Thu, 14 May 2026 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778729422;
	bh=OxGnoagxW7dEhoqtpV8pwXIvZ7WOOPNW9+A+r7Z2aRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tZ1WZ4cYQ/Cx1eJJjsqae/AkMEnS/ypq+t86DTzE2gjmE9LmrmG5e0UQZMy1LjLpz
	 cdqYI5Y3n/4vIZgFh50SwgKxqrvf3SiDLoU26pycE02aji8YKoHAR44S3r9Xju9KF4
	 12m0BfeP+9YIxosggqFrR06TEWX+YcXsHH/ncM8D+gw9INggYP0EMo99kDzVBwdgLW
	 oqQvmZNV5VvTa1lX9IfMS37xkqrISyXS4oOzMkUI3oYLbfyqntwyVSD6MuI/j5ReRi
	 +h7AXVmMHfiXzfrd/oiH5iLE2e6JhHMK7lgQfk70URj4EWaol+rSbgK/8IGanm8CU8
	 msMaxeYPcRMjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: eliza: Describe the ADSP and
 USB related nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260513-eliza-adsp-usb-v4-1-839936e89aca@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-1-839936e89aca@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:30:21 +0000
Message-Id: <20260514033021.D8B53C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant `interrupt-parent` property alongside `interrupts-extende=
d` in the `aoss_qmp` node.
--

commit 83bbc0567b448712af4a939b7fec5336a2e27452
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes

This commit adds the ADSP remoteproc node, USB controller, and their
dependencies such as the IPCC mailbox, QMP combo PHY, and SNPS eUSB2 PHY to
the Eliza SoC device tree.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi

[ ... ]

> +		aoss_qmp: power-management@c300000 {
> +			compatible =3D "qcom,eliza-aoss-qmp", "qcom,aoss-qmp";
> +			reg =3D <0x0 0x0c300000 0x0 0x400>;
> +
> +			interrupt-parent =3D <&ipcc>;
> +			interrupts-extended =3D <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLIN=
K_QMP
> +						     IRQ_TYPE_EDGE_RISING>;

Is the interrupt-parent property necessary here?

Since interrupts-extended already explicitly provides the phandle to the
interrupt parent for the interrupt specifier, the interrupt-parent property
appears to be redundant and may trigger a dtc or schema validation warning.

> +
> +			mboxes =3D <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +			#clock-cells =3D <0>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza-adsp=
-usb-v4-0-839936e89aca@oss.qualcomm.com?part=3D1
