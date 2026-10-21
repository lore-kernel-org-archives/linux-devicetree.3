Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575864;
	b=LfYqTRd5vlaEL97MGLYmSNwpgIXfMWCrerKOzJ5Ge9RGbB3rAJAKeyvb3v7hhIxT23QF
	 9WoWPyB/iTEQpaaxGPC/XBtYUECt7edCxKzW7JP8gWswKwI+SxODXEIe9Xv2ZIGTCoka8
	 TM/w4MAK5cpTSA3zOPQPv2C4DVdm7VMeG/uwhqHoeRYDsIBCm2kI9TJYIHSO4Rih6vxwH
	 zpBT53XsyuYz4gVw4B2jYwew43cPFlGOaUOpMap2prFt+36o4Xscq79BXoDzRay5rg4Bc
	 OYDHa+kNWBOAS3BAA/cAfhOifGAunlwRzXoFd7Nml4mEgJNH1jL6FWEMJJzC8ltcbSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575864;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ZfPMlrVQ9XLjh6kjdxO0ST3Jv2qXKJ/BPZ30eZyZokI=;
	b=HhuvNPLZIpYZbO7OqIEkRd7K/Az7uH5PwdzkcMtPTJWIxAvuL4/lurtztxKhvR1dQKeA
	 BO5emTCNVK9XmzgQHYFplYJf2e6pqr6RvpwNdM+lKgkbbWbn4XkhQoalq/cEMfykDX/tq
	 xTp8lOraYxppbuPb/GchnSDjdaqQqn0JBD7KHv+q9WsTFrs7Vhpm81z5JaBrLu/20oCtj
	 ugxYaRpk5LYLPYVVtnTHiy6lIafBJ4yP095Ftei/gdN2RcRPBQ0FWDIewexZqRGgRlXDG
	 2Cln247lKJOB//Ux51cCAauQOBZgBEnahQGGIO36LZ5NuoquzLxkn/T8u18GU8XOi5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZV8/07lx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E968606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZV8/07lx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE5D1F000D1
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575864;
	bh=ZfPMlrVQ9XLjh6kjdxO0ST3Jv2qXKJ/BPZ30eZyZokI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZV8/07lxlb2aTrg1iON4ftQikyg6dlZTSDaPmGjBXyMjqGzj+HYdSe53s+ScYG2/h
	 rrKEudW8pCnqznx6nrPMPVFvDBAOGrWtYXofY4adc/56hvHqmHuHazvA+Znau/qvYs
	 iIk7MCySit3mrXDfx5FzkoxWyc7xwDWpmL/n5qM17SYCV+0JKOWLi6uVSXJP9eHuxb
	 /nLDgVXgH6L0T2bw1KmbVQXqCwInLCvbe8qNFzbWRG54pOaWIm8716hxDX9gK3XZza
	 s1bs0nMdLHPQ7Nox1cNsXkUchaWIz+QJiRehG3b2HsbdOyJlhWarRYmNpM+H6pTDvB
	 XxmjgGO2olUDA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab4354db11so3919801fa.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:44:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdESHgNznkd/hg0fWeKWmGAhxVo9uvewcCDv3kwwvJFUUQs3rH/vIzXuTCSaeyEWtCm22O5WT7AyOl@vger.kernel.org
X-Gm-Message-State: AFq9FYLv9Iu7srfSXOrOwWOJV7auj26tr0ffMKY9d+hC5d9Sxy8UbXCu
	ZybrdGSD0ti+08y88zST55fvX+zvsnTRKMJ2Rk+9PVxZ+F5ozIzdu9a1KACj5lreP8Z2WHaMhVT
	JXoqX938O1weyHyqlPplrGBbumTQtJm2dz5vbn9Y8aA==
X-Received: by 2002:a05:6512:10c1:b0:5be:50d5:594a with SMTP id
 2adb3069b0e04-5bfa1c2a956mr580646e87.26.1792575862744; Wed, 21 Oct 2026
 02:44:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:21 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:21 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021073633.2163128-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com> <20261021073633.2163128-4-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 05:44:21 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdB3EbjBzrYDZHArERviS+J6g2dxAw7=VVoQ-1LYaJRkw@mail.gmail.com>
X-Gm-Features: AclHuK9TBV6PrDwxsS95btH-rZknLNEJQWHFvY1vAuIKD57w503S4mKxDklkgVk
Message-ID: <CAMRc=MdB3EbjBzrYDZHArERviS+J6g2dxAw7=VVoQ-1LYaJRkw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18
 pad drive strength
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 09:36:31 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
> enough on nord-ride-embedded, where i2c18 is the audio control bus
> carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
> TXS0102 level shifters. Transfers intermittently fail with arbitration
> loss and unexpected start/stop conditions:
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
