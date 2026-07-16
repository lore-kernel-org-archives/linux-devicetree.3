Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01932442FDE;
	Thu, 16 Jul 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223237; cv=none; b=biX2VzPegJI0IBEKqvaZGhAx7AZgquhbKXMhNDhwLcs4bRwI/lsLa/3O0SRxgm9MS6pm3MpylUlSS7YULMQeE+EwRFUefwl44XnBXP+wctRVTuoPwn3AmRZF8B9//ykzPFdb5AWD16ATf982jH4AMzs6omqhXykRxC5widABLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223237; c=relaxed/simple;
	bh=q2lLkxNaadrgXTsv8cEEY723l15J0hmf8UnRHnzBKSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqZ5fvRFv/LXkhdFUh++riJX6hhPx1Y5a9LqxiPjhHeDIjYFt+mAVTQ5dMlvDljvq5hdGgA8ugVikuO/HXzl3H5QXgXSwCe7OUkq3NKwcsnk+ugTeb6/K4Ut4DVgLXo6FZR/ymfhLl0GiPtdEJWifPbR5M3jvTYozQWGihLXd+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHhikT5y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHhikT5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327A21F00A3D;
	Thu, 16 Jul 2026 17:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223235;
	bh=1Ceq8mFJ/Vm5ez9i9TjFa0c2lAx5jjZdX4+jrUDU9Vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BHhikT5ypZ72X/FL3kXDNv0UT9uIS7xkT9qnvKquh4z2ARz7PSKGUVZO4qpgRFe4m
	 ptL/YfzKrDd1RhAaJFC8/Tld+egPfunwfi7hJRfLjvYGDWLE7Z2ns+2jHI+iiDJHm9
	 Wvyajsf9zE+7TOI1HDbi/+oCNeHciy5X+tFaZokz930hkWvfe0r5QQ3r/HI8DV5Rbr
	 zxn7i9qm5aOKXItUBWvL7GDLAN+xJffeVeo23bWP4H4l+gnrc7vI9mzYLTaQ6pLYuQ
	 1zrLEEcIjvvrLWxNCRihIwdSHEL0cN1A67fSMiOQM0YBYiSEKvLOkIcfgI+9j03Lf8
	 ytZ0sfsZFRp5A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 16 Jul 2026 19:33:42 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: smb2370: Disable SMB2370_2 by
 default
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-topic-smb2370_port2-v1-1-83d02b2ba4b0@oss.qualcomm.com>
References: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
In-Reply-To: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784223229; l=815;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aYmIoaIAFX1Z+JiTV83VrqjeioU8i3Dqis0+WcJiBlc=;
 b=ZeZIZgKz8Zmur/DyiXxXHaWN/1h85igZeyH9L3GfgO868/KsSm6XsGziCuWj2Mpnr7XgJ58b2
 6C+2UCn1rBLBJgr1s8G2ZyabAyBO9RbN4txfVkMveM0zeF6nFSFSf51
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It's absent on laptops that only have 2 type-C ports (the majority so
far, including the CRD). Keep it disabled by default, following
established practice from the previous generation.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 80f3fdae5705..1e02578e4ee3 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -36,6 +36,8 @@ smb2370_l_e2: pmic@b {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		smb2370_l_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.55.0

