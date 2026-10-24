Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856524;
	b=QfgLPHAPJjHn2Uwy1g597pCnDAD5j+h/mtPWy5XZevLIW55nRuGHe1i+YqdvshzNAvlX
	 +7DoT1sSIZnMo+sgvMR/wHX3rQYaSnsH+tOIMKcU0V7HFkTCrOO+yhyJ3OV+Z3JisG+Hr
	 8+pHQSIhHEJh01PW6n15xWiZIgjHz9hlXEKxRChq9+9BwzgtxToGNro4bDHjavCwGFKod
	 zoaBC8N/Wp9uk9hawJh/HRAaDy/SISh9mJhFgkSIRD/zejQaJDoQxgLgrLAaQzQeqQdMR
	 wdSJyC08Sp45yfzzbABLFRXm0paBhA2i6i6qPl2QLGBiF38lPY3EHi76d8QMLd89HrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ANXPqZSHJyzWuXCvN2vxk67OVN57MUfNQmVBTDzT6pM=;
	b=4DgTfKI31DsY31COSBeV58YN7H5tHfXl6WfB+HMkNQsA9w9+nKM6UeWTM7QXNMFOmqlW
	 PU5INQKvvkF9xRwXWj8Pc9cRjJBCN+SUu+nNH9nOmTp1Ua50+iLedv3rrsjobSCY7Jn0I
	 U9z75R2zfxXhSBJeodKo4BA3RaAxYvdW64YloXU7Hwdmste6iwlIHh5LWX6YJEECOv9+4
	 Yhk0nnEWelywOXxg88u8k0c5PFr44IourRrbEw/k7j7VxOese3BfKXhKqO4rpNlZDMw9E
	 ZltjnUxGnI14gsGl/vIhRdVNU6CvL2WSxiVHinyVbSQrGCBC3fvSDOi2LtyT9Li8Zpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l26u6Qyo;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936FC606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 15:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936FC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l26u6Qyo
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3119032eec.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856523; x=1793461323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANXPqZSHJyzWuXCvN2vxk67OVN57MUfNQmVBTDzT6pM=;
        b=l26u6Qyo4VsDmQaHqwSB36ri5GN01lYrYiOcWD7Eq5g//0E6KjMfeLg0rYu0dcLsrU
         iOyWaupPt++FB1O9YhHxy9pmzIzhxqd+E2wKD+g4L94R8hUybkHwGHdHJgCKza3jR1wr
         bpnQDdfIpoxXNa35d/DBjlTkyx4BK4ftM2L8xxL1KBbaICc1TfGxO/vtS5Ey2m8pZ3s4
         L59imEjt5NQl8JARRGu3IapMlKYDBSkCUmTkI+vul8mjR4BElg58JBThFkDWT6TKi+mR
         jUHihECpRPexgF3esg4mIhGY/8MWPYDQKBky0kqXiCtEj2yKEX4531auLfTqc6oaqrEr
         AT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856523; x=1793461323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANXPqZSHJyzWuXCvN2vxk67OVN57MUfNQmVBTDzT6pM=;
        b=ASrofz5lcq0Yp8+ZK2s5+e8gzTMKzSqStWh2w9lNr9XG4SxY9GOwpG8h319pfVBr61
         SWAq6ovg4AbHKS6/lyPe4VltNT9XcnxJlyy9vBOi6JCLi6ee/3MPDRT6YK8/1tsVQskc
         UDFe08BxWmR+6fY29Wo4Hv40bWFiVzTs1VHwsvzJ5aejioJFFHZYJ3JJ33S3G6aFb+3R
         NVrRG6ry/+ILm48O6W9odgybIGr/SIMP0CeW4e5dZDzWttJp10jxj+TMnE4mosneLcVW
         AJuIOFDEn8bdZnBtjVrzJqMocRflX0cqXs86OlcfxXFXp7fb16x2cFxMCUyGRXIH/fja
         nQog==
X-Forwarded-Encrypted: i=1; AKwUvBxCkFRpT3s7XxJycNfSq5vrWkzHvB9fzf1CcmUSEi7XfysZoU9pc941ZaLGiHpsd64muyZmnzTyVs+B@vger.kernel.org
X-Gm-Message-State: AFq9FYIjGvhka35aYAjOtJEXuY+bqKtZaNPpNTrBLacPZuNAc3GzLy2l
	OOR2n2I1jyzUj1Nng8fvKUKLV+tYNiCDX14XVMzal3npF7DaFCxozpki
