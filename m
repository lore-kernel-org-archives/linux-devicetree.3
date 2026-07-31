Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82775357D19;
	Fri, 31 Jul 2026 03:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468306; cv=none; b=XR9s5zwwbDl6GfnpRQz0Y3BtNFOwmv7vk61BavgVOVfY7Rh9q9LGjfhFRyRnPaxVCC7GeIfGRd0tbYsPTnX5DKtoWTEONDmvQQl52fOyKCWIWIs+Sgs/AXyI2Q3WHTozlKdyA35eWn3Ey5WxfUcEIttuiOVJzDPeKPeMJLFWYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468306; c=relaxed/simple;
	bh=/CozXdVYRFBgqIx3gXqGBahXZZwWg2RX8ZJ3Ew9weqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1ZWjBiLSB5NoaICOHupSSnI8+Bg4tUmzZdFvNzqzGuLxHQzSLocMgcpmd1rGv/M7pjh1FV3+l0EbkCY2G9R5xqXzgVCjJZB03MYElNPcK7nWz4+12BZBbQMp2T56mPBYnaqNYPHFeDV51T1OlIXchWGVKbHFUUU2JO6C5qpIkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7Xmzw5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7Xmzw5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629001F00A3E;
	Fri, 31 Jul 2026 03:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468303;
	bh=kHSnNHgNIJxAE4JM7VBVR+qD+ZFP19PVdAkmYvKU7bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C7Xmzw5BnWL+Cm+/pShLKpnaCWSVTzzY8QnkJA2hiAy+mOqYMZf/eP3X8MmCoxrot
	 vU3F9zPFd5yNJ1vOC2fTWygr5pkEg1o6CoPicNS0/xFogbzoNnKPDwhmJrhqybqmZ4
	 a35IeNN6d9uPdFeBf5WjvoovpBGy5mEfnZFy/Lo4vtDj2/KPTRskLftxmxsuqYLCZw
	 7qYuUho9fAjjQTY2pIviQsCye28k4Jp+luPxba9sOvX/vABDnarO3o8BtIqIawV17d
	 f9EQmn93DsWyriSD2rT04h1QGdUfSyHYACxLUusxIHbiX+4/SQg1roX9AzUrx/FSiB
	 jq89YODTamL/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stanislav Zaikin <zstaseg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem override
Date: Thu, 30 Jul 2026 22:24:35 -0500
Message-ID: <178546826839.316815.12078225254771791081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730085422.631896-1-zstaseg@gmail.com>
References: <20260730085422.631896-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 10:54:21 +0200, Stanislav Zaikin wrote:
> taoyao originally redefined adsp_rpc_remote_heap_mem at a fixed address
> to avoid overlapping with cdsp_mem, since kodiak.dtsi's version was a
> fixed-address at the time.
> 
> kodiak.dtsi now defines adsp_rpc_remote_heap_mem as a dynamically
> allocated "shared-dma-pool" region instead, which removes the fixed
> address entirely and so cannot overlap with cdsp_mem. This makes the
> override unnecessary.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem override
      commit: c8748463283738aacf323eb3f7853e6533d941dc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
