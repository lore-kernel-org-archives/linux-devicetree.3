Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670465;
	b=vHiByQi21HYW+2TDlXD2/dQ8o4nhHZoPxY1rrWNEzJbWL0dDuM49WHGEu78GmNMSkyqG
	 QnfFAZpl7MdTYmZefxOiX96bqa03j+6umyJFjhP2Pv0AosfPz5MoRt/zp0Vhs/sYL1ycv
	 7SrlTepU6itryhW0iU8i2C0wh+pp8xz1KdVdlF/2mqSRTa3UHkt0bwU0QR4+m2eJ/uWxg
	 3wbrg71OuA7PcVEoQpZz18UmY6Dm+mFN4jIe+srYDP7SkPqMdNLGVhAGI0uqOJxFEY3SQ
	 Vy2e8AOC0wHQXHXi2Q2bDdzY1iHawg6/lxPfxgbMgtovdJ9LIlv6oN1MT7iuSK2Ndww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670465;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=i4762jOeHlCSAIcmorXRFyKGYrNpR7A6pImQM55ZY54=;
	b=b4Q5Dn33rIncSPBESMDnjqKQJuCzGBTTKYvkDiClTuGlajxbTVZ0rOfnXBym2ewfKsYe
	 AOvmt1+x+BJ2ExlSU0Nix8Neank40Qxg10/WfOFYqGQsxMxgm8q1iqzz2Ixv7e6XstoiU
	 VQKF+vDori2RzJtHMrhzN/76X+dxZ+eaRwQSxbpXsFgcG1oaSr1dypd3Hf4jClFh3CpoU
	 eFZcXr4HuTN3HUERSYhC5JC8w7tPdPFQj7+65AXD7aWdhvl4stsbbinRi4dvKaQCbiYiT
	 NtJErOYejFLIkJ27ejb3gySCWaaM91npGxoW07bSaqXnQx0mPqibZ/2CwWw5o9pW93g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=wCtoBnsd;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0445A606A321;
	Thu, 26 Nov 2026 05:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0445A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=wCtoBnsd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=i4762jOeHl
	CSAIcmorXRFyKGYrNpR7A6pImQM55ZY54=; b=wCtoBnsdoM6shlmKX45S09h0B3
	1vy87tv5nlFTIOpVUgjVOJc8iYV2OGrKlinmTNJpZU5M8KeNnH21OncDz4e6IbKG
	bjUCoQBauNCxO5jA7K7gzNq5zQ+8Lnmm9ZSG7UtKgKCpYjkXVeQ/M3VyZhqGamGT
	z7D4hC3GlohUHD6FY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.120])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHNSq5wQdreQ77AA--.266S2;
	Thu, 26 Nov 2026 13:20:57 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/2] arm64: dts: qcom: sm8750-lenovo-elden: add the Lenovo Legion Y700 Gen4
Date: Thu, 26 Nov 2026 13:20:55 +0800
Message-ID: <20261126052057.1544590-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgDHNSq5wQdreQ77AA--.266S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4kZFyDCry3uFW8CFW8Xrb_yoWxtry8pF
	Z8GrZ7Gr1kKryxtw4Igr1xX34fuF4kJF45JF1vyryUAan8JFZ7trsayw15uFyUC3s3Crn0
	yF15Cr1rCFn5X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5-VyDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQA7sG

Adds the device tree for the Lenovo Legion Y700 Gen4 (TB322FC), an SM8750
tablet, and the board compatible it needs.

v10 changes one thing: the camera PMIC on i2c10 now describes its inputs.
1/2 is unchanged since v8 and needs no re-review.

Waiting on bindings
===================
2/2 waits on willsemi,wl2868c
  Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
  Landed as 84e67d2ee13f (binding) and 602f57223457 (driver) in
  regulator.git for-7.5; not in v7.4-rc3, the base of this series.
  Merge order: 1/2 has no dependency and can be applied right away, 2/2
  only after the binding is in the tree.  Taking 1/2 now and 2/2 after
  7.5-rc1 is fine with me and needs no repost.

  Cost of taking 2/2 early, measured on v7.4-rc3: with the binding applied
  on top, dtbs_check reports 0 diagnostics for this board; without it,
  exactly one, "failed to match any schema with compatible:
  ['willsemi,wl2868c']" on pmic@2f.

The two patches
===============
1/2 documents "lenovo,elden" in the Qualcomm board binding.  Without that
line dtbs_check rejects the board's root node, so a tree that builds still
fails validation; it is the line v7 forgot.  Unchanged since v8.

2/2 is the board itself, in one commit as asked in the v6 review:
compatible, chassis type, the GPIO ranges the boot firmware reserves, the
board clocks the SM8750 dtsi consumes, and the WL2868C camera PMIC on
i2c10 with the voltages the stock firmware programs.

What v10 changes in 2/2
=======================
The WL2868C node declared no input supply although this board drives six
of its seven outputs, which the binding only allows for inputs whose
outputs are unused.  It now declares them:

	vin12-supply = <&wl2868c_vsys>;
	vin34-supply = <&wl2868c_vsys>;
	vin5-supply  = <&wl2868c_vsys>;
	vin7-supply  = <&wl2868c_vsys>;

