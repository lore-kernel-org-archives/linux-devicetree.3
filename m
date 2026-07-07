Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC2396D13
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416648; cv=none; b=KoQNu5uxZT84hboPsKibXrwk8k6hdzEM+BIHNAumNsw/DBcesd1TYHNl6edAVAhLQ1da/L9CjgmEc9k8D2yZs1BwfpqMtmIk+clbYV4qd+anWmq+BU6SaP9sHVF8DPyLcCbJY7Kspzjk0j7yvo08rxKVLMk92Y233Xi7RXkAKug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416648; c=relaxed/simple;
	bh=L2nmjS0SF5YYPFm8XgO4VT1vb2Fgocz9yMK2Wzc1Xko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U59EEY7bJJ4fmMbZlzfE6QIG41EX3dAyC8DU7EOMm0+lBCRPS07glutTGESMCF59OQ3fQfZln3qKXNGQXyuRFGmgY3j8IMsAcMCjB9+UbmBEho+qiMSBtE02rdvhcGEh8vw0Yc1uxJhbEeibYH8BJ7Tel7X3rcKePfPvOUKCTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ap0qOUP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ap0qOUP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7C01F000E9;
	Tue,  7 Jul 2026 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783416646;
	bh=4Kfi51voxQw1ZDguISJQwG8XRzPa4V/3dMBBpfq9UJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ap0qOUP8BqY2RqG7oV3PCB/LM1BLtA0z+yw7o7CTP8ev2xhhg3IZA52lt22H4+mGp
	 QAqV0cWplaRNnNEdbNA8zFcK+i1F/uR8zR/Ww1BGXyolNcKiX9aRMbMeH1Lg63ktuQ
	 9yD5fqvwuwdnXc3yOHI5gmwe+bZRE4SOtfi5dIUUZJZ2lRj9lVskRaUeGsASGQhgkD
	 vbDs9iAqZhOJeQuaY9+oco39aNfyFS6+tJN0mtzsfo5VY47oALmo3ycdn4HvpwFKur
	 18ITA1ZgLfZqHCQK48QwmhWez78N3c7TxzxSRRgZgpF7ab6Asmg4Nxp3WubIHSu6Rr
	 aj1I/NY0ZOVKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe
 issue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-4-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-4-bf733ed9ebd0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:30:45 +0000
Message-Id: <20260707093046.3D7C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Switching the traceNoC device from the AMBA bus to the platform bu=
s actively exposes a PM runtime / devres clock unbalance bug that triggers =
kernel WARNINGs on device unbind.
--

--- Patch [4]: [PATCH v5 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe =
issue ---
commit 614093568676102a83b2efb2ba08c1718071ad73
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: sm8750: fix traceNoC probe issue

This patch drops the "arm,primecell" compatible string from the traceNoC
node to prevent indefinite probe deferral. By using only the standalone
"qcom,coresight-tnoc" compatible, the device binds via the platform
bus instead of the AMBA bus, bypassing the primecell ID check.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index fafed417c66fc..1e25be41aef5c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
>  		};
> =20
>  		tn@109ab000 {
> -			compatible =3D "qcom,coresight-tnoc", "arm,primecell";
> +			compatible =3D "qcom,coresight-tnoc";

[Severity: High]
This isn't a bug introduced by this patch, but does changing this to a
platform device expose a clock management unbalance during driver unbind?

When bound as a platform device, tnoc_platform_probe() acquires the clock
via devm_clk_get_optional_enabled() in coresight_get_enable_clocks(). This
queues a devres action to automatically disable the clock upon unbind.

If the device enters runtime suspend, tnoc_runtime_suspend() manually
disables this same clock:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_runtime_suspend() {
    ...
    clk_disable_unprepare(drvdata->pclk);
    ...
}

Unlike the AMBA bus framework which automatically wakes devices during
removal, tnoc_platform_remove() does not call pm_runtime_get_sync() before
disabling runtime PM.

If the driver is unbound while suspended, the device stays suspended and the
clock remains disabled. Once tnoc_platform_remove() returns, the devres
unwind process executes the cleanup action, calling clk_disable_unprepare()
a second time.

Will this sequence trigger kernel warnings in clk_core_disable() and
clk_core_unprepare() due to the counts already being zero?

>  			reg =3D <0x0 0x109ab000 0x0 0x4200>;
> =20
>  			clocks =3D <&aoss_qmp>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-fix-tracen=
oc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com?part=3D4
