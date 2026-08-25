Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EE3F1676
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655590; cv=none; b=lz5iAd5CLPKJ5il+N4+lXIAO4cmBtSpF0KxRhvjwAQkEtdLRVHT0vSDSFvd7Mnrpxm2ZIaJxfcA/k+2NdTEuDIgEUsQa5jULTBYjCMaowEeupBVj/VLpWDWOXUq1cIJbVfIuQKlkfcdbQq7wdsyf0vK4Vs26aJdrc8faMd7X600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655590; c=relaxed/simple;
	bh=/C68qQFH+umnvfPFHdxViGdydqSi1CpVpa7+mch8ZEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kfdZdTB+msrlxCWikRmW3AjxMGQNEolFmzvcSHU/pa6Gr0tCQGbwKEuOfIAVnjiPHEpnUUb/hVkHqw0euyxTodUyegxcSIVa0M/LGcf4guKHieFWF5aKPXaYzVq82Uwlo8DJabnqkk0X7f4OkOO/MVyMXWq+/5G4xW+jTiZkxQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+toA94H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+toA94H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2301F000E9;
	Tue, 25 Aug 2026 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787655588;
	bh=VNShuSIn7VTnKRwQGKV+MMP/gcdBC83GLVtPmKqAnMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+toA94HLQjfgUGQX3x6Iyh9ICV9zk50Ye7VwU56ut5fkSnEnZlxti/FBfSzAGKwd
	 FF+uWN+5AN2iQLzEWDTUv5asQQwZXy/bdaekRajItRG5Vp4NvL/OFHWmqX5oTKsJPV
	 +xzhLTbTtvkVi2Be4fFeuYKhBc3VO4qCscuWOOYn8cPdTFbsCuTLGq/7V0ps6lakp5
	 Jzo5VElZU8gQw9vuTlv50LdEeV4AcV8u/8wnTeKx8VdCwtFNYL4ukVN99pu+QuQ/CV
	 fTQm8oH5B7qtnpJ8bxx7o0HhDbVHR80J8dxg9L4ZzkLFq+ktjqSeUSVYcbhISzIwU7
	 JtgGwp1OWytKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 10:59:48 +0000
Message-Id: <20260825105948.9D2301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The error code from `devm_clk_get_optional` is overwritten and ign=
ored, failing to abort the probe on errors like `-EPROBE_DEFER`.
- [Medium] Use of `devm_clk_get_optional` instead of `devm_clk_get` for a c=
onditionally required clock.
--

--- Patch [3]: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI =
as reference clock ---
commit 62ea0cca7668740a78a41a22a25751f5e998df7d
Author: George Moussalem <george.moussalem@outlook.com>

usb: dwc3: qcom: Add support for selecting UTMI as reference clock

This commit adds support for selecting the UTMI clock as the reference clock
for the DWC3 core on certain Qualcomm chipsets. It reads a device tree
property to determine if the UTMI clock should be used and passes it to the
core driver via the probe data.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c

[ ... ]

> @@ -698,6 +700,18 @@ static int dwc3_qcom_probe(struct platform_device *p=
dev)
>  			qcom->current_role =3D USB_ROLE_DEVICE;
>  	}
> =20
> +	select_utmi_as_ref_clk =3D device_property_read_bool(dev,
> +					"qcom,select-utmi-as-ref-clk");
> +	if (select_utmi_as_ref_clk) {

[Severity: Medium]
Since the UTMI clock is required to derive the reference clock period when
"qcom,select-utmi-as-ref-clk" is set, should this use devm_clk_get() instea=
d?

If the "mock_utmi" clock is missing from the Device Tree,
devm_clk_get_optional() will return NULL rather than an error pointer.
Because IS_ERR(NULL) is false, the driver will silently continue with a NULL
clock, which might lead to the same non-functional USB operation mentioned =
in
the commit message.

> +		ref_clk =3D devm_clk_get_optional(dev, "mock_utmi");
> +		if (IS_ERR(ref_clk)) {
> +			ret =3D PTR_ERR(ref_clk);

[Severity: High]
Does this missing error handling silently swallow probe deferrals?

If devm_clk_get_optional() returns an error like -EPROBE_DEFER, the error
code is stored in 'ret' and a warning is logged, but execution continues.
The 'ret' variable will then be overwritten by the return value of
dwc3_core_probe() shortly after:

dwc3_qcom_probe() {
    ...
    ret =3D dwc3_core_probe(&probe_data);
    if (ret) {
        ret =3D dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
        goto clk_disable;
    }
    ...
}

Should this error path abort the probe with a goto clk_disable?

> +			dev_warn(dev, "failed to get ref clock: %d\n", ret);
> +		} else {
> +			probe_data.ref_clk =3D ref_clk;
> +		}
> +	}
> +
>  	qcom->dwc.glue_ops =3D &dwc3_qcom_glue_ops;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-ipq-flatte=
n-usb-v1-0-5c1f3170bbe9@outlook.com?part=3D3
