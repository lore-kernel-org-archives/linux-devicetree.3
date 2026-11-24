Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485016;
	b=U6YuWVK/NrPLYRm7CGVVNYL/pZ6JIXvRVotmfshiuWZfdVLzSsRImVgXmSDHnJVTe3q5
	 d4bG4I5hvJgt83CBcyRrVEZ92C4u+Zi1LDwsUfIYnB3c5UEualwSb2zP34IGwH9xNUfoL
	 cZohs4dTAI9orf3pIFXaZtU4tdy1bSyU/3IOvqR8E3TxzAJ5qpmt+IEUSzflqw7jWWIcf
	 KwH5mu7gum3H+J0M47QTPq2hbmgA/iOqKHRBqGGfmKO/BjiSN1N4wTI84U89ZzpBdj/Xi
	 TN5AVgJiyiz5hCphWyMDnKJrD1Vl3TzkWWoyl/QIX9jxbAdAGYn5MKSQTMTb7P4kXyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485016;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=2QXMNnMraTZH/FnAkc7kgTSbDePKAwMxVAPlh8rzchk=;
	b=qUzTI6kfGOZ5ba+s/Crar3RmwJd3bNgcs1SraYMWi3tyckaUj3zRwZ+sfDpbvokLxdqW
	 uCtt2z3irPjB+U4tuVuABJenQ3SNyL2VK9qjGbiXIBwEOljeeakowSVk1fx2scgFw8V8R
	 BpBwLJzYEpF4M6gBdSFRdfK+nfK0p1r0fn8VN8OX9//OI/lW0a7j1eofF6z4UucWJjrWO
	 4F1TTaMDwnHq9raWC25TOWplEQdDKE3XLeNE+GnXm1RUmJPW8on4DlCWDfY+W5dHzeXp5
	 waQB0KF1uBV6YCMRSacYsvnAIRWzRwfogzyl6gn4ABzv+lqPd14TGLfqt5c6ZOhsF4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Cpo8CDwz;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50FD606A31E;
	Tue, 24 Nov 2026 01:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Cpo8CDwz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=2QXMNnMraT
	ZH/FnAkc7kgTSbDePKAwMxVAPlh8rzchk=; b=Cpo8CDwzcDTUjocWYca3faQ5Cy
	I13LZH+3+oUHB5ZJBS72lz8vfyqy15ZpSKROgJxIdjDHp9NAT148mPckjrJvYucQ
	QJ4HNPHGfibdLVm5Y3BxIKxiq8oKg+awqzHhhvgIW901OgbvVsHXY/WtU0S7vFj1
	O0WgRc5xdRbBnXHgs=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAntEhK7QRrnDDvAA--.91S2;
	Tue, 24 Nov 2026 09:50:02 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Tue, 24 Nov 2026 09:49:59 +0800
Message-ID: <20261124015002.1426767-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAntEhK7QRrnDDvAA--.91S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ZryUCry8Wry5Xr17tr4fKrg_yoWDuFy5pF
	Z8tr4SyF4kGFWfAryxAF1UC34ruan3GrsrtFy8Ka4UAa13u3yfXr93K3yrWFyUCF93Xa4a
	vFyDW3srGFnrAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x07bY3kNUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREAB2sElFsCDQAqsS

Two USB Type-C receptacles can share one High Speed D+/D- pair if a
multiplexer selects which of them drives the controller.  This series
describes that in the DWC3 binding, adds the endpoint-scoped role-switch
lookup the connectors need, and drives the shared data path from the DWC3
mode worker through the mux controller API.

No runtime testing is claimed for this version: the mux path has not been
exercised on hardware.  The series was reviewed statically and through the
gates listed below.

*** AI-assistance disclosure ***
This series was prepared with the help of an LLM coding assistant.  The
author reviewed every line, checked every quoted claim against the tree,
and ran the gates quoted below; the design decisions and any errors are the
author's.  Each patch carries the same disclosure below its "---"
separator.

Changes in earlier versions (full history)

v4 (2026-10-26) first posted the series: the binding described a private
"port-select-gpios" property and separate High Speed ports per connector
(port@0 and port@2); the driver drove the shared data path through a raw
GPIO from the role-switch callbacks.  v5 (2026-10-31) was a fixup round.

v7 (2026-11-06) reworked both ends:
- binding: the two connectors are two mux'ed data streams of one High Speed
  bus; "port@0" carries two endpoints with "mux-state" 0/1, and the private
  GPIO property is replaced by "mux-controls" (a phandle to a mux
  controller such as "gpio-mux").
- driver: the shared data path is driven through the mux controller API
  (devm_mux_control_get()/mux_control_select()); mux_control_select() may
  sleep, so it is only called from the mode worker.
- usb: roles: role-switch lookup extended to switches attached to a graph
  endpoint, which the two-endpoint binding needs.
