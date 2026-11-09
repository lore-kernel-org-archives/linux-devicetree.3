Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184451;
	b=P248aHGsssOFg03FMyQuwVvDNoJMRIhe8EC73feV69zzPfXv/wsk/F55g2HfhspIR74c
	 SENG5/S6R4dHmDje+mmdfJa8X2/+QP/Qnln2+oZTuVNudZ+BoHpPS2L/0b9QK6gYkRK80
	 qstuh1ViaaKfdFkwvLr1xA6GhlbW2T6Vl/5YR8NkCJnauUmtqAr0v638QkXu+OOLlTBfD
	 9FimRoKZWsG47QyzIZRSx9vGxEw9JFculLBYpHpT7Lq9D17lyU/oZG4FQuadqrSZFKF4M
	 2lfY4rl+II72OlWZEin6tPoJuEd3oe39IKacZqL2qf8R91PfToEbc6oRqXd2wJfYBiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=JKl7g1dlLH2biMOAXM/2jYmKOjmbiTq+NbrnP4XA1ofd7bfRB+peda+TYoPSyKtuK7O/
	 AaUBSudYicbcHgny0J+0uovx9A64812BwOvJfkJaFmOwAYv452N1MZ3hA8X8sMC+TVZDE
	 abeR7H4nTfgZI8mTs280i9bogPD5NCHbbRkwMyUAkX/QR+LIU6xAuRlL9vdvUJ45Hd+uK
	 7n+pfG9P/JTdU1exPnKLkDB9wCgxEtEE5oxJRCM7vvz0Vr3NY4uht7MmSC63lobdhF6FL
	 axO2+WzBNzTDo6zKu9WqRY0q0kOsE4a6OY8Lk4beNyVH6w1Av01fb4AHjIJGRgGrzfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSlqzKjX;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61269606A33D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61269606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSlqzKjX
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so2998715e9.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184446; x=1794789246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=qSlqzKjX/7sPDCZRvmng2Fd7M44NFkTn1QnTKlon15ILFRt36QNjsrqLJYYai8FaJT
         xqdBUzCmut3CjikZFdWRXcM18asXALumcNCoDZ8wkDUy/vLNU2Yu18uXCs9ENs9OPJGu
         nTOZcCyszK4wAzAPo3RgIbwzygxedCHuazWjHdx+F6NUU18zcCBMt/igNH+VXF7b6oYH
         qlTinMkSbUjNgaZL5pqDSb6HsOSqrLuMpY53PyfJXRmWyJcmK2xZiyNp6qhlx0aMWWyk
         XD5wvPWvs0D8+P9xSygLy6qITW/i8jKmud5s6HzgGS2nR4vlHSyW1pd61/CmzpTA+ZFX
         bwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184446; x=1794789246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=BbGx55gevWfndE2/hgQM++I7xSq7wvpiL6kT1e2yX4/vmi+1cj3FYR636mj+pN9Kvz
         MDHtzM23DTkx6aL5dFtVRYsBbNDJOfG3vFOjeP2c2g5ydPUQ8dTKe5oBMO6zPTJn+93N
         J4kCV1+cY54vt6rsHur1sKjmYYLcC9vBkroJ+5ovaxSXRLhjOBgd0JwyNT54fUJNBEPU
         5Llz6zWjzsNF5VjbyqJXhLsnFHbKizydaL0JYjs6McT5iNDgUQwEofawYkEu29JFIl/v
         A+5hvQ6jDeS+m9bgA5LfB51+OIGfcF1FOW8jrZqwkxK8mFju/rhvPSU7kE6JrABbT/IM
         mwag==
X-Forwarded-Encrypted: i=1; AL+hErGFjE2gztHfTrhZIiNo13g6OK8z5M332WAE6I0ymp2CyX6nOSpJO76EygVgKyMTqVreWaOGeDuX0pOZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/XvIB2jbPs6dRUdh1DIxy2dBGQZf/a0vG3Pje3LoHj5hB3+Qtv
	35qJNoHiCjbDIE/EORMFJLaojTbHfjzQ4o6DC+NZcmJ/ncznBLyB5y8S
X-Gm-Gg: AYBFou2EVw1ruBWLKBPNF656wNwJlRfjEh9za5x+3J02HmiT8ikMqkKucRQ5sqvLj/h
	EqH0q8IbL1Sb/nH1SYlE0RLb5DxmsAzLLk4RkLndyHHP6Bdb/ABxQkZ4FeT1bZhK40/NPKMzJ+Q
	DSC8Qpg3PNb+PMnfALEbzc5Q682ik+qfT0avHjS6K1P3nl/ssjfFqmCYsSIYtzXokVuSytrWOeu
	DlBm+LD9IygjyTvZRtXcFVpR7ZIeg85XHyIRRN0zYgnJmOHwwx/lAnWe5YxdgLUc/8PwXVSsGjj
	AD5LW4OEyIvddIVA46cjIRIJPxl7jzESE7zfK7eWC4bHFqgujMmIl7LgFOyiAWJbRstgnUfXpf/
	vEsg2k1wQlQ2eLzPamdeFkLkvrmfIOY5ywq68wYcGpQ6OtfkrHq+rl00lgEgfEWT/cnHtaVofuo
	nKKqyWUUzb5qS73yjAmQmoxmZltd3ujHSA9S4qoLnQCxNfP2+21lQY6fGbTs/lv2hyqFWp/sXg2
	E5XnQzIEtpVUZcchLhoTBU3DfYAjxpCbUrDeQNhSPQCr+qHGFQ+xD/BmTxVj74GnGhA/erWvGka
	aGISbHbqddaLckWW+V6FmSi+GdhmVI97OG4aAa/q
X-Received: by 2002:a05:600c:a010:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4b963ca3a7cmr51069905e9.35.1794184445733;
        Sun, 08 Nov 2026 16:34:05 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:20 +0000
Subject: [PATCH 08/17] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261109-halliday-dts-v1-8-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=4DxRuDlo3Sv6o3VM377FCKNLzrNNMHf6FsM5TYa93t66FIlBhCp/mgcC4QeOncc3ZgmuRzx3Y
 hjxDAxOeJv2BA5u50QEvvg0b3XgcZ1hYXm30qFoJ+yx+NwOICn4vuuC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

