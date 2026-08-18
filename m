Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817E3BC68A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078803; cv=none; b=GvQEulm05U4n+1r2CWQXlzdPV0aopPBX8GDf9bV3wisZKCKGKiBThWO05czDEa5wKUOZsUYxJfHAdLDi4Y3TQto4EuH+DyhrMcQOAqFmNQCshisJGPrIwN3fZO2po9bJ4VNUsaGsbiQGeYlj5begeTbKAJpzZBy82f9oznpQPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078803; c=relaxed/simple;
	bh=zD60PX6lzQRgm8G4+f6Zt4UdlMxpLk8H6+JoOagj66U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bQDkYO6NA84wJhbwwKcQiyVrXzach2g8+an/qf1lhidlq2Vja9zquRgsew68MhkAt8VDpOw3G+zncjVFsEt4j/VmSxJGNTY84JLok2lCYqQcxdZjRwmfGrObtwZs0dg+IPrKOouahrqmATo2YLuK5J5xVRqy5SniRqXhR30p8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOPS2Fnv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOPS2Fnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1F61F000E9;
	Tue, 18 Aug 2026 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787078801;
	bh=WgMQk/4DOSDK1Lh5jyz/vnkTefnmnUmR6rw8L4wjhdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kOPS2FnvNjrBynbQwpwu3KsuhPbm3AaRTlFOUgCGK4XfT0/GMyhkQilnk8Ydjd+Ep
	 EaKJrVWz7UmEPCbDMsY/Umh0DHsArfpHf8a/SixjaTZxJWk3pPxtPEA8m7YSe7V601
	 GuZDKTBfEHEhMJYFk6KzZOUePRZ8b0Rou2PGdlDJC+OiFpSs5dWINKvmfq2upXTHoK
	 djvUK+R0pTJuu/bi2UufdJLtbQpy51ZVRg1lu2+MybIY49pGRVpbHKLAIjo7mdrWrc
	 e53RN0ICWgYF+UtySv0HsRg+qlHadc05RzPWYfO4un31/UB9qsbjXgaCBB/D5vFcge
	 vmZ5fmnX8Rsaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] spmi: apple: check transaction status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260818-t603x-spmi-v7-3-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-3-dafebe6e7739@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 18:46:40 +0000
Message-Id: <20260818184640.EF1F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing serialization lock in SPMI controller commands causing dat=
a races and hardware state corruption.
--

--- Patch [3]: [PATCH v7 3/6] spmi: apple: check transaction status ---
commit 203a0d3a4ce6927effa9895d6d8b8a19c020f6cd
Author: Alba Mendez <me@alba.sh>

spmi: apple: check transaction status

This commit adds checks for parity errors and missing command ACKs in the
Apple SPMI controller driver.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 15721cb41d5c8..b1c127cf5f441 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> -	u32 rsp;
> +	u32 reply, rsp;

[Severity: High]
This is a pre-existing issue, but does spmi_read_cmd() in
drivers/spmi/spmi-apple-controller.c need a lock to prevent data races?

The SPMI core subsystem does not serialize these calls, expecting the
controller driver to handle mutual exclusion. If multiple threads access
distinct SPMI devices on the same bus simultaneously, could their register
accesses interleave?

This could potentially corrupt the hardware state, commands, and FIFO data
since the sequence of writing to SPMI_CMD_REG, waiting for the FIFO, and
reading the result is performed without a controller-level lock.

[ ... ]
> @@ -114,6 +125,7 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 reply;

[Severity: High]
This is a pre-existing issue, but does spmi_write_cmd() in
drivers/spmi/spmi-apple-controller.c also require serialization?

Similar to spmi_read_cmd(), data is packed and written to the shared command
register without acquiring a lock. Could this lead to interleaved register
accesses and hardware state corruption if invoked concurrently by multiple
threads or interrupt handlers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-t603x-spmi=
-v7-0-dafebe6e7739@chaosmail.tech?part=3D3