v8 (same day) is the same series rebased; v6 was never posted.

v9 (2026-11-17) answered Rob Herring's 2026-11-10 review of the cover:
"port@2" is gone (the second connector is a second endpoint of "port@0"),
"port-select-gpios" is replaced by "mux-controls", the driver uses the mux
controller API, and the board DTS is posted separately.

Changes since v10

1) [Medium, on 3/3] "Should dwc3_role_mux_deselect() be called after the
   switch (dwc->current_dr_role) block tears down the active host or gadget
   instance?"

   Accepted.  dwc3_role_mux_deselect() is now called after that switch
   block, in the same order as __dwc3_set_mode() (host/gadget exit first,
   then the data path switch), and still after
   cancel_work_sync(&dwc->drd_work).

2) [Medium, on 1/3] "Does applying $ref: '#/$defs/hs-port'
   unconditionally to port@0 cause a dtbs_check regression for
   single-connector DWC3 nodes without mux-controls?"

   Accepted, for the shape that v10 posted.  A single-connector node that
   numbers its endpoint ("port@0/endpoint@0" with "reg" only) was rejected
   by the v10 schema with "'usb-role-switch' is a required property" and
   "'mux-state' is a required property".  "port@0" keeps the generic graph
   port at the top level now; the two endpoints, their
   "usb-role-switch"/"mux-state" and the address/size cells are required by
   the "mux-controls" branch of "allOf" only, so single-connector
   controllers are described exactly as before.  An unnumbered
   "port@0/endpoint" of a non-mux controller was not rejected by the v10
   schema either; both shapes pass now.

3) [Low, on 1/3] "should the local $defs be dropped in favor of defining
   the endpoint schema under patternProperties for '^endpoint@[01]$', and
   can the Linux driver implementation details be removed from the
   binding?"

   Accepted.  The endpoint schema is inlined under "port@0" through
   patternProperties, the local "$defs" section and the "$ref" to it are
   gone, and the "mux-controls" branch no longer names driver functions.

Changes since v11

Posting fixes only.  The three patches are byte-identical to v11: the
"diff --git" section of each of 1/3, 2/3 and 3/3 compared with "diff -u"
against the v11 file gives empty output, and applying this series on the
same base (v7.4-rc3 = aebb727447) yields the same file blobs as v11
(snps,dwc3-common.yaml = 7a9cb5a115a6, drd.c = 906cac4f3e6e).

6) [Krzysztof Kozlowski, on v10 1/3, 2026-11-21] "This does not go to
   commit msg, but changelog."

   Adopted.  The AI-assistance disclosure paragraphs no longer sit in the
   commit messages; each of 1/3, 2/3 and 3/3 now carries its disclosure
   below the "---" separator, next to the changelog.  sashiko's [Low] on
   v11 1/3 ("transient AI disclosure left in commit message") is the same
   item; sashiko reported patches 2/3 and 3/3 of v11 with no issues.

7) [Krzysztof Kozlowski, same mail] "...this one even threaded to other
   posting..."

   Adopted.  This series starts a new thread: no In-Reply-To or
   References to the v9/v10 postings.  The v9/v10 Message-IDs for
   reference: v10 cover
   <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>.

8) [Greg Kroah-Hartman, Re: v11 3/3, 2026-11-23] "What about all the
   previous versions?  Please always include them all, right?"

   Adopted.  This cover letter now carries the changelog of every previous
   posting (v4, v5, v7, v8, v9, v10, v11 above); v13 itself only changes
   the cover letter, the three patches are byte-identical to v12.
   Message-IDs for reference: v11 cover
   <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>.

Changes since v13

Sashiko reviewed v13 1/3 on 2026-11-23 and reported three low-severity
binding issues; all three are addressed here and 2/3 and 3/3 are
byte-identical to v13.

 - "mux-controls" now has "maxItems: 1": the shared bus is driven by one
   two-state multiplexer, so the number of mux controllers is not open.
 - Inside the "mux-controls" branch, "port@0" now rejects a plain
   "endpoint" and any "endpoint@2"+; a mux'ed bus has exactly two data
   streams and neither shape was rejected before, because the graph port
   base leaves "unevaluatedProperties" open on purpose.  Single-connector
   controllers keep the generic graph port binding untouched.
 - The "oneOf" that requires opposite "mux-state" values moved into the
   "mux-controls" branch.  Outside it, both alternatives matched whenever
   "mux-state" was absent (JSON Schema evaluates "properties" of a missing
   property as true), so a two-endpoint tree without "mux-controls" was
   rejected.  The now redundant "dependentRequired" and "mux-controls:
   false" are gone.

