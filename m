Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420AF2F90C9
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739356; cv=none; b=fujUXZ64DunhV0vkYEe1fTGNexAPpHqzpjoIQXFearoPJaLJ59VjEUHIp8apxAhDhmMK6EuPuL9ez95zWG3pzsF6HrQ7z+M13O0M6nV/jPr7GwjuGvVEhkXIVdbHePSLS6oqRDvn54k7aAdlLYvUEEK6yBVCCEvxziy6LGo/TZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739356; c=relaxed/simple;
	bh=ESQ9ygx7/o7XG1yCUqui3+Phz7KM8mQeV4Qu20ESFbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AXikz1qwvH+XjQM/igDox3hrhRP/Ec3OAkGGz8ldCfv8/WOBEE2xT8d3zUlLRUktlBU4ldFcWrFdBzwTA8gB1i1yAdn2tNZIwahYwCFwH/+RXCm+VJGcIYPMU1MmWRKGzveVJ85vw8DNu/qUrN8Aovp4aoCe1+LxnjF+cq4od9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcV7natu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcV7natu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CC31F000E9;
	Mon,  3 Aug 2026 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785739354;
	bh=Snbv3v2TVH/6gH4/1UMBbF9DANIaFB7V6CtJl4q1YoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcV7natu0751wjWkF391MV92OWYB3n7L5/50rgDqjQfBqww+G+i9Oo+FC2eqjwYXu
	 HlhZVHsZ966cEaVercJSowVydJeq0Sjo5xxJgt2cQ2dRQZ6r3p8Fmc8JxjqA62ql04
	 M9sbL9k8AqAy0Ywa6WV26WnfkT5UYi3F/M4ZEpq7vf/Je5YWCh+wCjngGyq/JwfMzT
	 rjLt2rWiC+z9yALun7WDXUga8fxEKfGRVw+KLw8lj3wbGnWVW9OlqOD2Pxjt2R1PIW
	 DiO83Tl4wK71NGcLgGMRqMVWzQmmfZsrLDO3sLOt2IvD8Rlwk8EvvFfgv7LU2Vj/Jc
	 tQL5y2a1Ynizw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/28] arm64: dts: qcom: sm8150: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-phy-supply-fix-v1-6-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-6-5880630cde3e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 06:42:34 +0000
Message-Id: <20260803064234.A8CC31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: Swapped QMP PHY voltage supplies remain in sa8155p=
-adp.dts
--

--- Patch [6]: [PATCH 06/28] arm64: dts: qcom: sm8150: Fix swapped USB QMP =
PHY vdda-phy/vdda-pll supplies ---
commit ebfb4d71483e3fc04d67c48f9f15befd5ec2bbed
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies

This commit fixes an issue where the 1.2V and 0.88V supplies were swapped
for the USB QMP PHYs on several SM8150 boards. It restores the correct
voltages by feeding 0.88V to vdda-phy and 1.2V to vdda-pll.

> The QMP PHY expects the vdda-phy supply to be around 0.88V and the
> vdda-pll supply to be 1.2V. But these two supplies are swapped for the
> USB QMP PHYs on these boards, feeding 1.2V to vdda-phy and 0.88V to
> vdda-pll.
>
> Fix it by swapping the two supplies back.

[Severity: High]
This is a pre-existing issue, but since this patch fixes swapped QMP PHY=20
supplies across SM8150 boards, does it miss the SA8155P automotive variant?

Looking at the existing arch/arm64/boot/dts/qcom/sa8155p-adp.dts, ufs_mem_p=
hy=20
and usb_2_qmpphy still retain the swapped supplies:

arch/arm64/boot/dts/qcom/sa8155p-adp.dts:ufs_mem_phy {
        ...
        vdda-phy-supply =3D <&vreg_l8c_1p2>;
        vdda-pll-supply =3D <&vreg_l5a_0p88>;
};

arch/arm64/boot/dts/qcom/sa8155p-adp.dts:usb_2_qmpphy {
        ...
        vdda-phy-supply =3D <&vreg_l8c_1p2>;
        vdda-pll-supply =3D <&vdda_usb_ss_dp_core_1>;
};

(Where vdda_usb_ss_dp_core_1 is an alias for the 0.88V regulator=20
vreg_l5a_0p88).

Should these nodes in sa8155p-adp.dts also be updated to prevent overvoltag=
e=20
degradation on this board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-phy-supply=
-fix-v1-0-5880630cde3e@oss.qualcomm.com?part=3D6
