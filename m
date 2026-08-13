Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBF47606E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624844; cv=none; b=c5Qfb2NkSYho3uU5//80elBRlkxEuUAjEvTn43dMeKzdtX9dvg2NwRzYjwPVfP0kNXhhTMRN0rRFAOYPOLKL+wE+LCIMjLT/boUFpzXCB1hgixwXkzCIUvslzDBYx9y2msQOAcUuch/ccvJGG5W32P6arC04eV42JHt+D+50IGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624844; c=relaxed/simple;
	bh=WYwkX1yh0Pta1wRluTjZ/jH/1tys5sS0UlkmPOp1EPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYwW4psZhqROrCRSv1Xy8jc8wTeZgLYZCqhChottzWbLCyn9BnG3u8BmEAHApXeIbKpdkEuoWkq72JuVlMsbWJNlUjnZs7K7THbNuOlsWBz2Ki3NYyEwBvgTacTWZUCpsbIKn2sAHKEy5VC5EizAemQhSD12ibgdGjFOXjbw0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pzf8go5x; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pzf8go5x"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so7898085e9.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786624841; x=1787229641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VJPCpNnotx0ECpUt+MKP1Xchlx2xXWGrMhf2UEWt9n0=;
        b=Pzf8go5xmCnqTVPBvSA1zSC+H6VD7PQdkhX0FU3lLPEStYw3qmZ7+zwju2ag1FzZR6
         96qq144ifJzdovPioTgA4IdNM/dYk35bU/CEiJs2enSdwYyGyxGh4RBgAXqHff9iVybU
         HdhSDID2rtQlUGJee4XMdyHCSDOrJTBAyDdVoxDWvGaEGlZPj3wc8rnUDkonOfrRMhMc
         plkxg4rNAopcy1h0KBGG2Y6H/Z4qG8GDBwMRfVFchTqxvlD3Dofv12CKu1s+jO4nFSXO
         tkU8lkClPyJ6TyFrX93aSQvYxnxMPBWeIKqza/FbaN0bDlUy6QIY1amV4R6tB7YH+WzN
         2Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786624841; x=1787229641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJPCpNnotx0ECpUt+MKP1Xchlx2xXWGrMhf2UEWt9n0=;
        b=i9qIf/5pRbR3fKbkVgw7JInWDUSSk3AzWIkWxDEmgjTOOVjTVSZQ68NK/atGtpVg83
         riC8z+ZUKydIRMAglTCz7U8sC7Q968f0Y4jFdcnz/mh6sbHNzAFEpsdLsYPfC4KLQZJX
         jb4SSQqp89IyMToWNqY47ifxvRGyUc3fHayFo8sz5WP/IFYHbTjN9Yh2HXxTOSSFu1ya
         PJ7MKSjmOG1RlAOJU6iGQg4NnkPFEM2utbLP1v3ympeDzywqDCeZHH3vasB4iGYZrlRY
         SBmMaTFOsuUqxMiCb2kiFVEdeUbaE1ydPUFYM7A+l99ihigi+bx2Uayfz1QU00W7YbMl
         Rr8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpdqba1IMna6pASHK9BAz8tQHlInTZy8qH7jJ7xanEd/jKkzVBjy1h+PSF0qwj2TaBAPne+lVbah6pn@vger.kernel.org
X-Gm-Message-State: AOJu0YwggfAZ4lZQRr5cTnWW22mTkhbcrQSO5mkLi/U+KlxW5dUiGKEq
	aSeEn40U9a604lQ5+c2HJkw1uKhLIFGQW5yeQiCOLoxpa30Z0kvvnJMNyeRAI/WrncA=
X-Gm-Gg: AR+sD12bJ0Hyjl+yQKg3hSjpV4A9q9dPqq3ZEVTcVag/1V+Yerm1g8c8YsZgaO2Ctn2
	EGMX+imRvu34JYoQ8spGkAvvUKS81epRfsiY4w+WsYlvukiLA38HWBtveT/W4ljkBWAcDSVykO9
	UOYZMPxT0FmaUtMW+eeFPggDdZJl4vQGN62CgSWrp0f7iejGFRiWpvpwlF8g801ZuLHMOxRTFhO
	rkkMmUwTZ5kUbBCugCZhthbuVrn+XPnGm4BzndGtk+l/zXE+LLAx7nfAQH0KLxEieXOSp/Le0O0
	KHW+P9T1daAOD31kayI6dXR1+8pm7Aa/SPM5RJ7W9hfFbg/F1QHahzlhLqBCxq+N+X5/rZ21r40
	Ps0qBfAhJNobAtlve16QSJbu5kp4oImyO9OQXlrEbstzmoc6Hbwty0fXeZ30jpHmoT7Vp8yctby
	F6WAwjsIEPIB+XOW6ZZy7BMxIz+dSUpwjxFt1Ifwi4mAUU04BHfAeG9upkFFZMGcd9qpnTpXQq
