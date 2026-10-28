Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224588;
	b=Mqdpq6YYTXJM+5vjTlOwNUUrH+o5vXpWSCMuTb28VpJgX1bzLNmuOe5GaQ7tZV59G/W/
	 i29qcA+adkXQ2Qjak64O8Kl/JrlBB9+2FwQ6NXlBfLmcxACzCxMHAERKrmc9m8rUxHylP
	 RPzXW6oJe1ZUZHeOgS+yEclJnFqiR5kyVYrL1zowMAI7xplIgRC7c75LwEfkYuz4Miwq3
	 b+9ktdmHDquRBt7NrU0pShYJl+RYdBt+tjAFghIYeW/8K3JqCpG2Ykd2DXjedqO/8guM8
	 CwRlC74UK2emYpcOBKAB0i4IUrK6BX50nmHvRt470557h5dUQNym+vDLGKAAgkI/+2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7kkNpYHoAXd6IrwvX2fEmvIFuXohpJX1+/fOXYZcgTE=;
	b=W6ao0Wxa2L21I4Ek3Yd7aBYJ/eOhuu4/ykEO7V25ilWuFN5Z+cJMaqqJJZ/MwoiV5yMc
	 wclwimypackS2W4LmJvB+kldJEaUo8/8MbeFx21d6bMtDiNUaFJD7HvqaogLOYBDoUhlq
	 W75I0+pgPnaFRfRoCP5j0IikWsQ0cdAvn0k8zTWS5g5fBoM+KLQa/vWWxbK1CxrWyg3rZ
	 zEqUZpOncKXjsk5/W4eTiSYBCra8PaSLo3pTJjnEcsY0C+4zcGU3zEouoe7ZdW9SuQgAw
	 OKaLVU76lYtavg/M4IWmCe6mBkWalRTTMglpngGD0b90l6MWswH536tE/oXh/6P0Tjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Dam7nWgr;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194DB60A2607
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194DB60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Dam7nWgr
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a17a332ecso2050067eec.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224587; x=1793829387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kkNpYHoAXd6IrwvX2fEmvIFuXohpJX1+/fOXYZcgTE=;
        b=Dam7nWgrXb7+KZguosSLcJIwgRURctcRj9WnpX4bkBxB1Ar/mIxd6vrzjvqFMun7F6
         7GHpXOlrzYP6rs3eplIgnny4CLTWS8rRVWLP06F71rdP8syr+EVZ6LJm0luVzagNjbGy
         xmzexiLS9ysGJ1l2/yiVsqqB0CoElpoLWuTcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224587; x=1793829387;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7kkNpYHoAXd6IrwvX2fEmvIFuXohpJX1+/fOXYZcgTE=;
        b=ZJzzQbNHVpHcT/lKILAMrKf0gZgvIwm+pnm7MVPgPkBJjxliCRVaUfJntF3essXmRI
         Z+VNuBvv2yGdeRFQaHhHAqFAi9VbsbHzh0bt3pq1q+IVcl/9X7UWK9Hra92xmK7S7Zc9
         +WaUpzNf9YXzjHNK0nEO1NnObu4v08nVmiNAEpNOATjEdFWVEAd9AXaNEYJ5GLrZwEv/
         58Syos56xcN2RnTWICSuvtFBgHQHPxwvFsBTx+KRGAdlqo6wiAMxJ9NkHL7his85k/xJ
         iuaq9Lt+VjhD2UvhXENCyqpGv/BrcJwRUTYINdFZxSV3KoCXTnT4ODtKdy5jDQP3zIPP
         QuXA==
X-Forwarded-Encrypted: i=1; AKwUvBytuTiK0R7ajSVT/Wz4HUgAl144NIqJelBzGqSR5AuE/dIG2UFuIPKt3I6nh8KN6jSQMSl3Q8sL8UxC@vger.kernel.org
X-Gm-Message-State: AFq9FYL0++2t5EbrAeZiSzmk7r/Chv1yI2UAYe/YfVCfDeT7KKo8UmkT
	sALbxaMgAS0TunRljSLwXRyx/Vc9o2ofI2Lfx/Jt8ieP5dw8OoDBQmxL9r8u9boGzQ==
