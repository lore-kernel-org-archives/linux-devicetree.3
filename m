Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183155;
	b=iJWmrwG1ojl3srLW/Va2IxEly2hWVe39i6u5fjM1GdOWAtiU0qMRfRMAGpf1XKNX5Cvy
	 ixeMUf1YmUnL/Om8rNuZS3EAVGBVy9bt9QtEUSrMrMGq4GEQ+pb9e3/tDvFqNdEpormhK
	 yB4SEYvNlAqLHsBBMeRxOqpP6yYhRfw6kmQKOQM/qxBQiKhk+MgLs898WwxJqgOW8qUqN
	 98tgYjXmJSyalje/TwAdvrkcHJTWzATrzJK0UNve/PJGcNBF3EVpf7vawMHijyCY09lej
	 WnUi6sDbKbK7TZLLWTCaE7Rz3cmfVtWQ3eilVMvc+qKWHH3yZO3CFwUXFlxlg4Z4rRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183155;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qJf1rZ8T5+muvdqdrz1DCyygZgBOP0AJ33G12mcqPrE=;
	b=IWYGdsgyrsvZtVOMGQqj7J55BQuSC71x7XNMj90chQFqZfQFUSB0zV0LmQYicR67wSAy
	 vkVsNhnYUWqNiK4f/f8plxpFzLfY6XJNztlfrXi7mHQcuw0Z13DoZGhfxtgqTNQgN2SY7
	 KVhfGueo0G41BzsLzsYxjYIGXNfMKQ9AQZopENb2RrEFriODTSJ8pzlwd9IHEASumfZ5b
	 aZ0PLMr+C1Rs6KgV6CFseSOAPTSceMpKPwEJsubkFcDEtNERfvuemzZ7CaaMWLNDao9jo
	 q8pA1dwGI+8btzFqCUMjYGGfUa0en/9MrdkU+GWNpUhhblVoBF3b/V06xvseQ+0locg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6xe1bX7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9478606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6xe1bX7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF501F000CA;
	Fri, 20 Nov 2026 13:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795183155;
	bh=qJf1rZ8T5+muvdqdrz1DCyygZgBOP0AJ33G12mcqPrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z6xe1bX7jsr92Dm5eFMwnxUndUCRrXjaKEzITtIYTVMs1eYQeEQoeRnFb+1KFMxde
	 03tMUHRtPL95npPsfLHJU+PdgecGKSU6AaA5HWRUz51KeqoD4sruwi587c2A0iZKaf
	 7X8R5tu9WpUD7ia6SK66+ilqj1pt3EcxZ47vyRGhU1r+4EK5Us2N5vptIrqhFasBdi
	 QCBsyWP5n9Xdv+5MtgBR8W/te4LeKm0JLB+Ojzwy9zzNZVCN00iIRR2kDoAmjdYAHS
	 7xwSEeBGS4tUJLfMc2ImC5VPrzHJZFDL6PrYvIfDaFJhStc9gd5Q9nNE5HA7wFN9Rx
	 VbhIC9F0UYRHA==
Message-ID: <sashiko-outbox-225309@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 02/20] iommu/arm-smmu: Add interconnect
 bandwidth voting support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-2-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-2-be30526391d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:59:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] iommu/arm-smmu: clocks left disabled on
  arm_smmu_runtime_suspend() error
- [Medium] iommu/arm-smmu: missing runtime_suspend and clk cleanup on
  probe error
--

commit 8c75f1c42f79338d6f97167ba97ee3051a422cca
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

iommu/arm-smmu: Add interconnect bandwidth voting support

This commit adds optional interconnect bandwidth voting support to the
arm-smmu driver and wires it up for Qualcomm Adreno SMMU-500 instances
across probe and runtime PM transitions.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 8d50a4ad221dd..f015985cbb8ef 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2183,6 +2183,14 @@ static int arm_smmu_device_probe(struct platform_d=
evice *pdev)
>  	if (err)
>  		return err;
> =20
> +	if (smmu->impl && smmu->impl->runtime_resume) {
> +		err =3D smmu->impl->runtime_resume(smmu);
> +		if (err) {
> +			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +			return err;
> +		}
> +	}
> +
>  	err =3D arm_smmu_device_cfg_probe(smmu);
>  	if (err)
>  		return err;

[Severity: Medium]
If arm_smmu_device_cfg_probe() or any later step in arm_smmu_device_probe()
fails, does this return without calling smmu->impl->runtime_suspend() and
clk_bulk_disable_unprepare()?

Because devm_clk_bulk_get_all() only releases the clock handles on probe
failure without disabling or unpreparing them, a later failure or probe
deferral leaves the clocks enabled and prepared while devres teardown of
qsmmu->icc_path drops the interconnect bandwidth vote.

[ ... ]

> @@ -2301,6 +2321,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(=
struct device *dev)
> =20
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
> =20
> +	if (smmu->impl && smmu->impl->runtime_suspend)
> +		return smmu->impl->runtime_suspend(smmu);
> +
>  	return 0;
>  }

[Severity: High]
Does arm_smmu_runtime_suspend() leave smmu->clks disabled when
smmu->impl->runtime_suspend() returns an error?

When runtime_suspend fails (for example, if icc_set_bw() fails in
qcom_adreno_smmu_runtime_suspend()), the PM core aborts the suspend and
keeps the device runtime-active.  With the clocks already disabled, later
SMMU register accesses will fault or hang on unclocked hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-be30526391d9@oss.qualcomm.com?part=3D2
