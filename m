Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4B73BD22C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290535; cv=none; b=qaXoyiWJbSNn6bkvcsO5CoP8JCfrYIDjXpwmOiic1ahU6Z4x9wH8p7BWocFI1n67xPoOWLF9bDmWtSiyfezaibZD+k+4cR6jkb7G/Bd/NIDccrxJpcUBBZHaRHqkrqksGCok3VTnO//VZ3/USbn5S2Jr+jkybBPDwjOqwrfmxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290535; c=relaxed/simple;
	bh=jvwmCFAqpm5odRmwTRFCmDSGosxQjTBJ+UQ8PKioVR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EHgNh4/THuU0vh5zuFUQ4n6UuX3hAx/DVy7I2Dzl+Fm0mDh5zsegWkpLgceHev071VquHf9+0KSQGSXWkLoQxKrwqNArQVK9ZBX3s7RAZngqtJXOVH3Rctmc+FCki2Piri4EB9yMyfrKVcocwSDPitpJo6QooMiK7//VR5khQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaTNhySE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaTNhySE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6281F00A3A;
	Fri, 17 Jul 2026 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784290529;
	bh=/U97mfHx2joEgieqIr4cyqt2+j85wp7+/wR/LK7PBiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MaTNhySEVYdmpRrmiyaG4DvNdY+7y0V64EE5/XyzVZxiALbqkcRX7asbt3GyWGozN
	 CElePrBIzGxMvMmJGQ2ye4thu2z8eiH9U6f0DfH9tZYKZfz0EljObKOypR1UyAwp+M
	 XmT6bvEvWrQmA8H+Xe+VFHEmfh/lOu3UzfvXYQYRcjzPk6/AY2y0v+Uj+F9e9NKG7B
	 JAAMcBm5CnLrbowcJIA80FS4m6unX1X0tD/5oGiqZMn5Ss7KLwh7uY8K0b2DuWDlq2
	 mytfCUYyKrdAduD6pm3ghtPMEVdBDjr7hoBe/wM5TdkLbFm/V8/LSC6LcX57WiiVKe
	 CYohIwyZN0tiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Glymur QCB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:15:29 +0000
Message-Id: <20260717121529.9C6281F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree references a non-existent label `&remoteproc_soccp`=
, leading to a dtc compilation failure.
--

--- Patch [4]: [PATCH 4/4] arm64: dts: qcom: Add Glymur QCB ---
commit f3dbd3b60969af3a7e9b8324ba3c25e8c04a5c79
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Glymur QCB

This commit adds the device tree for the Glymur QCB (Qualcomm Compute Board=
).
It enables various board components such as clocks, keys, PMIC regulators,
PCIe controllers, WiFi/BT, an embedded controller, and remote processors.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dt=
s/qcom/glymur-qcb.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts

[ ... ]

> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/glymur/cdsp.mbn",
> +			"qcom/glymur/cdsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_soccp {

[Severity: Low]
Does this reference an undefined label? The remoteproc_soccp label does not
appear to be defined in glymur.dtsi or any of the included PMIC files, which
would cause a dtc compilation failure.

> +	firmware-name =3D "qcom/glymur/soccp.mbn",
> +			"qcom/glymur/soccp_dtb.mbn";
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-glymur-qcb=
-v1-0-aaf1cff84aab@oss.qualcomm.com?part=3D4
