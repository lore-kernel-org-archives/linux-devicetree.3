Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3D2FF641;
	Tue,  7 Jul 2026 01:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387670; cv=none; b=NyGSwACsC0rMjvPj1rK7Y9qs4HzEgNidCXGr7yatHzBIImxkivbVcCh8isAmcSe5yxzw045Trw0TRNAGQLkyuIEGc+fWAZM3HH9RX1YfGMlNKSkyQGPkBBtC5MAH71hqWkGJqWCFVj0BpHiVQDOKCTNn0QVB7FRrio26cdI8iwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387670; c=relaxed/simple;
	bh=i7pElux8kMgJ691AzOk6XcVWOuP/VBpzB8kkf8WgiRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ak6rOywTGaeFJERP7PrUQHf+u+Miy3YceFb9Z6XYvoyxLWf+q94YRZHOJ5hrc4r+y4Nogy82TJlkoLFHUygZdF0xLWfEAH5uBujS7aQA6eBjMX/UZhJZUvovvwi4dhyXxiTu/ZwluCdnd6KFSCNW3Nnbx3AQm1EBlZdTcIeBT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6K7iOU+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6K7iOU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDEB1F00A3E;
	Tue,  7 Jul 2026 01:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387668;
	bh=Q4LVM9h/WtQjbuOWh/h5v02glcUtAFjbVlXhuGiDsYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L6K7iOU+nxFhZWS78U1E9IMJBCpkx3+u6e5dfYJbFC5S+skZYbtvvHU7hr8IKXhnj
	 BLS8CK/nNm2CHxf7edRs85PMVXoS2+QBLXZZEWFfZB8RD2K4ij9XBVfio7/6mqXwLd
	 UpOJm7F4lXyswVNCPfkSvszYvXDcCK1QzdK03NZrsX5ID1Ypc4gytwZ/hEs8ja+m9Y
	 ZmOMFM50ios7YmlePFGWzB5gGULgUSiMbyg9R7CLmHfsLKun4YYKP9CdUx+AWQNcIn
	 pn0hr0ij+7IQNW85ywN1WNxIJQf6sxhM1qB0w+oaVGjSQBsW8H/8b8omZADbtFeVry
	 B+FydU96MkSWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	Xin Xu <xxsemail@qq.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Mon,  6 Jul 2026 20:27:30 -0500
Message-ID: <178338764541.1558388.5000950428871202565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
References: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jun 2026 19:50:48 +0800, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add ov8856 front camera
      commit: e221d444dc0bb4b0f244038b7655419498643667

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
