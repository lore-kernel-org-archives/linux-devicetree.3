Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607848E0EE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810211; cv=none; b=ukW0dErTx06OKILeAYwRBGHYFxcmMGS1JQQRblQXkpACe4wfc/wj82qea7zGxVCZ1gyx26xLr341v2NxR4c+j2Pw29VJNbtwu+fG429JuegLzISIkQqh+rsrznz9z6pgVTvHZ5rVA3K/xI5lBudJ+l+EBo3zXQ4fX/Vt9x7ofT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810211; c=relaxed/simple;
	bh=zkC632+RCs8j2vy5IgxwE37PTmSh0rh7tfcdd7o+YNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJbhPc0rU6XBbxOynQp4UnZ2QFRfV3Zf62o2bBl/XgPWDH9K7zSxpcgNuu49HByggccCPo/itToWfyQ7kzFC+z2xTj8eyRozvDlATYHXPzKB9Jq2Pi2rx7OEpIOsBP7U+rnpjeMdBH5q6D+IE8s19+klG1Kb3c6KnQR3Uvuiqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Pd8C7xtS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Pd8C7xtS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b042c0759so1376614f8f.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810207; x=1792415007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJqiAzF2WxkI4SgNTbtZ91E6hshmIIcV6+9m6nd3PZo=;
        b=Pd8C7xtSBv34TuWtGz7NX9AAt7dzjaREJI+07Aj90Qy7n9N+s7gic40+BULQSeyh7K
         +V1sr4dOpah+zWN7H3z+3Tk77cHHmyGRQGQSuFHvHIfWU3GYO909ESaMeUIqopivxP+p
         fIL4gSTpeHMmOjEQBq/6dY7NqMwLA3vl2N75y7VN7TJmRb5m0DZw50yqHwT9HONSHGVx
         Ht4QVR5R2MDmj2rhgIOFsalRTufGFl52p8pSueVIETj5XeFRs9eRuCbSfGexAaOYKiOd
         sAhj0OTrs6baFzF+PHx77p2N+jNxXPIWhR1HXnQLrnh6yQQ0uo575YjENLvQfIV+ajqv
         02WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810207; x=1792415007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJqiAzF2WxkI4SgNTbtZ91E6hshmIIcV6+9m6nd3PZo=;
        b=l7aF54Y5eBQejpDRb9yF7LUz3HP6PuexCQ71uh0Y1PccwfZrKZoEWOxCUnETvbJLco
         smiyNnx/ob1xkARxecBgHCEij5WPW6oxbQ70VCe1qb9qLrOMId9rkukPubgmOGTDrAPS
         ojj87fMJLepRnids78MuqyfRmdJdf8ENod1Ks9DsGMfz+p5J6NaYgxg1/4TTgSZbaQzH
         12efOwl8eU3Lrt2eIAJ/Xbt3VNTMAAz//PQPXXPda7gmcs0NSVhP1NNXOP5BL2mMF6qf
         1cxJOQmG5F/SruvuW3TU7pRzZxFXy0cdh1akEzBc5hjouU5tp3CILq/OQMTJwCxjH+6r
         16jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWol5Ed+zSGy96fsa/Sy/aECMiR+kh27JjRB56pLjjYwZULuAGIwyToX97sSV/Uy1LaPWtq6E6zG5A@vger.kernel.org
X-Gm-Message-State: AFq9FYKLmu7P6lVTwF3fJ6T1YZ1WIovrVKQXOugQQMvBKo5MMMTzc/4y
	1+RbOxQpGkPw8SsGpAhlGt9NqFFuHqXuvGd+XlWLsKNvb92IbW++UVgyjN5QEdDKGME=
X-Gm-Gg: AYBFou0MUf+ulzfdVVXA3UVyBSjhyWrRvA+wUqpoQ2gA9h/Rx6wVhvMqosWPrKOrcd8
	N7A11FKcUTmA/hUAVpTk3HxEVM2nJwYVo7V6Ju3dydvR3MNmmSvvOhIC2Yv5C2vG938r7tGIGDS
	3g4dWIF512qefkhtirizwHq342IedHHhtfUG1TkvUw2bGNsAEa1j5qXFOocB/Ff1u6nAJglfvrm
	XkGsSvuCR5gUxjtI9CEmyFiDtQyvVwO8pNP0GFKe611W+8wHas8kJnRvyVw1L1LFWYhKOrU+AAy
	ITjhvUXls6ImdAxTRdw4rv8PqxMkPeAppaZA0lMs9GHdZEjyunBDm0afxcEF4Eybxn6VApkJixt
	tiOG7Ful/G1fO/FvvSXbdvhaqW+t33Bh9MdLgNx2Js2+WQkrdmxItNsRLW5pg0PO032MPMZLl0g
	97+bCwMhGMJ+AR9Tqb7Y5etc3yQ8/6HV4zZRTA3Ru72CvUia1agNB2t0MkmRFXlumGd6/typlwD
	NR62oEczC/syK5MGFxtCd+RD341121E80yHxtTJdLp6OgUnB6x/P9miCgSXUBiO4P4l504Xr0gm
	U2fZe69A/RQ/PUP02a8fIyO754aUYvNm
X-Received: by 2002:a05:6000:2002:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48dbaaea8c0mr15810644f8f.23.1791810206335;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:25 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:05 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions to
 camss
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-3-620ab6f151dd@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
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

