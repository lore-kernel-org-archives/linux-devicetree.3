Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FA93644AF
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315400; cv=none; b=cQRf5yRN1CDSgwkVKjqMhCpfcqvj0PXAk8cbfXTjbgqoSJzhMvyIOia4XiCsnMWY+V2MMp3nkROL3RxPwzsifT4pw7djxEA/cDHqQBeBN2O+0wfOphWk+/TQSqHYp0Tyw0vusjVMSJbwg7hblRTpYdRg2oQEdpdT+Jd4iZ/pYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315400; c=relaxed/simple;
	bh=mQjI4gbq9JAj7GeZ3dclu2j7y71aBPzvsga0XUi8d/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LG3rontzFRlrbq0I86dyc5fy/KERwEuPqoDUNJFXoJE2MJKDH49qLrRcAsGFBcIbULQKsNwuz9BUukuQmg/4FMSmCoQ/SoDQwnDvRt4kt5ty6Rg1KOq1U1dV2CyedH1rnM9NjB/P9io2njzhrM1zWwWYBwNg+y3QBljriG2DAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoqqmvpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoqqmvpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A521F000E9;
	Fri, 17 Jul 2026 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315399;
	bh=BKDQ6pUtBXBvfNFgCHfaW5DxpCHm4J6wt8NswM3JsrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RoqqmvpFatQhDUnvmQUkdVwGM94wUKvBrumomYasoaNe41eG2OqeXJTKZSRePR0vz
	 EIFmTC7f8a5pnBWN3jK+IOjrV0nVg1HqLxUVnYaIvBeC+892p8ZdoubgTDpWD+DCzW
	 yuFRBIR/C8sNYsjzdPerZ9U6nOgeNYvxS0dmDYmnF0ubUsYiEi7pn5KvZk2eFwY7RM
	 3Qp4CeynRCOMtVFl/VMezq2Hy4qyoei8IvnG7t9LAQ96vrBocYOg+fGiR9a7Kac9fO
	 YTdlUP1AOS6iMVpHHypfujifiPcYCNWpfhqtG7hRCLEnBhNRmxkuRhcH/h74m+zoNb
	 Yq1GqPpPcD0Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/17] spi: cadence-quadspi: skip DDR PHY tuning for
 2-byte-address ops (i2383)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717185116.2065505-10-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-10-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:09:58 +0000
Message-Id: <20260717190959.03A521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Potential NULL pointer dereference in `cqspi_mem_op_execute_tuning=
()` if the controller lacks platform match data.
--

--- Patch [9]: [PATCH v5 09/17] spi: cadence-quadspi: skip DDR PHY tuning f=
or 2-byte-address ops (i2383) ---
commit 7e0e0805103ff0525c32a0dd04ddbcea9570af64
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: skip DDR PHY tuning for 2-byte-address ops (i2383)
   =20
Erratum i2383 on AM654 locks the address phase in PHY DDR mode when a
2-byte column address is used. DDR PHY tuning must not be attempted for
such operations; non-PHY DDR usage is unaffected. [0]
   =20
Add CQSPI_NO_PHY_TUNING_WITH_ODDR_2B_ADDR quirk and check it in
cqspi_am654_ospi_execute_tuning(). When the erratum applies, return 0
with read_op->max_freq cleared =E2=80=94 the op-skip signal that tells the
caller to try another op variant.
   =20
Link: https://www.ti.com/lit/er/sprz544c/sprz544c.pdf

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 22a5c88bbd8dc..5070ffc53d5e8 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -3183,6 +3184,20 @@ static int cqspi_am654_ospi_execute_tuning(struct =
spi_mem *mem,
>  		return -EOPNOTSUPP;
>  	}
> =20
> +	/*
> +	 * Erratum i2383: in PHY DDR mode, a 2-byte column address locks up
> +	 * the address phase. Skip DDR PHY tuning for such operations.
> +	 */
> +	if ((cqspi->ddata->quirks & CQSPI_NO_PHY_TUNING_WITH_ODDR_2B_ADDR) &&
> +	    read_op->addr.nbytes =3D=3D 2 &&
> +	    (read_op->cmd.dtr || read_op->addr.dtr || read_op->dummy.dtr ||
> +	     read_op->data.dtr)) {
> +		dev_dbg(dev,
> +			"i2383: skipping DDR PHY tuning (2-byte address)\n");
> +		read_op->max_freq =3D 0;
> +		return 0;
> +	}
> +
>  	if (write_op) {
>  		/*
>  		 * For NAND: write the calibration pattern to the page cache.

[Severity: High]
Can cqspi_mem_op_execute_tuning() experience a NULL pointer dereference if
the controller lacks platform match data?

If the driver is bound to a device (e.g., via sysfs driver_override) whose
of_node provides the necessary flash child nodes to successfully pass probe
but possesses an unmatched compatible string, of_device_get_match_data()
will return NULL, leaving cqspi->ddata as NULL.

While cqspi->ddata is defensively guarded in other execution paths, it
appears to be unconditionally dereferenced here:

drivers/spi/spi-cadence-quadspi.c:cqspi_mem_op_execute_tuning() {
    ...
	if (!cqspi->ddata->execute_tuning)
		return -EOPNOTSUPP;

	return cqspi->ddata->execute_tuning(mem, read_op, write_op);
}

Could any kernel module calling the newly exported spi_mem_execute_tuning()
API on this controller trigger a crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D9
