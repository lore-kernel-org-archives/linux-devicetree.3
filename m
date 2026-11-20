Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174099;
	b=FZrokCbFVsoIYzv97khK7Ssp+flreijyHDgmi+ie0ksVmIPnlQ3S0uazE3TQsF7LE3XW
	 7/2TZ8cpHviggHmCX++TE8YVI6A9g6o4a+pr0ZXha6y0qoZaj9I46/WVwLmL/7Ou8dXRE
	 THm16cLUiJf2hGUF9595+zPaZDNEXoDozCBcNbcRL/DA3ligjnW9g5zjopNaM9KP+pOBf
	 aVD486TNc1vXceAXDUmsevP3W4ZvWfEqxBm+GjYKbOj65MIamT99Cnfj0aDg3appadixm
	 63xcZMV1goXn8B/vnxfLKmivFubIU6UoIvSd3Dgv+m1gAjRv89DCxdfqxOk9xeeCAjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174099;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ct97nDx3VcHSXYPxiuvMrwXIRec4bOcuD5FjR1gbuYw=;
	b=Q1V9ij0QJH9F2mpbB/rC2xPzON7GFCf8ftIIU9jQQ81bsmk/z8/96DnGvsVPUkNbAwyQ
	 w0NcTHw3eXm2Ydk+SiShYlG08DITMcfLIghbo7i+BwasInUpHhvE9x8XUrK2++IkxohBe
	 MtxguUf/40TGJnJM+Bvt+r/nUzHPKmSA5BfyQat3FvP86ke08isEqB1Le6EbfmIsS5iRG
	 RNrxE1971iZ+BVj9L3WbM6DgeszFilmcxss1LnBKVxWk63U1QakSqQsK6V4BvWYwRWN2G
	 WBmp/+lToDY/fRkCzjkQKXJPhKdo4eTtzhNuSsKliONgyuVAWn4+Qufpf7GZENWqeKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCRmZ9l6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEC3606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCRmZ9l6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8761F000D1;
	Fri, 20 Nov 2026 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174098;
	bh=Ct97nDx3VcHSXYPxiuvMrwXIRec4bOcuD5FjR1gbuYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aCRmZ9l6uKh5XmFw1iGnOlihfPSKD/ZwWZwtbDZs8Ipd03kYwv2UWLY25jwzWz2fx
	 79Rg0zE4+0z9sxbQ1ocV8FtZMSb01jzRFUtaqcaXCqrmcdZ53w8lKeQ91tEHbHtpl0
	 KdZMKt2hHhj0LtxH7tuAxR/ZREXqhF1otqg9ThLvAmGWDA2kGNs8TvB7RwLGCCWlM6
	 IAOK7vQbR8vUCJMjZZ+WX1GbW32ri/X9bu1VnxqzVXVcJblrqGFP4eMey7y6YzuXNw
	 3nSEJAaAmY9PYBl72m55Z4eOmD51SVDVFyVoWcAKh26gOGYtOCpdaQtVE+uDSfUJ3r
	 vt70249b6NRgw==
Message-ID: <sashiko-outbox-225041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Route buffers to the matching
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-5-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
 <20261120-vpu_iommu_iova_handling-v7-5-25a771235a7f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:28:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] media: iris: commit message misclassifies SCRATCH_1 and omits
  HFI queue routing
--

commit bcf470fe5bd4c987e0c348301754ebc9faa2c5af
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Route buffers to the matching context bank device

This commit introduces iris_get_cb_dev() to route V4L2, internal, and HFI
queue DMA allocations to the matching pixel or non-pixel context bank
device, falling back to core->dev when context bank devices are absent.

> Add iris_get_cb_dev(), which maps a buffer type to the owning context
> bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
> NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
> buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.

[Severity: Low]
This isn't a bug, but the commit message lists SCRATCH_1 under the pixel
device whereas iris_get_cb_dev() routes BUF_SCRATCH_1 (the combined COMV,
NON_COMV, and LINE internal buffer) to core->np_dev.  The commit message
also omits mentioning that iris_hfi_queues_init() and
iris_hfi_queues_deinit() are updated to allocate the HFI queue table and
SFR buffers from core->np_dev.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-vpu_iommu_=
iova_handling-v7-0-25a771235a7f@oss.qualcomm.com?part=3D5
