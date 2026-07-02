Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275E380FE0
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028889; cv=none; b=JoeP7EOVkqMYwo/96sVsPhuBzFfuKC1Ejkmbfdi1frXL++oJ1CbZr/KyfXkFzSf5q4ksFZGUDNI0d3u5Baj9N8YaAuJacbChacV0/hDCS1Nb6plQ0tIjqqw7TaPTcKDHexQkOqgn5KSuimXJVy2frDyv1Wi+6bOKT+5uUzyVycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028889; c=relaxed/simple;
	bh=+HAMBaZcdBrjRhj9S5KxkVE10MrfH1DGewIu3JXAVXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2JkUePnIT1FIbm4pqfpNyevM4KnguVhCaqO5Bt0Hb7b9PhBW1DNYM4qLV0F0kC9G1pYjked1qxdqm2oKOpjS8F0gls0iTXjCSzUytmVEsMvXyRL33hFe7ZeXvibegBdgVD/8aYhns/rbdm3Xqk1HFt+I4ZOXtoBlK+sPlkapoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jva85NTY; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jva85NTY"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664dd23829eso2263068d50.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028887; x=1783633687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=jva85NTYn72I8reMdrUtXzNicXkZmtnAg0mafYfOEzfmWnn/c/qQFs46HE0T9E/4WR
         FmUxI25Hu10hJ/NVqtI6snaWrmBDljSIXa5ye95stsA9hXDsZGwCH3/80xgA4Tb25bpw
         NAW+cBotNphjdyezdidsAGQCW9AU//G3TjVorAG78vM/b8wiMJZPLdw/b5iwLsPVfEQi
         izVKJcXswpFk/lF7ZLMXbyBYC9Hm/RnJ99DYqJAyV8LnjAvMM+KHuRJLnCshyrUer7td
         6t6e5CRdA7qVXO4Af3Xpip5absVYRlFSe528g3YV2w0WssfUQT+ctYAsDJ0haatIsVg1
         tUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028887; x=1783633687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=Zj2Wig9x113svWpP5S/ZYcIYInckBWa4FQIlz2x5JFhpw7zKrzMDippk/rP5/Yfu/x
         39QW8hZZW/9O20NEYPca1yb336DH0MPhx/p59bEpB7z+PlWK+jXYu+VBC0LthNFQA4cK
         iBWMS+4rfPjtjhiMDFT0Dbo7ULCeAxSVa4SEUxhTokrgLNDQ/MHZpT9YuhuEFsJ+jHi0
         JOPz4o7CReUypH7nTmh0CbI1Kyo+5UhLr6KKry7gXjGMVrN8Vwrx5MjAXvx5sk7CySsM
         Kc53V0ddAl9GsV0RO13a90NIB382nYscv+EhFdLOvkWYFfxGNb2fdprmBztwx8EzFu+y
         jKXw==
X-Forwarded-Encrypted: i=1; AHgh+Rrc9hPBNtvDSleMaHF3fijEph22o4SxfqacmzF4L7kLDCSeKOQ43h3F08P6XZzV9EQC/5fnW47ohMVN@vger.kernel.org
X-Gm-Message-State: AOJu0YxM7mmWd2THRXJWjJ5EzmKk0eGBUmMO+J+weVXFNkYc9zairE0f
	n+8NtH1ZtZ+Vd8mbBgKTA6X60faue4D+nYFO5GbkqKjQxxWgdYQuqIUO
X-Gm-Gg: AfdE7cmhSfjtPZWr5eCeeJvEDewq+ORsVDXeWGTGi4yUi7SQzFj1pemJQHrbS56Bo6z
	C4vwLaFOHvJiTfljoXCfYLi8ND0/WAD3xVE7Wl/hEP7BJzWVRNL2+t70TZU/jyEENmxhKcw1MC0
	8+SxhcI8JxPwQlKI2djnFItgEMWgQU9qBf37IdDFXjcxeIl82/jY9d2a/NQ7UcrcqRH19XakUc4
	3DXK5p/oatCccl5yn1rpZIJz5GABa9dIHfI2vbTD2tHLrY8lGLp6K3BNRSqw7DrSIPYkCsq2LtI
	dz6ApbO28e5quks4LJQlY2fFjrVt1sViLUfA2Jou0b7XW35RiWVDZyiO1pjLjzxm6fmPE+Eb2/O
	Yq/0uV+GWO5cPWx7gwjSq4JQU1JNIBdhzNPBqF1E3UeteBTIMcu5hd0jFGIIf+csNpfMqgTGTiW
	S1bav57JJvVlgsktZpcvePvF4Fm53uuAY/xrYSmEaEMDzCL1Y=
X-Received: by 2002:a05:690e:440c:b0:664:a0c8:f956 with SMTP id 956f58d0204a3-665916762d3mr4471470d50.15.1783028886926;
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Thu,  2 Jul 2026 17:47:50 -0400
Message-ID: <20260702214750.3428694-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..de2bdc21c781 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,10 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

