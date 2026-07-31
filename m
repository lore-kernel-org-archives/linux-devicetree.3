Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2E2BCF4C;
	Fri, 31 Jul 2026 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468238; cv=none; b=kvpNK7uZfPVrisbWUx02Z7dHN9qO6kMTWkl5Jb7hluACmAXxDt503tzw/VtDv0US+0avqfRkDPxrRpdKZzVAW8XUFie7wJqF5kOn5Egg+MCNzvyLAmTcrm7J0Mh55b/HRxyrGHKYfevMlIQxXA7hH4C6Uh+mbkV8lZrmgo3PUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468238; c=relaxed/simple;
	bh=A308PpICQ+54/LFb+BM2iQmP05Y//8MrL4Tz+p8d6F0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k19OaLTfxDKlJZzehiCOXcYCZzeSfuOxM0iuDRwXEcPhqJx6cD1GpBGhk/7PjpEP1uNL8FQMamwX8svz8FOa+71PSOx8QwuKmJHIC93RHHEVcqiyNIXdZm/qaNyoCk7sC2e/GN2/DKQQQtYpkzeulMFB8hiGPWYKVRBMBX+esWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqqcRCnb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqqcRCnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0349F1F00A3A;
	Fri, 31 Jul 2026 03:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468237;
	bh=Hs0lPEJppu6pKgczF2HxrjvHLyHsVZn9IWdTmrUvyss=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZqqcRCnbms4xSCnTHZk+3xJKtd/EXGa0XixXAVpz7vDk6nsONVoQ3W7r2eF2CENwy
	 vnAkxaF0bMmtgVdzcQk6m07vtnOJLqHAp37m2EIJ4OKU5tODB4Bt28c6mNe8pwdUUX
	 QHSmRKPLRRpNwZRYMPqEabsFtbFB4i24QhT5UAb+gMVRo9XKnmQImX5f3Ue3TYBsvp
	 twcQY8q5usNkOpS5Pow7gXdInJ2kxn7RXyE7VofVvGKNVfgkh4DG1IFLkAb4/O1Z0/
	 MegGxyjrmtbXsRvuaK9W/yDxtE8DY7AJ4+ru1/v7p9M6rmNOYNPPptQN6D9IhZGtdk
	 uCoxmLQ+HO7gQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property
Date: Thu, 30 Jul 2026 22:23:44 -0500
Message-ID: <178546821238.316167.2806379161870951045.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712162212.184592-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260712162212.184592-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 12 Jul 2026 18:22:13 +0200, Krzysztof Kozlowski wrote:
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property
      commit: 3fd6a04e5bf863a8c02c150d584f42c7b9ae5f8c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
