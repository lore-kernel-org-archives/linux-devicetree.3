Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0C43F4CF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567906; cv=none; b=ZE7iged5STQuIRs6PBsMJ8gXec5KDhesSCNkwIfdA8FxkQpqBMlTOE6pCOF9QOAotyk3ngO0PXQBPI9l2U7o4QPmMMa0BVp9q6mQZpHhj8ETEL+LcZqikvGKYhgcfWNlgnzJi16aMIqmlGpDPGEmIAGVcxBCT+eSs0kOM2WU/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567906; c=relaxed/simple;
	bh=KCiWeZMCVQHz9+L0MkEAU7l+q/ZTA95e4/z6kf4ZmDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSuHnSeNWexAmgcjkZterivc3UAK0Du39W5PkNLY/owjEq49onCB7I7UKcvVSg2pv9pQt/QZIXrAW89hUOVjPqhfgCIl6ENYOwSxBlrkiKinlvN4jDA/CkSqWcct/kdJ32h3bCeue1+7dD3x7KVgGw3MWZvgK1hsWOtnpwNHcIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CIMf+57j; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CIMf+57j"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf50c6f235so22312665ad.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784567902; x=1785172702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Q6qaymMxE4tv3VtQfGq2oAUhCdPkdtjt2bRUPawSKM=;
        b=CIMf+57jwVIc662ScoxA2teVCIqQS90Uvgf01cMU5imufJTnbS2AuvG7EMYCr/uVS1
         eSFPLPN1bgANnZ0uCskD4GfBF1MKklf2Th0jZDkVVph6J8suJW0ux1SF7IpFtt4yZqJS
         mIHN9e9Md4UWiJt6umzSi1FyVwZut57tlBq/dp8OQNSwTSyX11BNLYeaBvt+p0lhBQjI
         qsoNKiTwPnkErZx/n6XdCVZEHMCZ/emPekC4DaSxzeOtxk8s5cL+nncm/vY3s28rR3i8
         ZgZcbt5IbwrDYpBckoI54cDIzIzDrhMTvIzKR1NwPGH0nvwrWdJxA5bBN9qAcvIikRgH
         fkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567902; x=1785172702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Q6qaymMxE4tv3VtQfGq2oAUhCdPkdtjt2bRUPawSKM=;
        b=pk92w1L+rEoGB7Zj4o2u2cvqIZwmiQjdQvbFncXK7OzwI9e4sumQhUETiU8fjaKBnk
         3h1NYEMupCS/gfQm+WKNY4PP86L5STbFudurH0oDXo0QcM5J07rN7qqgqM/Sk7Q//ADd
         pE4f/Ws8UFFoYJRUgtHylkaMdpsl+334Yk+VVtne2TO0rnIK1iSOX/6UB9YU07qCwvPu
         H+o4QksC56YM+RqFmIiUwoBwxTIeYTdXgaUlQroTGan2jg4IDWRT7Fa2gpVdHH/0k+Oa
         po7z9Ljd/hoh+CCtT1qX3BevaKz/lMsOgKdZ1Kemmf3rQNEAHlh9UY502Bh9YqiYXgup
         qfaw==
X-Forwarded-Encrypted: i=1; AHgh+RpdK0bn2jNyPWs25MQ4JJsN9MEcF9LaWIx9jYXYgzruz6BCO+ZB6KWGdlB5EKjV7KXkABL2IJkRmh/j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv4eZuNmUZTHD/8VDvlrfY/yI+0al2RvTor61I/8xiwU3qVIuh
	UZkgi5oS6fuQIUI3NRR27B7xy8HDLyz0jxfGUiAgcS4SEWKbWxq+cs7cZ9+1zmq0RfA=
X-Gm-Gg: AR+sD11VCcY2jQ8zERG/bJ5rJ/Sw8Spya8EPedhbOIFes9a0xH6NpO78SiIy/YtwPto
	nnlYp3NPNLTIZHxCCUhh20ehzyByzEXbFrYf1dCIuwfVCoFQYvDkgF1Y+1ELLkag/lM4or6pMng
	Km3hoD0qjleyDkiplAT80xxRUm7bZXrm3FGQvdo4d0a4TYw5hkVRpsC/39q7FvGBOLUf3xSkTFe
	o+gipwwX4Oh4E6uCJdWk/xlb4TTV4//VRhp3oeegaDN+JFow0CEQT7hojpTbSk8mIT6FFfFYe9b
	sB30+GwJ2RVES6rieCOBO504p7ftE2zEMckHyDKwzeS4fSBbw9UvGMNSD5dvS6BRv1P7fhHR15S
	POoG6Gi7bokxfstHw6h6JZhoegdlqXsFUNCR2TF5vTfc9WeuL4jLDREGgGWCxCCXak1xWIfH/MY
	xMVuXM6Cqvd6pBZx8=
X-Received: by 2002:a17:902:ccc8:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2cf34821f9fmr166312275ad.4.1784567902181;
        Mon, 20 Jul 2026 10:18:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:966a:e23:19e7:951a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34769bd6sm60858425ad.74.2026.07.20.10.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:18:21 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:18:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tanmay Shah <tanmay.shah@amd.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v6 0/2] remoteproc: add AMD MicroBlaze/V BRAM-based
 remote processor driver
