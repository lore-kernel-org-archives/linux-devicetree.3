Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035E4E0B83
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557533; cv=none; b=Nh4B/JzfZ/mscXrSXhS42H2I38X0XPlklItDO6UO/t54X6PGe2HQuu/y8jOuO033O0u3Be03mPVrhiEYU0+PTIF8R4tz7bzGRQYtokFpggDZ0pTabdTN33J97G+1FvIL1nEqGLBNzbVbnyvziZ4oRL3XQcl0b5TGkvY4s3HCJzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557533; c=relaxed/simple;
	bh=e/gf79CX7/GRkpKVwMfzbZ7h0ztwaOJZ3DwtfcsXQ08=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=phkOk6Z/5jXK5hPrh0i9qZq0NGAXpYp8kDy6YromVqgNdbOVdtphm5q0evN3TnUJTR0SmMWjFZDa07IDLtK/whOPq9rXy/P3Wf6UdXaN7fKg0Jc68Jr0QTBY37SP0wR1kbP98BrLfXC06JYDqrsksgDVjJhP/SsMKaGYLuQaKPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gotGfzNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gotGfzNC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CFD1F000FF;
	Fri,  9 Oct 2026 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791557531;
	bh=p8xKfRbmihEhZGkaj4OoFzjw9r6HqnZn593Dzi9s84I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gotGfzNCQ58mNy6I0D305fP3lLQLgcw55l3j6LXmdmw6L8yhOhkAPLJupJJB3lqbJ
	 yPQupMhGAlSHaVVbFiMy/FFEWObZI2NQCtbG5h0dz4AXj+tHCCfQmx6Y0wEANwQWhR
	 rfm0snoUm0QT4aq67BZNKTQq++msLbmDvCj1yuUrWl4bozG+sJn8Y11n0r9Ipqm12u
	 JNL7rkCK67J8jiVU5IpG2xbt+xVoA9s0TtWfMSO4EhfqoThxYOneO6o+CioKSe1JNc
	 PhxBsYZO95Mo/OGVS8poPL8Dro/oXgHI6UcA7xiOd/o4vWUu2UXx6BWztv9WoDB3wN
	 wrG6JbL87857g==
Message-ID: <sashiko-outbox-165731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 02/11] net: ethernet: qualcomm: ppe: Fix
 multicast queue config table index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-2-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-2-16caf43e44ee@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 14:52:11 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: ethernet: qualcomm: out-of-bounds regmap access due to inco=
rrect multicast_queue_cfg size
--

commit e63c30c06634bbba4d742f77aae5726bcf70fb62
Author: Luo Jie <jie.luo@oss.qualcomm.com>

net: ethernet: qualcomm: ppe: Fix multicast queue config table index

PPE queues 0-255 are unicast queues and queues from 256 onwards are
multicast queues. The multicast queue configuration table has its own
index, starting from 0 for the first multicast queue. The driver previously
used the absolute queue ID as the index, which was out of range. This commit
fixes it by converting the queue ID to the correct multicast table index.

> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net=
/ethernet/qualcomm/ppe/ppe_config.c
> index 125b73be92b13..8a553902ffad1 100644
> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> @@ -1530,8 +1530,13 @@ static int ppe_config_qm(struct ppe_device *ppe_de=
v)
>  				if (ret)
>  					goto qm_config_fail;
>  			} else {
> +				/* The multicast queue table is indexed from 0 for
> +				 * the first multicast queue, which follows the
> +				 * unicast queues.
> +				 */
>  				reg =3D PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
> -				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
> +				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC *
> +				      (queue_id - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES);
> =20
>  				ret =3D regmap_bulk_read(ppe_dev->regmap, reg,
>  						       multicast_queue_cfg,
>  						       ARRAY_SIZE(multicast_queue_cfg));

[Severity: Medium]
In ppe_config_qm(), multicast_queue_cfg is declared as a 5-element array:

    u32 multicast_queue_cfg[5];

This means ARRAY_SIZE(multicast_queue_cfg) evaluates to 5 words (20 bytes).
However, the hardware table entry increment
(PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC) is only 4 words (16 bytes).

Since this patch changes the index to correctly target the multicast queue
configuration table, does this regmap_bulk_read() over-read by 1 word into
the next queue's entry?

Additionally, a few lines later, regmap_bulk_write() also writes 5 words:

    ret =3D regmap_bulk_write(ppe_dev->regmap, reg,
                            multicast_queue_cfg,
                            ARRAY_SIZE(multicast_queue_cfg));

For the final queue in the loop, wouldn't writing 20 bytes overflow the
16-byte boundary and write 4 bytes past the end of the entire multicast
queue configuration table?

Can this out-of-bounds register access trigger a bus error or system abort
on the SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-qcom_ipq54=
24_ppe-v1-0-16caf43e44ee@oss.qualcomm.com?part=3D2
