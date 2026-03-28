Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26395330328
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713001; cv=none; b=EHAl1cBJ1TcScLUqbIqQzFWsj211tNn8YBdzmILza4xuonyjIcOXdrQJ3WXVOPOPf32Ue5DBDl3bDq/KS+6N4f1k+h7sEN/gQtIpv7qKChq2SNorMi8EE9zHmbE3/l+9kGCN6vUuLYtBs2UfX/35ZMWvjLKygrS795f7J3pikcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713001; c=relaxed/simple;
	bh=lvkzcPcPyFPksR85iGLEu0GHtiBu7ef8gQ8qUgbv0ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6q1efVqg9SBTRcR7Vrmbsu0eshuVnKeIDxSF/X5C8o6tueCj1/mAtRko89vYJ8dkFDNF83hqUcSTxVaCpyvwmmZmhO38wFwCItqBuhR0LM9xzJCis/WhBhfyEMSANHZLUkSmc4KcVEHyh88cN44JDp4uvQw6ascryDWxM/rPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kt9ISZAa; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kt9ISZAa"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AC8C03F60D
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774712991;
	bh=hLqntp6OjT7ERULXFrcNcfAMd+VS89GFOXotZG3lx+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=kt9ISZAaVEoatBwKqV3g8e22PyoDX54l00Z/TLFQCAUs3DANujSKMRAwzlNodpLEv
	 N8v/OIi9wk0mSr5DzBz3tO9pfeGke0h4Y/F71eDRp02DooP5hUgZXRPRb7VBGA/H/U
	 zk7fyEof43rzkZnITQQx9Lmo4rmjqVXMQM4blFsHdZcsA5LXwgiiY/K2D1/tJf0fP9
	 LZH1OcczXlo1Wvzhm9jNWn2yjw49BX5x1/xUkXK6/AJMjh5MHwbLaCK4cYPZkB0g+y
	 EdebLHbOgUzA2areHvz4xyOr/xpInVmGCMEZ+V0NJaxf+poYorXDe4Lmo/AcdvHfj4
	 KtXsQ8zjePt1sNBUc331XnZ7x/6TRE++c1brcYOKHpo8LGPMqHTkWnYPjOeOoJCrg8
	 rWWvO3EVYktbS5z1f3H8HKkRgZY9LBMuDbjSPElFm758X367KHsbe9q9boyQDxzgoR
	 KpIHDmujPygQeMSk5egP5HjrBafc6sbt/p2G5kRFHMsblDE9XIzTG7FpBf+9UDmSCI
	 jHg6zXIlE1FPgCQQ555H2jyUREQXzT++XcsPcgSPG56VQiNG5kA47IBf+NuaEQxJPg
	 JYWvC3xChn4VNIAK0LTCZ3OEIuYR9yCKb3BIsUZEGCzPA9mbo0VzzlQHN6XoR+UTDn
	 0whJCSPsE1DgTl/L/0UbhzUo=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so34679855e9.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712991; x=1775317791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hLqntp6OjT7ERULXFrcNcfAMd+VS89GFOXotZG3lx+U=;
        b=cmsWfGrRVnTBSrPJa9o7mzBXP6gfvqmfwKpwM0FSyNheFmbApddQRHtX2RuNkeJfT2
         koxAKBOSt+zOFMTkfwwdDE1uYGVHa03M2bB2ab5pFyT4vOv+GyUElrTjaydK/Kwbxa8q
         c+l2xuQGZfeA26S7c2XmTFJU5c1H8TfxVmvvLLU995h5rTfgppxzP5FF5wGk8Xo+9IgD
         OUdEkVVdUkqKUpvRkB4MG4Np2tknDDPKoKPjzcrxO4Zl+1Rp3H8PubRIcpXSgm/5MTGP
         mbcUpgaVN/C+/Y2JTQ+r/4yXpRJudoc60qkb2hK8w8kFG+n119F5neW7AwjpvPJwUiQc
         wlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQUa964IJGej7Dy8ZvqPXOZLt+UVs4M5oRFaXB6QltjPbN5F2geG1FXqdE4+YCSorPkQRhBahyUiFc@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqJOBnow+ndVODkeAdKVH7OXrc8JYHQrsv2+UagkxxzkyDA8R
	+6L8ryF0KlCQAXl4aiT1M3XjSRpp3fb1kJzwKXhcj/WvlJ5kaCdZR0cUUBl4tO8p4BQRbvp1urJ
	tlhPQkR+GZcm9499t7J01UFdRH6cfWJFpnediVAiPzX/VAmfrpvoK8zoK4GdsVejv/DZbyed2d8
	pGZnc=
