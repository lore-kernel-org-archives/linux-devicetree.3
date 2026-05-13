Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B53B19A6;
	Wed, 13 May 2026 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699330; cv=none; b=L5rghmBaMf7X24GBJcr6tvEl8JRfXJ3Rn+co4+owlqABKmJ3lsIvW0RpEEm5KzebvnSldxnntU2m1Oa+gr2VCEJbf7yJd3Rl9jXpFr5jSee8G4aa+WJ6uDJasmR71GfK1cnSzOS4YHxWI0Pu2xxU5SF8A/nV5rdnzVXQpq0sB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699330; c=relaxed/simple;
	bh=mURIqzx0JjJVv9EXIzqb0yL070idfdJzdJasICxDOVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGquoDLgoamX+dTluv15kBGTlxd6LSj8DCXQTAYtofwufLJZ6YsxOLhiLRFfJntwZVplsNpqGzNBZF8uVjSPDozYQ8duF/UdBLc2o+3pm47ppHlynpkA+INhnHX6f/xHaeYL+A18xebGFaWEbD6v2aaO9G7bWobfDtGlYKKLVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMvsd6Kd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMvsd6Kd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0A2C19425;
	Wed, 13 May 2026 19:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699329;
	bh=mURIqzx0JjJVv9EXIzqb0yL070idfdJzdJasICxDOVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aMvsd6KdO3+bNpAIO8YRefqyHlD8sa5bV4sKu2Y7eFmiJQWqztWH/TuqrX4/uL8Th
	 90gjc+oT/2oUapR8bNTNCVdeZg8lc0n+dGbgwYOFg5wojBruf+mMzlwhhAB0doWuKl
	 1mHmuL9NoG4gXGAZgNtAGixRcvI+iexXrDjmSuB16ZeyycNR45kSRfl3Ao+kY/p7ZS
	 yc009YWid4DtLnBDOZ02TrgSZawBs10jLfCQzdJR/TdDw5KSonnyKgJnOqKHyB2CXs
	 gpI3AZV5ayDMA5R5cn6q0IsmDd9Y2GDu9N1rzFCIOHS0BSXAyctdgVB57I/7zKfWv7
	 3z01LbZDjOXMA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi compatible string
Date: Wed, 13 May 2026 14:08:38 -0500
Message-ID: <177869930357.1496076.794710023149652974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>
References: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 19 Apr 2026 19:37:37 -0700, Fenglin Wu wrote:
> Hawi is a mobile platform that is compatible with Kaanapali platform
> with respect to pmic-glink support. Add the Hawi compatible string
> with Kaanapali as a fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi compatible string
      commit: 676f67060adc0ca8311b392134b3e0831f75fa91

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
