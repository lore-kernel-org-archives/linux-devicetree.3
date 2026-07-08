Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9E33FF1B5
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550096; cv=none; b=hrkNqvQ5O0lTb0hbfaqldxnppliGJMUGebPB/e5VzCHDlTC2lqlSD/U/Z/QvLEWHeSuzWzaUlNc+bUQwycY3R3MscIYQBXur5BrH8diBPQ5XrPslC2SJOHr4LOwbotEHgo7pA4afqXYOXGu7tKcveylI0bZkWcLSFbseFdlYqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550096; c=relaxed/simple;
	bh=wjGPeJxVr2gIF9CG0x9HxjCUYF5799R7Qs6oW59h7PY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GD0gT0xTFkHVbbAFkfsVWU76HhQsoxMSTeCFSDOdRqenJu10jvuO0xnSNu3SXOfNOMd7GKVfcqm8DKIvnsFU5pCY/D0Y2RAeIGh6XUCD3uT0atQ1qkXvBU4yEaTJPUoFV3gquLs/D8dIQWfmCY/1b2ZAJM1JbGeNPcJhre5NnnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVW9Nlad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVW9Nlad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69DD1F00A3D;
	Wed,  8 Jul 2026 22:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550095;
	bh=mYseExzuKs7tANp8e7nMIcZYAqqg7UL1HAqSrop4FXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IVW9NladYPCInN5FcbnPkGyKrzQnuggMH1FJHEs9ema+d5hq4/Z9h3h7kRVkFAZPu
	 U4P0k6tj0DbFWHhkesRSj1Ig+PAmqh5huhuWsX/VJ5Atq7yUbpfpUl5dsBA3Q+YBfn
	 NOlx+/FAMugcSMru9/r//Ms0mezc6uWV05vx4e1DQHrc6hjuSFULEkB1rlV+lqzk3C
	 /fW0z0MlXiqrFMrkceGndFTly+YkYOnvWBdK7XArjA7bflMPSBjiFybmWgGgcMekJe
	 W7e0FvEOZACLPZqiqaQSB1RnTt8U1UvEzTCSsV9XS90QzhutKTFQFu4TflksKtVJpF
	 V57fU+lynL5Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 04/13] net: ethernet: oa_tc6: Export the C45
 access functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus" <ciprian.regus@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-adin1140-driver-v5-4-4aca7b51a58b@analog.com>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-4-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:34:54 +0000
Message-Id: <20260708223454.D69DD1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing forward declaration of struct mii_bus in oa_tc6.h
--

--- Patch [4]: [PATCH net-next v5 04/13] net: ethernet: oa_tc6: Export the =
C45 access functions ---
commit 396791ba4d15eb553624cdae104591b0ddf7be04
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: oa_tc6: Export the C45 access functions

This commit makes the C45 access functions non-static and exports them so
they can be used by Ethernet drivers which set the OA_TC6_BROKEN_PHY flag.
It also adds the corresponding function prototypes to the oa_tc6.h header.

> diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
> index 62e3d89f80ed0..2660eefa35043 100644
> --- a/include/linux/oa_tc6.h
> +++ b/include/linux/oa_tc6.h
> @@ -31,3 +31,7 @@ int oa_tc6_read_registers(struct oa_tc6 *tc6, u32 addre=
ss, u32 value[],
>  			  u8 length);
>  netdev_tx_t oa_tc6_start_xmit(struct oa_tc6 *tc6, struct sk_buff *skb);
>  int oa_tc6_zero_align_receive_frame_enable(struct oa_tc6 *tc6);
> +int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum,
> +			    int regnum);
> +int oa_tc6_mdiobus_write_c45(struct mii_bus *bus, int addr, int devnum,
> +			     int regnum, u16 val);

[Severity: Low]
Is a forward declaration for struct mii_bus needed in this header?

If linux/oa_tc6.h is included in a file without a prior declaration or
include for struct mii_bus, could it cause compiler warnings about the
struct being declared inside a parameter list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-adin1140-d=
river-v5-0-4aca7b51a58b@analog.com?part=3D4
