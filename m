Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721A5581FB
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 21:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925846; cv=none; b=ntaUdblML5GlQo0qlJztqmMsiTHfS5+57IJjUUhuId67Rtr2/YQMXeqEP8zGlDq+vzHjzPWCIzVqIj966ym+Nqg7r1epITPUlZ5ieROIxZPK93ncuS3fXDxt9Vt7B9ljt42MYa54comEv8eQ20ukvMBRa8Z4CD2i1nKC0D1UkFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925846; c=relaxed/simple;
	bh=JJ5ihVHUtrCqBcNZBqCy5OUsOcOFmIhQd6E5sFhpWaY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sB7Q1BKJtQZpfqzrxTRXFOu2FDPLeCh4kWcnl9yeatykHb/EZ3SsTKBfa4fcz5U0RTPhYkBw6PE199LkFQ4fi6lF14RXqV0fNrNgdjrrdRlQfAbQwmtZrdtCZfC3SLyXlxfOUb6d7rQHM5CmIIe7hj//TxgZ6wRrCCRNLXf1I2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=mTGn9LfQ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="mTGn9LfQ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e4f0d7d77so22343585a.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791925839; x=1792530639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lySPw8KqCGspyEFq5ePApVpNMTq8o1+rvzVI9wozpvM=;
        b=mTGn9LfQEOfL+sAUFv0CDljnnjczWmYpLpglLBZx6OoaUZ2VTkwJyLZN5E9L9LhmAK
         I/nB+9aEKPLd0erhP1ha/hggez8PMUZF0TXd244sBbnmajZ2J3Cmg83ZhSBjp6jWJsSt
         nKgE5ywx8IoTlLg7gAK2zyrR2Zn9c9I8YmV+m68pnCy6pjoDTwTU624FT/LSiCYIYKjB
         +8GFO1S+8EYaHdwAGtKyV/5HALb/QmkfdglY/kXPUoB7b7ZGhxsYOO3VPKuFSWQ6XQ2e
         jGD/QSmTWI9roqS60YZxyUAEaScZHIYLWVJgvIyZOYHNBlMGG9Cj6hS3fBIoSKfdEYCo
         r5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791925839; x=1792530639;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lySPw8KqCGspyEFq5ePApVpNMTq8o1+rvzVI9wozpvM=;
        b=QRl32sBHst0S8DF4WGmKX8uh6l56LrXlRFp9MOs3d8iHf0hjGnHRfX/IuSh1WkQLz7
         QwW+qwCWQ12JTv/Ee4Wf7KIDEDcQvABpzKCPNDN/JKotIbk0D8Tr5wEQr/D+sGyMVFeh
         kHg+tGtE1n5IxPdM2Maa50IT+c0teOp3TXZdg0t2wQeDnsyAguwUYcUCGXpAMAVlwrhr
         A3UySf8XnYawOOVjWjSnk7PFPZvJvaHDHFdJgzjWb4RXSsOOHRmebp3MXvCp56GrJRZS
         NdklSgByRaykQcJR6hjW9uV140NCI+KUfBNzoVoH4eOv/fo3cnBv0/xUbiUiO9o3R9Sm
         2ngA==
X-Forwarded-Encrypted: i=1; AKwUvByGB76QOjJlrB/GM09O78RB6n9KxMB2mCu1BSwdM4XJG1w52pB2OcAjsstkmyR27JTHrfXzKVCyaZ6p@vger.kernel.org
X-Gm-Message-State: AFq9FYLKzS6IxEdDOeuBGjQGMWknRuzv8Va0qYH8ej4i0zv9OsphaPVd
	MPvOBVtuRgXADhdxktZmowIjIF/2Z10k/vmeb0pubUJXk580qZD/oyS8ESOW3okNzoc=
X-Gm-Gg: AYBFou3ltQdxWF/qT9BRlpeLgAePLW5zp+jkv6uwj5lSblo16vkqIC+7435fWlbw3Dg
	WFmUKs08vAG3/U/abgmSgkULVtNa/qvV9+6syGBSB+xDwwQ7NS4KAIhWHq9GKo12/0zrgtnC6To
	LQPH3riXSMruFXqir4b6fPU4xBRjBNbmZBlduDt7QYQPLc2X4OsaLz6IGK6JKQ2eNy1dM8jnZ6D
	TmoVKrbQrg+nsJIwtLYE8V7/Wza0js/xvhbdH1jxAVEva/O5FQ3MrhIwTUTbUHHe21s8oAK/8rj
	9DkfIQ7e5wdDzebbA/Sp/0I5qqHpTo9Bzv0oIAk3WEL1s0WbXIcW7BnffGwwd6eFpluHaerLpC1
	y76qtf2DozrCNaHMNphYNtoXzqA2OdlNR/yteaLVT8afU+7e7yeoWBGexbXabEBTiFOn4g7Ih9s
	e+5z6W8XNuHJGABeHI97Sp7NSkaGW50byG6V2HMbNT2gtsAUlCmqdQWWIfZ3yqc9LjcdobVhE=
