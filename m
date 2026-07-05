Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021F62C0303
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247624; cv=none; b=c3nJcQZYNptUzUMGJj6JLzzHD/PysgCAQH7oo9feA42BR0eIG1b7+Ikqnf8DGhNwt+/4wEXBDxMU46A0DIkXFXrzHMvPt8h4SuZvCEC/MucFYRz6WGDC01MZ4hY4P5Inyx9ZylkYFkjhABUSGfw0s2kObmc0gP8gNXh/Q7EoaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247624; c=relaxed/simple;
	bh=lAPIbiJiqMqb5Up3h1/qudmb3tYdHGyZZmsTohHUWX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgP9vGUd/3RcqtKQ3KIAqlqV9srhPbbDB03vTCrwFUL/uFFyrZaBfVjQPYU6SeL3ul/IUWEM19xrt6Nr5/2TowFC1X6vGxeic30JGOlX1aemoTu6sHYU6TUos4RMcxGbkutwd9nnh/AmxYbj7wF5PXbXWwCQF90u8fnoqCTql6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AipTD7R3; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AipTD7R3"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80bab6cf5ebso39937487b3.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247622; x=1783852422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knFj3lxdZDwXb0bBbKTG0atYKQi/dQjB9JSBw4jJN1Q=;
        b=AipTD7R3QgYhg0bnCRmy9wBmtkOD4eIIBwqDeYeqvCUFnSpD1PzET/t9RU+ZMWgVs7
         +yqExB+qRO8iLdrvXaw3THKdXQJcQ9JWH3Vc8uS11xav/8jZmvl83YrxVSDzPLWSYa04
         S2xW4D3UKVgen2J5Hgrt8/oZj7OP0uGcJEi1B14jLj0b9T0QabDiRMHWuChFrHkgfZgK
         WBeudsZ46NIs6k84h+iBvB9XS2zAd/SH1XDX6YrORX/RAMUdLMTxBxZ3cctx00sCswcf
         ltXoyyPU63xolyGAzPPJHiCu7gWYfiQl2cxStzzNMICSQXLoqLY9wQjmMKQcqyn+Xd9i
         spvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247622; x=1783852422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knFj3lxdZDwXb0bBbKTG0atYKQi/dQjB9JSBw4jJN1Q=;
        b=CIXf7+yU3XuI6JF41OgFTs5OQMAzkjHREJ2lJFeDELbX9a+P2XEFBps8oiVYm+PPq/
         f43oq5fyzKRt5au4lBU11OuRsb6chgLUCANjlCdmTv2b0/9VyI0ewYxFs9nuQaKRz7AD
         aeGxCDZIIUNlj/31pMtNNPFTcmROldTR12YvBeqZ2fopugXq291kfGzQyt2jgVW99uf4
         2dNt1HI/yHa31oHCybT2AY7QTfS/50tvjbN/Vz08nmpXTRxGLQ3iwH8Txi8ImtBuq6F7
         8IHGZ2A1C+OyV2KmqzC2LHCYULMgCbA8U4NJdjCsY6Pk87YfYj4zacQ29byYGlLmSEdQ
         x6qQ==
X-Forwarded-Encrypted: i=1; AHgh+Roz29Lyk7SUHHtFOvCD4zA/KeVUIQ6ASODp/pSbGHCHLGLArOFp/vGTBYv1cZLuuN3U8pxWItWjwhwk@vger.kernel.org
X-Gm-Message-State: AOJu0YxEMQdh3YNoXtdqbCMdn41dLsLVMtj7kn43tWpcUg5/8HfSGE4h
	LTtTv53OVDCdSattQEJPXCeMME/uXMGZcYY1Rf182q5fUMT6zE7fTKL0
X-Gm-Gg: AfdE7cl2KlR54Oi7IF20sJu6l2X7bznC9krfGkpYiwo9303koZaN3V48dMaMGaCUMv8
	aFqWu/LSpvuWAcHvydfU1dKb74yYZ54mbb25UzX/sx6q4uX7KatoBOaR7dCqXP3+Az+G2yjKqEi
	XPxoq4VzOOLbabVvlx2ib7DNP8RPP8W2lPPAS3O+dW427AZsuK+jXzX4lA8G9++QLDusfGnF/FA
	di14bv49CE7zFUkvkjmhYmCDTPlwJOCuKptWMQdrsdIEJgKxzkDUBMThmutiBoncojjnQLb7Dl1
	qdEbfJ79KlJKahSq0OvxSbu4zJRqxd2j6IImfC/KmuJ1o4/XuTXtcgjyVJJu0aaUGaKeXN3E9wn
	DouOGPN+YwwcR3osojne82y3DIrsUj5F4WQBTWRLbDKwpPYWqffEezKj2PtWZfJhKMzQhjd3Cmm
	A4P9vXQEfh6yNa/4SaspDkSfwU+KPu
X-Received: by 2002:a05:690c:998e:b0:80e:dc2:873b with SMTP id 00721157ae682-817424a4286mr66993537b3.16.1783247622061;
        Sun, 05 Jul 2026 03:33:42 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 05 Jul 2026 13:30:28 +0300
Subject: [PATCH v2 2/3] firmware: qcom: tzmem: disable SHM bridge for
 SM7125 platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-sm7125-samsung-v2-2-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
In-Reply-To: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
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
index 0635cbeacfc8..50f500834758 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -81,6 +81,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

