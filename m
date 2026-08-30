Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F8325485
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121692; cv=none; b=iiRRcFyrJdwNQal1BAXCPT2sJPa8t8Y06Mpd+vQ2YuDc5Q4AYozT5XMdFsC/pfx4R4QEw1Kb2m12uUdAp0HnrVHAWkw8YaDANaC//8J0y3HZYE9nBtVnbiXDIn22hTnaTJ7MOj/gwBNtQt07FZVHXJ8JNYSXmMg0kJ00NFIlmjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121692; c=relaxed/simple;
	bh=kJro3XSTKHt7Y5Bg3Flj+SXreaC6g1z1RecxqmodcqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JtYWV8p1/L+Bw72qHoOvi/oaGVYMJDjSmBFABHrJrIjDQOjlRgZ0iabVwBJ3EklOUSxt/ZIEmQpIs0YGLuomtB5edOR0E0rbf9OiEMA+jqLznkCf2g4PMFjmHJRIADAmgEG9+hw6NvMLaPthEsJ88HG6Z5p3W0/Bws6iQDOy8Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOhE7cPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOhE7cPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256AD1F000E9;
	Sun, 30 Aug 2026 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788121685;
	bh=YN9C8QVp+Yq+/Hul0T4+HR+gavr/Uj6Kr4s/Um/Gjp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOhE7cPMQiPB4Fw4oNM1r6lsY/HfLOIvJPNOnKALCYsg5mejbx3phk14WPTP6Exee
	 2TPyNuxj97P4lndXJdqbm7mitJ69US8nAeVAOnOJXUe6sEsK4pChCbdkONCXxQJK75
	 Xpdf4Czapl8lRtVGw3pdxAjSnzMedITTtzVL26g7em6jSu5qIPvluaCAqPnXhbhTcN
	 QSpeZExCmJ0plfL962INjzZF/4CPtYoSPWmnKrr3dOXVDjszPY+yjyLb6a/lTvlQ1e
	 5sr+hA6shRGsoAJeefzuFVT9wJquWfettXCSzpEzGU0QjYBM7kwBXPa6HG3D2ld8rH
	 cwlZVFa8HzYqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/19] thunderbolt: Add ring_configure to tb_nhi_ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-12-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-12-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:28:04 +0000
Message-Id: <20260830202805.256AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing memory barrier (dma_rmb) after reading DMA descriptor comp=
letion flag
--

commit 82c2d88f02d2edaeda6c19dd57bec009104cdc30
Author: Sven Peter <sven@kernel.org>

thunderbolt: Add ring_configure to tb_nhi_ops

The Apple NHI has to configure and enable each ring with a single write
and uses a separate register range for the receive ring PDF masks. Add
an optional tb_nhi_ops hook for it which falls back to the standard USB4
NHI method when it is not set.

> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 3cb69deec63e8..696da52abff6c 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c

[Severity: High]
This isn't a bug introduced by this patch, but this patchset specifically
targets arm64 (Apple Silicon), where weak memory ordering will actively
manifest an issue in the existing code.

In both ring_work() and tb_ring_poll(), the DMA descriptor completion flag
is checked, and if completed, the other descriptor fields (length, eof, sof)
are read immediately without enforcing memory read ordering.

drivers/thunderbolt/nhi.c:ring_work() {
    ...
	while (!ring_empty(ring)) {
		if (!(ring->descriptors[ring->tail].flags
				& RING_DESC_COMPLETED))
			break;
		frame =3D list_first_entry(&ring->in_flight, typeof(*frame),
					 list);
		list_move_tail(&frame->list, &done);
		if (!ring->is_tx) {
			frame->size =3D ring->descriptors[ring->tail].length;
			frame->eof =3D ring->descriptors[ring->tail].eof;
			frame->sof =3D ring->descriptors[ring->tail].sof;
			frame->flags =3D ring->descriptors[ring->tail].flags;
		}
    ...
}

drivers/thunderbolt/nhi.c:tb_ring_poll() {
    ...
	if (ring->descriptors[ring->tail].flags & RING_DESC_COMPLETED) {
		frame =3D list_first_entry(&ring->in_flight, typeof(*frame),
					 list);
		list_del_init(&frame->list);

		if (!ring->is_tx) {
			frame->size =3D ring->descriptors[ring->tail].length;
			frame->eof =3D ring->descriptors[ring->tail].eof;
			frame->sof =3D ring->descriptors[ring->tail].sof;
			frame->flags =3D ring->descriptors[ring->tail].flags;
		}
    ...
}

Could the CPU speculatively reorder these reads?

If it fetches length before the device DMA transaction writing the complete
descriptor is fully visible, could it result in reading a stale value and
improper frame handling?

Does this code need a memory barrier like dma_rmb() after reading the
completion flag?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D12
