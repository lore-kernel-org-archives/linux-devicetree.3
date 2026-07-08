Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404294C9006;
	Wed,  8 Jul 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522638; cv=none; b=gPa+ruGzj6CX7lzi0Zkg3uaRz9V71mvL8ngqMhhgFHMwJD1cQGWHbSbnk5B74xSjfrB+kKzSIl0jWenoI20frz1ijb0egJfqIa5gMRw1d2b3vQ0jVzN5DCDAk+Px6fdF+EnE9+s/+pkIIJjPE4nXv2y5E8CxxjDmYZxzqwLL3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522638; c=relaxed/simple;
	bh=eCOpSLgqCYnkTUZMl3hQRWFikbymZBPxdIsh4sb5eEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q1AB1wYfmBkMx8jKl0gF+il7y6BbzQI6GW2/2UX3Fr9cWC6OpwQGF6Y8py0BWCJjfOulGzB062KpsbRsRTzr/DjgslBxEezg55bgJgS6fpNb4Wo+UnDtTs7udk2poBrybuDlhvq1J++SByFoEkPYgLg7REJnFtYnUbdnwUene34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8T4zvnF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8T4zvnF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A87C1F00A3E;
	Wed,  8 Jul 2026 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522637;
	bh=nPWZonb03PtbAR9YXvx817ZpbLUbhIj74pepD5TMjK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h8T4zvnFS1n79sXMrMFmmawt9nHI/IYPIS9XS0iSFP8LhRMk2LqtByMBJCLN7t+Tg
	 e/OUiolYRQFWLQxzAFmMWUIZF+cfFLLJzdIdqrsKlHi57BbrQOQVn2cQOy91R8ignP
	 eCcGygcumJoPBV9ahCau7r5j/HqUHvjqSeN2e21KwnlIVNVU4AVt+lbkjvlXcx4aJt
	 y1Ifs9uLc6ejAAfutlKVy0ad2WDvsy+LXl9KMFqVLm3E2QHBZzoGjJvpOyZlmVriJ0
	 psQD0Fwf23WEGmj/TR+HiXW5OZlZ8D5MUrpxFjQ1+T5c8uiT2cBe88BVqnrhsT1+7A
	 wciS6dMDvGT+g==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	kernel@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili compatible string
Date: Wed,  8 Jul 2026 09:56:17 -0500
Message-ID: <178352261613.2235436.2765406559343674556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>
References: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jun 2026 00:10:13 -0700, Fenglin Wu wrote:
> Maili is a mobile platform that is compatible with Hawi and Kaanapali
> platform with respect to pmic-glink support. Add Maili compatible string
> with Kaanapali as a fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili compatible string
      commit: 05b03f88af1fe82d23b5f88b286b1ac2987b3177

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
