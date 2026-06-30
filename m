Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A8639D6DD;
	Tue, 30 Jun 2026 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813677; cv=none; b=JlQ2H/u5+Al0tb69os+IAyATQaxi0DUMbkNivDmenY8rhhRMBiz/fE4GhymXjECD/alkyUPSl7Fqm4KwCf4zGp9b8OKI9SOuelRbg+TQxstVG1DlfyV0SvWtmXTveY88DuK5O6Ckb1HfXTkGZVaBhAUH3sfRSsrsaHMZ9tIUw1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813677; c=relaxed/simple;
	bh=d+GmTPQ2e6Fd3lhsWPVjYHOk225B7AvxIuodTHF3pEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrFUwJsDSj2EcIc5cC/EE0UqF4Npbjq+mhbqYyPwXyBBtvTorQALcNoZA/0zXeBUE/QOszO3lTh/xBD6g3xGoVBQD1Zr0F1rd/MF0ULmO2dwDPlwT7HXCWlH9ACdsCvOo2WZUY+ugX0bmDa988KbAKd3N5bv4vwq2M/HAcMnMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ePlEpp/U; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ePlEpp/U"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A869E2C3E;
	Tue, 30 Jun 2026 03:01:10 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1FAD3FAFB;
	Tue, 30 Jun 2026 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782813675; bh=d+GmTPQ2e6Fd3lhsWPVjYHOk225B7AvxIuodTHF3pEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePlEpp/ULFoRCNkiXLe2wgnWbHFer5U8AJmk00fBT4PXXP0q+BP+U+4PY15JneRyI
	 3d3AYNqFPfX0TLynt4odTD1u1/fryDKGBinH0RTeXIiGcxuc313GYgt3NtZh0qIJ0+
	 929rvDLrRgTlpGVzgVXOidm/HhSYmXtvtPsZemgs=
Date: Tue, 30 Jun 2026 11:01:12 +0100
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
Message-ID: <20260630100112.GF1812158@e132581.arm.com>
References: <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
 <20260630081021.GD1812158@e132581.arm.com>
 <37017aa2-e18c-4568-a37c-d13964cbb418@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37017aa2-e18c-4568-a37c-d13964cbb418@oss.qualcomm.com>

On Tue, Jun 30, 2026 at 04:42:39PM +0800, Jie Gan wrote:

[...]

> As Suzuki mentioned in the other thread, I think it would be better to add
> separate compatibles in the of_match_table to distinguish between Aggregator
> TraceNoC and Interconnect TraceNoC when probing with the platform driver.
> This would allow us to allocate an ATID only for Aggregator TraceNoC during
> probe, which is consistent with our original design.

Makes sense for me!