X-Gm-Gg: AYBFou0ClBKVjsdRxjnHeOQMowSy3fHYAH6k6j5tdNdM3mzcqsuyUOnnDgutG+bsOCl
	OQ5bFB1ARU1nwKwU6xqakYf6wxeUYEaLwZBxWwScNbeSCFM/KRn9cr53saqY6y+pGPxO9kQ6q+B
	SazRwz0J90YfoLOgy5CWa5W44sRBXklFK/I6cZ3pYZeqeCnrZYv2ItJAu9wpAM0ROpGK7PkBG8C
	nVDiNgRrarqibWPQmVfAnDfKAm0tLnUoS4esgnbnM49niZNpAjoGYHlIt0mNGo3J4yfYlHhHpiJ
	cePW1WAhhjZDkuXNsDqlu+y2RG0eSL+DWxQbKPKCpnEAfhxvXbeOpX1nUiExSFm0CPbwn6TlhBp
	v+RzfCju9dZXhiuG08XHSm4RSjxNTKmGR6x25+49SD9KVXOH1o43I3Wm9hAhxsH8F62lbLIRl5I
	pJziYpl18jmbfS7AQIwAL/XsIHCQsIbsfj0kqHfeY8cCgKfPtQI3tSAJhqChYU3PzVavMVWTV1d
	JEN6adbrHsXoasVt6frYjKvRoIpY/aSF5ND9HaO35t0ps3TpubTojKOdA==
X-Received: by 2002:a05:693c:880c:20b0:369:2040:cc88 with SMTP id 5a478bee46e88-369e86144a3mr3470823eec.20.1792856522555;
        Sat, 24 Oct 2026 08:42:02 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:02 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 0/3] net: airoha: npu: keep NPU-shared DMA buffers in the NPU window
Date: Sun, 25 Oct 2026 01:41:47 +1000
Message-ID: <20261024154150.45733-1-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB, as confirmed by Airoha [1].
On boards with 2 GiB of RAM nothing keeps the buffers the NPU reads
and writes inside that window:

- the mailbox buffers are streaming-mapped kzalloc() memory, which on
  arm64 bounces through swiotlb; on W1700K the swiotlb pool is at
  0xff6cf000, so the NPU version query reads back 0.0 and mt76 does not
  bind NPU offload (this is the issue behind the earlier "use coherent
  DMA for mailbox messages" / cacheline-buffer postings [2]);

- the coherent buffers mt76 allocates on the NPU device (NPU TX/RX
  rings, HW-RRO and TXD buffers) currently land in the window only
  because of early-boot allocation order; reserving low DRAM away makes
  the SoC hang right after mt7996 firmware load.

Patch 1 adds an optional "dma" shared-dma-pool region to the NPU
binding. Patch 2 attaches it as the NPU device coherent pool, so every
coherent allocation on the NPU device comes from the window. Patch 3
moves the mailbox to per-core coherent buffers, which then come from
that pool.

Streaming mappings are deliberately left alone. Packet buffers are only
passed through to the WiFi DMA engine; restricting them with a
restricted-dma-pool or a bus DMA limit forces swiotlb bouncing and cost
~22% of host-path WiFi TX in testing, and the default swiotlb pool is
itself outside the window on these boards.

Sent as RFC while net-next is closed; I will repost as v1 once it
reopens. Feedback on the approach is welcome, in particular whether a
reserved coherent pool is the preferred way to express the NPU window
rather than a dma-ranges based limit.

Testing: Daniel tested this series, backported to OpenWrt kernel
6.18.57, on a Gemtek W1700K (EN7581 + MT7996, 2 GiB) with a 16 MiB
pool: the pool is assigned at 0xbf000000-0xbfffffff, the NPU version
query is correct, all three bands and MLO come up and there are no
warnings. I tested the equivalent of patches 2 and 3 on the same board
with 6.18.55 and 7.3-rc6: all mt76 NPU rings/RRO/TXD buffers come from
the pool (~10.7 MiB used), host-path and offloaded WiFi throughput are
unchanged versus no pool, and boot still succeeds with low DRAM
reserved away. On net-next the series was build-tested with W=1
(airoha and mt76 incl. MT7996_NPU, at each patch), checkpatch --strict
and dt_binding_check.

mainline en7581.dtsi does not have an NPU node yet, so there is no DTS
change here; boards using the WLAN offload need a 16 MiB pool, others
only need the mailbox (1 MiB is plenty).

Tools: patch 1 was originally written with Codex and patch 3 with
Cursor; patch 2 was written with Claude (Anthropic), which was also
used to rebase patches 1 and 3 onto net-next and rewrite their commit
messages.

[1] https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
[2] https://lore.kernel.org/r/20260809152813.585797-1-pawlik.dan@gmail.com

Chris Scott (1):
  net: airoha: npu: attach a coherent pool in the NPU window

Daniel Pawlik (2):
  dt-bindings: net: airoha: npu: add DMA pool memory region
  net: airoha: npu: use coherent memory for mailbox messages

 .../bindings/net/airoha,en7581-npu.yaml       | 40 +++++----
 drivers/net/ethernet/airoha/airoha_npu.c      | 83 +++++++++++++++----
 include/linux/soc/airoha/airoha_offload.h     |  3 +
 3 files changed, 95 insertions(+), 31 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.53.0

