Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840F3A640A;
	Mon, 30 Mar 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886534; cv=none; b=kHRYTU5TuXRw+9zFvnDdjFoBMsdlSqjBQhEcjTM+yHSAL76+uijtMaY0Yc34okjHOMe2M4455v0995LPyztfJIqv3EQ502Obe746wC97uD4thXoXyN2SjsF8g+wwF3ehKVjVkayMnk71AAKRI3zRS4x44pP0+TgAtpLeqwCIGJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886534; c=relaxed/simple;
	bh=F7HllfYx0vzeouH/tlrhRayzNIJSaJoGanZwGaUuzjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGhfeg6bjnbtRGRllEBnjgxseQOJl2gnggmwItuP3ra+V74JOVfhNVkU3w5AHGxvJXukvxK1W/DMVJCLOjKQgR8AT7KfDvnQa+4+Wyted/Wch0v86/mQ9zlEft5VIZYUfRU1PQ/clYbLKmG7edIidRqIfqHQHFnYz4ttcQUU9BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUov4H7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUov4H7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC10C2BCB1;
	Mon, 30 Mar 2026 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886533;
	bh=F7HllfYx0vzeouH/tlrhRayzNIJSaJoGanZwGaUuzjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OUov4H7agxcU8rl75fx0HCl67JULWFrucrVkKcQhr2dQA8yDfV9A/XdI0h6i83LbR
	 5JKvqeFQhfNhbm0Af4y9/RM7goVNyi2qiLyrCD7eHgSfxuRO8S4aYBeoiMeQCCz7cj
	 PzCUyMtv6qf7huT5RlBPLUYlZQrZWp0beKhswJ6Dk96x104BlEJj50duhYMrGU/VXK
	 Kn+UlYWuSezRalywXZL1BD/M+akqp6CbwF6WS/LiQwcnrKkiwEnuR5GaEFzaT/BCji
	 xS7F+JU3Ka8S2dPTeM/qjGvTT1kp+kKirrUMIuKsq/MPViboiREGkbrJB52nh+y+xO
	 23RmRjbOxyQgg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
Date: Mon, 30 Mar 2026 11:01:32 -0500
Message-ID: <177488647750.633011.397843521094873380.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Mar 2026 15:41:11 +0000, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> 

Applied, thanks!

[1/1] arm64: dts: monaco: extend fastrpc compute cb
      commit: af0d19ea5a31261e1e3aebbe7c7e45c57c4df999

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
