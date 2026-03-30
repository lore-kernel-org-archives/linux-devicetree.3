Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8D37C90A;
	Mon, 30 Mar 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886518; cv=none; b=C/g8Rgop18QUQVDJ9IuXXC01LLDNVXlOdzpqNPVAw/NgaCMSk6WTtZ+nOUXfngvCdow33nE/SkUje68oJGaPjQ4TpyCIpiwODTTsxEyxKNDWD3OB5YHTe6+wrGP8v2XrXqeV63hLcba4T+BZ8Q7MAqHzmdoBSYnVvqlIVa3q6QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886518; c=relaxed/simple;
	bh=dcFHr2Bk1xOO7H2HD3RXtiT84ndEamlhICRZhR2KaFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuiCAxCcG9fZs/L0ksQ75jhmU+ALhlbZBbKiQX/+CE0nEWC1rB/OMPkAX4hafYHHEzlybkyeQUSXPnqEzFEXhtoWJlbyXsrUEE30PVJE1zTuoy0m99nt96P04zOeNERrk0gZN0MXrJZQCKbWk+J7zJOTcM+bCUYPOWmw+3VJ/jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPpnKB9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPpnKB9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72668C19423;
	Mon, 30 Mar 2026 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886518;
	bh=dcFHr2Bk1xOO7H2HD3RXtiT84ndEamlhICRZhR2KaFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPpnKB9pMDNEJw9ogblUI6SQkdQx6Xh03jt4m07LDHJpQs4iYvBg203XJA8AYjNZO
	 c+wtE85wnS5HhRL76sTX1+3I6guI56QyM5bHOn3gxIlaZSalu4yL/+da2wizMXp4DI
	 b3zIx/14YTxYYPA2BvyQyuLpGCgQxzH2+znknkeENAsjRhpQ7qoL+ha2H8hr7G+M4S
	 w4W9qjdV7g4RQcYUjfT0s2X8KCX81KPaiIbI1XkB/Ny5uZiuhCSK5bEZFxtfoVvydp
	 bQW2538r3tkxpy5tYOPd6poourakH+oNRd9H98TsdKGeRlOH1RgCb/hKNKESL3bfjP
	 AzxZNRHxgbkrw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup
Date: Mon, 30 Mar 2026 11:01:18 -0500
Message-ID: <177488647754.633011.13283458077105065019.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
References: <20260330-knp-space-cleanup-v1-1-0995302f7557@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Mar 2026 02:39:42 -0700, Jingyi Wang wrote:
> Exactly one space is expected before '{' characters, clean
> up duplicate whitespaces.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup
      commit: 45ac3ced1b79fe25e135a0c5e5ad063166b8fd51

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
