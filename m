Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E2365A13;
	Fri, 31 Jul 2026 03:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468291; cv=none; b=fDqAJAWILWArHfoPpe3AT7+Bgkv8E+6mZfkmyNFXsBLXBWitUPWYqqhZQnQgAZQVxPbt8EQZrLF2qs3dKvRa6TqRPMtJdChbDJKrv49vIT6rkye/lleKWdFZA2bzQWnILrce0HTm9W4N7NMDOe/j0zZm6rLMzyhCkQIybuP79X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468291; c=relaxed/simple;
	bh=ekGkAg/BkUDpQB8xzU4kDFthEGBtzAVXdGqjJGCjD4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1K5pf8e2Gbto5/CI0F7iPO3uw9tKgm5f2h/vDKeWnrTfa8OPPEmTYByEeQ7IspZ6cDiWqxhqDh04KAmZN1i/Np4GuiWqY5Pc2ZyUDSEGIF6Z8SI2ddK2xKdRRk0syxKiGOQcYMUE7JTBnxY/pc99EYy66NSDjsdkcoEYXuxS9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKdSKeel; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKdSKeel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7736A1F00A3A;
	Fri, 31 Jul 2026 03:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468290;
	bh=l2mfM84xBJNiYCP4q+LBxjUCrdVqSCF//GqircTMtss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AKdSKeeliLp++CADUxBwmNc3feom5YD04b3XGjnIDkUOtTGaKAUKkf8DMTfe5+yQg
	 QBKjkH7OtfSS0laNtoBptfCD1VA9OTn5LQViyFMTmkD3pj7YPQpkBxvT8OUGA9KZLn
	 eOmy7wpihWemuU5v/6hk878aFdM/7z/TsSvz5Rhp+yAtFeBw6Byuo4bf/bzY1sHEl8
	 c9AC+Q5T7sl1cQ4egAe5TQKRBrLH5+OPZ3xoUKqJocE2hFl5eYQOcvZFa+wFpz4227
	 sgmZVZUAU/JxEMSw/8u+JG8J90QD/0jt8w+j/xo4XahWNz3yCQ1JwQ6j6AQbDGpsFG
	 XeyV0WIJLrgXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb controller nodes
Date: Thu, 30 Jul 2026 22:24:23 -0500
Message-ID: <178546826827.316815.6622906219692115085.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
References: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 13:47:04 +0530, Krishna Kurapati wrote:
> The following errors pop up when DTBS check is done for qcs404 based
> platforms:
> 
> arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
> dwc3): interrupt-names:1: 'qusb2_phy' was expected
> from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb controller nodes
      commit: 9812d0a3077489f67afaca84dcc7e01a440ee106

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
