Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD73E7BD5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991579; cv=none; b=KvWRAeQ7e/aHfayvXoKUmhDdRzwqKxV8FIvFm5Qz576O6h03LFsiXZ6RFdfXZ0qNOaF8yRAI7zmnteI6CJmHJ0kAVgS+NQ1mngqYWz7Fd1GF8PXix5HlgTpYNmWHZQgRsVklkrRFAntnKJkH2mgbLEjpFBMsrfIu0KnLSa8hMQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991579; c=relaxed/simple;
	bh=xnnBezdyOqutoPIKE2OEoP82HYmh3FTHwn7Z7cZXCPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jq+5VKd8KjKDmIDOLE6U8rhO/+oNpN2NvAJsu3B3LznCNpnxSzQZW9asYI2Ew5c3GUAlSNBM7AH11C/8ZSvTtpfGOdtS7/MUR1r7D8UoMaa40xs1mnh29qGhfzuH9x7mwl7x7QhKOxulpgTAyxxaIDsLHNXBhuCTkMXJ7iLFPO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UCJ+krti; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UCJ+krti"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 407B0C4FED5;
	Tue,  9 Jun 2026 07:52:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA5515FFC1;
	Tue,  9 Jun 2026 07:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9829B106A2AC4;
	Tue,  9 Jun 2026 09:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780991575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xnnBezdyOqutoPIKE2OEoP82HYmh3FTHwn7Z7cZXCPo=;
	b=UCJ+krtitxcJH1aTgMdIj1xuQf1V5COpvq61rhz+lLKjr8ySVV9rsP5QRcGbVq+PAvAoK3
	RuuOz1V+kQXCGU1aELysXAzDtlF/WB2dHC71W60rB7QAXajAd8HWmtkhUxa5FXbvsQaBnQ
	ppwRD+ZV201v1seE0HuTvAkKwXb3b3H+KDBGvAEhqw5fgg2KUZvE9dfHopbxFZjk1OPqZB
	6mTRDvePmYjfZRuRfBfLJQn4/HMD/wHQ3TsbGxt3NVqcDwkmh2HOe9/FiUo3pP4ZdSsJBA
	OU/hjE6TsV2EEJ2nm9/1wdy32hY3/Q8ldyQ6giw4wPmkZLNzC13klf5yrYFZzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Manivannan Sadhasivam
 <mani@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <20260609-quirky-rat-of-criticism-aea1fe@quoll> (Krzysztof
	Kozlowski's message of "Tue, 9 Jun 2026 09:19:52 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Jun 2026 09:52:51 +0200
Message-ID: <87mrx4b164.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

>> On MDM9607, there is only a single controllable clock for the NAND
>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) wor=
ks
>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>> clock ("aon") that is required by the dt-bindings. This is not really
>> useful, so avoid doing that for new platforms by excluding the second "a=
on"
>> clock entry in the dt-bindings.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

What is the problem in giving twice the same clock? If this is what is
done in the hardware routing, I do not see the reason for more
complexity in the binding?

Thanks,
Miqu=C3=A8l
