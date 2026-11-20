Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160043;
	b=Dp+hf+pUt5cBX5FiwuFSc1lrcs15rP67drmIky+cbYornuBA1+PJyCA80beV4kfcK945
	 YzF7dELWsDa+zQ7FI6pMox9TL9cIHUW/iU1XxiCguIn4aIlc6BLuaIS/6mDW9X96u5g23
	 Apo3uI2udDHGpyYAMpL91aiCbEV+IhHtjlPCzigPrknD6QHOFKq2ut2D+BxYxj5q4eyIl
	 axkblc0X35GvyhNgc3Nm5UFmqQ3g0D5MmwoxY2VlELYzs/ILfaaWUyJo1H3mHYCoK+QV8
	 sO3QD/do3sc7DpHnpf8DPtELod/mBz7iG5SZAxzFmQ8iw6XSOxzz/ujGCF1L/VfEw0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=Myyw4guT7wbkljJpIt85XUXgXFQXIEyZYrL/sTPsyFc4XLR64GQC4CW6Qqt159i1idw4
	 Pb2xlhZXvU9QkrXWer8KkEFf9Xq2qx5iA1XrlXAF6xcpVJFoBBYThdkrN3G1Y+fQkMjsz
	 ulJgj0Bg9BClVC6YWetuB9mKXUEe5CAsraatp/IV0SH5JZ5BpHvKx17UDsTAaZHtqhYpe
	 qi4q9xWAqMZtFfuisQL6cIrf8Wb5NcFk0aKwKvMGhK1QGE1o4WRFaup6hoq/lLYYvsuje
	 rfjgWewGY1zWi21CI2cpyhpT1Yy4AZ6FmyLrnctlDMS7bentrlc7Qfl3m76apFTpRwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8A60A262B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD8A60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so5115755e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160041; x=1795764841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=Ac2qP8kZtgMyE/fP0ZMJG+N+JUCH4QENZ/z1bfsgbihnepp8xs5U1n2OVY2dfM1Ybz
         8eL9nbD8ajZ4xAXX5Jyxp7gYiy00V65DPd4lvr1WAsKMEeB98T6LxXPRvnVJk04PidcD
         BMspLbHPsfTy2TciIM1ZHJ7Uu5HfkTkWM3A2FQpA9P4UW0Q85AQTlAkl6SUwwhB9HWp8
         weJ5Yjufokz1DfRsoI1HB09H/j4MHX83XDecIRETVHcTbm0Flzp30A28S4b52j3aC72u
         dZSBlUbcdaT92aiYk5uXidatSk2144fZfZpYQDrsaNhNQWNUGI7xQ0QTjNAeAlB5X3a5
         9nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160041; x=1795764841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=P4nsZJKqRjAIFK2gmbZKRwMf6H3+IIiat5N4VI/qy1wYf8GJl0OjpNAo1SHRJ+zhb1
         dKmBlKJWmhdBsS9cB2LULtJdUEKmCN2jXVz2cgvFZIKWvCWL56N6kXILB9d94RBkXAws
         rJGym90ynAF8nQ70V8dOvIg5auNZ+R/c9HCg67dM1+d9pji4udG0FuEJnZChKv17pXSe
         4VrTnkkHN34Vcp0JEF92DPg9ZEkNlen6Zcbj4EoAzyzK6T2c5qUy36v9bseIwzV3dw2T
         vMToHZ4X270kyMXk/BPoKd3JnqhS7hzwxVDTs5bff7/Z6NsVvsItIXdcZVEIRd96bNE8
         N3pw==
X-Gm-Message-State: APuU4Z/INIM8KteqHF3msYhql7HWht4rEnnnAt5PMGa7szDhqaS0bwtW
	WAPvmLpAsllchbhblAdJk+Wuu4XbeSiHK0+zW1PLF19SolwwoVS/9S3d
X-Gm-Gg: AYBFou0wocnZWG+qWQaEnzwp+PaxVFuJeecjdo4mCpqayDWDmAj53eGP9qAh92uUKOF
	5nl+kLY5BIDuo4GpcpraQ27Bo/ga7c9nB9I42oT2J7iUVDYOT+ps1SECJ4ama2Onm1oZTUwErk8
	qGrgdmvDcqZrl+6eK1xtO8tm06beGjp5FIXSuLU8UEKAVG7cu/CfS/xmN4In6AMkbosDWpkNupL
	NzjnBtIJ9jMME28IDbD/nnaDqxqgpeYYSx+K+XeZwbApOSpqAqar0OcrQjsTufOtLg0F6tWpTcb
	FMrhzRhPBZbbfLSwGq8aY2LNU2kR9Wl5FDLkKl8ZvNo8PHjwWtiLdRa+JEyW1LsD8onOEi3gBS7
	0zfCC6dNncJr3G0tRPSljL3JliGLGKhFDFwmNZJxCVT5Cksp1wB9BvEhB2f39/auMI7I0TFFJh1
	kuetCrA+m01EIA3Cacb8tu2iCt1qGJoKwmgLhaJYoytp/4h7v0V08oj5x4WR1MLy5kAyMf5u4Ya
	TLwesLxY+R29yuds7/jCEQyaSSG4R4FUKR7GLUHsdnuxMI8hNLHIC9EFdQISbvdVgHVSgI2BhUq
	ct0wrQV7LICJrxM/98PIM0qag+CcGvTVnP61RenMxClh7AuOjAaOemuISOa27qX8Vr8AIyi9Kj0
	=
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr41369415e9.21.1795160041183;
        Thu, 19 Nov 2026 23:34:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:00 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 08:33:49 +0100
Message-Id: <20261120073358.10267-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

