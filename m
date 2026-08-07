Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B7238DC58
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089044; cv=none; b=QE52wDb7o2EknUWZYG7TVRz1zH7s1ae33rDUKCHBoqWtrpP+fCbwcFSVqnNx/oAbBdInS8jhhEbDkS8XhllWGKAkTS5ge6TNiWxPfLdWDLhwj6XbB9ufoV/lrJpKSIc20L5ABsojvGUFgTIdNaNtZUYx036rynczNEII+UQ+BdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089044; c=relaxed/simple;
	bh=w3RP9qJpdD8/S5x6VJ2cOGjdWMWMRVtD9zHYsTD2SAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XgmbbztAu77o5lyMZCCe1a7LizO8ciy2TjYXmCQ1ebh10lP4Fwn6q5HFMcWDwuqmVmg6JjhvZAwwRuGqx16c3u45aaECR4or11tJVpAF7Epr5GrZTxg/o+RAJZIJssruLLmd9tQGhoc03L5/hc199tqaYFETyOpLNQ2Qh+ZQDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SX72m3/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SX72m3/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C1F1F000E9;
	Fri,  7 Aug 2026 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786089042;
	bh=TzzJhpiHHu1gvkDDpiRovATD9yfpN10lCvWuEhWmyHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SX72m3/PiqM6R6f2zvyN+pDHNA68waG1wTO9xhUOG75C68TNCeZNEZCpgG9RjR4Dh
	 fz1LUF+h9RW8dkd//VSBHA4Xthdx0LAF4OKrXf3XgV1Bz4IzCTO3mStooeHE/0TQ6i
	 bIaAF7lWVz1Ks1VLgIYVBzGg9DcGoT9kgu4wl02kKoB1YoPfqfLYe4tAGBbV4SBY7j
	 6CqiEW7VrCKa+w7M27pmbmgoATdIZlCCS7ovKP55XWCQjkNJNQiQJ0BeDKNxXxKF2+
	 WM8wWbI8sfotdod5SNmfSHLHlv98z8fD5tnPslvMUq6INN3YnPH/CZPpaPk+egKPUl
	 iQl4w7q8oNMgA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 5/6] virt: bao: consolidate the IPC hypercall ID
 in include/linux/bao.h
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <db869ed90e16691ea1f0aee051e54daf89f42de8.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
 <db869ed90e16691ea1f0aee051e54daf89f42de8.1786010512.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:50:41 +0000
Message-Id: <20260807075042.17C1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing memory barrier (e.g., `wmb()`) before notifying the hyperv=
isor of newly written data, potentially causing the hypervisor or the recei=
ving VM to read stale memory.
--

--- Patch [5]: [RFC PATCH v3 5/6] virt: bao: consolidate the IPC hypercall =
ID in include/linux/bao.h ---
commit 392291f754c5a86346cd59911eed878c78654f9d
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>

virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h

This commit consolidates the IPC shared-memory hypercall ID into a common
header. It also simplifies the architecture-specific bao_ipcshmem_hypercall=
()
helpers by dropping the hypercall_id parameter.

> diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcs=
hmem/ipcshmem.c
> index 0d46d89ee788b..5bf37c1c7933d 100644
> --- a/drivers/virt/bao/ipcshmem/ipcshmem.c
> +++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
[ ... ]
> @@ -104,7 +101,7 @@ static ssize_t bao_ipcshmem_write(struct file *filp, =
const char __user *buf,
>  	*ppos +=3D count;
> =20
>  	/* Notify Bao hypervisor */
> -	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);
> +	bao_ipcshmem_hypercall(bao->id);

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing memory
barrier before notifying the hypervisor here in bao_ipcshmem_write()?

Data is written to the shared memory via copy_from_user() just before this,
but no memory barrier ensures global visibility of the write prior to the
notification.

The ARM SMCCC explicitly states that callers must ensure memory updates are
visible before invoking SMC/HVC, meaning an explicit memory barrier (like
wmb()) is architecturally required to prevent stale reads.

Without it, could the hypervisor or the receiving VM read stale memory befo=
re
the stores from copy_from_user() become globally visible across PEs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786010512.gi=
t.jpeixoto@osyx.tech?part=3D5
