Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C53F3C2BA8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876163; cv=none; b=PMdLG5JCDYcWZifUtEVatMoZqPolDMNgWeMbgDvNz7DQeTtWyTUGgKolgzU0/wlfh4fbFSrPkXhAuyedPAHVqPi2feGQxm38slxyyzJ93IlaFBxvfbt2YszY9K8c4XM+L/pud0tZl0F3qGOPgq7J8mohK2ob2Y2t9h7ohlmdUNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876163; c=relaxed/simple;
	bh=mEQtwxCaDvpgf0b6qFEbiPdETQ+FJRBg1zvn6KDGZSg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c0w++aJ0DxlXZ5Q5Zco1Rq4d0mS9yYkQWBTwGttaCXhVTybn/VptHwvPj7+2nk4Ch+JFskBch3HBoLDdbRei1x6BZVux9S8v8gOC4xAw9meqseu37+Zvs6DEEAcnBAev3jsiNZAP+2d4JMuKPkWXEFnf+3D5UhApYuNVX4lsWas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FR9L7+S7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FR9L7+S7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959731F000E9;
	Wed, 27 May 2026 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876161;
	bh=JAixvd4gSy3n16REjlIxM512gd/JcsjpopozONmjuhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FR9L7+S7cYuFUqTuMuuLnt8XYtMO+b3IwB5gI9cDl/UIN0tvrdde92r+5n+CU1s8h
	 iwlU6Scm7DZFPatJ1k9R91ShIAOk+OzIuWJEHtRFiHLXhAZ2WW2oA0G/Iteb1OsTnV
	 JEhw3yGV/7Kb5oyjFHf2JzMF4MDOGuSwzr5luSpCMpy1DEVHKAvXDm9OIR7RZ8Csew
	 RlQ/vK5lfI+Xd0QEmJ2lEOZH6y+kwoaGvJTPhzn3y06hoHrBO3SLHSnxHwqHFr1UEQ
	 RTL7KpoJAuunvO7cmGVdRymTFexBQxTeezguBylRXyaksZbsLsjCOnRbdkWjSX/SPK
	 sHEtEiHWItwGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/24] arm64: dts: qcom: sm8650: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527094333.2311731-14-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-14-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:02:41 +0000
Message-Id: <20260527100241.959731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size to 0x10000 in the device tree trigge=
rs a persistent boot warning and fails to actually reduce the mapped memory=
 region size because the driver enforces a hardcoded minimum size.
--

commit 5e3df9b8bc840c5ea7f6601a836f855af7f989d4
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000

This commit reduces the size of the first reg entry in the PDC interrupt
controller node from 0x30000 to 0x10000 on the sm8650 platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 1604bc8cff373..7a66b79ed336c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5987,7 +5987,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sm8650-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> +			reg =3D <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;

[Severity: Medium]
Will this reduction in the reg size trigger a warning on every boot?

Looking at drivers/irqchip/qcom-pdc.c, the driver has a hardcoded minimum
size for the PDC resource:

drivers/irqchip/qcom-pdc.c:qcom_pdc_probe() {
    ...
    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", node);
    ...
}

Since QCOM_PDC_SIZE is defined as 0x30000, reducing the DT reg size to
0x10000 will cause the driver to print this warning.

Additionally, because the driver uses the calculated res_size for its iorem=
ap
call, it appears it will still map 0x30000 bytes regardless of this DT
change.

Does the qcom-pdc driver need to be updated to handle the smaller size
without forcing this workaround before the DT is changed?

> =20
>  			interrupt-parent =3D <&intc>;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D13
