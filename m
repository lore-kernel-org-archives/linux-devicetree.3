Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887404746BE
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315238; cv=none; b=eAHgbcza3TWBwRogxvwTz1U8qPu8EB7vKzAogq/wOyK+kSrIj/t7gETdwUe8TflKVJCMEEXC6aI5x2mSuDqiVyxC5BjFd5rqSXOYI8SzGcxWPL5R8mzJV5PB9F1f60UoVvrJRynFponezzkcZOeHo45ykq7WiVMxF2Cb2OGR+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315238; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xi0kWnR9C1yc2mJybwUbrVMXxzCDgaVmkGXSrlenCSHIEQLVWHYW3g8+w2PNXeKMUk3BqhtASmjB3YOFZKh35C2KpuJl13sv7JO2hldBpzo/3nZ8NGqod1fX1vV0YFYig3RaiWaDq1jAOHaHcai++XJa0WRapomyBF55LRCdwuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh44Q8F/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh44Q8F/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so1831334a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315230; x=1787920030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=Gh44Q8F/aGr9Z+qNKKT5qVgGD7vofHTsL0luUcJEQxfd0SxSbnmPd/9uD7XtjOEfor
         2cP44z+/tdmRsGP7Mi45z8ii/F5Nbd3WkzBuIpY9UkuZ6lFmQUxCEQfeF8jF2mq52xqO
         MGrHFWTSX78Tj5Tq3jSJAItDVdA9RjAfvb6O0rxm3wPrQgNAt+JluWHq88zs6BhJ4/pw
         4yhXxt9Zirm025L0OvNJaTUGJ+9mpIU0eZjWjzPA41fcs7f8AvtNP8tVzjg3hYiaBmR9
         7092eNoDT9MDxQIKeOMT2IdnQKO1Jb1vKh71lvJSHnLbQ+RYsAJtILquZd3XV1LkpXx8
         vw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315230; x=1787920030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=S1IXrUEHxTj6HCab+5a9UCVFFy9MbzfYWk65qB/SsQCRBHhreWOwBRQEEIFgkH56tu
         gEoUk9o9F6R9owBrVXLl6qz8jtfc21Sk6amW06ovkFQY688TifEVWJd2K1YlOu+EOSuI
         iBb7jCExUes0HPRVPs/vBNE7vydjmQt+RvmneAWshUdT8RPM2ilB7uTt+BRJ0OlhVhyM
         LaFg9zF7RJcoiA3DAnPs9UKjmmdD35tqR4koAvbMKS8m/6DzJaqwyIlAUG6+DezYda4Q
         EaZdqF8Fk5bI9fwstXdbk6R0q7crzuM4ORZmhzJ+J2N6XoWoPhZDS5PeONmJAVVhGm2K
         ZIUw==
X-Forwarded-Encrypted: i=1; AHgh+RovykD+eXqlWje+CDAyB0o1IUXjc29C3tapnjBRkOD3FNFQwnp7JSXIixa5yce967KYnIVWUWpzxqCM@vger.kernel.org
X-Gm-Message-State: AFuF++lnKUkxzXx9IMKOXXuPA8JUHea0jyrQjDXNql8LNowtSY0qkj9J
	CJ/b8WaJv1enRAwIO5ceug88toSdG4C2rqfa0QrFbQDsn5N3n38CNPJr
X-Gm-Gg: AR+sD13X3uFr36asETxiK+L3cRIFsxyXguRXL2gMI7CVihUWw3OJ/nQFK8Bh3ja3vt6
	q29CciPqZi+1ipRRaVaUb0TklF9uxs+qgkm9uyhaScy6TMp6YLuvtVtgMJ62DJFVLRLtLt91o8U
	miO8KaDu+JV76HFad6gKSeu7S7NTT9QgIP+5vAzKIBdYIBujkjRgZkMUjwuSB2OLfIKv+lis3Sc
	ncnNuvAb3X1MFQPsg/NEZO1KWSZk7ADNFKzgx8dsrFdoOP2woevor8p/oGIZ/Syf9OPmmByZqkP
	EfDQY4xjaM7miwQwjCVxj5BqBON8Qaw6yEoVrbZ6eU9rudOt/TM4onryx+7YtqkOICqsE4Id8yI
	SQWqNbnCtrEcYdD/XKAQRZk8PiH2nPXFdcnRbUV1o+fpxWn4+0fydodnE43tpb6q2UjPfEK+kVX
	frkjgBN96nJRT2PjEs4OAhpqkfHNtc5sQMOnRrXbTHd8FLWioyyKGx5pcs7MYCTQlI7YQugNvOU
	vzdFdEe76UcuHhKp+418nktB2oiKP1o5A6ARg==
X-Received: by 2002:a05:6402:5042:b0:6a3:eb58:dcfb with SMTP id 4fb4d7f45d1cf-6a42f1ddad2mr6350361a12.10.1787315230209;
        Fri, 21 Aug 2026 05:27:10 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:09 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:01 +0200
Subject: [PATCH v5 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-2-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
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

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..289a3de1d24b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -292,6 +292,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - motorola,deen
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.55.0

