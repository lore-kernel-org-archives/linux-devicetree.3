Received: from mail-qk2-f17.google.com (mail-qk2-f17.google.com [74.125.230.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B24F4E1C72
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354493; cv=none; b=LhHRhQWp5+PxtMtkkopJ9Ytv3V/rIY1JFOy+2t3S1rYxtJQ/4Kwgo00O1oK3g0I8W5P574scpqZ4wABZHoQjzGL4QRw0ZgwwuRUyprFoB+JZdHuD8d7zS/hq1xdFQrkiE3kCn+MaPZYpOgUdYVLXA5faGggRQuFxYqD3uECnGyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354493; c=relaxed/simple;
	bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZgR515aCFsoM1pgPHwtrXXM+XLj5694QOt0404jzOo347owVolMO2lQEozRYdJzPF6ur8i5hTfbXQMv0Uc5tFWUVMe1PomlhI4DF5HPx1uonXLcJXgRGTrgo+gr3S8wQGJPeDdXegqJmOJ7WBntn8gDkWPdTEoPUv6NQzL2fbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=ZPVmwzjP; arc=none smtp.client-ip=74.125.230.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="ZPVmwzjP"
Received: by mail-qk2-f17.google.com with SMTP id af79cd13be357-93910ca5aa7so108636885a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790354477; x=1790959277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
        b=ZPVmwzjPCgFbxehdiQntsj2eCKJdbl//1zWkim3xVQsVZOn5eDTac12e3DfVhKSN8C
         rXI5U6hA29+CHnX4aqdYM+3aaitlnPh3WzWcE855XhjykP8iUb0lM5WtLLZclmY3aXGs
         Y9Eunv5JcmbFTQq7aInRAaoRsy+1eJlWW3aL+/63mSeBVqZg00Cq3bbtgtMcph8ZPA95
         Sd7gkHrZPF4jczy16gYAkhfGa/GOVm21WbVAdaAe8IdnTnlo150FgnidXPcNWfQKWZrB
         1zlPXsh9HSnabZI2CleXw0tk5TgdVgTM2D1CDRFLR9L5FQnBV/fD7i3p71BTaOFMu247
         5CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354477; x=1790959277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
        b=eO2dRHHdI+kmt+YmuT8uk+5wQm6LqhCogQ3V7Nhb1RiooYQHDeAcrmhKbo7PKu3L1j
         aiAiSnyLwJCbPsQcGaI/NTTmnhsMXkUlV2w+i8iari03F796YpWkSKaSj1J6tT1LbQyV
         AqRdufZqdByjWFCpT1Qkjf6VPyHAeBAflzlwuJUxPR1HBBAsZH24UxGCf/XS4KJALv88
         KFvcaY94AuvicVVOfZMKlf4loICa501eStIz7fB7h+vizTv2YBfAkykY9Sa1oe/FtpDj
         Ly6TO6WJ84/J4drEM3H1sqSw2sAmxhwD0x3/gUjrStxIwRHGpZdOYIuKFwTSPl4Ax4a8
         wy6g==
X-Forwarded-Encrypted: i=1; AKwUvBwpLxPQXNlJrkQo37wJx0p4d/pwpE1syJmjOWhJWcHU243l8s2AK98GvuJAE0gZ674tm1sgYpN+Y2/C@vger.kernel.org
X-Gm-Message-State: AFuF++lo3pmdjH5RChoujowE2gHz+1G0UQLVcdVpBrNzgekGvUctvSya
	eFOtRmoZmeiiWZkhQpBLLOx9cl59aIqx6Und4ZuTsuWbY18CF1nxGYuv0e/f8zsHXhA=
X-Gm-Gg: AYBFou31PkNWVu4RdeGziATFq8u44oy5Tiz0UneV7ruQcJ37085Kt6onq3Kz97ZRQeB
	jabA/L4j8Aw3+4rUzUt27+170yYi6S9lQ4MU5oyOP5BxHwC3xBEl5pwZufx3ugOmhzm9LhRJZEN
	jlLv2OqGgrrkkgiXYiKDQb+njPVYPkecXyQkVBAIRCFQIbGMQRwrRxsF/mafP0JXbId9OQCpTt9
	g+DYpixsFH/H3gYqbYBS4d1XPCiiUNNicuBTEenSaMixMsjH8MD5P+KjhRAXj35ceW4tdLVmYZP
	swZZ4rm9rZ71SSFs/tnCd3ibVGw10Ym3n26V+j4vx2+4oc4Barpwthq5hGCaCWXMIHwR3B3abtu
	ekbyOZtQlqbYY2MXcbZN/7+axFHusBY5cxg7Yk34n1gEfgnhEZIbmqFtFLIdfGxQt4QfF37JC6i
	JsDsJLn4/NpmoXFYkrQ4Rm2F2mpeavZpOlk30XCsEKLVOhwsO0dW+4B45kUg==
X-Received: by 2002:a05:620a:414a:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93c43bc93b2mr592149085a.28.1790354477368;
        Fri, 25 Sep 2026 09:41:17 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448ae8ecsm217064385a.9.2026.09.25.09.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:41:17 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API devices
Date: Fri, 25 Sep 2026 12:40:54 -0400
Message-ID: <20260925164054.25831-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 14:56:40 +0100, Bryan O'Donoghue wrote:
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.

Tested on a Dell XPS 13 9345 (X1E80100, OV02C10 on CSIPHY4, two
lanes), with this series, the CSI2 PHY driver v18 and patches 1-4 of
the x1e camera DT v7, on 7.2.6, plus a board DT for the 9345 (to be
posted). CAMSS picks up CSIPHY4 through the PHY API, and the sensor
streams at 30 fps through libcamera's software ISP and into a browser.

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
