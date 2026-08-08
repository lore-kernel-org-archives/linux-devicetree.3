Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9317A3D76
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186011; cv=none; b=sK4bKOveJd5yVPG7kBeZ49M8tP6i6KoGZKM678s8csG7kKGyHOaZuGHgI91abvvkozAHtnyEz/I2auOdrd2HDnXj1T4rWf7466uf3M85FvoknsTh0tYoyeKSznsRVkHHkZm5BWNqi9l6ju4uAS34m4aL1xbBD3ixpTLmlJrlnBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186011; c=relaxed/simple;
	bh=c/7tFqzjaGjzI3vsnQqrN7kAP+qKfS9xjmCJLbvwQQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t75poXwc9niCW1ANqAZhcWBHg0/KX1C0uqHMOq0dNX4fZNayvbgib6CsIK94hKts5hNGE9M3VmYD6uXzY4s+NviDCWLJWvYEGSNWGXCVqB2yQeXqBgBKT85/tkzBLFfpCkob/6JbAcF/bdVOO9J9q5j+Bf6lfTTwnxc5g+lY+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKhslmBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKhslmBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9241F00A3A;
	Sat,  8 Aug 2026 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186010;
	bh=zULbiDGHftE+BHwE/VivkAWbLuNHYDClxFLKk5qMYSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKhslmBKlWK7lQgpzI1xwGTH6Bl14nVPMpPjKLEHBgUYfcle3yiHfLIVIdpmTXEan
	 GvaIqSzsxBWzqqpTaSp9gIelFLhPMpH5z0zV4di09k/ytfK9dVbqXYzG9fkzZBjPcf
	 eQBX0+FKoPsmaF9iSXgQE9K3Kjvem04jqs94vPhmr/uwx+uJ6J3F4M1rXOa4Pb1pLs
	 K/9LCe3ysbpRIjD8v2rkPYgCS0rNwVff5y7hK8yH7zpvhh8cVRdbiO+NtTjYwW99EX
	 sE04UbwpYBFma2w8MU+ETYptAiOwPyXrs+3iQRaoNHF6ez5WDJqvu2ewtjVwsqIhLH
	 GwcQ7131U/V+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/20] net: dsa: xilinx: implement port_stp_state_set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-12-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-12-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:49 +0000
Message-Id: <20260808104650.3A9241F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Read-modify-write on shared TSN_PORT_STATE_CTRL_OFFSET fails to cl=
ear other ports' self-clearing commit bits
--

--- Patch [11]: [PATCH 11/20] net: dsa: xilinx: implement port_stp_state_se=
t ---
commit a493a3188672bc98a878692c597aa8f604b4be1d
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Subject: net: dsa: xilinx: implement port_stp_state_set

This commit implements the port_stp_state_set callback for the Xilinx TSN
DSA switch. It maps bridge STP states to hardware encodings and applies
them via the Switch Port State Control register.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx=
/xilinx_tsn.c
> index 6b285c528724c..020b1622670c8 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c

[ ... ]

> +static int xlnx_tsn_set_port_state(struct xlnx_tsn *sw, int port,
> +				   enum tsn_port_state state)
> +{
> +	u32 chg_bit, mask, val, reg;
> +	int err;

[ ... ]

> +	/* Bit won't re-arm if a previous change never cleared it. */
> +	val =3D sw_ior(sw, TSN_PORT_STATE_CTRL_OFFSET);
> +	if (val & chg_bit) {
> +		dev_err(sw->dev, "port %d: previous state change still pending\n",
> +			port);
> +		return -EBUSY;
> +	}
> +
> +	val &=3D ~mask;
> +	val |=3D (state << __ffs(mask)) & mask;
> +	val |=3D chg_bit;
> +	sw_iow(sw, TSN_PORT_STATE_CTRL_OFFSET, val);

[Severity: High]
Could this read-modify-write sequence accidentally re-trigger state changes
on other ports?

The register read stores the state of all ports in `val`. Since the
commit bits (EP_PORT_STATUS_CHG_BIT, MAC1_PORT_STATUS_CHG_BIT, and
MAC2_PORT_STATUS_CHG_BIT) are self-clearing, it is possible for another
port's commit bit to be read as 1.

If the hardware asynchronously clears that other port's bit to 0 just
before this write back, does writing the 1 back cause an unintended
0-to-1 transition and a spurious state machine commit on the unaffected
port?

Should the commit bits for all other ports be masked out from `val`
before writing the value back to TSN_PORT_STATE_CTRL_OFFSET?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D11
