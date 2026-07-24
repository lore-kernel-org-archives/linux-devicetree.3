Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C2B4908A2
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878227; cv=none; b=XFD0myB3NO+JaV+W3BdnDtOFXbU+4rkzW5MjXpQZgTaB5UDARw8yMNA3MAfAQwWYocygBoG6jEae6pzF/NZLdoOd6YLzax55JNniS/vZLj1nHkT+xMeeokSoiyMPSqrxQsDqEQ5jzb3DpTxLWPkRnrhU9P5Neof0gaYHuR6MPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878227; c=relaxed/simple;
	bh=8gh2lfmaGjo3ucwEe9lnwyDq0xh0/q9vXW2SRUvYE9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dqZaQmKGQW1ok3WyerBlT9Icqut1yH8UdOWowG+yR0y1Hyvxh/D4bWdsaFuMj18uOmIW/Arec2Zcb1jKfVJUnF8dbM/q7893W3kS/Q4+bCd3Ux8XNrT+ZWE7EL72Ojbp5Y2xZeAf/kFJK+btLo59jJhAYNqewHA516P1Qli4NK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oW5z74uL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oW5z74uL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233221F000E9;
	Fri, 24 Jul 2026 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878225;
	bh=clXDc43qXBeeTRuUM4mfdHNPmNz3sScV8iQ5FVRwu/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oW5z74uLtqZc/Gyn61l26EvzW3XptoP4UE7ruHPtqVgipNvwVtkjAa2B0mTT+pGXh
	 1Ff1QZNy1Iav3NCRzYYEZfjbKzdXnS/2PRkVM1hkW0shbnyLSxiWyjdPKJd5xjBBIe
	 2pJOpFRuacQ9BWAfozJ3gQ+i/Y1hESKlOBAm9bCxLpZzuytShTCV6cUAXxXCUeXAzs
	 ns53ls7Gz+UqPS4TJp/6tf6SgKf+Ci1AsHsywg1MCi9eGqrWNLhfI8wuxpoD5OwCVh
	 6qbp0Yg0MFj1oFJBEGGYXnIbPNt5pjlSfWGx+pEPkcnQ23Hekhs/q3oiqM/SzsTVGm
	 gsCxVkksd+cDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/10] firmware: arm_scmi: vendors: Add QCOM SCMI
 Generic Extensions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-3-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-3-cb732bcff1f4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:30:24 +0000
Message-Id: <20260724073025.233221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The API tightly couples TX payload size and RX buffer capacity int=
o a single `buf_len` parameter, breaking commands where RX size exceeds TX =
size and leaking uninitialized kernel memory.
- [High] An integer overflow in the transmit size calculation bypasses SCMI=
 core bounds checks, leading to an out-of-bounds write.
- [Medium] The 64-bit constant representing the "MEMLAT" algorithm string i=
s incorrectly split and endian-swapped, resulting in the mangled string "TA=
LMEM\0\0" being laid out in memory.
--

--- Patch [3]: [PATCH RFC 03/10] firmware: arm_scmi: vendors: Add QCOM SCMI=
 Generic Extensions ---
commit 9dcfeae2ae27c1a2917b7de276eae7604cac163d
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

firmware: arm_scmi: vendors: Add QCOM SCMI Generic Extensions
   =20
The System Control Management Interface (SCMI) Qualcomm Generic Extension
Protocol consists of a small set of generic SET/GET/ START/STOP commands,
which is used to turn on/off and configure Qualcomm SoC specific algorithms
that run on the SCP.

> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c b/=
drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
> new file mode 100644
> index 0000000000000..7ca920c8da059
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
> @@ -0,0 +1,183 @@
[ ... ]
> +/*
> + * The firmware only implements a handful of algorithm strings. Keep an
> + * allowlist so a client cannot push an unsupported (or garbage) string =
to
> + * the firmware; extend it as new algorithms are added.
> + */
> +static const u64 qcom_scmi_algo_str[] =3D {
> +	0x4d454d4c4154ULL, /* "MEMLAT" */
> +};
[ ... ]
> +static int qcom_scmi_common_xfer(const struct scmi_protocol_handle *ph,
> +				 enum qcom_generic_ext_protocol_cmd cmd_id, void *buf,
> +				 size_t buf_len, u64 algo_str, u32 param_id, size_t rx_size)
> +{
> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	if (!qcom_scmi_algo_str_valid(algo_str))
> +		return -EINVAL;
> +
> +	/* Reject calls where rx_size exceeds buf_len. */
> +	if (rx_size > buf_len)
> +		return -EINVAL;
> +
> +	ret =3D ph->xops->xfer_get_init(ph, cmd_id, buf_len + sizeof(*msg), rx_=
size, &t);

[Severity: High]
Can buf_len + sizeof(*msg) overflow?

If a caller passes a very large buf_len, could the addition wrap around to a
small positive integer?=20

This would bypass the max_msg_size bounds check in xfer_get_init(), leading
to an out-of-bounds write in the subsequent memcpy() call.

> +	if (ret)
> +		return ret;
> +
> +	msg =3D t->tx.buf;
> +	msg->ext_id =3D 0;
> +	msg->algo_low =3D cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high =3D cpu_to_le32(upper_32_bits(algo_str));

[Severity: Medium]
Does the firmware expect this string as an 8-byte character array?

The constant 0x4d454d4c4154ULL represents "MEMLAT" in big-endian hex. When
this is split into algo_low and algo_high and passed through cpu_to_le32(),
the resulting little-endian memory layout becomes 0x54 0x41 0x4C 0x4D ("TAL=
M")
followed by 0x45 0x4D 0x00 0x00 ("EM\0\0").

Will the firmware correctly reconstruct the 64-bit integer, or might it
reject the mangled string "TALMEM\0\0" if it reads it as a character array?

> +	msg->param_id =3D cpu_to_le32(param_id);
> +	if (buf_len)
> +		memcpy(msg->buf, buf, buf_len);

[Severity: High]
If a caller uses qcom_scmi_get_param() expecting an RX payload but has no TX
payload, doesn't buf_len need to be at least rx_size to pass the validation
check at the top of this function?

If buf_len is artificially inflated to satisfy rx_size <=3D buf_len, won't =
this
memcpy() read buf_len bytes from the caller's buffer into the TX payload,
potentially leaking uninitialized kernel memory to the firmware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-rfc_v8_scm=
i_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com?part=3D3
