Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36441A9FB7;
	Thu, 26 Mar 2026 03:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495173; cv=none; b=D5mfxXfBBjopptPKIPuoaiD86B0gpazdP3xP5ybxq1pRFKWDKHhEY+TPUKQqVoZRkIBX/4GM6Q9G9L33Uemoi+ltaCP6irKVFvm72/3QkOxM6x0lSeYwLM/XH4jy5dyOvumoyckTV6zWNHx8PoOUk/fionxYeKhsCB6tPyb5EIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495173; c=relaxed/simple;
	bh=/xbkMyMOdkvjQXLLyPB13yBFWsTwquN0QU1mp2b0Wp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbuaNDusV8tdmtHjg01IBzIFSWJB49QZLbeZWLH8e183b0sio/fUFiR3MZfK2jgAV/dT/00u0RHW/lre7f57UIiAV9TOI6zw3yGYhBA7e1Tvk+iTyI6Hff98ZFvfmqRd6YdByP3RTRFQ7SuIYW51g3OTseuEcrunCv6MqVlXJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyyyMpdn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyyyMpdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0346C4CEF7;
	Thu, 26 Mar 2026 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495173;
	bh=/xbkMyMOdkvjQXLLyPB13yBFWsTwquN0QU1mp2b0Wp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CyyyMpdngltrYwiwtZHk+I/Z05gHCaDbvRa5UMW5nO56IZWdKaUjN1bmub6xXUsGk
	 WAcaEP2n+AxXpYhpdpLn1vRjLs4f15Kgde/MQEe4Y/f82QxlD2c57knk9OMMBGzZrF
	 UnntZ+n6hOXMcJ1x9QEmHhrkVLEejpBXsEtJOqK16+i7Eti1iKLB68rncZd/1PRttD
	 r5E0n41U0AGzPqN/wZP28tK88MfIH2roGYEcqRVksj0kJbF4WrEI3pev8524Nunoie
	 HhCCFGcmOsj/SqKMAKXbZ8C+00dQI8kkG0+47bYuxAGWbwI4U3rXaCSkmiDN/x4nIC
	 adhFsuZNUIvyA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
Date: Wed, 25 Mar 2026 22:19:15 -0500
Message-ID: <177449516613.60308.3771342049381576392.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 24 Mar 2026 17:12:19 +0200, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
      commit: 151206a1c2db874d39ddca60901a77204dddf065

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