X-Gm-Gg: AYBFou2/gtJVuRN5An6KcIx/NIWHItQvAyCgQ85KZwmgSNz96ILGdToP0Tt+fX0KYdH
	fD661oZll4dLS4K6H8HvZnCH6oLdNXacdgUPULQXngyQAWDixNPGLe0wlCz69oqL3GUQU4jm2rx
	pbEjFohsh4GPjWqEwPyZftZcaS6zobkmnetgMnTYFdH2Op61rP9lzavcBEtkYJLEjoSBPlFlYjw
	H1ducFutI2Atvcpa8LHWSKjtPOpZhBK6BqQtVGs7Ncfa3Hv31tzZJBW/ROao1jfl6ee70203qoG
	gFw6iUDm63ci/G9ULcHPN3fMUp8hzxC1ZkNFXNH2JavHZHTCgHZC1FWTScafwLJLoG0BCwe2Yoc
	P1rkzU/eTAov/SyWgRKLDyi9fd+6s2oMsRWKxVNIgILvsVW4ZyDnsg1Z39oxwqNi08r1+P7TGMC
	dgRObjII165wO3tRfVU3KoWALytQ1xyhsykewLZc5kCWxa2rVXmmxiTKbA+d3g+/BNGfG9YKTnT
	b4L6o9Fh3bafpzMcOth1LT6LRugSoQBAVsuap+pNZ3u614N1+IFkCaXiJcl58PRVIduOr7v3UlK
	c3MQud5vvg34S8LGD6wI7CLbu0Y729CCvQM011KE+ukPl+lsaN8NTicii+TYh4qjENCUPJ/gDWj
	rbcYaoaeH/Cj1
X-Received: by 2002:a05:7300:8aa0:b0:36a:168a:96c4 with SMTP id 5a478bee46e88-36a1ffc56efmr5102572eec.1.1793224587050;
        Wed, 28 Oct 2026 14:56:27 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 00/10] fdtfactor: Introduce fdtfactor to auto-factor overlays
Date: Wed, 28 Oct 2026 14:46:49 -0700
Message-ID: <20261028215600.1713475-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Devicetree overlays exist at both the source level (via `/include/` and
`.dtsi` files) and the binary level (where a compiled `.dtbo` overlay is
applied to a "base" `.dtb` at runtime to add or modify nodes).

Binary `.dtbo` overlays were created by transcribing source-level
overlay semantics to `.dtb` blobs to serve two main use cases:

1. Supporting add-on boards (like "hats" on a dev board), where a base
   board's `.dtb` is combined with an add-on board's `.dtbo` at boot or
   runtime (a use case that Hervé Codina's upcoming "addons" work aims
   to model more cleanly).

2. Allowing constrained bootloaders or firmware images to support a
   "family" of similar boards in a space-efficient way without shipping
   a full `.dtb` for every variant. In upstream Linux, for example,
   there are 47 distinct sc7180-trogdor boards supported. At the source
   level these boards share common `.dtsi` files, but we still compile
   (and ship) 47 separate full `.dtb` blobs. Binary devicetree overlays
   can make this much more efficient by factoring the common bits into a
   single base `.dtb` and representing each of the 47 boards as a small
   `.dtbo` overlay.

Even though `.dtbo` overlay semantics are a natural fit for case #2
(since they derive from source-level `.dts` overlays, which were
designed for board/SoC families), upstream Linux has mostly reserved
compiled `.dtso` -> `.dtbo` overlays for case #1. Many Android phones
attempt to use `.dtso` overlays for case #2 by describing the SoC as the
base devicetree and describing boards in `.dtso` overlays, but forcing
the binary base/overlay split into the source files has drawbacks: there
is still lots of duplication between board overlays, and upstream
reception towards structuring board source files this way has been
lukewarm [1].

This patch series introduces a tool to decouple binary `.dtbo`
generation from `.dts` source structure. The idea (suggested by Konrad
Dybcio at LPC) is to continue to represent all the boards in a family as
normal standalone device trees in source code (using `.dtsi` includes as
makes sense for human readability). Then, after building the full `.dtb`
blobs, `fdtfactor` automatically factors them into a common base `.dtb`
and a set of per-board `.dtbo` overlays.

This tool has quite a few advantages over other solutions:
1. No change to the way device trees are stored / arranged upstream.
2. No need to deal with some of the awkwardness / limitations of
   overlays.
3. Better savings than just a simple partitioning, like between SoC and
   boards.

I've used this tool to reduce sc7180-trogdor device tree files (which
are stored lz4 compressed) from 1.71 MB to 213 KB, an 87.5% savings.

