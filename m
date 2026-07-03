Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AED36D51B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065624; cv=none; b=PB7q7akr9fmtmE+4KNcTRtJH5ebmEpmTdcfz3gTzziuKwG1sC1I90hdbdS05KM0Jq9CHXQ+4vy0JfjTB6kWfmqigFqJVa+po2U6LDX2dIyxFRlOLP3HdnY2vEfMK+YhHVW3sedlnPYdMc6LdkGFmbh9NalGFMCcv40KzAsR9y/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065624; c=relaxed/simple;
	bh=xujQ6tDNZ1nxaHLTf5mA0a97sQ+9NIUOoUvAIyLbYAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncOQgM2KH0C+MgfyfuPUr4v1++Avym5qys4SxO1oJ5UiRhJf/HRDdWawuECrUIzmskQwhtTg8Av20c3RbEL2Ej8Bc2Di9PNkRBgjI98+woC5Ki63Py//KdMbhKC0vlnrObyiknGSs0NDERyZhQ09fGcBoFwUIAsnj/b0dYTyV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVG3xW2D; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVG3xW2D"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-473dc4cf238so164085f8f.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065621; x=1783670421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJScOyDCQE/wEAQrfCzXHIwfqBOTOfCYrc2Hkbsw+uI=;
        b=OVG3xW2Dg8lOWarXoNyfAYTvLPrpGd71m6s/dDEBcdUfWP14DRAR6dBRtyDV/kvOYW
         0XK3Vns4JjNfRqbuC/fB1+fyPtCFNpdFViLa4bhGvF8Iv4jc0FMW0TCphhEWFN+DwQ5y
         odkvB+PTipL7jiO3nO+wzTMHOavjld5oHJO/CJ0K3EVUGtugVbPkniwn4DUjnKhucJGv
         /uz33LjdHnV0mf0fgrHZQZiKH+JuxYHiyEFEbOd+KoV9eMnJ7TzdeADBD3aS0IT2UAyu
         dvUsUj8rh0XNssU7IAR09FzUjUEqA2zblOLxNY11QrEpLmvZrF05ekFuJlQi8PNX11fP
         9NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065621; x=1783670421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJScOyDCQE/wEAQrfCzXHIwfqBOTOfCYrc2Hkbsw+uI=;
        b=aIACjbSBa1rILANmly7W8V8aiEM29tHjDNvdFXp4+5AaQdC8jN10q3nB35WT4mlQ+x
         ntJUmjlGkfS7sBTvX5VxybNQQVgxw0Iq7qPoq7YmNj2Ga0rKqWvEyVWfa8S2XBiP1MCR
         tedkoo1VmkLMe2ktpFs8fCXRYF4ff/h+yH8lGhdruBjVZ+D00PC+5nd1Ui4M0jsa1HC5
         x86TZylUFZubnGRTKjp/Ezb5J/FMMgfCjhjJL5Mbj0tPwP1cOReRfelV+qJscelzHnAu
         m/UaTuof5xy/DHDL+C3UoQUkUbc19mHpexJ90rz5LGeSC7QBUkjg+vuxN1CDS2f4l6pf
         wNeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKMfIsBxoHd09HhXoaYS0vmvyDAFNzGlo/HNfOEIQ9cUhHWSv1H01JelE5e6CTbaNtTzWZ/PeXi2XN@vger.kernel.org
X-Gm-Message-State: AOJu0YzPs3Ge09Mi7hTl1N22VoD1Ki/3ZFgufqMKRPfF0znpx+tYKIgt
	bwuVcKGxOfPKh8knJEOFFJ6svcgAwmbnqV6ZesE7LCjeRJ56JU7G4qqO
X-Gm-Gg: AfdE7cnUiEjDVixZpqb23cWhupSYAYgkwKgg5eLEafMSZ+MWZbo3Er8xyPfDMzA4yWw
	LSnGytMdeS+jviv8SArtqRnX0gqxpvaFTDd5y2S/rUgadNJbRQ8l5W0IA+PBWtS8i68RIzpEzi1
	/+6Lq2qmxPfH5s1a2q4DI5TMsDzwVIHByTUsFLVKgWEDwMOaVWrEF5ExKlOXig+V1z1sktpkYEX
	PS9VgZKHzqVSbOlL3SnfbO3TUq3n9kQ8e4VAj1KL7YpUKuFFGoR0W6v23Nczipbyi+50htw5FEF
	9J4we7XmzOEiZCseWhouVZoNHbyDRASF/nNh4ouu0chwS/ALYJjz28WfvoqwsDW/H+gYJEW63lo
	Hr0mOZNKvu8K91j7ZnHgKon7Jh8YYD/bNgp76P62Gm3jAynDqDvXVjt+/J1Id7dQTPXFy342EgV
	nRTyhH+1UqQYaDIcrKPg==
X-Received: by 2002:a05:6000:29db:b0:475:f0c2:5b02 with SMTP id ffacd0b85a97d-4775b45b05emr10239148f8f.56.1783065618490;
        Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:cb6f:2cd6:80ba:ca9:891c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15116051f8f.0.2026.07.03.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 03 Jul 2026 10:59:38 +0300
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-sm7125-samsung-v1-1-3e5f752048c1@gmail.com>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
In-Reply-To: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 667607ae2c32..ec3d9be06dd9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1036,6 +1036,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0

