Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201CA3EC800
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078651; cv=none; b=H79q+Z2TirIRoBghZOxYkIy5JcshADWZ3yWHGn+TNnSyknlqSd21erRaktmNq9JwFyDckStexQlM+PFFfL8OQvAUc45a+4q9VyVAY4dhRldx8lQ92274lnkhcpwxHlP2ShuCOYNdSfmqJisV1B2I6SCxo3BupMyM4tPskYHMVsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078651; c=relaxed/simple;
	bh=1rl3TAIUw4DUsRAFgrcgfB/+SjNuXmX535LlQyXiCxQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J35l123itb+48dtFWqUVEVhtPrS0nQWYVqbJ39gYlLsfinvoNWt1PxBc98C0o/s1dUpRlfx3qwd4oNLHBJZZ3TjXzW39wWhpsAXEd6pXB4ooKeDkDgvY0EPCL6RwSYBEYp3wYtYRmdwiaLC/5DqHbS9wA8yzUMN4u/xOPz8NTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cg+YAMzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cg+YAMzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8EE1F000E9;
	Tue, 18 Aug 2026 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787078649;
	bh=I3FQWJzh+QpTFg7a6DgVXqQMk6unv7KQlILGvF3IZBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cg+YAMzlUwmbjsD5Epe9O/ne1C/P6A6AEDX+bYpmOFdZdrAJVD1f5VG8hV2rOgPSN
	 XrEQ1LucfNMt2dU3xulGQNlHdprHi2a7SIWUR6ugUqWx5mFoyHYDMFrWGzSmsZVG9V
	 SpGIWgDw9aXBxeetxJWfPmxExnezToEOqg5w7TCaOkpf5+65qStIjsl6KPy1P/KwoX
	 nhbQf6YHiG3G1lPdeulIZL26iPN2UTszXafyX+bfpIeQkTZF/JNVKWmZCg+RmUc50Z
	 u2OI6gq49tD7F20QRlqWuiQYcHrEDj2fOaALIWL7UjP2tj5P3fjSC9Vnoyd1XN3gwK
	 P21KgiZRR0UFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818-t603x-spmi-v7-4-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-4-dafebe6e7739@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 18:44:09 +0000
Message-Id: <20260818184409.8D8EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Replacing bitwise shifts with `memcpy()` into/from a `u32` variabl=
e combined with `writel()` and `readl()` for FIFO transfers introduces byte=
-swapping data corruption on big-endian architectures.
--

--- Patch [4]: [PATCH v7 4/6] spmi: apple: Implement remaining commands ---
commit 0955662fb587593fe5c8969de75412be27a01533
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands

Add support for zero write and power management commands.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index b1c127cf5f441..9843dc871d6c7 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -86,6 +85,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
> +	while (i < len_wr) {
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
> +		spmi_cmd =3D 0;
> +		memcpy(&spmi_cmd, buf_wr + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +		i +=3D j;
> +	}
> +

[Severity: High]
Will this combination of memcpy() and writel() cause data corruption on
big-endian architectures?

On big-endian systems, memcpy() will store the first byte of the stream into
the lowest memory address of the u32, making it the most-significant byte.
When writel() is called, it will apply cpu_to_le32(), swapping the bytes and
sending them to the hardware in reverse order. Does this loop need to use
writesl() or explicit bitwise shifts instead?

>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);

[ ... ]

> @@ -101,11 +109,9 @@ static int spmi_read_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  			return -EIO;
>  		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
> -		i =3D 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);
> -			i +=3D 1;
> -		}
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
> +		memcpy(buf_rd + i, &rsp, j);
> +		i +=3D j;
>  	}

[Severity: High]
Can this sequence of readl() and memcpy() read zero-padding instead of valid
data for partial reads on big-endian systems?

When readl() byte-swaps the incoming hardware register value on big-endian
CPUs, the lowest bytes end up at the highest memory addresses. Since memcpy=
()
copies from the lowest memory address first, a partial read will copy the
zero-padded upper bytes instead of the actual data. Should this use readsl()
or the previous bitwise extraction logic to preserve portability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-t603x-spmi=
-v7-0-dafebe6e7739@chaosmail.tech?part=3D4
