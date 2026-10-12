Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152648D868
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813139; cv=none; b=VLohWf3XIO0+a4kOv5QPMRbVljquRFgndKGL9KKnDKVCBARG8tM4kSYuwa9bPXMDvV5DE2BY9jl97vNET2vzzMAenU3Ybp48JvsyilmUOXotGQdOnN+Y5BKAaBxmZhYMOSHBersdMyQDhYW2au5NZOgPPd78nxSQW4uSYERJKnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813139; c=relaxed/simple;
	bh=jmnOUUfdHIW4UoVgCq1OlOIoITSusSw0zexra8ko+BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ph0mPwaPxJ0ln/LzyjpJDswLnefn0Ehl3QgO3yrxAxl+RxWhw9xxVqOuhV7gBhmwx9FB4h0wStOy74liv5nzw3asl/Vl8tEbWCc02QscNlrN4zhpnqUVl+3N1y7Os41UfduNyd+bKzLjb9tNAm8T6O6kBlgqmZ392krL1+kze5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=MZM/09ls; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="MZM/09ls"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c14a06c95so1447502f8f.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813136; x=1792417936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm13zV7fU/tYSB8SyrRHgmdMzw/bsTAxkTm7l9ON6TQ=;
        b=MZM/09lsT9mjPUi7/UosPBBGCd4RitSZSVanuT6qsJayyQ2yDP857ltXR+AbQc7GaC
         s+q3LuN/w0VtkAxnAyJnzx6zddWs7Dp2TMdwsIBU5msWOKR0Jiyo2MXF/oB7TUK5VbNk
         5jizdoVZ06Zl4jCWwC9dBXAApGDly8FTNRLplBSWMNkWqAAoUdwQS7xwE2Yo2xWWqPr/
         Sve08sU0RELvh30bYCvqqryDWk4VQbX+W0Sy840Ctjpc1y+DNwnwgnVGMiooT3xw7FTy
         QZ3ShY8dK87RYN+/3hpcedQMCvOmczBXm517gRm/OkSKUnl9l4NpGfIgH+wLwHb7U0h2
         Poiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813136; x=1792417936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fm13zV7fU/tYSB8SyrRHgmdMzw/bsTAxkTm7l9ON6TQ=;
        b=NGqJiwiA2KqA2gIpXJLEJGbmuilvYpdbBoeQwH+BTFH44sZ3OBeTcg588hquCbyWqW
         MG9KPWSbVqyViAVwcDKayN1G7jA9qUtVFQ93WlRgcvvFiocwHP0a2ocGacOQGbvprwZo
         nEVluK/pS1RdAuIUQeJKrZ50AGYu0esOZQR479HpICgG7DgkUyeR73FfEF1gZYljRwAy
         qWnYva2NXnpgClnvFzENESBEsXKKoLX3xldkkFOaNPwdesD/le3TCF6q5OIuMXGStf08
         VIj3/RjsXs3kys2+6PrUmYNEa9Se8G/v12JD/PnIxsmAYn4eUO/pw1BHtPU94IXjJUZv
         Rpvg==
X-Forwarded-Encrypted: i=1; AKwUvBwwCTDgGLEHhEOPrjltUunRm0LG3WqtyhSjnDN2OiHunBnTYm0mNC+U1Y2Iya0LW5VuzwdkFF/SOX/P@vger.kernel.org
X-Gm-Message-State: AFq9FYJro+3BqSSUiODBGAojX0Dx4l07//Hz25MluoPwuMCfDRx74ZIS
	Ek796xGNhGMRXpVJUK2SHHnmuP8B6XS7LwtJOXUakfRaLDxIq2ld/f087IP4SN7Pi9g=
X-Gm-Gg: AYBFou0IQ51KK07/ssBKf9aLZm006XTulIxbeajjaDmOAdUrp2kcB3jVCmZ2o5B/iTZ
	MfYFcu/PLlt7sww53Z41BsMCWTQc+kHs51S/OF7fnJECr7Y6khmNX/VgVuHgYluMV/LQ0VmbAy4
	+84S17+3/Fz8Q95wsXC/bMXxYj4m7JsHJ6OxbVwA1NxbqTRYfC3j3vlEhBrQVPrcRNpGwoZhh5H
	WSBP6xUihkk1XvfOV5TvmwcvNGDiHAg7z5pjhkSIw0HBH5fbtYjaZO/3CDM3WxdFbFGd0W6eqSd
	NCreMK66xZoq3NfB00lsQysQxW9px8Gcv8a0ueHPwrifHImK9DGMxfMO3DJdqOJoYv9+EjTyqra
	vH8JQHH42eE8n2EvZJbvbkj16ZpYJwDZ3REjMwm/wjHXZb+eNZnQy7mz9Llr6iPlYJfIt/RstEV
	Khf2ZP2zCHNozY7XYQlJ8u1zmr5hUQx0UftgUSfDDcYi76HqMnb53xTPd0H1XpVV1esW4nkUaPK
	LEWRlf7w/35pj+sXytup83Ty9yy96YoBX11z95AOWxWUMPNyOTcSNP9QXi2paSo9qjl2WdcZaRt
	zEHsk3yhcbO6xb9lDiIXdw==
X-Received: by 2002:a05:6000:290b:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48dbace156emr16771065f8f.42.1791813136282;
        Mon, 12 Oct 2026 06:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:15 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:52:02 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions
 to camss
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v2-3-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add the three CSI test pattern generator register regions to the
camss node, matching the updated binding. The TPG blocks sit at
0xacf6000, 0xacf7000 and 0xacf8000 and are used to generate test
frames without a sensor attached.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d21c04b1a306..1270ea8e4fdd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3862,7 +3862,10 @@ camss: isp@acb7000 {
 			      <0x0 0x0ac71000 0x0 0xf000>,
 			      <0x0 0x0ac80000 0x0 0xf000>,
 			      <0x0 0x0accb000 0x0 0x1800>,
-			      <0x0 0x0accf000 0x0 0x1800>;
+			      <0x0 0x0accf000 0x0 0x1800>,
+			      <0x0 0x0acf6000 0x0 0x400>,
+			      <0x0 0x0acf7000 0x0 0x400>,
+			      <0x0 0x0acf8000 0x0 0x400>;
 			reg-names = "csid0",
 				    "csid1",
 				    "csid2",
@@ -3881,7 +3884,10 @@ camss: isp@acb7000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

