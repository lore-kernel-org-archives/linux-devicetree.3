Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24503326927;
	Thu, 25 Jun 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377809; cv=none; b=C0UAA3y5a4ZbbfCS7MhoE9fz4zG5da5gK3Zc0pZskuauozf4VZpwVfPnFQhfpYCPg4kyLHdvqIQf2ozrYNizUs6C4QLS/OjSXPxubqXOaNktCU+Lua9o5q4qeTP5nSfE6De+O+YcCQLlgSAGiDv8O3ZnIUltlVwCG8Xt08WTvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377809; c=relaxed/simple;
	bh=CoaICBgyZOpVW54p1ocJ7jTim5gBU3nJmN8HCHZtt6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsjJJYQ+7/NPFOdhHbdRfCf5ko4+dbLH+270C/aX9PhfwAARIayuMEq4qvpWinnQnqQZCBHquTkXGkyuz7AZdFxON89xmyNYMR/a/vCKoZgg19qaCk1iC0uHH74t8h3kCqxuzrmQs/DWPo0kSFG1sw4AFP+6km46FB966h630+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hv4iF/4H; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hv4iF/4H"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19042BCE;
	Thu, 25 Jun 2026 01:56:41 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF5873F836;
	Thu, 25 Jun 2026 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782377806; bh=CoaICBgyZOpVW54p1ocJ7jTim5gBU3nJmN8HCHZtt6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv4iF/4H6zrDi91o12M0JAPWvL9/T2htesNqeEVkmrmHJ0V4OUT3ktuqEwURdFy0A
	 WiyveDBpWP23DIKxMmIWuobU66Luv0Rn+6rapH3Pq+FbkIG+XjxAEYuUJZ/0U/0cvH
	 l/EqyIG68zo2FzVtgIHnjUjSrznrhVOVa69pzW9Q=
Date: Thu, 25 Jun 2026 09:56:43 +0100
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
Message-ID: <20260625085643.GD575984@e132581.arm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>

On Thu, Jun 25, 2026 at 09:01:18AM +0800, Jie Gan wrote:

[...]

> > > However, I believe it is acceptable to allocate an ATID for the itNoC device
> > > and the issue can be fixed with this way.
> > 
> > I think so.
> 
> Hi Suzuki/Leo
> 
> Which solution do you prefer to address the issue?

I will leave this to Suzuki.

> The interconnect traceNoC platform driver is intended for the itnoc device,
> implying that no TPDM devices are connected to it. So, if I modify it to
> allocate an ATID, I think it would be better to rename the “itnoc” node
> accordingly? Or it's ok to leave it as-is?
> 
> BTW, the traceNoC device definitely is an AMBA device with CID/PID
> registers.

Just to share a bit thoughts on the driver's design.

I think it would be better to keep the probe function generic. The AMBA
probe should not be specific to TraceNoC, and the platform probe should
not be only dedicated to the interconnect TraceNoC. The probe function
should simply handle a device that appears on either the AMBA bus or the
platform bus.

So the question is: if allocat an ATID for all traceNoC devices, do you
still need to distinguish TraceNoC types? If no, then the code can be
unified.

Thanks,
Leo