X-Received: by 2002:a05:620a:40d2:b0:93c:7861:675 with SMTP id af79cd13be357-93eb93ef2cdmr2175949885a.1.1791925839141;
        Tue, 13 Oct 2026 14:10:39 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4c2fasm34853766d6.49.2026.10.13.14.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 14:10:38 -0700 (PDT)
Message-ID: <61de51e5-4d8c-499b-89d3-37a7014a443f@riscstar.com>
Date: Tue, 13 Oct 2026 16:10:37 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] PCI: of: warn on bogus device_type property
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com, robh@kernel.org, saravanak@kernel.org
Cc: herve.codina@bootlin.com, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924150222.1179235-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20260924150222.1179235-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 10:02 AM, Alex Elder wrote:
> Add a check when adding a PCI device to ensure the device_type
> property is (or is not) correctly defined when the device has
> a non-null devicetree node pointer.
> 
> While working on a Qualcomm platform, I learned that some PCI
> endpoint nodes were defined with device_type = "pci" properties.
> Herve Codina pointed out that this was not correct.  Rob Herring
> indicated that people seem to have trouble getting the PCI
> devicetree nodes right, and asked whether we could warn if this
> particular problem occurred.  During review, Herve Codina also
> suggested that bridge nodes be checked to ensure they *do*
> have the proper device_type property, and later, Sashiko suggested
> that "pciex" (and "cardbus") also be accepted as valid bridge
> device_type property values.
> 
> The first patch prevents a possible null pointer dereference that
> Sashiko pointed out some time back.  This is the only patch that
> has changed in this version.  (Last time I neglected to enable the
> Kconfig option that ensured this go compiled, and it contained
> two obvious compile errors.)
> 
> The second and third patches are simple cleanups.  The last adds
> the new PCI devicetree node checks and warnings.
> 
> At this point we are waiting for (and requesting) an ack from
> Rob Herring on the last patch.

Rob, do you have any input on this series?  I created it
initially based on a suggestion from you.  It simply
warns in the PCI code if someone provides a device_type
property somewhere other than a bridge, as well as when
a bridge is defined *without* a device_type property.

Thanks.

					-Alex

> 
> 					-Alex
> 
> Between version 5 and version 6:
> - Simplified the patch header on the last patch, as suggested by
>    Bjorn
> - Rebased on v7.3-rc4; otherwise no code changes
> 
> Version 5 is available here:
>    https://lore.kernel.org/lkml/20260908213459.2519059-1-elder@riscstar.com/
> 
> Between version 4 and version 5:
> - Made a local variable (bufp) a pointer type in the first patch
> - Eliminated an unused local variable (i) in the first patch
> 
> Version 4 is available here:
>    https://lore.kernel.org/lkml/20260904134607.1856121-1-elder@riscstar.com/
> 
> Between version 3 and version 4:
> - Insert a first patch that fixes a Sashiko-reported issue
> - Drop the final "duplicate warning" patch from v3
> - Include "pciex" as a valid PCI bridge device_type property value
> - Add Herve's Reviewed-by tag on the last patch
> 
> Version 3 is available here:
>    https://lore.kernel.org/lkml/20260901011338.1323243-1-elder@riscstar.com/
> 
> Between version 2 and version 3:
> - Drop a patch that made a change only needed by a different series
> - Switch a function header to use kernel-doc format
> - Add a warning if a PCI bridge node has no device_type property
> - Added a patch to remove a duplicate warning in the devicetree code
> 
> Version 2 is available here:
>    https://lore.kernel.org/lkml/20260812172247.276554-1-elder@riscstar.com/
> 
> Between version 1 and version 2:
> - Check the PCI devicetree node even when PCI_DYNAMIC_OF_NODES is
>    not enabled
> 
> Version 1 is available here:
>    https://lore.kernel.org/lkml/20260807194100.455599-1-elder@riscstar.com/
> 
> Alex Elder (4):
>    PCI: of: avoid allocations in of_pci_prop_compatible()
>    PCI: of: drop the reg_num argument to of_pci_set_address()
>    PCI: of: don't zero flags in of_pci_get_addr_flags()
>    PCI: of: introduce of_pci_verify_node()
> 
>   drivers/pci/bus.c         |  1 +
>   drivers/pci/of.c          | 32 ++++++++++++++++++++++++++
>   drivers/pci/of_property.c | 47 ++++++++++++++++++++++-----------------
>   drivers/pci/pci.h         |  3 +++
>   4 files changed, 63 insertions(+), 20 deletions(-)
> 
> 
> base-commit: 93f51579e7df248780214094418f205253383cc5

