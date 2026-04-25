Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED05437881B
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141892; cv=none; b=u80vEByK65N7AWhpL9u/UENhcY0ZjjPoXaowUXYiDsuJGj48zm7QH3dpd0Z4hMTn6DkY9etPQJzz5mJes2Q15FkvHGheKrbygWBPrG7TIheXcwOgSFjU/xz1Pl+5mJDV/8qEWhX0716/A5g53JoqIrhZczid3EMWzRyN1wahDO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141892; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzVcKtmhNPmUFR8aBWW1upBzm17JSI2u27aHr5EZabJo6SgCjf3sbO2lYtPXroGElQeahI3hnJzrcw2zFUeJtr9vk+LJM68l74gKCvQ+5l764q0EHjPuV1nqk852TjpGFQZ3wF2h6k4VgOaxVUopLX0bAF6Yl7wU0arnUnmYNoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3bWBZMS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3bWBZMS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so74042435e9.2
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141889; x=1777746689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=Y3bWBZMS/mcFFkGD36D5wZookWEBsU/W7RzuCuJG1bTN/LngYLXZtRhJ6jEnioAfRd
         QPGWsOK8FPte1RMcqLeHyhHsfubHgWB8fe8PLfap5P162//Cvk+l4QqcSsU0AYqIgvxj
         hxOAM8sQEBtcxcZSDc9pBY/ARDoNELA74e/684bWDsFUwBJrQAA1TdbWsd/OeEQjYfLH
         MOQv1JBi6hK2xTwv2kl5H9Ko7mn1A8OStDJ6mEFuQdZWdOl5fGVOvM8vCKb0iRRK1vqL
         Bg3emTp1LE6TG4WUrJPfkgIZ6fJN0FHKLMgfGDYMpeM8UYV1r5c60+HVXB7hFEsLptIv
         18wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141889; x=1777746689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=lG/+yHWx1sFch/AVsH7s1V+vU28alqSA12NqTtbfNc0czjcvehIXjb4PZnf4eScAxx
         wZKl6zFO6kb3lwd08D4W01DQW+SK+HWLlXxzEa4eTCrMxzG3/L8RDPDh/1nU6ZsmIO9d
         I2Snpv+kWQd8OIL28J2UuMhwqUjfwPFes0Q7YY9M6TP+kxdo631Dp+6/ispZH3D6gkhn
         YNBkLTVEznLbCMn8nsiRqVoQZvseYlNgMcD2rinwsxGqFlTZtwLY4eIrq8MMuZpeXDTN
         dVdyHhYiH3gAIuL2XuM3ksDp4+Y+FPlir7Sq49ZUmaEaUzAkB9IJSDyevhiltqwFc9a5
         G3Kg==
X-Forwarded-Encrypted: i=1; AFNElJ88kSlEeUbTmJfVxXawyyebELnpJ2tNrHW5NewK9bViMMVPMfyStXnE5pP+jq4LKtQ0Q9DqFXE+K6Rg@vger.kernel.org
X-Gm-Message-State: AOJu0YxQucOZC6R59pOfvPnnmK/USkxVPXi4hDUsDvdQUdEEzBBPfzcb
	PvTclWmrSKcBmxW9iqp0/5VkuPW3OZBxzDw/9DpYCxhFzWmFvvch0YTl
X-Gm-Gg: AeBDieu6DrzUIXMG596Y2uAJMOZjuw68ew0U3HOHzZjwfgiCuiT88ZcYjtU2SaiBue0
	698ZSneYWwah/0C1NSmQXAqnI3xeCzTzBLGtkyT4l5C3bI27HnIAOJUFEZJkWHyfbNo7Ir0i366
	H1UEVf0EvcHu87qj0slm5Kt+Gk5PPvwsJWncoS13lE/YbsiQJmYk5hoZbxK+cfs+jF7kkU3moHC
	NXHBGqGZLJs7ecpJiQBipKfcKh8TsRjm/1cpBQuDZtSy4OrXNtd1kDMuDk8VKz4NhM27K7flsiX
	jFfgj9UvmMhqDggLLeJeZpJut0XJzpr2/VHxLX1ESrddGbCoNV0jcjsL0aV3bQEdXw7Vs05Tm0j
	TGm9IhNaBca+hJ81BECGxJo2h7KFFf9RiWxENWpem3NNHGZmcAdoxizvXzmexV3Ic6gxKlq8jU0
	m3R/rP3i0rD4Xk5oZ+RjszgKmUFnqxG8DFfw0=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr512182135e9.18.1777141889423;
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:07 +0300
Subject: [PATCH RFC v2 06/11] arm64: dts: qcom: msm8939-asus-z00t: add
 Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-6-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

