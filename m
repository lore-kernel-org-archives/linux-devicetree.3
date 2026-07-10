Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2191ADFE4
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652061; cv=none; b=US0T693auE6xLob+CQwxTZQPlJgGze/OfaLrXntrPR7OJVG/XQPycjGjZc1ACMCRaKgsSkbsChQmvlGjDZUHByWUjkKInHIxUfDPsvttTPrmHa8pPQaLPn4wr1K+Syqc+bPSGRDiwp/mj8lzobqhERygn5AYeTqSpOdjcyfit2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652061; c=relaxed/simple;
	bh=xAfI9Cte2aMExBxVH+u0uIgAwkS7A46wKVXeFGtBWrI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ML/a14LsyKiHlS+FtzxzXEOnSbxw9F/Spzv+indbMNJJiUYC+eZT+FZsGGQJU0Yh+KZlEhJ1fbmEaZqMrBvMp6gYwBS7DDfd5urH006AE+Rr0HUYlqnsLuUFO3EJ5vq3F3YmF4J4LKhWbStTugMskCiR/A5RVldSLVNFAdT3H44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCMaKDRl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCMaKDRl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9797A1F000E9;
	Fri, 10 Jul 2026 02:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783652059;
	bh=JPMIWfqgT5UnvuVSLaVXftYkfC2QmSUurqf1mla3cyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cCMaKDRl8Y7KD3syKj1RVgtJ/H85k1A3+PfZja35+au9C7QvJ6OFMo68FnqIHNys/
	 j/jpqrp8oHi+BflppX9kz9nzL4RH6VbrCRGt6TRuxVPGtplnqll57KflidxYi96Y9U
	 9FfIXgqllCXjXG9da3lpmJgRDzEfjVTK2xNiFrL1VgQ8IlYApW3ExsQUAcDajIPGSY
	 5pDNGN1aleSetVxDt9a/yH77mb8Lj10jI6krRx2hbSuJMUuEMTm9FzvTS4Pwwu3NIf
	 hcvBR41Ou0FtUvm/J+j/yf+hMcs0E80yhIvTgpOEbFDNRgSHsfaYLx9xgvh4XKTuKe
	 O2/pIt0Etl6IA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on
 the platform bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 02:54:19 +0000
Message-Id: <20260710025419.9797A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Transitioning this device to the platform bus exposes an unbalance=
d clock disable (double disable) during device unbind or module removal due=
 to missing PM runtime synchronization in the platform driver's remove path.
--

--- Patch [3]: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on=
 the platform bus ---
commit c36a0dfa1784492dc5cc63336f15362356597417
Author: Jie Gan <jie.gan@oss.qualcomm.com>
arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus

This patch removes the arm,primecell compatible string from the traceNoC
node in the kaanapali device tree. This forces the device to bind via the
platform bus rather than the AMBA bus to avoid deferred probes caused by
invalid component IDs.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7aa9653bd456e..5d0e7e8c2e58c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
>  		};
> =20
>  		tn@111b8000 {
> -			compatible =3D "qcom,coresight-tnoc", "arm,primecell";
> +			compatible =3D "qcom,coresight-tnoc";

[Severity: High]
Will transitioning this device to the platform bus expose an unbalanced
clock disable during device unbind or module removal?

The platform driver's probe fetches and enables the clock using
devm_clk_get_optional_enabled(), which registers a devres action to disable
the clock on cleanup:

drivers/hwtracing/coresight/coresight-core.c:coresight_get_enable_clocks()
    *pclk =3D devm_clk_get_optional_enabled(dev, "apb_pclk");

When the device suspends, tnoc_runtime_suspend() disables the clock:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_runtime_suspend()
    clk_disable_unprepare(drvdata->pclk);

During unbind, tnoc_platform_remove() fails to call pm_runtime_get_sync()
to resume the device before disabling runtime PM:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_platform_remove()
    coresight_unregister(drvdata->csdev);
    pm_runtime_disable(&pdev->dev);
    if (drvdata->atid > 0)
        coresight_trace_id_put_system_id(drvdata->atid);

Because the device remains suspended, its clock is already disabled. When
devres subsequently cleans up and executes the clk_disable_unprepare()
action, it could result in a double-disable of the clock. The AMBA bus
handles PM runtime synchronization automatically during remove, but the
platform bus does not.

Could this trigger a kernel warning and corrupt the clock enable count?

>  			reg =3D <0x0 0x111b8000 0x0 0x4200>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-fix-tracen=
oc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com?part=3D3
