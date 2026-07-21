Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AF47B425
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628686; cv=none; b=cFoz5QkuLmieXYq3ht0Tdy3wjnMjou5T4pFGZgE0XMPEC/vTADQVmBLIZN/z321bN0OFSoxSj9tWEYJ2gcjyxsQ4JqOlQqLWTydknM431UnjKdWt7oByRRIe7r3ltK0rQIoIrru5EMcr2JUpukVOxz/WHbVfUbt6oDXCpHdOy5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628686; c=relaxed/simple;
	bh=gXNJqaf+zTctXL5WLgdpGYeFG2qxNG2Vh2hV85r/k1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IB6837v/4b92uWQlH2AfNmikFbAQUtCnjjHWLf+5wtYbVFn2tApxNsBMTcivIsL4DTXQgD7AVFAGAZY0anu+VxzF5HEAnlTTbJwJTwzRnfbFgG99JPdevWqi5Qay4HWs1tvLjqZVHlGccvKPPesInZADLeHzCcoz/RcZgXiovnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svj53zPm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svj53zPm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49550ec592cso14027915e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628681; x=1785233481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=svj53zPmGgsQQomAM3SKz6UktBhgsIGXco8OB9gm3mNaz6nHxY40tQ4guxNVLTpfQe
         H0lTG50dg3E32tm8/migoqNTnthSUTkzMfyFMBPvKL1xd8ox3XaXEiIIBhsL2lOzEGGX
         ty1dmNwyXK8Pt7v7pgIv08r2ReTQcWJFs6IlfjQqukmMG+eEyb1R6SYVnk8eW/H1mfJH
         9VzXYOYQAGOj8lIX2MdOyWzpdGQRsDRjEwAxnDRLSUt6mvfHgoe8RLi3EYO5hvvKlDBP
         w2UtU/DWmqJJ+7dJDXkdlvzbedwhAkh25lx1PyHT9edwH8el8J+wA5llqtcIUUdDuKpd
         TqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628681; x=1785233481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=XVNT9QSQtnEwid9mswMgbWNnLzz+7lcP2rxCqiLhefsNjhDnLCK83UeGmf+fbw9EV9
         jqjI1NbRCW/bLF+u26aO4i3GCWQLwaksaRUQkuoPbS0YyiVimjEgtKAyTky4ytKUqWP7
         qKoD/6/iTJDHh1o9cCvou/zcK94ic6OREJ/J6mHQagIkAfoaPqoXcTSNaU4icm+hyKEA
         1FstJRlu8R8Fp0Sr5W+oxhBr8mJh9dDXfU/HTBePzpUsXSGbo4Xg3z7+s0QzLctSijSq
         EyXi5SwQWfB6tcwKxaBZrWsn2+oJmk572vgUkbOqbxu+YGcM4zKH6yLWiHpCubsFeOZ8
         LjDQ==
X-Gm-Message-State: AOJu0YxZNNkvrADnpP2LcHsU4Qx4I5/7nxIIObZqWN96wCUHyKrWWf3r
	8O1QvCo3DxwAuJQHRh3SEzh3J0cQDG+OwiU0cSYoOtqG2G7LtuMgkOJp
X-Gm-Gg: AfdE7ckej2jpwGTHw+iOphGVGZ/ubMZrs1m93z12Cqrr7pGeuqZXKIE38dYgEETZ5tt
	c1wonEqRk5hsuLHlNWHNfoenoHq/ZWrgU307H9mRvcTOA58QaRte0xCpxwfZh9tSWw6htaNsWfQ
	otjiuQYYOBB/5y0V2Ljly4zhTysKVyL6wFxZOp0oWFnhIHyazrIYg6SVrp7vD4rOKisRkOm24Rd
	FG3NUrXKVt8Krh2iq0F8LLq3+KFa/2+1xkD9WHu1fnCBILnE4TmE/XOhOD+JHD87Kw5+3et1rSu
	rNZRDbRX8sGiUCbimoQcV0jWLn3DX19RqyJdQZyS8aw/LgM2VBKIcKAolEHi3eTL/GxrqXJlSXM
	pquqP+Vo2A7pbBMXDaqzJYJYJTwBrcLtVOyCbzcNk/B25QT6JtQj7CS60M3gtI3l8ZBL6ROFa3L
	Aaj3jxwDdn8F5Y7tHhNv5ZDdg=
X-Received: by 2002:a05:600c:3b0a:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-49560319f6dmr71655465e9.19.1784628681221;
        Tue, 21 Jul 2026 03:11:21 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] ARM: tegra: tf701t: Add chosen node
Date: Tue, 21 Jul 2026 13:10:59 +0300
Message-ID: <20260721101059.451699-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add chosen node since some bootloaders may require it and add stdout link
to UART-D to simplify getting kernel log via console.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 0d182fa5c1af2..1b9839a855610 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -26,6 +26,10 @@ aliases {
 		serial2 = &uartb; /* GPS */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
-- 
2.53.0

