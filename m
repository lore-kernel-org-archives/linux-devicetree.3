Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B1F447256
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182734; cv=none; b=YfdG+bfi0ek+ycLH958fxHqaR8PzvAG0bXWZ/oWNvytA0bgQ9VdOB8A0ttBHNjFz8L+k1VTc6/ggi/6w0T9VLdJHtVRxkPzVrcybySmxETau9RVPkgXqIZ8ELfCmmqJnZEvhnLgN7XTphLfEBfggPv3wBYlAmBOkX58ucDjoTgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182734; c=relaxed/simple;
	bh=yoP7TPV3CfSEpC5ggJdNPW/TQcphN1bT3N/Au7vURZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chgOLJY7rGpu98yTmx6qs2OkwUXhxdrACVA6USlU1xlsqlsGPAf/TGr47dYfB5TUU0f8SYGG4xb+AoJD4ttWzCvvAoi84Sk5rv4QFvEsMdwGLhzZxmGuuozep+M20/cyKNbV8cv8gfCGF2DwDYdjjkIQSG2nKVTgAYEiqluwa0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjxRRMLI; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjxRRMLI"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so899198eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792182727; x=1792787527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2QKXRBmpYUkyqYMuIECl7wkBgS4oNFS7MDH6jop3jQ=;
        b=SjxRRMLIm1RtJTMPb+bC0sALCx68fKvL25ciFQaXXd9kCeyrZcwhqoCXFHYeluFB2W
         03f0lxQ9jB03WwzbDE5Hdo7oQdpB2cJFpBSiZnXx0dN+ZxyUNyEFp814yNbTA4VpSwbi
         FKbPXPTk+UDvLfqVhScWo2GNPtf+4HXOMzGJbu3iMkCFrRqqB+z3v5bK7S6ajDtrDVyP
         NWzHeLhWuBcSUzWvi8ujaqz7jyHmMRwMAn0L/Cx6CcDoSo0q3sAstF3/P33CjmgS5u/2
         tw6qQAoXTPCB9piZpQdMbTCJC/HWuU7q/3IDaE1yoAw8IsKTGLwU2ugdaahiUxWvq2aB
         Yj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182727; x=1792787527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2QKXRBmpYUkyqYMuIECl7wkBgS4oNFS7MDH6jop3jQ=;
        b=QONX7mVuevrDfcBnkm9lSysTmPr7/fZrQ3sRdeUAmM238QAgG4TYdinhfecm8CwKzY
         xTyiZKS3IJWqPg5R9UPtoj165ZvyWAVi3EKP90iN/EyzjYr7uQlJ14Yjk9RjpUyAs8K2
         8sfwn4JKc6xDCEjCfvcoDie7zW6r4fodfFEUpCFvj330FzYSNUaQWnuiIXedXiVyXaan
         36qMbITNMSovZ6WsXmAnGKtaf9h/dYSR99S6KYxpm8EiUmNAN/16ZgfboeTbHgS+3SUF
         xN4L9TJc/Ud0oXAQmMGXUkB5yofzB2tJyeYr8DmyhffpYsmjEsmFA/uJHX+U49WhHqXY
         vuZQ==
X-Forwarded-Encrypted: i=1; AKwUvByNbspzg2Yvu1gLtXBrR8AFrgu49U9+yM0AX7d0sOI+DYdYpqeSNsUBHBvhS3LF/TKkzJzXrJNUwjgj@vger.kernel.org
X-Gm-Message-State: AFq9FYLi8UFXLL1tPtgl+3L+zFk1bCc97Hfi23cqkCoc64ewHkKYOnEW
	RAzZJD3yNBM8Wgpuiq31uAq29j48kPim7HXSKp1Iz2A4eTwvJZeDKOnf
X-Gm-Gg: AYBFou0T/FeIEjXa69fZuaGPr90Mlrbm+eS3RkPF1q6yqybRHJD/tiGR9BsZhzwn5He
	Vka5rmex1oRqA6751ZN+GjtYJnwDRS3Xd+l9X2k5Bc8s1f+rlmWyfgYppAw9ctgQ39ZyrrOLakE
	fJrXzi+TJMGf9i/d6/pWcUQ2aikcj7xnspYgERJWAGIqXkz2nXdmBWVcMXP8eT1uT3KhMbojZOt
	7z+hbOD4JcYgcWorUf/i8gFPteWTEoSoTq4c6Nzf9NXkYv31A1n6T7WVxcFEUXa29efqN/N7WLN
	usLxWotSLb09EajezcEuunDSHGE3dTgLQ/r/Xa4gHYDpNBlswFMjm5dzATFwrEDI4446WQrgEu+
	2oMPl9iIPEoTnec4zzJGK3zg7qa2U601jw7X4gUhCNX8fkoFXoxgkkY7gKdFjT8tPnxK3U8ivsK
	OCfCrMMdmI1vmYjWOI+FWdr7XDdHQTFBjOlPqu/rvzH+q5qGZdcvMxjwi2Nc467Ux80lOnmb9sx
	KhYE0T/lfwREeQsSUVzxYERP9cXx6Qrie26ZLzTQg/EzEvj
X-Received: by 2002:a05:7301:2710:b0:360:b8b4:840a with SMTP id 5a478bee46e88-361a2747820mr1223282eec.39.1792182726979;
        Fri, 16 Oct 2026 13:32:06 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm8351620eec.26.2026.10.16.13.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:32:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: input: ti,ads7843: Allow SPI clock polarity
Date: Fri, 16 Oct 2026 17:31:31 -0300
Message-ID: <20261016203131.454640-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx27-eukrea-mbimxsd27-baseboard passes 'spi-cpol' in the ads7846
touchscreen node, which causes the following dt-schema warning:

  imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0 (ti,ads7846):
    Unevaluated properties are not allowed (spi-cpol was unexpected)

Allow spi-cpol so the binding describes the existing configuration
without changing its SPI mode.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/input/touchscreen/ti,ads7843.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
index 1b58fc263dce..24172d206d6d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -32,6 +32,8 @@ properties:
     description:
       GPIO handle describing the pin the !PENIRQ line is connected to.
 
+  spi-cpol: true
+
   vcc-supply:
     description:
       A regulator node for the supply voltage.
-- 
2.43.0

