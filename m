Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B028C037
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189954; cv=none; b=t2Alov1P4vsDWgbLqId1K4raPzr1TCM8hNFfM25eZ6pdxQBUnEgIc0DjdkQcfs32CSOSdQBFze9ACjfCXo+IuaFxNJ0FgCms5BBprs8uG7ldNKX7nk1gTXHamcF9PHD+CgsZ6PlKQeeh4I6/0JkU2wGVfvi42VC/NNLYrfL5QOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189954; c=relaxed/simple;
	bh=CelzUwJp0rC9F5Zst9WHJ7/tTbofxe3yyIQM8Iu5DNw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PW50f174oaN/rmU7LAZf3A1lURMCziGAaPfhD9UAkkYfOhSMH5O9Xi5bqMn5q1xmY0XmPw1znbsKuPLx3fnJpMp9aK3BiYeWCTd0Ww4lsp70ruoYdXYq2F26nRqg81mOSIofjyoXayADEoVJaHhU/lEy0GSL29W0tOkcQT2WZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oy7fB3Wc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oy7fB3Wc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C584E1F000E9;
	Sat,  8 Aug 2026 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189953;
	bh=yWRCHl7vTEwPpKbxyOFqphiv4RmhutEqnee8nCdaeS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oy7fB3WcmV0WlTpLs6YCsCnYqVHIY/IhPqW/nMFs04KVOktGSMW7SNeBf6ILiTGDG
	 1lXATB7fjiKAUbaE8FrWkPJfBr08apKXHo94DYuTCmibC4x+OaQeRy1DMjRHV/xZ1m
	 7g4vUJsBva+HW+BQQlHX0YzDBwSLA9rLm1fwdK50HuPjP7PWrdw/FIpjLAbBkSVEzo
	 IKxawXLh8acY39LFqdciXJUfzHzR5fYIqJHXM3JOy2WHWK2x79xxphUzWS6/3AG/qj
	 xcQdLEgul+hjNHeqOYsc9sM+flSeKnU8eLwEU76U5itGSlHXMjp86T83BWBAbUrZtS
	 kAMDPYI23Cemw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260808-t603x-spmi-v5-2-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
 <20260808-t603x-spmi-v5-2-553c5ac2f137@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:52:32 +0000
Message-Id: <20260808115232.C584E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The SPMI controller lacks a lock to serialize concurrent read/writ=
e commands, leading to hardware FIFO corruption and race conditions on the =
`prev_fail` flag.
--

--- Patch [2]: [PATCH v5 2/6] spmi: apple: Validate FIFO state ---
commit c5b2972a9b6f963ec09316a6569b8c232707ae21
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state

This commit adds validation of the FIFO state before reading the body of
a reply and checks for the end of data afterwards.

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
This is a pre-existing issue, but does the lack of locking here allow
concurrent accesses to corrupt the hardware FIFO?

Because the hardware sequence involves multiple unprotected MMIO operations,
interleaving these steps from concurrent threads can mix the command and
response streams. This can happen if two different SPMI devices on the same
controller are accessed concurrently, as the SPMI framework core does not
serialize accesses across the controller.

Additionally, could the introduction of the prev_fail flag create a data
race? If one thread evaluates prev_fail and flushes the FIFO just after a
concurrent thread has written its command, it might actively abort the
concurrent transaction.

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
This isn't a bug introduced by this patch, but similarly to spmi_read_cmd(),
does this unprotected multi-step sequence allow for concurrent accesses to
corrupt the hardware FIFO?

Could the same race condition with the prev_fail flag occur here if another
thread is currently reading or writing to the controller?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-t603x-spmi=
-v5-0-553c5ac2f137@chaosmail.tech?part=3D2
