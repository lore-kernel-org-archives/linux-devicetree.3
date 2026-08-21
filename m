Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6CB2D6E44
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314751; cv=none; b=DcdtUhNyvOvekyUTLBkJXZknNTMuRGXMY31aPQ4oQR+YYYLbhev09VzUYO8OIEMbP5W0pP3uzddMgoDXEbDIazMM+rwA+kQ30vcfpsHgNPIeUJBjAUSHmW4r0ZY0TR/Rio7YeuNFcclPkO94WyQarxLa907U0gkCyooVrZ+0jdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314751; c=relaxed/simple;
	bh=lvXJIYHg+Za7wwIfyKwrdptP8jCEhBX03Cv8tnpa48U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYwhJfLY8p81KWNPjYVPOIbHRbDsBBH1aEOf/AYWnMK8q3Lt5l0Leq6sSri3nPcAHByy5fpgG/UJLuJh6taSUcHbhgVBx0N3YtNlCHWLcdK/BSDrJsCDrff3ovGBaXSozTqCLesEw3++ERy7eegr2+VtnOErQaOUM44Ur5G7dfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry5RQ+Gi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry5RQ+Gi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1c26d7e951so140950466b.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314746; x=1787919546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=Ry5RQ+GiVl+i0Vu0KH1gppmtZbaWyxWzd7SCgbWFpeSpsEuWwqdoaBSrMNBSs7fccs
         Qc75kWBwhiZhP8A6T+rxEak+xZitkxkVomsAluDaqrEXmZ7vT/zxZGtTIWkLlzKX5xnz
         DUkununVm8K+hL+NPxWoE5oEg+mOIfsAd8dF1GB+smUrhCWNTN4m8CUWl3I4OVRxUanf
         wIw/SwY7giWoFx7He42PYU4UsnmRFzWOegs9CFJSTfXVtd0krTu/mxyG/hYhaTgarn4e
         twrEReNkmCHVzx0YDOgD1ysdx8tcYh7h/GX6ugM1Sei83wtDXm+FfFQJL+nZJhjpYA+T
         hmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314746; x=1787919546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=kdyOadXv5wS+NWCE144HCViqE4r9Jz+7QyyYzkf5ut+tovTVZyq5zLUeLBBvNuFDac
         Ufn24Xxx4kiP+qT7MwBk4k1RI8MIeT4ir2JYZQ6VrIfyAGOTre+bUPddwbLNSiniCkPp
         1zuf2EPDDwIw4SrTHGBmPOcr0StqIEUf/ZAodhqK3zpmPUgbGmKzJrwiNT4vVch1Ly9q
         Y1Viyvm4d00zvMj1b474AM9cwcmMrDKeqyrEd8z4X9crdyUhK1YEjh1QD16kAkv8qbZK
         SLEjBV83ZEbXhB+hjJHXBb0M7baZ2Hflr0gBI5noUTtb8P1Vj+PUEhOFAiMM8Rva421a
         ca1w==
X-Forwarded-Encrypted: i=1; AHgh+RoghpTDYIZX4chSnRd2PaYY5pfYPEBR1RaKt+6Pjz9l7YGi5HenBtkqWhHV2KDlwJ+wPwr28RCqlKuO@vger.kernel.org
X-Gm-Message-State: AFuF++m+QQR7Fryy0h7D7etAuxUNso1ZlBbn9rjvfgtkmHiaH1Zxv8w+
	YwnMNGHnjSFDCgBP6nfDuReqom/FFVc8O5ntIsO8gYJXX+StQlu0GQM5c7eVJw==
X-Gm-Gg: AR+sD12uTuVziTd9ELSsqJJZc88e04bDBMWT4m5TEtuFp3tVQqUaFjfCKjJdKPfsza3
	JcR7cvywVfWLu6fakGk+c0aA0QVGry5shbXTyjECnkzKYon0g3oDg34XRleF1xbgfuqNfCJ5pt3
	NpNMgzfr6jr7gFzDT/5IT6wgWPLkA2KsSH0QwIZa+Bi4ghkTln+JnPQwvl/bFzstKsIOLY8CNiB
	EJuSGOMoJe48825lNNwxg3CVLjiKY/J4mVmSdoqlOGxRZ3TSSPcGqR4ELz5KKopcFsKQpXNx3LO
	ao80SCQVtwi8VsVc9lXgEHYi9Lx6RdAqsR/8mv4+zN82XerQma59W3FayqB/3p9WKn7as03F6hP
	gfW4GOGGtG3rMqAMVI9TEvKhCOdmPjvTyz5Jcrt5y3qUZdqvwtS3K2MfHBcZe3PKgWhvB3Lmd37
	TAw50hzqmmTj4JajI+HB4T/Xt353WcRu+uaOP/K9BDC1Wt4mFWusCZUOi7hWZto3Vy7wwVubtMF
	OTdhvYvRZG2+RxmR0LJPKzfqg0=
X-Received: by 2002:a17:907:d649:b0:c21:818d:e97c with SMTP id a640c23a62f3a-c246a2ceccemr629384466b.2.1787314746167;
        Fri, 21 Aug 2026 05:19:06 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:05 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:00 +0200
Subject: [PATCH v4 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-1-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
In-Reply-To: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add vendor prefix for now dead ecosystem company LeEco

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 136681412501..dd0762d3334b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -947,6 +947,8 @@ patternProperties:
     description: Shenzen LC Technology Co., Ltd.
   "^leadtek,.*":
     description: Shenzhen Leadtek Technology Co., Ltd.
+  "^leeco,.*":
+    description: Leshi Holding Beijing.
   "^leez,.*":
     description: Leez
   "^lego,.*":

-- 
2.55.0

