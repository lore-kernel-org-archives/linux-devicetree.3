Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432153;
	b=lCcyvwu+/C8UkmEk/JuLUzoks8FCErRjA8v0Gn09xyc6vzXf8wKxhYpOXvnpihJ6Rqiv
	 gzyE1CTdQmO0weA3IbK6GbEc7iwoE5lqgbGtBDCBIpCiCAYkbZA7tjuhyJp/Vh+r1FvCq
	 rmEKJ7Rk1OP05BaGAiPP768rAwZ+pN4j6hlqZDckgiyTi1w1ULqdizumCMD3ocQ+YSeob
	 Lar8Q3ChvsCjwalWJNM6mq3rg0OAEGjrwScKmxw89vPhMGQRfLkYu7ib1lk4pOpGCJUGm
	 q75d2drVxkr/VC3R30+e5robsOjoS7+c0KLlJ41NftBeD2vtXYQpJCVRg/J1DfkKMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432153;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=RmwRTpJQJf1F9NP0wtsHBkc8/jzJ2if8ZxbgAhsMKqo=;
	b=hK+Hg/SyJgbbgN0noyQ10paFvRamp9eEpkT+hoh8g141PxfDyBCB8d7VbhW7JrNlf0mO
	 zDyXxJrpKeHlR4B9524JFn72RsBVh+ntl+kwdvsbE9Z57qhnbAlKfAfj92zMNi2fp+uIr
	 E5DT5ut1py2nsxl1hJdG/CyaAYoVty8jRDH7TqcO6LAolUADkfGSdy4YrftP+Mv44LRo0
	 +fHNv4IqJBPFOlI6TWa8WpPOXOQQSsxvD+ElZLOXQvb3vi8XzxND7b9YDacUQ11gDejuz
	 J/dX6+IP6famnouuwkns2JTwlUK92ocDR8/hyL+5ZMjARTrZAV+gpak4zeA7BlmW+Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qZ8Y69jp;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114FD606A327;
	Mon, 23 Nov 2026 11:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qZ8Y69jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=RmwRTpJQJf
	1F9NP0wtsHBkc8/jzJ2if8ZxbgAhsMKqo=; b=qZ8Y69jpOrJYxneI6UZnaMyZgs
	lQ+uVsi/oV19zN2h5u8GkELtAVOinMHwPdo23rwOjAgvblIS/2Rs2KC04LrfwdF6
	1j7wL5DG+GV+KTuNLOXpe/S9mtpDdJkEOJPZRlXLUqPr5GwXd/fx2URxMgsqWGRh
	l1BCtDcoiR3uEaQAs=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCH9yvKHgRrRSLsAA--.2408S2;
	Mon, 23 Nov 2026 19:08:58 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Mon, 23 Nov 2026 19:08:55 +0800
Message-ID: <20261123110858.538884-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCH9yvKHgRrRSLsAA--.2408S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JrWxXFW5XF1xXFWDJr4Utwb_yoWfCFyUpF
	Z8t3yayF4kGrWfAr1xA3WUC34ruan3GFsrtFyUKa4UA3W3uayfXr93K3yrWFyUCF93Xa4Y
	vFyDW34UCFsrAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU5pT5tUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREAB2sDQttdngBbs+

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

