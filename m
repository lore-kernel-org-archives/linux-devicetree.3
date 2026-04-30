Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4439F164;
	Thu, 30 Apr 2026 03:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519613; cv=none; b=peOl0Qlk0Ycn4n47PjZpyQqUgUhUmOVzrEvW24ofDeQ9y0VCgO86W6+qu/eePu95Cyj+q2KOWWDYRpl/l0Fj5v7fxUDVKJFuKVOOWFx3xHyV2fk7kW5QYdE7zqjs2HocKydGQyr1t7mBHFaHy1AyJ4qI8JgF3+NJizYusahZC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519613; c=relaxed/simple;
	bh=1y/qx12Do8kjGRWa26585Z3zhVAR8s9S7MLftzRNkxc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AJDAs8AbQtRhJAYiQIOU0WBmAKyrKosxj5hzW+Gwwa+fBoSUTxMLYofyIyCCLW6wr4D3dntHcxNzbRo58PFPlyX4XBsh7mKxXYxipLMlmtPcNILUk8WFAe7KAKS2gn8layrHMuSfTaOJhcP36WDdRAQE90QEB5KVQFnmsQXIZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yxx8M2cZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yxx8M2cZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADBFC2BCB8;
	Thu, 30 Apr 2026 03:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519612;
	bh=1y/qx12Do8kjGRWa26585Z3zhVAR8s9S7MLftzRNkxc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Yxx8M2cZdErYh+yTRb4JYMX8n1xNToXdqoarYlzvZ+VJICM0/uJ3iKDXLNPcQGnRA
	 H8JIZj/nbbFvJXlTP9rWLNIO6QshmFfKvvU6zFT0LGw+HDcOhs2jTIA7HlayOm+BjJ
	 l8dQuieDdBsxH/orRnJnvut7oa8qxmGhcBxqkYKXiYlXBhlzr2TDj3n3VHNazWuaBZ
	 hEks0+SfUJmmVmm8mQuI5NIPiY9XYGr5RP3vTjFgNfu+nr8cJ5r2000NO381toN5VY
	 Duo2QjuhrvCx7cz7cRqnzsz5bSojfgxGn1cgcZYUy76sYJ9bjKOeYDGE6A+KGk2zK4
	 ipDtjb+awhKqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD4A3809A07;
	Thu, 30 Apr 2026 03:26:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/22] riscv: Memory type control for platforms with
 physical memory aliases
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751956779.2274119.16366589478749649607.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:07 +0000
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 devicetree@vger.kernel.org, surenb@google.com, linux-kernel@vger.kernel.org,
 rppt@kernel.org, mhocko@suse.com, conor@kernel.org,
 lorenzo.stoakes@oracle.com, krzk+dt@kernel.org, alex@ghiti.fr,
 kernel@esmil.dk, robh+dt@kernel.org, vbabka@suse.cz, Liam.Howlett@oracle.com,
 apw@canonical.com, dwaipayanray1@gmail.com, joe@perches.com,
 Julia.Lawall@inria.fr, lukas.bulwahn@gmail.com, nicolas.palix@imag.fr

Hello:

This series was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Wed, 12 Nov 2025 17:45:13 -0800 you wrote:
> On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
> DRAM is mapped to multiple physical address ranges, with each alias
> having a different set of statically-determined Physical Memory
> Attributes (PMAs), such as cacheability. Software can alter the PMAs for
> a page by selecting a PFN from the corresponding physical address range.
> On these platforms, this is the only way to allocate noncached memory
> for use with noncoherent DMA.
> 
> [...]

Here is the summary with links:
  - [v3,01/22] mm/ptdump: replace READ_ONCE() with standard page table accessors
    (no matching commit)
  - [v3,02/22] mm: replace READ_ONCE() with standard page table accessors
    (no matching commit)
  - [v3,03/22] mm/dirty: replace READ_ONCE() with pudp_get()
    (no matching commit)
  - [v3,04/22] perf/events: replace READ_ONCE() with standard page table accessors
    https://git.kernel.org/riscv/c/5a84b600050c
  - [v3,05/22] mm: Move the fallback definitions of pXXp_get()
    (no matching commit)
  - [v3,06/22] mm: Always use page table accessor functions
    (no matching commit)
  - [v3,07/22] checkpatch: Warn on page table access without accessors
    (no matching commit)
  - [v3,08/22] mm: Allow page table accessors to be non-idempotent
    (no matching commit)
  - [v3,09/22] riscv: hibernate: Replace open-coded pXXp_get()
    (no matching commit)
  - [v3,10/22] riscv: mm: Always use page table accessor functions
    (no matching commit)
  - [v3,11/22] riscv: mm: Simplify set_p4d() and set_pgd()
    (no matching commit)
  - [v3,12/22] riscv: mm: Deduplicate _PAGE_CHG_MASK definition
    (no matching commit)
  - [v3,13/22] riscv: ptdump: Only show N and MT bits when enabled in the kernel
    (no matching commit)
  - [v3,14/22] riscv: mm: Fix up memory types when writing page tables
    (no matching commit)
  - [v3,15/22] riscv: mm: Expose all page table bits to assembly code
    (no matching commit)
  - [v3,16/22] riscv: alternative: Add an ALTERNATIVE_3 macro
    (no matching commit)
  - [v3,17/22] riscv: alternative: Allow calls with alternate link registers
    (no matching commit)
  - [v3,18/22] riscv: Fix logic for selecting DMA_DIRECT_REMAP
    (no matching commit)
  - [v3,19/22] dt-bindings: riscv: Describe physical memory regions
    (no matching commit)
  - [v3,20/22] riscv: mm: Use physical memory aliases to apply PMAs
    (no matching commit)
  - [v3,21/22] riscv: dts: starfive: jh7100: Use physical memory ranges for DMA
    (no matching commit)
  - [v3,22/22] riscv: dts: eswin: eic7700: Use physical memory ranges for DMA
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


