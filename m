Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536274D991F;
	Wed,  8 Jul 2026 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522649; cv=none; b=bHvLQUW6UmoKgTH3uixqYVcaXRKF2KHjOcxFfu7I1qwCozOsHJnyhdPiQ+KrY+ovqdTvXD6OKuo3Eot3Hw2iMrPSmql7yu1WH35uM+wtPjNR+wtCCI7N0pm8QpgalgHFqwmZZ8qYN97lOfPjlyH9yvTAYSy2NOppMQIeKoCI73I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522649; c=relaxed/simple;
	bh=q+0W6UvCkP1gb6ftPcDKFWsaPUEd/H/KkSCvYGpZcmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKGHbFq+gHlxBbcOKl0+qlpfYXund9QJkXyxrb2hHKrC+7AYoVEWCF0zn5YPZEPGocL45LfqkFGhl0BHUCAYT4FppWF3zcOSIP+hfJ6Zaksz6MG8xmiS4blxLMoEo3IizKgaGoRiCY7FN//8QUpWqB8+VHzOgs4ZW6Aeif7e3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJh3jx5n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJh3jx5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0E01F00AC4;
	Wed,  8 Jul 2026 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522648;
	bh=co3Q5kAD6QZZzu0SzFktKGzGZ/adQS9IGN3j4oDz3cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FJh3jx5n8A12lgCMOIrq3IkwQFjslZpvUixdnKe4Kkxb5po2KKlQSoxUXV9vXSTW3
	 wPVM4mRWThO3XogOBCUpCQs3RDYiIS39Rd3mYVhmnft+XzE9amGu04LE1cxgs7bVgS
	 WzP3iVs81VlOqJ+DMRBHOv52Q+AB8RqWL1mRHkGKAVel0i8F9PENeTCbuj7a8EMqMN
	 ul0625YL1IH2LgHM7cGblVKxRJnyqWwHi6L1MPkszoEOQF3aBbC0aVMJeWT2GRgRXQ
	 LZ6+7jHfbbfMYXVrhN3PN9lpWMSMDKR4t2a++HH0XhjSrF7r7dYJKy30mX2dlDsxbD
	 ud2FeNAmElXXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: Add label properties to CoreSight devices
Date: Wed,  8 Jul 2026 09:56:28 -0500
Message-ID: <178352261643.2235436.9622439153380754131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
References: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Jun 2026 20:38:12 +0800, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the glymur device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Add label properties to CoreSight devices
      commit: 612d3cf7bb099cac3b948fe99608e0388d26f247

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
