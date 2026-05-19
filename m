Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF53A1A58
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176026; cv=none; b=mYYj+sqgeWfv/f++lOgO4Jcc8q4Wi507Ooqe1+0n6hx2+z3+Q08MZphdnFwCX4JdqY/W6aTV1yogW+WQ/Ent9bd6xTbLGi+LCDy2uiSBnKKJwuzeNth3kc/qe21xxXrfl9vr66hY1PgJIDX73LBYnbPMEDFDz3ZQ5yjG7cV9dHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176026; c=relaxed/simple;
	bh=kO3/ntGo+m5RAcVFPTsPLt1JMQFHv2QCaQ4f4egQIM0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z2xH7kkXOyap+cwc8yz7chIklumPYegn3ghBzPbdvD3a+S8YjI9hKsDHNjhv/Y1NWq/pZSkjlWYCTdoWbe72+onxOq57Y9TVoH4hYM/GG8zsbTZ6l2qKFAfBIV6tTeX18WvOx3FVyPklDQErtpN80DncSrY2eSG4wIUB1ERi7IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9N0A7qM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9N0A7qM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BE9C2BCB3;
	Tue, 19 May 2026 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176026;
	bh=kO3/ntGo+m5RAcVFPTsPLt1JMQFHv2QCaQ4f4egQIM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A9N0A7qMLuKULEprY5CmkKgGJDabKEXrHNvUY0i5l/bZu2Px6lhxD2HpwUxMsgfn7
	 Q5PX12XKQZ6dClBXhVTM78u5OtgFb4O/xzqTVzOxH+lemfgVHBFoY9YONZXKtt2I1e
	 iiCiF1sqQkLTleTpaeple4gPSB8N0/TQm3EdRi4+cjb2kdPol4OezXOzDKkOpEiFOY
	 DInSDGnjCPdxUNuOeT8TwfGgTC877J9FRupfS3lljVDfVooGt4R5LLp8Kak2dKg1Wj
	 yRQQ4A+XTD62Ch8rUEMSo76Pcs04vmMx9tEVTTnOkL2FKJHPUFx3/mF1CJTXMMK4MW
	 iYkorbmnEyLtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/16] arm64: dts: qcom: kodiak: Add EL2 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518072856.22790-2-sumit.garg@kernel.org>
References: <20260518072856.22790-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:45 +0000
Message-Id: <20260519073346.21BE9C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `kodiak-el2.dtso` overlay omits the `iommus` configuration for=
 the `remoteproc_mpss` (modem) node.
- [Medium] The commit message fails to explain why `gpu_zap_shader` and `ve=
nus` are disabled, and why `watchdog` is enabled in the EL2 overlay.
--

commit b4ab2188dfbc3caab6111f1ec38bf830bc7a5ef3
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Add EL2 overlay

This commit adds an EL2-specific DT overlay for Kodiak devices to boot
without the Gunyah hypervisor. It configures the remote processor firmware
IOMMU streams to be managed by the consumer rather than the hypervisor.

Link: https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boo=
t-developer-touchpoints.html#uefi

> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
>
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
>
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-de=
veloper-touchpoints.html#uefi
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> [SG: watchdog fixup]
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

This isn't a bug, but the commit message focuses solely on the IOMMU
stream configurations. Could the message be updated to explain the
rationale behind disabling the gpu_zap_shader and venus nodes, as well
as enabling the watchdog?

> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/d=
ts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 0000000000000..0b3a69a0d7654
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: BSD-3-Clause

[ ... ]

> +&remoteproc_adsp {
> +	iommus =3D <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus =3D <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_wpss {
> +	iommus =3D <&apps_smmu 0x1c03 0x1>,
> +		 <&apps_smmu 0x1c83 0x1>;
> +};

Is there a missing remoteproc_mpss node here?

The qcs6490-rb3gen2.dts board file enables remoteproc_mpss and
configures it to load modem.mbn.

Since the MPSS streams are routed through the APPS SMMU on Kodiak devices,
will the omission of the iommus property for the modem cause SMMU context
translation faults and prevent the peripheral from booting?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D1
