Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56B481666
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398275; cv=none; b=IiAU5yo2MaiGyAgDKj5w2OL3dGlHJYnPI9ybZep1//3tXFP8cPW5ddpR8wQ2Dw4Rz8ew95ADZT9AdfAuWLRAKBt64u5nKMSDF44ktPta9LT02IP2vOqWp1q49wFzuQYg//tN5WH7XL28Pn0PPCzU7dPGTXSNoFERcgdH5g4k2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398275; c=relaxed/simple;
	bh=PnsGIkFSQFZuCWsQ2QwTC0W+o4KV7lN9P7EnTBVrlGs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ac7/4N/V/WM250qqxhpAJUOkP2aSd3UK1qwL1zeIbll4D8ZUTPnCv/r0UFBLsiB2kwbxMunsSY/jcGz7yGJ7rBLYh4xEn7sMdTlylbgn8WfIutK7MNKUghgb0WB/QvXjw/TrxQERFFfVJRAXL5n/hdcgg2F9youor5ZjVMfjl5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMzOaUA2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMzOaUA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C851F0089B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398273;
	bh=yntR3BN9XrUq8Wqo3AlusT+bLqPtUZsGGGNwHCzeHkg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JMzOaUA23TythRGI0rS2oorRu0BdQAt2q3wANvslwWjiUSmckkom1FzSNtSesKrNw
	 d4JeQ2he/Q+51N9YtrETv2nRKLNa//MqQnDoLm2NSTHlXEOVJckbn7+5KouBezrzni
	 CX6OWVrJhgUziBakziRcUlQi14U2qbiv1oupVetT7zvkjKzy+KMELc/Ypen0tovdNh
	 pnCTTjwG4rttzKEtA05NgFULRiBS00DwEOIrTn+Xy0ENiUMWzAKsXx7FosI//OjBS4
	 l7G9dWzgQzgElZwC1uIDUR+U1uc8tBqJibe3Z3De3t031fPJcsHCQ9g7erGtX3p2nN
	 S7I8lUtm+adVQ==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6aa9606ddadso2904952eaf.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvqv9sLa1403AWRpsRD/SqqcIwcZBwYD2MPSxONlQ3T5VF0TEXq1tUnuooBaSoU7njrseKZUvjshS2@vger.kernel.org
X-Gm-Message-State: AFuF++meSXwywlZlGu5g1gri2DJxF5q9zDvBvQgEdH0imppIWTl37Dyy
	BSK7rfARWibVd74fAJssKRqh3S0lbt0iGHfkUD/P5nqPZLVUJEEJHZdnmDlp77WSoo2apZvDal7
	JdvqK0MnL0tAFBOZ8TB4kVB5QBXvMmoYwJ0EYKV05dg==
X-Received: by 2002:a05:6820:4ded:b0:6b1:4fa4:76c5 with SMTP id
 006d021491bc7-6c53f74c28cmr1453244eaf.4.1789398272654; Mon, 14 Sep 2026
 08:04:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 10:04:27 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 10:04:27 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:04:27 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdusArtL93xQ8c6HkQeAxLrB+3++jO2-8mNds9vkg=tww@mail.gmail.com>
X-Gm-Features: AcwNN1V6OLo_FdWNPyGqxOdJCRRZC8xotNwD9949d4CjrdUhJxWkvQD9p6ks3Mo
Message-ID: <CAMRc=MdusArtL93xQ8c6HkQeAxLrB+3++jO2-8mNds9vkg=tww@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sep 2026 09:19:39 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> This series enables PCIe on the Qualcomm Nord SoC and brings up the WLAN
> modules on the two reference boards.
>
> Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
> multi-PHY.  The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
> selected by firmware through a TCSR register that the PHY driver reads at
> probe time, so the DT only describes the PHY ports and hands the driver
> the TCSR handle.  Patch 1 adds the PHY, the four controllers and the PCIe
> SMMU; patches 2 and 3 enable them on the IQ10 Robotics Reference Design
> and the Ride Embedded board respectively, along with the per-port PERST#
> and WAKE# lines.
>
> Patches 4 and 5 add the WCN7850 WLAN module sitting on PCIe2 on both
> boards.  The two boards power the module differently: the Ride Embedded
> connectivity adapter card derives the core rails from the module DBUs
> gated by PWR_CORE and PWR_CTRL1, whereas the RRD generates them with
> discrete on-board bucks behind a single core power enable.  Both are
> described as they are wired.
>
> This depends on the Nord Gen5x16 multi-PHY driver support [1], without
> which the PHY does not probe.
>
> Dependencies:
> - PCIe and PHY: https://lore.kernel.org/all/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com/
> - DTS prerequisite: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/
>
> Krishna Chaitanya Chundru (3):
>   arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
>   arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
>   arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
>
> Shawn Guo (1):
>   arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
>
> Yu Zhang(Yuriy) (1):
>   arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
>
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 151 +++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts         | 158 +++
>  arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
>  4 files changed, 1528 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
>

For the series:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
