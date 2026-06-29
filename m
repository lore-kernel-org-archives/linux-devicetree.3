Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588103CC9F6;
	Mon, 29 Jun 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743333; cv=none; b=D9wuKevLVqvru6L0OKGi6M2OrSda9SST59GaePfYAUTL9uyJBmN1fX+1DoSJmXo/7/jtEIsjY8cNlALcmj3g2iFA1fairistEq/K0D97p+Wf8c3+a/UQs+xdAHerm02VknEogpW147u16PFOCUbWPlHAJftwwmWEPIUAolqEba0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743333; c=relaxed/simple;
	bh=rVIpgPhieX/hjC3o46WFkzWX0pZQG5WKKAO87ImTv3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNRYxPwDXyMTSt5cuIYyqvmiLeIfDCkuo+SJnzbnFHMUK9FsLEL+bDSUXIugipovIhSatvFKYH6xzatyaVMaIT4aUiqva28xEtQSgFRAnbbwijzUvv/ZIFsZC7wyQDL3osqfUb+37RCz1e7Az9wRTI4lT/x2KWS2qJeZppPFEJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eQzriMHv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eQzriMHv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA28416A3;
	Mon, 29 Jun 2026 07:28:46 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80543F905;
	Mon, 29 Jun 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782743331; bh=rVIpgPhieX/hjC3o46WFkzWX0pZQG5WKKAO87ImTv3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQzriMHvEelb+GRgBs6E+iOc+LzatJGj0P3ERA+k3ICsHUL0BLFmbopMkhXEEEjFM
	 GI6HS3b+ecuLQ2wXtZxrj3DKrOouxsynsOan44cbs9/dmaqesyIJTMT9ptNsqnY4ao
	 bNr/i7lLu4m6jI0q4LwManSJOY/hukQweyviJSdg=
Date: Mon, 29 Jun 2026 15:28:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260629142848.GB1812158@e132581.arm.com>
References: <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 10:08:17AM +0800, Jie Gan wrote:

[...]

> Can I fix the issue by adding "arm,primecell-periphid" property. That's
> would be the best temp solution as it avoids breaking the original design of
> both the TraceNoC AMBA driver and interconnect TraceNoC platform driver.

Before proceeding with the "arm,primecell-periphid" property, could you
clarify a bit:

  - For an interconnect TraceNoC, what would be the consequence of
    enabling ATID? Would it simply be a no-op, or are there any side
    effects? Or is the concern that the trace IDs could be exhausted?

  - How can you guarantee that a interconnect TraceNoC will never
    require ATID in the future?

> The TraceNoC device here must be treated as an AMBA device and I am
> continuing to investigate the issue with our hardware team.

> We aim to fix it from hardware perspetive for existing platforms if possible
> and ensure it is fixed in future platforms.

I'm concerned that all of use end up repeatedly fixing similar issues
whenever hardware configurations change or modules are reused in
different topologies.

For example, if future platforms may require ATID support for an
interconnect TraceNoC, then the issue will pop up again.

Thanks,
Leo
