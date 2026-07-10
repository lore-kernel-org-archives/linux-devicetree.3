Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85793BFAC8;
	Fri, 10 Jul 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667024; cv=none; b=nVHOtD+5R0Efvr6hDDWAYLhQUPvcFmtPW9BEbWsmxvBbXboYRqcXuwIQTxWjP/RUzh2qzjD71IbM/r4kqVl/5edSR177x2S4zGG+duz6Drpa1u0KxqNiXm7xQ2Nng1VZgDIwFJE4+nz8o598CRV7tzefD5/mMHEhoOBqjZUnymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667024; c=relaxed/simple;
	bh=4jvl6rk4X89gpWX4mrKH9TCVaTeZSfapdIhYU3YONMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIxSs7vRmH7wZ7K4POAXjjP58CCC6D91FMWy8ZHj9FUrZqRjENkn/31ppaZJnBScmORM7nMn/wqf2IldP6gEIaqwywyNbstMoE4B7bfZRc1RcjQnCjOyNOBqSEY4q+GTsIPeWRPDnhJ2aF3oPmWBibtB3mTDcO6Pzy1aAnrUDO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkJ1qk3p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkJ1qk3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0A71F00A3A;
	Fri, 10 Jul 2026 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783667020;
	bh=ffR7ZryagVGOEuQIJ783LXqlEOLErcxNTF8ceIZ6QJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HkJ1qk3pVg1gNUsVBpd65sgOKOB4CRDg/CH/bZFHYVMz/b02CI7Oy/8lJBqD895Rr
	 QXi94LZLSIuiKmbwV/bp2HgA4hCZc0zi9eXKzfGK4jg6Fhd61aGKCf+iDRTLKG0u6A
	 XEBPoLrh9WKkmLWh7Ul+zBA2dptxL4+SO1xt0CgPFL4BB2pFsF3VwVWLsfpO4XrljB
	 Y1CZowWo+d9HUZqvgFlTI1yAqNiRQXybjjz6C7AdTv/f7hkP6PIoG8R2z/DcV/ilOe
	 NnB1d3bAIhKBtmwcACu/6Bu2gVCYva8FXuqks/N3SZBF6baXrVD9k+ND374UA6s+0j
	 2JVL1iulOtwZQ==
Date: Fri, 10 Jul 2026 09:03:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/5] dt-bindings: arm: coresight-tnoc: Bind on
 platform bus instead of AMBA
Message-ID: <20260710-sweet-loutish-lynx-8698f2@quoll>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>

On Fri, Jul 10, 2026 at 10:39:00AM +0800, Jie Gan wrote:
> The Aggregator TraceNoC hardware exposes CID registers, but the Component
> ID value returned by the hardware is 0x00000000 instead of a valid AMBA
> Component ID. As a result, the device cannot be identified on the AMBA
> bus.
> 
> Describe the Aggregator TraceNoC with a dedicated single
> "qcom,coresight-tnoc" compatible instead of the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell". This creates the device on the
> platform bus so it is bound by the platform driver through its compatible
> string rather than as an AMBA device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

