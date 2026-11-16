Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864435;
	b=eQ/5nxOHBsUIkz01vEzVn7DwioX6NOOWjo4LKANdL1xwqqBfMPMootK/tF5KnE+rEm8b
	 rPlIOt914Aj3RykYO1Ga61I8zIXfjvl+DkbmVWnnnQ0hlpnXVfWNnTmAaFUh8vBYYRe+O
	 UjjOUjxaiKfNCJh7ZTB0bi8ZLOd4QVUl0gC/oLejc6I9WRl166xM0/h6gBZ+HUMTJIRa6
	 7+nLFeQ8VXSO8NOY3UJuKVtmgkpkFvx13hyZ8BwT0/NoLYdQWBE9duwrDxuKphpdOBQ0e
	 +Wdfqic6bmCvwxaJKlKQkhWgy7I39UBz9LO5dVVKtioBMzcPzxLe9aUX0ohR3FMHirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=t0wNdNhz0VmuCs07wJX/PvBnfPPBaRpZ+Q//GdX59vmM3KmAZhFHuRE22FVLcb7QDwlU
	 /qHKkH0pvQpJFf6Fellnw4DSMqYA2/87NaEm5A3e7E0ikajzM9BTzl61p3dyur0bnKRT2
	 i4pcWl0C9I/D6a+9jVvMtHbSce3RSiCKBxrrmB4RrQHFdlLErK6bfsy+a/o4TI93nIHIY
	 Nx8slxAzPL6M6s2gjH8pib8glN3ZJ/40PACHtV4SDdG/6/bCU912ubs8KR3BGrDp6wD4u
	 geg0X+fZKwK9mR5LPClHtZ9nFJwbtTdq0kbLPL/sglQcB+IBgBXmMS7pGCh48femunA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21901606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21901606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1997450f8f.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864433; x=1795469233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=P16DvILvAkJjX6pET/OY1y6yCbL6KHNvFmQ8Vc5ms2Nh4pBtOsH5swOYSMdfoItM4b
         t5MUV5RS8EsfFWLaJSSS5E70h3/UCARtpvqtPXICi2MnbVDPa95XtCUmcFtAYjMi3iD9
         sCZvL8DZRUZv/G7eI4SHBKPuYPPoNAExEKI30EQbOIauyxIQR0kIV/+D532rj4kB4ZjR
         LbaVAAYCUUzAIoRJt6nlQejAo2Qj82puHxbZwDW1Fa8tRWYcjQNNMrBV4t0c64r9Bq5k
         XxoBse3bOdVc5KRCAVJVYP/0nrxUtbAZayRyyja7hKGad0rPdK7UrkQNvPW9f3BimHA9
         xUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864433; x=1795469233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=oe0xERv/zvSsCPyqXB9D0RJSWPDo0SwiRNwp4ZZQ+jvBCSGzbCY22rZlUqlUyr4xZw
         pFPk0C4BKNIAcDm3f+NaPQP+iAqwnESXBfYmBB316x5/pAAnn4t+1/mnzYVlVlhpxp+S
         GDxc5yM0eHiOJwp05n0/rPLqrsLB6fc8NIIJ0Hab/+QTE/TFAk/+L6n7d9uCX3Fj+n2v
         TmaS0Thr+Xd234SmOtXBzurFbc1Gh0KCJklzn+NXITVTl3kLrkLgpw2Pq3c9tQMXMWs+
         bdgxvSbwCEaeos8q3suJRAOqY71YyzLqUkGmuh/l8Qql6jJErv3q/pyuCDCgQV0La2Nl
         75mw==
X-Forwarded-Encrypted: i=1; AL+hErHQQkW+Rq4uJcUOSD7OTermBHY0+0hRVmJUJ46f9fpS4DgKz8mHf16sVVqT9Zk3XyCQFUDO7wvZ+AvQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+whqpkhW6RzNDG8nZNIlzFKNzL6p2ZubENmJ9ULa4faUysYtvW
	65685cL7JiSHfEKjNPxL2rUw6X783hrvmvZ4bt1v+JExpDDxgaSRJ6tn
X-Gm-Gg: AZFdTZd7qF0Gu3jV6oUtMAnZJUJEF0ZoH2angEnIvKozlHzZpq6ninrFQhKZVrkmAI+
	Fn2bJr7PMbqOKMlgkz60HEAyrogzacW5NgupmPuMCJZph8RTt36SszKEXxSHrZOPmUsuQi1T83+
	w/onuEPIUjg/n46OkbZqrxF69a82GG2tWL4U5Ibvcjho4QfoD1HPjcb01WNoEvtR4KBnrmWlc+h
	45Pj9SrXahnXounrRBLVHFA7DizsVPlRUrRl3vqovn0Kt4Qr0WfEroMfOZNBGKQKuTByDER38SD
	Opxd3idPSZ6alVkwL+VsFHmNu2Mfc+cqaFA8gOvaNOriANCyx/Gcc+CJrweOf04GoNoxEfKTUCj
	7ASZsgmZ1X+fllKMF4sS21vyBzcC+UVV2uPCbV281sXJVZ0NKdUXEcf5E32dqVN/XSoRMhutfun
	aAmAaPmbkZlhkX5oUyamNv7lPQ/Y8aD9HfvKNlgYDmNyh9SH0xqRRKCpgzjvdIKpYLQJ5+voQJb
	kB/I3Q2ybw17eRcQ1ltCXBsk2T1N3XCgHal54UnjuSaHv8eg2oSJV7GEpEdE6sMSuJg/mRQC9Fg
	3vzG0YJw/CHk4ASVD/jC7Yhnw2d/2ETksLQq4thk
X-Received: by 2002:a05:6000:610:b0:495:5c83:51b9 with SMTP id ffacd0b85a97d-49c7467a893mr27328310f8f.50.1794864433590;
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:22 +0000
Subject: [PATCH v2 06/16] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=XlBnHuuXKSsmwBoy79zd7CM/aQS0V4vz73O5I/ykrhOgY3nFJG4rnY0qnm4zfFTA5sK35VFT6
 GeLVT3WztE2DdDA/hh0iSPFr/rHt5tVJ5B9S1do1YbNU2FqHh/CJpdT
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

