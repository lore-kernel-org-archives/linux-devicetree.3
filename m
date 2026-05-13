Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E33B7760;
	Wed, 13 May 2026 19:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699382; cv=none; b=Ex+zAGUZA719M3yOzZB4wS4CUUBBnIOuWTkoYMeH7eNKjtMmjybGhdR2Bc0eo+NtJ2f/+AbYOkD1M6HJ/gXcL2mmHFB9xgKLYFA0Xx8mKiytptWX6n7p09QawYPsrM1rLo48Y2zqjyU+auzr35538sNGYJDOVt713cv4vlRUWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699382; c=relaxed/simple;
	bh=6/ociExjtV6vhAl+GsKYMqhoQTxUPogAjlhL72GHJ3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffSr6BLzWdVT/agT3iernUhKBAe1E0qX5TkDhTApTGj3VzhrsQeGvkZKnv33Uv/9Ek+YcgEayE5qojMUQNUNNPsdoW1Uk2lDbdDapEMtvil1jNen51iN0YwrfJuDU1g04RjO/RYiz1mgIitJG1XuUwCefblC2QefQQAWg9+osyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVDaVu5f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVDaVu5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DC3C2BCC7;
	Wed, 13 May 2026 19:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699382;
	bh=6/ociExjtV6vhAl+GsKYMqhoQTxUPogAjlhL72GHJ3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVDaVu5fjkkYMCdWhwhR+1sPM2/saZxZ01fpAqQq/haRT4hL0TqYCCgrkHhm0yczH
	 fLuvpwQLZt0LiuzvC263F3VVCJYaTY2SOrKePLB4WbX2IOb71OJZpqXFyDpNOOhfNR
	 z/nOZJ6JeGchc35EYluzRy2U1LV9MCjPbdsj9I0v3NlPiZJRXJyZh07OO+993bnIlt
	 tfQtwHyTwhpFEXCWgsMXC3/j56REUWyEaO2e0uIU1JtweqieQas9r3Y5HviLPCMWxK
	 t98bTdfIBS7XwukpBQuWQ0FS0TM/oirpmOBaBoY+cX2VA6CSIkc+++ruOn/LnuK/Cp
	 OdLDk8TssPJOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Eric Biggers <ebiggers@google.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix ICE reg size on Kodiak and SM8450 dts
Date: Wed, 13 May 2026 14:09:22 -0500
Message-ID: <177869936444.1496622.9706192602624787382.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 02 Apr 2026 00:05:08 +0530, Kuldeep Singh wrote:
> Update ICE reg size for kodiak and sm8450.
> 
> Ice reg size for kodiak/sm8450 is currently written incorrectly and
> doesn't match hardware specification. This series attempt to fix it.
> 
> Note: I attempted to send patch series to myself but some mishap
> happened but patch isn't sent to ML. Sending it again properly.
> Sorry for inconvenience.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: kodiak: Fix ICE reg size
      commit: fa9c7403af64d3e56a6c20dedc60e0a55b527509
[2/2] arm64: dts: qcom: sm8450: Fix ICE reg size
      commit: 7fb3d0512dacc0d09217eb45057357f00298203d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
