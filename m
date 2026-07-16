Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07823344D9B;
	Thu, 16 Jul 2026 21:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237080; cv=none; b=O9M5GhCtaHQp0QvO1jMbq3uG8lPtwrbzUh4Q0vhBJJyU0J7eWnXhzPuDKB9tPCo71KDTaZJLGBGpithB4A92fVVq9L+d6TtM5cXRTe0zh07jTdEpCI2nTkm4A3kdKM3Tti06uIRjCN5tnVb1StCFvYHBFxNTiBdRb/RMY6/d/xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237080; c=relaxed/simple;
	bh=niOkbKdlbPqGgwMPoc28/gB4zoZ+Q4OP+6PMwctdImg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mlexppAK6Z9cOpQxpGjai5yevcXptTjsYas9IzuAdr2Tcxa+lWWjBiS49OTBNaiN+tS5BYPC2NzuGAngrh68Be5bgxS4P/XoVJOR45CtSi9H3CcsvLMlQUan8wQOOSJADN/SpCrnZ0ksPANVDM4q941kRCEJHTARenG8WKaSrf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0S/9gUc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0S/9gUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAB71F000E9;
	Thu, 16 Jul 2026 21:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237078;
	bh=tskYm62j9mJgzTDPwmF1CPQ/OttAKffayEwVAGGyCRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f0S/9gUcQF4gAJbGXtauptOqOB5fArlxMXRgRATNGqOi4W3uNgqtHg044gpBbR9N/
	 8Fl6L5TnZ3/dbuwpGwepUcetMVLUtIK5QdAb7PPU6w88KVKZCleRNu9PPJhJsvSyzb
	 xctdeQwd4pjL8tdUUnbBKBNDS1AQREkQqRmF6Wu6qxDAek7hASnoZLBbebnLmK7NSD
	 w2e0wIYRaTXaW2iVyJDrzw3HY2ZD152BnoP5xKHYTLBoEuMjqwcl+SQjAlEkuOm3Mi
	 /WzhEZKJ1vKgkrvOXEiU+OC9kxtYwILFGUuQQWEwWHG8RdfkoyuD+AKyZehr2euO+a
	 3getY84tWkoPQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706-qfprom-v2-1-f5d9eaf12d55@oss.qualcomm.com>
References: <20260706-qfprom-v2-1-f5d9eaf12d55@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Message-Id: <178423707689.381547.15578676153440987419.b4-ty@kernel.org>
Date: Thu, 16 Jul 2026 22:24:36 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 06 Jul 2026 11:59:38 +0530, Varadarajan Narayanan wrote:
> Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650 compatible
      commit: 2a65e177f219f8abefd5eeca6a348963840ed67d

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

