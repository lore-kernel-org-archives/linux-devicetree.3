Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0832D4F30EB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805036; cv=none; b=IXNUxD8bcIpFqpTfXtfXUGEQzwNTOeYBJ/cpqij3f7EnzUozyYOa4Ccalj2OFjt+wcq4o2VvI9JUzmwlzYmx7NV07mIwzk+i4tviVp/kXuEpzRxPRzth6L0IaCHEbKCqdHXNrGek10KHa9NdDwUfH/3xobfbohktd+Ow0ZkCaA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805036; c=relaxed/simple;
	bh=fSopx/2HF4CHIvvPMEBwLaS94CxSGVqZlUZcwemU8k8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UJ6aY0Jm5RCMpTZZiy5NNf8AEQ5G7mpiR1uu6x3ss/e6acL8gWd0wi1IqnAsQSFsuyJl56K/tGf+LSk9YtHMAt8hMLD32I3ciapVRuQf8odnItjbXqAcD+bCfft4AZkki2KgYWzjcmG4guOfYczyJGemk4YYkbCXz0vDiXrZ820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeAD+NZ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeAD+NZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B441F00A3A;
	Mon,  7 Sep 2026 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788805032;
	bh=GxEBDzNiddhZFILFkKuD/56bqlhlEXtqucUubvpU66M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PeAD+NZ1cKs6Qf9nbTsfgWtzeHpzr1byIbl7HHWxsiZnUrZzbV1Pqvc01McU/UG3A
	 2HSVZAJeeQN4Qs+kWpdrkvwlYYb1cnWAt591gtDxnke20sWqU6moInxZogNNv17npb
	 n8tQAyC/iFoozNNayA0FBKSFs/SHsPTQHK9aarr+5L3dTKZyLwUMvTMrnZw4eBFqT5
	 kan/Uq7LlFgzpRm5Dc5rhk+869Pt+E7YRdlnSeJsh4YO0w5LBa5HMAW7JwWZanotYP
	 vSFly2iRUvA07jJe4vuLn+8aectBRvBAdBNnrHlM5RBjaj6oWZE2d9sFV9e79EC25Q
	 Lye9xBT5y1eNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mailbox: mtk-cmdq: add mt6572 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-6572-gce-v2-3-412a5b037290@protonmail.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
 <20260907-6572-gce-v2-3-412a5b037290@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 18:17:11 +0000
Message-Id: <20260907181711.C3B441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Functions generating SPR/GPR-based instructions lack safety checks=
 for legacy_isa, potentially causing GCE hardware lockups on MT6572.
--

commit 4694eedf10a37d189a86ca417a39efa7d5e2b2dd
Author: Roman Vivchar <rva333@protonmail.com>

mailbox: mtk-cmdq: add mt6572 support

Add legacy_isa field forwarding to the cmdq helper and a platform data
for the mt6572 GCE.

> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index e523c84b48088..5e7bc52baaa13 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
[ ... ]
> @@ -787,6 +789,14 @@ static const struct dev_pm_ops cmdq_pm_ops =3D {
>  			   cmdq_runtime_resume, NULL)
>  };
> =20
> +static const struct gce_plat gce_plat_mt6572 =3D {
> +	.thread_nr =3D 14,
> +	.shift =3D 0,
> +	.control_by_sw =3D false,
> +	.legacy_isa =3D true,
> +	.gce_num =3D 1
> +};
> +

[Severity: High]
Does enabling legacy ISA expose missing safety checks in the cmdq helper?

Looking at drivers/soc/mediatek/mtk-cmdq-helper.c, functions like
cmdq_pkt_write_pa() and cmdq_pkt_poll_addr() appear to generate SPR and
GPR-based instructions without checking for legacy hardware capabilities:

drivers/soc/mediatek/mtk-cmdq-helper.c:cmdq_pkt_write_pa() {
    ...
    err =3D cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(pa_base)=
);
    ...
}

drivers/soc/mediatek/mtk-cmdq-helper.c:cmdq_pkt_poll_addr() {
    ...
    inst.sop =3D CMDQ_POLL_ADDR_GPR;
    ...
}

If a client driver on MT6572 calls these functions, would it silently emit
structurally invalid instructions to the command buffer?

Since the legacy ISA on MT6572 does not support SPR or GPR instructions,
could this result in an unrecoverable GCE hardware lockup when flushed?

Would it make sense to check pkt->priv.legacy_isa in these functions and
return -EOPNOTSUPP to prevent hardware lockups?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-6572-gce-v=
2-0-412a5b037290@protonmail.com?part=3D3
