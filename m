Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B819344239B;
	Fri,  7 Aug 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106056; cv=none; b=FBjAYshqM5RJjp/aAIyGoI9xUAo8o/BRCjWlqIokJVU3RDffYiRTEf87l3N/iMCBtuhntrM3dpKk4ws927/8aZlMlc63QBF6j/VpJG9I5556NRVV4Aljv3TfUDJOaYyR8uuMqAzliWbdy7qyD95P0yW+8dREzNJMtyPikzTYJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106056; c=relaxed/simple;
	bh=mlWW4yxWDVGswVzaq7u3PIXZJGRULAc7JrhLiD3LNoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mRR+nHZb3/bYSdjMd4naDivOVPA+ZQwoZRa+Oh6MlOZwBroIGnZRUfR6jgrLx9Oq8qk4K4ddV0BVAHIIP0qizeqaW5WCZNS6EO2yDdz2bBWzz1dYq3kJCQOkk736S+4oyXxoed0bs8+/1sVx5xw1eoUCkyPcHgnsctApUKVCiWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l04coC6z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l04coC6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A18B1F01558;
	Fri,  7 Aug 2026 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786106042;
	bh=CWUeE7zbWeo/eTSF+wA67IMWhRrqgAw1fJQs/s5GWyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l04coC6zp1E7HZzaRmx1VneHw6rDPa//nvL9FyFq+m29vsgFB04sAkuqMD/pm7jwf
	 bHOLZsRL68nnKa/Ayw0JZVYmAVmL+hp3rMyGLSc4tX/6VOFU72Mrf8AsxWoT1s5PCK
	 7IlztcXcf+rjnT8gTm92ouySFC7ExXL1XXKcPbJ9qrghogOPsun+/sOlOv0cr4U3pe
	 OlMafxlJUAxmSHnUaUtMuzE6RHwu6rhQMmzprqFw775pbg56eh/bSkkVGGjPD2BJg1
	 S03il/LDkWhkY23BvzmCWBY8wElLj4kgbeJSJTag1W0G54FKGnzwk9t2nVoaZcbu85
	 ehd1TSqF+otmg==
From: Vinod Koul <vkoul@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
 Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, 
 Umang Chheda <umang.chheda@oss.qualcomm.com>, 
 Yijie Yang <quic_yijiyang@quicinc.com>, 
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] Fix regulator voting for the Qualcomm
 SGMII SerDes PHY
Message-Id: <178610603469.740291.829141301645845928.b4-ty@kernel.org>
Date: Fri, 07 Aug 2026 18:03:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 04 Aug 2026 00:57:56 +0530, Mohd Ayaan Anwar wrote:
> This is a long overdue v2 of the original patch series which tried to
> address a SerDes power-up failure observed on the QCS8300 Ride board
> using the phy-qcom-sgmii-eth driver. After going through a rabbit hole
> of hardware schematics and power data, I now have a fuller picture of
> this IP.
> 
> The Qualcomm SGMII SerDes PHY (used in Lemans and Monaco SoCs) is
> powered by two voltage rails. The schematics call them vdda-0p9 and
> vdda-1p2, so that's what we follow in the series. Additionally, the
> 0.9V regulator draws a peak current of 46 mA and the 1.2V regulator
> draws a peak current of 15 mA.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add named voltage rails and deprecate phy-supply
      commit: 3719850f1b70dd3f01173be830cb0a1d2bc03a4e
[2/6] phy: qcom: sgmii-eth: vote for both voltage rails with correct current loads
      commit: 4f81684a1d1018d7d0e5579f08d95e7701279358

Best regards,
-- 
~Vinod


