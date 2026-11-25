Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597999;
	b=UkfIU15WFAD0fhH4ft1DjVGi5HZtziFBI+zw7yCbgIJVbefmQV6kH1j9qboggxsA0R5P
	 lUQE+LjBzIdzoltJMFf1+lO+3bD/gAQJbRX4BjRKfnbk+Qe5ba0n+HM+a21S60H6KYoWc
	 ifLeaBfGuIVTJto3RH7eXRsJkGY7BMRxuyMd2yeQ48c/8+2IX2acQeOTFaKKbXARrxwgh
	 lsbmXu+cn/Z/s2Lzq2SCLQsgIB1QVSvOQ7UokBn/8RpsrH9uj7p23HrNaAHSUf1NAC68n
	 EEVhUBRxuqHbUwy23h5WtMxHsDbNkuqAWdk7ZWyU3uYSmOURKrqvHnvCzIsuAJg45TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597999;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=xbUT+3d3sUzVUx+WHNthe/crNhEWjAHcaRXAh5y7ANM=;
	b=eZWtsWmXKfo2gfo7Xl9rsvuRpkSdIH6zqc9uf0Gewqm4qE6VVesDDiXmWblwdnSltFvd
	 KEIVRPcmG957jDLEN4RzCdtFdMQpSU4dNF9MTWepyovemAhbt9OmZA/r5kHQUi+4qEn1s
	 TB+zqbwttQ9khj5dF9cK0dmXp9FFITrv01sabBSEPsdmvph5aol4JuOxNmHdtDkG56ufJ
	 B+hTDuhXG1sR4Oi5d30iYl88Dhu9ydIdpPBY+ff5xBZdVOTj9q8P7ow3KZTKSUqQwcjbs
	 WznoG4QU4JZfYIT1iV2lzrOmniOdWx0C2BfbMARqcu4FSJFbPzFbUPJ9HqFKf70Ymng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Ofx4YYy7;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93666606A32D;
	Wed, 25 Nov 2026 09:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93666606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Ofx4YYy7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=xbUT+3d3sU
	zVUx+WHNthe/crNhEWjAHcaRXAh5y7ANM=; b=Ofx4YYy7HIoZWB83tlGaZ7OjMS
	ii7FvAklwprIK7cbmxn8PzVa7JnrAXZyCyDqmeU7sszq1AxIeyQMz0F7Ofs1MOMM
	Dk/OqTyBULGAVVHpfQztCMPXcJcv8Yoh3zdZiTBenkt4WDt0fBGLAAseoZcdARTJ
	JEZHzhW7MUhb9gjSQ=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHCT6lpgZrtr_2AA--.2407S2;
	Wed, 25 Nov 2026 17:13:09 +0800 (CST)
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
Subject: [PATCH v8 0/2] arm64: dts: qcom: sm8750-lenovo-elden: add the Lenovo Legion Y700 Gen4
Date: Wed, 25 Nov 2026 17:13:07 +0800
Message-ID: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCHCT6lpgZrtr_2AA--.2407S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWrJw15GF1xCw1xXFykuFg_yoW7XFWUpF
	Waya17G3WkKrn2qr1fur4Iq34fZwn7GF43KF17J34UA3Z8Xrn2qwsIy3yYva45Gryku3WY
	vF15Gryfu3WkX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7IU5fpnJUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/

This adds a device tree for the Lenovo Legion Y700 Gen4 (TB322FC), an
SM8750 tablet, together with the board compatible it needs.  The device
tree itself is unchanged from v7; what is new is that 1/2 now documents
"lenovo,elden" in the Qualcomm board binding, which v7 forgot.

Why that is a real gap and not cosmetics: with the device tree alone,
dtbs_check rejects the root node,

    sm8750-lenovo-elden.dtb: / (lenovo,elden): compatible: 'oneOf'
    conditional failed ... 'lenovo,elden' is not one of [...]
    sm8750-lenovo-elden.dtb: /: failed to match any schema with compatible:
    ['lenovo,elden', 'qcom,sm8750']

so a board that builds still fails schema validation.  Adding the one line
to the binding removes that diagnostic, and the same three SM8750 device
trees then compile and validate clean (see "Checks" below).

