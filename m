Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D373D175A98;
	Sat, 11 Jul 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788049; cv=none; b=TRTj6icYjflqwBFVqedW7mz0nxRVDRp9ifJrwOvpdlIFamXifV4PqqVwwO7GIaIwAp0ofQLConiwMk48FSRkoNzumOGiNU5cAHtmAfw2oqqint2vubDS/IQ2p6KvrcCohyAF/4H8UAKY6Ww+0ew1j5XW2MTvmPMugJ/nA6doNg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788049; c=relaxed/simple;
	bh=DkbF6FsyD6boBATCsY6ugJGzZ2/97+BBnZba1ri/aas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKQh2KLk1DOyKGOUxXCAfktTQq0jV3rNCj61iHN/goX/8A5ByGL0m7ftcTFr2LsCQTr9JEo2vB/COxC9OgVOVQe70xd8TB6MxnVGur4qkZqE+HJghS/1alODtsOBzfk9+RwzucV02IM2wvZ/cBnLfe8oTUP4V4GDsvZYdAOnRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMMZZi4r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMMZZi4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8629C1F000E9;
	Sat, 11 Jul 2026 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788047;
	bh=pKM4pvakO5SiHDc5KMHZHjgkwz//HxCUmDGbFQvqit8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CMMZZi4rpHHYFODn+llPr46W9izZax5FZ7zZNhKISMtRRmq7fBQoGGrd5Ai4tNje3
	 6QSYGCtR84H4sggtzxY/FXKhZXL64ac/AOIXFkQe3rsjKa9iVSRSi3X9Xg5zYUaR0f
	 kZrCR6Wb5WmW7ItuQwfhlyK2V3fQjOewenB6BdhABnUCGoJeNzY5rgKUw/5KClUbmU
	 dsRkwMKdFGHTg5Lu5Bf06CYnIHYVH1NHN3iF5L2vRSE3MDnVNqWtEY/3jbc6Q7JY0A
	 TWgMrihVO/YzRuarxVLjU+oZ1ODADBpCGRnbxKYfO//OD+Fvu2r/+3Q9BOfKUW++qb
	 vcEBClV9edb4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Ajit Singh <blfizzyy@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Sat, 11 Jul 2026 11:40:34 -0500
Message-ID: <178378800443.138068.8763713563230008567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624125443.18729-1-blfizzyy@gmail.com>
References: <20260624125443.18729-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Jun 2026 18:24:40 +0530, Ajit Singh wrote:
> Add initial support for the Vicharak Axon Mini, a QCS6490-based
> single-board computer.
> 
> This series adds the Vicharak vendor prefix, documents the board
> compatible, and adds the initial board DTS.
> 
> Tested:
> - debug UART
> - eMMC
> - UFS
> - SDIO WLAN
> - USB 2.0 host
> - PCIe
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
      commit: 36a8878d309b86538c6a71ba8e9a90fc74bf410f
[2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
      commit: 38547879cfcc85ce83ad2145dbd6a17da2094e22
[3/3] arm64: dts: qcom: Add Vicharak Axon Mini
      commit: 0cc8e47568df339adceaa0b0c6167c664daa88ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
