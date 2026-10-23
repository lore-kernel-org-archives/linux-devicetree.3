Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746673;
	b=3GZPtf2/MwAa/ePBeOezyvzzrqSYpK1vz+ntBdplDUm4o4v1/yDDXlbvSo0KuW04qw/I
	 D57t9tGn9kmfBbYOz31ZYwUXQUMsBJSD+5YqNL6EyjYxVsfsOalk9AHcANuHvV+z+FGVO
	 htPyWa0ZvXF5dDZ8LgiExLNB1zOtGU/LiFWfQeL1319QP0R3ds3vxe8WbpfK8aUHF1C1D
	 GMiSTbA2f8UaHCLuSp/GQC/k8S7ucTeEFxGQcfBtaNM3KYM3fyakQWxZ8YqQaM3lvgZvB
	 jIk1mLYcCH+F6I2seZtKY9MLl8fE3ZdPBDqtRpjQMDtjyvcK1VRnTi6RQV5WkTAY9zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746673;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=y1DpBpNP2E9EKulx/a7BEJDWub7VXoF4Z5h5Ip5x/Xc=;
	b=vLXXjK31jdPSGE9S43BhNCVmEWoBqrjcBHSTLFKIWRxrMyzLtuQw+ST9nAcC8WvVdPX2
	 IfSTpNTuM+d6riqExigU1cR9xGBQXdaVu1QzwZJKPVe8xajIp/KmdWWg3P5pQ/GGc/Php
	 8s4az8UkpoKnwUWRezjDqhLohaw05tCiADjKY+cI4DX8IXFNPMPFa2y5nlVhLwpu84nYH
	 mj1PpgxRCZFSuOKXk9Pidhn5lB7HsUzinQNqQjU2eI2hgSigobLmkPbFGIxIVNn29Y49S
	 +VFIlfV2scHEId1P92Af0f3j+AiMcXMIr5+09BiurHvUC6BdM944/6muIqhbYX9KTcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ipBrf09a;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F4606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D7F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ipBrf09a
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261023091110euoutp02d835c66cd6a2b4674719de70f5cc2822~hHZkw0zvT2644626446euoutp02-
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:11:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261023091110euoutp02d835c66cd6a2b4674719de70f5cc2822~hHZkw0zvT2644626446euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792746670;
	bh=y1DpBpNP2E9EKulx/a7BEJDWub7VXoF4Z5h5Ip5x/Xc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ipBrf09aFyhJXVYW9/hXr50G/QMuph7wXeTclCzjyiym+lrcwuGqE74D7Z6YMQ1cO
	 i4KYy9Hoyuc3IlhVwSBIJ5Bng56zvHgQWyZFWVhAIBj9YjAX767wfBvJkxSMvy+fKQ
	 s7nPLkioC+YMc8REU/Q/lExUCIJ+fE1MTDjR4lMo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261023091110eucas1p2952cb3709bad99676c7272cb494892c0~hHZkXHS_R1676516765eucas1p2M;
	Fri, 23 Oct 2026 09:11:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261023091109eusmtip16c2cf8eef913a9cbe157bb7d427b5010~hHZjnnLda1391313913eusmtip1m;
	Fri, 23 Oct 2026 09:11:09 +0000 (GMT)
Message-ID: <0e452521-582c-447c-ae75-ceb9f66f9ff5@samsung.com>
Date: Fri, 23 Oct 2026 11:11:08 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
To: Wandun <chenwandun1@gmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, Saravana
	Kannan <saravanak@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Andrew Morton
	<akpm@linux-foundation.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <809fddf5-c4aa-4a78-acbe-c9c39da2d363@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261023091110eucas1p2952cb3709bad99676c7272cb494892c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c
X-EPHeader: CA
X-CMS-RootMailID: 20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c
References: <CGME20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c@eucas1p2.samsung.com>
	<20261015082315.56876-1-m.szyprowski@samsung.com>
	<20261021134138.GC3667411-robh@kernel.org>
	<e42637d0-c800-48fe-b943-4ec6ac540d82@samsung.com>
	<809fddf5-c4aa-4a78-acbe-c9c39da2d363@gmail.com>

On 23.10.2026 03:46, Wandun wrote:
> On 10/22/26 17:59, Marek Szyprowski wrote:
>> On 21.10.2026 15:41, Rob Herring wrote:
>>> On Thu, Oct 15, 2026 at 10:23:10AM +0200, Marek Szyprowski wrote:
>>>> Mike Rapoport suggested [1] how to properly use dynamically allocated
>>>> arrays during early boot.
>>>>
>>>> Use this approach for reserved_mem array during early scan of the
>>>> reserved regions. Having all the reserved regions in a single array
>>>> removes the need of the two pass initialization introduced by commit
>>>> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
>>>> regions are processed"), so implement it to make the code simpler,
>>>> easier to understand and ready for adding proper error checking.
>>>>
>>>> Tested on ARM32, ARM64 and RiscV64 based boards. Arch specific issues
>>>> with early mappings were discovered by LLM.
>>>>
>>>> [1] https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>>>>
>>>>
>>>> Best regards
>>>> Marek Szyprowski, PhD
>>>> Samsung R&D Institute Poland
>>>>
>>>>
>>>> Changelog:
>>>>
>>>> v3:
>>>> - allocate the reserved_mem array only after all static regions are
>>>>   reserved or marked as no-map, so it cannot be placed inside any of
>>>>   them
>>>> - record failures of the early static reservations and print a single
>>>>   message asking to fix the device-tree
>>>> - restore conditional compilation of the early mapping code, because
>>>>   some architectures lack support for it (C-SKY & Sparc64 as reported
>>>>   by kbuild robot)
>>>> - allocate the array bottom-up, to avoid allocating from highmem, what
>>>>   might be an issue on Xtensa, C-SKY and MIPS32
>>>> - don't use the early mapping on PPC64, where the scan is done before
>>>>   early_ioremap_setup()
>>>>
>>>> v2: https://lore.kernel.org/all/20261008152403.766439-1-m.szyprowski@samsung.com/
>>>> - removed superfluous ifdefs
>>>>
>>>> v1: https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/
>>>> - initial version
>>>>
>>>>
>>>> Patch summary:
>>>>
>>>> Marek Szyprowski (2):
>>>>   of: reserved_mem: group allocation helpers together
>>>>   of: reserved_mem: allocate and map the reserved_mem array early
>>> Can you confirm the sashiko issues are not issues?
>>
>> I've replied sashiko review. That are again the preexisting issues initially
>> targeted by Wandun's patchset:
>>
>> https://lore.kernel.org/all/20260920092852.614973-1-chenwandun1@gmail.com/
> Hi Marek, Rob,
>
> Since this restructuring and my series touch the same code paths, my
> plan is to rebase my series on top of this series once it lands, and
> send a v4 then. Is that OK?

I think that this will be the best plan.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