Relation to Pengyu Luo's series

The same file was posted before, by Pengyu Luo, as "[PATCH v2 0/2]
Introduce Lenovo Legion Y700 Gen4" (2026-07-26, 1170 lines, based on
sm8750-qrd).  That series did not go in: it is at changes-requested, Abel
Vesa and Konrad Dybcio both reviewed it, and there is no v3.

This posting supersedes it, with the author of that series in the loop:
we agreed on 2026-10-25 to squash the board descriptions and send the whole
thing this way.  The binding entry in 1/2 is the same line Pengyu added in
his v2, so credit belongs to him for it - if a trailer is preferred,
say which (Co-developed-by needs his Signed-off-by as well) and I will
add it in v9.

What is in here, and what is not

Included, in one commit as asked in the v6 review ("one logical action,
one commit"): the board compatible and chassis type, the GPIO ranges the
boot firmware reserves, the board clocks the SM8750 dtsi consumes (XO,
sleep, and the two divided CXO derivatives), and the WL2868C camera PMIC
on i2c10 with the regulator voltages the stock firmware programs.

Not included, and not claimed to work: Wi-Fi/Bluetooth, camera sensors,
sensors on the ADSP, audio, and the two USB Type-C receptacles.  The USB
side needs the DWC3 two-connector series, which is in review separately
("[PATCH v15 0/3] usb: dwc3: support two connectors sharing one HS data
bus"), so it is deliberately not part of this posting.

Known dependencies and gaps

 - The WL2868C regulator binding and driver are not in v7.4-rc3 yet
   (accepted into the regulator tree for 7.5 - commit 84e67d2ee13f and
   602f57223457).  Until that lands, dtbs_check reports one diagnostic for
   this board:
     /soc@0/geniqup@8c0000/i2c@888000/pmic@2f: failed to match any schema
     with compatible: ['willsemi,wl2868c']
   All other diagnostics are zero.
 - The SPMI PMICs, the RPMh regulators and the console are still not
   described, so this is a board description that boots nothing by itself;
   it is the board's hardware description, sent ahead of the pieces that
   will consume it.  This was raised in the v6 thread and is unchanged.

Checks

All on a clean worktree of v7.4-rc3 (aebb727447), 2026-11-25:

 - git apply: 1/2 and 2/2 apply without offset or fuzz; the resulting
   blobs equal the "index" right-hand sides (qcom.yaml a32cfb30a1,
   Makefile e0b65a36c5, board file 73f4452f46).
 - checkpatch.pl --strict --no-signoff - <patch: 1/2 0 errors 0 warnings
   0 checks; 2/2 0 errors 1 warning ("added, moved or deleted file(s), does
   MAINTAINERS need updating?", the usual new-file prompt).
 - dtbs_check with CHECK_DTBS=1 on qcom/sm8750-lenovo-elden.dtb,
   qcom/sm8750-mtp.dtb and qcom/sm8750-qrd.dtb: all three compile, the
   diagnostic count for the board is 1 (the WL2868C binding, above) and 0
   for mtp/qrd.
 - dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/
   qcom.yaml: rc=0, no errors.

Testing on hardware

The device tree describes the author's own tablet, which runs a
vendor-derived 7.3 kernel; that is where the GPIO ranges, board clocks and
regulator voltages come from (read back from the running stock firmware).
The v7.4-rc3 tree this series is based on was not booted on the tablet:
without the SPMI PMICs, RPMh regulators and console described, it cannot
reach a shell there, so no boot claim is made for it.

Disclosure

This series was prepared with the help of an LLM coding assistant; the
trees, the checks above and every number in this letter were run and read
by the author, who is responsible for the content.

Qianhui Xu

Changes since v7
 - 1/2 is new: document "lenovo,elden" in the Qualcomm board binding, so
   the board's compatible validates.  The line is the one Pengyu Luo added
   in his v2; see "Relation to Pengyu Luo's series".
 - 2/2 is the v7 patch unchanged (same diff, same blobs); only the
   "Changes" section and the version number differ.

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

