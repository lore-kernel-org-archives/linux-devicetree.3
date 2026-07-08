Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4247E3BB11A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495752; cv=none; b=rfq42PY7uNfCy7fou63uFLU7Uk3MveYp0gXLn3DapqxulZl8RcQmzRRLhbJ64LwHhlCLLdYnN8kEMh/gPlBs8Ag5PGjvUzPfu79fFhd8x8L+wX2HRuupqNkPX4jTnAdg5C0hG8NOz3CpREHNSd6pYtmF038YNCYK73lHp+WShMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495752; c=relaxed/simple;
	bh=Yli5DSpJ3aFKAad+dglxCHaKw4Z1lS1FgjPVgQWvnlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f7pI2/pfMoAolmBxMWOb51IqaBDSkEainbgGJlh/Z5Mm5UObuHZSTzTFKGfDNCCtpzJDOTy3PqJ+HxNNqMoqmpE2TT+Yxd5+yARH9BIeQmYE6GF/wx0LSg5uG4I7W837W4iaq7JFeP1W2E7I+db0FlIc6lv5s6MDLUoK+k557Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlTiWs6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlTiWs6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D591F000E9;
	Wed,  8 Jul 2026 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495741;
	bh=mj75QmIUAtQCN2eXZDcRua8y6CcTnKKJoETNVk0WtOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DlTiWs6uiXEtaCjw6oHxBhkeVbEsBPHpCZRDIlBeKcnrDtlMiTP0De6fzKop7Jqxj
	 3ERO9bES7jIDrpES/sQC8TdKpitpwCynIkkeEqhT5rz/tGoyogaasQ7Ug4OUJkN6LP
	 wGPupIcSbL+YYSjACdM3whYcE3cldJa7tCbLN8AwmH061f6/GGVImQpJUPfVuVIF3x
	 2b7iL/ZWaJ82cbwHs9Of9BFpFCZ1Olq81Zxg7QqjWuAwd4t2dGoXVfxQ/5P8RTJw9v
	 jpFp93lX9Dj6m0LtLsQtm56aLMZps3R2UFPp7G5gxiCoc0XbqFz15JmCo8M/GH7OEn
	 ZohHqXpj3tQNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/26] mm/numa: Register node data information into
 meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-19-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-19-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:29:00 +0000
Message-Id: <20260708072901.08D591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] meminspect's fixed-size table will silently drop dynamic registr=
ations on large systems, leading to incomplete node data collection.
--

--- Patch [19]: [PATCH v3 19/26] mm/numa: Register node data information in=
to meminspect ---
commit 6b717a1355a1db2530c1d2b409e69a9193d91d12
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

mm/numa: Register node data information into meminspect

This commit registers the dynamically allocated node data (NODE_DATA) into
meminspect for debugging purposes using meminspect_lock_register_pa().

> diff --git a/mm/numa.c b/mm/numa.c
> index 7d5e06fe5bd4a..f04740dfb2cbb 100644
> --- a/mm/numa.c
> +++ b/mm/numa.c
[ ... ]
> @@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
>  	if (!nd_pa)
>  		panic("Cannot allocate %zu bytes for node %d data\n",
>  		      nd_size, nid);
> +	meminspect_lock_register_pa(nd_pa, nd_size);

[Severity: Medium]
Does this silently drop node data registrations on large systems?

When the total number of CPUs and NUMA nodes exceeds the available dynamic
slots in meminspect, the dynamic ID allocator will run out of slots. Looking
at the limits defined in include/linux/meminspect.h:

    MEMINSPECT_ID_DYNAMIC,
    MEMINSPECT_ID_MAX =3D 201,

This leaves approximately 157 available dynamic slots. Since
alloc_node_data() executes for each NUMA node, could this lead to incomplete
node data collection on large hardware configurations once the table limit
is exhausted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D19
