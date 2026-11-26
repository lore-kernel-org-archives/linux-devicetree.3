Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652536;
	b=XdgNBU1z5h6qoTq0uomjucG5Trj4ePuW2nHIDSl87zLdX05xsdpWtrpitZ8fIxSRNa6a
	 UR2KuRPQQQnI6cbIVt1qGawJieaI8EJ7CTaNlEquTGECB58uvEJTgNtZHSK4jYG+ZY1KV
	 pbslaZSLsbadItfz/7gCcOOKDUvBd2w3hu9eyKHZ57KsXnFOnZjprU6lt1zlDUYcjj8Tl
	 uFGNMoJGD7lsHDRmlaqsKj9yk7OT1SZQ7rKp9SuHZ0XmA9ONCkIW0+AE4TUJvkKjvf79Y
	 N2K/3lx7DJbtTWhQzGiSmAohDBcRswgl09+/gs+G8Qyqn37FrBSov1q7vhYQGbm+5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652536;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=i5PbccdGZMDe1Z6+BcEaC6Vrjcw7rwsr6ATyclxsFg4=;
	b=VvsEh/cs4oPgKBxCyxL6fgQtFAYWPVBu59WNON8PcVq7kd+6kEif5Z3pyMvdJ0+Vr7L5
	 1kXNT0GlIMpVzpc3CzfVIaIxWLUr+H4zjjfJWuvLEkDPOZbLfkdoiFn5QohKGjFMoCYN7
	 2zppN6rrZ45yHvOTE77gKmI9CY2oY+AJICxnAHkU5g88bXY9k6viFiwnIG8xJjj5alhQf
	 /9Ie3RgBau10zZs8HgLR00fjQvdd+CEFVqYIo8FOfejwp7ZVyhYALMWNeYKOVRnvVrht+
	 D0LRXaRVKKpmgk1MBxRiJvs8lIeqQNoPEYe51mO5n4eC8YhPBmWDRGAWjJDVksTBvZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=p2jbjyZ5;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1444606A31E;
	Thu, 26 Nov 2026 00:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1444606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=p2jbjyZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=i5PbccdGZM
	De1Z6+BcEaC6Vrjcw7rwsr6ATyclxsFg4=; b=p2jbjyZ5JnmjKCgBmnYLiFfIYB
	suUb0urQq4YTH/g6GnkIYb4wklnKXBmu76ZnHxK7dNH3cW+HrUXTcv+APphqUJGS
	EiKLGG93nARDptc8kraPa1jcWxR2XnxKfIJvz6ZWv7ZkUYeEATpQKI4FvXsV5I7a
	0OajjbAg6YyiwKWAY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.181.84])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnnzOmewdrvLr5AA--.1516S2;
	Thu, 26 Nov 2026 08:22:00 +0800 (CST)
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
Subject: [PATCH v9 0/2] arm64: dts: qcom: sm8750-lenovo-elden: add the Lenovo Legion Y700 Gen4
Date: Thu, 26 Nov 2026 08:21:55 +0800
Message-ID: <20261126002157.1954799-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAnnzOmewdrvLr5AA--.1516S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4UKryfCr18uFyrZw1DKFg_yoW7XFW7pF
	WDtrZ7ArykKryxGw4xJr1Iq345Zrn5Jr45Jr1kJ34UAF45XFyxtrsIva15uFyUuryku3W5
	tFnxuwn0kF1kX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6w1l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07brMa5UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARECB2sGHiAuFQA0sJ

Adds the device tree for the Lenovo Legion Y700 Gen4 (TB322FC), an SM8750
tablet, and the board compatible it needs.  The device tree is byte for
byte the one posted as v7 and v8; v9 changes this letter and the changelog
of 2/2, nothing else.

Waiting on bindings
===================
Stated up front, as requested:

  2/2 waits on willsemi,wl2868c
    Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
    Landed as 84e67d2ee13f (binding) and 602f57223457 (driver) in
    regulator.git for-7.5; not in v7.4-rc3, the base of this series.  It
    appears in mainline with the 7.5 merge window.

  Merge order
    1/2 (arm/qcom.yaml) has no dependency and can be applied right away.
    2/2 only after the binding above is in the tree.  Taking 1/2 now and
    2/2 after 7.5-rc1 is fine with me and needs no repost.

  Cost of taking 2/2 early
    Measured on v7.4-rc3, not assumed: with the binding applied on top,
    dtbs_check reports 0 diagnostics for this board; without it, exactly
    one, from that compatible:

      sm8750-lenovo-elden.dtb: /soc@0/geniqup@8c0000/i2c@888000/pmic@2f:
      failed to match any schema with compatible: ['willsemi,wl2868c']

