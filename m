Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F8466B57
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054688; cv=none; b=cDw9WK65LRnp0TWAqtNFN0bDzVf/+9Gx7CnZ+bWMyTvyz1qxQPE6lKGhVb6I4geThIvjHLuDPrz19N36nfoUFJFUKScVkn2JBTIqduXYsYoceB/V4IG0sH5fVdeUQCLziudGtnta7jUguVBO0JnUMaIcMq+dU9FUqCddPP8Y3jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054688; c=relaxed/simple;
	bh=TrTvDfFn/k4uiEHyffaC4IKdjtst9K0k0gvyN6WQHvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jgcxi+EipWHzJoN9uYrkxBbyR+BB3+/EAu2Exsjq28QUbYT4aGkBTQ5FaLm81GVOJDNU+unS/OYPxXIPUQHK+Uec14AIdzrc+UEKjz1TtqKapqX6J+XFuWnQUsd9eaL9pGTBJ0lKLc81a0A+9xC3eTlLhso7TOBS1mLfRwjvPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNjk8dot; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNjk8dot"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso53884615e9.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054685; x=1789659485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=eNjk8dotC2zNygLiLkoqaC1/F21YVPqPHJHri4Clxe00kg3KOtuzT5ngZnS10DXAYM
         x0J+tvQvA/B0m/K80cd4wX5sokAj+A9BgRy9pJ5W8dKqrG2aerK+0Yuxex9bkPUJcE7Y
         nmHzlh21oRPpyhHgi/uLKXiWNyZ8W+rpKyyODb8WjJRtuZoawwahyoy41fVWv8FIzgWr
         GTnDscyMF6pR4gue/gTcZwP9cHmbwUAVW1hhY9NCwhvQBG13aGP3JVTD67g2ppCCEL9S
         Nzp8Z1/2M1lA7DCxWIkH5O2owpZinPBl41uYSClGq0/08o7GgMdHQq/MZfBvBfsWWb8e
         NVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054685; x=1789659485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=lUuGPLAVk39H13dA+mjk8qDewqBLRWSZgNsOcYgmkQmAZyxL31mUqcBGp2tOUny70y
         jNDUV2apGpQkDAcUzGcHO8J+sJupIbnFdVDkvNGLzIiB+EkyTMvR/vAOKmieQc2vJJ2x
         iR65JGb8NSYLZmb2V+SIFyqOIpLxH2F/2n6Xp1QM/SHCvpmtYOdwzpgjZhp7COnfQsSc
         AiEHEOx/ckbbLRRQeXRxoAhX4XJ9XsRtMvlvKAlg6v8qxFfcdXCDooBOkmtRrCbjNCpL
         EAiVgxHTKcxKOG0BePWFXCHC86yGVAwoasKxkqvxXjn3Wnw/nLiVLK/U8DmchQj3Uz6N
         0sBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXv6FFyBQckRCbopWMNFNfjeSNX9n0A2CU7g/8VFevojJvmCGgvODKJ5mPKviKYO/oBwp+GlH+Wjj1@vger.kernel.org
X-Gm-Message-State: AFuF++k3rbRhvoApp00nQJ2rfpC3TZeoT6AeTCkkpTbOzf/DhrVHpzpc
	BZ9Hz80gD0avIs1NIep0n/UjcoODq5OGUt72JNKSqBXZffCAqxi9erf1
X-Gm-Gg: AYBFou3hlmN/b5hUXemwdjJwPDtw/CCJ7rh+mxpgK7QNVtSaj0bWfqtCcJj89S9evRG
	4CcZ2ff29BE600w0gnBbtH7Rk7lIrmx/th32gWT0PmdulaMUJLjm1dRBgqXYOvNw7Tvu8Dhf3R/
	W4MmYFimYzorHeafkoOZYi0sH2O+583Q5wB0JbgSYzDf/4s1Pp42UQgL6jf1/iPjo6NrNP/x1v6
	OGOVLlviKsMlamvx1CH30Xlzrfzy/z1R5Jp+T1tNv1/LDvIsNKSAkOj+/SzLIGstRchzQvfu7Gd
	3kJJQDvzlwVd+BtiUiAV7qolOomIorrl6Yb1SJexgsZLvDVj9xrO4fQIzU6JhWbzNejP1wiHRGn
	gNc5AIsfZqyaNuqqROETrj3FYxc5AvGYFQR4gryE3KX13jQNMErTkpDc8gfmN40yYLhqWD0lXly
	rIF6visDsuft2q33n46YwazwS/GCwBYITWNVmsQKdhAGAKIb04zZxx6lV2vFKtQywTigOc3R0ve
	vRylP5W6Z67Kc3/QXJBJOnZpuuhvRzHNkZNK6Y9krs11KtZh7hm2Rw7k4APgiY/HD3K5AXsmA==
X-Received: by 2002:a05:600c:c4a7:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cf823d0dcmr440541835e9.8.1789054684861;
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:57 +0200
Subject: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-1-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

-- 
2.43.0

