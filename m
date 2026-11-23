Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468663;
	b=Xdrzo8eTTkIbj7eBtZplax1c4xNx4sM4ev/kiqF3u8G+2U+gj0BAlvCI+6B7wtUM2isA
	 7XHB/Me8+7zG/z2RJxvjIj3tERkMg0ZrRtkrDpaT6U8A58ri0CxQMkLZ9geuq1Z5evOGU
	 g0r1/4/MQVediL5OJFF6oO/sS+kB9XaYQLNNipcNudGDxJiuQqK93mtAHocM8W+UI+eWM
	 MAkPKpuphisXOZi3/i1Y9gOp1Ypb83xLFvVPDSNvsa2q7N2IqAvmzW53ueaqsqOeu3986
	 cwxt1spV2uqeWBo3TNgqp9DlT8EnP/rNwKFqlgpPlRXx0UzGdO+fAlBcAtS0mhZ1Ikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
	b=4BBvXrFV/6GlBjMhlLbZR2w3XZFj2kcwIBl05wqQOoSfbIC0cGYUOJ/Ff8n2/zlDYCwF
	 u7yKnWAZmF87Dlx6gEdzfvthxtV0VxsNXQLWDn9RGXsU2IEg7/pQEVlOHPIlP1RU9bs7E
	 3PUAxiBkwg1DVU8PFn4fr9ubV6xAc6ynsozoLxWOU708zBmiiECuE1lCC9A22M7Y668lx
	 guNgCCuIbSh+gwpOiS6cKkZn9i0sbcrFeom6LDkWxAcMJZe79WmvpV9QgIfCcL1V3KI+J
	 TJdZCciKBCpdVwqs5p8j6uBLaTpIxYCCLYcqyZDfEwYxA9zCmZXpa7vehWZ0pJYK3RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fedjRZx;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41A606A337
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F41A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fedjRZx
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a9be758734so2317479f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468662; x=1796073462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=0fedjRZx2RaPeNewDfT6kMMnjXVPl/B3fA1gPsEqLujR7kcW0NYtdJYVaByQandrUq
         QJzBJ4uC9eS8a+ayksMogNxSExWs0eNFKItvTDKAx6NHc5x9hqv9RQlhAAzaAg7s5gs1
         9sbtbyps4kPCKude8iZa2iiFH+utWXTUN8TCJqFX8mRmvPPMu6I8nAQcyMZ4i4mpzyX5
         Cp154EF42lPno5OVkcDwnkP37Yni0BUszr0xLEoRsNB5R9GRF4fxmXOCy5ua5f8Nqhrg
         4AybiECJ+X7fZBXujwbzZQ4s2TiblfJ29wOS+plEAwzRWxdPuG712xtYts3o3CIOU5fN
         1RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468662; x=1796073462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=eNrgXE6R5jO0MIN3ZH9f2UlKV2YkXdZuBW4wkyfzxSK2pXtP8vHAorr3Za9xJcYrqT
         XtN6vbKufC8JOhiilLvd5dkx4wt5V/uK8uz+zi4tVj5n74RSnsiSGk4M8NCYX3XVUagm
         2opia/+Xb6dG7K3JG/wR2Rm54sm3WeCgIX+cbRLasNMpwK3QVzOWAW/ZLEAvNyTa04ee
         J+wGm3KWWMQb+3aKLzUv0NIjd1ezn4mKd3gngzwczB6VdmFTc2LhmoVKy55Zj5y7TLuM
         V2QdSm5ULIeAgDYkcuqIwDgoM7+V8JfRHw2SsHsC9R2tzZzVAmQ5lFMqdRqNFvL+iHfP
         bc9w==
X-Forwarded-Encrypted: i=1; AL+hErHo+lX5TfM6V+AixhBvU8mN4YQfatlLtbnnADd4nVV+Ssok6HO515A5n47RtV8KodXQIgtSDUXDHlmv@vger.kernel.org
X-Gm-Message-State: APuU4Z+NBP+xj82/Uo9bjCmXZhQC7zTQBVOvSBIuSf5NaROO13xQJ79g
	hpgReO11Jdzmeqqz4gshlG+UK5kMDfz1cRsYDU8rlPeywCxJ+0NeGZxG
X-Gm-Gg: AZFdTZfKu6mvqDeOraXMqH6piQz8hIRtPmor/raNSfXGiQG5ZBfnXYgHSEZo51q9/N5
	pvdKaYnK0YKHQRDzu11D7GH70T2gSoTLJuKdS2URU1hZ432aEu9hiol+UE6WoXY++VSQsjibqEt
	YQ243UuHnVm/b4Ku36Ix8XGgJGy4aS6rCDUqYEAdTU/qDd0IU3uq2xF6dtTSsONegGQfTzyI6ie
	llYSJ74XDgLJ/pfQ8RkQSkf+TEyvQxA2l9at5GYXi7lWrmMhyFVAd6EnH8MEpsmDiVx+RP4h06A
	xDfZfGOgvBEjw2aP7lN5mUygXDaNRxtod1gR2GFPPCLj8emZF+Uio5D6RV6WqJdmgGicLu5WUB9
	1a/FoLqIiEh7MuOB1Ccwfqq5iNOuxHnWa/5jFmfSPVT3OpNoRgbjsI98DikNwGJ+aPFgzrD8lC+
	JzZA8wb3cVSJIf6NerOwdfZF509g8j0o+OlRD8lICPPg9nQ/aEqw4Dn6SE2yj6HW0ubDMZeSsh9
	0S5nq7cAftNOis063gqqv1+hveocNB7LKLvzY99hYG/V/wGdBu5VzMeS1Zo9Zwylq7Cwm454NZU
	w0mz7pTBxYHiMOpeaoDINNtz3G68fGxcN7xstc3awk9LzWzK
X-Received: by 2002:a5d:4605:0:b0:4a4:14db:2348 with SMTP id ffacd0b85a97d-4abb29105d1mr18698069f8f.35.1795468661504;
        Mon, 23 Nov 2026 13:17:41 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm24513121f8f.6.2026.11.23.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:17:40 -0800 (PST)
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
	Ulf Hansson <ulfh@kernel.org>,
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
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Mon, 23 Nov 2026 21:17:23 +0000
Message-ID: <20261123211723.1065310-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com> <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com> <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
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

On Mon, Nov 23, 2026 at 01:09:26PM +0100, Krzysztof Kozlowski wrote:
> This should be rebased on my patch removing the IDs.

Thanks for review. I will rebase it, but I am not sure about
the order, could you please clarify?

1. Should I wait for sending v3 until your patch is applied?
or
2. Should I apply your patch locally and then send v3 based on it?
(but if something changes in your patch a v4 might be needed)

Best regards,
Stanislav