The USB Type-C receptacles are not part of this series for the same
reason: they wait on another binding, which is in review and not merged:

  [PATCH v16 0/3] usb: dwc3: support two connectors sharing one HS data bus
  https://lore.kernel.org/linux-usb/20261125142309.3265777-1-xiaqinghuan@mail.ustc.edu.cn/

The two patches
===============
1/2 documents "lenovo,elden" in the Qualcomm board binding.  Without that
line dtbs_check rejects the board's root node, so a tree that builds still
fails validation; it is the line v7 forgot.
2/2 is the board itself, in one commit as asked in the v6 review:
compatible, chassis type, the GPIO ranges the boot firmware reserves, the
board clocks the SM8750 dtsi consumes, and the WL2868C camera PMIC on
i2c10 with the voltages the stock firmware programs.

Relation to Pengyu Luo's posting
================================
The board file was posted by Pengyu Luo in July ("[PATCH v2 0/2] Introduce
Lenovo Legion Y700 Gen4"), which is at changes-requested with no v3.  We
agreed on 2026-10-25 that I send it, with him in the loop, so this
supersedes his v2.  The line in 1/2 is his: say which trailer form is
wanted and I will add it (Co-developed-by needs his Signed-off-by too).

Not described, not claimed
==========================
Wi-Fi/Bluetooth, camera sensors, ADSP sensors, audio, USB Type-C.  Neither
the SPMI PMICs, the RPMh regulators nor the console are described, so this
board description boots nothing by itself; that is the v6 comment, still
true and not addressed here.

Checks: v7.4-rc3 (aebb727447) worktree, 2026-11-26
==================================================
- git apply 1/2, 2/2: clean, no offset, no fuzz; resulting blobs equal the
  patch "index" lines (qcom.yaml a32cfb30a1, Makefile e0b65a36c5, board
  file 73f4452f46).
- checkpatch.pl --strict --no-signoff: 1/2 0 errors 0 warnings 0 checks;
  2/2 0 errors 1 warning 0 checks, the warning being the new-file
  "does MAINTAINERS need updating?" prompt.
- dt_binding_check, full tree: rc=0, no lint/style errors (5420 schemas)
  and no output for arm/qcom.yaml.
- dtbs_check with CHECK_DTBS=1 on sm8750-lenovo-elden, sm8750-mtp and
  sm8750-qrd: three builds; diagnostics 1 / 0 / 0, and 0 for the board
  once the willsemi,wl2868c binding above is applied.
- No boot claim: the tablet runs a vendor 7.3 kernel and this tree was not
  booted on it.

Disclosure: prepared with an LLM coding assistant; the trees, the checks
and every number in this letter were run and read by the author, who is
responsible for the content.

Qianhui Xu
---
Changes since v8
 (v8: https://lore.kernel.org/all/20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn/)
- The letter now says "this series waits on bindings" explicitly, on its
  own section, and names them: willsemi,wl2868c, its file, the commits it
  landed as, which tree, and the merge order for 1/2 and 2/2.  The rest of
  the letter is cut accordingly (Krzysztof: "should be explicit about
  waiting on bindings, instead of wall of text").
- 2/2's changelog says the same thing on the patch itself.
- 2/2 also answers the two [Medium] notes sashiko posted against v8 2/2:
  the willsemi,wl2868c schema is the binding above (it arrives with 7.5 and
  needs nothing from this series), and the absent SPMI PMIC / RPMh
  regulators / console / storage nodes are the "not described" section of
  this letter, as in v6 - out of scope here.
- No diff change: 1/2 is unchanged since v8 and 2/2's diff is
  byte-identical to v7 and v8 (cmp on the "diff --git" section).

Qianhui Xu (2):
  dt-bindings: arm: qcom: document the Lenovo Legion Y700 Gen4
  arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a
    Qualcomm SM8750-based tablet

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 129 +++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

-- 
2.53.0

