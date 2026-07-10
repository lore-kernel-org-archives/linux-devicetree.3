Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4723F12F2;
	Fri, 10 Jul 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672813; cv=none; b=CUmloS+O9d4Km4uJhIctQF0BqhTWnRE3ZRbuG5eyhcSQQL+v/m2pqSKZNuFkZEZr1ERvFiN1ZWpO+I5nVJbViGGRYL2B/2iVxxRW8IS3QYAqUS34DQTmDJ8ftrUwa90P1sPeX6Gl5IEUY38LhprMsgM31S59gtUQ6XumtIz0oGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672813; c=relaxed/simple;
	bh=Vrfha6a/wvRPJaZ4UkRBNv5gq9QhvAOUqgTI4ipo0mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNxpoIAVQipZfYrFa6b0kqML6dTKp4K2AcLmrqF0/rfcbdtyqsh5cVhpKKisbrAUKhXyMYbRZC60ULB8FimEvyxfvhbXySysiChJ8qVK22gZzgFuqYsOHuejvgNwgQHIKDo3sUVJoReXvk7J8rACU1LN4Uqb/yhC83NHGWhWGv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cg5JU9TK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cg5JU9TK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A7C1D70;
	Fri, 10 Jul 2026 01:40:04 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBF053F85F;
	Fri, 10 Jul 2026 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783672809; bh=Vrfha6a/wvRPJaZ4UkRBNv5gq9QhvAOUqgTI4ipo0mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cg5JU9TKlCx8XNZ5bsggIPdE/EgxVBGKfQccZvkihY79vxpPQzPnW2Q9GzQC98UG5
	 m2O4kpoPfuJ1ZENVI3QVr5zpxVpelMiqemv9ma8XeM7+e+riIKno33WFmtxpi9EaFH
	 1W0fJ1si5wvzE5nuOuFH0JbYG7I9LmJ4S5JT8jsw=
Date: Fri, 10 Jul 2026 09:40:07 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Message-ID: <20260710084007.GI1024232@e132581.arm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>

On Fri, Jul 10, 2026 at 10:39:01AM +0800, Jie Gan wrote:

[...]

> The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
> allocation for every platform-bus device. With the Aggregator TNOC now on
> the platform bus, that check would wrongly disable its ATID, even though
> the Aggregator TNOC owns the ATID that tags the whole aggregation path.
> The Interconnect TNOC aggregates trace within its subsystem but carries no
> ATID of its own, because the downstream Aggregator TNOC already owns the
> ATID for the path. So base the check on the "qcom,coresight-itnoc"
> compatible and let every other form allocate a trace ID.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>
