Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65F37C906
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672772; cv=none; b=HGD8fcfvcpXZfnXtrbhSuRcf7Iw36PlCfEGN6Glm8U9dxEYs8vcdq1WcTvCTgU6kVvQNMdHQUO1IhiUKBIbU+EuM5+LzJYkB9sxtcHMNRb+9tirem5v8Poa8VGg+lyh3REP5nAyuPh1+CporLHeDcegWq/R22ddkrnkppeDGaDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672772; c=relaxed/simple;
	bh=LGNILmSWbNgcoxgTE4TYs0Ol0QExVe7utrJihVEL3vQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LrYonW15cOlpH//Hbvsfeiphojm19kZsBS4NtY8sKaYcEVi6fQz1hmbT66dXTutm6YGlqoiDUWMhc4WPEksZNxHPV+4JYnvjWpCNThWDH1xnenoL5ob4bcjWqqzUSE8ywVCHH4A3/9NuLCU0HQtF4bw243eYVJ1v2cB2vsinp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFOC5Nrq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFOC5Nrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516D21F000E9;
	Wed, 17 Jun 2026 05:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781672767;
	bh=S8QnplDqS2LNzQkz3tpgSOH0EVoyTMII1hgHSK3Cjmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GFOC5NrquLGiTPw18K+MBXOl+bGlnYMAWZybKSa2lESbTYGW3TGzhK13hsTMPpngI
	 jAj78oele0Ea8C/l6RxrZpRd6HPt+/oVmIP5FHSPo4OZBEG4yE+LJhdeaSkZA72yd9
	 j755ToeKC44rLJ9aarlin8vrtf6Hue+kYRuqLPKxxRCN7SPmD7dmr78XvsbIhhBAzc
	 7wL1azHlj5Jbyq+DyYUlt7t6hU3tbJ7HmEj8CzueFwe3utfjY8phrT+24nWuVn6WZO
	 DMWrnqKRdJQRp2de91ND2rETR5jm/UC3WfFLoWah6TjqlYOeh1M45qMp6BZZNJ7sec
	 r+v/3zfsBI35w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/6] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-6-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-6-ad736dbeab57@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 05:06:06 +0000
Message-Id: <20260617050607.516D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Uninitialized `gi2c->clk_fld` pointer triggers a deterministic NUL=
L pointer dereference in `geni_i2c_gpi_xfer` for the SA8255p platform.
- [Medium] An early error return from the new `set_rate()` callback in `gen=
i_i2c_xfer()` irreversibly leaks a PM runtime usage counter.
- [Low] The newly added SA8255p descriptor references undeclared functions =
`geni_se_domain_attach` and `geni_se_set_perf_opp`, causing a hard build fa=
ilure.
--

commit c33b9259904d2d29eb39c245dff8c21c943e3fb1
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
   =20
The Qualcomm automotive SA8255p SoC relies on firmware to configure platform
resources. This adds support for SA8255p by using SCMI power and performance
protocols to manage resources like clocks and interconnects.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 92cccb1cce698..96dbf04138bee 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
[ ... ]
> @@ -919,7 +925,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  		return ret;
>  	}
> =20
> -	qcom_geni_i2c_conf(gi2c);
> +	ret =3D gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this early return leak the PM runtime reference?

Earlier in geni_i2c_xfer(), the driver increments the PM usage counter via
pm_runtime_get_sync(gi2c->se.dev). If set_rate() returns an error, this
returns immediately without calling pm_runtime_put_autosuspend() to release
the reference.

[ ... ]
> @@ -1220,11 +1233,25 @@ static const struct dev_pm_ops geni_i2c_pm_ops =
=3D {
>  									NULL)
>  };
[ ... ]
> +static const struct geni_i2c_desc sa8255p_geni_i2c =3D {
> +	.resources_init =3D geni_se_domain_attach,
> +	.set_rate =3D geni_se_set_perf_opp,
> +};

[Severity: Low]
Are the functions geni_se_domain_attach and geni_se_set_perf_opp missing
declarations? They do not appear to be defined anywhere or declared in the
included headers, which causes a build failure.

[Severity: High]
Does bypassing geni_i2c_resources_init() here lead to a NULL pointer
dereference in GPI mode?

For the qcom,sa8255p-geni-i2c compatible, resources_init is set to
geni_se_domain_attach instead of geni_i2c_resources_init. This means
geni_i2c_clk_map_idx() is never called to initialize gi2c->clk_fld.

Since no_dma_support is false for SA8255p, if the hardware register indicat=
es
the FIFO is disabled, the driver will fall back to GPI DMA mode.
In geni_i2c_gpi_xfer(), the uninitialized gi2c->clk_fld pointer is
unconditionally dereferenced:

    const struct geni_i2c_clk_fld *itr =3D gi2c->clk_fld;
    ...
    peripheral.cycle_count =3D itr->t_cycle_cnt;

Could this cause a panic during transfer if GPI mode is used?

> =20
>  #ifdef CONFIG_ACPI
> @@ -1239,6 +1266,7 @@ MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
>  static const struct of_device_id geni_i2c_dt_match[] =3D {
>  	{ .compatible =3D "qcom,geni-i2c", .data =3D &geni_i2c },
>  	{ .compatible =3D "qcom,geni-i2c-master-hub", .data =3D &i2c_master_hub=
 },
> +	{ .compatible =3D "qcom,sa8255p-geni-i2c", .data =3D &sa8255p_geni_i2c =
},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-enable-i2c=
-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com?part=3D6