Gate notes for this version: G1/G2/G4/G5 were re-run on the same base
(aebb727447 = v7.4-rc3); G6 gained two negative samples (plain "endpoint"
and "endpoint@2" under a mux), both rejected here and accepted by the v13
schema, plus a positive two-endpoint tree without "mux-controls" that the
v13 schema rejected.  G3 was not re-run: 2/3 and 3/3 are byte-identical
and 1/3 only touches the binding.

Known gaps (stated so that nobody has to guess)

- Which physical receptacle corresponds to mux state 0 and which to 1 is not
  proven on hardware yet; the board DTS therefore names them "Receptacle A"
  and "Receptacle B" and does not claim long/short edge.
- "gpio-mux" drives the select lines low in probe
  (devm_gpiod_get_array(dev, "mux", GPIOD_OUT_LOW)), so the level left by
  the firmware is not preserved.  "idle-state" is deliberately omitted: a
  non-AS_IS idle state would drive the wrong state between
  mux_control_deselect() and the following mux_control_select().  Making the
  probe keep the pin as is (GPIOD_ASIS) is a change to drivers/mux/gpio.c and
  affects the ~70 existing gpio-mux users, so it does not belong in this
  series; it needs a separate discussion with the mux maintainer.
- dtbs_check cannot see "idle-state" values: gpio-mux.yaml declares it
  without a type or bounds, so an out-of-range value is only rejected at
  probe time.  The gate below therefore does not claim coverage for it.
- The board DTS is not part of this posting: the Lenovo Legion Y700 Gen 4
  file is not upstream yet and is posted with its own board series.

Gate results (base: v7.4-rc3 = aebb7274476403040d582c61478df8f4a7bf9cd3)

  G1 apply       git apply --check + apply on a pristine check-out of the
                 base above: 3/3 clean, rc=0, no offset/fuzz; resulting
                 blobs snps,dwc3-common.yaml = 7a9cb5a115a6,
                 drd.c = 906cac4f3e6e
  G2 checkpatch  perl scripts/checkpatch.pl --strict --no-signoff --no-tree
                 1/3 0E/0W/0C (115 lines) ; 2/3 0E/0W/0C (63 lines)
                 3/3 0E/0W/0C (624 lines)
  G3 build       make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- W=1
                 drivers/usb/dwc3/ drivers/usb/roles/
                 (CONFIG_MULTIPLEXER=y, CONFIG_USB_ROLE_SWITCH=y)
                 rc=0, 0 warnings, 22 objects (21 dwc3 + 1 roles), all
                 aarch64 relocatables
  G4 binding     make ARCH=arm64 dt_binding_check   (no DT_SCHEMA_FILES)
                 rc=0, no diagnostics; 5420 example DTC [C]
  G5 dtbs_check  make ARCH=arm64 CHECK_DTBS=1 qcom/sm8250-mtp.dtb
                 qcom/sm8650-mtp.dtb qcom/sm8750-mtp.dtb qcom/sm8750-qrd.dtb
                 (no DT_SCHEMA_FILES)
                 patched: 4/4 DTC [C], 0 diagnostics
                 base:    4/4 DTC [C], 0 diagnostics  => 0 new
  G6 samples     dt-validate on the rebuilt schema bundle
                 positive, 0 complaints each:
                   two endpoints, opposite mux-state, dr_mode = "otg"
                   same, with dr_mode omitted (usb-drd.yaml default)
                   single connector, plain "port@0/endpoint", no mux
                   single connector, "port@0/endpoint@0" without role props
                 negatives, all rejected:
                   same mux-state on both endpoints
                   endpoint@1 missing
                   endpoint@1 without usb-role-switch/mux-state
                   mux-controls with dr_mode = "host"
                 control: the v10 schema bundle rejects the two shapes of
                 items 2 and 4 above, the v11 bundle accepts them.
  G7 hardware    not run

  On the command shapes: DT_SCHEMA_FILES is intentionally not used for
  dtbs_check.  It is passed to dt-validate as "-l", which only keeps schemas
  whose $id matches and that still select a node themselves;
  snps,dwc3-common.yaml is a fragment without "select:", so the run reports
  nothing and looks green.  The dtbs_check rule also ends with "|| true", so
  the result is read from the diagnostics in the output, not from the exit
  status.

Qianhui Xu (3):
  dt-bindings: usb: snps,dwc3: describe two connectors on one HS data
    bus
  usb: roles: look up role switches attached to a graph endpoint
  usb: dwc3: select the shared HS data bus with a mux controller

 .../devicetree/bindings/usb/snps,dwc3-common.yaml  |  99 ++++++
 drivers/usb/roles/class.c                          |  45 +++
 drivers/usb/dwc3/core.c                            | 116 +++++++
 drivers/usb/dwc3/core.h                            |  43 +++
 drivers/usb/dwc3/debugfs.c                         |   4 
 drivers/usb/dwc3/drd.c                             | 329 ++++++++++++++++++++
 6 files changed, 632 insertions(+), 4 deletions(-)

-- 
2.53.0

