Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184466;
	b=J9CEAqHHItucIcWQsgiH7d2Ypf4V0EqY6Smi6IEo4LCGuq9UMVqq7+/OLIRjvZXwr98U
	 o/kGMaEsrZyKZPNYjcm7v4e7lZS+WilJDQ+1cGmG4BmFA6gRPLnXQAjqXRo0n0yHzMnyz
	 /vd1mnGCZAqwrWl7zEymQobmO6hBHUSxAeYOrhlYU4GJRpM1AX1R2nbg6dij+IpnqLLOy
	 A7mF3BDYlVkBum15b986FaXkiHhO0ccyXAyqzErcRXrIvs6nHjZwZryj2BkfVVf7CJ2rI
	 srOAYOuO+Z5O1HaxscnF8Gzh5qYJIq297S9nODGxAPvwfiXkLeflpgaU7WkiWRGd+ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=5mLxup6bCsvw7RdfuavWCwS1t4jjdubOUx5JuZ2mBg4KVZGqgcORNkxT08RycPVA4btB
	 vWSz/xWz03T+nhvdwCfKb3PwLuOlv595A0xDBw4Kts8WTomZv7RrPebsUbyWK0BgBcLjb
	 IFqDLSgQfEjZYBsLaTUxPOK5e13ivZprtjLgz2pY3o0qlL/nxMKsOKJU16RhhZbJM1W/l
	 5CnHdlktPA72+PZDbzZh70b+k3Fl+2x1BTU+plfuwZ0ojEuxqEIu4N3zDy6RDsh5Iyv8J
	 el7ZSQjpb7rspa8ZxFK+ETH+cNRv5INCkEk1JScBkvPz7SIPPRquTXwb8pD3kJXXLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXTbJrRO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C89606EEB4
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C89606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXTbJrRO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4918c2d727fso134319f8f.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184464; x=1794789264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=qXTbJrROM77jrmCM9vSlEIFFKfBcarGsiF17Y6oDUL7SOkdiBhgFQr0+YixFQkWEIf
         bYD8oFTkhS58HuFfPLn9H6mX4m0ZZAxM4XzrERkTjpzB3SJLNHOSvSsV8AC/tEppq8Bt
         MGZppWqXbepkL7pMczc33p3cmiQFuRy5MYtLQQte/3bTxKRjI831KG5f3FDqNUryqnyB
         eEKohYIZ4FVRnbdpdXsFLSKFtCHd8jPmqTgGo4qq2x89oY5DmmCjomsXCqHjt6mhmPGl
         Xat49iJQqtdDJ/TsXzGZbMNuKHaq5TRzEMhuqi9PKjPqnxRIxqbDKnE/ZWsFJw1NO6tJ
         UnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184464; x=1794789264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=vMG48B6jDjivhRSq8PZXJANClLwd7yB90uYPzV318pH4zcpFzxsq5E/cydV+rsOOLE
         +MPgSPXUcC+EcQLm9T3Ao+SJGoHUt4+cm3dfXk/vhpawFvyY3GQMFhBa1VgBWhyzVl3+
         TzUTCmKK9BCzapf+3EAHRfr31QpZ/cjFKSDvDRYB7X/Ufk3MckDm1M73kj7ql8xaEBqk
         Jz7zeRE5+zUDMP35KZaHjhD8eTEgakrqnOaAPGYq2m7o1/4/BWowRwtUrt1Ndni7t9Q/
         pFIWESU6HXZTx1f2KeTwAiEHZiC04N1/pnC9ukOdr/APc2DteDhNi5DpPFLpjt0feOOT
         0wtQ==
X-Forwarded-Encrypted: i=1; AL+hErHAiTPDntxGgAAZP7mQA5hPhHW8wVGijBTZCBTHtIu2QAs2A5g73LYE0oeCeGLCd8aoy7uiDyS4A2Ml@vger.kernel.org
X-Gm-Message-State: APuU4Z+NsxjkbwSGjRQvEiToI1UR4PRSZp1m2m90Mjz9HGJvseYZdWT3
	JYF3C8kU7LMVPfzT2giVm31BeWGSTwuVQ0IhZtkZmjtsMwTjzcMXK7QW
X-Gm-Gg: AYBFou2/eDra20fFCslJrmmfF9awuwCtJlM1SFkbxJJSYTBq+0+xAWG08CRMNiRUkKp
	FBuoWBOPGHRCbRX4FyU6AIchX/Pao1A6vLqsZWn92Y3cqbkGiQb3IFnrQkrTBH8mNM2mXm1omjJ
	4LY9wbfbCtYDfgE/95Xm8HjhH+bucE6xC3dDn142G95Xoj+MorUdYDTLBBvE0Y27HittxOUZHWZ
	SK1sktpBlo8Jr2q9Np6dVqIpe9Pe52pkeqaj37Vq3FIQrQU6rtICIN3EJM3jRoS/Q31xcksJaPc
	CZGQzjy4eG32Z7qyepwSpo68elR0+bqUA1NGLo7dIEgZuRa1KcRB3+z9ULKFFFAssxkQ9B+V8aQ
	Lk2ydN00UYD2l6V5uWamV0sptaoLNe6LX8H0RjFwANdBBYQOGRavSfF/WOwWI1GhZdEdipmlqVw
	6rddQvIFyNgACvC2dioKxIdDbgLXuegjGCYh0xpgZjyjPiyf1mIU9tzHNJdSIDOBq3wHpmsmaZB
	U0VOms/PXUl00PRDo5NFhmO7Ncrujetkgg3Y8xovQq/0+wfzR3DzABDlGXBn5w12uPRHpH1P1id
	YEOSCoD7LmY6mSLhuEAtfwp+nEtmCvWgVqT9tGBe
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr4774036f8f.25.1794184464442;
        Sun, 08 Nov 2026 16:34:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:23 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:23 +0000
Subject: [PATCH 11/17] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Halliday
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
Message-Id: <20261109-halliday-dts-v1-11-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=/dOrZ5kbZXiJ0bcfGwkBHl7a+YAKGn1bUTdYux1Y38RVDKws5L13g0SU1+8SFR4l0gLQgTvYS
 wprUB1wAKuOCKc4gs9aCLEB0eoMZXLaWUvR2Qma/3ofWIp9EDkckTFe
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

