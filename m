Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45378403E9D
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219166; cv=none; b=sRYq+vXJv2eidForf1KmzAX/3yPWN1s7SLu+o5Tb+YIEMMBxNOavPqiTJy/AQF6IGTW4RjGiXRVhRJHxdFqEz/EfHnYXpVNtMi7zyREVsVS/CRHU80KJw50BA3d8PLMXaMWlg6dAmF1DPKvKYTfacYKXtNLFM5F0uTbdp5D3fwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219166; c=relaxed/simple;
	bh=Ov1XS8DApdBbDQSgMBsd28dUz5gN2fFzFBLSEH/vge0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gaf7/evly5CegTmVJ0qcvASW+1NnmIk64KzLxHH8OZa6y3g9PTQMCY5JayCpB56qxj7pzVL/dhLUfqxawdU8khy16cabYAT5SXVawCqztPr0dfCasn4CAfNVtjHc8pztJ5RZ+hEeuhmsZjhhZfra1CcUCX/dVskuWSldto9QuRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C33+DvCe; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C33+DvCe"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485ab7c382so488686b3a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219164; x=1788823964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwGUMrUw+0wrrc1iXCPReksjG2PETUZEO9vVz2JOI9I=;
        b=C33+DvCervdweT/hy5f/jxZFpS+V4bysQhf6NNB2Zsl8bcJYAxlx+ZSfR+lsjEhbL6
         iNc1wQp81YMogjS5+jbx0wwkavq3nWvpgKs68ue/GCzf4ujXBwWBGaV/giPNM41H/LSQ
         XHrpQ2loHPtURPxrWupm0/x0Iyp99b/UmgGigLj6wxR5UPE0IBmr9K9ZLz2lUhlWLTXY
         ZZU4CF+T/3TPJv5iSDNzzs9JqNC0zAIgLt5uWMgTqfZU3fMmHosnPCK8ucV6HUVWvYhm
         z3l9m3LDTMZrIAv7LFyAruPXb1VjP5xDa9E6+QiuMqYQ5/LyDoyFfA1S3RPndC9gEuJQ
         Jhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219164; x=1788823964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwGUMrUw+0wrrc1iXCPReksjG2PETUZEO9vVz2JOI9I=;
        b=UzMfcj4MDm0SR/6uk1aZMiSqBSSkpbJb4tYvywJegF0/thnDImEeYP+XZp/UaWUsBZ
         nDyxmF0nCo9Nwni7tSZhZO3SWkNMv8sBboWnAblNt8nQ8/LUVnXYtKwJfll/0dJIkkCc
         yDlb9Rmg1LcaI7tbUc12mp5bXZGmbtSO1FbPW73gaK892AWt9jwYw4Jd+uIOiUJQM/9C
         S5brzXEuZHJOKyfQHEesMSGsvGMMcic7YFxIpkzEhCUxJLpBfAN8z31h7MmR80eVzrgR
         bvqRRalXyvN3qdT6vgW0f6tVGypMSfhaI77CtT7LfMyoE9pD0QjPnnY17rYn9flu6EuN
         ykEA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/I7z+s4v9Ozw/zshF3z3uYtQ2lXKcWIo1sS2q7B7wcpSnzYkbsi/Ewiy6YZNJO9lx4A6LnZ4p0iB7@vger.kernel.org
X-Gm-Message-State: AFuF++nZ3PVdpbJ/JXc6MoOoVOT+A3yy34MFlBRXw3UnB85tVa0YBtj0
	pP1jA1Ta5YKl76AB0YGuIW13EvlD/Or8PKGWxYzx9ljdX5pPAdV68utU
X-Gm-Gg: AR+sD11YLMlqmSMS5UovpLMNXtKy+ORB+omvhxNCA1bwHR8y/i9frlaRcFsXHjRvANh
	da0eNbdxnka5MvqiiabZYillEuXh7W2IE3mQBe3ZNaokTK54TrBUG0gafhqTPrk+9PYz5gkDM5X
	JwbtsR0ZYxEx3UO8NhZdi7dKGZtW61oOX37ZeMqklubZaHJPC6uvpIQyybpg2S2fcbILsXXweS0
	hE3nSzUhqHi0nmFcQwtbfOMDhnkhOfLoVa9858PQQm4UXVQ91yEFK5lmX2efCKwmmhfiaxj6vaX
	/OK7anxaedUE0pura824dV/iB9cyb2Y8624s6gRpv4DK+vE/fRnXUqveYdZqzbbYMZ6zYXDNM9V
	LQWHq4pG4p70rU1P49T+X1MFdc+Y5NkfjJyxyfO6BF0z6CtT4Kat6s9yzQyIfr1XJ+ecrPWEC/Q
	+R9sQULK9JALeY5HeefE3z9BKIwjHjOh3ftri28u8OetgC+iKM/7QxDmzvnQs9JC/vm5m8BPZDQ
	GGPRmSIVg==
X-Received: by 2002:a05:6a00:7184:b0:848:3dbd:5cb0 with SMTP id d2e1a72fcca58-8562a9d1974mr17519520b3a.2.1788219164559;
        Mon, 31 Aug 2026 16:32:44 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be5ca747csm154393b3a.5.2026.08.31.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:32:44 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:02:10 +0530
Subject: [PATCH v4 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-davinci-spi-v4-1-92e9c0b2e1d4@gmail.com>
References: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
In-Reply-To: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219139; l=1130;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Ov1XS8DApdBbDQSgMBsd28dUz5gN2fFzFBLSEH/vge0=;
 b=RsRpTBLy3yqoifFU8DccNs4yKt7uU56pAIiuHzQJ3ZZRgfW1Q+CUuuf3yBQY9SEWIv+CIaKdA
 Xp+rIiEgzJgBysl95QtZif3vt6VyvLSBpPM09IPN9+JMtYL8uSlnw5W
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Property ti,davinci-spi-num-cs is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard num-cs
property instead. Use standard property num-cs instad of
davinci-spi-num-cs.

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..39a846d7f8a4 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
 };
 
 &spi0 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
 };
 
 &spi1 {
-       ti,davinci-spi-num-cs = <3>;
+	num-cs = <3>;
 };
 
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0

