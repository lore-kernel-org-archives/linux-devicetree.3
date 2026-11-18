Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995068;
	b=3FEYCByHhdPcPnJ+jUInB9AoiFPpqgV6cXuDT+O3XObKdBRPzbiNODuPKGE7hzR+hEhj
	 8IT4mRuuX9/pNt5ax+mod1GkXkXT082vfMlOsp02/Vstdp6io0el1b6IFRtADyQHZXXyV
	 3jPEypWWX4rHLN8wzk6gII29o/Pwv/QhmPCxoX5n67BeipbgLbweZ5i3I0UVux3BrRC6+
	 KI+RMRovGk4FyWhPRNsFWdbiDPaSpFAn3TrvvFg43/GlvjnZjJjeDnrrYt6ThkNYoGwNt
	 2+1kiLykKi996PtjgLozDZWjqM3aytgRW9a+uu23rqHce/38tujP98jX1wsx2whds6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995068;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1HMxZZM7bzhjsqc5qRi97t8nfWePquDvTBj8O0q7OyQ=;
	b=ZgKAijIi7KlQzk5I5IdUd3NtOrhXl8zoGAYD8502RhbjK6QiQGvyQbZD3O9+7Z6+LE1l
	 QGLqrWQKFdOAtfM5Yln56GnKSQJ0AbEzgpU00A0uFHhcVQ4duoqUZenjwGQ4hVRrK3THr
	 ePYxMqiNwpFLELICqUxFOL3DkY3bFlC5X6WpoXXOpzhur+cti/cQrYElQHdcGuPhWNcKg
	 +nbCdzcNvZwQIEFTrLI2OpAnr45slhBmtU1yG+MFfB/ZxwYu+Dbq9bRmeK+VBbYRtFAmk
	 /cUavmL/hz4CuQhEhB7Nfj8Qz0bv5c1LrKPWwMIvXEJOqNWtMJLLPqFBGAsCJ2cN/Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eF3Ol4hf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B98A606A31C;
	Wed, 18 Nov 2026 09:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B98A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eF3Ol4hf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32B6D1596;
	Wed, 18 Nov 2026 01:44:24 -0800 (PST)
Received: from [10.57.70.68] (unknown [10.57.70.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56B783F673;
	Wed, 18 Nov 2026 01:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794995067; bh=tjyobLDvMwHsv5laRkEDlsj8Jtea9zcMz60ESGKWtpU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eF3Ol4hfTMslDvZZCDXyHFNZdVKs80uIAQhX3pGHYb/e7FGLr/KTD1tZD2hL6SYMt
	 7+qnDD3wxURjv1oyWoac6m5L/0fHGNefYCVfkmRsz7F+UqTYbbdq4oy2Va43uFTPy+
	 95rjAvbOEiJ0m8r6bkXcG+UoQHYZgiIpXb17M+Wg=
Message-ID: <35977427-b22f-44a7-a49e-9c30aceaf1f0@arm.com>
Date: Wed, 18 Nov 2026 09:44:22 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix the TraceNoC probe issue on QCOM platform
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Leo Yan <leo.yan@arm.com>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 07:01, Jie Gan wrote:
> The traceNoC (Trace Network-On-Chip) node on kaanapali, sm8750 and glymur
> is described with the "qcom,coresight-tnoc", "arm,primecell" compatible,
> so the device is created on the AMBA bus. To bind an AMBA device, the bus
> reads the peripheral and component ID registers (PID/CID) at the top of
> the device's register block and matches them against the primecell ID.
> On these platforms the Component ID returned by the hardware is
> 0x00000000 instead of a valid AMBA Component ID, so the AMBA probe fails
> and the traceNoC is left stuck in deferred probe indefinitely, leaving
> its trace path unavailable.
> 
> This series fixes the issue in the simplest way: keep the existing
> "arm,primecell" compatible and add the "arm,primecell-periphid" property
> to the traceNoC nodes. The AMBA bus then uses the peripheral ID given in
> the device tree instead of reading it from the device, which lets the
> traceNoC probe on this hardware. No binding or driver change is needed.
> 
> History of this issue:
> 
> This is an alternative to the series that fixes the same problem by
> moving the traceNoC onto the platform bus instead of AMBA.
> 
> Latest revision of that series:
> https://lore.kernel.org/all/20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com/
> 
> That approach requires a binding change and a driver change in addition
> to the DT changes. This series instead keeps the hardware described as an
> AMBA device and works around the invalid Component ID with the existing
> "arm,primecell-periphid" property, so only the device tree is touched.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (4):
>        dt-bindings: arm: coresight-tnoc: Allow arm,primecell-periphid
>        arm64: dts: qcom: kaanapali: add periphid for traceNoC
>        arm64: dts: qcom: sm8750: add periphid for traceNoC
>        arm64: dts: qcom: glymur: use Aggregator TNOC compatible
> 
>   Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
>   arch/arm64/boot/dts/qcom/glymur.dtsi                           | 8 +++++---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi                        | 2 ++
>   arch/arm64/boot/dts/qcom/sm8750.dtsi                           | 2 ++
>   4 files changed, 13 insertions(+), 4 deletions(-)
> ---
> base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
> change-id: 20261118-fix-tracenoc-probe-bf8025cad2ca
> 
> Best regards,

I assume this would go through the qcom platform tree, as this is mostly
DTS changes.

For the series,

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