To compare against the manual SoC-base + board-overlay split used by
downstream Android kernels, I also tested `fdtfactor -S` on the
downstream Pixel 10 family device trees (29 physical hardware board
variants: 27 phone variants across Pixel 10, Pixel 10 Pro, and Pixel 10
Pro XL plus 2 socketed dev board variants) by combining the downstream
base + overlays into full board DTBs and re-factoring them with
`fdtfactor -S`:

* Just B0 silicon (29 boards):
  - Full unfactored DTBs (29 `.dtb`s): 26.30 MB uncompressed (5.28 MB
    lz4)
  - Downstream manual SoC base (`lga-b0.dtb`) + 29 board `.dtbo`s:
    8.06 MB uncompressed (1.66 MB lz4)
  - Auto-factored with `fdtfactor -S` (1 `base.dtb` + 29 `.dtbo`s):
    3.27 MB uncompressed (668 KB lz4) -- 2.48x smaller than the manual
    SoC split (and 3.68x smaller across the 27 phone boards alone, where
    average overlay size drops from 252 KB to 44 KB uncompressed, or
    52 KB to 9.1 KB lz4).

* Both A0 and B0 SoC steppings:
  In practice, phone Proto boards (8 variants) only ever use A0 silicon,
  phone EVT1.1+ boards (15 variants) only ever use B0 silicon, and only
  phone EVT1 boards (4 variants) and the socketed dev boards (2
  variants) can have either A0 or B0 silicon -- giving 35 realistic
  (board, stepping) combinations (14 A0 + 21 B0), compared to 58 for a
  naive 29 x 2 cross-product:
  - Full unfactored DTBs (35 `.dtb`s): 31.71 MB uncompressed (6.37 MB
    lz4)
  - Downstream manual split (2 SoC bases `lga-a0.dtb` + `lga-b0.dtb` +
    29 board `.dtbo`s): 8.78 MB uncompressed (1.79 MB lz4)
  - Auto-factored with `fdtfactor -S` (1 shared `base.dtb` + 35
    `.dtbo`s): 4.00 MB uncompressed (855 KB lz4). This could likely be
    improved more with multiple levels of overlays, but we're already
    2x smaller than what downstream is doing today.

NOTE: on Chromebooks like sc7180-trogdor, using overlays like this is
an optimization. On Android phones like Pixel 10, the bootloader logic
bakes in the need for overlays. Specifically, if we want to be able to
build a single image that supports multiple boards and have the
bootloader auto-construct the right devicetree, we need the boards to be
represented by overlays. This fdtfactor tool can make that a reality.

The fdtfactor tool can either work directly on a set of compiled
devicetree files or it can work on a FIT (flattened image tree) file.
The idea is that you'd create the FIT file containing all of the
duplicated devicetree files and then fdtfactor would "optimize" them.

Before introducing `fdtfactor` itself, the series starts with a few
preparatory patches: adding Python iterators and a `NodeTree` live-tree
abstraction to `pylibfdt`, and teaching `libfdt`'s `fdt_overlay_apply()`
to update `/__local_fixups__` on the base tree so overlays can be
applied in multiple stages.

I'll freely admit that the patches in this series were pretty heavily
vibe coded. I'll not pretend that I have a deep understanding of the
intricacies of how overlays are implemented. That being said:
* I've spent quite a bit of time reviewing the code from a high-level
  perspective: confirming that functions are well documented, well
  structured, and make sense.
* I believe that what the tool is doing and how the tool is used make
  sense.
* I have had quite a number of internal "the AI reviews the AI" rounds
  to the point of diminishing returns.
At this point, I'm not embarrassed to put my name behind this. While I
won't promise that there are zero cases of the AI doing something really
stupid, I'd be willing to bet that the end result is better (and cleaner
/ better structured) than what I would have coded up if I had spent a
few weeks doing this on my own.

[1] https://lore.kernel.org/all/20251114-elite-refined-yak-bf9e64@kuoka/

v1: https://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

Changes in v2:
- New patch fixing FdtSw.as_fdt() buffer resize when < 4 bytes remain
- New patch adding FdtRo.subnodes(), FdtRo.properties(), and
  FdtRo.get_mem_rsv_list()
- Split NodeTree live tree representation out of fdtfactor into
  pylibfdt (David Gibson)
