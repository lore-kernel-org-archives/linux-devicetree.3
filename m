Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627742;
	b=nc+J6og5NhffiRhkuU1ez3U2/fIZBUNqAy/QV2RG7wsEtoIgP/+ORxa7GrGV1S4B38Lm
	 cCmrtYu7XO1aW8pzOK6dFhygSdkW9XOVGKHIW/51+HG70+1UaDLZXMvQKKOT7c1yQsn0y
	 cJe5ry35HJhHLkp7rPpM80179im9UtcSuVooKTyOHR68EdPY5RVO1eep4xSnmRTp9iY8U
	 PIv69Be0IOjXkgb/ZRkGOTFdVZ6/wR29zyBJCZYFnFjWY1j4/WKYoTTMviaD42K4wHLE1
	 eb/0xXCvbLfCMwcVNlf52gJm+adBaFfxRwzG+HssG+VWY4dfG0skLcfaLaoOaM/8YIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
	b=ihKrnMv6gi0+ewed12BY0vF8cgrNw1ltG/uiULsCLEcaXruvrGwyubylvIRb+3o8dT0u
	 WuXqKp93qZpX4rvkQorPggOova6jgbdlapixuqsJGpfake8Km7ljH23lmul2gswm39eVL
	 rRZmsR5k6tWgVfu6K8xIxxUKwRuuDqyqlHL8v7Y8H36xgFR3izXlNQhtfARSM3Jeis0vS
	 z6C+oTO0KTPMxqXICDQGXbUxpzW/h/RgdSPsc/GHqA9CpP9ysmEDe84tCa9F0qfBG0ho7
	 5L650IHs2Fyt2eowER/SWiMKumUnJ8uI/rAQ+GV7qnT1PwPJtwTJEYXgE8mvGEYwVmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3tKwUOp;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226AD606A32C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226AD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3tKwUOp
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-703be215729so548519eaf.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627741; x=1793232541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=U3tKwUOpItPUVDK/iRQZIB16gYfJ2u5NmP57APeGAHsv+PpLy/6kpb1vSGGvhUmZV/
         5b12NKsH8MJJWxjWvprmtaLkZ62P+L/5xVbgNZX8XpveFUwJDFhIyzQOUjNpVSa4Qejf
         FNzMKgEih3/RZWlT8F6Hof8SdaFS2UfrvWIL9ki93kvklyayv9Ufy9RAM92uGP0GlzpU
         Pz30t4Hlbm+Xn9JCA6lchFD5yKV7ZLWwXDInqJwhC93NsK35CUquUCfatFR/Wpo0se15
         LzVvl3p2/eA+lT6+M6svE0XvLUTcl0wITxP7ih8OLNlPmzsPwVZBiZP4sU3jmEFyBt6q
         B5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627741; x=1793232541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=ooQ1uckOYeBx0hCPYBm6VrhQIHuiTxwmn9HAH5jhoV0g9VeVRWitYVDrMF4APbj9FN
         LuenrOzgCV7sq0PybJ5viPQIrLyoYxy5Md8obrOfQjx5rISoVRQxifG6NaCDl3I+OMRF
         JeCLJd9/z8xi+CY6uXNnA8pDFNNxY70uIfXH0pxyxP/x69tGi7EwQjCC3P5cyJtBuwDq
         kkPQeTaj+bvb0PmKqff+fKKxi9MVCbWHkHBQiJbT7wJuEI+GCicfJp6NaijCXrp02vu0
         7qCmYp7WZnvHW2v5qGpCeDalr+aZX/sFPjgDlDPxQTLD7jFJrRISp1MNC7eQ7M4POfmw
         frgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqXxFGgbV8Q8nC7yX8V7G9pn7ZaYKyKxaazFVLlqzH6NlQStyFKuyVWlTLWrQ5yPaXy0h1mHhV2uIO@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7ibwdtud+6AVDmfXZKDZ174axAXgcr5WFwSgRzRH1aC7JOjQ6
	Mn7RzNSiSgtOndZ0iAuoUi3ly0OOahJ3OqgCV8C+uvmfsqG6PuEeibmo
X-Gm-Gg: AYBFou0NihdrC0SJU/bApuuiavgBHsg3htHdhZPR3HKXIZaunmXK+k+Y2rHEYl6S9PS
	17p7/AFIO+Dyticb46hZXfnR/NXd919boew63dsf1AMsaxFpFMfv9IENoozvko1aipmKARt3SVR
	p3Msct95L1rCTLTavMosGuR+BK//kwU1EOFzp9rtiOhWFtrpZQrsE82Nx+kdiEINkKrWZxPtn2R
	Yhndl2YkeKdEAifEKwhQY1V7rRGWM2VofDUfM7a/cwDjr9oNcrYBenvVW5F6wH00kycFplfyqIU
	oWHPSAIx56qkiwvrB497nLuXic4gf2D+iPMCjJ06Q405eUv9U/YpkRwW+95avXBPxP4P4WwGTGj
	U9DpY912mVZblW2XekJjaCrednvp7cs1B+2yLsJGKirUbwn8hIuxlDkEG5l2Q51BDE25tkHsfTA
	Zdk8ErJTiVPvEVulvFf1i4ID6amk612N/G+Eblte9g6dCVpLuysvTRIIAbenJM5bqvR8H3KIDT4
	4jao8O3GRCus05OtlD4Ph+qVVBAQFbIDorSTdK/uudgI9aTzmcY2YKXgq7KtTwoXpvjuk6TWrzy
	Squ60VQvYGx1kYSKEdzxwDyLVEsGVVF2LFgN5RgPoMRzOxg2piYzKIn59E12K2wkXkj7exPDXNH
	mXGp3uhaXwmV88f8KRrDcPm5eHCXo2wq8nIjiUvgGh+wWZB8X1XwTBifo6lwQeHkLrdxb7CTDFR
	ryi2I=
X-Received: by 2002:a05:6820:1889:b0:6de:aeea:5c90 with SMTP id 006d021491bc7-70940d7dd7bmr2299772eaf.26.1792627740866;
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:56 -0600
Subject: [PATCH 2/2] clk: sunxi-ng: h616: drop the private APB2 clock
 definition
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-2-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

CLK_APB2 is now defined in dt-bindings/clock/sun50i-h616-ccu.h, which the
private CCU header already includes. Remove the duplicate definition and
update the comment describing the exported APB clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index 7056f293a8e0..8a07c27c77d5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -40,9 +40,8 @@
 #define CLK_PSI_AHB1_AHB2	24
 #define CLK_AHB3		25
 
-/* APB1 clock exported for PIO */
+/* APB1 and APB2 clocks exported for PIO and UART baud clocks */
 
-#define CLK_APB2		27
 #define CLK_MBUS		28
 
 /* All module clocks and bus gates are exported except DRAM */

-- 
2.53.0

