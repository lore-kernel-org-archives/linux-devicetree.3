Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245938;
	b=K8M7P9F7e201ov3l7dDYjzeDSb9lVFYsmyQovkmidDSRkKXnewTHVsXzJVjVKAT7vHSb
	 VS1YJ9NVOMmOo+nHs7/hMozHZAOI2HTv3mSSuQ8RphfZFcTa4FSpwLeu4EXtX0iOGXUUH
	 Vu55QUIHJLeNNhQwC2B5U9//Fb46E36UwhSgT1/xOsJkLzZOLY+vhkKPmVWxrUptabvVA
	 zPNdGWlJhpiBr3sS++C4rXeBlhCoE455DhBGiIGKP0hfC0v0+XX2QgS+fGBB+RsIeqTRb
	 pdHFoxn4qocj+QWxZBLuo2ozGEt+aoF5VbneWmtSwO3RkxNwZWmpgsq54ajzxkGR7CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
	b=QKkU9IXPPXjU97Yx7afrrAoEM0ZW8cvvPF4zdZh6B4QZlpCiSoIsdSeAokN9hLJRD6pN
	 7/b8VJLG9WS7nSooG5gx2Dt9kzzoQ3e2G6CAkw2SJPsQEeiSo5vdLfY5RJ+l3f5jMEJIF
	 UHpJVifJvuZvcQP4qEgXyKRXVUH7k8YpdIN+ffwkRmPTwPuQtool3NRVY+64TxSZC3Qen
	 2l3Vm0YyavVzwCmjMO/9ABwZ8IiAjH7FJVZ21kV9KVzLM/G+Cp+W0lucCPFsh6chdJa11
	 y+WwmL6dMEhMalPm3ymoyqgZnKT7sdRj17P/9BZso16Smu/Y+II22OqE4z3rpnRP5ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET4UmX4l;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36A606A32A
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F36A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET4UmX4l
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so9893105e9.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794245936; x=1794850736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=ET4UmX4lnrqCC21B5oGoVYsMQvX/uO5ZDK9wo7RPCXLUSHAzor2KKP7C7D4g9dOSKl
         T9tIynx1iZ7nScEbu/rROoW0ihwiLqJhnnQ61YL9jqzvok+DK3S1a+gguxLlBKC8w5O1
         moTFTURhfavgIUyQOJfzNwN7KB0x4LD4UGwaMonewXo+m5sWjx57U6MMJmglEzxfuxMO
         LmUAzY4EtqQeiNxES10G3nMFPkiJj/jPtOOkesOWKBy7x6Ryd1/Cph6kqfXQpWmPijOY
         8IbZFuODa/za16J/GDh0DmEFHyP77cWRenI/CjjMSrzXFx4Mn5aU+7EARh+lKdHOYquD
         rC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245936; x=1794850736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=djIVh0KuulXn0WbWPFEj2B/2DKN9/Xyq2LFKjLWft/iuGEYvkg+EzReCKaBhcuEs4X
         3cK40ML9sERVFEtFwIybayTVFoj191WYKesnwxGT8Bb5734M3i0QceWLO2xDwwKoziG4
         yk8QwqeFNKY1DiUR2n9geEebiTQNOxhDA3kuumN+kCNs1dVP0QMlqCvaDxNjJb1VCRtt
         tFOGLj53oq6Gmnxw1ENsqLPOMYYS26jY+wxrswRx9U/BCd4ujuge6v0EoXBLerYQcnqs
         LTBTRxFnjtMikeOUCo1Vrj39rH8bCE+eeJNo+vcKBhzqSO4Cg1lgBNddSid/JMEP72S/
         gAog==
X-Forwarded-Encrypted: i=1; AL+hErHdZiNI82DRMDN17vZDRPPM6g71EuyggNa2rFEv3xnzRbVxXQpajImf5zIRx0mT+HkSCqlCLAVOv5nB@vger.kernel.org
X-Gm-Message-State: APuU4Z/CO10/DZaPp99ce+sE4g16fKh6ypRBPhn5hQ+xoWWhy77mazgj
	3DfCjmGhrHkdOLnRzMKlrOBlMMPbs6c78ruyQP3F81tcrd5m2z3rXgPC
X-Gm-Gg: AYBFou0GlWhdkPv4uW/U/Sb/DjxHd5qzsb7qOB+gIkYp1mTHl7WTaXa3IpoWkOqxwBA
	yk3Fxby4dCGh2DoF4/exOnmUJTUs1uj5TfJqScGudua3BliapssWmQNfgCEJt8kauoQy2sS4Ryt
	rDS7UQtYt8OYqH0a7GeUvOUJ3O2Ngqfmepg3iaZoykdIx98D3TMNPKk0QTaUqa/MoiRI7EAK5lL
	UCyKfi5H9S9aPtfyc825pLFtV8l1u50rgQMqVcsDQkUjwz/+8mHw4i74FBM4xZGoyrOAdU7VL64
	zXEI4bQ2qHpns/WYhIYSm5QRPfwmKnHZvcvNu8TjWEAxjmuL5FjTWDz+xKJnz/h1CngaLnHKV5f
	fxWyQouxTKnD+Eo8pTC4jg2UkzysVyDGq1XzLc4nTzSM5HexBRkRrtaBZIcJRh0+r91dDtTBWY6
	mrCYZyDoCTxAtgBHqH9oP83YKha4S2NgMba32cWC5U3oia6CwUTLt/swR1WO8KmtY5VcQ8TbaxR
	GMDCan++jbD3omMM3r5SNy6DX705xw5Ij1ifJKAjKcNcml4SBecJnAMosG8GbKXexnW7kn7ilkn
	p4y9nwc3N0xMDjuQS4mlsGmHs3M=
X-Received: by 2002:a05:600c:608a:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4b94d76329cmr92154365e9.1.1794245936334;
        Mon, 09 Nov 2026 09:38:56 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0157b707sm2522005e9.0.2026.11.09.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:38:54 -0800 (PST)
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
Subject: Re: [PATCH 01/17] dt-bindings: arm: qcom-soc: Add Halliday
Date: Mon,  9 Nov 2026 17:38:37 +0000
Message-ID: <20261109173837.2084788-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-1-289114ab8197@gmail.com> <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
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

On 09/11/2026 09:25, Krzysztof Kozlowski wrote:
> This should be squashed with patch #15. Also, there is no benefit in
> organizing patches within patchset where patches to the SAME subsystem
> are split all over. #1 and #2 targets SoC, then there is a break and
> again we are at SoC at #15.

Thanks, I'll squash it into #15 and keep the SoC patches together in v2.

Stanislav
