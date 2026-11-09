Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214238;
	b=mDFetY1iYDBAdVuzI0oHHgxzKBF2VNOcP3GEYairHrFlhDkmfrkB0TUBENqoWeRk/P5/
	 3K57EdrFgyF9NgplAvBG9CHtbNxjFiLLff5oAvBX9VA/hCNedqO4CUIrHx2gs341vazAX
	 AOv2zvE6KLC8HeK18QAUPZwUhRTxEjROHZpetSdvjgj1R8OTlu/Zm9iK7WID4/YfouPCb
	 HWq+aPVZdVGQLo9u0UJJQqSnXUo+r+UfpKHRtj8+c/rToKT6ZgAK4K9gUQATHEEdpJBvX
	 6njUKEhgoSYYQd9zqSyFdaR1P8fAfwM6vjf1BWqjlBs+vJ3pKnm4HwgrcE/bbZWQ5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
	b=x+V3RB0eAyxccgagAJduZUbORB2O+kTLIGhloPbBtKDclw0gGl0p30ueu5QFrxpedE19
	 XtnKkGeGg96mrO3dKH2ukVGBbQcQPU/6Svi1tlVaUozwd+5kfQOlpEMStub9X15/0KTHl
	 TFWGsdt7EQODEPWC7Gyh6pBhSuXJAgLbXoRcKohDqx7ZQXY0Kcv1JVIS5JleA7AE7X3mA
	 PgMyoigVZxkL7hnEv3iSbAwUCc4IOWgVOQGU/+45KMJMbmQLN5qTqmdp8W6JOWUaZFWh0
	 Si7UZEweU39rI4f/lZyJhlJkAuPvnjfOG7inqo7JQrcBKJIVnRMzNj2EMa3cIYug73A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGqde3Ho;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF5606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEF5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGqde3Ho
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso4038045e9.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214236; x=1794819036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=TGqde3Hoeoi+P+P1MJHy6yFa7TDuVfP4g4ZGwX2ih4xjRGjRFWnypRzOP1Xa4L0IPm
         s/DPVbSTnEn6+vQabgyMvzXoPqHofh2/mImSCnYL5a12zXk5bVCjZsmkY8NnMPUi2SVc
         xAgwi/orvf9pFkFiAXO532yOUQEFgNvW8m3sxgUIowoBqxTIMXeJ2WTdj1dQHwKMPf0V
         cCNQoCDDyIF0nns6PDu+LZixogYHFd2CbQ0mtJSAP17FhsmRFJQnz4kJM2w5Emebd5cL
         Ug3ZqCYI9cMwu6iJ7WzAlyerv17zrvmPyC1IUPu31nRNXyg9pX/XYW5Pjf8n++ZvU2Ya
         pTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214236; x=1794819036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=cMYyYI4NENVoK5/Zho1bEREh/GJMO4cdiAjRRDOdeoCGKNY5TGHMzxsQND0YSfv9tF
         xD+fruSLB9aacB+7gVCwvlMNWY0BpAi2r0Humfb84Kpls71NMsjbHRQy1+5ezHImZPeO
         GGB3wvpY6Yod0FfNA3pL/DEFbnVSq78FsfaXH0ajv1oduoCzwkvbXd3fTysqi19e6ar0
         jYcNs1tfBvJgTl+Ajk219vd+tWVtJe+wzHBIxd/KUmam7kH6o6BHnTeAZ5+9H8JPYMcn
         OoVpGL2PUsf5DdWFeOYkwGmyVSElMjfNYUTGSnml8fJDrzXgVy5KyPTEIqaKBWvtJfJS
         sT9g==
X-Forwarded-Encrypted: i=1; AL+hErFLUZFwyiGwVz4xbRIOMk9/f8BMY+GKJHzLQnpG/hTeGBnEuSULxt076iZ+frryOt7nW3v+jY9C3Qg3@vger.kernel.org
X-Gm-Message-State: APuU4Z+l9rYff/CSoQS2FXslP0LiMIgDcLnci9WlVoIapKknzTxv26va
	WOQW69JmYKxfVfSXNVf9b66+S9KzDthktbYCcYBmdEoF98/Scu4JQMNk
X-Gm-Gg: AYBFou2zNkU7GDkyfxpUlKlOmeRp9VJR5lkoHax9kfBVRhST/fiZMshnzXj2+/CHvZP
	Il/PHxRt9k35byzjHaqBHfGolW6O8590FB8G6K8JSU6A1XW1VbN7sII/s9wiJ2RtDPXFMh5eFb3
	KJMZYl2pQ79ASbhuOnCaGvwBNux9lLsQAxdJwBPkQaYchwawDOg6Copvht579fAGZ1rRQPoZo/M
	KltPzwjNy7GZvidcCAKLhivM9PHh68foSlmcsfqy1SJ42IwSEi/xvu2nUC1bj+Db1wOadVQuhcb
	LdCEjBBB1sXNMr9RZ2uFFnv3BNKhkRgTNWLl7gGnX9bXSIilrnBLDyjb+f7cKv/FSypThPjyoiN
	l8qbnskBgzFyehdg+pJSjirKJfh0YK5xy/lL9N3E92dROoyXeo/D95UTpQDRdHLku4IOKetLYF0
	E4DcycjsxpZnRQX3LbpXLDo5xU92+dg2NY1zYPm1Mdvzz2mFO2HsDxICxhJye6JNArYK3JfpPSa
	HwW+mFXaN9R5mS2M08BDbFQskMM0r354euspp8EkHmxIedKLn7ZdtRTc01X+r2KRpyuZnCvM24H
	nrtDauSp5S+STY94Fj/8v+DFuu8=
X-Received: by 2002:a05:600c:3b1a:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b963c7e496mr65389125e9.29.1794214235848;
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm147015055e9.5.2026.11.09.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Lee Jones <lee@kernel.org>,
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
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Mon,  9 Nov 2026 08:50:19 +0000
Message-ID: <20261109085019.1751534-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
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

On 09/11/2026 09:29, Krzysztof Kozlowski wrote:
> Odd license, suggests you copied it.
>
> You should retain original copyrights as well.

The license is BSD-3-Clause because I used sm8550.dtsi as the template
for the node layout. The values come from Qualcomm's downstream
anorak.dtsi, which has no license or copyright header. v2 will add the
Linaro copyright from sm8550.dtsi. I'll fix the other comments in v2
too.

Stanislav
