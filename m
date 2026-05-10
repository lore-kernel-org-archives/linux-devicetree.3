Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D7DDCD;
	Sun, 10 May 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416296; cv=none; b=iEwmyPZMZe5mj3/5/Wgp2smc6G5n3DtwFkCbToz5ITSJhpETijwV/J/0JT4HkMSLcDDJUylfSjumBz57pUOisW2zyykhXxvL8x/OcCIUIytG4TUutwPqpZ6WPDgKSC1s4uka7sjvVWgHCvR28BVqR1Tql8/26DNIsApojfBrX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416296; c=relaxed/simple;
	bh=85ViDbyhtlLOHmHGANQF012puC/WIzPubMcUz9Q38lI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rx758i31ew9UTlkmZVyLgpzgFXfNyMS0y4B1rzlZS9mwf7y8LDsV3xBZ5H1a01ShzuoLH3y8rwcjFHtJXFeZT8rNaexE5sKtvMsjG98+KtsBWcXO/UnZp1dckJ8WTlTH/EszGgRXX1y/o+2Texnb4u22qrBosdYnVhEI8fOBlqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rskRqXyk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rskRqXyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A50C2BCC9;
	Sun, 10 May 2026 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416296;
	bh=85ViDbyhtlLOHmHGANQF012puC/WIzPubMcUz9Q38lI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rskRqXykLAOUOLUky/WlD42tRwjncgM1hKZ3d+g9O02qJsXePD6A6P9jPyWyog6nX
	 M4aDToaA/hEzLDXjkINomAN9hGdm9vW5x1g5WOI0g4dZgdSVqmosIWP24jdwAOaUPd
	 Zg/xrC7m6VSO9V6S2vztfzrAif+3JcSVucXoFvxppiOlczoNzjTPUg5zrArDNqmIgm
	 PMVX9f4LL4mJccXPOTKJgRsCkB9LiSTUe6cG1UnmwO3pPcPsdTZ+qsI47yYBYWEGCC
	 YHyQ+SZ2VY+uECQn5A6l2cW/mVCbz3BIcuPEMBrscv/MefT7NHFZYZtEuE38NvEGt8
	 mkF7y3itZ5lhg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com>
References: <20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,snps-eusb2: Document the
 Eliza Synopsys eUSB2 PHY
Message-Id: <177841629280.434434.9813590038989489430.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 04 May 2026 19:06:46 +0300, Abel Vesa wrote:
> The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
> one found the SM8550.
> 
> So document it by adding the compatible to the list that has the SM8550
> one as fallback.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza Synopsys eUSB2 PHY
      commit: 78a6a90a5c4ac29d06fc8119885b80f919950d00

Best regards,
-- 
~Vinod


