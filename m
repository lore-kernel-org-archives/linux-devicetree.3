Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0F32B108
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067256; cv=none; b=JPY37qH/1SB2JYY/3rpl/swN6+43bqVmuq/U2L53jHB8WQzgdj6yMZz79MJgwPwKIImNys9yCmFt77zqtBnRffatt/OX8UlEwkzt9mj2HkkPtusp3Myrv9+DMSo/rKLHORT10Gpr/dEPv4ezgnxSkDVt3iNBdjMIrhxPEB0nZeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067256; c=relaxed/simple;
	bh=sQo8MyflNQaFf9wonNZi16/VWQyCHrzPFF6L24qGfiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgdJnK1iiAeSZVEsuLcgRBSOWJUKCuwLiTTpYyPWw96SO/Df962cxBAlJLEhtnItB1+oSUO/QAByBqW03ffXOpcnbW6hLAgWeA3HxAbTu6zRVAyAG/pE4v0PPdRzz5+XXoUlDa3DhUbIxIq8hzFChDGIIraU2ER716vWN4vsbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaKgu+vB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaKgu+vB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5468B1F00ACF
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067251;
	bh=BLIsbd3rIu0q440Nh2W6RF4EH0NXixw4UPs/AFN2KRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FaKgu+vB2YYShsFe2M1JXkalONH4g3PsMIU7elO6lSWiO9dMoJwlqx4j8W/8cPjYg
	 x+t2lVWhdjNNhMEYK4ngb8iqlT1Kj+JEQ/eCDilp9c4RWCuPiwkFuxCiatLqDGF5SL
	 2MOtduM7IRUQnPl2+LwD636S9a16tBhEDpCJaBLWK3zViZ4djKjamY+ToFzDEE/FFy
	 VAGAvB9TamK+/1fem6UcIodLpkiMqFiO/QyajNcoQu6P2ak6ssvHffzC3O7E81K1WG
	 GApTL//Y4RCUu/ta84KBQWM8VeimHtoQaOyZ/XPxfPQxb/EJi3FtHkRTc8dzmjVhZ3
	 7HsXS5GEem7zw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso554588266b.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqp8anrKGa2CDsP1m+wt0bhCzN1QW6I97lXozzIC5lBynlkegg5ZeLCFzW2HE82QYy2ZyzlGmZ6RAI1@vger.kernel.org
X-Gm-Message-State: AOJu0YyKak04VvU/SoBch2ptDOgH7HfsgUOEjDfQhHthR6LoC9eg+/Me
	snuoLd7Wzz43zRHwlbKCWQ2ClGSM7Fe9ZiWQWSuiQocRrm6dYKRXusBJ15qTrkPTwKCMKEvTmFX
	Skc6QcQ8zjnCfDWBIXn1BUBC+JhkEjw==
X-Received: by 2002:a17:907:97ca:b0:c12:73fd:a6cd with SMTP id
 a640c23a62f3a-c1661928df9mr370952366b.52.1784067249841; Tue, 14 Jul 2026
 15:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
 <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:13:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
X-Gm-Features: AUfX_myV2MEj_WnNpL4PNdWyXrVcH3TfBaO-6JJmtqnBFQREW3AFA5aOuTd8Dkw
Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 8:58=E2=80=AFPM Jie Gan <jie.gan@oss.qualcomm.com> =
wrote:
>
> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
> Shikra SoC.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 1298 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 1298 insertions(+)

NAK

Fix the sashiko issue.

Rob
