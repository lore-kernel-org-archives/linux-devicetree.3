Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF7352005;
	Mon,  3 Aug 2026 03:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727463; cv=none; b=mwFsDmPIGhsV0HVN/jnglMbPk8FNWORtPJ1GxW8zEnSvqszs62jLhIHNchlAbMdDnosBKKXdasqcmu8gjXDTu9owrlRi+xKWWlSYOXO8Olb8YnjMMFCh+Xx+95jwqX5gSzj9RmSStlgo7cv1Gra9yFenrXV8Hq/JBdfZkApvisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727463; c=relaxed/simple;
	bh=cuVUFYg+O2F44tSCPJh6/Eqq3ugAXZonPYwvFbXH35s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h224ZJt45CK3sAeQiv11dymDvQeRL1CwJFLsbuhfSJM6DHpZEG7ZjPLHX26NnnqFyc79VlqhihXsKKN4S7pY2AAc5Extl8wCUN2pQfTQNvUSDNMGNlQTrFmBJaolDhpqxr31s6gL7qg36ML9nVm5QdaHN6SoIlsoAzc2/YhjXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwTjRD7K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwTjRD7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CFA1F00A3F;
	Mon,  3 Aug 2026 03:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727462;
	bh=xwTQ1V+ziMONcU7YEXPQJF+813yPOnj7DTBRdYNXHb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BwTjRD7K/wjmH2K/8ogODClDLNmS+rOFXVM9wsG4npaxi3VpXzS1GcWoUEe7FS3zV
	 iPJasmEZYaAWggJBm+5PWo4gzgBxoLJkdWoZPvMhNWdbBKElo77waFCeQ/3HboIsfX
	 Iii5G0liv2/WD9CJNzFzS2eOEU6NTBSvGeGiF2yzMax66WMXnRiZLh+eHv74S3fFO7
	 uQKfUOkWpyv2yZHWZo63iYcZHzPSu3JIh7LSG3miNkhPl62B8kqRePmGia7vKYLgGh
	 0u/rhr9m8NV1toPkK3u7OTzTI5hRPR9vW9Yo59jXh4b02L5jBiJtSl3rRlDQcQEJcu
	 7dsnUOboCSXYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/3] X2EE ASUS Zenbook A16 (UX3607OA) support
Date: Sun,  2 Aug 2026 22:24:00 -0500
Message-ID: <178572744557.408250.12397107472962992812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 19:11:25 +0200, Konrad Dybcio wrote:
> UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
> of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
> Glymur platform capabilities.
> 
> The hardware wiring is very different versus the 14" SKU - the larger
> one is based on the System-In-Package reference design, unlike the
> smaller one, which derives from a more common Chip-On-Board base.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)
      commit: e8fbbca94db752ab94d9dadf2f65872905eafecd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
