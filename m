Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E5265CDD;
	Sun,  5 Jul 2026 20:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285107; cv=none; b=KtSLkhU/OL+5lLeea1fwQPgrBKEN89UTzolJf6cVeJZZeBq9DdkivneMrq4cYvqwTwf21PaCTdr0qphaubZtdNFr79iqf8la7KFkErpIls8IhuhSPPmTWPbPyAoaaKtfc7NYU+FxiBSsblh+PQbnXEIeRN4mA5aGnrmzNrxIPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285107; c=relaxed/simple;
	bh=kz5y+gWXpk6JL+Lb4Rq0cv3f2KwoopYNPoknYucd+nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sU1+DRp4xlQnQgR8ZyBGoUIY+hiu4GvkFxZ1H6b946j2k/THHiZXIKZbennRgHFzeq1Q+vkvm9oYhgL4NbYSGhQB6ezxjLgXWnv2C6XMyMgfpZhPuJv4ooIRevQXK8k/Lfrr33bCZZ/8AH3dQMxCjJzVfNMhMQVUVsRqr8abV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5MUOwoK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5MUOwoK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AE41F000E9;
	Sun,  5 Jul 2026 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285106;
	bh=sPtiqjW2kKvbsimhHwtAlIMwlxcFGZ0kn+Ge/s1XouA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P5MUOwoKhvjwLkwvrKo7EQ5oiaz0WE0Gc/SmyDB6klv5KF0b63xCAYch5WPYe/q7c
	 gUXd7ydXzxfrv8sS+1SZpqie3dKGp8MoHlZFVOCwBUpnhhxDczi4pz+WS4EcKV3awF
	 CawqgXm0x846GXmfeJ87gVTP3+JbE7EsS1XrT9i9MSO6TJ4J8nKEXK2IEee3dfoIzz
	 zydMglXnctsMJ+L+vHgtqs3eOcgjt1HK/7lpRcPEGyy2IUXWPmoyl0W/weAhznMxxD
	 JbrYx2gEncziMxrOfxtfiekK77rABL2OoQFEj7J23AwUhEhxN7vRFjK3oA5Tp/BKjq
	 3nQwROIKueu/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
Date: Sun,  5 Jul 2026 15:58:02 -0500
Message-ID: <178328508281.1157743.3896901467375077910.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
References: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Apr 2026 18:55:31 +0530, Kuldeep Singh wrote:
> Add the kaanpali nodes for the True Random Number Generator (TRNG).
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Add TRNG node
      commit: 14a53a14a615915eeff73ca77e4267247f31f7ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
