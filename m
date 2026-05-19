Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64E43EA952;
	Tue, 19 May 2026 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203947; cv=none; b=XCu2ZCQK3o6laobL+MELDOhL4oFM4dFgdv729LKrOzMJ0nhYg/VcN5s5VG7l7hNSZ9Vem+Q9IjWaarst9v/5MefchP+Cb2G8VBTbtdybiZFAuzHE301S4tMPIlm+EogH3DDmAHa1lAWfyKycg9C5wulkU7o//utX/Gbd7tgvKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203947; c=relaxed/simple;
	bh=K6TPoupejCdVHYRipchi1iWM9d6rQNTffCN0es2T7Cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YlgoRVpE7yQs8DzVxrw5p3zHnB/31lA2tzND1tc+n1MAKRQZx6g3jUU72tOpZK0RFXnoSgOE11dD/5+qty8xTTFwnGVrfmzo5Trzp+hGrIxP3EJw2Gz8XCjFBtxkxQWpH0X1k7VPVc5W1fJoKexOlBWr3t7Vxy+Uk7UJFeIFKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5pW88AT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5pW88AT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86EAC2BCC9;
	Tue, 19 May 2026 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779203947;
	bh=K6TPoupejCdVHYRipchi1iWM9d6rQNTffCN0es2T7Cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a5pW88ATC8JbujTNtfPKosN3DY8kb7oTG6ihNcW9t2z2nPaE3u7WvL7+ZSVA4hLEA
	 IvXEhObnXCVWQSLIZL2x+fmQW4FQCwCCYi9CrY3SUoPLoi4Q2anKRvFUH5SReetkvz
	 VKJ2FdB+AEyit28wj1dye06y4ec2nmy6IdFGCF4cMIC6uLu0RpAce63XOUeoJa52bz
	 j9Jcxx+CtYPXWK4aLEJoTTKn4LxtW2XdjHtel2qRzbZLOplfSZ7e7gmeM0IGSsrsfv
	 D1hQmr9IElMPEnYfumtFVmG0Fp/bnCJ6bVp5di7rlbYRjkJX5mg/i50rANYWXfqYqp
	 e3iBonz33lT0A==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260508-shikra-qfprom-binding-v2-1-a75174c8a580@oss.qualcomm.com>
References: <20260508-shikra-qfprom-binding-v2-1-a75174c8a580@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: nvmem: qcom,qfprom: Add Shikra
 compatible
Message-Id: <177920394566.47574.12160406301488591937.b4-ty@kernel.org>
Date: Tue, 19 May 2026 16:19:05 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 08 May 2026 00:30:32 +0530, Komal Bajaj wrote:
> Document compatible string for the QFPROM on Qualcomm Shikra SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible
      commit: 41546ebee104002cb1edd0811b3808d5edd9aa2f

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

