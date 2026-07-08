Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0BF4DB546;
	Wed,  8 Jul 2026 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522650; cv=none; b=uV+rIn3HgcarW0/uFjLmvrjBFRhSZmEluD2YDRY2hPl84aYkvJct4uzATu/JFLiI92FbJAeTNWgJGVwT3rYRRR/907Xb0/bscJqwoOe+uFe5anABRDi4XBjllW9vI2iIYPz6oiFE6597pSm3aPY+qSrW3d6VbpmjJteAxCO4qOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522650; c=relaxed/simple;
	bh=SX6vEIbyS3xboMgc1a6+vdEYbGTfOPRzB4l+f7hAid4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CD0LX1l4bxs9CDueQ0mBVG++86DhZGYr43NK129C7j+01ILSX9lzpo3lqUR1ugPzeI/VYjBwalQ/TVH7Vsck0EDoCWkr7ikFc6LuyKsoO7QxJNq5Lyl+4orQncnLrMqZ4j5O7TB98I4a4MZ6/Cc0aioJVu5Cvx2s1/dTubMFsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agDWLcAh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agDWLcAh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640DE1F00A3E;
	Wed,  8 Jul 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522649;
	bh=360FWGzCC0O4tuIsLh9wwXRxwT5z4FnEJJG2zADhv1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=agDWLcAhzAR/h7YpBd42qaJE/Ce8+BMu5uVGxKciiH9nDgbB14dE0PnwE6FqAaoSf
	 3Ah5whZVHMEbrRJK+Xu4XEuJ36K57eDQpC25qaeekhxSz0xTWsQ1pz232khx5BVCBj
	 I8VA2z3HswzYkjZRLR0FY2UzRTdgGKLCxg6lW0QRP7JWeX+Ezis3FmLPy078c7RLWH
	 SE7jdXLgQahEszUU0OSBn8RSu7Vr2EEGnYZQ1guEnV/54+jdxwcG6/9FKis5YxjvK9
	 1gvM5UJvOzIh3C/Qd/dO6ZACDGzBV9Go5N00SRaUhEB2LC3rGPbM0ncprNEVj+5Fhm
	 fsaX2D9EkBTEw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: soc: qcom: Add Maili soc related bindings
Date: Wed,  8 Jul 2026 09:56:29 -0500
Message-ID: <178352261583.2235436.5619819880055977794.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Jun 2026 22:45:43 -0700, Jingyi Wang wrote:
> Add soc related bindings for Qualcomm Maili Platform including aoss_qmp,
> imem and SCM. Maili is the new mobile SoC, and its DTS will be upstreamed
> later.
> 
> 

Applied, thanks!

[1/3] dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      commit: cf14d0f9e75c83a0879c1fcf2e85972b552f26f9
[2/3] dt-bindings: sram: Document qcom,maili-imem compatible
      commit: ffc5383f2c180a8541ff05879b39afb19513732e
[3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel
      commit: 30783d878a26da939f9a6d57a1d7012cc553e340

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
