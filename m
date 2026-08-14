Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39037440A2B;
	Fri, 14 Aug 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702441; cv=none; b=rAlzMAJDMVknHg+uxVAuuPEFvXiAEASOG4wD0ViNlxBSBLgNKFslHGJme34jv5ULn5d2UJBCQPYdzpRQtMqt86t9QcvoSsOD/jaWxDXXLDReHn1noQehTVRq22m52MejNen2TtakJNMBIZZi47HEE5gs0HeVt03VKonihFwV0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702441; c=relaxed/simple;
	bh=OK6DBepB1UForpcDbtnmO95uGkSGgAWA2gsp78tSMpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNq96TaBDRmMFJmNhKulo3TG2qs8YNhHg8IKR5H97Lej3Doi6jcZAm4oyTcZrezrxOsH5CW8OViujut9qD+mWv8Wm9qDeyLL9mSMmPFWRdvH46POu43fWLzktXf4dGiJJmm3jcr95SfN16lNXpU4cQ0DF96yQ61oGe3Jmux91ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfb7ASZv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfb7ASZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1B41F000E9;
	Fri, 14 Aug 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786702431;
	bh=7V+R0TlrgNv6I4jHzxijY+UT4S3tefqsnq6wb+tfRUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kfb7ASZvlj7ImBihNTNUd8cFjoE+wTPBBA4WRPRRnmyqPXT2/JBcTM6wrSbHUKefM
	 nb50w3sWQE9SachfeygYuhCN+xcGQPXIyK6KC6jbc9CygMhkkLkUg99ofb4SVOFyAm
	 Q+G9lEFEleApoph2Tjfh/2YWlyNeJAVSlGL1HR6stnn6SdwFC8GLZPzNHH0rfQA1XC
	 R7tCSq8o4OfO2YIKztTUb3Ak+tcHqcoHyBaxALp73N18+si+34xopfbtRWCUUk6g62
	 baDTP9ggVh3Qz+uvSI3x33RSmq+D3XZQpd1Zx0809VwUuKG2dTq5SvGzVUynpRcI9Q
	 UV+02rT2XZgBA==
Date: Fri, 14 Aug 2026 12:13:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen and refgen supply properties
Message-ID: <20260814-quaint-memorable-goshawk-e6aaf1@quoll>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
 <20260810112735.1326807-2-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810112735.1326807-2-ziyue.zhang@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 07:27:32PM +0800, Ziyue Zhang wrote:
> QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
> LDO supplies for QREF to provide a stable reference clock. Without these
> supplies, the PCIe PHYs cannot work properly. Mark them as required for
> the affected compatibles even though it breaks ABI.
> 
> vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
> compatibles. refgen-supply is required for QCS8300 only, as a workaround
> for a hardware issue where QREF actually depends on refgen3 rather than
> refgen2 as documented, so the PHY driver votes for refgen3 directly via
> this supply.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

