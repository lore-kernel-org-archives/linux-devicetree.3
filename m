Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D15429026
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106082; cv=none; b=LiPzU9iIBMR7J/gXngaU40syyqOjdYWjLfe3a36IZnYt9LRbiYchmOWo6YJDT2cU86AnFdV9wT9PyEsJ/nlaSh+/o9NUsY7z2N/asJzuyYk5w/btOPbxAM42mB/WMdEQ/X0zU12dMOiz3YAqQA44BjCzRPpsyU32tFpyh5hy7WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106082; c=relaxed/simple;
	bh=Lh+SwH21jhBJph617FXvRF5JB190/NoNd9H1iE00Q2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgTAfQY4Wa345hUqaOnnT1lYWhHJ/6f75nunPtszjUdOfVH0Q1JdePqlsxYXqYbwmTvv7kYX9h1CRnMvtyKxh4qJsk7CaQ+hTj+vXVbACKmSaTiHFpziAQ0x4Q2u8n0e1gvTcUxTF4svmrD3d9m3USWnjj1FJu6H/WvT7/6JvP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZM/YNzf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZM/YNzf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2080434f8f.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106055; x=1786710855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=qZM/YNzfgfmh3p91ZjDtiTJpzt+BOHuUQP17HLTCmBZ7OCHfY0lMSTbhhZ4AE2aHoa
         X8I3AOeR23SbSldLZHpMNHaR3zWFZnwA+GA+GWH7jAw0JM6ZPJZxkxF6htFvdiNIquR2
         mkRH/FqwM9i1Va3SswDoqwrNe9G98nz+mQctYgCEOnWt62bEzTO4Z+yCEL89d3TkhqHO
         DpQdKeVWgcgjPYKJ4qeWTgWzCOBZQIteE5/ZHhLQ2T/nN7244en5YZwhPHvJ2uW3xNo/
         2kTbNbiBfg6fyk/fJ3l5qds3vfW6VwE4/+mMPQywZ/m0bO+wUq64+VWtoub2bjgaeIQ2
         229A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106055; x=1786710855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=jCq4AXS8mexMMRWcpXbzyUcxnFhwbMgsbBi00JGfnBojtNIZES3ACTJ9oZ7XyvEQls
         CILaHoVDzWSf45jy3tPC26K1YqoUtTREDn4n0Y5zi8rJdkLuH+7yuZdU1WeleW4+olQq
         RK1Ulz1YoZNYWkIFP0LrPjiu9tAkc5WhOPXhmLAUiF3ep610IcLVqJ+bVa9dSyNyb+Rp
         /wlrbrulKaNWKgsAirpJAMpYSDBAwFn6w5NMbL4mDk1VGOdMmbfh7qbRMAwWXkFl20G4
         9qTL/7sp8fVkO826xkz0KeBrwr1lpo1E6EqrrbFioP1Pz1mXrapWreXDcM408FGiqKd8
         52aw==
X-Forwarded-Encrypted: i=1; AHgh+RoLxMfuCbQ8sdVfPYtyJda67qqpCMbed54xsGqMzB4FBXFz7pNQfVvjTxwwe4dd6U5JsrqRo5I0skw9@vger.kernel.org
X-Gm-Message-State: AOJu0YyocCWkPxSUruA6miqPrgn1ecbRmDiCDcCAEOetwEGXP2wbZaA8
	t7BGtm5RoIsw6V/nBESa9wCBkIwZHJWI/saOpdKFMOSCR679rsio+XSGnP4elw==
X-Gm-Gg: AR+sD13rV9oh5ZUD6JX1TvAA3PC3FqsXk9/vxBZFG19qjyWOYroC2mhtVDzoZCBeH8M
	99g738N56tuY3fggyuZ1sy5BjwUPtEdWPB3BaoJYQSRJgpveaaCqwhjJwodO1pHzmKVk4r0i5Bw
	5APU7g9tEzGG/8WnP4idzJBeU+mpnDanwxcIhNFzyfCPSyWEKZ87C14vJpgqssbRJ/KWEXes7Tt
	e24oSmvFhQPaVFW8eEanuCts5T+4ud7/FUP327iqADvrmi0EI7KQiDl9/E/vtur2mZNUVcCNRz/
	J86uPIcd4mg6YAPaaKyAAjCZI5bRiXhk0CgrbEJb7onNnhnBupdsam1gC8vHUl/vvjosLc7PWgy
	cKvyJRfiDfqYbg1XF3Q82oMNVX3EQ4IEcQjiPXoGFzzKctENf0AyR0Lh4s6PjGpwnzfiFWd5f3f
	njUg6OYRLuxzTHKnZT8SkSnH7Dy1x1BeX6r/LbQsrLleGi4V0voG8cvvpcZuEz1110b/XT1tfrJ
	p0=
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr299435775e9.11.1786106054801;
        Fri, 07 Aug 2026 05:34:14 -0700 (PDT)
Received: from [192.168.8.167] ([2a00:f502:270:d465:a26c:adcb:8da8:6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdca3ddsm49530495e9.1.2026.08.07.05.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:34:14 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 07 Aug 2026 15:33:31 +0300
Subject: [PATCH v3 2/3] firmware: qcom: tzmem: disable SHM bridge for
 SM7125 platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sm7125-samsung-v3-2-ac0139e5c612@gmail.com>
References: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
In-Reply-To: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..91d59e3e5988 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -82,6 +82,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

