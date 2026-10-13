Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4451588F
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914285; cv=none; b=HuGVLBmqGLFyrc/ZVpD4fqlSFUZYjxkn7CcpLTbmiShxMoHj+PDN0tmncNVKb9IJMHhBX3uxUluUK/yRbv/gdnLCCgeg2ckIcBpKqrR9qelA2Wla0Tz7SfscnwRw7KxOJvTfDUpsJckUW9EV2ZI/ND4NgfLQm2F3aod1v2/mNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914285; c=relaxed/simple;
	bh=jk1WrijeiI/KVj/MzBWOErIU/1lEHsPTUA+9AF+5EX0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=C3X9WhzbKC8BkTk7hJHn60zv/zUdLB/iNA7Xnx2Nyn6or4d2LNS5vsdCskBj3bmhbKKjNdaCc7WsHdFLB1wcEcUoYbAObpWZvvQ8j1t1Es/8sRsqEbfZ+7uM616CIMdMseyRVllOeTBzpeXx5Yz43k1jzzTFDMXZIuHQZKdErnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9J/34pj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9J/34pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593EB1F00898;
	Tue, 13 Oct 2026 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791914283;
	bh=yaP38WMpp/punxw8YCjCzfeQBHt3ojuFFND5iV3Ykx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9J/34pj5DOTythBxfPlYugKOl0iT7dwdSceh+YHFhfRAplMq6Uum21w8O04cQDMZ
	 51JfI7ByURkIUqbE5MtzRNRU2Ml56xrffzJTJ9r02lIKoeCNAx5AFahPe7hScRH35b
	 k/lvBqxcdOWRd40fY2xznl32moaXWoD6w1pEMfza9go4vMGWiiUcJluFNUwQe0m0Gu
	 Bev8WEcJEEC/YqU5WRDT28RHrDVnBtoSGX/o+7zU+Ngo9PHINQRQA1GLiTa9YhrrBS
	 jyXVBcSk6i0Go9MZit6xnLwLnZWROh8XWwFLn8acXD+AcoyD8BZjXwLR9axhagcZJF
	 RyeZutc80linQ==
Message-ID: <sashiko-outbox-170283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] crypto: cmh - add key/datastore infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013174847.2192609-4-aousherovitch@rambus.com>
References: <20261013174847.2192609-1-aousherovitch@rambus.com>
 <20261013174847.2192609-4-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:58:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] crypto: cmh: missing implementation for QSE and HCQ VCQ builders
--

commit edeafa889ed6c19c029045fbf5064008f9e6f3d7
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add key/datastore infrastructure

This commit adds the CMH key and datastore system object layer shared by
the algorithm drivers. It implements context staging, DMA mapping, and
VCQ builder functions.

> diff --git a/drivers/crypto/cmh/include/cmh_sys.h b/drivers/crypto/cmh/in=
clude/cmh_sys.h
> new file mode 100644
> index 0000000000000..47c19e2f72a93
> --- /dev/null
> +++ b/drivers/crypto/cmh/include/cmh_sys.h

[ ... ]

> +/* QSE core VCQ builders */
> +void vcq_add_qse_flush(struct vcq_cmd *slot, u32 core_id);

[Severity: Low]
Are the implementations for the QSE and HCQ VCQ builders missing?
They are declared here in the header, but they do not appear to be implemen=
ted
in cmh_sys.c or used anywhere in the current tree.

Since these prototypes constitute dead code right now, should their
declarations be deferred until the patches that introduce the QSE and HCQ
drivers?

> +void vcq_add_qse_ml_kem_keygen(struct vcq_cmd *slot, u32 core_id, u32 k,=
 u32 flags,
> +			       u64 seed, u64 z, u64 ek, u64 dk, u32 dk_type,
> +			       bool masked);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013174847.2192=
609-1-aousherovitch@rambus.com?part=3D3
