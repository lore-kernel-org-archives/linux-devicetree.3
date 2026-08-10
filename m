Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074D3BBFCB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360504; cv=none; b=gUW2fbM5yJeg9B4D7sc5Ib7jIWO1Y9YW3lAJt40C8JektjXglWKUebAYZw2LqZ14CDfFeVRVamiTTrc7zo3mVeiP5uxIfs8jE2+qhi1rA/jjyytltsJGhaP7WE+SNUFmw0xOG+LFM99Q2OPnIKDJZuuYwBP/wM4K+xXC5zmd6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360504; c=relaxed/simple;
	bh=BUgXTmTAB1Rmqqt70W1L4/Oac57Mb9ShhTeJuz+Mac4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhuk7qyioYb7BtELguPg7O+RYL5Oc9Q6isFfSj9ctMvt4+/XHikaY7+PuqOy1YGitvMfjajb/W6D+tLEnCCiaemPSJOZoyVdEuZhqqR4TPLhkNKNxAMtBTo3JK3U/SwmwIQUrDLFkbi+IFKwklIhh4OxqD4XOgBw81I6gEQjI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwSwcFYR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwSwcFYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96E81F0155F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360501;
	bh=PL8KOKhKf9Aaj5bOJoSZpWa9+kUfSiQO0s6EjxaVVPg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TwSwcFYRlTqKedTh+mzozly2isd+BuGKYCpISJczRZDq32HxHMtWAxx8O5FyBdUzN
	 bScfyLXye7gSEgCLms7IRWrMD1Z+eHtB5E5z55HFRfEkoc3NTbL634zqtm6+wdxJwp
	 TWHI3RqWmVXMj5bd0t32nLmAP4Zt3K8NRNxqFZWW0H0+t/j58qH7R1xsY20peW7IZ+
	 H7qF2XAYPWjZ7vdcC6TE8eW8v+9y04TXUVb4dc9yd/RuTlFsJtCI3Z4zDj3CABtdmf
	 pCBcc6LoMnVlZlxwZc0niPYLoyqTAa0qEDZR8y9AFxRDrtponfUQ6D9hQy8OHVpb7+
	 BfrfnE4Rhsa/w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso1919047e87.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoHjaPd8rq+qzQaFU8lzX9rZVmS9mQGOmSjIoWyrMF34/T3RElFVMSAb+b1W2fnzzKac/zo1iqRONN/@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmGLIFoZoTi6oOqn0TaHKc577KgDAeL1UKAzTrT/5WthSB5bH
	z+FR1UzY2pPfDxGAWzXmLbKbxfwcsinsGdxhvULc3pLcY7P9asUCqlYaiOr+AvWBi3RI1ZlrrUZ
	kuyGPKiUQwk0Fm4gCwvJ4GPzYOeA8XvzPgXW0RnROwQ==
X-Received: by 2002:a05:6512:31c2:b0:5b1:53e9:439e with SMTP id
 2adb3069b0e04-5b30b770611mr2868770e87.36.1786360500188; Mon, 10 Aug 2026
 04:15:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:14:59 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:14:58 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-2-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-2-c4bc688177dd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:14:58 -0500
X-Gmail-Original-Message-ID: <CAMRc=McoiO0tt86j0dJVZhgkJgka8QzhK_ZxCSC-KLurJd+WvQ@mail.gmail.com>
X-Gm-Features: AUfX_mwrK3Sw1jbkCjG4pdlxLzUHdwgQvzVqBa_KtddB8v6HyExvITEq4wDqjk4
Message-ID: <CAMRc=McoiO0tt86j0dJVZhgkJgka8QzhK_ZxCSC-KLurJd+WvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] phy: qcom: sgmii-eth: vote for both voltage rails
 with correct current loads
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Yijie Yang <quic_yijiyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Aug 2026 21:27:58 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> The SerDes PHY has two voltage supply rails, vdda-0p9 and vdda-1p2,
> that must both be enabled for calibration to succeed. Without them:
>
>   qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
>   qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed
>
> The driver relied solely on the PHY framework's implicit enable of
> 'phy-supply', which only voted for a single rail and set no current
> load. Use devm_regulator_bulk_get_const() to acquire both supplies and
> set the peak current loads (46 mA for vdda-0p9, 15 mA for vdda-1p2)
> as required by the hardware.
>
> Fixes: 601d06277007 ("phy: qcom: add the SGMII SerDes PHY driver")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Thanks for doing this Mohd!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
