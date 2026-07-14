Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20273EE1FE
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014552; cv=none; b=lOCINIyoeqUjiV9Sb3dFLuivdNa+2L4oR6cGn0WDUc4WTM6cbgjFm1IwGnRnCh9tXaS1wjv2DP5avWf/7TJ3/rW7uEake71Sn5rb04Ogeddw39jqeaX/5/Ox/Z0MDgtpul2tR4MX4katpALLxWfHS2JBSIJ8SNDR4d+vlkZJKek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014552; c=relaxed/simple;
	bh=thE6MKDBgxQ/2kTxtQxylJzWWa2DTPV9HWq/Oqshg8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNTFMRR9e6UqHBq1tE4/8/PnOvb7vNhlDwyUndu3LhdRzmCtL+CqxQctkFCbmkxaUndKpKg1c9QpEHn/AXiPISjSxPYp1LkthOdOteNcCWYuCJ4sZIVZiA/fwKaBWJKefS5eoEXBKIXyZIYy+f+ZHtEbzhIvgynargps8f2+WuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQjSbYhG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQjSbYhG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-474560436c3so498993f8f.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784014549; x=1784619349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EZDP77brQ5bvhb37m4sjMTk+Xtc5WyoVuJCcZEy5/Us=;
        b=PQjSbYhG7l9ASUYQmKlYFS+sKvO+M8bmtQiQpO9+yci4idNJeTkjbL0liIGnl2qYXn
         4YwVv3dN31nMt73EBvIVlJaIKZrBvjRJabefKFt0zaxRhJl8lokR4kW3bl/I2s5E4PvT
         q1QHKu7/4S1FuN+Y+hrRgOhQBCThOZwpqAgTV4omkYPO1e7VcnmhoV+b5STXEEe1r5JD
         d2Bqk6T0LHKEqMVA4FWw8NzyVrUhNfycHspKydsrGqcJg6jesH7fzT3sJMZWcOGP+ZUy
         BUXuj/2K7xFFBLBSHv8pg7qWtHmhXty2UH8Rr5vRZNuN/t0mIlCDBpsa+hcTk90njqgk
         B31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784014549; x=1784619349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZDP77brQ5bvhb37m4sjMTk+Xtc5WyoVuJCcZEy5/Us=;
        b=jEQWaGbwHod4morW9vBFFyC9Eb+LV5/XPGAwPtaN1zhpr5Jxrc0hv0I09aSuGSrFS5
         p0QwOTk/bV0vHxpX39jjcON4Xn4vB9aW5hjpedaz8YwtcnqR+Bb6V+CkI52PO5NTwev+
         DymCQdS2LdGFZWlD59lJhexka+dDXa7rSr1ZU1xL+JxR2zqluu0jUYlRFHnM0y0KafHV
         1ykWbnQzweGM8s9b8/8aJVGDW1t/d2HuvqoVRKieSHj1SuPekQ95E/7z9SSMUda0eD+E
         CdgseY70glb66z+vx2SZu33I2cXgAXeN51sVVOVU0hPih+jVRpFWhDMSjUceKFNKkNR5
         hQkg==
X-Forwarded-Encrypted: i=1; AHgh+RrZMeorJw6+SKMLCa2xp5nuuMTc5nMhC2iRdilgShNnlTuyqBKtEPV9mmMyDUAgLkmFRbtmHXsW32YP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CdU6gldLL1lvLg9VU+ssf5uIYogIfZwbO7nL4jrh5y36C5Uc
	oLe3Qz+pFGY0q0xBqVFII4A4SW69sPGfBKkcztzxr5OkgBGdFnOCGIpxQttu2o4C5KQ=