- New patch factoring out overlay_parse_fixup_entry() and
  overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c
- New patch tightening fixup offset parsing and generalizing
  overlay_split_fragment_path() for non-NUL-terminated paths in
  libfdt/fdt_overlay.c
- New patch updating base /__local_fixups__ in libfdt
  fdt_overlay_apply() instead of stripping /__local_fixups__ by default
  (David Gibson)
- Preserve /__local_fixups__ on base.dtb by default (David Gibson)
- Store parsed trees directly in NodeTree with node.phandle and
  node.fixups attributes instead of parallel dicts (David Gibson)
- Extract phandles in a separate pass after unflattening and reject
  legacy linux,phandle properties (David Gibson)
- Exclude non-root common phandle nodes lacking a common symbol from
  base.dtb instead of synthesizing __fdtfactor_ph_* symbols (David
  Gibson)
- Drop -q/--quiet, rename -v/--verbose to -s/--stats, and move tests to
  a dedicated fdtfactor test suite (David Gibson)
- Split -S/--strip-local-fixups into a separate opt-in patch (David
  Gibson)
- Add --base-compression to explicitly control base.dtb compression
  while documenting auto-detection from --base-dtb's filename suffix
  (David Gibson)
- Support legacy LZ4 frames (lz4 -l) and use CRC32 check for XZ outputs
  (Simon Glass)
- Drop "tests: Fix Python test environment setup in meson.build"
  (applied upstream by David Gibson)
- Clarify source-level (.dts/.dtsi) vs. binary-level (.dtb/.dtbo)
  overlay history in cover letter (David Gibson)
- Add Pixel 10 (Tensor G5) base + overlay comparison numbers to cover
  letter (Simon Glass)
- Rename -f/--fit and -F/--fit-out to -F/--fit and --outfile and clarify
  FIT mode in the --help description (David Gibson, Simon Glass)
- Reject signed FIT images with signature* subnodes (Simon Glass)
- Use '<base-node-name>.dtb' for FIT base FDT descriptions instead of
  common-prefix heuristics (Simon Glass)
- Compare FIT group node overlap against the group's common node set
  instead of only the first entry (Simon Glass)
- Document in README.md that U-Boot's boot_get_fdt_fit() currently
  requires FIT overlays to be uncompressed (Simon Glass)

Douglas Anderson (10):
  pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
  pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
  pylibfdt: Add NodeTree live tree representation
  libfdt: overlay: Factor out fixup and fragment path parsing helpers
  libfdt: overlay: Prepare fixup and fragment path helpers for reuse
  libfdt: overlay: Update base /__local_fixups__ on apply
  fdtfactor: Add tool to split DTBs into a base DTB and overlays
  fdtfactor: Add -S/--strip-local-fixups option
  fdtfactor: Support compressed DTB inputs and outputs
  fdtfactor: Add compiled FIT image factoring support

 Makefile                           |    2 +-
 README.md                          |   74 ++
 fdtfactor                          | 1626 ++++++++++++++++++++++++++++
 libfdt/fdt_overlay.c               |  847 +++++++++++++--
 meson.build                        |    1 +
 pylibfdt/libfdt.i                  |  310 +++++-
 tests/Makefile.tests               |    7 +-
 tests/fdtfactor_board1.dts         |   38 +
 tests/fdtfactor_board2.dts         |   36 +
 tests/fdtfactor_board3.dts         |   34 +
 tests/fdtfactor_board3_shifted.dts |   34 +
 tests/fdtfactor_lz4.its            |  109 ++
 tests/fdtfactor_other1.dts         |   33 +
 tests/fdtfactor_other2.dts         |   33 +
 tests/fdtfactor_test.its           |  109 ++
 tests/meson.build                  |    2 +-
 tests/pylibfdt_tests.py            |   80 ++
 tests/run_tests.sh                 |  337 +++++-
 tests/testutils.sh                 |    1 +
 19 files changed, 3629 insertions(+), 84 deletions(-)
 create mode 100755 fdtfactor
 create mode 100644 tests/fdtfactor_board1.dts
 create mode 100644 tests/fdtfactor_board2.dts
 create mode 100644 tests/fdtfactor_board3.dts
 create mode 100644 tests/fdtfactor_board3_shifted.dts
 create mode 100644 tests/fdtfactor_lz4.its
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its

-- 
2.56.0.313.g2479322e68-goog

