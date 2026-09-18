Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D76492E53
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758327; cv=none; b=SW7iIoUPG9dpkfkDB70y/jIx1w0JNzae16rGeX1X3gtT/1mJ73RHlGsAHEUoXHJ2J5Jd/9VYUpNXQZYZExWWN+kk7gINkvtf6ZicuzuCfpsWTSJ5IK4+h2NRlXIvk278AQ9nCUEC7agZD7qa5nBAn9aYlLAtCZkclKZXRF0MbII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758327; c=relaxed/simple;
	bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BM7a3N+Qo67HgbKgTy2r4EcEaanbzwRL/OEagDsEEVpLMKZuiPYj2G/x+qFjj1JmmFHMCWr845SswAqP63hoyyDJrBQMmJVDuc8/yi6N6zULM0IMqOy3rQ133MQryHv+ziNCTe2RLMo9LqxkUnfBPfTCHO7/6rld4EGnO1EwOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h70LSQW3; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h70LSQW3"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056c2064so1395903a12.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758319; x=1790363119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=h70LSQW3xL26faoJuLR2LDRPPXYTQ3097nXLEzB90TERZyEBL2KYfX3sJE1RZxEbEv
         HAXRmU4hrnrC0PNW6xYQeAyKP0eR7I5dTPf0We3dIKWR6GZb+DFXyx4BWvW9gKaPAn6v
         VRTTcXrJ5F44FDUQCFRKEcEdnEXMzEgaQuj45AigkWaTN9F954hVkZypm+Ev2fb+FgSL
         5Jbm9RFFxqQhStCmiwutuwmd1lPaEOs8sjjdAd+vtkbLyoPBonosRCSrqMMDSGR4j3AQ
         WC9TBR63mXQGfXxQJsatVKlj471TtFjiPHQlZ4NfUMrIzTsS8GCph7TzH00uI7H/eFWN
         ZYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758319; x=1790363119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=rkFXjQj8jstEffqV/6TVck8DdvowaZrJv+rFo3TxyMCwkC0oypCpcTtKkr7M9/D1LH
         z3z8k2j5CzZlUkDIxP3TJKGf6w4UUEO2YaHeTjbDjjoL1P41ddkSQA15OrwJS3ZchT0x
         +gwc4OUg8m9UAscyoJndIt/hFpf5R+s6hca0FcYWBLG2P+gUqZwOcJ0JYOPqKSIjnOVI
         eHgg90rGHz4pPdC4Grjoqxv1F73lsLr9OVaRgz21N8tGz8GFvwqztG1CnekgTZJYw/8c
         ow4OtmyvNKWKU6NRZYrAfd+iqmDXeO+q9hwjBXTZZ4P+mC6KcyrRhtOx/F4A+vyLlvnj
         uVrg==
X-Gm-Message-State: AFuF++lvd7/jZLPkvil1BhIJwrmLfnn4f3YYK+lEyEt2BpnsET7Mkqt9
	WJChW70VDn8xQhjKVRfVj5rL38uNaz4pidmqnnhR0RFRn2CbJtEiVZSE6RGd9xFbdT8=
X-Gm-Gg: AYBFou1q5+gjwJf0qXXSAAe34/bESUrMQ8GOQ1RSjL2wMTImLYQyd/GWmftqoaxw+fY
	xWT9v2j6ka2p1ZBGMW1ZMGHsrCAKf7JFgOSZ5lt83vjVEAwvFzFIC4zz/4hMTa5GqrF2y3HEC8O
	Bi94iCyNkogXZtkB5HXND6Yv3Vt/7v0yI0AjDYgeOXlhbEx0gDmKT6ZmQOwgJbxOJZtmS549UXN
	OXhisEOtuqRPj8zGgE3SGmbbI/2OYPDNwXh6iBJP1XdzTo/WBEMdgQWOJDVXC9OdJ105EV9Jtzt
	rNFmAyFfgOjySXFRPDlMH4nsKjlgZ1Nv2mi82yuJZQCaxGFFeighHS92r1dkgzz0npl2cGu6zvU
	boohm40QqEv7lmfTgcl6HI0l9mk/KW7mvVEqwh4/MDNGIeJ1Qpg4s5lLxxNEaA9BSq21fKvKzvJ
	K+dyb5RgD8eQs279GDYG3GTBJiEH5oBbTsZcbxsYiXwb6pW8WIHsNOnSFMTpytNPB4ocaqXat/v
	jumkWLrwGnQGD6rAmmsvtIK4YyQgI0JksQ7CxN1Zwnet5uz5/s/BGMmy8j85AeQSphTCbyF5s4h
X-Received: by 2002:a05:6402:13d0:b0:6aa:447:17d6 with SMTP id 4fb4d7f45d1cf-6aa55ed94d0mr2176058a12.7.1789758319014;
        Fri, 18 Sep 2026 12:05:19 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:18 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:05 +0000
Subject: [PATCH v4 4/4] arm64: defconfig: enable Tensor G5 SoC family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-4-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtrLEuMzp5hVqy3Y5ljELO858BUYVFUsn4vP
 b8kZdMyek6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LawAKCRDO6LjWAjRy
 uorND/9JewuaEszu0u6QZ9+I+xCJ/O8So5m+s6UZ2UyBKT5ujplVyBAOpPGGavt5xGJgjyobSEJ
 H9KtrlWGHOC7bApugiCV47Di21psrvzIZbiPer5NoArylWQgbG1f8ekKCOH3nDPnjOKkcb6C0Nn
 1BnkOtQvxDq8sF9SpqgEfuDE06ux+Pv02ruZH5Qd7+2y+ACmSNIEQCJETKKUHhj6JkWqKbMzU7f
 glDuPPlueCekv/ltOK8xGxKea/lbRsUvmqWqsFcMycKCB3+W4l12dTQ8PEdiBMCreyNOnYydKMm
 wSYKcJboYcbhqng2YdTnnZksYd0LKBwrBeVx8bM6Cq3y+uRMviYtfaj0GrRnFACqJdu/tXHtqlC
 zSd8tai4yxgEr4q0KWOHlZDW+cJoKGqiHZaRs7PX+r7abJkUB+Ju6dnXWrlS8DP7av7dk0fLtcw
 AN94OmE5fZEdrcSbehR1/ObFgANfc8VB/Uf2DAw+EUhEJVmKQOvQNdql1Auy5qwmHLg6R3G+5WF
 /lkNbrW4md8Eyu4Mx8yick+cOkLaR/ycnpYLZb+mNaGeRdKpaxgW07WCdspiDtmgTAFXpiKmwkm
 eGj+ZdtcUhrZSL1MKMIkhcKdwSdqQpGEFwck9AlzdPjoEMdxyyk+ayMPpC25O4FOPzQgarTipzV
 FQrAKZRVnfi8PPA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb66..75000c12ead03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y

-- 
2.55.0.1082.g2b9226bbc0-goog

