Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794691849;
	b=MGw8HFqmi8GcqBamiy9wEOLTehlfCxey0bRAGqgREkb/U7rU63FjtnzbXxb5X0qMb6Zc
	 n7bQJ+S6P/CAzrldF+rzvNqi4ic3b6Ce+qPojHRpn7lfy454COZ3aohXX0aXwMFV6v9JM
	 GDqieB49FP/59hmYI7TmRO9lx9rLgTkUdeWenUF6h7uiwcc/ImBcoMhaDruuHBb04c65O
	 WPlNQ6Xnw7Ol4tcEjGI1KnJ57JNqxn9SbSK9SlZn+fl2Wd2RPYFkKSKfGHzrN2bnM37wO
	 CdqJ9QPyMHammj0de7i3fD0w9HI5IRozCT+j82LneflXY/juEAgOchqPKzy+Vjs7fSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
	b=aX1kj2PEZdamBFkARU5eYMJKVpcA6ovlDPytm2t6w0qYEza9MEzMxHTnsy9zrlOCAA85
	 +pQrx/iKaN21duZhR+dw3aTVN0skPRxoNQprqFMk4/xVCYxDHrjtMcA6ZCvnBxE1HfchK
	 //xOWBk+IEOmjKxHNUmeikjpSALT7pmeV4XPpCKJUXJ2lQKYw9yWYACypnTmUJs0nqm8i
	 h04lCqU7ur356aVz+aJcDzdtfAoMR4jfvFqrdKMlKvqbdM9GMIGY6QptL2G0P9g4IxKvn
	 M83hhOdt0GiWj690SNGLrWIyX2Badw5SgrSAgk981UN8UG1Zy6l2BdpM0R/vRS/6EMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD700606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD700606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so9545615e9.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691847; x=1795296647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=lWlSLmZaPq3CwNa2GvJ5HLBZxwrHAyR4KYWcNLYDoejqq+bHE47WezKQusTce17cqB
         UTWjdD/IlmKTsXW86lcI5Re+obIoVIb9t86LrcMAeziz9eDWUmhlf0tEDJWLXl6iumFV
         A0KOTfltxQB7iH/1NZqAz8vQsctKFp7PZfZL10agBOyW0+/+Nlq4fquLxNOefQolK0q1
         7b1VyBrgPTzn3K2O93/7d5x0teNBV9W1gjmQsMpDfJX8yxuUQvPJ+6K/Js0FjGNLg/bj
         pddRJxGyyKNTa55ItmUV+vqh3pU2XKCHu2EjpM7+mnWtIVQHlY7yLwHWBA9Qc69Hd/il
         +DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691847; x=1795296647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=fJdAqRl/4wpESZfFt7M0C/7Ggia1wGzDuX1rigu90VcyxZHrux7SedwfOiXbZILzX+
         h3Ysr3qkGTnypigj/lLFkTZgnvYkQOcDN5UXLHbTsEtjqAFlO3GglXIb08SY5560BXzc
         WhchEp2b5DLShS8EetUsd19TEU9c2vguLIJsIwM2Z49VjoXDCktl2T6kYjA6rl6yls5E
         0sdF0KioDT8BjutrA6HmuPZUKdQqO3tU2YigtT1YmnH/R8v43+QKcfDkywX+KhljGcdk
         LBYgrlNfl7UHieR09OwzMdB67u0XIY4AA3WlsgsGrv2lNR/eAGvtJIp3iv0AKCAcJ0EO
         XBug==
X-Forwarded-Encrypted: i=1; AL+hErFugjAoX5xwrw8ilfoa12/niN9GCCFiMXo9nJ5ARzkkqVYawMEXWgQzs45DSmVtULmh0VNWca1YYf3H@vger.kernel.org
X-Gm-Message-State: APuU4Z9VcSCfYeRkwUQU1yqksZROgViKtD7c/F+hlbnq2cU6F0t8w23F
	AM914SVuBs5TKw0Je2PeQieWQFkQsWvWTdMtodgz6aBVwQjzQndBddKo
X-Gm-Gg: AYBFou1S9N7DyZnM8TcIZ3YDQS+a7OWfphPZg1JHvj/5KfhacvqzitnzZbZjYQtia52
	khJx2lNbVtyJNBUfyDQ1w2G4wNgXfQKCLjIxPmrRlYrGrDll2XcalyP2if4DUTU3jjx/ubGUEOY
	dkSo2FuczoEp3Hs2+tTviaCsdoagJpjLw6Z1hDMpNe+z++Oy72wA9Hd2B5mNw+1FzTrNKL9v/1t
	NQJFlqL/nnsspEp2BlRwDi2Nqau5MzJQvICJJtkHeLmH7981c5nCs0uVjStktYnsBftQJU2ceCE
	uih2MtZcUfHXSDorBu508S6oANsuAf+3RfeBJAgz4wlACfNLJrdOhvYKF4KI7YZDGEw6F7PhZKR
	cEwz6QrpS/0aFuELXCI3G+0tkNviYEUnLhzI6ZuwVufB0GJ8XRGK5P8Hv1RbZ3PmdnYlkjCoeEx
	OOunEGhUZlJjBw/o8RSn7PcDzSPiUc1dZ6Ec+0+zk6B3GXC1Udgod4IK7fQn8+Ob3xtuZGvfOHD
	Q03Vzb8f3I2nVvz3o/XEyJWGpMfCZSeoFPSVKwKAjy79k907e9gpyY66TeCTRtVgkL3cz4Dxvi+
	RJ/03akqW21OEi1a4SFRS/Ob6QU=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr187322445e9.2.1794691847097;
        Sat, 14 Nov 2026 13:30:47 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm12803478f8f.36.2026.11.14.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:30:46 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Date: Sat, 14 Nov 2026 21:30:28 +0000
Message-ID: <20261114213028.1933448-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
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

On 13/11/2026 13:10, Konrad Dybcio wrote:
> Please add the other idle states (D4 and E3) from the downstream
> devicetree and match the order of properties (psci-suspend param)
> to glymur.dtsi

Thanks for the review. D4 and E3 are already there, as cluster_sleep_0
(0x41000044) and cluster_sleep_1 (0x4100c344) in domain-idle-states,
just above idle-states. In v2 I'll move that node below idle-states and
order the properties like glymur.dtsi.

> Please use '0x0' for zeroes in reg values

> Let's break up such long lists into one-a-line

I'll fix both in v2.

Best regards,
Stanislav
