Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D73CF058
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500989; cv=none; b=GwtcT2wS3P3OFf3Lbf4jVu48xw5pEt4j9vry/y95C9r3VYwdCJkME1JQ6dk0Ucu/7wnbRdarctrtXdwfVBrjzV9nGiP+3253bxrDYGdSmhyy33Yj1fnapoRsSHhqd0k9i+wCJoiIDbEC+lCQH8G4aRBgdoRThIO+mBCjGN++Uzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500989; c=relaxed/simple;
	bh=vCXLbZKP5nxLd8lytF4/oSS2szgDAdtzQUqDoNZI/IA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CwU/TcgRsMdIdD+XLaE/pfSZG1sPNQ7awftE6U2UBgmFLzNeza2N8VIBU34XhmdwZkkyvnlVCUVPrHszSgfcdqNYi9TXtNRab69OXDRJbfUHAu9GFqrSIX1Gah+jTEnE7/8OvcN0usXfs2SWO6n+fr52bHpi0M0rMmcU9bwKzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntarbEmS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntarbEmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9297A1F00893;
	Wed,  3 Jun 2026 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500987;
	bh=pWP009u4aFANueNjxy03vdtYYQqgXLcClAqnZXojlwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ntarbEmSTkBHI3xOP3xE+eSuKMOqd4nomgyZeNUUFEIIwdF6P0W5rWUcpo5r10K1s
	 XlJu2ZE24qz425CsTYWiOxLbE1Dkf+Zvkyp/ZwLq7azhEakhtHDiWYiww5UeZpafBt
	 jReYn/A8m1h+DYy0jOOJoHh+t6n9flutsCRA0INPoXZAQ1DFZ9SFQpq/bCOsW/66jB
	 oG6+hOzvjsq7WZeWfw0z8nHXng/v4Z0K7i2JSIGQ9fNop2jmErrA26fib80lFTGiTq
	 PZ1GYA1aQuT2Kn3/zt+sIiu8RiNQhBpkhAKkPayCTZ3H8CY3DQvLsjRBo87Pszc2yz
	 PcVmfLOeoN3Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: reserved_mem: prevent OOB when too many dynamic
 regions are defined
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sang-Heon Jeon" <ekffu200098@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603152709.941788-1-ekffu200098@gmail.com>
References: <20260603152709.941788-1-ekffu200098@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:36:27 +0000
Message-Id: <20260603153627.9297A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Misplaced bounds check causes false error logs and log spam for =
static regions.
--

commit 8912b72ed66a1803770dcfc16f2465a1f7651224
Author: Sang-Heon Jeon <ekffu200098@gmail.com>

of: reserved_mem: prevent OOB when too many dynamic regions are defined

This commit prevents an out-of-bounds write in fdt_scan_reserved_mem()
by adding a bounds check for the dynamic_nodes array. It logs an error
and skips excess dynamically-placed /reserved-memory subnodes when the=20
limit of MAX_RESERVED_REGIONS is reached.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 8d5777cb5d1b3..8bd565b2b71be 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -341,6 +341,12 @@ int __init fdt_scan_reserved_mem(void)
>  		err =3D __reserved_mem_reserve_reg(child, uname);
>  		if (!err)
>  			count++;
> +
> +		if (dynamic_nodes_cnt =3D=3D MAX_RESERVED_REGIONS) {
> +			pr_err("not enough space for all dynamic regions.\n");
> +			continue;
> +		}
> +

[Severity: Medium]
Does this bounds check incorrectly trigger for statically-placed regions?

Because this check happens unconditionally, if the system reaches
MAX_RESERVED_REGIONS dynamic nodes, any subsequent static nodes in the
device tree will also trigger this error message and be skipped by the
continue statement.

Should this bounds check be moved inside the block below that actually
determines if the node is a dynamic region?

drivers/of/of_reserved_mem.c:fdt_scan_reserved_mem() {
    ...
		/*
		 * Save the nodes for the dynamically-placed regions
		 * into an array which will be used for allocation right
		 * ...
		 */
		if (err =3D=3D -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
			dynamic_nodes[dynamic_nodes_cnt] =3D child;
			dynamic_nodes_cnt++;
		}
    ...
}

>  		/*
>  		 * Save the nodes for the dynamically-placed regions
>  		 * into an array which will be used for allocation right

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603152709.9417=
88-1-ekffu200098@gmail.com?part=3D1
