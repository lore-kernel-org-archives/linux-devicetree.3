Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EDD35E1A9;
	Fri, 31 Jul 2026 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468285; cv=none; b=sTapxwBK+cgOzXoWkvrclxxqhb5PaYgQb0VWWq6L6dhe+QVmO4ym1zgJPgNAKryzTHbnNOPBckB6vUgB4veRpQDA0fkjJ+Xs9TNVcTuyXfcfqWZ8W20js3r02GSRsLzdSQTMQMbnWRAhMDLeUnyZ1EjX9vu8xRYEWf4ll+gVk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468285; c=relaxed/simple;
	bh=n4+ejgtWmTE7T0Osuusx8Pew2wFYFuQJIzuW4ET4S3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9W1+L2owBq8LgOSK/ZS3fMBDyLU2EwYaAEGrI1OCx2NDctGAlkeP03//wlPZe3K1x9EmuwmB/7rREf2ymvvcW+eyKIDvTl5pSLmVniUo8siNTC5kehrrmROJeLX7xDNFAH8Lro4pJmrPKJGUyQG2083fguqN0vlnv9hb6659RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l29aiB0b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l29aiB0b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3C01F00A3A;
	Fri, 31 Jul 2026 03:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468284;
	bh=B8s1M/XHrA+43uUdnvpH7/wXx6A+1OnAOejuILC2DzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l29aiB0bdKm/nwrJ8fpI5A5eldoRVvixm7WGq3+RVt7GeNONtcvqOn9xdbSSLV3Ha
	 vIMNIhH5LP6nK4vrFBtheTrs8qiMFmuktxNIqU4dD9z1/Typ33oBD7n0IfgavURv+x
	 s8F+rZ/8OYCy1T3i6D92CnxdbxicKizWfCg2rsIJpAtHhaNZf6NYlTnrFM2Sum13Td
	 RFFwwUfGGvGuxs72CwBIykdihKenqvqD6doJTuXbEZCWSjlww57/tOVdWyZ6x9D/6x
	 rHEVNNu1w0S/KECtKs+g6qMtanf1gNDoJh8A2h9quYyyOEpBgGVv6lvRsFWRtT4vKU
	 ZGf3qUe5w1g/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] SC8280XP CRD touch-ups
Date: Thu, 30 Jul 2026 22:24:17 -0500
Message-ID: <178546826817.316815.13266173682371465082.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Jul 2026 17:43:14 +0200, Konrad Dybcio wrote:
> Add the missing orientation-gpio for Type-C orientation information and
> fix the pin index for the MISC_3P3 regulator.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sc8280xp-crd: Add pmic-glink orientation GPIOs
      commit: 91721a3f37ab4caf8441f0205497bcd478315433
[2/2] arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg_en
      commit: 0e05c183f3b97427f00d619132ba5984494f6886

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
