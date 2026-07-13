Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4363396EE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914055; cv=none; b=r4YNieQ6VAp9wYuxz1LEntiXmt1qrk0g2H80Q54Vlp4mnPoioiy3Yhg7EHmGksTY0F2mDbml5OHSfmAdvOFzp3R+7bdqMGHXjzpkltXepmDKdLBn5Qaza1KxL3eKTYdRguIl9LjpVuu87I4MnKO1Pf2gWsWR7bqkwqXiuE3J71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914055; c=relaxed/simple;
	bh=5h8jQL3TdcDQN5OyfaTjXVOYLwfig02OQQ0EFcveYAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lALhTG4TJ5UbXkFBduKiDz7WKWm0sm3bldPfrcuY94acpJBvlHijDAhnjHvJeGXVrQYQob+N+d8Y5vb3hDZUofvMLZ86+5RtUf9m8wEXDdpu6Whw/NqoADqQ/UaSXzLds1iBn9HWGG/Qwxkf4MKuBP+e4NmKywFXZBN9oKPbkUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=gkUXyAm5; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="gkUXyAm5"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80e24970f1dso18590757b3.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 20:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783914052; x=1784518852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DD337bllPU0qOfiBQScd86xJr2rrEeEQWd3DGNprvhw=;
        b=gkUXyAm5E5CZVFNODwx4uGf6Xix1pEX0F5qP+5D9kGOIfyzJrxugvnWtI5v4ZUfC93
         IsJWan3OyFwKrmUvC7IV3AXeoPP9vgMeEW1EU5QpVuX7z86RMRLJXLMk56WVG9VoVBL6
         QGL0n/ziG4uOP5MGKCXvNokqhtL+zeu/PmZ9OB4wGCO9JLDVW8pO6ZoDRvS6LoVqa3rs
         FQG5rpucSwESFexDcIHJ8BDiStnvtsjJHkw9tbBENcksFymqmGw6zRTd/GXiNtLNWdqj
         dR8yPcqbElvsUezup4k4uwuNJae14aLFzZerY67MymbsY0mot92cH2N1D4z3Ng3mOK0s
         FshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783914052; x=1784518852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD337bllPU0qOfiBQScd86xJr2rrEeEQWd3DGNprvhw=;
        b=rK++jWoaURcxd+Eb5h+KVkxXleA5947iSxhJmYHE4Ugy+60yfuadHCB6/1Jx1vjQZQ
         1sjvc/taSR5BbxAGXChRxazPr2Oe7rY/uRSIelh/AIzsuieGZkzIc/MDF3smW+SaemD4
         xmZtOi9qLLElKZ6Jk2+3OoZ4TML98Gnt8PX+z+VIMmyqHpGRHITfk8QIAMMqcCj+T7mv
         44ap7s4Yrl7hd+rqQJDfxCNkVv/YdzrmQYl+sM9viFFL0E211RgKt+0tx1nuQxTt2NVl
         V2twm8IW3b05CztlbQKS0CHhqZKYGdz6rOCx9tD2h8FUYht50DvfIcGAaKHNmhcXJyAg
         /M0w==
X-Forwarded-Encrypted: i=1; AHgh+RriioLJVvW6hiiBFLRJT/wrRXkvllI+DdY0ttP8GC0LdM4DS7/4StVHZpVWeR7P753hKszMcb7/6awG@vger.kernel.org
X-Gm-Message-State: AOJu0Yze1QWbuiIp5tl8KQXOpn/5lY9vafyCXdbzzAlVeOevcpCXzNTi
	G0xwHNqeSRgLABITcMXEr0gHj3Yz/gCWyddJnuYLfev+gCje5/qTwL1DXFru+aN89sM=
X-Gm-Gg: AfdE7cmZZ7yxjp9ywbsGdIAew32foAYeCXjWFE2urjXtFXfdO8ObtDV4r6U4IWA9aY/
	UX2Bnv2gthTQL4DetmpOZRpYjI8Itwu7yKJ4pF3e1tJzh4tTkxa/41WnyHpaFW2DYtrm/IM2llf
	dmQYLb+WelJgGQ3L1JtFDThxNWTJ5nyRzIzxuLKK8XuARMxeA5WHlMwGWicVz/Npwi4gom7vkAO
	/Q813MWUBEdTC74WmltiKybBIDfySF/AgtLjFwHIgtmGQj1jyL70fuDLALs77LETClGXB3gaoVl
	mOKECgU3878NNswrf7APYs+qtlMFZw+Jh6NBP0XlugnwFYzNk8EAoa6k8dsdvG3gDyp9qhlhA7E
	Xn85ArKAplnnrwuHq0szCmZQc/U3P7KSolMFcT4VOpZ8Ma/NMCMua3t345fpYYiFOZ56lQYl0gY
	QJgrqZLi5jUk4h25vvIi7unmSvNAqHU3+GwYjDwzxW8mOFxjssy24xDSMHcA==
X-Received: by 2002:a05:690c:6981:b0:80e:2917:4b01 with SMTP id 00721157ae682-81e9003e955mr55511657b3.27.1783914052406;
        Sun, 12 Jul 2026 20:40:52 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:55c1:a162:6cca:b98a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm104348967b3.49.2026.07.12.20.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 20:40:52 -0700 (PDT)
Date: Sun, 12 Jul 2026 22:40:22 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>

Hi Yixun,

On Thu, Jul 02, 2026 at 02:31:34AM +0000, Yixun Lan wrote:
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> 
> Please note, in order to test this driver, the UFS clock driver[2] here
> should be applied first as a prerequisite patch.
> 
> One known issue is that the device will occasionally raise BKOPS interrupt
> when doing some high load test, log from dmesg shows
> 
> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1
> 
> Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
> Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org/ [2]
> Signed-off-by: Yixun Lan <dlan@kernel.org>

I see this during probe on a k3-pico-itx. Does the UFS chip on board
have an RPMB block on it? Is this error of any concern.

[    5.957864] ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BOOT WLUN not found
[    5.963319] bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus 'ufs_rpmb'
[    5.971155] ufshcd-spacemit c0e00000.ufshc: Failed to register UFS RPMB device 0

Regards
Anirudh Srinivasan

> ---
> Yixun Lan (3):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>       riscv: dts: spacemit: k3: Add UFS support
> 
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  54 ++
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   4 +
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  13 +
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 931 +++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  90 ++
>  8 files changed, 1109 insertions(+)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260605-08-k3-ufs-support-c8b308e415e2
> 
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
> 
