Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877692;
	b=fdm2YSG54pcusTMFAo0nsmBaKhZ3DlmuYwj3Ze9VI8g+DFFMWK21z82M4N24nzJs2UVO
	 w2+/Dnjxjo7r1SIJdpBl4hAD19ttuDXIX+alTLzjj72YKGZh44kL0bgzWcJYxZSXHrAfw
	 Pk2/Nh3GhCFy5QV8Gtbca72+bGtPSPNZOQRNiYiw77EpxaX1s/qNUS7FmAiiiAGSaXO7X
	 YkP90swT1CrpPHK+TPyakxfJsQcRbYBjRjyfi7IT6UZ/OtIizVfEX/CwgCR7fou/hx5Fk
	 +tcsXaUqk3Ud5NkkEavTmxCf3eqc7ZaXHm/jmbmURJfgJmR9PGkX551sE3Sks0xA84Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877692;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UlYCDCX2Iogr0PUGCxPccNF1Pd8B2hPqTb3n4aYlwU0=;
	b=tq0Q0kJA3VW2RfpHm39IGmUF9MV98T0Xnu8d7oeozNBO0SGU580HGib5BlOdiHQoDQEK
	 eh/z+hmJcVNAj6iHq12G2Yq8tEhLBZoO+v8JWveuc1tUWoewoiG2uV6g6k0zv28mAPPmg
	 27SoBsRTAS7p+DlF6/kxmCIa0ZZFWPlJO0ULfb8IGSNI01n0lbd/N7aqJzwY0t6eR4T+R
	 MaPXncLG26ry9G5Am4goQhZFO5IMc3ZzyLucCJQKuoENOY/E61SfiOjARonXqHdAV/P3f
	 HvdcpzxQCZ5uFHQEyggPWLaL1pqIEdYtOrGcCNRgPiCaYp5hvtvWFzvfVk11UyOVxqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqqYthCl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D475A606A33C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqqYthCl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB3C1F00A18;
	Thu,  5 Nov 2026 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877691;
	bh=UlYCDCX2Iogr0PUGCxPccNF1Pd8B2hPqTb3n4aYlwU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jqqYthCl9VEHYtlNF53gGtVihwzF8L+SF0KVoX0JEBLm6KqMaKhu4ahLtNFFiVW6q
	 v6aB2MGM2P1q1cpzeaVhePeq3S9ITteqlG78LPHW/1yj8QznIZ1Cm7ltokhfPFvDJp
	 Z+wKfQeeKBtPcrIQK5el8ua5WW8W56r0skfgdvxFVrtdg/rK82RbFDQCFbxuRPWZBK
	 CIH9FgH54TTNUBXcZhM7RyxVaMuCmXiiAVISFmIg/oBFXj0R2U3WICqwXrH3pxDGjT
	 AJQPOyYtR3n84B4px/3ZmubhlwRcCqA16uygqhQ3MLkXFD+wQWvASlE+ZYUv99B/WT
	 hPPt6ScjmqoPA==
Message-ID: <sashiko-outbox-198937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 12/19] spi: cadence-quadspi: enable PHY for indirect
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-13-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-13-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:21:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: cadence-quadspi: missing clock fallback in cqspi_write() with=
out PHY
--

commit 1a04f2fbf39fa6fae8491808b636fe88dbdc44e5
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for indirect writes

This commit enables PHY mode for indirect writes of at least 1 KiB when the
operation runs at the calibrated post-configuration clock rate. It adds
cqspi_tune_phy_write() to toggle PHY around the indirect write transfer and
passes post_config_max_speed_hz from cqspi_mem_process() through
cqspi_write().

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 55c446f4245af..806bf49e814d4 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1602,12 +1653,14 @@ static bool cqspi_use_tuned_phy(struct cqspi_flas=
h_pdata *f_pdata,
>  }
> =20
>  static ssize_t cqspi_write(struct cqspi_flash_pdata *f_pdata,
> -			   const struct spi_mem_op *op)
> +			   const struct spi_mem_op *op,
> +			   u32 post_config_max_speed_hz)
>  {
>  	struct cqspi_st *cqspi =3D f_pdata->cqspi;
>  	loff_t to =3D op->addr.val;
>  	size_t len =3D op->data.nbytes;
>  	const u_char *buf =3D op->data.buf.out;
> +	bool use_phy;
>  	int ret;
> =20
>  	ret =3D cqspi_write_setup(f_pdata, op);
> @@ -1629,7 +1682,9 @@ static ssize_t cqspi_write(struct cqspi_flash_pdata=
 *f_pdata,
>  		return cqspi_wait_idle(cqspi);
>  	}
> =20
> -	return cqspi_indirect_write_execute(f_pdata, to, buf, len);
> +	use_phy =3D len >=3D CQSPI_PHY_MIN_INDIRECT_WRITE_LEN &&
> +		  cqspi_use_tuned_phy(f_pdata, op, post_config_max_speed_hz);
> +	return cqspi_indirect_write_execute(f_pdata, to, buf, len, use_phy);
>  }

[Severity: High]
When a write operation has op->max_freq =3D=3D post_config_max_speed_hz and
f_pdata->use_tuned_phy is true, cqspi_mem_process() configures the controll=
er
clock to post_config_max_speed_hz before calling cqspi_write():

drivers/spi/spi-cadence-quadspi.c:cqspi_mem_process() {
	...
	/* Tuning inactive, or STIG (no PHY handling of its own): use safe rate. */
	if (sclk =3D=3D mem->spi->post_config_max_speed_hz &&
	    (!f_pdata->use_tuned_phy || use_stig))
		sclk =3D mem->spi->max_speed_hz;

	cqspi_configure(f_pdata, sclk);
	...
	if (!op->addr.nbytes || !op->data.buf.out)
		return cqspi_command_write(f_pdata, op);

	return cqspi_write(f_pdata, op, mem->spi->post_config_max_speed_hz);
}

In cqspi_write(), if len < CQSPI_PHY_MIN_INDIRECT_WRITE_LEN (or if the
direct-mode write branch is taken, or cqspi_command_write() is called in
cqspi_mem_process()), PHY mode is not enabled. Unlike cqspi_read() and
cqspi_direct_read_fallback(), which call cqspi_configure(f_pdata,
max_speed_hz) when PHY is not used, the write path never drops the clock ba=
ck
down to mem->spi->max_speed_hz.

Won't this cause writes shorter than 1 KiB (as well as direct-mode or STIG
writes at post_config_max_speed_hz) to run at the tuned post-configuration
clock rate without PHY delay-line compensation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105105832.2134=
313-1-s-k6@ti.com?part=3D12
