Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85D9476CCC
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813633; cv=none; b=f7vUGqbDbiY0q9tawSdhM14vRt4V/PltHSoqx1ppvhblAusiWYSAwPm0P6Zi1sTVG9N/VCUlcKirbsnIippbqVT29p4ioa/qrpBzTCGCzXcnc9bml4ylT1S+SMVcpJD+pUm67+LmGj8ZJ9D8mIOPVXQj9r0x9MzPlLhN3me44AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813633; c=relaxed/simple;
	bh=g/jvPaYojbRUskGx0vHdkl7waFp++QV7Coa6pHsErts=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZlwSWW7hNXVMxznoRS8IGTlazm8JA7vqAMqOVBh/Ls4oPgByS4Jd+lp8lTQqmtEVMzXy4iW8XgHZl0CxUpINB/28h2RtaBvEl0lHwB+Yr1W0+OYsAuJvLcarwNFHhXuSrl0Vs1X5Xcbg6hJMK8zOTn14AwaH1qd5+WMPGUPe+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i59Nkt7c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i59Nkt7c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so5257715e9.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784813628; x=1785418428; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xL/tIFxlX8lvL6fJLGCS7MiSw3QU7lBKDSAhIeo/tVw=;
        b=i59Nkt7c7JzzmaHuhVJxfput0OcwHF4PX5Lfzu2npojqSOH8Afn7pbSzxOBMhc3Mge
         JmJHPj+uLt4XboqbXqbQi1bKzIxmPrQyqaorSm2JHmBl5tfsvOhmHCxHpgXmenBJ/dQr
         xA6/AkMaf0kv7OC6OR8jXrOgyEBhtfwnYXY8EFTzLzqu8W1c6Kpsjr8WVPmz/ieUGHwT
         g/96xCDdiL0kJHJZKyC3dqA5PT9HgCIt32MigB9JPJxohHlRoL47MIqC5RjsVo7CptA2
         bGal6n6F3GC/T0lGcwQseOzdrwLIiNfFArkDiWDAHS9BYOTOJTN4bC77okruejFaS/6I
         kAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813628; x=1785418428;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xL/tIFxlX8lvL6fJLGCS7MiSw3QU7lBKDSAhIeo/tVw=;
        b=HnexKSwR82ccucIWluJqOcMIdFtN04omVxlDUybPMzvMCLxFIMEaqfp+oh+/dJ3cq0
         YM8C0xPO/LyhKht7DyaSxNyfAUlFZrLE/cpuiX+V2FFBpPSWoWy7QDT2gshHZCIhIdHS
         TkQQb32UkaKlNdWC53c00Uc0+2fm+TUA+S4WgiU97yPGhTaVFPV4wUCEnYUuRuRZFiXr
         Nnd/VRbz0kh1G/KdbKTeaiuQkxbajJ7yffuhJ8HoqMNrzUjuJWYgXBq24WiWK/mzB9U8
         /a1uKvnVu1vc2zuUq9r43KlmLfJZf/mTyJ+1oCqom9WAV9Dt4GQi4wj/GYvWenPffQwB
         vgAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr94mTOkL3dzodYDr3nq405auM3U1LuNqViEvfGq/Yqm7q4KHEc3yg68iBs93ESUfekB6GDXCA21dZG@vger.kernel.org
X-Gm-Message-State: AOJu0YxocxQx0Vz70VRLGwog4EmMooHk2VSX0NO06xueFAiKcxkFyLBw
	Ps7DOAapyTzJ7h2fKSCiJtJMenxC98dn0KGxfC8FHiFqqQXKkyr2tI4xQmI7FftW/1Y=
X-Gm-Gg: AR+sD10oto171Nx0j1/CnoGsLOOoATzNOFEPI1B3/eogPmLdhijRTnlH8V/U4mTviaI
	XqtN+Cvo9ItCj+PAXPlMphNDEwy8WIreNwCaNEo2WHkx/zsDVcTYFyPenX2rFTnAM5L3lNpoira
	DQ6fb97tX+mPHMLjsEVHcKsZsQAgEea1uVxiJRqNc5bV7o7H74ZaPitn+xh4naql7sY7f/2IBGl
	kowxSiCtP+Zxj8mve4qTFmgrrOpy+/TyMirgH10fhmDuihrgFy3Ll0K1WI5P0aHaCDNA9H2+3BP
	MC9+0amIM9mPy7301LAeWCudOJks2tjEMX0sUz6UVtoW2tuhWeJtAxoKRS0tX6r4Gy5aWb8QDHv
	Jb2+vGn2fQMbOiMKPbScomDAtLSy3ri3loZxyTM0hGBaTQ6ADH9UhvFl6U+xYTy73jLPq7VPqlP
	G8JhVzGRPyMpGNTG4T9uyy612ctGFc9tBGwOfr1P8eaQ==
X-Received: by 2002:a05:600c:19d2:b0:495:4815:2c54 with SMTP id 5b1f17b1804b1-49573d22bd0mr36815985e9.34.1784813628420;
        Thu, 23 Jul 2026 06:33:48 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fb10sm153054095e9.13.2026.07.23.06.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU
 clock controllers
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:33:37 +0200
Message-Id: <178481361789.189434.4101591416999923801.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=g/jvPaYojbRUskGx0vHdkl7waFp++QV7Coa6pHsErts=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYhg2vlKwkDIRyBiuIi9Ojmj4U2q89rW4E82jw
 Qzq9Zr7s9iJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamIYNgAKCRArRkmdfjHU
 RQn7EACwyhwTcLtrl9zLYAmI2t2vA+k041G8lcmqzvtQo3tQxriwB1NMa7Bb82/AwAdryjHXJBI
 WjmfdzLZdebxQu7a1j4omTW3tAsnAXrJDOT9neWWE28vFNu9DTbh4PxGlfuApiXHnrA7aJwa3/l
 vrPude41N/nGFQlKXatqMh2Tl5xGC3FfYCVT04G/+oJN2q989Nw7/+Daua0lLzviu9alwuLtUJS
 3gEL1TVcQcCPbFm0B6oJbZrMeCBpsXQympJuypVR79Zq4lJ6XuzD0YlftBxEI8bQVqlN0jK6C9Z
 mIt9qH7j9fP3vzmXoeU4lrXGeC6430N00K9HHxZYOnROGsnuNsU6Ekn1/aqWz+gHbRplPH3O9qJ
 xtNLmWDtbPL82EckZMzHkO4Zt4EI/sIR0D1Et8eEfj4kpovkLzAxRu3IBnyrBQq5swIGD4k3EBO
 gnyB3dmoUnyhuWG7gbgJfmBf3xilMaS3mPZEHhqYbNoVnEr30dncLheZJmo8D4s5lMhjn6gg0b3
 +Pe4V6IEPI+3qaU64dQZMvyqPWy+1v44pVURUg5lAqESqU5N+2WJy0yh/FGOrDO5jCxrSmQJugK
 80xPUCGqeIKkN8hd4C8iVYZ7d2uX7Vg0N0vs6kOgPYrP/Wr7vndnayFOgspkJPg+wY07QUXGBzV
 T43TDC4jdP35LvA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:20 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPUCC2. Document the compatible strings for both controllers.
> 
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
