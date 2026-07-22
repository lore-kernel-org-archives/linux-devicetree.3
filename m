Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CFC3F328B;
	Wed, 22 Jul 2026 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738316; cv=none; b=UQexf5xjiZmafkj99rRkQGVzRcrOw3pdxFzIhoGI9yeeEK9sj5KWU86ogK5xDZmI5SwPUmWhenGwO33MM4oEMfcAJu2ks5iICCQ6csfgthOUKGaScqXSXJAq8nSUSqaCAJJV/HFlduVDXlRNrRraVUqAVcuduPWY9ZU1LQF+4/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738316; c=relaxed/simple;
	bh=pSCkN6yxVxWDJi8KXbKr8frNrLSVmEZjVt+jtEDa414=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NTmPjuQviVhI6uHR33SSXR0hxjrkABtB/hdeYfJ5l4NQL2jAzOrJqQBIq1ziIhDDT1CHyIo4fhyjMlmR/pPsit/x8+zkt3JaHvDC8QNDdTJthBvkXk5n658kfAU4DAULrcp8lXhJkaFg6CljWQeGIl1Pg1jyMgNoEpzoP2Hw+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnWnltqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnWnltqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2B21F00A3A;
	Wed, 22 Jul 2026 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738314;
	bh=8bZsdyf3RJFwjJ1geQjuOy4xo6q2BaGy0n+TBXIZcmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nnWnltqY0BUeak2nZPn5syYVAs+FnN5kh/2s/Gxstnva7F/oTFfn7V9L2h9j3MqvK
	 7UmlxyYEt84GTBYQu1GVLcoI3ZCFDPySmKR8/RfpJ2sZMQZ8B2cOk/VJplMERbvMuY
	 DyZeRCqWhd7Po0qIVrfLvQg1rnhQG8LfZF7PBM8RVlyaGs/QA2mxdPtjvmFBEmPgE9
	 IWQgJKU5GWa4Mv3KKF2aDzA7Zg1XbNYBoTBo1gpxwx2tSfbMX/4HrqGLD6U0kP8Tlp
	 Mabzyx7W1YoUL6bvlezQVPD+VC++EEl2Hu4UFgXUjZYvD0cc1ZELT8sVxIl5i8vREZ
	 NoqVAdiI7Baog==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
References: <20260710-ipq9650_pcie_phy-v3-0-ef6018818d33@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Add support for the QMP PCIe PHYs in Qualcomm
 IPQ9650
Message-Id: <178473831135.304548.1416914034370187826.b4-ty@kernel.org>
Date: Wed, 22 Jul 2026 22:08:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 10 Jul 2026 23:16:39 +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
> refgen supply is needed to bringup the PHYs. Both single and dual lane
> shares the same HW init sequence. So reuse the tables.
> 
> Document the compatible along with refgen supply and add the phy driver
> support for it.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
      commit: 7218d17e7613d5949cfc6215101493418fa501c0
[2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
      commit: ee6aa0f01d4e8eddf1c7fda49d65c7ef12444e78

Best regards,
-- 
~Vinod


