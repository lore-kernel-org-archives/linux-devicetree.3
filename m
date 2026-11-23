Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427608;
	b=SoaffUCDGLkePurSbCM7LSX0I7sNRbctH1eehPcwD27MLiWE1RaOfqMW2xfSlAZS774u
	 /ftL81Ly/bTRLsx6h2yGDjnetMRTkR1V9x+qki2EokjwKguO/q9QY1xxuNYycx+Oi6P67
	 FPwvSJ5CWpBv3D3eetXF7Enk4GpKU4j/dhM4gnloNZBxAyV4vahKP+VwZDcKfMN1Yrhaj
	 EJAMihL2BOis+Rhl9Pn52K8lSWrD53uxviXE9Nu21AP14yX9wAkyycvrUN8xEUoHYcEIm
	 0EqdnutG98q8SvP80qD1BDuTvfkRV4QozNWoMQr+AUArdhsDy3FhgaGMs+pLG4Qqnkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427608;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=uMxDvwsfRcmKMcL3ZZzOBU7hJ1mhHdDwh44B3M6UKCI=;
	b=Rp0+iQayJtsl032u0pgkr9GVk3c7aXCfRtKn+xSvVByOWYblJPS+m5c2dXPw7VZlvwQu
	 mrjIqMlcpnAknoaqLHDhiWY7GYzu7KnC5UyZQvuIUXVStAEJ9oyLJMaEz/Sb/1ulWzHus
	 /DM8zPtXqOqO+SnkmHVMLsJ/accVNiSKs85h/y0Fqd0PU9eQWkmjDRmi4iOpEMQAQuxGd
	 Bf7f6+mGR48GQbYX5CeP17LTVI0xQMcWG2R54JaoptrpgONqHJwfYKKmE6xDDTLURiRb0
	 F8HZvuciZXmnWJJY59//TkFM2xThPguuaaesG7sAkO69LGKzozTikJVFFQtCKNX/OBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=vhkzNFaF;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBF4606A31A;
	Mon, 23 Nov 2026 09:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=vhkzNFaF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=uMxDvwsfRc
	mKMcL3ZZzOBU7hJ1mhHdDwh44B3M6UKCI=; b=vhkzNFaF95Gs35KBm05vLEp0hg
	pbe8LiK6ItBfF5n6p9j0bief+vA1Gt9HJ+Ol2/C7B2AqrowzJdaeUo4ikKRbjwKX
	z8pqz61WG7gmIemvQdprMLPw12s/mjtiNi4IwG/8x3N+NUpZ0yKlHOz+jWDoUdhb
	NZCydFKUuK5HdlNw0=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3KzAGDQRrr9vrAA--.766S2;
	Mon, 23 Nov 2026 17:53:10 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Mon, 23 Nov 2026 17:53:06 +0800
Message-ID: <20261123095310.154352-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3KzAGDQRrr9vrAA--.766S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JrWxXFW5XF1xWr1UKw4kZwb_yoW3KryDpF
	Z8tw1SyF4kJryfAryxA3WUG34ruan3GrZxtFyUK34UAanxuayfXrZ3K3y5XFyUGr93Xa4a
	vFyDG34UCFsrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU5XVyDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREAB2sDQttJXQBQsi

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

Changes since v10

1) [Medium, on 3/3] "Should dwc3_role_mux_deselect() be called after the
   switch (dwc->current_dr_role) block tears down the active host or gadget
   instance?"

   Accepted.  Deselecting first moves the shared High Speed lines back to
   the mux' idle state while the host or gadget instance that owns them is
   still running.  dwc3_role_mux_deselect() is now called after that switch
   block, i.e. in the same order as __dwc3_set_mode() (host/gadget exit
   first, then the data path switch), and still after
   cancel_work_sync(&dwc->drd_work).

2) [Medium, on 1/3] "Does applying $ref: '#/$defs/hs-port'
   unconditionally to port@0 cause a dtbs_check regression for
   single-connector DWC3 nodes without mux-controls?"

   Accepted, for the shape that v10 posted.  Reproduced with the v10 schema
   bundle: a single-connector node that numbers its endpoint
   ("port@0/endpoint@0" with "reg" only) was rejected with
   "'usb-role-switch' is a required property" and "'mux-state' is a required
   property".  "port@0" keeps the generic graph port at the top level now;
   the two endpoints, their "usb-role-switch"/"mux-state" and the
   address/size cells are required by the "mux-controls" branch of "allOf"
   only, so single-connector controllers are described exactly as before.

   One half of the report did not reproduce: an unnumbered
   "port@0/endpoint" of a non-mux controller was not rejected by the v10
   schema either, because graph.yaml#/$defs/port-base does declare
   "endpoint".  Only the numbered-endpoint shape regressed; both shapes pass
   now.

3) [Low, on 1/3] "should the local $defs be dropped in favor of defining
   the endpoint schema under patternProperties for '^endpoint@[01]$', and
   can the Linux driver implementation details be removed from the
   binding?"

   Accepted.  The endpoint schema is inlined under "port@0" through
   patternProperties, the local "$defs" section and the "$ref" to it are
   gone, and the "mux-controls" branch no longer names driver functions: it
   only states what the device tree must contain.

4) [Low, on 1/3] "Does listing dr_mode in required reject DWC3 nodes with
   mux-controls that omit dr_mode to rely on the default 'otg' mode from
   usb-drd.yaml?"

   Accepted, and reproduced against the v10 schema bundle ("'dr_mode' is a
   required property").  "dr_mode" is no longer listed in "required"; it
   stays "const: otg" when present, so "host" and "peripheral" are still
   rejected.

5) Unchanged: 2/3 (usb: roles: look up role switches attached to a graph
   endpoint).  It got no review comment and is byte-identical to v10.

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
   reference: v10 cover <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>,
   v11 cover <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>.

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

