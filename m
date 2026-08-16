Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FB2BCF7F
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876671; cv=none; b=LAsQN6htupKMyGbUHaws5dIKDpLByFF6qUgOdl5dCxSNDLCXAbBut3ZamZdw0RRCzO23tXutGkCD9ZBhXGeOUQ36/fqm5WY558xR5w1DaYIOhSXgC/Jo9/idMC84yMWHjUDJ3BIgaRIMO4sgk6cd78JJY9ES4WFwbGawtyuFSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876671; c=relaxed/simple;
	bh=eeTDu6bGUSGJ1b1WrIJU22CAtSkYDC8J7lKk22ihcl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r1S07Azuq5zRoB9sT5aygfglUNSPm/NdmyjX6nDHQFg8g4FEF6mt3r+QPuPv76bsSIU8OsqWgwcXOc+oh3Iaf9B+zTbttXOJM0sEr/C6xGzZHJ/8zraTWMl742I+JEfxy5g2FKJ/fLhXLja75ogsNzJz1sjjY13k+61UJIRWVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1WeMhAi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1WeMhAi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60601F000E9;
	Sun, 16 Aug 2026 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786876669;
	bh=/BPWOuBBDc3nuCiXJvU+YfjEOr7epwFrGZCQjSdyGfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k1WeMhAifklHj3ZmtECzNFxv3KNgDKNqqGobHuuqPXN8bee764vudK3wBKB6Txblc
	 l6mRLRJ0fbluscddM9zdycDixxOnCGLWC+3IV6UV1QnlW+ftMY5yBUFSkwHjakziyZ
	 uEMmIZkK+HtPEQoWDGb6GJJreCk9MOcBfEwjXeepKiESjQbL33HPBnRhP12E60VPUu
	 0SsI/bobgc1oBYRpDZhZOiseQoqfc2wIpTVG96lvkVYQfBtlOGmJxDisUtfSf7g04o
	 bMiJriCHyUrjT365ZTlFqA26lUYZkVcBRGY8nisKIkxjfPXP+yywTdoIm5gXsdMMLk
	 kgd9QoyRMVYng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260816-t603x-spmi-v6-2-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
 <20260816-t603x-spmi-v6-2-c5ab87aa447b@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 10:37:48 +0000
Message-Id: <20260816103748.E60601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing controller lock for SPMI transactions, leading to data cor=
ruption and racy shared state.
--

--- Patch [2]: [PATCH v6 2/6] spmi: apple: Validate FIFO state ---
commit 70a1216b809937a36a9579df121874ded0a12def
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state

This commit adds checks for data before reading a reply body and checks for
the end of data afterwards. It also introduces a state flag to track previo=
us
failures and flush the FIFO accordingly.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 376cf682c43e0..15721cb41d5c8 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -67,6 +71,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
>  	u8 i;
>  	int ret;
> =20
> +	if (spmi->prev_fail) {
> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		spmi->prev_fail =3D false;
> +	}
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for multiple
clients on the SPMI bus to execute transactions concurrently?

The driver does not appear to hold a lock when executing SPMI transactions.
If multiple clients on the SPMI bus (e.g., a PMIC and a GPIO controller)
attempt concurrent reads or writes, their accesses to the shared hardware
FIFOs will interleave, potentially violating the transaction protocol and
corrupting data.

This patch exacerbates the issue in spmi_read_cmd by adding spmi->prev_fail,
which is evaluated and modified here without mutual exclusion. Could this
create a race condition where multiple threads recovering from an error
simultaneously flush the active FIFO, potentially destroying in-flight
commands from other threads?

[ ... ]
> @@ -97,6 +117,11 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	if (spmi->prev_fail) {
> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		spmi->prev_fail =3D false;
> +	}
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: High]
This is a pre-existing issue, but similar to spmi_read_cmd, multi-word
writes to the shared TX FIFO and access to driver state occur here without
locking. Could concurrent accesses from different clients lead to interleav=
ed
writes and data corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-t603x-spmi=
-v6-0-c5ab87aa447b@chaosmail.tech?part=3D2
