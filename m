Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C7C378D9A;
	Fri, 31 Jul 2026 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468297; cv=none; b=WcoCVPVFIm0YIrkD8K6we6r0uEqc1XbwHvs3i4lSADRdtQHBP9WMuS4hKd9fNnxYwir2P9fFXWoOdSyt6HYywgZXYhann4R+8TNvx3Yxn+SvAiJm1tQ80KwNFYkuLBMv+57aqizXylq4ynkF1UFMFaSHftTicaE+RwFmFeECeIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468297; c=relaxed/simple;
	bh=qz91OZwAA4HbKXWXGkzcLsQfW6tWNIVRg2uboO7YgPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O9ZPz51P56h0Ae0BNYs/GiRmsf0aJrA3U8JNrDW2KCxCgh0AFgOZAaw/Upoxv9H5ICmJN4Vrs8y2DPSYuNhqT2gdco4ucFfDtFgvxXekuRycy3aC1eyQrxycQSvDJ1iaaqfOUxkWAqLYkvn/yYrZNR9M4r1ZiopbhA3JtezbyIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwiP2DEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwiP2DEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D551F00A3A;
	Fri, 31 Jul 2026 03:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468296;
	bh=tjxOeOQghjN543LYE0fiMHr7U33OtCNpoO/XhuOZN/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HwiP2DEJDvYIwmaBXEQkchDjeIlw+waOAtzpc372wRoMjRKj80n8GOiOFlG5c0Vop
	 6xxZcidxRCPsAFPJIT/wcid2oTeC7r+VMuMrnQE9JMDub5PmySV8zKUlYsrbny950b
	 ausf1gJBUdVkrhsD8nNLrNM6J9IoPNyrKXKdOo0DdYdq5WWZIwjpBYWnk+I5PaZKyG
	 5m2io8GMWSo2YD5lb42IDQWH0+xyb8lOl0uC8Ke8w1OgKvjj+6lEnCbzD15az9pKvB
	 LbP9QmWNObXMREp5aGeKCk6EOPxUJ6wLiTfDZks4kwf13Afi0S+gC3QauH46dUZ59l
	 YOJO8RMRj374g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC channels
Date: Thu, 30 Jul 2026 22:24:29 -0500
Message-ID: <178546826831.316815.11973658005478818327.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 17:31:23 +0200, Neil Armstrong wrote:
> Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
> found on the PMK8550 which allow reading ADC data on the PMK8550
> and other PMICs on the system.
> 
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: pmk8550: add VADC node
      commit: da0343ba8c1f4275b1ce8127d5b6cee24d988868
[2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      commit: c50667eab2d6482f6397c00735d429428e2b3c81
[3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      commit: 972848c36912ec8cbe79d68e5b2875a889375ebf
[4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      commit: b857a25ce399b9f49a2152d78d1a3893751e7cc4
[5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes
      commit: 09d35331b7a94e30e30afb36b37a98513a2f60f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
