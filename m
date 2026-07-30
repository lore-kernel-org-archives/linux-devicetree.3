Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866E34D385;
	Thu, 30 Jul 2026 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376547; cv=none; b=QnDjSkIVb8zdxBOpAuLsDmZ977Jx3S9I3R8ZXAIoUeIiu1kp+wO4uAS/HUTlyt+8Ogm24HD8vhKuEFpCW2YJhb9gjwmjGbHc9YaV7rQ8cGY3HebMtw88TsZQg2sxG2jugltd3bozJew86hjPToYfrHIxxi6W6IZZdsvJPuwDalM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376547; c=relaxed/simple;
	bh=m8ID9O0QoYt3swHEjjY0XNeTyVd8nFcBoN/TEPxkrPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QH7zNKwV6IhsWO5h8cJzptN6aT2xtK6pO6TxX/ABeof92egYmhMJ2naCrgRIo4PLBJ4eXuFvDyfSLpnrS1OYBDKtDalqkQLDgKVti+TshMdEmopDeTiZGzjqplQSIRtanqf//wpeBzwoVK/XdjwpaULjnlg6hdcGwaghJHZ9Veg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7zh75yH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7zh75yH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5468E1F00A3A;
	Thu, 30 Jul 2026 01:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785376546;
	bh=qGDG5RdWBg2HD2jDBYac4CNdXXMfJ+g5sCW3up+Gxmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a7zh75yHeCpWraQWfQWF1DallVwE8hPcTajDRlC2J0SKpD3tOYfwobqIilc+qBHb4
	 atmDkGN+2OmCvZAQchJwnk+t6xqkl0YDKma5doN4tiskc3ncIKmT7L7s4UDepo7Vvn
	 fHoq2MWj7S0UA6fpQic/CO0EROqeIYugA/pDc+xtiFL806ShjqdVHvpHb37o07/nyn
	 wwhfn3kYr2DqAfp1qVOfySn0XMg9WM2H5eeLQx09yfpTTtp7e3XXAQZQASboSMqqZH
	 UX8NwA01pym+2eGD2+3iW35sEAEZDhVpjMxPD6H2bUaFTOwTo62xmKZJArJoDfZpIH
	 HuKSxXSt0ytaw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza-evk: Add support for USB and SD card
Date: Wed, 29 Jul 2026 20:55:37 -0500
Message-ID: <178537653469.67965.7350037037251218065.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v3-1-eadf9da69226@oss.qualcomm.com>
References: <20260724-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v3-1-eadf9da69226@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jul 2026 11:23:54 +0300, Abel Vesa wrote:
> Even though the EVK comes with 3 Type-C ports, the Eliza EVK only has
> one USB controller and a single set of PHYs, which are connected to
> the port marked as JUSB.
> 
> Also, the EVK comes with an SD card slot.
> 
> So describe the PMIC GLINK node, the connector graph, the PHYs and repeater
> supplies and enable the USB controller.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza-evk: Add support for USB and SD card
      commit: 7108a3708c3310df62c95bea11065bcd7804ec37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
