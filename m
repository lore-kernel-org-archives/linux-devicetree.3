Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328FF3264EA;
	Tue, 28 Jul 2026 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253651; cv=none; b=KXXxlhzb2hJrgm9EJwTO5zYpbIZClnBbcEOENFAGva8WJGCFd5XURkGue8bZ5yG5VfMo7QrX/mn71ykS7rnpiM/gqgQKWtwSl8seKzr3/2xSJGa6TteexSxxCqImp5KkzJ7qisP/mknRn3YTE3TJGnuTQ5WEcDtWDPi0C8EwZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253651; c=relaxed/simple;
	bh=lmdIp0IWbh9uMcGZBmXfwVwi3hZVqqhcBZt5kYYfD6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxqIfv9FVTheikGnNat2t/mxy0qPjmG6NWhzaxP3wEEB4pPxLcZUWEC9mPZgnQaT5HiBbtixGStMVWZjxKZoFRCepMN0qq7twkSq8QLvcHWKWRlvOeDc40HppaAl6NjnGI67npvKOXatfhFamcTVtCVpNWtDGRcjQUjxCAtpl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=NkqxqLr0; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NkqxqLr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1785253640; x=1785512840;
	bh=lmdIp0IWbh9uMcGZBmXfwVwi3hZVqqhcBZt5kYYfD6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NkqxqLr0fV4uC5Ahyx4llSCpnVPUYCajFXC1r13H6rKbKEtqvknze+lp2wro9gjyH
	 vg2qMtYK0Q5U9v7yev5o50DA+cY5Z1NWhFVg4Wpuprph1yMWOFVugvpcuItzWuwTcH
	 vmhoGvXwi30mB3Rvsrc8SDN8gEYw/gO9yrntnVGNoDdLehujP+LIamO9ayjWIqyBHe
	 YLuF2zNKHzqFwHv4KybYKF4srrzxWoss/yEQzb8H3dsvNzEIzd2aARNaZd+aTWSVAF
	 4ls5VadSFaF+LlYKednvR+0zI2tZuwHaAIy0ZCSWYLLj6V1o5Prwwbgk/Tfl6Q1nHX
	 DyW9JZjTP3g/w==
Date: Tue, 28 Jul 2026 15:47:14 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
Message-ID: <W3cNtJeiPe6gmMpfpNJOxa6NQtOyatXIFz6FyCh7pC8jkE90WX_1g3AgQwXadoba0BdHE3com-6cCkym5VCN5d-3sobraI8O4-TGwkqnWBA=@protonmail.com>
In-Reply-To: <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com> <20260728-6572-gce-v1-2-750bba32689e@protonmail.com> <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: d64a8c1a1c422d7bf05de4f1fc9e5dca04c6f3e6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Tuesday, July 28th, 2026 at 6:08 PM, AngeloGioacchino Del Regno <angelog=
ioacchino.delregno@collabora.com> wrote:

> On 7/28/26 11:42, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Some SoCs, such as mt6572, have different WRITE and POLL instruction
> > encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs hav=
e
> > 22-bit offset and 2-bit subsystem ID.
>=20
> What about poll_addr, mask, write_s, write_s_mask and others?

These don't seem to exist in all 65xx except 6595. TL;DR - old GCEs are
essentially dumb compared to newer ones. They have only basics like MASK (0=
x2),
WRITE (0x4), POLL (0x8), JUMP (0x10), WFE (0x20) and EOC (0x40). All logica=
l
operations as well as GPR/SPR don't seem to exist.

cmdq_pkt_poll_addr, write_s, write_s_mask are not used by the DRM subsystem=
.
mask is the same across all GCEs because it takes only u32 mask without
address.

> Not sure that this will actually work reliably (though I'm sure you're no=
t
> creating any regression).

I have tested this change (on top of out-of-tree mt6572 DRM) with some
dd if=3D/dev/urandom of=3D/dev/null spam + modetest, as well as igt. Seems =
to
work without issues...

Best regards,
Roman