Message-ID: <al5YW9bWep4NKeDl@p14s>
References: <20260714202441.554065-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714202441.554065-1-ben.levinsky@amd.com>

On Tue, Jul 14, 2026 at 01:24:39PM -0700, Ben Levinsky wrote:
> Add a MicroBlaze/V BRAM-based remoteproc driver and corresponding binding
> for AMD soft processors located in programmable logic.
> 
> The series models a soft-core processor subsystem that executes firmware
> from dual-port BRAM. The BRAM window is described in the processor-local
> address space and translated to the Linux-visible system physical address
> through the parent bus ranges property.
> 
> This series depends on the remoteproc cleanup series available here:
> 
>   https://lore.kernel.org/linux-remoteproc/ah2aVdlsLqy9aeHP@p14s/
> 
> That series adds the common WC ioremap carveout callbacks and optional
> ELF resource-table helper used by patch 2.
> 
> v6:
>   Patch 1, dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based
>   rproc
> 
>   - Corrected Krzysztof Kozlowski's Reviewed-by trailer to match the tag
>     provided during the v3 review.
> 
>   Patch 2, remoteproc: add AMD MicroBlaze/V BRAM-based remote processor
>   driver
> 
>   - Renamed the driver source and object from amd_bram_rproc to
>     amd_mbv_bram_rproc.

Applied.

Thanks,
Mathieu

> 
> v5:
>   Patch 1, dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based
>   rproc
> 
>   - Updated the binding title and patch wording to use MicroBlaze/V.
>   - Added Reviewed-by from Krzysztof Kozlowski.
> 
>   Patch 2, remoteproc: add AMD MicroBlaze/V BRAM-based remote processor
>   driver
> 
>   - Renamed the Kconfig symbol to AMD_MBV_BRAM_REMOTEPROC.
>   - Updated the Kconfig prompt to use MicroBlaze/V.
>   - Removed the reset GPIO and clock sentence from the Kconfig help text.
>   - Updated the driver and module descriptions to use MicroBlaze/V.
> 
> v4:
>   Patch 1, dt-bindings: remoteproc: document AMD BRAM-based rproc
> 
>   - Sorted the SoC-specific compatible enum by name.
> 
>   Patch 2, remoteproc: add AMD BRAM-based remote processor driver
> 
>   - Dropped the driver-specific MAINTAINERS entry.
>   - Trimmed the Kconfig help text.
>   - Reused the common WC ioremap/iounmap carveout callbacks.
>   - Reused the common optional ELF resource-table helper.
>   - Used resource_size(&res) for the translated memory window size.
>   - Kept the coredump segment address as the processor-local device
>     address. The coredump path resolves segment addresses through
>     rproc_da_to_va() against the registered carveout device address, while
>     res.start is the Linux-visible system physical address after DT
>     translation and may differ from the processor-local BRAM address.
> 
> v3:
>   This version updates the binding to use SoC-specific compatibles with
>   the fallback form discussed on the thread.
> 
>   Patch 1, dt-bindings: remoteproc: document AMD BRAM-based rproc
> 
>   - Reworked the compatible schema to use SoC-specific compatibles.
>   - Added amd,versal2-bram-rproc to the supported compatible list.
>   - Used xlnx,zynqmp-bram-rproc as the fallback compatible.
>   - Updated the example to match the new compatible scheme.
> 
>   Patch 2, remoteproc: add AMD BRAM-based remote processor driver
> 
>   - Updated the driver OF match table to bind via the
>     xlnx,zynqmp-bram-rproc fallback compatible.
> 
> v2:
>   This version pivots the series away from a MicroBlaze-specific binding
>   and driver shape and instead models a BRAM-based soft-core processor
>   subsystem more generally.
> 
>   This follows the upstream feedback that amd,microblaze was too tied to
>   the processor architecture while also being too generic as a DT
>   compatible for the hardware interface being described.
> 
>   Patch 1, dt-bindings: remoteproc: document AMD BRAM-based rproc
> 
>   - Renamed the binding away from amd,microblaze and reframed it around a
>     BRAM-based soft-core processor subsystem.
>   - Dropped the redundant trailing "binding" wording from the patch
>     subject.
>   - Rewrote the binding text to describe the hardware rather than the Linux
>     remoteproc framework.
>   - Reworked the example to address the original dt_binding_check
>     complaints about the root node and simple-pm-bus example shape.
>   - Added a clocks property for the soft-core subsystem.
> 
>   Patch 2, remoteproc: add AMD BRAM-based remote processor driver
> 
>   - Renamed the driver away from the MicroBlaze-specific name to match the
>     BRAM-based binding.
>   - Added clock handling for the soft-core subsystem and the matching
>     COMMON_CLK dependency in Kconfig.
>   - Cleaned up the reset comments and removed the success dev_dbg() message
>     called out in review.
> 
> Ben Levinsky (2):
>   dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based rproc
>   remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver
> 
>  .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 +++++++++
>  drivers/remoteproc/Kconfig                    |   9 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/amd_mbv_bram_rproc.c       | 213 ++++++++++++++++++
>  4 files changed, 328 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>  create mode 100644 drivers/remoteproc/amd_mbv_bram_rproc.c
> 
> -- 
> 2.34.1
