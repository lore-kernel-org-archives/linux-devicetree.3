Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735941;
	b=orWonxyv9d6RZm53zZITLDbhzgV1pZ+H8C9akFPZBXWifzvCFXTFa//F5WlXspLwITDo
	 boau6VkE2SIvJHuUqkhhiXqh0x2MfdHzMElHs7d7PziWb7DV4DIFQaNZDCoa2Qf9XIjKq
	 Bm1R3UdqdLUrnpFHZBAzTMV1Ec5KgvZ3Gn8m2WAkNaE4GXXTQ3EJPaNmnEaoBXErYCf6U
	 om6EmqYQTbF2K7Nq+PrsGnhIj59DqnQ391ciOd4O4x3Svi1fMwLMa9+4A9nAA2GO4i4M3
	 Xi58dRYDMP8SuZRNt9gj7dp1RzxuXbWIXDl/YQP0vvf4E1BZ49nR7xl1BML77Zeb4nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735941;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FVpohG1VZmuUl18pFfPOZ4Do8lMHBffThJLIzZLJQY8=;
	b=v3+ajyY2ce1lHqG3ukDLM68s2Vx2u/wrYnwsIAIksmZNfmKGuZISocdjsEHoWqpAKFt0
	 yt3/N9EjiIAaR4AhMR56ZobThzHGRHehIH6VCf+xZtNNqW2CDwZhzgs1KpfmkZQVYiGFd
	 90YiBHvpHQvdvygQGiHUP1UuoRcD7hJHEM+YkcrkK3x9wko7+0HjMehtddCPweTbAne67
	 laEKe2o4aXTeh14YaB+YbmFGT4lKyc3nqK1aTnUGR8UkQvmrqGkvV93V2QtHIbBFfAVyO
	 L4/hP4f4GxmouaMBLHW4aCLU0X3mULCPLUimIH36OKcx0E2IIplSoRK2xSRsLKV7Y3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+wBtb0Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D136606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+wBtb0Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3FF1F000C1;
	Thu, 26 Nov 2026 23:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795735940;
	bh=FVpohG1VZmuUl18pFfPOZ4Do8lMHBffThJLIzZLJQY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+wBtb0QKwbvfQdbBFIofeI/wNEJN/mk0Z51SqixQW+2S6wlikO6XkUcjLoXwEAbN
	 OrqF02ehLZ5i1zHzdCdzB0ofx48YOL8PocnBNUUrxelnIQcrRIX2XbkS4OMMDNKA5Y
	 8zDPk4juSSd/gsRTsNgOXjfzMBEzsrPgdwax7XQ0xDSFcpF+LswaOaHm/qWy5Woo2C
	 yP9hzSFVW+C2Gtr6LfebR+2NJj2tr2G15cdRb3nOAYyu1owzUNRX5/3RVp4R/mtXKi
	 WB2lxdoKFDU4Ffnk7HnC8pDOcDqmWOtdBwYpbSn4oLEteB8svq+KBfTFvkzFyFeT0o
	 J/Ok/ET9RqXxQ==
Message-ID: <sashiko-outbox-236336@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 14/19] riscv: Synchronize instructions written to
 ESP32-P4 PSRAM
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VsOtdG9yIEh1Z28gU2lsdmE=?= <vitorhg20080@gmail.com>
Cc: devicetree@vger.kernel.org, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Jan
 Kara" <jack@suse.cz>, "Kees Cook" <kees@kernel.org>, "David Hildenbrand" <david@kernel.org>, linux-mm@kvack.org
In-Reply-To: <20261125233020.1380594-15-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
 <20261125233020.1380594-15-vitorhg20080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 23:32:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] riscv: missing ESP32-P4 icache sync in NOMMU mmap/brk and
  flush syscall
- [Medium] riscv: missing esp32p4_sync_text() in NOMMU
  __patch_insn_set()
- [Medium] riscv: missing NOKPROBE_SYMBOL() on ESP32-P4 text sync
  helpers
--

commit 7842ba5a926e273d15f8232bcb20b17ab7d9d227
Author: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>

riscv: Synchronize instructions written to ESP32-P4 PSRAM

This commit adds ESP32-P4 PSRAM L1D/L2 writeback and L1I invalidation
helpers and wires them into NOMMU kernel instruction patching, executable
loading, and signal frame setup.

Link: https://docs.espressif.com/projects/esp-idf/en/stable/esp32p4/api-ref=
erence/system/mm_sync.html

> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index c2b0a2928f067..a5c20d7d1c9d8 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -85,6 +85,12 @@ static inline void flush_icache_range(unsigned long st=
art, unsigned long end)
>  	flush_icache_all();
>  }
> =20
> +#ifdef CONFIG_RISCV_ESP32P4_CLIC
> +int esp32p4_sync_user_text(unsigned long start, unsigned long end);
> +
> +#define flush_icache_user_range_checked esp32p4_sync_user_text
> +#endif
> +
>  extern unsigned int riscv_cbom_block_size;
>  extern unsigned int riscv_cboz_block_size;
>  extern unsigned int riscv_cbop_block_size;

[Severity: Medium]
Does leaving flush_icache_user_range() as a plain fence.i miss executable
NOMMU mappings created via do_mmap()?

In mm/nommu.c, do_mmap_private() populates private mappings in PSRAM with
kernel_read() and do_mmap() then flushes them via
flush_icache_user_range():

mm/nommu.c:do_mmap() {
    ...
	if (vma->vm_flags & VM_EXEC && !region->vm_icache_flushed) {
		flush_icache_user_range(region->vm_start, region->vm_end);
		region->vm_icache_flushed =3D true;
	}
    ...
}

When an ELF FDPIC binary is loaded via elf_fdpic_map_file_by_direct_mmap()
or userspace creates a PROT_EXEC mapping, instruction fetch can still
observe stale PSRAM instructions because L1D/L2 are not written back and
L1_I0 is not invalidated.  The NOMMU brk() path in mm/nommu.c and
sys_riscv_flush_icache() also still only execute fence.i without
synchronizing the ESP32-P4 caches.

> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 2b5adf01c5502..e0687c943358e 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c

[ ... ]

> @@ -173,9 +180,132 @@ static int __patch_insn_set(void *addr, u8 c, size_=
t len)
>  }
>  NOKPROBE_SYMBOL(__patch_insn_set);
> =20
> +#ifdef CONFIG_RISCV_ESP32P4_CLIC

[ ... ]

> +static int esp32p4_cache_sync(u32 map, u32 start, u32 size, u32 op,
> +			       unsigned int count)
> +{

[ ... ]

> +}
> +
> +static int esp32p4_cache_writeback(u32 start, u32 size)
> +{
> +	int ret;
> +
> +	/* Repeat writeback to avoid losing a sync with conflicting writes. */
> +	ret =3D esp32p4_cache_sync(ESP32P4_CACHE_L1_D, start, size, ESP32P4_CAC=
HE_WRITEBACK, 2);
> +	if (ret)
> +		return ret;
> +
> +	return esp32p4_cache_sync(ESP32P4_CACHE_L2, start, size, ESP32P4_CACHE_=
WRITEBACK, 2);
> +}
> +
> +static int esp32p4_sync_text(void *addr, size_t len, bool fatal)
> +{

[ ... ]

> +}

[Severity: Medium]
Should esp32p4_sync_text(), esp32p4_cache_writeback(), and
esp32p4_cache_sync() be marked with NOKPROBE_SYMBOL()?

__patch_insn_write() is marked NOKPROBE_SYMBOL() and is called when arming
or disarming kprobes and preparing single-step slots.  If a kprobe is
placed on any of these three helpers, patching kernel text for kprobes
will recursively trap into the kprobe handler while reprogramming the
cache controller.

[ ... ]

> +int esp32p4_sync_user_text(unsigned long start, unsigned long end)
> +{
> +	int ret;
> +
> +	if (end > start) {
> +		ret =3D esp32p4_sync_text((void *)start, end - start, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	flush_icache_range(start, end);
> +	return 0;
> +}
> +#endif
> +
>  static int __patch_insn_write(void *addr, const void *insn, size_t len)
>  {
> -	return copy_to_kernel_nofault(addr, insn, len);
> +	int ret =3D copy_to_kernel_nofault(addr, insn, len);
> +
> +#ifdef CONFIG_RISCV_ESP32P4_CLIC
> +	if (!ret)
> +		esp32p4_sync_text(addr, len, true);
> +#endif
> +	return ret;
>  }
>  NOKPROBE_SYMBOL(__patch_insn_write);
>  #endif /* CONFIG_MMU */

[Severity: Medium]
Should the !CONFIG_MMU implementation of __patch_insn_set() also call
esp32p4_sync_text(addr, len, true)?

__patch_insn_set() modifies kernel text with memset(addr, c, len), and its
caller patch_text_set_nosync() only calls flush_icache_range(), which
issues fence.i without writing back L1D/L2 or invalidating L1_I0 on
ESP32-P4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125233020.1380=
594-1-vitorhg20080@gmail.com?part=3D14