X-Gm-Gg: AfdE7cmzQFE0H39fPK9FuzSHeg7b36AQOCa8Lp/OHvePJU+LjQUMugi5iIbhE1kUBNA
	R3p53oXgywHAj+RvkDAlvJ49Sr39xRElKS9kN7frQRcim1zmGAuQkdVck/TRdKuEx+HyOxVO2mL
	xp6YgmGj+7Y6iswvuOu2y0ENG8G8/KgSq31+H0szdMyxjDIz6LsBU+KrrSWa4SAxWhSyK1zGutm
	Wq+aMpTRrWrDTA4bBcONWxj7iJ+UQpQSeE82jCsdfrBVNzyR3Q0C72I1CUhm4stqNRWsQuF2Afc
	1d+/eBS5CCtZs5eyG8Y2Ooj/o1LF+TLWAG4xZx4KPKnSQfH00VTvtdUjfb0QVqpxX2br0Wi8YU9
	EecWW+tF7GMtUSb4qufwvUddaSbmmZkgwO0MIK4fPQOWCy9eC1oUyfhUu9uC1Fibnxl6+lU2e9X
	AVJdMwiJg1D1AXKCE7BxgWDENA
X-Received: by 2002:a05:6000:2404:b0:473:673e:3836 with SMTP id ffacd0b85a97d-47f2dcf8a3amr14217779f8f.28.1784014549221;
        Tue, 14 Jul 2026 00:35:49 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:6c30:6cbd:7b12:2745])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464caeffsm5599960f8f.36.2026.07.14.00.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:35:48 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:35:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	chris.lew@oss.qualcomm.com,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
Message-ID: <alXm0rp3NK62G3-3@linaro.org>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 11:02:32AM +0530, Vishnu Santhosh wrote:
> On Qualcomm SoCs where the modem (e.g. the mDSP on Shikra, VMID 43 /
> NAV) is the AXI master for BAM-DMUX RX transfers and the XPU enforces
> per-region access control, each individually DMA-mapped RX buffer
> requires its own XPU resource group (RG). With ~16 RGs available, the
> 32 per-buffer dma_map_single() calls exhaust the table and the first
> inbound transfer faults with an XPU violation.
> 
> BAM-DMUX is a singleton (exactly one instance per SoC), so the
> destination VMID does not need to be a DT property; it is looked up
> from the compatible string's match data instead. Add struct
> bam_dmux_data with a single vmid field, and a shikra_data instance
> hardcoding QCOM_SCM_VMID_NAV for qcom,shikra-bam-dmux.
> 
> When match data is present, allocate all BAM_DMUX_NUM_SKB RX buffers as
> a single contiguous dma_alloc_coherent() block and SCM-assign that
> block to HLOS plus the VMID once at probe. This reduces RG consumption
> from 32 to 1. The block is never reclaimed across a modem power cycle
> (bam_dmux_power_off() does not touch it), so the probe-time assignment
> covers every subsequent restart without re-assigning or reclaiming. It
> is reclaimed to HLOS only once, at remove or on a probe error, and if
> that reclaim fails it is leaked rather than returned to the page
> allocator.
> 
> Each rx_skbs[] slot is pre-assigned its virtual and DMA address from
> the block, so no per-buffer mapping is needed at power-on. Because the
> coherent block is not page-backed, received payload is copied into a
> regular netdev skb before handoff to the network stack; this is an
> unavoidable extra copy on the XPU-enforced RX path.
> 
> Platforms without match data are unaffected: rx_virt stays NULL, no
> coherent memory is allocated, and the per-buffer dma_map_single() path
> is unchanged.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

So how do you handle TX buffers? Right now, they are just passed on from
the net subsystem. There can be up to 32 TX buffers in progress as well.

Overall, I have mixed feelings about this patch. It looks reasonably
simple, but fundamentally I don't understand why we need to go back to
the old days of implementing protection using a highly limited MPU (in
your case: the xPU).

Why does the setup of BAM-DMUX differ e.g. from the setup for the crypto
engine? Crypto is also using bam-dma, but it avoids this inflexibility
by making use of the &apps_smmu. Is BAM-DMUX not covered by the SMMU? Or
did you just decide to bypass the SMMU in this case? (If so: Why?)

If you had BAM-DMUX mapped using the SMMU you would get all of this for
free. No changes would be needed in the BAM-DMUX driver ...

Thanks,
Stephan
