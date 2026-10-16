Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA8443C16
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149726; cv=none; b=S4SbHZde/MGLV82tQUEWA58sc//09f7ajedQgBCrdKEJcVOa0cZU5G+02mY2jkOnJszR41mKslqLi9yfahiFDKGfxKogMuDZfq76gs6D6neewIuW+g1tbpZQ3FsJBM47K1BrlZPbwUR54Rz5wux701oQ4sLfpU9DdyYsKvSC1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149726; c=relaxed/simple;
	bh=t9o20FrLrv6zKFiCTKi8oaRGYENAGnC3kqHMoULa7p8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RXzf3Fg+Qq3ZSMDyO2QR4WpAq/uqNgqWVlFAtH9xrVm0zhbArnSptTRBgW/+EC4E6/A39WI3EiklBULUwWkMN4fLUQESLXdHuOCeE3IcqgaiH6xZGTzt0dhhT8dce4pn/6M0pEQ4MFbQ6c0h7prb3J9irvE0otVqO/hEw5LcAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTGhsqI7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTGhsqI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E4D1F000C4;
	Fri, 16 Oct 2026 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792149720;
	bh=3Tu2aOutuJJJJnkR36Zyruce3tmrO2wUqHi3vW5rmJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTGhsqI7wIgVsX6pG6DS2QqgTreXmDt2s5PcEG9tPnEdpmJYjC+Y1sRvBsmedwm59
	 8LrEO2/1sCgvhA0ak7r9r5sjtztiYoZMOQMODqXPqBSL0+yTHVqgrfKpcCTTmfhW3G
	 pxYge4aHZFE6bRGdlCdGYnqyv5oCGWhwxFsRbiVNQTWVIR3XV0pYtHAGQn9aYxH0hC
	 mnVI+qQvy0aroc1Y6NYy3idVz+vFrWomvkWEgIXmpoVVjs4zfzLvxbXxGQx18kcUiH
	 qT0J+J+2dOlAC8/E1yyFluDwsavh/M+IHyxUK7DPgovX2hCIfb+ihpL/X9Hh4MYBuF
	 5ha/T40QMYtrA==
Message-ID: <sashiko-outbox-174240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 11:22:00 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: code and commit message mismatch for ADSP CB7 seconda=
ry SID
--

commit 65cfb3003140e4f5597259e88dcf55d5c0434c34
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: arm64: dts: qcom: eliza: Add FastRPC support

This commit describes the FastRPC nodes for both ADSP and CDSP remoteprocs.
It also sets up the ADSP remote heap memory region required by the Audio PD
and maps the necessary compute contexts and SMMU instances.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index a8042291bd075..2ad40cc3ce4f3 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> @@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  				label =3D "lpass";
>  				qcom,remote-pid =3D <2>;
> =20
> +				fastrpc {
> +					compatible =3D "qcom,fastrpc";
[ ... ]
> +					compute-cb@7 {
> +						compatible =3D "qcom,fastrpc-compute-cb";
> +						reg =3D <7>;
> +
> +						iommus =3D <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>;

[Severity: Medium]
The changelog notes explicitly state "Use the documented 0x1063-0x1066
secondary ADSP SID values." However, this node configures a secondary SID of
0x1067 for compute-cb@7.

Is this 0x1067 value correct, or should it have been removed to adhere to t=
he
0x1063-0x1066 range mentioned in the patch notes?

> +						dma-coherent;
> +					};
> +				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-dts-qcom-e=
liza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com?part=3D1
