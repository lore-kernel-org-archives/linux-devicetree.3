Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972946;
	b=0jm+WAqd0YdysSRCb9C8LVGhliJUFS0/QLk48p08rbIH73PmFjJOk+UAkO5s0UUs+kfQ
	 Ao+EMtw1oFJXCJGxmkUIhaIuaiT+/G0ATU0mTtvr3eN/wVzc4NVxkMPDctoPrtCF7avKk
	 XL2/NZ5uU8SJgF7F4NVBGDUrUmkXbprM6tGJlwcsA/NwQyK4x3TEK2qsISI59GJYkLN8q
	 kkC2cxB08b5lq4DTqE+4rMfobYWVbX9pWify0NNNtSdh7E9u8f/XK2FzXYm3M60ieSTl9
	 IRjYUu/Ddv7fYGbkU+l8duLX1JBsWxiN2b0smYWCF0DN1BGIkpSjs3Iw3isK45Ltg8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972946;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=+7/n42KyXg5q/rOBLOd1rb9kpcERHhPizyXCV+vNOew=;
	b=dONmC+znKc+bjVBY3aEvtr1LXl9ABKVWQvkzKK6RDazWjBIqxctXtFEVvDsk5POkH656
	 9BzSQcGR9+Gh6JQC1LyoGn8Sb17YczRFrploYLD5xWu60wvxsrWGu2l/8grVhEIEuYCJ6
	 3YCPS+IrnD3cCUKy/rGef/g3BVMpRolyEAFU/VY3uwMhCQSuY6uHN15nrslSjUHvSWlEg
	 X57QKuQ5V1CTHXMnjig5fla1JjERnz4sUxeN6paykFh6UwCVN+UJ2BE/gcs60soC6WmVM
	 wng55mYACHGntx60fmZA5EvU3kEMBwLzHj3k8z0GgAT12wEo2eVBE3Y+28VZdNYsmMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ayXUbKYv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBBE606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ayXUbKYv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CB31F000C4;
	Wed, 18 Nov 2026 03:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972945;
	bh=+7/n42KyXg5q/rOBLOd1rb9kpcERHhPizyXCV+vNOew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ayXUbKYvov/6b7QYSb9hRgYh8PtUWaFSc+844sQcDselrEd5exQDL87/sBG2IwRNO
	 FpqtxofSxtxMKbhWyEAeUL7v66hjSQQa1RG0+GezXIwZveyf54SRHe3ZSidkOL8iZw
	 F0lXTbzwP2vkXGHzc7zQUyfG72BrgH6eakIvKKD8+f0nYZJ2KXL508tTuqaCNG7TRp
	 vmFS8c5gayk9+NHihWEa0Kfdv3GKJR1HrEFmd3EiZm7mYWxNNx3PezcTRsnTRrIgBf
	 bVH6iXBxNj10AW+McH0nttridsiCH54mbhkdQrh5a56Dzstx6eVXjgH/SJ0vLuDkzz
	 FI0WWFxH20quw==
Date: Tue, 17 Nov 2026 20:35:42 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-mm@kvack.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] riscv: mm: reserve the DTB before scanning reserved
 memory
In-Reply-To: <20261104104604.3370384-1-m.szyprowski@samsung.com>
Message-ID: <3e5a01c1-1d91-8bc0-0589-0621930c2d18@kernel.org>
References: <CGME20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583@eucas1p2.samsung.com> <20261104104604.3370384-1-m.szyprowski@samsung.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2026, Marek Szyprowski wrote:

> early_init_fdt_scan_reserved_mem() allocates memory from memblock while
> it scans /reserved-memory: the reserved_mem array, and the regions that
> are placed dynamically by size. On RISC-V the DTB was only reserved
> after that scan, so memblock could hand out the memory the DTB occupies
> while the DTB was still being parsed.
> 
> Reserve the DTB before the scan, so that memblock never allocates from
> it.
> 
> Fixes: ef69d2559fe9 ("riscv: Move early dtb mapping into the fixmap region")
> Closes: https://lore.kernel.org/all/b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com/
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks, queued for v7.4-rc with a stable@ cc.


- Paul
