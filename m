Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421206;
	b=O4/cDarJP2SaSJHDz5wBPxb9h8MJtm2BAp9aQDLhk7lyoyZatLt8HxQRnoGaRP1AwMIb
	 sUqJ2fNTsWPu7Qy/vf+2VqXf7cB1/Y0l4oqnK5YHCmUkQGgtUe1p712idn2LwKFzC6Sk5
	 CY71OSPZ41XVbuKtp1Ws2cr3CT4Jq9XYTjU58S8rW8uHFFNWcxO8yrmZ+FgPm1QI6WCw9
	 ntJ5+lj3rMAmaW2w1sRUbE69REmdoQ7VF8WgS2D8SkCucIqPnZzIO/QACBdwuJm3QruL1
	 2SVj89Acl5qntjdiXeIPaYwT+CmqDkgCTnBYfhxelZ3uRDRsC/hS7ja9yokdwitNM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
	b=f5RQ/cVfUqc8L6NAdHXDElMeZavYDdnDvAwx1q31ftpBtt6QT+dcihZOnC0j7UqKKX9V
	 rTZB29rTARh/aQ7A1z3mh3kZWppvC1GvvleVl4GOFJTLui+78ZyxKKKnT66GrdUKOU/7r
	 VwItg5c7yqEBLw3hKcTxFIP5X2WaFeNlNuhzhgztLpSXbJPrbaFOX0chnOOiXOpZyXNQa
	 OuHx0wb03Q+5N0zR/PUuYn6MhM0Rq4X1oJ0gJp9WLPTKITXhkkWKpWNgggFkhZzOYafkn
	 r5d3S9WY679SlJarnw5Z6wPq1kp615w9q3m562hpayRAGUdWkCetAStoWv6oehk2GyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXdF+Zbs;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4361A60A3825
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4361A60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXdF+Zbs
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so1467091a34.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421205; x=1795026005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=XXdF+ZbsCKWyrkWPbc1BswoxqLG0HiCBcf5c/i6Osr8z00x1Auak7nzuGNyhUAOkrj
         AeZvDhj4q96FkNZOrrApNl5gllZtKE4rNpaFl29rDhY7OhRFUp35l4AiGTMKadsSNPfk
         wXs8QR5baI05JWmakrfOPTsfXESGZktYFHS0f+UwyGvC9ZNR+YCqz0fRP8gFtgthKRN2
         9OxjMIbyVLpTjwPUnaAe17M2riz+b1QVG8i0HXTGnH9wSjsOZD6hwftQ2N+2PIQ+2YkL
         JaNasfw15yA91EmlEa61pIeSTxbSXFTTbhcL9Ys3i0rhsPziDoIubFxMP4s2X2/d7qHd
         wD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421205; x=1795026005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=Ad1Bnl3JBDCbPUAfCGE7TnSfu/QTVKv48qD1VAvfblSLxWbURytQeC/7C1jT3SuF6g
         Q6WrODwdIdtemaLfwOo8kKyYsNZCelps7ALQaJP0o2hrbH1/pPGxfM2sUe7hptStcOkj
         VRdhx8PryP//Oo/VdA7mz2o4Q2MIqae+POdAJReo0uyxChhcvCpFjf0y6F5eMHGAd/T8
         kN8WYNyyI7Nw9qsgs0ZaEo+wCwaIWoTMCyFVwd6x5UrDpDJeOX3uzqCLZLVUhM6Ewi94
         OWnEYiiVExt6QMCQI7HLlGJkMPhwv7xtcdaQWgNg1iJmXoBw7eDxzDPEsStsQboDgHvK
         6DpQ==
X-Gm-Message-State: APuU4Z88/r97koobMTVWkU6R6mVMn+1d26/ftbOpI3SLiahsz/ZXuCV9
	+VztRn1YTG4zU+cRVtjVo7VLHkJhLP/dMrlVI52pu81IxlgKxqLP7+TU
X-Gm-Gg: AYBFou0vYwC2NM6gfeTv+nDHYG/+EXUBI+Mai8wOnyP9VTlhZY2k6vkNqSxLvF4zWVL
	VAHwy/cQWVmOXFBQREVBmNNlVCaV1Oq5DXnHJX4D67NJmAhn9viKT5HwPrPlqNRldJlv4rGaKcz
	04b3LA8+mN//4T8Xqlj15/VlhVzdWhq4MGBi2P7rieWQrFKvwnSqKGWtNuRE+l23hMb5wk7yI1E
	ByE1sFogTJRajtge+qUu51/OryWBaLKl1KLlMwTtwHs0ajow56sCVKFvQzLVPkFToCrpzIVpqQ4
	ktpvOt9BZEnh4QoB2ZyWF4Kj87bx8URThXdN1TZVAemPoxhO8D4b5yjTkcP6bG+WjTk/iBo+DG/
	Nxk4O4KceLSKeV4yeJ7HBFFuuYZSYomJOt5v8tMCPrphhLdkAegPxLWfS3+xo1O19Xykt90MQbP
	PsHsksLCpYwN5BWJgqT67ID1kuM0EjQWylV5XdIHfSZhpsIF3RVdljknfY1gEPC2H0TKWPb9wXj
	BSCIkExQkv/u49R+8JE/MMu4Yoqp+OqjVgc7EfM4uTHxu9J5dKghSqQRZW3l9B3cXzKTg998J5n
	WCfX6mYa9YkytWM3TJFEB8RCWW0WaPLL6EoPrPHMlabZGk32/fzmlpY5ckKJIqgEO0EGpTVb0bn
	mDFaa/tiqMjp4ENZM6pw=
X-Received: by 2002:a05:6830:2b08:b0:85f:2832:6a9e with SMTP id 46e09a7af769-860f28162dfmr3039526a34.7.1794421204976;
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:53 -0600
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable the
 volume keys
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1176;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=LLpoR3iw1kaqxYPJDFxiXt3CwLjEI88IEyMOU6ecomg=;
 b=EIrYCD4qDZS8ejbMBRlTKqTEnwo/3Ulc5Kn6KPn4xB1rCIw+hZ9UrVfNDVz0yk0KNiQToEl33
 BPHHMIEBaerC5i8AxGY8qWMSsqKkkjU/ywf2pCEqkga00yBk0Ibf0c9
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The volume keys are keys 0 and 1 of the SoC keypad. The controller
reports a pressed key in every row of its column, so describe its whole
8 by 9 layout, which keeps each reported position inside the key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The key map and the debounce time are the vendor kernel's.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 6fd7777eb491..7dc0d818a44d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -250,6 +250,17 @@ light-sensor@23 {
 	};
 };
 
+&keyboard {
+	/* Each key is reported in all eight rows of its column */
+	keypad,num-rows = <8>;
+	keypad,num-columns = <9>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)>;
+	debounce-delay-ms = <32>;
+	wakeup-source;
+	status = "okay";
+};
+
 /* Consumes the VPU, which is disabled below */
 &mdp_rdma0 {
 	status = "disabled";

-- 
2.56.0

