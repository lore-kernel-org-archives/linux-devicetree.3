Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169510;
	b=QvQFlr74GTC/iPPvAl2mlEG53juuH5Z1AHtSuRwYglje2G3DjN2Gkdbo1oXXCSqg+IB9
	 bjm7qbeuw8OxGJ0lC7DwH0RDbctFEm4mqEpbkGXjeEetvrAE62LN7WDO6pFzKrON56P4j
	 pGRQtddJgkBqqsyDH8YBdptXEN7JODSSWYwgRj/TOWu3blYokVDd+P51eA4q2MGgLHz4X
	 Ajef9IIntMf8eFBvQ3gZINXWJVYEuWHJvgCCznepWW82/QwHH0RyfrdbqNKR8sxYAhEuL
	 tCiogMqV02RhqqBoQI5FjpxYYAV/x6FSYGYRXIdP9zWs+0Sg0+mlte9+iMToQVs2G4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169510;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kPeDc8+68akiEvkcyH5kIsh5jqDYmEIoA26hHE47faQ=;
	b=lwRn+s27QeUFsenRP5Nm3XjbRZ8TU460mdUrWFPiT7uIa2Fv6C3NuDzdY46KjeutT5+o
	 0jTZ/iKdYuA41843K9mmmKILWhABx91v6lff4cInMlhw2zgVHeO/+G95k0jkWacevx34V
	 hAn5t7bLOWIr19GKlkf/6BzfbzRA/7CsIy4XDJESTqtoxzpOoRMhjGCkeBhXfLEJtXaDe
	 XY8ZYGlfPh8a/K2/5Cn0tRVgfD82ptb4mxToVq2OP++sgZoArOND1rkov8N5WIjTkladW
	 7S0LSBmKV4d0RSDaHbiQygq+RuL8iK8Apdo45BNl4YNaR52FkSf8jMZp//Hx6aq1ADg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kAHvik/f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE756081EFD;
	Sun,  8 Nov 2026 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAHvik/f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C6D1F008A4;
	Sun,  8 Nov 2026 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169510;
	bh=kPeDc8+68akiEvkcyH5kIsh5jqDYmEIoA26hHE47faQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kAHvik/fwcpyzXTUnKXNh9hFMnL4jyCaaPFFJioThWFReuamcUMQkW7EMaRRdSWcH
	 BuIJuStYNrX/Z5vmXCC7ARphRiew3gjzj2608r7EuxfmrPhMqJ3771qnnaLkcTF6zw
	 jJSGQfLauyillnOjhPHtlJzYM/q1fa1VFd3D023sV9hg+i7eFPXTNUQbbh9CvGji5g
	 sMMkFxiwA1mzip58PSBPWPJ1w7w6HDFiPssuLGxO+XSfR02Wjb2VGQUCBHV50TjJ00
	 pklimEWqPojp3QIwrT239t7QhKIJZHtLYiaKewbSrBrPqc9g7EITdWPQL61hTQFfKV
	 YVxCjKf4Q1Axw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial support of camera sensors
Date: Sun,  8 Nov 2026 14:21:31 -0600
Message-ID: <179416929316.628393.14579035167593945326.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
References: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 02 Oct 2026 13:17:48 +0300, Vladimir Zapolskiy wrote:
> Add initial support of camera sensors on Valve "Steam Frame" device.
> 
> The change enables CAMSS and adds description of
> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
> - a pair of OmniVision OG01A1B monochrome front camera sensors.
> 
> There is another pair of OmniVision OG0VE10 camera sensors found on
> the device, its description requires a combo mode feature support in
> the SM8650 CAMSS CSIPHY driver.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650-valve-deckard: Add initial support of camera sensors
      commit: 6cb2e1419adf0b91ae70510ea2099630a07efad1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
