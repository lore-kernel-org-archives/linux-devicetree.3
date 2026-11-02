Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599513;
	b=WPey6k0y9KJ98ghXNUgZpQbO8fjYYzdm+U5Kxa5I+D6hWq0tk2Eg9vimL+jHmKo8dmsz
	 MugSybkffnJva60XpagFV+nK+B0hH64RNGyDtVOKBBLlq8Et6TBLYQLritekfo5b9aAEm
	 LBCvkAhtmrWzRqdLbc//SOQnRCKu5qsu39h4af5iMtqci8T0COHyAJlHR4x2/QtZAj0YS
	 1N29yMTQrvHCwYeAxjy0xl/wzcRy1+9iOhOihl6ta5j24YcKFyyD/slIczMvyzXwmSjdl
	 1ar+WKa39u6H6XbyxNCpXlnBh0RMa4EPoFhmDd09/XEfM9rgXgFt4meKr/bni7SQatA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599513;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=iKyUlcBkoAz/1tMM2Aseb9PKthY1Tr6K2pUTOmI6++Y=;
	b=mb2irT51BUjiKG9X8LUEIymZGLxs1IU9rdv0eqW4RJBYSGrH0MhAhXc4OlcsKV/kmVz4
	 uT0fz1v3IJqZ+VMU2iCdmDmHGFTFrApGPapuVjjE1T8X2+C8FaE6dkB5HEr0hS8l6/cV0
	 1WO/FzV06AlsfjuaX9rPMhf1xnZdXefpohtfxKNaCHQElaU0p1sMqqTaN3/HN/iDEi33l
	 1M2Tq09e7eQWyBXUGx0kYCe171HStrCy4lN90R1NZlmXFM2c1sbhWR1FYQ36BqvutpI42
	 9i3Du0UpqvXqxM8hENOnjVvqg1jUtQpzRtHfNM0xrinPJoJ1JFeG/QRO3kLk5lfCrzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ngrUZfJm;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C49F606A32D;
	Mon,  2 Nov 2026 06:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C49F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ngrUZfJm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=iKyUlcBkoA
	z/1tMM2Aseb9PKthY1Tr6K2pUTOmI6++Y=; b=ngrUZfJmqiwar65ZYnxV0/S4fN
	R/447CFp4oPKZR5C0aDag/ni+Tc0QgD/KkzajnyJB2Uyuby7Hhz2xHo9RahUWK8r
	FcIrXxiYlQ1TDbnhI1vSJvsH66O1tyVY8Z5ineMt8nSJq9vhnmdFacepKE42h6rU
	0ul6nTB2Donrw+rnA=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnGzAKKOhq6vN1AA--.1803S2;
	Mon, 02 Nov 2026 14:04:59 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	linux-regulator@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v5 0/4] regulator: add the Will Semiconductor WL2868C camera PMIC
Date: Mon,  2 Nov 2026 14:04:54 +0800
Message-ID: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnGzAKKOhq6vN1AA--.1803S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1kWF4UWF1xAryDWFy5XFb_yoWrur4rpF
	sxArZxKr4kJFWSgws3J34S9a4fuw4rJFZ0kr9Fy3y7Aa45uF95Jryay34YvFyUGrWkJw1Y
	yF909r1kCF1kZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9lb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgNB_DUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBZsI

This series was drafted with AI assistance; I reviewed and edited every
line myself, and I am responsible for its content, measurements and
decisions.  Evidence for the review-driven changes below is listed in
the text.

The WL2868C is the camera PMIC on the Lenovo Legion Tab (TB322FC,
SM8750); its seven LDOs feed the rear camera, the front camera and the
VCM on i2c10.

Changes in v5:

 - Sent as a new thread.  v4 was sent with --in-reply-to pointing at the
   v3 cover, which buried it in the old thread; every revision from now
   on starts its own thread (Mark Brown).

 - cci1 bus 1 sits on gpio111/gpio164, not on gpio119/gpio120: the
   latter pair is cci2 bus 1.  gpio111 and gpio164 are the two CCI pads
   that the TLMM shares with cci_timer, while gpio119/120 are plain
   cci_i2c pads, so having cci1 claim them would mux cci2's bus while
   leaving cci1's own pads unmuxed (sashiko, High).  Evidence: for
   SM8750 the six CCI SDA pads are gpio111/112/113/115/117/119 and the
   six SCL pads gpio114/116/118/120/153/164
   (drivers/pinctrl/qcom/pinctrl-sm8750.c, the sm8750 pin groups);
   Qualcomm's own SM8750 CCI submission assigns cci1_1 to
   gpio111/164, cci2_0 to gpio112/153 and cci2_1 to gpio119/120
   (https://lore.kernel.org/all/20260618-pakala-camera-v2-2-9fbb729fd242@oss.qualcomm.com/);
   and the vendor DTB of our unit uses gpio113/114 for cci0 bus 0 and
   gpio117/118 for cci1 bus 0, matching that table.  The vendor
   devicetree source itself is not available to us (the tree only
   carries a dangling sm8750-devicetrees link), so the bus 1 mapping
   rests on the two sources above.

 - cci0_i2c1 and cci1_i2c1 no longer carry status = "disabled".  The
   parent CCI nodes claim the bus 1 pinctrl states, and cci_probe()
   only registers available child buses, so disabling the children
   while claiming their pads was inconsistent; both buses are now
   described and available as on sm8550 and sm8650 (sashiko, Medium).

 - The CCI pinctrl states are placed in alphabetical order inside the
   TLMM node, before hub-i2c0-data-clk-state, with cci0-1 preceding
   cci1-0 (sashiko, Low).

 - The arm/qcom.yaml board compatible entry is no longer part of the
   regulator binding patch; it moved to the board DTS patch, which is
   what it documents (sashiko, Low).  checkpatch still wants binding
   files in their own patch, so 4/4 keeps that one warning.

 - The board DTS keeps the scope of this series: camera PMIC and its
   consumers only.  The rest of the board enablement (SPMI PMICs
   including the parents of the WL2868C inputs, console, storage)
   cannot be validated on hardware here and is left to a separate board
   series rather than being guessed.  chassis-type was already present.
   The rear lens and sensor nodes use the giantec,gt9764 and
   samsung,s5kjns bindings that were posted separately to the media
   list and are still under review, and their CSI endpoint has no
   remote-endpoint until the SM8750 CAMSS nodes land; dtbs_check
   reports "failed to match any schema" for the two compatibles until
   those series are merged.

 - Patch 1/4 (binding) and 2/4 (driver) are unchanged from v4 apart
   from the qcom.yaml move.

Everything here is host-side only.  The i2c10 probe and the runtime
existence of the regulators are still unverified on hardware; the
on-board evidence reported earlier (i2c-10 present, camera_ldo1..5,7
registered, LDO6 without consumer) comes from our own downstream board
DTS, not from the files in this series.

Qianhui Xu (4):
  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
  regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
  arm64: dts: qcom: sm8750: describe two of the three CCI I2C
    controllers
  arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/regulator/willsemi,wl2868c.yaml  |  79 ++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 175 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 156 ++++++++++++++++
 drivers/regulator/Kconfig                     |  11 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/wl2868c-regulator.c         | 155 ++++++++++++++++
 9 files changed, 586 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
 create mode 100644 drivers/regulator/wl2868c-regulator.c

-- 
2.53.0