X-Received: by 2002:a05:600d:6409:10b0:499:84fc:4548 with SMTP id 5b1f17b1804b1-49984fc45c0mr21387325e9.5.1786624840981;
        Thu, 13 Aug 2026 05:40:40 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:4e0e:b1ef:ec35:a41b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49982121658sm65870555e9.3.2026.08.13.05.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 05:40:40 -0700 (PDT)
Date: Thu, 13 Aug 2026 14:40:29 +0200
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
Message-ID: <an27PVxkCpD09xSR@linaro.org>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
 <alXm0rp3NK62G3-3@linaro.org>
 <c8417ff3-db92-446a-acf8-8c73c83b85de@oss.qualcomm.com>
 <amMxkrW3mu48HIOr@linaro.org>
 <63bae39b-1256-4e19-a9de-840d8752ec69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63bae39b-1256-4e19-a9de-840d8752ec69@oss.qualcomm.com>

On Thu, Aug 13, 2026 at 02:35:01PM +0530, Vishnu Santhosh wrote:
> On 24-07-2026 03:04 pm, Stephan Gerhold wrote:
> > On Fri, Jul 24, 2026 at 10:16:31AM +0530, Vishnu Santhosh wrote:
> > > On 14-07-2026 01:05 pm, Stephan Gerhold wrote:
> > > > On Tue, Jul 14, 2026 at 11:02:32AM +0530, Vishnu Santhosh wrote:
> > > > > On Qualcomm SoCs where the modem (e.g. the mDSP on Shikra, VMID 43 /
> > > > > NAV) is the AXI master for BAM-DMUX RX transfers and the XPU enforces
> > > > > per-region access control, each individually DMA-mapped RX buffer
> > > > > requires its own XPU resource group (RG). With ~16 RGs available, the
> > > > > 32 per-buffer dma_map_single() calls exhaust the table and the first
> > > > > inbound transfer faults with an XPU violation.
> > > > > 
> > > > > BAM-DMUX is a singleton (exactly one instance per SoC), so the
> > > > > destination VMID does not need to be a DT property; it is looked up
> > > > > from the compatible string's match data instead. Add struct
> > > > > bam_dmux_data with a single vmid field, and a shikra_data instance
> > > > > hardcoding QCOM_SCM_VMID_NAV for qcom,shikra-bam-dmux.
> > > > > 
> > > > > When match data is present, allocate all BAM_DMUX_NUM_SKB RX buffers as
> > > > > a single contiguous dma_alloc_coherent() block and SCM-assign that
> > > > > block to HLOS plus the VMID once at probe. This reduces RG consumption
> > > > > from 32 to 1. The block is never reclaimed across a modem power cycle
> > > > > (bam_dmux_power_off() does not touch it), so the probe-time assignment
> > > > > covers every subsequent restart without re-assigning or reclaiming. It
> > > > > is reclaimed to HLOS only once, at remove or on a probe error, and if
> > > > > that reclaim fails it is leaked rather than returned to the page
> > > > > allocator.
> > > > > 
> > > > > Each rx_skbs[] slot is pre-assigned its virtual and DMA address from
> > > > > the block, so no per-buffer mapping is needed at power-on. Because the
> > > > > coherent block is not page-backed, received payload is copied into a
> > > > > regular netdev skb before handoff to the network stack; this is an
> > > > > unavoidable extra copy on the XPU-enforced RX path.
> > > > > 
> > > > > Platforms without match data are unaffected: rx_virt stays NULL, no
> > > > > coherent memory is allocated, and the per-buffer dma_map_single() path
> > > > > is unchanged.
> > > > > 
> > > > > Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > > > > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > > > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > > > So how do you handle TX buffers? Right now, they are just passed on from
> > > > the net subsystem. There can be up to 32 TX buffers in progress as well.
> > > > 
> > > > Overall, I have mixed feelings about this patch. It looks reasonably
> > > > simple, but fundamentally I don't understand why we need to go back to
> > > > the old days of implementing protection using a highly limited MPU (in
> > > > your case: the xPU).
> > > > 
> > > > Why does the setup of BAM-DMUX differ e.g. from the setup for the crypto
> > > > engine? Crypto is also using bam-dma, but it avoids this inflexibility
> > > > by making use of the &apps_smmu. Is BAM-DMUX not covered by the SMMU? Or
> > > > did you just decide to bypass the SMMU in this case? (If so: Why?)
> > > I checked with secure systems team on this. Crypto BAM is
> > > behind apps_smmu, so protection is enforced through the SMMU's Stage-2
> > > page tables.
> > > 
> > > A2 BAM (used by BAM-DMUX) is present in secure domain and does not
> > > support Stage-2 translation on this SoC, and there is no IOMMU domain
> > > that can be attached to it. The only protection mechanism available is
> > > the xPU.
> > > 
> >
> > Thanks for investigating this!
> > 
> > So is this a hardware limitation or something you could change with a
> > firmware update? Could you move the A2 BAM out of the secure domain and
> > protect it via the IOMMU instead of the xPU mechanism? The other modern
> > platforms with IPA do not have this limitation, they can use the IOMMU
> > for this.
> > 
> > We can try to support the xPU protection mechanism in the BAM-DMUX
> > driver, but it's pretty bad from a performance and memory usage point of
> > view if you need to copy buffers around multiple times. So if you have
> > some way to change this in the firmware (and there is still time to do
> > so before production boards ship), I would strongly recommend to
> > investigate that.
> > 
> 
> Based on what we confirmed with the Secure Systems team, this is a limitation
> of the current Shikra platform rather than something that can be addressed
> through a firmware-only update.
> 
> The A2 BAM used by BAM-DMUX is not connected to an SMMU/IOMMU domain on Shikra,
> which means Stage-2 translation is not available for this path. As a result,
> it is not possible to move this path behind an IOMMU.
> 
> Modern IPA-based platforms differ because their data paths are physically routed
> through SMMU interfaces and therefore do not rely on VMID/xPU ownership assignment
> for this type of access control. On Shikra, the A2 BAM path is protected using the
> xPU3 VM-based access-control model, where DDR memory access is restricted and
> granted through the request-based Hypervisor VM assignment framework. In contrast,
> older targets relied on the earlier xPU2 resource-sharing model, in which modem
> access did not require this type of explicit VM ownership configuration. This
> architectural difference explains why the issue does not occur on those older platforms.
> 
> So, for this path on Shikra, SCM-driven VMID assignment remains the only practical solution.
> 

