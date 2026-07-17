Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307C7376A1B;
	Fri, 17 Jul 2026 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258618; cv=none; b=rsDEC0Az6apnpvlk8Ko1y+QGCGPodF6YzkhrdJdQRK3BeXjdj/67cndRRlyH18foNP9HU0kvGgZmhqHzEpx4oByy+2fW2nE1SdwXpQmPw/gDGxgnPO2IhUr3791dfqmRtukHHuTvIq/pNybGuCYFDH+IbZL4gRuljCCVvSyEcmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258618; c=relaxed/simple;
	bh=fETWWgy/OTJgeTwx518jnBQEl/ZM5NLnCs1eAmXZK04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrMMU2i4/sAgDIVMzbMZzkhdZrPR0WVQ7QRHjzXiMq1caZS9s1WSAYxGdY+v56m9AXZdRNuVgaRYe8Cc2WcFc7X/Ur8DTwbwkE4wTSucGBrmRdzx5cqB0zmnWdKYbfOU8xgzWfXDxzo/3hOfjnY/1IIXxqlZ6oa/IVh5mWyewi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkTtBjzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkTtBjzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BE81F000E9;
	Fri, 17 Jul 2026 03:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784258617;
	bh=bpyrzOhmtnqm3LrPHq95yh85LnA4nEz2j+j0z/TV/4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lkTtBjzVWmYKqaN9agLWrg2hGyKH+zCMmkGB5EcJ9OO8B6hofvTR/zvMZ/balxD3d
	 toOM/AMD+GLRdBzochDK33wPRpLu8Hx2qIa49OO9UCRB5qUwt4TgweK6Q7Bmwy2hMs
	 ZEIsRdooObHsMgzv1q42rI1mVjhHtEHQWiA6cqHdEtjVH0jyIpAIe5BRQyZCwJlrmk
	 /lRbE4M9VF8Ue3O+rT/PFDd4sWJFASEddoVfa5HzykvdLUr6XaPUN6aHEFCBAkfdon
	 3YPyTA70QhHPFXgPSQZxVS0BqrA5SnW73hbvpki+zEeIAxe912SovhUFFcPq5qR7Q4
	 tGvJdpTjOPt0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sram: Document qcom,shikra-imem compatible
Date: Thu, 16 Jul 2026 22:23:26 -0500
Message-ID: <178425854616.1084804.7965648558976512392.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
References: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Apr 2026 18:08:04 +0530, Komal Bajaj wrote:
> Add compatible for Shikra SoC IMEM.
> 
> 

Applied, thanks!

[1/1] dt-bindings: sram: Document qcom,shikra-imem compatible
      commit: 26ead60b1a2722627759dc8c279ed336826bb5e1


Please make sure to Cc linux-arm-msm@vger.kernel.org, so changes like this
shows up in my inbox.

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
