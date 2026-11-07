Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044673;
	b=WH1MLSgB1isfweg6d3FkZlEcBLQKUcPsm1ZVqa7YIVzAfsE2XWMF+ozpd+70KhRMAXA9
	 NcBfyTcsTwCVkDfgtYt/m74x+ZNoW2O9yrlzE8n+Mgeqv2ejEiD39iPz9Z4heH1HbkvQA
	 Os+E+CVT9V6R2SVlKyNN++T7sAZvcyJPSpVL4125nU2XDO1rg3nQjk47CZMLTNxqRY3Hc
	 lo2kNa2wh7U1ak1T+24Y/GKwS1J8NovM8JqMkpFoeYXyaQ1G6Kl4nHHl6OWwp8DxFunZE
	 L6U3Wd9CMdhkt5pUAmB4GkqH9pkbgUhjGnnfLSm2E39mOBxdjL+DWFfQ29DhaQA+FOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044673;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5l8D0m8uzC3yqpdzGude3r6I+YPDtV/evQ9BaaCdxS0=;
	b=d4n02PI+9dLS/ml6h0fmwOgQszwscb4tu8tBfr2U+tIRrVcOG803v7VgodG2rT4H8IyC
	 8xd3g3KRz56ktBU7a2E53BmeMTFzYMUOoHbZE9fiLshFv0Uz8zQYFsWQIqLpmBX6Qeuv4
	 OWJLDwvu/D+Dj/ff3gPDfP9DEXpYJwtm0oSKodLdQ0ZT0r0y0Ec4rd1+q7bLc9B1Y+AYK
	 79J9TxqOSyzx8iThszidK/4DhUr2VAeaL1fpPmkhePzNSiwqWkg+1woP3gfcqp56L6U+X
	 DpcDDCdUkNDoO1krz7iQjVL7tncAuD3t3FfrBYS7tZRCLmwrojhj58H+eFUxbjrOr5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqZdXJ5g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139A606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqZdXJ5g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB31F0089F;
	Sat,  7 Nov 2026 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794044672;
	bh=5l8D0m8uzC3yqpdzGude3r6I+YPDtV/evQ9BaaCdxS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KqZdXJ5gY+YsSB6YeUcrotVL0qhbKMJm2dZR2A2b50fur+SeOzK4G85iyIaRkab6f
	 o/r43pV4CzoJ0gLaEtfkxm2pLuUIzCd+MZUayil/qwHotsOPqFzStjYrYgfztDzQx+
	 QJTncx/SwMsb0BR1dYQZ2nQsTZxn0TZXUfKN694hMA5auMo334zlnbZ1RSTC1JiWD1
	 a2NIwMBeFqvtNErfjpnvVmiTVFtcjwlU8yJkruQcWkhKStamAMfleL5DQk4d6oHGsj
	 riWQHlhoASJneTjbQhFAt6/LKaj+AMl8zumlhtMEz5DRzgYpmXzt1Gw9vkXTMPp9so
	 HcXnE/FuStB9A==
Message-ID: <sashiko-outbox-202781@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: fdt: reject oversized unflattened trees
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sung Byeongchan" <tjdqudcks0424@naver.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107093519.618896-1-tjdqudcks0424@naver.com>
References: <20261107093519.618896-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 09:44:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] of: fdt: 32-bit pointer wrap of mem in populate_node()
  bypasses size check
- [Low] of: fdt: missing Fixes trailer for commit 50800082f176
--

commit 473f33a66107c250c3f97cdffe2600a50ef45e63
Author: Sung Byeongchan <tjdqudcks0424@naver.com>

> of: fdt: reject oversized unflattened trees
>
> unflatten_dt_nodes() computes the expanded tree size by advancing a dry
> pointer cursor, but returns the result as int. A valid flattened tree who=
se
> expanded nodes and properties exceed the signed range can consequently
> wrap to a small positive allocation before the full second write pass.
>
> On a 64-bit UML build, a 157,133,160-byte FDT expanded to 4,294,971,394
> bytes and narrowed to 4,098. The undersized write pass left a corrupted OF
> tree whose property pointer later caused a kernel segfault in
> __of_add_property_sysfs(), reproducibly in three fresh processes.
>
> Reject the dry scan before its cursor can exceed the signed caller extent,
> leaving room for the following alignment and four-byte end marker. This
> prevents the write pass from starting with a narrowed allocation.
>
> The fixed target rejected the trigger before allocation or write in three
> of three fresh processes. Normal, near-boundary, malformed-header and
> recovery controls passed in both lanes.
>
> The demonstrated impact is host or VMM boot input corrupting and crashing
> a guest kernel. Information disclosure, controlled write, code execution,
> host escape, RCE and LPE were not demonstrated.
>
> Assisted-by: OpenAI Codex
>
> Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>

[Severity: Low]
Since this fixes the int narrowing of the dry-run size introduced when
unflatten_dt_node() was converted to return int, should this include a
Fixes: tag?

  Fixes: 50800082f176 ("drivers/of: Avoid recursively calling unflatten_dt_=
node()")

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index ecc9231026224..135502b882020 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -310,6 +310,11 @@ static int unflatten_dt_nodes(const void *blob,
>  				   &nps[depth+1], dryrun);
>  		if (ret < 0)
>  			return ret;
> +		/* Leave room for the alignment and end marker below. */
> +		if (dryrun && (unsigned long)mem > INT_MAX - 7) {
> +			pr_err("Unflattened device tree is too large\n");
> +			return -EOVERFLOW;
> +		}
> =20
>  		if (!dryrun && nodepp && !*nodepp)
>  			*nodepp =3D nps[depth+1];

[Severity: Medium]
On 32-bit architectures, can a single populate_node() call wrap the 32-bit
mem pointer past ULONG_MAX and back below INT_MAX - 7 before this check
runs?

Inside populate_node() -> populate_properties(), unflatten_dt_alloc()
advances *mem for every property without bounds checks, and a node
without an explicit name property also allocates its unit name length
twice (once in populate_node() and again in populate_properties()):

drivers/of/fdt.c:unflatten_dt_alloc() {
	*mem =3D PTR_ALIGN(*mem, align);
	res =3D *mem;
	*mem +=3D size;
}

If a node with many small properties or a large unit name advances *mem
from just below INT_MAX - 7 past 0xffffffff into [0, INT_MAX - 7],
unflatten_dt_nodes() returns a small wrapped positive size and the second
pass writes past the end of the allocated buffer.  Checking for overflow
inside unflatten_dt_alloc() before advancing *mem would catch this on
every allocation step.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107093519.6188=
96-1-tjdqudcks0424@naver.com?part=3D1
