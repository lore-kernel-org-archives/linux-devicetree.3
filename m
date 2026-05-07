Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D5372B24
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142845; cv=none; b=T3YmJl068+jJxwePPKvtUvaWaOgTPUJpIYyqna7ZmmHKcDjIHz15+PmbxrlS+nMeMkQjB11AakkZJFVsL/qyZpgRNzjlADjm/w1IHw9r2AZfNi64HX/G4Kw1bW2x8W8ktXk58hbcmI1M3wXbTfCcKFSs04AjmDyXwNC8rb1t21c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142845; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBKGSHwIFlxleLJm3Z/hl2qmt0VdoHfOKLGX96TBxefn255uNoG7u9/PboPfXVgYkiRouhJ91uGFU6I4wVQ8wY7WqraOT0oaNKW5zmxX3AE4hq98ggLnUz8ZjKrSTe/ooIqgULTXEBnU2ttQMxwGHUaH3BAmo9y8sywJwRT5K2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXxdaVS3; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXxdaVS3"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79495b1aaa7so5049607b3.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142840; x=1778747640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=rXxdaVS3fSOryhQ5hMlk62YVWFmUEjsKgxdO7xY7SlSfQGyTdffiFDhUUskYBq/TBa
         oioaFLbmGSxpjpOHqKssQmDLPGR5MCNCLYofYL4XSTwZoF4e235oZlTq+GZ+B/Z70xcD
         9YzutURvE18JSZ/hkwrWRM4gM2pcb3wsQHUlRfteAjepzLxjomBzsJXu+lvbCUsBC9g1
         cE3oMobPsxm9WcPcxl9avG5wxESsesnQbqaU7WqNiYuiEtYKIoyaepg6e99OyKc/36Au
         EE3+YDhOXGWljOfb/QdGpXdMwn2vpkHw8Kru+G23TyiqGueSxB8dYpnkOlMVu0Gn4VkL
         jRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142840; x=1778747640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=Op0+WYgtDoxIP16e2irJ/JipINeSvXQDSwMAQMM65roloQEgxPyi4p4LSxcv1VlwPb
         QEAtaDsmu/QiRKLIJh61r15dmd+lx0bvMP6MIwDjOJkx22/bC6hsVH/b1wGrhiSxMNw2
         mtmbCVU8tDvn2LtVkugdxQ18Mlra3zeKYIz0G+/wExprdd2aAvn74pXZpq0QJnkob8cn
         iG7j28E6X1BGK3vFdt1SU7PvkN9EKVRutN+y7GcWrHY2uffDWiXmyVERm+yhxmyH8+ub
         mm0lsL0xY5nne9hA99z/t8XV1mn6x6U+thR+oBhK9lePustvzeVv/+FiREMqoS+sonwQ
         mTxw==
X-Forwarded-Encrypted: i=1; AFNElJ96xyPXuzQNyV3wEpEen8PB4ve6dwTAp+2PFpFixtoEglFBuAIntDrDB0Ppp1SMlDPkGqdZbxvz0Fja@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0ZiBwnxtcOBCORpR8H2qU1FvbsYkxBI8w1vnZUtveTpt6wdn
	ykN2einNwh0W8hrTkmsXp4hOK/nTczX9KX5K24vFMXGHa+j2JbLWBIsH
X-Gm-Gg: AeBDieswHZzQ64z/79SDCgaY85n4MZ2HwuDYSLgKkthJwJp6TEybQ3okkHHgnXWTQev
	Wr3cy8s2Dpoayb3Z7V4Ab/zGVatnhXC8ipUKpssEmfrKEva6r30tcsRxXqbOCGbGyCB962hx/qz
	lLJSGa6DGMwAX5K8bs5oFnWx1LcVF+gqSM7gK3INfnlMcdCRthH70kGmh2T++SZCTDbTcMTPNP9
	w8p16UFgQ+3djvyel0cwgiLYPTkIHety+lP4Dc3xdQJI0skeiE/kOKWs9lFvfyb9ibdKFnr90E6
	xABIDv5EFBdUHlvs1GWNl9KSUe0xXWZaVXTvnutSJBfDORJLMkjrsuv3cwVeXVxxIjf4x3FyA2T
	OlVYCK/UQxdVjq34SzwDJOA17/TAPCmdHVAGo35SzBymtA9GuHnRHHdLArkMzwY+H6mn3GxhxTr
	5fkIcJPBSaLN9SAnEgMDeVsbyW6jWD79+bMufVcLMP17nImzA=
X-Received: by 2002:a05:690c:102:b0:7bd:4b22:a05c with SMTP id 00721157ae682-7bdf5f02a65mr69836497b3.49.1778142839569;
        Thu, 07 May 2026 01:33:59 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:59 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:19 +0300
Subject: [PATCH v5 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-4-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

