Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234DA38B130
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314759; cv=none; b=TcnCSgbhaqjNsrUKLBPlnCAqxXvTZIJdxT2kwEcth9L2QoTX7lGZhyT/C18tvXBxbuFTKtmoLG9mPBYtg4IgJChAAEH/ASfL5FbydNKpIaPiGvDeZ2D/N8w4miv/1fPeIRbrnBhDVYKV9nZ4nvQanCSmgyqt14M9araC8FCMK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314759; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9qhSBjwH+5A2JdZ8AY32kNwwuyMDLylLIpn2upvS9ukVWuVB+j8+t0X7bczSMorlwcZsmaCgq9+jIGoWAlJHZSoTiXnI6TM2xocNiaqJimL4o3Lvl8El27grTkiuejYpQ57XulLPHLhfLx5hJ368LE1LYQIABx1OQE1IRZ4iKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzsFfPsS; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzsFfPsS"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso1667934a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314752; x=1787919552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=LzsFfPsSDbh9w2TUgMQkuyXX8Qp5waeEoHCYLzSeyQYzycvE9cFrkuq1xwFub7iMRT
         Nkl34CsP9HgorxIsHBxUYVN56dN7jCmrrQ1n7+xS3Sfy4gP/HdUeV3MEElZw1p1uhzZx
         j0TlzIpXE9TiOsUhAesneh5p/ammSDCyu7qdYOyufZA0Syk2DWEQKhl28g4010DuuYte
         Hj9nlEnjTlPoK3Y9kf2/Obv9VBDD9YOlMwWKu8kDfJhrCZYUZqzDIrpHYobhGC4WMxgf
         InwrgiS7ZtHMxDcof0cUdy3wJOeN0DwL+eHuNcXC6PuEAOvDHY6bkZEnazR6VnS1yKmY
         Zu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314752; x=1787919552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=hf5RoOVyQ8C2kyBzAzTcCM8ga2T537hk7LoykSVfVG9AxgGBnV9NZ7o0T8+sfR4lcN
         /ZdNUMiAmVhX6Wo3gtizAk1ojWNxli1d2cFS/N3y+sz2vDYfYi1kBbpPiDm5CjaqeF8Z
         lI3JbVIaJdGApoRm+Aed7YgmcpFeFW92BmjIaMrpckE2ONkcyYwFBPQD71kDFhbdFS6L
         sMH7xuvqjJl6dRBuTv7XyKPaH0wJ5pWewjjNe2YaOg6ZReL6RZSNL5Asp9A6NpMtvCZ2
         vWppD5DzPgvoVJ27Hzjwp/VXtk1z9ofK5C5SrdLWe/R72OiPkG0qcIgR7J1WhXXJBc1d
         mOWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCsF3E0UcgjvU4/iT1NTrLel88/5ca08OcMw7dQD0Cjxn2PC92Gr5V5Zan0IOGH3EvGTaReMzcrhK9@vger.kernel.org
X-Gm-Message-State: AFuF++nL+LyNtBgvFt40qxrw8x/BVkkpauT8MCmottuM9zRbmUO8Vsgl
	OsGke7pOwYCL20LxixdiD20EkxlMI8tiJWeuAmvr4I6pmL3akOWm3vgYKaUfFw==
X-Gm-Gg: AR+sD132AfrcFkbhdOsMn/+x2i80Mkuy2HR7hjldk5lCYerN8tBFy00TLXdbEIRpeTn
	osyAJ+hq4+H9Oh99L2wxqPqUuKJTUBMX3IQN4vkC2yJtlAG+jJbqtXRNV+IdSl105I7HBUL7Hg5
	udEeXmr/FWFKRiCNWOiW2AyVFiH8MV74i67+71uPak5e0Qncuogv57C9RnnNXwsUKUtRZATp5ou
	3jvAhOywfevpqSVewFsAxEsV5S/DjcphCECwfSd838QhC5JFxMdZ150cdqA/Z4pPAtg71Ce7hXg
	eLFdTbpDVIuFvwcl5NDP8LH/5nLEueqIaNwDWz5xT1V49V5bMcUE/+cbHhkzHKj1AYlfY/YQihf
	3TYthoD2qR8Xr7Xp3N8Up4DHI6FD4kbJN37AYh7LHEUZmXvcxrE7uaDl7Dvgp8b4Fv5Aegd9j6H
	GPc3ec+NobeLrKOscjhHAyGtENgD628vJmRY3i8VawwaUD48y65pdSlDzToQXjgusdSWgOHEUko
	/VoQHRRoyAt2dXtBV19E6E0ZiI=
X-Received: by 2002:a05:6938:a090:20b0:c21:2c32:e2e6 with SMTP id a640c23a62f3a-c246a60cfe4mr460289966b.10.1787314752276;
        Fri, 21 Aug 2026 05:19:12 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:11 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:05 +0200
Subject: [PATCH v4 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-6-7ab02c0d4eb9@gmail.com>
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
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