Ok, thanks for looking into this further.

Can you please try the following as alternative for the implementation?

1. Make sure that you have CONFIG_DMA_RESTRICTED_POOL=y.
2. Define a restricted DMA pool for BAM-DMUX, e.g.:

&{/reserved-memory} {
        bam_dmux_pool: restricted-dma-pool {
	    compatible = "restricted-dma-pool";
            size = <0x40000>;	/* 32*2K*2 = 128K minimum, but 256K might be safer */
	    alignment = <...>;	/* Check xPU alignment requirements */
        };
};

3. Assign to BAM-DMUX together with the qcom,vmid:

&bam_dmux {
	memory-region = <&bam_dmux_pool>;
	qcom,vmid = <QCOM_SCM_VMID_NAV>;
};

4. Extend qcom_bam_dmux.c to look up the DMA pool address and make it
   accessible using SCM: Call of_reserved_mem_lookup() to get the
   region, then invoke qcom_scm_assign_mem() with that.

5. Keep RX/TX DMA code paths in qcom_bam_dmux.c unchanged.

6. When testing, make sure the kernel log contains
   "Reserved memory: created restricted DMA pool at %pa, size %ld MiB"

7. Add memory-region and qcom,vmid as optional in dt-bindings.
   Add dependency: if qcom,vmid is specified, memory-region must be
   specified.

In a quick test (without the VMID stuff) this worked quite well for me,
SWIOTLB should handle the copying behind the scenes without further
changes to the qcom_bam_dmux driver.

I would prefer that over complicating the driver with two separate ways
of buffer management. AFAICT, the restricted DMA feature is meant for
this kind of setup where there is no IOMMU but the firmware can still
restrict memory accesses to a limited amount of regions, see
https://lwn.net/Articles/841916/ for a short introduction.

Thanks,
Stephan
