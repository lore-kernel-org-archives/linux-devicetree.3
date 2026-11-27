Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785829;
	b=C7nsdp3oW1n9xl5Ol5fWX2ckE0qwvnwlBaphmK8zpZ3BUvV0eCjSpFbOgkvEGD4ivCIe
	 /r6jv7WyOiZrn0z2BqqRLfbYe+09z9Y3MEDpX2ggTYwmWZ+8O+tnp37Qthi6a+G1KzW1x
	 6UGQZd2B+uRflytHcMAcEu7cD4rTfjCJGbzuJrLzc0h5iRwnPwSvkBLc76tgGdYmxk3pR
	 AXlPRhMmF4SP8Ve6sbeE6w2OeOGQFFj9Xan8tbQHndv02Wx7LcSfTlZGtG/caPxMzPy5/
	 c8UyIyH9jz9BN3iuyJ5I8yjDMAW7Xug6QqjXorOzsoAKW77M0nlCiVVYHk4GbmXQb8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785829;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OIAUaF+cl5nkakNNQfkJ+TrCSBQlfbDZwKFIBcVxDL8=;
	b=GjqBaH2iDsO+YfXroecqpdirQptps6HXmtUZPzTUvflR47J7ESNnqmPJYvaJQimkYh+d
	 vqZelc/TDofegDr/UZbTikzsxDpPCZrQwM9bZpeu1Lo29pxRoFVjvk9RP2ox20bc2YzGt
	 2B4/6Q8biK9b9ukPSTlOpjpi1ZYDkmFLdv2JCUFePQJjwm2KAYJLMPMllSPy1vA4ci0Jp
	 +tM+zdpi6Ts7vYls2Hw2d6ZJfozlUw8uq2ISNO6q94iuSVlT5RVQVaNdaY4vDX2WXIfDt
	 Xo3FpWGTLSIMSvCJc/bJq+4aoLIyRKEr6ZypI+GK6xdxHH36CO/OMkKibJ76uIFegog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=vtgGzNsR;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725D1606A31C;
	Fri, 27 Nov 2026 13:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 725D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=vtgGzNsR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=OIAUaF+cl5nkakNNQfkJ+
	TrCSBQlfbDZwKFIBcVxDL8=; b=vtgGzNsR1fdTvYVSc/pimYY5fREaHk7GXY5pE
	F2FZl2YfK/k1+xIiVIndGdf/RZ80CY/snvyTGaWc9vBh+27WoNTjj+7Zak9o4HiT
	+aLbK8Gjf/ISaLWQkfS3eQaRlz345zM18D0jzAqy9Y3GkbepQ4ltd+vPu7/nwsj2
	P/IXQQ=
Received: from [127.0.1.1] (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn2S1chAlrTd4CAQ--.2870S2;
	Fri, 27 Nov 2026 21:23:41 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/2] arm64: dts: qcom: sm8750: describe the TNOC AMBA periphid
Date: Fri, 27 Nov 2026 21:23:40 +0800
Message-ID: <179578582079.1094405.15142623585619157958@mail.ustc.edu.cn>
In-Reply-To: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBn2S1chAlrTd4CAQ--.2870S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryDJryfuFWrWF43Xr1UKFg_yoW8WFy5pa
	95tay5KF4vgFn2y34Uuw17ZrW8ZwsY93Z8W3Z8try0gw45tr9xGFWfKwn5GFnrCF4vgF1q
	vFWYyw4vga1UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2wIDUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAYst

Hi Jie,

please drop my series above as a duplicate: your "[PATCH 0/4] Fix the
TraceNoC probe issue on QCOM platform" (2026-11-18, series 1214623)
already carries both changes I sent -- [1/4] relaxes the binding the same
way, and [3/4] adds the very same periphid to sm8750.

The overlap, for anyone who does not want to diff it by hand:

  - 2/2 of my series: `tn@109ab000` in arch/arm64/boot/dts/qcom/sm8750.dtsi
    gains `arm,primecell-periphid = <0x000f0c00>`; your 3/4 touches the
    same node with the same value.
  - 1/2 of my series: the `arm,primecell-periphid` allowance in
    Documentation/devicetree/bindings/arm/coresight-tnoc.yaml; your 1/4
    does the same.

Your series is clearly the better vehicle -- it covers kaanapali and
glymur in the same pass, and it already has Abel's and Konrad's
Reviewed-by tags.  Nothing in my copies is worth keeping.

One measurement you may want to fold into v2, or ignore if you already
have it: on SM8750 hardware (Lenovo Legion Y700 Gen4, TB322FC, kernel
7.3.1) that TNOC instance is `tn@109ab000`, and before the property is
present AMBA reports the device unbound; with
`arm,primecell-periphid = <0x000f0c00>` the driver binds and all 28
CoreSight AMBA devices on the board reach bound state (unbound count
28 -> 0).  That is a before/after comparison on one board, not a claim
about your series.

Sorry for the noise, and thanks for the earlier work.

Best regards,
Qianhui Xu

---
AI-assistance disclosure: this reply was drafted with an LLM coding
assistant and reviewed and edited by me; the measurement quoted above is
mine and reproducible; the decision to withdraw the series is mine.

