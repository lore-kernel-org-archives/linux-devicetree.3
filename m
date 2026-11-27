Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779130;
	b=MbZkCwBSux+Izcblx4y+luDMeaFw1LjCHlL2HfXLFN/URUpwZp2OXP3Fuv/VE+aaez7K
	 51l6lnkyi3YnWdZz0CwbyyBT6MR8i99rB92KqTsTkX/cIIsr17pI+fzDswD7nBEaaAJ25
	 8Y8VWsRvOkWP3XOr6ufL1XTNbyO3awt7OFbuVsYXJ5waxB2Ob3Y9d2+cEfYSE0lUWxwSe
	 qlFPu/5DWsyJhIWGeO+e8Qr+GwXoCTLv7KIEoT1hTjxJ/66Co/F7lJGmiiO301SU9x9Y+
	 /JCHIF/jKomJzurm0BhlKLXf5FWdV/I7PViuUyAFWoUtgEKdBJ4tTHVaBq/eKlBZ6gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779130;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=qj8aF0ZP6+lijN1DbZs2T3P3vWSw28XF+y1LjHI/Bns=;
	b=YFbFNMQEXomjkylxoqTeK6Z+53SFLc0Of19g12/tf7TUQppvxXp7VlbDcp9dKH7BCEuq
	 VIacCSo2UdZkpYbGxDhOdE6vsBFYH9qp0qv+8l59DkO8aBbsUzSyofxjKYdGbsbjHDC0V
	 yBjK8HKJTnHwqSbRzXW7n4HHzmuMzDIpZg3Z8u01zoAfrWIFqNiB/sPvTF/GD9mqG4yyL
	 SCF3VFriUoxOY/mW0vVChKHsiiEHi2kIyu2JmfnsRDJPaDWZokHXpTqanBAWQqy7j3qW5
	 qsigPfxQfubZ0GxDIcjvPrCxOBAAQZZ1tMRvPC/1GIOnGaedW0jIgjQDIRQ70N5XflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Ok8TsmMg;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B022606A324;
	Fri, 27 Nov 2026 11:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B022606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Ok8TsmMg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=qj8aF0ZP6+
	lijN1DbZs2T3P3vWSw28XF+y1LjHI/Bns=; b=Ok8TsmMgcasG53maLoLffHfpF2
	K/58JfIO9I5/omZ6gxRchvs8N+SoGedURFGpRqIVk6xeXwLCZfQYw8eam/WFPnM7
	hDUYdu3g0UKlxEjVFv5jmng1+aoipgDPwbv9d94UUfJrf+xZ9C0L4GM3rY3taTYX
	TvJDtPPvlIXJHwlCw=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3cDUvaglr7nICAQ--.938S2;
	Fri, 27 Nov 2026 19:31:59 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8750: describe the TNOC AMBA periphid
Date: Fri, 27 Nov 2026 19:31:56 +0800
Message-ID: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgD3cDUvaglr7nICAQ--.938S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrZr1DWw17Xry5JFWfAFb_yoW8Xw1fpa
	98Kw4DGr1kKF1vyw12gr40q342vr4ktF4Y9r1DJry7Wa15JFs0vF1akF1FgFy7CrWxWa43
	KFWUWr1DtF97Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7PEfUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAPs6

Hi,

on SM8750 the Trace NOC at 109ab000 is an AMBA device, but without
"arm,primecell-periphid" the AMBA core reads its ID as 0x00000000, so
coresight-tnoc (amba_ids 0x000f0c00/0x001f0c00, mask 0x00ffff00) never
matches and the node is left as "deferred probe pending: (reason
unknown)".  The value below is the one the driver expects for this
integration; sm8250 describes its funnel the same way.

Changing the DTS alone is not enough: qcom,coresight-tnoc.yaml sets
additionalProperties: false without referencing the PrimeCell schema, so
dtbs_check rejects the property.  1/2 adds the reference the other
CoreSight AMBA bindings use and switches the root to
unevaluatedProperties: false, 2/2 adds the property.

Tested on SM8750 hardware: with both patches the TNOC binds to
coresight-trace-noc and no Coresight AMBA device remains unbound (0 of
28), where the TNOC itself stayed unbound before.  dtbs_check on
sm8750-mtp.dtb and
sm8750-qrd.dtb is silent, dt_binding_check passes.

*** AI-assistance disclosure ***
This series was prepared with the help of an LLM coding assistant.  The
author reviewed every line and verified the binding on hardware.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Qianhui Xu (2):
  dt-bindings: arm: qcom,coresight-tnoc: allow the AMBA periphid
  arm64: dts: qcom: sm8750: describe the TNOC AMBA periphid

 .../bindings/arm/qcom,coresight-tnoc.yaml     | 5 ++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.51.0

