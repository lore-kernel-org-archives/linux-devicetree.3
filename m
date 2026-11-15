Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794720544;
	b=Yq440zOQmrAweZ1CLZDvRR0RBTbXQaRl61mpZ7fL7iZQL9NyiDyX9TVgxq0vxLpU6uCa
	 eDH4EDxrZTPgxU9sGIdx0VHxn0N9uAXmKuUmbNBk917jiLz0WlhPEAS/I/WjO0Zjpg30S
	 1zn4gszeUgQRWxzWMzNrs5FbN6KXF1KDJenSXGUecUAuFwQ3af6BbH4gkf3NLkbYWD7nl
	 jcivU3rP6xzAuPgYqg0ZWGFOC/tXGitLHzU6vH/oune9NTYPGT0y5PpthJz6We3gL6Sm0
	 VsyUOW42cBqI6GGffJCCfQQJrDi4inH6/LYIPoykDz1R4Xaewq97VBNkit2KZN6aiig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794720544;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=LS6LmYxoEV+oZoThkbdbahRxFBMWXdWbBypmIrtzAwI=;
	b=z0ccS3g602ljdPAOcJiiGqT2Hc6EGnsfzOF6gtoAIEIngpbcNzucGuGnfDXGOuvUlxBg
	 8jf/DjyhXjLX6pXWMh/Xf6T3NmFR2S01+eCcaDvrVUOXeDANZM3+ICy2nPXinEtiSzkOV
	 3urNjdt3u8vn8OZIy5j7bcorLuVWQGGFUeeNm6nkP4MPLwME83/eqlBnSzEub8ExbjQOO
	 E4nOEwsGD2G6fwHTikJUfsnZMk1rmaqJ2Dex7EGYyoC1UOSXa9ltQkVZrlPLCos94jqCX
	 kJa7AtSm4PF+swtTQKVjRpg+ElGRp6e864KptJPKKIPFjx4MCo+OyGffhzWo+0yXAtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SFIyjy+s;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4C4606A323;
	Sun, 15 Nov 2026 05:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SFIyjy+s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LS6LmYxoEV+oZoThkbdbahRxFBMWXdWbBypmIrtzAwI=; b=SFIyjy+sZV3g+
	qqsZ49z7FNqO7H8SeQsU7K3azF1VYX32VpnoxseVt4yRn7s5Zm2x9tY0c8BsQPpO
	pCCPrs/C/yM2mDVxMkJQzzaDErgzNBOWS1BZdSj0O/bGcmsWlVrdPMcOMGp/DXN9
	s141Dlcp/hfgzEuByqs4FTob73IGrs=
Received: from [127.0.1.1] (unknown [114.214.190.248])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBX5EgYQ_lqx1rBAA--.168S2;
	Sun, 15 Nov 2026 13:28:58 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [RFC] phy: qcom: mipi-csi2-3ph: SM8750 ships CSIPHY 2.4.0 lane table
 - preferred shape?
Date: Sun, 15 Nov 2026 13:28:56 +0800
Message-ID: <179472053649.14538.1565870277822789081@mail.ustc.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgBX5EgYQ_lqx1rBAA--.168S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryUZw1UtrWrWr4furW8tFb_yoW5Gryfpa
	yFgFyrCr1kJr4v9rZayw1xtrWS9wsak3y5AF48t347Aa1DX3W7tryaq34qkr98Ar4rAw47
	tF4jqF1fXr4jyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8WwCF04k20xvY
	0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5l2MUUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREKB2r2E9lQAwAQsI

Hi Bryan,

SM8750 (Lenovo TB322FC, mainline bring-up) carries a CSIPHY whose vendor driver
describes its lane table as csiphy_2ph_v2_4_0_reg. Upstream's lane_regs_x1e80100[]
in phy-qcom-mipi-csi2-3ph-dphy.c is the 2.1.2 generation, so the two differ.
Before sending anything I'd like your preference on the shape.

What I measured (vendor camera_dlkm module, unstripped; 103-entry table, 1648 B):

  - address set identical, 103/103; (addr, data, param_type) differs in 13 entries
  - 0x0000/0x0400/0x0800/0x0c00 : 0x8e -> 0x8c          (DEFAULT, 4)
  - 0x0008/0x0408/0x0808/0x0c08/0x0e08 : 0x10 -> 0x19    (SETTLE_CNT_LOWER_BYTE, 5)
  - 0x0060/0x0460/0x0860/0x0c60 : 0xbd -> 0xfd          (SKEW_CAL, 4)

Those three values also track the vendor's own generation numbering across every
2ph table in that module: v2.1.x = (8e,10,bd), v2.2.x = (8e,19,bd),
v2.3.0/2.4.0/2.4.1 = (8c,19,fd). So they look like generation markers rather than
per-SoC tuning.

One thing worth stating up front, because it bounds what the patch can claim:
in phy_qcom_mipi_csi2_gen2_config_lanes() the SETTLE entries are overwritten with the
value computed from the link frequency, and SKEW entries are skipped (still
"TODO: support application of skew from dt flag"). Only the four 0x0000 writes
(0x8c) actually change behaviour today.

Questions:

1) Shape: a new lane_regs_sm8750[] plus a mipi_csi2_dphy_3nm_sm8750 soc cfg
   (compatible "qcom,sm8750-csi2-phy" with "qcom,kaanapali-csi2-phy" as fallback),
   or would you rather see the difference expressed per generation
   (e.g. lane_regs_2_4_0[] shared by any future SoC on that generation)?

2) Evidence level: with only one SM8750 unit I can measure a 30 fps capture
   regression, nothing more. Is "matches the vendor table for that generation"
   an acceptable justification for the 0x0000 value change, or do you want the
   SETTLE/SKEW entries dropped from the table until the driver actually applies
   them (so the patch carries no dead data)?

3) Binding: standalone "qcom,sm8750-csi2-phy" const vs. an items entry with the
   kaanapali fallback. I see a kaanapali series in flight touching the same oneOf,
   so I'd rather follow whatever shape that series lands with.

I have a two-patch draft ready (binding + driver) that applies on 7.4-rc3 and passes
checkpatch --strict, W=1 and dt_binding_check; I'll hold it until you answer.

Disclosure: this mail was written with AI assistance; the author reviewed and
verified every statement, and all measurements and decisions are the author's.

Thanks,
Qianhui Xu

