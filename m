Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE5B3DA7F4
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556886; cv=none; b=ESxIv+Lbyv/K9NBT9LA8xZZRWGhlsAHfzTKzVyC0tPWHY0hhx9TxmNEtOWTH0YubXqt4Wol8MwF5Kauf2Fui+Bb9aL8S6Prw9WbSuSdYYOXBwsmWPyixVQKaZtJgIg6vKls4DVXYCQWlcEviiN/LDdYXwHEu0X4q3BO++7bltY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556886; c=relaxed/simple;
	bh=MarnMnGmJM6LDWF92SLFrui2vYi8gFVjBMuy/0BKEEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WCb5FiRb5If7j9b8kUfLC2goamYloaQZaI6OZCJoWyeVIEfvvsBOAw4EElW/uvHwLPUmMlD7b7rdN+Nu/NNI0yGkZZ+nVt/N5TDJvfle8ssEi6Nc6KL224y8ENlCyLwVzMF0d+8jkSgBo6Z1xkeGQKYNIGGIoLLkhBnagNhEB08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePqxN9eo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePqxN9eo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D5B1F00893;
	Thu,  4 Jun 2026 07:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780556885;
	bh=e5+VlfjjbIt6Z94eFXVdO/plo9eNoydyIJlbksvHP2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePqxN9eou7wToCYe5zJme5S1Sgd7Qppz74tljbzYe1rsTN8ZnY+1V9s3cU9CcnWix
	 QS1cipatCRm2sOPUw9NOowlk1WZQpte2WXEfqQsJSPoCxOCyjXxzIDjgsOfUUC9vo9
	 YQmwMN7WQ0ByPtvdpyUllKVlS2SbjPAxODywecxKeQnQvTlLU1GxJIHehrRdAOpqa/
	 pPykTRq7tK+be6EvDR/bt79aDByhAcVwIbKA0Gi6xCtbCxVyJ00G3AzpmmNVyNro0o
	 vNkAI2leIYqgEh87uSAheeEm1neuI/eQWf+ZD8nwBqEZB4saqhr93Hf/fdcRwbJHeE
	 uhspNqmI72uOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:08:04 +0000
Message-Id: <20260604070804.B7D5B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incomplete abstraction of SPI clock management breaks both GPI DMA=
 and FIFO/SE_DMA modes for SCMI-based platforms.
- [High] Unchecked return value of `device_get_match_data()` leads to a NUL=
L pointer dereference in probe.
--

commit d77f464166f40ea072baeed5f03c9c24a36aac4d
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
This patch adds support for these platforms by introducing an abstraction
for setting the frequency using the SCMI performance protocol.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 4205349376955..1b92fb1bd8bfb 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c

[ ... ]

> @@ -820,7 +829,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
>  	}
> =20
>  	/* Speed and bits per word can be overridden per transfer */
> -	ret =3D geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
> +	ret =3D mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
>  	if (ret)
>  		return ret;

[Severity: High]
Does this new abstraction break GPI DMA mode for SCMI-based platforms?

In GPI DMA mode, setup_gsi_xfer() completely bypasses this set_rate
abstraction and directly calls get_spi_clk_cfg():

setup_gsi_xfer() {
    ...
    ret =3D get_spi_clk_cfg(mas->cur_speed_hz, mas,
                          &peripheral.clk_src, &peripheral.clk_div);
    ...
}

Because SCMI platforms do not initialize se->clk, clk_round_rate() inside
geni_se_clk_tbl_get() will return 0 on a NULL clock, unconditionally failing
the transfer.

Also, for FIFO/SE_DMA modes, setup_se_xfer() correctly uses the new
set_rate() callback (mapped to geni_se_set_perf_opp()). However,
geni_se_set_perf_opp() only sets the SCMI performance OPP and completely
omits the required hardware register writes to SE_GENI_CLK_SEL and
GENI_SER_M_CLK_CFG.

Without setting the SER_CLK_EN bit in GENI_SER_M_CLK_CFG, will the internal
serial engine clock remain disabled and prevent the SPI hardware from
functioning?

[ ... ]

> @@ -1064,7 +1073,9 @@ static int spi_geni_probe(struct platform_device *p=
dev)
>  	mas->se.wrapper =3D dev_get_drvdata(dev->parent);
>  	mas->se.base =3D base;
> =20
> -	ret =3D geni_se_resources_init(&mas->se);
> +	mas->dev_data =3D device_get_match_data(&pdev->dev);
> +
> +	ret =3D mas->dev_data->resources_init(&mas->se);

[Severity: High]
Could device_get_match_data() return NULL here?

If the driver is instantiated via a method that does not use the OF match
table, such as manual bind via sysfs or legacy platform device instantiatio=
n,
device_get_match_data() will return NULL. Dereferencing it immediately to c=
all
resources_init() would lead to a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-enable-spi=
-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com?part=3D4
