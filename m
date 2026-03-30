Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313E378D8D;
	Mon, 30 Mar 2026 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886515; cv=none; b=oUCiAZFlr4RpLQfiIniCp7MHjEvCIh2vw6bihKgzy+NP+Y3jABSe5tqkANo4sqGxA64XEV5p4obHz9Ec6mK/MRWJFv87YsRnmcljU0eQyCR/ddjkr+nUCr5kJGxkIjclSNUlgliuGPvzXtNyH413Z/ANhQ6KrlUFWfZjEE+d/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886515; c=relaxed/simple;
	bh=2q05kcOGYH4miihvecwHGaShdUjVihansqExlAnDv9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVswJhpntAm+Kenkck/wcUsQDVT5v/+Cw6jMz4PQOSHowtcqs0nN+0QuTj/r8TuBjpPVRbu99IcdITNTKYv24a6A/TmxVuohTJ6zNuYwlS2Ae7a85g5LANXm24n0CrJmRHydDjFd2wkFmSncNJwKIVJ3pqE7QL495FriWJBXRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lM/I/ykY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lM/I/ykY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D29C19423;
	Mon, 30 Mar 2026 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886514;
	bh=2q05kcOGYH4miihvecwHGaShdUjVihansqExlAnDv9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lM/I/ykY4Kx4d5k2NqwUGZEli9cwHyglf6BWPWaRYxVfG3dZc/hBmIrx4H0hSGLaj
	 lJrr7eFrLU95WuU3GN7kvfFf/RfbglHlJzP6CkFf3wXmbsL89MQa46TudaHnycLCFd
	 q7hGNNoQoSMaBfZ0hL/UqY84IMz7LW0xRmQEyvDf4wvPEc9wZt4+x3Sn1QpnXxXRIT
	 1gPeG3znhY+wbwzXQfHppfh6jAhDybITjlQ5g31PhVPr+m00hsS5E3YC8DEFuL0YAt
	 CH9Cusk4f7Vjwo7sSIW8hnVxLQaVD1Oozu8JwSo/tz4027AyK9j3L7OSSd9E3+fPrL
	 gHl2YLGnNSnIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: enable UARTs for robot expansion board
Date: Mon, 30 Mar 2026 11:01:14 -0500
Message-ID: <177488647759.633011.5997983880216734366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Mar 2026 16:30:59 +0800, Canfeng Zhuang wrote:
> The Qualcomm Lemans EVK and Monaco EVK boards expose a mezzanine
> connector used by a motor control expansion board.
> 
> This expansion board hosts an MCU running NuttX and communicates with
> Linux over UART, with all protocol handling done in userspace.
> 
> This series enables the required UARTs and assigns stable serial aliases
> to ensure consistent device enumeration across platforms.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
      commit: 0be638f326c2015ae9406f4238d9bc54b5b7a584
[2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board
      commit: 74620bf0c3c6091ecd7972075f5ddeba29994407

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
