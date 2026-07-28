Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9003F0ABE
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231695; cv=none; b=DTPYeLuwPgaMFCZZeAoqygMa/k6hYQOosPwpaT6NvE5JPL9jxF6kVFRktK7o39P2WQAL/snd8hEGyeCbuDSXDHDb4NO0U9lUR+e0IacqyNti6mdBLTB+/WTDybV7IQYw9L3LhmlWPp0cACBQkTtaYBVqyMbX8ZfIowOA3Uldo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231695; c=relaxed/simple;
	bh=RPADRN59R8eLscax7RjXOnAJZRQAXec6titVhVwT4Zk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y0lUF6Tswph7s9Od/aSMwDhWKWL8GGJnL0a0N+mvl5+ydEL/FRwnGh56AapVZSRcXkJN4eWX8eo+bLS9JoCUw3PIs579VwWR2Frpes6Xq5uTdyxFWuQV+QttSiDIbDj9GLlQINNKxWPLKn6jCsowLZvJElN+yFs4dys3GGIybgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEO0CCud; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEO0CCud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4515E1F000E9;
	Tue, 28 Jul 2026 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231694;
	bh=Ld2NDmAKynimbM/lcXGc1p93BdsBGkJJNnlyWbmartU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEO0CCudjF0lRDk2EjLK3IU5xTFp/GIADnThleKXjsqYB6n42Cdhq/urEIG7vp/ue
	 X1uIkkRcwoViKZU7YOk7IWPs12U3zNdxgHxntaicKMCWHEpai3HSYycYCKdTLg7AS4
	 j9RHxUQbCxsVhdfODMvb0scKkr9GyWquk9lEsIj4R/7mCGHKuNUA50MW2rT5QPg3Cp
	 730DqVBQvVAWCrq8cj7ScJf/9QLYnRpMhTttjQWCBc9bAHrvnkqpd08bva1FbvmvWl
	 Em2yBnIcyhsyj4nIiuSVD/ULMEyIfL5AZdfo4MwrHkjCSkrmMOLcTUtcipcIDwqAsO
	 8F4KjxUUMNClQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:41:33 +0000
Message-Id: <20260728094134.4515E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver detects and warns about extra data in the RX FIFO but f=
ails to drain it, permanently desynchronizing subsequent SPMI transactions.
- [High] The driver silently discards the SPMI reply status word, ignoring =
command NACKs and parity errors.
- [High] The SPMI read and write commands lack mutual exclusion, leading to=
 concurrent hardware accesses clobbering each other.
- [High] The driver polls hardware registers using a sleeping timeout macro=
 (`readl_poll_timeout`), triggering kernel BUGs in atomic contexts.
--

--- Patch [2]: [PATCH v2 2/7] spmi: apple: Validate FIFO state ---
commit 6fe31783af0978f8c2699194bf6efebf6615ed3b
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state

Check for data before reading the body of a reply, and check for
end of data afterwards.

> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -78,6 +78,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,

[Severity: High]
This is a pre-existing issue, but does spmi_read_cmd() lack mutual exclusio=
n?

Concurrent calls to the SPMI controller could interleave writes to the comm=
and
register and reads from the FIFO.

Could this unpredictably corrupt commands and steal words from each other's
streams during concurrent access by different subsystems?

[Severity: High]
This isn't a bug introduced by this patch, but the wait function called
before this read loop appears to sleep in atomic contexts.

Every SPMI read/write operation calls apple_spmi_wait_rx_not_empty(), which=
=20
uses poll_reg() wrapped around readl_poll_timeout().

Since readl_poll_timeout() delegates to usleep_range(), wouldn't this trigg=
er
a kernel BUG when SPMI client drivers issue commands from atomic contexts?

> =20
>  	/* Read SPMI data reply */
>  	while (len_read < len) {

[Severity: High]
This is a pre-existing issue, but earlier in this function the status word =
is
discarded before the read loop:

drivers/spmi/spmi-apple-controller.c:spmi_read_cmd() {
	/* Discard SPMI reply status */
	readl(spmi->regs + SPMI_RSP_REG);
	...
}

Does this silently ignore command NACKs and parity errors on the wire?

> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
> +			return -EIO;
> +		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
>  		i =3D 0;

[ ... ]

> @@ -86,6 +90,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  		}
>  	}
> =20
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

[Severity: High]
This isn't a bug introduced by this patch, but if the FIFO is left with ext=
ra
data here, will the next SPMI transaction's wait function return immediatel=
y?

If the driver pops the stale leftover data instead of waiting for its own r=
eply,
it seems like this would permanently shift the data stream and break all
subsequent communication with the PMIC.

Should the extra data be drained here to prevent this?

> +
>  	return 0;
>  }
> =20
> @@ -115,6 +122,9 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,

[Severity: High]
This is a pre-existing issue, but similar to spmi_read_cmd(), does
spmi_write_cmd() also lack mutual exclusion for stateful bus transactions?

>  	/* Discard */
>  	readl(spmi->regs + SPMI_RSP_REG);

[Severity: High]
This isn't a bug introduced by this patch, but discarding the status word
here appears to hide write failures and parity errors.

> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");

[Severity: High]
This is a pre-existing issue, but just like in spmi_read_cmd(), failing to
drain the extra data detected here could permanently desynchronize subseque=
nt
SPMI transactions.

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-t603x-spmi=
-v2-0-f43e5f10e583@chaosmail.tech?part=3D2
