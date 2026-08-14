Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07933382EC
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 22:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786746072; cv=none; b=SDD802jXlyvlYjtetIQo3K5C9NzqiAD+1qKsRh+WihNCsavHZMYdCCMoe/yhA3Ce43RlNPYRTyaImIG87stKuYwDIm6vmpY8+mTzeFgpsVtOcO+dlXVGw0B9SIH//B+xmU7IagPp4KkDKj+EbadBMcqR4aGfxlwRWYHTeVaN/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786746072; c=relaxed/simple;
	bh=eU0txT9iGr3EBHVl9eYsx9A4LnAxU4b3ExeXeRICwFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N+iqCULoQudVP8XOgMtZw7GbFLxa4mXgi9ahepS+eTOS0YFLlPKvolH8WffnUWrdH8iRy0QvJlYJUqeMApAryNWpoRDNRmVxZUrZPFbmWdTKJdY6DDHBUEHi8nTbRF++wWn/joo7nClthgGy5C8Z8BWSjYCBcIyYKZb4a4iS86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW4pr77j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW4pr77j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615E41F000E9;
	Fri, 14 Aug 2026 22:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786746070;
	bh=lCnhYuBqLPLWzytGgkt0DXM3JTaFHfQFWL59+LSB94A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PW4pr77jbGdDcpHS4V+/6js5bLoxSGkjNnK7BGFICgTDtCMeIbBO4CRDD4yForqOh
	 v4QkU6cxwMcf/1Gr8zeeiLbR1q4sO/jQC9ZajV3Ujlgb9gROOwKDx5xZGyPdFuViH2
	 rtXypBbzc8c98rckhHNr5eiwLkLBdjtVgeWqYjgPT1nVcI0AdD4nMv2BPYVNdz7HJ4
	 4bh8tRANj9T7Xo2UOKGLxzVz0ENVKPjlUmseAuLjjHHlXCbT5h8AHN6MwNCbjn6knf
	 7kpEJ4OQXloeaiTFj9FPuMhAXHp9AQea4UqZNLDEO+fenLL5rNkB55b36FYvNrzLkE
	 mf+WBN+bE0UbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 2/4] net: pse-pd: add Realtek PSE MCU core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Jelonek" <jelonek.jonas@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813222036.873930-3-jelonek.jonas@gmail.com>
References: <20260813222036.873930-1-jelonek.jonas@gmail.com>
 <20260813222036.873930-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 22:21:09 +0000
Message-Id: <20260814222110.615E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] rtpse_mcu_resp_is_final() excludes RTPSE_MCU_OPCODE_NOT_READY, w=
hich breaks the bounded retry mechanism.
--

--- Patch [2]: [PATCH net-next v14 2/4] net: pse-pd: add Realtek PSE MCU co=
re ---
commit 4ec3b6f7573cbef331580bfd04e92ce4ccdb71d2
Author: Jonas Jelonek <jelonek.jonas@gmail.com>

net: pse-pd: add Realtek PSE MCU core

This commit introduces the core driver module for the microcontroller=20
fronting PSE silicon on Realtek-based PoE switches. It implements the=20
message-based protocol, parsing for Gen1 and Gen2 dialects, and exposes=20
a registration interface for transport drivers.

> --- /dev/null
> +++ b/drivers/net/pse-pd/realtek-pse-mcu.h
> @@ -0,0 +1,94 @@

[ ... ]

> +/*
> + * A polling transport can stop here: the reply to this request (opcode =
and
> + * seq_num) or a terminal error. The seq_num rejects a stale normal repl=
y; the
> + * terminal errors match unconditionally, as a request the MCU couldn't =
parse
> + * carries no seq_num to correlate against.
> + */
> +static inline bool rtpse_mcu_resp_is_final(const struct rtpse_mcu_msg *r=
eq,
> +					   const struct rtpse_mcu_msg *resp)
> +{
> +	return (resp->opcode =3D=3D req->opcode && resp->seq_num =3D=3D req->se=
q_num) ||
> +	       resp->opcode =3D=3D RTPSE_MCU_OPCODE_INCOMPLETE ||
> +	       resp->opcode =3D=3D RTPSE_MCU_OPCODE_BAD_CSUM;
> +}

[Severity: Medium]
Does rtpse_mcu_resp_is_final() need to include RTPSE_MCU_OPCODE_NOT_READY?

If a polling transport relies on this helper to wait for the MCU response, =
it
will ignore NOT_READY messages and continue polling until it times out.=20

This would prevent the core driver from handling the transient busy state, =
as
the transport would return a timeout error instead of passing the NOT_READY
reply back to rtpse_mcu_do_xfer() for its bounded retry loop:

drivers/net/pse-pd/realtek-pse-mcu-core.c:rtpse_mcu_do_xfer() {
    ...
			ret =3D pse->transport->recv(pse, req, resp);
			if (ret)
				return ret;
    ...
		/* NOT_READY: MCU busy, wants the command resent; bounded retry. */
		if (resp->opcode !=3D RTPSE_MCU_OPCODE_NOT_READY ||
		    tries >=3D RTPSE_MCU_NOT_READY_RETRIES)
			break;
		msleep(RTPSE_MCU_RESPONSE_MS);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813222036.8739=
30-1-jelonek.jonas@gmail.com?part=3D2
