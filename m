Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6791FA859;
	Thu,  2 Jul 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011785; cv=none; b=UsUiFxws5yAZsJeEaXVmfvPDhVoH0mrLvCLMMb0WcQ3o18Eno9ZMDL3pus1vJbHZCGE/o0U6svLrS2tVZCsk1v6olm3rfJmfKACZ3NqowYZWMCNXFo1z4vxUqaDBg4fhLGmKa/dAyjGESHG/H7YeD/vJ6ZQjTUiAyTxY5xeBBOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011785; c=relaxed/simple;
	bh=0fRUAxIql9zJX0CTkn57utoSsaY5R675bkJwbK4FEaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k4wxa5vuRNzZZ5OrKBfpXAKBY79Tu66JP3SG00U4pQscdWA+nxssTcwOJDEeGkLECYxUXs8FIuflDOHfm80I9SwmPbm+cdgl6LYWyUVAuQmQprM+2oBnpafR66wPY9h0OoGCtFFxgOsdJFkuKTkq0G7xtV7MzO/VdsWX1HRUA2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgTWl5Lq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgTWl5Lq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559631F000E9;
	Thu,  2 Jul 2026 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783011784;
	bh=EWlmN7C0EdV9vLSXkkywb4aSBBVQ/UqBNA3ZsS8+NQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MgTWl5LqT+S7cugSoiTDDf5C4djgxaA/IqsZjTCMmEafFz4d9/hFGFj/81TRKf6/K
	 Lz+vQ7QUUrvFWcvMxDrCH/x294pkpAXi8vzaKhv1vxDPYIKuINTdHvxTghOdYhr9a2
	 RMV/DRL/J4KrN1/+AIjmPy4YXxp9Rk+nEkDbPPBhzeQzpiSiFDINWLs/j2Joo2y67O
	 yynKeoPLZkKRLjO4MwczJ0MUOPj9etOR2K2m1sux4vO+PcWJrmbORNG0E5/HkeKXbI
	 A06su1RQ0nMQdaIeCLMrUCS1+oSYxxieXBQgi7ev503m5RKSWE4V8FaBswtbytF+WR
	 IIAueyW5K9+SA==
From: Vinod Koul <vkoul@kernel.org>
To: andersson@kernel.org, konradybcio@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com, 
 quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 0/3] Enable ADSP and CDSP for Glymur SoC
Message-Id: <178301177996.772155.14771946366579248445.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 22:32:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 01 Jul 2026 17:31:12 +0100, Srinivas Kandagatla wrote:
> Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
> that the firmware streams of the remote processors are managed in kernel
> and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
> Qualcomm SoCs now support running Linux Host at EL2 [1], this series
> documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
> fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
> hence the iommus properties are left optional.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: soundwire: qcom: Increase max data ports to 17
      commit: b496bb56b418788aa8625950e94206abe7282e18

Best regards,
-- 
~Vinod