X-Gm-Gg: ATEYQzwpYlIMjlwQbfqpWKzk1KpXIH4wym19R/xoAFP7mDQVvt3qVLmrkfRWXZpBw/q
	NDQxYwThil1qSqjTfxrdlyfwtXRBp37eg0t9mVGgq3z6ze6xNOhOy+xXoYM6cJukE9N738TtvnB
	fSjvnjvwEcS775ru3DvjbYZtKX/KTg2U0QJDd/a9IhyCWPfCqJ4OZEAEMx2QeOsYk1n3DXcnEcX
	a8EcXmSws+h7JUU2UkRz44NZdX3vI/mxD348N29xmCtbgjEIvMgive2jErLBKhU6n1m/bLOdi1I
	7lhlbES2JxaJdTzBOSPnvQrjkDOEjE4fMDmWdbJ/WX75M2qFSIAJ2clOKZEt9QnE+yhNN6TXH55
	e+I9tg3wOTI4h37OsQbkpVfdY/iqwea1w9Qc=
X-Received: by 2002:a05:600c:4744:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-48727d5a313mr107212025e9.6.1774712991146;
        Sat, 28 Mar 2026 08:49:51 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-48727d5a313mr107211685e9.6.1774712990734;
        Sat, 28 Mar 2026 08:49:50 -0700 (PDT)
Received: from [127.0.0.1] ([2001:a61:35ad:2701:1e88:df3b:5eee:779e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727192012sm38011165e9.32.2026.03.28.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:49:50 -0700 (PDT)
From: Tobias Heider <tobias.heider@canonical.com>
Date: Sat, 28 Mar 2026 16:49:22 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: drop redundant zap-shader
 memory-region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-zap-v1-2-f6810b9b4930@canonical.com>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
In-Reply-To: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tobias Heider <tobias.heider@canonical.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=lvkzcPcPyFPksR85iGLEu0GHtiBu7ef8gQ8qUgbv0ag=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBpx/iblCzCblnh9UUG4+JCsu8bobyNJmnnOOg7F
 yNNibmo9tCJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCacf4mwAKCRATSY8DLM/p
 2qJeD/sG3KgiH5fOMADmltp/OTwRrA/RuaH8HXzjYgsmaGd+zRokzCWn5PwBh8YlfuFwdJXd2XI
 dfr6B6XzN6sbor202rxkfKmXSTGRdAHp0QKsi6TrEAVfhcWlutQjTT5Wm5gtINURSjaCKoECtHE
 NEQdNt1xUrrI+YaRF5er1uO5KpuhJZnNshQz/piXw/vs1GZSAN+1UblQuAkUoZYW1vRMVhykclq
 EYc9da6lfrUdiGGS34SOzvAAzBxmAlzVtB6rfkhdPxQn2pkFWslCSZecHUIzvH7phparlUbEqbM
 V2dBQHB91Iqs3jDp0/kdndCAqrrItERlXL4B+NZXLeDJispozo84AxVFyrY7V4zW2kfAbNKVEh2
 5XLagon8hYc35Djilk8X5OgvJEPxfV/1m+BWA+sibngYkiZ8YDVyaOJx23xRbfogW6PAQ+Fb6hP
 RnbnP1JKNvF1nbTGVyKfIqx36hlsI6yOOz3R2SaGC5oFlwll/Zie3JC758dGEJ3mte5k2knBcrW
 BvWeB2dMGOznsKajxAgma+0Hi0PWAAFEjjcE1hp73X9SzZoE/ruzRiM4752ra26U6UV7xhc71AM
 laXu3rogfXLsAdKFU/YYcklGytUiyV/VmyruvkXvejH0ugumkPlX5TIglyma/GsW+9jYwL4/Kvp
 6CLrffDQLd1xHEg==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA

This is already defined in the gpu_zap_shader node in hamoa.dtsi,
there is no need to redefine it.

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi        | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 42c0c7a003087f181ecd6228b5a8bc4341b1250b..dbaee62d69b53a1f8074965724304f9baa272591 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -721,7 +721,6 @@ &gpu {
 };
 
 &gpu_zap_shader {
-	memory-region = <&gpu_microcode_mem>;
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 37539a09b76eaa78bbe38c8332bf3648f380c3c2..14b5663a4d48e9184672b626e48ca48556dbd0dd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -864,7 +864,6 @@ &gpu {
 };
 
 &gpu_zap_shader {
-	memory-region = <&gpu_microcode_mem>;
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 

-- 
2.51.0

