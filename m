Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C044D6A1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917827; cv=none; b=cmnSggpLMX4qSmqgTOw++RpdNNhGp3Q2p/TQU2uhNQQ2oazKCS+yqdDj7+425dN314KHQSTlzq8cgY1eJnOs1AA6lA4oUtrGuWFoK+Z40449vqjca2gZphcHlczXLgMOgz1pv5OsunD4xgDPlJQL0/civPD7LUemQtUm1o3BHNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917827; c=relaxed/simple;
	bh=VT2WkLbrVHZk/VBbTj+r4ElGw6wpo4atU2roVry+mzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=At8Jy1JxPBS0spQCjHOUjOSyjCkjokeZxWMV3DcwXCDZ1Q00V7EyhP21MkBoKkMXT7K/R5+vqCEILZLwugAOQD5W9BZmMRkojtrzWXZIgIYUlgzUjnMR+CT5/+82V7S1unbNvhYCNXjnBmk2rXDnEeHxw+zgtSD7ing6F+5OS8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RljqhWTK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RljqhWTK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f707e5d75so554025f8f.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784917824; x=1785522624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHSgNIqpIGMGCDb/vwfax9xQeZ/i97RAydBRvL1DXus=;
        b=RljqhWTKE2xG8Z5KhWFe0sKd1GJFSLNYTQWJcfqGH+Ez0ZX4Vu3VPhHWjKb9kvSnoP
         F4RJgji9sY/ELKj6fyMm7S48qd9h5IVuuUuVYrBDH58hsa0oE7z+41wAfeUBRIHU1jkK
         3ah8hIHz4Lh+l/NfSnDVHfkQ/4zchze1qFmdmMcXJl9Jcr5c9o1AR2d9qoCifDGVse6z
         Ah60VPwLeVp7tHDVhWNuMHqPO7nXDMb4t746JFpvsWgHC5c4VxRbSfSvXHmMaPgI2PMj
         upx3fXxK6HPmf+WRbTHM4K3ScDzW4CPRgfcCAJAPdNYbN98L5XX+IqOB7GKxmNSUwqkV
         FM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917824; x=1785522624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHSgNIqpIGMGCDb/vwfax9xQeZ/i97RAydBRvL1DXus=;
        b=TzSRxYJVT7Xa7pyNplyQt3yzb5zyxQdZo8Y3YdEzSMh6AQhNcNBVmYEARkbrm2e47y
         z9tvTiv8gb9Y1xTcv9SFU16EwKSLhLi0WiDmY8ynz/X2XEOfiKRyAz8wBJRI0CvugAOs
         a+RtpS8R3sks6Y0wiDQ0iucM0f+T9ELoA3JwUpkwSYuv61/TIEM7cEA8NTXwsWEgz4H9
         Qg7TrAiXCD2k3xrD2Bebeh3NL6AK7gMnNqBmRkfqJeYSHQM52d8tnai15XquFOOCztyM
         5FWMLSEpQo1nCr8swvHgTRRJYsnGMKB1tOGnwBH9Lb8iHfu+EmImJoDE8jJMdvqHgz1G
         poXg==
X-Forwarded-Encrypted: i=1; AHgh+RqUKzBpW1GMiNqWEn9uCRiMw5VlcLacFq2gSPPXYTPt1Sy4JWL5PmKmhMulqqKidkby4zCL2HVb1gNl@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/Jle3eEW7InBA4n+e9zE/ZsOaIpsg+kqnMtdXH3eTQbPpM8a
	jDrZdTSZYlIhIK8hhasVAbgOeCfLDl9tTjWsmAjK14jkjQkw95Kc+c+N
X-Gm-Gg: AR+sD106CQ9r6pl29EMj8AsxWdm1xLThRAmO8WEa2zx/bb4qmTvlEVvX5PKecVHQ33S
	zh+/k/3iKL7e01sKxKQIvIYzRmSPCr4kDlz80GhQRjfmF93Obzp0NdD85RgwEn2yGefRi6dJG6q
	L8VMyp+kmyuynGgUkUOL/YFkXIVbaJS2ffghj9HXJcbI171e26F4Pr0WKLrWhhmKI3tr7mJyiJf
	f33ui3LCFXxd7//djFcZhtju6ayjU/IQpgJE5UtnNbLD2Hl0oJ5aS+ODhZr99vpvcd90c6BsbtX
	qsR7fGSrDLLn2vgBV4Fgc2/3dwqD0klMRaDmv4b6v9dKwNLjwBqsTW2NYs4HRJl1LMEsnRJg2qM
	ZLiE8FchH/6+4R+jomOIqnZZwj4EYKnB+mVbqz3JBxKv3IMQZLXGpmo+jC9BG/0fifRFkLuo3WM
	1lX8osra+yALB7VWGbH0ptdod2T9KdAQPa4B3trKDV50gmkJtsXENwuXImZN4ZWuSIThaLHQuCE
	+Q=
X-Received: by 2002:a05:6000:2993:20b0:47f:52e9:3716 with SMTP id ffacd0b85a97d-47f8dcae427mr8922729f8f.44.1784917823418;
        Fri, 24 Jul 2026 11:30:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm26396571f8f.24.2026.07.24.11.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:30:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Jacques Nilo <jnilo@free.fr>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Gerhard Engleder <eg@keba.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: serial: 8250: Add Airoha compatibles
Date: Fri, 24 Jul 2026 20:30:05 +0200
Message-ID: <20260724183007.188172-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724183007.188172-1-ansuelsmth@gmail.com>
References: <20260724183007.188172-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benjamin Larsson <benjamin.larsson@genexis.eu>

The Airoha SoC family have a mostly 16550-compatible UART
and High-Speed UART hardware with the exception of custom
baud rate settings register.

Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..b6f7e093d8d7 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -110,6 +110,11 @@ properties:
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
+      - const: airoha,en7523-uart
+      - items:
+          - const: airoha,an7581-uart
+          - const: airoha,en7523-uart
+      - const: airoha,an7581-hsuart
       - const: nvidia,tegra20-uart
       - const: nxp,lpc3220-uart
       - items:
-- 
2.53.0

