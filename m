Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2780409137
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762960; cv=none; b=k7lEDuaSJcqk1TPqC3ulMx2iXiJqpPzODfz2jg+CP4IBRvh+LmHwxxPLLtTuIigs0hhHeQtXPDQwiAcm8n6lMSf1zKD0dNuJPcVNq2PbQujy86mWN1atlcVmOLdfXfWHMic3WvyO18WueAgq4S6CnZiWI1VqPlzdL/AnDt1twWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762960; c=relaxed/simple;
	bh=/Rp2pckVyHSLX4LaQ2Np6XJhZPNF2fCrrAZWOQQpE9A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VK/+2Jcdovjf4WX3JHGsf5vb3LEc13FCy7xmbVHHO75Lx3Slr5kGebAPcwrXWxbDNVDfJUEslFvQrxU9pIarVgUZiLg31qEXeaDkaLqSllO/CqLhp2Yv55+vdstRLGx2scOYCHvXPagXlZkX45/jju5qqiUrVi1vB5wn/olMJDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwO5Gy5N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwO5Gy5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B1A1F000E9;
	Mon,  3 Aug 2026 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762951;
	bh=e4+3VG5xsyxsfMWwYxiIy3MAU1X0oKuTeW39tLTAe5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KwO5Gy5NHZbBeXOttlxJLu/4hM4forOgP1ws36oRO1dKLe+g8kNJkbTEA+dyvItnu
	 holUxBf9mPTlqAUr+3ehRqtMdMq6TsRA7JLK27tGm9m59xb+CEp1R3nElU4oqzSy5v
	 9RZYhgNhdUvS2n+ON7lQgAPP69rd0B3uhOc2ajDQzg7T0NFPmTBDU2a5n03Si76DyO
	 78g4eeZq7YKhcgmpn6TLOPMTDitvF87nLlrdgxo1hUt53NtN8ZflgnJ21tDcZMfrfh
	 /imkMRJ/2BpOyL06VLJxnpT/2IzuKd/YhDTPyB7L5G1UwM0D6bhby1Uw/q4w106JBm
	 fuOuVG4pIusww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-t603x-spmi-v3-2-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
 <20260803-t603x-spmi-v3-2-c17b506d91a1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:15:50 +0000
Message-Id: <20260803131550.D6B1A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unbounded hardware polling loop in flush_extra_data() can cause a =
kernel soft lockup.
- [Medium] spmi_read_cmd() immediately aborts multi-word reads if the FIFO =
temporarily drains mid-transaction.

Pre-existing issues:
- [High] Missing validation on the `len` parameter causes an integer underf=
low when packing commands.
- [High] Lack of synchronization in spmi_read_cmd() and spmi_write_cmd() ca=
uses data corruption on concurrent access.
- [High] The driver violates I/O accessor guidelines by using register acce=
ssors for FIFOs.
--

--- Patch [2]: [PATCH v3 2/6] spmi: apple: Validate FIFO state ---
commit 93b3f99f86c4f9fba2be0ca9a0aaffd4f71aca98
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state

Check for data before reading the body of a reply, and check for
end of data afterwards.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 376cf682c43e0..e037ef914b6c3 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> +static void flush_extra_data(struct spmi_controller *ctrl)
> +{
> +	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
> +	bool warned =3D false;
> +
> +	while (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {

[Severity: High]
Could this loop lead to a kernel soft lockup?

If the hardware is powered down or in an unexpected state, the empty bit wi=
ll
never assert. Since there is no iteration limit or timeout, the kernel would
spin indefinitely.

> +		if (!warned) {
> +			dev_warn(&ctrl->dev, "FIFO has extra data\n");
> +			warned =3D true;
> +		}
> +		readl(spmi->regs + SPMI_RSP_REG);
> +	}
> +}
> +
>  static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  			 u16 saddr, u8 *buf, size_t len)
>  {
[ ... ]
>  	/* Read SPMI data reply */
>  	while (len_read < len) {

[Severity: High]
This is a pre-existing issue, but does this transaction sequence lack
mutual exclusion?

The SPMI subsystem core delegates locking to the driver. Without a lock,
concurrent threads could interleave their writes to SPMI_CMD_REG and read
each other's responses from SPMI_RSP_REG.

The newly added flush_extra_data() might also inadvertently discard
responses intended for concurrently executing threads.

> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			dev_err_ratelimited(&ctrl->dev,
> +					    "FIFO lacks reply data, controller stuck?\n");
> +			return -EIO;
> +		}

[Severity: Medium]
Does this immediate error check risk aborting multi-word reads if the FIFO
temporarily drains mid-transaction?

Because the CPU MMIO reads execute much faster than the serial SPMI bus, the
FIFO might briefly empty before the hardware finishes buffering the entire
response.

Aborting immediately would bypass flush_extra_data(), leaving delayed
data stuck in the FIFO and potentially corrupting subsequent transactions.

>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);

[Severity: High]
This is a pre-existing issue, but does the use of readl() for a FIFO
violate subsystem endianness guidelines?

According to the I/O accessors guidelines, FIFOs should exclusively use
stream accessors (like readsl()) to prevent implicit CPU-to-device
endianness byteswapping.

On big-endian systems, readl() performs a byteswap, which could result
in a reversed byte stream.

>  		i =3D 0;
>  		while ((len_read < len) && (i < 4)) {
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does apple_spmi_pack_cmd()
lack validation on the len parameter?

If a client driver requests a 0-length SPMI transaction, subtracting 1 from
an unsigned size_t len could underflow to SIZE_MAX.

The bitwise OR would then corrupt the opc, sid, and saddr fields, completely
malforming the hardware command:

drivers/spmi/spmi-apple-controller.c:apple_spmi_pack_cmd()
    return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-t603x-spmi=
-v3-0-c17b506d91a1@chaosmail.tech?part=3D2
