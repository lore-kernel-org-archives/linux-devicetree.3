Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4C53939CE;
	Tue,  7 Jul 2026 03:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=dAQrQcmspPIplOEK4Vn5uclHDOvur7y2CB79883UBRg2tzvZ7tT5sXgGuSpfiYUyR/l7vRZvvUPJj6wpV5yMwNUOA7888xdZLcjqbDwdXyhy3AktUrQEV6OmrbaRPh3y7YkegPoWvd7LPO3CRkZgCieBrT5JViWpLvecZqahM1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=alD8ixMGRxbs1Hk1JLHgYGriAC3javRRISp62eklITM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5hqSOpnaJ30Fg/cC2JjbZsfUR0YPt0emvBTICAEWzL8ekn613fD6ULqK1jiTqBi3E9+dEa8Df5tw4Sq2UQZjNneiVYiPqhcUzu00vF5l85yhMz1GzWX0MmxMCAe6dZ3A5/5V59OHsqa29GgDNmG/XDT6FJWPO0kOZQUoBWOaq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeuqV41J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeuqV41J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB3B1F00A3F;
	Tue,  7 Jul 2026 03:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394522;
	bh=HA7N9KpHswcKpQqz8xf8UbkRciS9EUGzhWxKHcOyI9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XeuqV41JHUNuQJSPYPXlDeE9eSy8+bmMatSD/CvVpJ5RUXw1Ao2AAFU+s6YVehmxH
	 xO+xk6Em1CkplcYAd+jEtte3HeCY/lV3gwtsIbHqBA6g89z9K3cuBoaDK+vaW6TL7R
	 DNJRc8Dzc2SWgURZ6FZ58pYL/fTu1hR7hfXBiE0YweD+I7b2SxavOzvuaOX4UAwDr9
	 fjOFjMcTtvSHG3Mmz5g7Sn4c3o0kOEvR4y51zLyCnaWP1JvgHxW9UKuxMTxz4HWbbG
	 Eu1NOOts22h1h5PVXxzrpyewv3CvTP++EUwYVKrvxoBIJuruhbUnwHN2ApSajI0r6+
	 gtQlwYBgxPFcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz
Date: Mon,  6 Jul 2026 22:21:35 -0500
Message-ID: <178339449924.1938770.12997475707179403824.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-add-cpu-capacity-dmips-mhz-v1-1-85deced44b20@oss.qualcomm.com>
References: <20260706-add-cpu-capacity-dmips-mhz-v1-1-85deced44b20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Jul 2026 12:25:59 +0530, Pradyot Kumar Nayak wrote:
> The Glymur SoC has two distinct core types within the same Oryon
> microarchitecture generation:
> 
>   - qcom,oryon-2-2 (cpu0-cpu5, cluster 0)
>   - qcom,oryon-2-1 (cpu6-cpu11, cluster 1; cpu12-cpu17, cluster 2)
> 
> Without capacity-dmips-mhz the Energy Aware Scheduler treats all 18
> cores as equal, leading to suboptimal task placement and frequency
> selection. In particular, heavy tasks may be pinned to cluster 0  driving
> them to maximum frequency/voltage while cluster 1/2 sit idle.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz
      commit: e1a6af9411568dd4b135892d0f0905d676816196

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
