Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90062263F34
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017580; cv=none; b=oUCTHpZbVMbXk7UdpPYb/kzNXViNh8vQFM2ahtw2y8cBgSZewpXrErzExLhwMRnkZFnEP6aYVCnh0ueFtNcsdUeKR0YsawQW3awGtoEPhSbktq4JJnQsU1gmloDJJycu/YeUqs97nrQO2PgciReVOqk+D0G/t26kBbePD+lTrcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017580; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKV5FzBgMklLUV+/8vy7Y/zPmgdA2XOH+z1/VQMSQ+iNAzWOWfa0JQRWScgr1SIvHpMXa2B6q7wg/FR2su2C2xpZPP0WFQ+Tntv+s9A6FEY43xi2anad5d5IOICnTpaRG2G5vFCPw+n3ggTnmK//D/F5+NNINa31GVCQm0ZdkcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNOfQYUG; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNOfQYUG"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a60975dc5so62521707b3.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017579; x=1778622379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=oNOfQYUGlkdShswceSkeqF7C0jATaSb/VNCd4PK1bFq5KhY5U1iEdnZMGRcmyTMpZO
         7badLoPgphqJccfEvdu9C6gAhznj37ZmkO9HM13q0MNYI88Hd2SKlsr8YsiC0SeSsRNS
         Yymz2d0fiTqCMaUUP/bY933ybZ5PXBOV9fAj6kLomlft+NfE2sy29enuDJbsG2Er9MUf
         X/JScuRIZVMk5FOzvkLSqdf4j8ln8WWiPBENYv0uPQNUc7+EI84St5nDGcfyIIfTzuqj
         P4xaXpvDNvdZCTPJrmuMTokK7maru5LdLgeE2smnvpnsuffYTujM15RnGkKY1x9N/v4z
         bUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017579; x=1778622379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=I6EZOJJv0KBC8LbxtQJq/BWb5xGZAhRIOM9GcZqwYLpXzsFehYqtrvretPPG/UEFy7
         rIcCX2v8fH89F95Tofq6xvWUkRYPGwFNlkV6hJLbikKzGOfTcsawBI/MFcnOx5Q/rIw4
         /XHxq1q7PEaD9r9qA467umGDcItp+ywuBrz7Qe//qX5SaxFrQQVEiofFRbmokcwQYZL6
         tjgmDFZmxXI4E/VBUdSJMf6pglYIQBS2+Bi4zI9b7eGt7QkXcJ+1wDBgpMAjV7DlI/QX
         s7Mcreo/qEUsjDbhF1B6VndPmuYnKFFXjbaxWgCAceYsl3mlsiHAOfGujtGasBvxoRuS
         hOjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5dXDVSlKYsxY31ThZGiUkUqlyIyxcp13CARvkoSY2cAbiQxQ7bPSuYFg2vdP2aaVjHVlCgfzqjLc1@vger.kernel.org
X-Gm-Message-State: AOJu0YxzKZ9VsUJg9lLiP7mGYeJcpzWDVoGICDKVcibaxkztNLIB5nxZ
	FxEqrfQ473FWLRXFpIbZrtKVaYK5yuWmXsBY6F5R9CS+wPNLi2axeAll
X-Gm-Gg: AeBDieu/7Q0GUv0Tg78DiRRENzrVgMU7VBxFcHEhCvRzCcuH+uFA8DYtcIBtpw+Ft1O
	vHALo5egl7Lk3ONR1ScTcCwTPi3h8tEMVJE4Ueatb261+XF4Jl+tygtlBQ89qCg7NjwKeOLhn1F
	9BCYVx2Fq6A+4RlUcRDCT19/HCGyxzyT00KpgqPZBPmxQk4mQkSapBkRMDqAxUg2sHqKMtd2k2h
	mmHVFltA5Uo1BLPm5tqoQKxIL7YpMoOUKZe2cTdkV4NvVzZI4bN4CXLGg0OMFgg3iclTN1j5Z+3
	mR4xPX3nxpmj9tR2XTKJXYzXb/f69uEHvJO1WelkFA6o2tgFeumOl+zM1T2/BJ+rktSHSrE8LP1
	SSyriBzl9fFlcrSwW2VwsmaoVdhaapQHXYAvBBM/yrimrKHuJJnzglL+L18EICztpgh7vpyNQPg
	/wEeSc/zKl3Vlcw6M6V4ruGmSR3vav1x6OG1LC
X-Received: by 2002:a05:690c:b9b:b0:7bd:a50c:454c with SMTP id 00721157ae682-7bdf5e032e2mr12769457b3.19.1778017578724;
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:43 +0300
Subject: [PATCH v4 6/9] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-6-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
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

