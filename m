Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0743812DB
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782283784; cv=none; b=UIgvoY13TMXG/LgubYWBnr+2xzMcMQd9m0zu3cy+BRFT91bZgpaBsqd08auPgsUT4UQktQcfhYoH+v4Apkiz9B3CtAuYeCkn099PFfWEytWR/IJn+0eDSzKjeDIXxH743Al9x4CkTNxnDjZ56We8wh4+uFDPjOpyKooKXIXbHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782283784; c=relaxed/simple;
	bh=TEisYLi3AyX1WJ0DhDmbhtDRJXcS76IbfP/OZFGlbHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pdBC99eWqadpcIH9243UBaLSJa6RCB4cI6lOxXmZ7l21xlj5kkHCFkkT1pVsRjXlUkXUz2CAJ/UWP3yLcLriorXR7ZmDMZqSkvTPNszbourrEdoc4opQ8O7S7d/bYxI4WmT1BWFsxsjDIrtNrCRgvGmqnyo95hNMpoV+DS+SxN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwS2lKWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwS2lKWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B5C1F000E9;
	Wed, 24 Jun 2026 06:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782283783;
	bh=obb3avcMiyMx4M/d0PaMg+nft9g+PvdLfNcLmS01ZeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FwS2lKWWJcBvrlZmikloBl3tofBhyxM7Qr+KJYMLQ82IVCuhKG6/wvMGU6VqTjiFc
	 uOP4PIfb8q72sSzPtiaOvEfCirWUbioGXC5KUSr5PnoeRRk/Z7OpcKI808wPQaAwBc
	 SbeC3Avho0pYMN0Xg4vzuguLoNNRX/p2sNlvQJm/WQclWTF0GKs1MG6QhO6jBwZP7i
	 EqajvReYL+4eqfibNRqMymgILWmIuQrdrZ/X+5aUs5jPxeg+cLra8sjz+hL9/KCF4A
	 yWkH/Qpoe4E8/BrrGJmN08EGYdLV5Z44uYAAcEUOyuZjoVhooIIJYTQSm7Fd10Dpt3
	 kmOhhqU23mrdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: fix traceNoC probe issue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 06:49:42 +0000
Message-Id: <20260624064943.22B5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Switching traceNoC to the platform itnoc driver breaks trace enabl=
ement for connected sources.

Pre-existing issues:
- [High] Probe error path unconditionally invokes PM runtime suspend, causi=
ng a NULL pointer dereference.
- [Medium] Driver removal and unbind paths cause a clock enable count under=
flow warning.
--

commit 152b245041f20740bb96bedaa8fe0632753867d1
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: fix traceNoC probe issue

This commit fixes probing of the traceNoC device by switching from the AMBA
bus to the platform itnoc driver.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 7aa9653bd456e..84561b5faf811 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -5003,12 +5003,12 @@ tpdm_pcie_rscc_out: endpoint {
>  			};
>  		};
> =20
> -		tn@111b8000 {
> -			compatible =3D "qcom,coresight-tnoc", "arm,primecell";
> +		itnoc@111b8000 {
> +			compatible =3D "qcom,coresight-itnoc";

[Severity: High]
This is a pre-existing issue, but does switching to the platform driver exp=
ose
a NULL pointer dereference if probing fails?

If _tnoc_probe() fails in itnoc_probe(), the code unconditionally calls
pm_runtime_put() before drvdata is fully initialized. This triggers:

drivers/hwtracing/coresight/coresight-tnoc.c:itnoc_runtime_suspend() {
    struct trace_noc_drvdata *drvdata =3D dev_get_drvdata(dev);

    clk_disable_unprepare(drvdata->pclk);
}

Could this dereference a NULL drvdata during the error path?

[Severity: Medium]
This isn't a bug introduced by this patch, but does using the itnoc driver
lead to a clock enable count underflow on unbind?

The clock is fetched with managed enablement in _tnoc_probe():

    ret =3D coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);

This registers a devres cleanup action. However, the driver also manages the
clock manually:

drivers/hwtracing/coresight/coresight-tnoc.c:itnoc_runtime_suspend() {
    clk_disable_unprepare(drvdata->pclk);
}

If the driver is unbound while in a runtime-suspended state, will the devres
framework attempt to disable the already-disabled clock?

[Severity: High]
Will changing the compatible string without "arm,primecell" break trace
enablement for connected sources like TPDM?

When probed as a platform device, the driver initializes atid to unsupporte=
d:

drivers/hwtracing/coresight/coresight-tnoc.c:trace_noc_init_default_data() {
    if (!dev_is_amba(drvdata->dev)) {
        drvdata->atid =3D -EOPNOTSUPP;
        return 0;
    }
}

During trace enablement, coresight_path_assign_trace_id() could fail because
-EOPNOTSUPP is evaluated as an invalid trace ID:

drivers/hwtracing/coresight/coresight-core.c:coresight_path_assign_trace_id=
() {
    if (!IS_VALID_CS_TRACE_ID(trace_id))
        return -EINVAL;
}

Does this immediately abort trace enablement for any source relying on this
traceNoC?

>  			reg =3D <0x0 0x111b8000 0x0 0x4200>;
> =20
>  			clocks =3D <&aoss_qmp>;
> -			clock-names =3D "apb_pclk";
> +			clock-names =3D "apb";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-fix-tracen=
oc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com?part=3D1
