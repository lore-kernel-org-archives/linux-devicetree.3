Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2523C8C72;
	Wed, 24 Jun 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314175; cv=none; b=AJ5Lgddfyu0n1qIMDza+NGmb1F9DKuM3cyt9pOgov1bsxVmV3x24VuHHGH5FNz7o2y7L4e9AR32ENma3hx1jtq2y/ERFTSLLLwvgqOGbEVDGalfxf0GcTXTuZankBhRvuwyf8CBi1Lrx+2MUNBvICv7YlDQ640UiP2YMo4vFgw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314175; c=relaxed/simple;
	bh=PX10r5f9OoO8qOWEx/oZ9VqNT3djQJ+d35yaUiPexng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaKw8SFGCZ+aIjBfI2O3PBljQaDthuiens87J3QXQ5t6MhPnPyQTDW7jz47OgOh5RiGxMYy4PBIfFxxaR5GG22gk138DjFg2C3hmjhyjYbc0gBy9/xexb3YXEhCj6jlR2UjQd1hCn4RHC6dXl0EA1yxTUBh2JY8GDN7D84GQYrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BmBZGjT4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BmBZGjT4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D60602308;
	Wed, 24 Jun 2026 08:16:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01EAD3F905;
	Wed, 24 Jun 2026 08:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782314173; bh=PX10r5f9OoO8qOWEx/oZ9VqNT3djQJ+d35yaUiPexng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmBZGjT4U3qcNtktNVR/2XoYS3e6/c+LO8+3D5K7T+hH/5zmpU0WSE2VIm9ZpaUsW
	 GpozDJqWM3t+QRFsHr9Eq2dqg7Bra5Z6r3HJCfidsc1hnl5eyoRv8/WUNeTTsuHuHD
	 +RZhpP0fYme53aFTKa6uhjX+//zPxUOuHUSzf2r4=
Date: Wed, 24 Jun 2026 16:16:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260624151610.GC575984@e132581.arm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>

On Wed, Jun 24, 2026 at 11:08:32PM +0800, Jie Gan wrote:

[...]

> > Why does it fail ? power management ? hw broken ? Is it really AMBA or
> > do you pretend that to be an AMBA device by faking the CID/PID?
> 
> The CID reads as 0 from the register, which I suspect is a hardware design
> issue. I have not yet confirmed this with the hardware team. As a
> workaround, I provided a fake periphid via a DT property to bypass
> amba_read_periphid.
> 
> 
> Leo commented in other thread:
> >>tnoc.c registers both an AMBA driver and a platform driver. Shouldn't >>it
> >>be registered as a platform device instead?
> 
> The platform driver is intended for the interconnect TraceNoC device and is
> not designed to allocate an ATID. The issue is that the TPDM device borrows
> the ATID from the TraceNoC device, resulting in the ATID always being 0 when
> associated with an interconnect NoC device.
> 
> However, I believe it is acceptable to allocate an ATID for the itNoC device
> and the issue can be fixed with this way.

I think so.
