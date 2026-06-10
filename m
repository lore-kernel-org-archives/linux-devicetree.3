Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7640B364
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105305; cv=none; b=Z//nQ4aXe3XIVPRnXdzk5DIAWI/izMirS/xQ8DlkhaFuvAeOfLlwmLpS4rAvOqFcT0nHYiRw51zaQqzZpI8eoFZDPbfGnsl0SNVrAkPICK+msEWdYQxRe/BdtZWPCqsxtRIil4Kdv00cCy5TuWgJSWmJ/kx55KbsJzhZB+RwjjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105305; c=relaxed/simple;
	bh=Yu+uJ0zoc3tAo0WFDxnnJliB+4BMWeXNyssPvfp6ERY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PVeV+mwy6DkRSUNUupSAFGp7nG91vQyYTRZKrTEtSQg6vwqiMA6ngtoqx7wIK/fh//fNy5GfD5/Na8bUQIAvgHCVsjjV2kox4rmcGoL0SK9gQ27Yi7FkIH3rqlm+J6dWrLXwYfPUlu41zsUqm0UuIwcrqrXmxpiy/SvfAO2q3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFWYdfDX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFWYdfDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EDC1F00893;
	Wed, 10 Jun 2026 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105304;
	bh=3sDE0mdwHxiU0kVddvmXCb8K91N4xUFqW/S3XT0AQWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FFWYdfDXYjh8s2JitEJ+ZcvUEUFlc5v0LkYGe/eqUux7VlCX2uJnSkauQ2TuUEr4C
	 edOm9w8GrlzUpdYQS3d2yxyJDALOanmevmk/DltkUmkai3bPIOjfA2Z0ugF62fJWIA
	 uQah3PyNws+hMvYXxC4G3eywhWRgOboJAuq//4TkUyZUPk+sRE7Pzdx7Eo9MGcLDWi
	 XbiJ6yAtGVPVRprWXB1yQ1vmZI+KhkV7qvthElY3wTh+EbWuiDj6e1Hb73xfhsOcni
	 4ltQVs9kKh2LRUnMDdc0hNPaO6iDUTqmGKXEIX0qCLH00h7IiqvbdVDNYhz/CNY9ey
	 B/TctSG/9/HoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 06/13] net: ethernet: oa_tc6: Add the
 OA_TC6_ prefix to standard registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-adin1140-driver-v4-6-0753e28ee004@analog.com>
References: <20260609-adin1140-driver-v4-6-0753e28ee004@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:28:23 +0000
Message-Id: <20260610152824.54EDC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing SKB check when receiving an end-valid or ongoing chunk wit=
hout a prior start-valid chunk causes a NULL pointer dereference.
- [High] Unbounded SKB tail extension allows a malicious or faulty MAC-PHY =
to trigger `skb_over_panic()`.
--

commit f42a7b7b1c5ba6bcf876685d2831cb4138c5ac3a
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Add the OA_TC6_ prefix to standard registers

The OA TC6 standard registers are currently exported in a header file.
Add the OA_TC6_ prefix to the register address and subfield mask macros
to avoid future naming conflicts.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 97df38207827d..92da5bb74cc76 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

> @@ -687,25 +687,25 @@ static int oa_tc6_process_extended_status(struct oa=
_tc6 *tc6)
>  		return ret;
>  	}
> =20
> -	if (FIELD_GET(STATUS0_RX_BUFFER_OVERFLOW_ERROR, value)) {
> +	if (FIELD_GET(OA_TC6_STATUS0_RX_BUFFER_OVERFLOW_ERROR, value)) {
>  		tc6->rx_buf_overflow =3D true;
>  		oa_tc6_cleanup_ongoing_rx_skb(tc6);
>  		net_err_ratelimited("%s: Receive buffer overflow error\n",
>  				    tc6->netdev->name);
>  		return -EAGAIN;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the driver's
handling of rx_skb, I noticed a potential NULL pointer dereference in
oa_tc6_prcs_rx_chunk_payload().

If the function processes a chunk with end_valid set but start_valid clear:

drivers/net/ethernet/oa_tc6.c:oa_tc6_prcs_rx_chunk_payload() {
    ...
    /* Process the chunk with only rx frame end */
    if (end_valid && !start_valid) {
        size =3D end_byte_offset + 1;
        oa_tc6_prcs_rx_frame_end(tc6, data, size);
        return 0;
    }
    ...
}

Both this branch and the fallback to oa_tc6_prcs_ongoing_rx_frame()
eventually call oa_tc6_update_rx_skb(), which executes:

    memcpy(skb_put(tc6->rx_skb, length), payload, length);

If tc6->rx_skb is NULL (which happens before any start_valid chunk is
processed), will skb_put() dereference a NULL pointer and cause a panic?

[Severity: High]
This is also a pre-existing issue, but I noticed another concern with
skb_put() in oa_tc6_prcs_ongoing_rx_frame().

When chunks arrive with both start_valid and end_valid cleared,
oa_tc6_prcs_rx_chunk_payload() calls oa_tc6_prcs_ongoing_rx_frame(), which
appends data without any bounds checking on the total accumulated length:

drivers/net/ethernet/oa_tc6.c:oa_tc6_prcs_ongoing_rx_frame() {
    ...
    oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);
    ...
}

If a faulty MAC-PHY or compromised bus sends an unbounded sequence of ongoi=
ng
chunks without an end_valid signal, does this exhaust the SKB's tailroom and
trigger an skb_over_panic()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-adin1140-d=
river-v4-0-0753e28ee004@analog.com?part=3D6
