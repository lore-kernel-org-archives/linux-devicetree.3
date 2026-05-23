Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C63446A6;
	Sat, 23 May 2026 02:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502820; cv=none; b=k9nfdSDb8Gv4Vo0/8AKoVtSzZQM2RI1GHzTLV3tT8y0NIsRnwqVK7t1z7k6g2Jd5D72WqZQukHC99Ac4GbLolCAkhBHHgN/ip4a87VCFS4b97ip6NK3rYNCqS1Qcg02fpo11mHgw7uXYnmHUJ8hH96LkV6UW7t70juIrTDInjgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502820; c=relaxed/simple;
	bh=8g0Qy8dTyQpaEomIBAz3TjG43zyBgTwJgMfbwWFZED8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ThTX4Q7vzxnJNF0EhYZSa0fprqxGIh8T5zLJm8BxJfxqg2r4UFAeEH7BrsNPVyAjFL4hmwTScAHeloxvZoEQL/Tegt1rpwROKApNc+jAsWkuQJfQyNvcZIDqG+droPxiwwX1SUqc9pismCTOLvNrfdXDhhD9ecqDTx+EH+MGGRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3pXoNJ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3pXoNJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE6A1F00A3E;
	Sat, 23 May 2026 02:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502819;
	bh=BQvzIN2sXNnDrkJ4BTrA9TB8UZSHhhSqqf0nQNnGOIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j3pXoNJ2CU/XXh0P84NqPkHPJ4ec9ZMdImcJ3GqvevvzblrQCTdYLvtx5kg3jfNQi
	 Asu9n2L1i6dCEVX2GMqFLTsZVRQjZlSYOKw7x7nNTGuVA7kXNP/07uhKa1NAyXz8ug
	 qVPSXLUIY+PakXGn4vHFcmJAOslCEfYdQmjIsKdTWEzDEN1t5G2sWnJ6T9zll5m6Ne
	 /oI7UhzfAc5rv3OtWzBY4tSe2CEhMxMSR5e6Yy1EPUysH5EU3nArvcBUt3tR3BBuhZ
	 sr8Qlv2GdPPcD+MznbN0SZznu/odKeQLJpZ/zseik17kB8+MaREr7AdZAXJKFxXq6O
	 jlJhftEpGsnbA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node
Date: Fri, 22 May 2026 21:19:48 -0500
Message-ID: <177950280353.1097700.12407016254727855784.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
References: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 May 2026 12:54:37 +0300, Dmitry Baryshkov wrote:
> Downstream kernels for RB3 Gen2 don't specify the RMTFS address, instead
> the kernel is supposed to allocate rmtfs buffers dynamically. The
> upstream kernel doesn't support dynamic allocation of RMTFS buffers, so
> use the fixed allocation. The RMTFS node (and corresponding interface)
> is required for the modem DSP to work (which otherwise would crash).
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node
      commit: f6dd5665d8e525484c2d0ebdb7004319024ee640

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
