Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8E3E0256;
	Thu,  9 Jul 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583982; cv=none; b=DcOkSFc+A4nLe1gyHCbHoRj/1KzPHM2iW4zIzt0ZpeZtlagZTzDG/c9EESr99pfCd4mRrUjd+VcHqLMFyqD9bM0+xzEDPB/PzZR8Ek69PxZzuYDIhzTX8i0qGp3rkclso+3yxK9+i1+TNhrkBk91cAxNVLVm0ps6GC146qivLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583982; c=relaxed/simple;
	bh=bBkeE04sPVgtCtzahnoLDApw3HsN8ykh0yLPfLK0gVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjaaWOFBnjf4wxsyG/P4vFKIoDk2BrI4GE7986vz3jqlG+ZaIH/iUZxxjDSAqwLaVEPdMIZS/P0ejVZXyxMxuMoa2S9xOAX8I/rwOW4Z8w8VOXDXZlMQ6gzn3ln3iFK9Kd3/OcKANtdPJ++HZb5E88WmMc6S5Q0PRCSzZ3LGFLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS+mytNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS+mytNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E361F000E9;
	Thu,  9 Jul 2026 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783583981;
	bh=DsxSqKUeBewE1QvpReBm89h1NUFp0Jx+VpOolwkxbc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oS+mytNwoGWa3dxIGDz4lglwz5Sl6tSYwBF2Q71P2TwFT4q7e1wyPlzl1r4jXlXOD
	 EBK75EQsPwsm8nh9By4vrx6wkrq6w63EQKHnT1XyJU0nJPiKjLPvEUkBzLb+JObSVS
	 aLcAlUF5QGRHlwxkt0IrknOYtLutxYJpmbZp+tUS/PReIoSlv5GTJbZtyzkwWHPoTF
	 aez7uI5WXU7BMH++Cu7578UdbAerPv+EwK+qivXPepP66FXri5+xhC8HhkAHwLZvse
	 sZ298ZrepPpJgkE7Uy5XDm01qQF9rGCXGOSjuwPwmxPNCLVkv8s71IIO1VNCcTzDcW
	 FrwH2SiAacyRQ==
Date: Thu, 9 Jul 2026 09:59:37 +0200
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
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
Message-ID: <20260709-versed-marvellous-pigeon-22e2ba@quoll>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>

On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
> The TNOC compatible previously required the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
> AMBA bus.
> 
> Change the compatible to a single "qcom,coresight-tnoc" string with no
> "arm,primecell" entry, so the device is created on the platform bus and
> bound by the platform driver through its compatible string.

I asked already: this is not a valid reason. References to Linux
structures are not correct here. If this is your reason, then answer is:
fix drivers, by renaming or doing whatever is necessary to platform bus
to behave like amba bus.
> 
> Drop the custom select block as well. It was only needed to avoid
> matching the "arm,primecell" string on unrelated nodes; with the single
> "qcom,coresight-tnoc" compatible the schema's auto-generated select
> already matches the right nodes.

Why are you describing the diff? It's obvious.


> 
> Update the example node to use the standalone compatible form.

And here.

You got comments at v4, nothing improveed. Your commit msg tells useless
things like what you did or you want different Linux behavior.

Best regards,
Krzysztof

