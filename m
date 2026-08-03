Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3643815E7;
	Mon,  3 Aug 2026 03:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727467; cv=none; b=tPHc6+hsm/ofEvO58JDGgNYueNt4MnNER/jeCBefMSbb7h1rZTbFUMOwaRqwchoStRQHQZVRiTZAGduC3/gYc870XBmRzmFJABr1yaObsrxs1ZYyH+R0REgpiL6ty+nfc4ThKvQ24CUnrZBivZKsxkmaJH5npmm6buebGGvz79Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727467; c=relaxed/simple;
	bh=eyEIn/lfnMxVFR/4GPjN5gaef3yG52uhtgXHkmUYP8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shRXetMajrWLFIlOR/JTS8TGnbiiAbk+F7eddaIMvIf12k4CwrlakEl8sNDS3+cUucC7GwG1nZsKVhwNWJtdpOH00GvLlicbBtl3CmdRFDXUibJFvy018273pp8ZRxjPHSijynwtfZbv6lkS0I5cl1T0mmWtXS6TAZ9zEkBzvAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCcRBr33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCcRBr33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87CD1F000E9;
	Mon,  3 Aug 2026 03:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727466;
	bh=6fmQd2Mh38lBN61pPJNyohnM7BGgS7htWgWPOb/EtlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QCcRBr33hcTs5q/dxKUtER/rnrVQ0S+WZmaoHj9/X4fMUQvoZAPSY9X91U7IS8TY3
	 N/JPFuK5pqaNHtVLg5a1jWvimq2/EU/RGdNCT9nFbO+h9CNW0y6R1Uyb7CMNmXqHwd
	 Ytgb3OnIXnJboeCI/dxb+uSFB9nhHwyNNUFDXcKqV6pu+wsXv9gqDEECYrv9lnv+uY
	 jK5tUjB2CBYr53LT1/CaJ7OEE8AjJVH3HSEIgK8eNAxf2zRKcUyYRYiIdE+7GB6/HT
	 lbC+IHRD765v7ABzeY4Ao8fyWon2TL7cn+rs++vkyCr/XSY+/kkzZXm+A/MmHDppZ6
	 i6oZksdX7oX3w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com,
	ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: eliza: Add audio support
Date: Sun,  2 Aug 2026 22:24:02 -0500
Message-ID: <178572744561.408250.9516855992409401843.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Jul 2026 14:10:30 +0530, Ravi Hothi wrote:
> Add audio support for the Qualcomm Eliza SoC and CQS EVK board.
> 
> Patch 1 adds SoC-level LPASS WSA macro, VA macro, SoundWire controller
> and LPASS LPI pin controller nodes to eliza.dtsi, along with DMIC and
> WSA SoundWire pinctrl states. The SoundWire node is kept disabled so
> board DTS files can selectively enable and configure it.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
      commit: b9f1f97846bcb1989bb52b6cbd1205ecc22c8e43
[2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC
      commit: f016b7e86137f6a83de84f660b6bb3d7b955de25

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
