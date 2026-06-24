Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FB93C2790;
	Wed, 24 Jun 2026 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311153; cv=none; b=YGRicFudXN+doXRJycCGwZor2Dw5S6fS+MINUUQb6UgKOqusCHxFx2pT6xHE+t5erx77Q+o8gngL6kEuo3DEfHgCtn4ZZ1LhB/YZckJX/E6HztyH5Okj7E6o3hDhHjmE56vwFWWK208spXg/uQziGlxMIJvK6lFZgMtZcjk3MDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311153; c=relaxed/simple;
	bh=mrPwdf7xd6wsMAEeiR43UBAbY0NnohDZgj25KrzbEkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiKF9RYSvcoi67qu2JZM4TCmCjRfJW1O/nApBwMNBxqFzGyn40phkbGzQCktWNPmNy/oqJU+ccjGELVrAyN5Aqdv0CXJ/zAZ7/GdOtLctCQHRHxX8PRvztJtskmSIbeIV/V4Siw84E+L+CNFMO08t9hGOhA0dL3Oyiqxtfi2hm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cj2M1i6D; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cj2M1i6D"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C90816F8;
	Wed, 24 Jun 2026 07:25:46 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C61093F62B;
	Wed, 24 Jun 2026 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782311151; bh=mrPwdf7xd6wsMAEeiR43UBAbY0NnohDZgj25KrzbEkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cj2M1i6Dx+mt5UzZtg8FO5AC6jgoy0UVWsf/4h/jZibDruozT78wSezGv6jazfphx
	 i2X+vV1Oy4mjRR41FVO3KFEuvymsAJW1E5QvCAnBtcWu8SU5tFsBaXO4e3k0+sVPNt
	 nqN0bzHSO3abZSw5baI1i1sz7UXJpcv/DKrUXaRI=
Date: Wed, 24 Jun 2026 15:25:48 +0100
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260624142548.GA575984@e132581.arm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>

On Wed, Jun 24, 2026 at 05:49:26PM +0800, Jie Gan wrote:
> The AMBA bus attempts to read the CID/PID of a device before invoking
> its probe function if the arm,primecell-periphid property is absent.
> This causes a deferred probe issue for the TraceNoC device, as the
> CID/PID cannot be read from the periphid register.
> Add the arm,primecell-periphid property to bypass the AMBA bus
> check and resolve the probe issue.

tnoc.c registers both an AMBA driver and a platform driver. Shouldn't it
be registered as a platform device instead?

Thanks,
Leo
