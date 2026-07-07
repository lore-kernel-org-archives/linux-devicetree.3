Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986D37E2FC;
	Tue,  7 Jul 2026 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=p4Ll20kqtlxpwafeaCqIk+GMKJRuH+UcnlN5qknAtPXS52PGtH9dFlqdONL/0xKPukWQMntd1/1HOWQwDx4wUJbXuDPK4ta0I6idKQcpYW+v3eAVmTtTyNFjp06Hi3ubjg5hwAAu1A3y6XI6dVaBktg9LZtOL2iNa2OU656QvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=+Mz0lDHZM65euwCClVEV3/3hhwjkMaLotwxVttV40Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9djEsC8dlJfFns6jKdOcclp8UZyZtCqaCfaTGMUpTtGhdpuhTUXKyooYb5TyKFiHWLN+95tsco89jBl9puyTWS8UWhm1GTOpn92F1dKEalojqPwcBzhRJqCHX2IAX2wEADqqPoxCCIhis12tM9RWEDurNzRBqLXDJFIuGYgXck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/bHQFaK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/bHQFaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC891F000E9;
	Tue,  7 Jul 2026 03:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394524;
	bh=OgvqtIjbsw64Xp7HW1oDCHPeVc6N8rH0/c/9s9fdfEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g/bHQFaKTzZaKFYIpBVkCyiOwyZLj5BY8GbDcF8qFNvjQLf5JgpnyvpF3324Ve+2x
	 PgJXu0Fcsh+vdoN8a5oRdywjx5/yNLwdrITqo2qfLD1gSLPabx9LHNokAXAzqjWCpI
	 8Yx8By15CvfN5pAaTH+j6zMg+jwM2jbjvYw4FlqdNX6HQ1w+kBxefphsvLs7STOw+f
	 BC1PWAs0D9ivRDyLIHmKl3xcMC1ATgL4dRUCwGEkVOh+7Mz9rRIiNC6VTIkt8jmjNN
	 DLsICo42rqwTOtWv53H8cKv6nzzZoAPynCZDhnhSn0d9JIQAPtx0X+iPNKPF71KHAD
	 9ODppOMc/B2JQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] Enable ADSP and CDSP for Glymur SoC
Date: Mon,  6 Jul 2026 22:21:38 -0500
Message-ID: <178339449923.1938770.8689835038217690542.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Jul 2026 07:42:22 +0100, Srinivas Kandagatla wrote:
> Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
> that the firmware streams of the remote processors are managed in kernel
> and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
> Qualcomm SoCs now support running Linux Host at EL2 [1], this series
> documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
> fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
> hence the iommus properties are left optional.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: glymur: Add LPASS macro codecs and pinctrl
      commit: 859c3b73d40f961c4d1a5459effea6d9a947f879
[2/2] arm64: dts: qcom: glymur-crd: add Audio sound card node
      commit: 67be5d3da3455db75684344aab871c68701b6094

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
