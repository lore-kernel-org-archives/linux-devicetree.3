Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6502B3CCFD4
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347078; cv=none; b=Vhe0lH35WDpM+/cH7bdfv9moSBq+jG0SgvIY6RitdA6uySLnvxYtj1vhOzmoKsyMMtoMG2m7tu6q0VkJJ4XOyKVzfFQX7CegwSROVvHQixQz1NJgmd5Eg2742GuXFfGMmwtAG1tjs8OViQemkIWX2mSilMxec9YGpi8kEzAwM28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347078; c=relaxed/simple;
	bh=+qxk9YKyNyEiRkeW5Mgtu8HCNYz2EeeeSG35f/DmqEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DXnxe4IGjCpD3FBqvOEQ0ukhQSDbbqgFTW4iKXcMEeIMxK30lzyOl+MWZkqOWdFUbB5cXmrtfnxWDqOtfKJuWKwdayuyIyyv5u2vbYOZYnSue3NW6vBU0x7P+vp7RTaYInvzfXdeaVcQXggygbp71HIOWSj3QQ/IFFIJo9nQICM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDn48dsJ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDn48dsJ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7a4f9cf2b4eso65984937b3.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347069; x=1776951869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=fDn48dsJPQKBWfJCXLRzNLCQdvybuIC2gXn2uRFqAs5hAX4KrIUdsXcYV72VqJFgLY
         /nEjWzyCLmljGyR0SGhIWd6thkrMfJZQxzo+TZKHuEf7eN7QLlTTiv/L2bDHo6HgEcEt
         v1mkmw5ELq0W7hTbyA8QbFNPW5y7MAg9SdRPRP0mxqfAn8oW1Ec266rVOuTc4zN8ONOa
         LoFF9CAGUe8QPNBgP/qVpPpp2giALlc5XezBBsLWYHMprTFyuqM7BeNLgTRvGPNPbXBb
         /lwmdmKd/UFJtMjR3uWavjJyPFuYDsl4Gk/Z7Wea8QgEtHIFw8t4zp71YNKYrWfzedft
         C1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347069; x=1776951869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=tZZ6LI9K+KWQTuZGL+lNrlA1mnozbOTMUTsWGiKC9y6Ipbhvkigdbhp/notb4X1Cs9
         mt62F/jBoPnLdwqFE+KXIEk5G6Oknwv142k6Dh28CCFWXABUh4nsdRcyBSbGbnoXWR5j
         8Zctd+gLgH10YXS59t83HXqoOo6iN1npHe2Otgp7sIicPNnxVydv0wfYbMNj1AotNk5c
         WUQSAGgsJgB6R5SlqMoHpsSCRnh7X33n+MqPCU2MiU2YiaV9tF7DY/jfXiuwn4+ailZI
         bMnuySSmBdLf9UiXPE6OyfOv/g6TvvdEbKrXSbKyofufC+fT9wMenhCRmjb1wTSkT/jP
         zmuA==
X-Forwarded-Encrypted: i=1; AFNElJ9aP/laaLNcV1dWlfazMWpn+zBgSz7f/QVf2CwJCaol7HlqsOhzdcaCGZhkihyLb0yhwFyJMeaGGsPG@vger.kernel.org
X-Gm-Message-State: AOJu0YzFe5NGj2QHPcBsoscWt/NbgBfByXtW6iTT6IVSOBC1b0coe8zG
	vmSaZqnVJLlGTiomLZ7sk51wg0HwfAgmKELxufmmuCZFcztyYm4757Wp
X-Gm-Gg: AeBDieuEBUkEadNia+u1EW57hZnORblbE6Y6AT0ECsaIc3fq1nmIZ5knvq40LZx2wIP
	YADt3prK6+5B+rv54Do2RfQi4RfbFJaWGUP/kb0JASsH1IczduGbWU8mDAAsfGCNeU/f2265o1e
	HtkzRFIokcIzitIx9ndrUnhDWEC1fpG++ZtNSp5IMfIhIx+6PQqBmM/c+Q3r2+29g25AcL57xis
	s/j2mEhW6oQQ++ML4Q18PoGG7gnOeQFcT0JttsNsky2SsEbRiJBO42FB7oX0QWaajNkWfEH6SAt
	ds3zg2cB/IZBWU892cQ98kqIY4zlm4eZ5U1XUDLoUEmphEZRGZTUv6gq5SFrYGNEXc2IBRGkP8B
	sTZm7DjvBMJDC9PObwJmw3rn6FAln4WAko0tcYk8F1/E03HjGJOq3rR87aNJJQBRy5guGJywH+K
	gc0GizAu8lpQVyPnLAjGcoqtvJdA==
X-Received: by 2002:a05:690c:6b01:b0:7b2:7dc9:35eb with SMTP id 00721157ae682-7b27dd88a12mr158996207b3.50.1776347069632;
        Thu, 16 Apr 2026 06:44:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:52 +0300
Subject: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
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
2.53.0