All four point at the same fixed regulator that vsys-supply already used.
That is not a shortcut: the four LDO inputs and the VSYS pin of this chip
are fed from the tablet's always-on system rail, and that rail is modelled
once, as a regulator-fixed without voltage constraints, because the SPMI
PMICs that generate it are not described yet.  When they are, the rail and
these properties move to the real regulator in one step, exactly as
vsys-supply will.  Declaring the same supply phandle for several inputs of
one chip is the shape the isl9305 binding has used for years
(Documentation/devicetree/bindings/regulator/isl9305.txt: VINDCD1-supply,
VINDCD2-supply, VINLDO1-supply and VINLDO2-supply all point at
&system_power).

VIN6 is not declared, in line with LDO6 being not wired out on this board;
the LDO6 node is absent too, as in v9.

Note what this does and does not change at runtime.  The driver only
enables the control supply (vsys, falling back to vin7), so the board
already worked with the inputs undeclared: the regulator core substitutes
a dummy supply for an undeclared input and nothing fails.  What the
properties change is the description: the DT now records where the LDO
inputs come from instead of leaving that unstated.

Review response: v9 2/2
=======================
sashiko posted three [Medium] notes against v9 2/2, all three answered
here; only the third one needed a change.

1. "missing willsemi,wl2868c binding schema in target tree"
   True of the base, and deliberate: the binding is 84e67d2ee13f in
   regulator.git for-7.5 and arrives with the 7.5 merge window.  The
   dependency and the merge order are at the top of this letter; nothing
   in this series can change it.

2. "missing core boot and power nodes in sm8750-lenovo-elden.dts"
   Correct, and out of scope: the SPMI PMICs, the RPMh regulators and the
   console are the "not described, not claimed" part of this board, as
   stated since v6.  This series adds the board skeleton and the camera
   PMIC; a tree with this applied builds and validates but boots nothing
   by itself.

3. "missing vin*-supply properties on pmic@2f for active LDOs"
   Accepted, fixed in v10: see "What v10 changes in 2/2".  LDO1, LDO2
   (VIN12), LDO3, LDO4 (VIN34), LDO5 (VIN5) and LDO7 (VIN7) are all used
   by this board, so all four inputs are now declared.  The binding keeps
   them optional because they need not be described when the outputs they
   feed are unused, which is not this board's case.

Not described, not claimed
==========================
Wi-Fi/Bluetooth, camera sensors, ADSP sensors, audio, USB Type-C.  Neither
the SPMI PMICs, the RPMh regulators nor the console are described, so this
board description boots nothing by itself; that is the v6 comment, still
true and not addressed here.

Checks: v7.4-rc3 (aebb727447) worktree, 2026-11-26
==================================================
- git apply 1/2, 2/2: clean, no offset, no fuzz; git am on the same base:
  both commits applied, resulting blobs equal the patch "index" lines
  (qcom.yaml a32cfb30a1, Makefile e0b65a36c5, board file d8e9ab1272).
- checkpatch.pl --strict --no-signoff: 1/2 and 2/2 both 0 errors 0
  warnings 0 checks.
- dtbs_check with CHECK_DTBS=1 on sm8750-lenovo-elden, sm8750-mtp and
  sm8750-qrd, with the willsemi,wl2868c binding applied: three builds,
  0 diagnostics for all three, the board included.
- DTB of the board differs from v9's only in the five supply properties
  and the regulator comment: both DTBs decompiled and diffed.
- No boot claim: the tablet runs a vendor 7.3 kernel and this tree was not
  booted on it.

Disclosure: prepared with an LLM coding assistant; the trees, the checks
and every number in this letter were run and read by the author, who is
responsible for the content.

Qianhui Xu
---

Changes since v9
 (v9: https://lore.kernel.org/all/20261126002157.1954799-1-xiaqinghuan@mail.ustc.edu.cn/)
- 2/2 declares the camera PMIC inputs now: vin12-supply, vin34-supply,
  vin5-supply and vin7-supply, all pointing at the always-on system rail
  that vsys-supply already used, plus a comment saying which pins that
  rail feeds.  Reported against v9 2/2: "missing vin*-supply properties on
  pmic@2f for active LDOs".  Why the four share one phandle, and what it
  does and does not change at runtime, is in "What v10 changes in 2/2".
- The letter answers the other two [Medium] notes of that review (binding
  absent from the base tree, boot/power nodes absent) in "Review
  response", and keeps the "Waiting on bindings" section Krzysztof asked
  for in v8.
- Nothing else changed: 1/2 is unchanged since v8 and needs no re-review;
  2/2's compatible, clocks, LDO voltages and reserved GPIO ranges are
  unchanged since v9.

Qianhui Xu (2):
  dt-bindings: arm: qcom: document the Lenovo Legion Y700 Gen4
  arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a
    Qualcomm SM8750-based tablet

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

-- 
2.53.0

