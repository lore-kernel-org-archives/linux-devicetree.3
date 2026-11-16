Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864452;
	b=ru+ODicnxdoRIkhIN+CARtb3BYPfX8a7hFQDKT5vsrT6Oz/BAiNyKvlsNU/he9reUQEN
	 HYHxP6zrOPb3c783wB7rSB3mIhlBq9fjXHWbAbSmULIZIK3gmaf03o5a7h7RKKMFus/mC
	 XwYXz8ISn/AT0iVm0coBNKES8CZhGdJrX7uu2cTRr/zb/8LSTSAqSwF8rLVosQk4KZIBW
	 TVqzBdvXzA9lWh/b9zzo56iYt/kG32ci8mzj07QLE+eDEhNfEFUeDz2m7MFFo/G+d29dE
	 L+mW7Ax4E8OPa//BvnSb/gGY5N+PoMsWMZWaY/tWU1ZJfJH9Qx9ZamYuwbjiP8vYRDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=F6nDydyUUtyodmcNkW/v1C6tY+Ijtj/rQXlE1o9T/wNcICRBqWcRkvEQu8L2EzYbBnYy
	 G/Ss7ErUTVS2M4c9KR+acF/xlSrlH10tynBQyRR94g63eQzomQDAsyBpSrU3ce7NJ37xT
	 jXsAZCBcctj1Wuh3X0J902B03YpN9w8fdVh4blPZIPP/6wKKAYNRC+XpFWoFQBEL6++Jc
	 Cff2GRct2z9fxY9RUd0o3e9USu0D+WQ3bY84rRYN7pFu7BU5WHZ1DWVgW6K/tkS4KicTR
	 ymBPh2BrGZ11Hwc1oFRF/ul3yXBrMWlbja6iQFxFzV5wviUiKsOfZw5HQKd9uuc4ZPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E043D606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E043D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4246221f8f.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864450; x=1795469250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=Pe94GAJIWEr/y+mRBwb7Iog7Ajds3LL8wRIVBH/8xPQNrjbBDNlEcQCn+p1QOcbrOV
         bH70aW245d90T1wUfTfa0Sb1xipFO0e3BL/QPMT4jfWcMzOuboVOx66DzI97tdUkpVn8
         em63v1WpvLz1xDjpzkqtc09ikGmguqMkXF/iBCSCrH/7rvMJVikSjBvdeaH+nfm2b/iW
         Hjkp5FslDnjSyufprS3LahKBu44fJFSHmzAIkvAgbVTvZCwJLs5vDW8WjGCFxFP3mws8
         5H88Pj/ByqUxoJReDfmjknbzv2qH6Xj3kHe//wfRUbrzreMGjXoGLArpiGQAfFxpX0lR
         wpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864450; x=1795469250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=yKZktn7THhV/K9JP/sVLAwYZ1MSUdQO+FIujJzQRSxHUQSudR+ifxH2VH58vej5rBV
         3rMVIduzc/0YN1P89qfEz/HoCs93oDOMHnGD9fPSXEl5x101FGF4bbEeI9eWowroGWkW
         3Z+9MPosSt+IQacWDtnDae4Tl8wdxwZIS1GZ4j0WIbsNbAc1AiwVFOzevmI4dxHKMkra
         RwwN+iB3S78ZkcVgkEmuKj5zbjplPFny0vmP84E5sAQSURnYicA9LY0T+2E/lgVi5z1G
         6HzSsNwpkAo3oBBtNn40Bdq9p9uhVE3qOw5Af/YlijFepPo154v4OU4+RDdwI9iYNUf5
         /fNA==
X-Forwarded-Encrypted: i=1; AL+hErEPR+awYOefpylKo7gNJeXrOrBiS78yZr+qpLmpYWLdjNMWXWdgk7+Awo3rB86sWuS80ai3+jtmo5ae@vger.kernel.org
X-Gm-Message-State: APuU4Z9ff+x43YcUNST7fC9U+oprKs+51bung0w3UFJ/Fth3BBBHuzKz
	uj0LXe3goBqPmk+OR40ZRcb6r6zzFXwE/SyHSgSb96pEhnYRez3TfndD
X-Gm-Gg: AZFdTZdPBmtdHcKo7/Te3HL/nXFCe9MU2IN6I59u8F2JjopCBwYY/Gjf25EWfLI9ww5
	Ut3C/z6Ef8xBR6FxO+92BGkG8xt70RYj5JLRDyQZQN5B442leSHEX7B+vuhNS6IToe8I25u4chP
	YlY1YOt/Q8aoDLGvgCNVaWqm4/x1eb/RcLtLiQ9EFMOt02IKN0UQhF6eqBeCLO+t2vfzx19h7bj
	NXvMbuvzrdDIj6Nx/dA6303UxtA+Ts/iQNlDQRts7UnBn4MP1zanczM9dFByz8EL/H6ElseSFkQ
	kpVSWmqRi54DC+/kLDd0rjUrP3OkqcFFR/hKjjRSF5glCrHtGIcLnR6unefbDpBK4l44h43uvvK
	jKi9qUUDri/zhljVmIZMZysaV+B1SCAqXt1oyQN1N1RxxMTl6D9GN9I8U0Cc6Koc8ngYvmgQMyy
	iDpKQzNwl8EBQZOGnPtp5M+FLB+M/U520z9IfAyWPvn+ey+HK81lDiZOfy1Mhz3LrWhvIYpzQKY
	jnf33r2UxCPBP9LjeBsVMcoOg00wTgrzWNfN6ePzAYE74U9021nS0Ei/65/+9TnGCZB9wfZZNlm
	Zs17cGCWbgZkxT3ADXZWUBA7Qefzpv4nBn6cz+Mj
X-Received: by 2002:a05:6000:1a8f:b0:4a3:8b21:51c1 with SMTP id ffacd0b85a97d-4a38b2152c6mr1214677f8f.53.1794864450317;
        Mon, 16 Nov 2026 13:27:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:25 +0000
Subject: [PATCH v2 09/16] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=Oo5JC5eiOukaaqszf2JD96qfK1gjo4Z88L7lhFkJnmKZtf8EiRQqPApokWBgoFrRDRq84oEys
 dN0aV0Wol0LDOOw0PtPKsKDeYZp8RCTw6bkJAf6hQZCCV8VanxNS3ZJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

