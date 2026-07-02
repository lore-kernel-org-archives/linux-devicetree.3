Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFB63D6478;
	Thu,  2 Jul 2026 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035652; cv=none; b=lCXqf6Uo2yb5nAWbl3OXcLAKmE+9JTbtn0EDM3V8Na50lEVgBd5AEf8YE3jlepNDC2nHHzBWcIQKFGQsWcqMDwHEPBFzGJZbe1t/7sxHhEyqGLkHgwEYZ4ePmAklFFXA4hL9gU9ylL+kqh+YDa5ubDx0MPJY8QOEed6mk0ps+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035652; c=relaxed/simple;
	bh=6s0879r+N4k6Na6e6PyD5vvCFRroQR7RIF21FtmNGAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQTojetrIv0cHMsogDAurDTE5cMIJXK7+qegN4weJiclgmaRkRGl1yWQwR3RaKt2rNnfONX2YsEzVMDTwzCW9SjuQ4S6+oheuZjYHvxZ99Yevp2w2tnUBeSlE01ZuEf5plOvWb+cDK3YvP/Z1xe+BxQRFJFdMHrWqhuPh+IIlcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDlpzWTC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDlpzWTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0C31F000E9;
	Thu,  2 Jul 2026 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035651;
	bh=J+4YVp+kUS/7oTXXVzSsaAgqXX69kg91kfy+Lb0T0Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MDlpzWTC760QT1GBSjJk0DLTUDnrJSlcy0nupX4aCIHfTjGlcDPxbFZY3v/mfw2/y
	 W4xi+WMygl0WGl1dx15SWmEZNFc948Mij6raqSpDWuCyDe/UAKVFzDKVdqxSioxO82
	 //NVY2PKPV1Ii9tAZT0E9ibbD2bZH/ZrfPuhqph7p8OGMKdW8WlwTQoi4YI8RoXhci
	 FEVqbXFwrqSao1KyyDaTIu3tON0IVz0rBg9P11vebTk8yhBTlMUun8wHxcnd4vAU2U
	 H9Cuo9GWeRppRy7RWUE5WfpZA9/u39J000+CFeAbqKCG+dCuv1oO6HZxgWOZw3+tYF
	 hrBLtYAT74DZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8650: Fix IPA IMEM slice
Date: Thu,  2 Jul 2026 18:40:25 -0500
Message-ID: <178303563655.359079.3192597246585865210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
References: <20260415-fix-8650-ipa-modem-tables-v1-1-95f8f425e416@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Apr 2026 23:45:18 +0000, Alexander Koskovich wrote:
> Downstream the IPA IMEM slice for SM8650 is described as:
> qcom,additional-mapping = <0x14683000 0x14683000 0x2000>;
> 
> Update upstream ipa_modem_tables to reflect downstream.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Fix IPA IMEM slice
      commit: 41d237b1546af5d5cf877175930cd23163422c83

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
