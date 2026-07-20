Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB5429810
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556152; cv=none; b=StNMKrhyuZUnK2MPutKJAgR+kjzCr4sv0mmE9kxF7SbgS4XRhCKDFsgswe6WPaEoR8wKepbK+ppQngwKSrzjdqcaHkqviguizNG6fQq8OYMujnjNwv5z+pA82Vx0qUyGXBpLjC8EXLpHFzg6xU4I7kvx1nnlQfNgKRubjrbrArA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556152; c=relaxed/simple;
	bh=7v+B9aF6KO5sLbLPkT3Yqty849tThav+lt3YZWMLG6Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tIw5AvEPzO7ALfNHn802ZLHtq4weGzap1EiJq6tQctNxf7HZOt1I0BVK+1ciRIx9+CXicmuqR5hPdSn658wbf7g5Rd+zUDwR4OIEcpIwBUrCKTRX3ming4B5S4GLBrkM9spCdhOm67pJ4GgAy6ATfDwykpX2eT1AswjBlMrPadg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hwEE0MCs; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hwEE0MCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784556142; x=1784815342;
	bh=rIUH7Om9TP2+of2IvSjo/klnvZLvL7VmTwo2Br+NlKo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hwEE0MCsp7FnCerQellLJy8FpDFGVQXkX4vQTSxjrPXlncsc5q2SalY289x8k9coU
	 Sq985az+qLP64nhKhah3CKZh9bXBpJDtWHq448LfjvW/WbVaJ4xa4csjupjS0lF6N+
	 J3SFsgpUrxrXmew/xT7y17M3+3IuN08/YK/FDOKjtbf8p6R6/hEIWk6JiKEsxFK8YC
	 F8yWwhZFM8CAn8W2N7+eN3ld7FbRZQLi9RgUbpAayiocNUIgD4zUfMVXgm2Wa99bNn
	 +lcRzSk/gvxeOETXA7oAkzqBSTyae8bRZqDfxbPBB1dXl18A36/p6tK8IBpEQnEXit
	 m0R/6BqSv5uzg==
Date: Mon, 20 Jul 2026 14:02:16 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] nvmem: mtk-efuse: add support for 32-bit aligned reads
Message-ID: <fjbTxmhINpeE9M-4eyCFuhueFEH1J4fJBRN90DeIFMEfvxbwx8XeTLnkLsSDq2nchJJFFZxUe_SUNQuGWUDiB4taXJ5lRkLUhT1C_i3L8Rw=@protonmail.com>
In-Reply-To: <c2b85740-4372-4609-a9fa-930010f5296a@collabora.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com> <20260715-6572-nvmem-v1-2-9c13be99d077@protonmail.com> <c2b85740-4372-4609-a9fa-930010f5296a@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 3ea465e119018711fb21346ca626e34fdfdfec16
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, July 20th, 2026 at 3:48 PM, AngeloGioacchino Del Regno <angelogi=
oacchino.delregno@collabora.com> wrote:

> On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:

...
=20
> it's easier at this point if you simply do
>=20
> =09if (pdata->needs_aligned_read) {
> =09=09econfig.stride =3D 4;
> =09=09econfig.reg_read =3D mtk_reg_read_aligned;
> =09} else {
> =09=09econfig.stride =3D 1;
> =09=09econfig.reg_read =3D mtk_reg_read;
> =09}
>=20
> and you avoid touching mtk_reg_read entirely.

stride =3D 4 means we can't do something like reg =3D <0x1 0x1>;
For example, CPU speedbin is sitting at 0x181, but we can model that as
0x180.
cpu_speedbin: cpu-speedbin@180 {
    /* This is technically reg =3D <0x181 0x1> and bits =3D <0 2> */
    reg =3D <0x180 0x4>;
    bits =3D <8 2>;
};

I'm not sure what are mediatek preferences in the devicetree since
things change quite frequently... Downstream never triggers this hw bug
because it uses readl everywhere for each efuse.

I would keep the stride =3D 1 so we don't need workarounds in the DT, but
the reg_read indeed sounds better :)

Let me know if you have any objections.

Best regards,
Roman
