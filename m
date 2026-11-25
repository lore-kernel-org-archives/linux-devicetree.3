Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579772;
	b=4HaMwiaKhTgON/LiSGJwiYzeBCYSknOAb0PqSOwW7k73nSJbAfUpyCOvK6THgrj+ysFn
	 lNUSv5LVrql+IewqtSn5eSVCya9jX37jQatbx6o+6fimPwxDCyiGjbCai3SJ3AB08Md66
	 S46C+bc3YHOKh+oYWrAzDptxX3GQ3pbR01Wz0zpq6ZtNQhxMIeC7DKJrqGK19UQUUQaSX
	 DabUbrqh5BgWGJO7LL1neL0+h3HM6+4uHmjwfkL2DFPXtwRkKvLxP8G47Rce8JofqEO/t
	 oCdmxtv9zcJCTurclV505lhcrn/JDGzyPetMrzMDgmk3Kz5qV8L4XxwCTJ8HfiCkRLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
	b=2V0mrsO+A7L90kjnPtpQXzBypf4BDOqhvNompAQsosPE3f8iVFu58lvs/HqayI2QIB+k
	 xNvhs2R7bDDlre2lfWPQpw+KWLmiT6I+sEOxVxlExOND1iG3JUvpefD+pPDbzyLjTrLGN
	 z3H3ongt6y0uP+UlwaRZDa+UHfrhx82f7ZqV7D3nMoT7T4SoRBD/KaFm/qAcWw0+nQezl
	 26t6dhhaEQsi/iYj8waC++tUq+R42Kl7HQzt4zWO3l3qDQuszgb1xA4LOScrhlVy4/gmd
	 plrbr2eUG/NnLgTVSE5ybZR2YPpfsTJJp3XkE48gvQ/D/qWD2eupRQEAyCeeibSbNbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwakwhmB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E00606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwakwhmB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4283610f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579771; x=1796184571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
        b=ZwakwhmBUNFk5iieZQuNuzg1aYv/WU3M6e57aS/xhN8ERjUWlGzPwm4Vj6GhXU4RuT
         M5KfMt2t9wkGnlEFtmxO6DJu7e/h/EZ4saO8H8yUZAU5An49KWFI/pquGlJbGXGK7ahJ
         f3p7+yVN421LRBxmbIkePqSLExjExEtaMkKEqXIuB1g2BUyLeMduhdapnFoE9UDhI+x4
         qQtI4MdDCYzSuPSGGpLRvqpn4RbekVMD3UKzNAdefC8jaY09xl7LhXSAu6iYrb7lsVvc
         n84TkwmDIhen9PmVwU0vTW7KJbxeNHsoid/k/horLxl8mkyD59PrbGhDthSxUrcQ5HhQ
         Hb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579771; x=1796184571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
        b=K5l/E7fe0Bnv6Lyfouz/bNz2oZ5g5ZeDoLohWbVR0c/315SVkjNBei/puHiFgy3rC0
         NNZQ6ei+leViWpnD684MPrmVTc1/5dl6qDYa1RXddRRAYFQe6s361UXcRhcYxfXAEA28
         qExsvxi500PvqJX0YVRr/nTm60OmFtqKdW72sVZqXxRmlSRt9rBB41oDbF9lijid3cD8
         StTELQD9I03S0dRPXKjA9TRBT3HqNbUSN9A+vIxmo3vWdisdq/oM895FMklseMpwZrzl
         4dhkVG99xE+Uzp1PjcZIr44GTjtxGEYI8FL9ZMKEf31qnfxVKZxjgiLRqCzrgK2r1R0k
         AnIg==
X-Forwarded-Encrypted: i=1; AL+hErFqXpVwFaRY2oSvlDCt2/M497odlAKl249UNFlPFsDxmzWuFkcnrLALHR00AfzfOBy0pnCUtdPLFmUg@vger.kernel.org
X-Gm-Message-State: APuU4Z9o8m4RflXRsHyOS2FoOYgKV35wjS9Af/jf8qglNx1Nx/yopFd2
	/xI6E/mGMipnBB6LCkxtw+zaUdA1TLcvWVZs9Rakjp0eC+naasRuXObo
X-Gm-Gg: AZFdTZflgxMxpAUoPaOtM0uC1fgtkL60OOotYKBqHlPSKngKoPpZBV91t3MCVRtLMOz
	BZ8viwH05nCLmvATfqULuwb4T1UBA0R+K4Yw+AlZLDosfQbxmSYvp1OXVbfRuIJxFTZsNV029X4
	p2xxn4npJJlaLQBW99RG6N1KAif0OlV7iW/kUC2AiSeRr4EU6lqp1bKYK6d0mpHWfPrPISH1L9V
	4vsWJcooWrNecvGMnZaY5uBdNrV84zR/zIDmq6F4kh3v/mLTswFGE6aF/40+p/eUOzNAnv4TR97
	DxXg+pB8rPH+Fuysbz5pGbZX6Px9xRwYiG+2fsCYeygbjX9MYm/ELMk7k0y5gWQuvromZpYFb29
	/s4sIJ2dC8Tid/dAozUMNsMQPqgGDNECTLf3iFRPIqALctqOnWL56/TzPu8ehNYGNI45YHuIvm0
	Fgk0j4ESF0Di3LQg2FwtYMdELIu+mwhXaKOZ/yBq8YCBhjTT1hISLbOM7h/SdO1O8/P8R2H0TVD
	tUm/ak4swOd5r5lU5+aqoM72vE7zYjOjevRHvw/7Fw2amL457sKP0gH6S8EDe5WQK6Gj69/k/dR
	7MO5h09uNtMf647HlDEOQMQUfu0=
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr31743230f8f.51.1795579770667;
        Tue, 24 Nov 2026 20:09:30 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm29545143f8f.34.2026.11.24.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:09:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	olteanv@gmail.com
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: Add initial Halliday dtsi
Date: Wed, 25 Nov 2026 04:09:14 +0000
Message-ID: <20261125040914.2399053-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-232541@kernel.org>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com> <sashiko-outbox-232541@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 03:58:44AM +0000, sashiko-bot@kernel.org wrote:
> - [Low] arm64: dts: qcom: undocumented qcom,halliday-cpufreq-epss
>   compatible
> - [Low] arm64: dts: qcom: undocumented qcom,halliday-tcsr compatible in
>   tcsr node

Both bindings are already applied and in linux-next:
https://git.kernel.org/next/linux-next/c/7ceab1723610
https://git.kernel.org/next/linux-next/c/1cf95fbec47a

Stanislav
