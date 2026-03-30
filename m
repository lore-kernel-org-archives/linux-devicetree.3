Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D643D1CCC;
	Mon, 30 Mar 2026 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886536; cv=none; b=IJXPD5GKMBACZbaIc+YqJAwcgiRfgWiwn+XFYxKU5vhLZmgCXK5or3Cwg9aUuQjh2rus4XpPET8ciBCo1hCouW/Lk8gypliLYspkWi0bRQbf5uePXZu20pfMNRr5CuU4BPfXYQArtfyk3Hfx8FIgBlpncYtD0/DOPmPDNLyaxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886536; c=relaxed/simple;
	bh=rP04EDSFzfbxyG7JJYP57XxGa6ccK5M6xzlfDZXHnjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXOQDf/opo4VK6HD8Vt3Dti8cY+rk5tL2LfzFWTxhJAYA38LW0XY26qB5EWi+AfCtq3RtVyrBqT58+U18ziNKfPbjqumzGMAIzCuc/EQZOWFOyphRBYwEF6u0koQC/6HgarX313st3UXZvcv8gP9Ea1pDOCSoZ7Q3LDZ9WtQC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RumY1rSd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RumY1rSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C73C2BCB4;
	Mon, 30 Mar 2026 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886536;
	bh=rP04EDSFzfbxyG7JJYP57XxGa6ccK5M6xzlfDZXHnjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RumY1rSd1oB8rOgBdViL3j+G7U+jobTaRB40U2NoBbiTtSFZxtL3EzbjXAPZK6/ZK
	 /ECeda2Cfy91Oqv9K0ED9LWZYwcepAyS5om613iORCFoGUCvwmCfhyOtYT+9MLCaPB
	 aI3GbXKYNps0CaqIL+Z93PsFLVFubtF+ux2Qvy7srsMfvaKbauCa8HZRN2S8TCZzkT
	 7AO/fZdaaGhanD41+3SwRKdVvydaEwa8ukhKmukb7cVhScIUjEZhT+tVXTZZqeldgM
	 TSyO3qURJD2NpkhzAqNJyJAbyZjHpX1uUad56Q7tTcXXNGnLtbY6jXHAbiWoTq6Fjc
	 78Ih5eBJb9gvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tobias Heider <tobias.heider@canonical.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: cleanup remaining zap-shaders
Date: Mon, 30 Mar 2026 11:01:34 -0500
Message-ID: <177488647762.633011.4436482950757265411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 28 Mar 2026 16:49:20 +0100, Tobias Heider wrote:
> In commit 2377626fd216 ("arm64: dts: qcom: add gpu_zap_shader label")
> most of the Hamoa DTs were converted to use the gpu_zap_shader label
> instead of patching &gpu directly.
> 
> This fixes the remaining ones that were added after the
> original fix landed. While there we can also remove the redundant
> memory-region property that is already defined in the original
> node.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: fix remaining gpu_zap_shader labels
      commit: 79772ce80eb9615b69b00e77135bbfc6e4b6f158
[2/2] arm64: dts: qcom: drop redundant zap-shader memory-region
      commit: c7c8ed27b71272fad8049d34257cf8ce3e37b097

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
