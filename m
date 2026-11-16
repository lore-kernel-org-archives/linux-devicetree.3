Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864272;
	b=dqfcZIOc2rDso9n7QkQ0l3P+5Rq0t1bS9KtGJysf/InnI/IC1/b2aHI5vtHNFJrL0C62
	 wQvWaEAUZ4iKFXifVf3kZEg4aXGdsVIP1kTB+5NMU3yhB0+aHLyQLbCOIEbGq8BPW7q72
	 bccL9mzFUFc4ZlHnN0W29b5vmCnuS+15KOhWPXD+epiCl1Af3GANSA9UROT5e2MQdd0Iu
	 eutNXyvSVsJ52e1S+xjA0KYca/Vc8FhMefU4MmRdP+KZi+31k55BnitSfVrBI3z2E6YFA
	 9sg2Nst0XxSUkZyvimJFHenRUEJ5cKZGS0kzo9IZe9+6ZRrSH7H6oVix8hAHxqO5nNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
	b=N1DLIbPf1Ghr+OngsWUtVUwYHEMJVCCRvp5hXk3KC8XzuXdBHZjeiCo8Qx5VnyqK9LCb
	 PIEofm9kjIJv372ZqxUxqFCzxQWbfBbbKSOD6hk/JYzN3yQqutufo84TiGqj1x/b79EmD
	 ikGfkeY82dmRrzASXbTFIxBx8fMsIG0sK/N7hZUQBYzVoyrJ35+lpdbiwGD/PJtkmQHnK
	 SNu/QFVioIiP/c6D8oOwufxAb73wUV0v9+0jrWKSTHEfCJIZOo8HbAlAbx6gLWFKNxnVX
	 IxpoY4vGNPpxwIWuHWSLyerdubvBRa+9lenGTzzwqFKeFktUpSPT6lQiY8CKptaHCtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5531606A338
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5531606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so43349485e9.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864270; x=1795469070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=RV5akAzKeEP/HsoNcLz+tuXg/klRUBB6/ajYSY8bldxfs0c2Wg+HpBnTCD/Y8LH9+c
         NNlt8M8zDTRk6x9IMeaNnXYBk2Ukh8FupoMFwapHXDDrsGsCkfnllkxfXzLWS40pizoV
         sauVGsgQDC5bTT8n+BJCAdFB0JvrXevd8l7ESWJ4s0tQwvt0MZM6b6ID1XnDE5Q2dzCO
         agazdYBU5OJ9N6j0YgByNIOIFUyEkYZsIG62Rn/LpoAt2mB02bD6aBzOfZl+yDeHTu7M
         viRJimN2nQmnxbvXfZ+sFPTNDg2v1NTHJIrFyJXRNXveqXZa61J3C0t6dC+tbqF8OwTJ
         EoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864270; x=1795469070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=elSrEQfAhTZbEgp9Tx5znXZiK84WDbwKisV7JJrTeRctA2zHylB5/FKj9for9Yja/M
         pjxSYp6bnZjsqzyAd664eyrtS1MLbta2ltIf0y0Q54xQ1gR0sedFVANU+qhg6NFNV5uX
         5jQf6JalZC/TRV2ovkaXVTcwT8+JonV3bN3DnTpCeR+FduMB8AR/TEBBUDNx4yBOEFDW
         cZf+mVrQExOV5ufmcRMbWeCUcvFmuf/ifAm2WstgQFQgdDxwKK/1TOx0CtlObFAJMtH2
         4ENhWCHFuJDuWu/SX5+Y/v3j4UsciaVISH0Ld/tRnt3mflNy8y/PYFk5ADd/i+RldEUg
         CTnA==
X-Forwarded-Encrypted: i=1; AL+hErF5Pvx1HywcBsPns1sNmvWDobNiGEEpw06SypamOVRXB8CaXbax5As2l9MXVAQ87xJZCEahmkrbAQ+2@vger.kernel.org
X-Gm-Message-State: APuU4Z+JB68wlI3fgKad59E4dILjmFS7fdf984GucM39qNxko9R+72L2
	YlN1OSZMvUtMz/NJV0qgtVBk/dIqifJ7rCR6p7str0M5SEJ7zxV+eW2e
X-Gm-Gg: AYBFou1MC0+wsb+4i+gUNrpboZdIxVuluWD1+xIO0j5Y+RcB9TGqETgC9FRrP8m4T2n
	/X6Jp1T4x+IC5OMhXTs0Emx385NiNqGaiFMV+MtEWudEUEk0065slLr2x0LqKG6vwPbm54Ueoz+
	LmgbQWY2bK245pqmQvN13FFi5E5WtjHus1yz4mZg4hLFrHukijzX2g9GoCWKPYEQ6B6p9HR+XWp
	X/Yvrx8WyKGDW2MY1u4DN7LqB9hC/r1HmWGfrORYzYwTg0WUPDzq7ddDNmKsVhcCA4zS9mYFQOp
	d/AN73y3tlFFQvvD+l+NsUBiSQx5TInjxvq3KSET5JK2kaDUpvzdfkiGO8uCsnnLpYhu75fnxOs
	iFi874I2OXzPljHi9Idzuyo2r0CACw9e51sd2scJY265OQxlNz9FwgTxOXUxhnZbMbRNk+oU+td
	e5zSXVP+8MOCS5c9uGelmjSndAPrUTyJD2MStWj3SCx+8NWr0vVPcp97ryHgkgMhdVabTlMYBT9
	SyoqEKvLz4XsinUyqUmwV14XPJJ8U71t9of63yG3JiU7Jar5t7lh+cn0UYRDalee2xxyeC05m0T
	OUkGmKJ/Gg/6ekf13eydp3eU935lXr7U/qWK+jQ3cw==
X-Received: by 2002:a05:600c:4685:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb55a91e31mr246195125e9.32.1794864270391;
        Mon, 16 Nov 2026 13:24:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:19 +0000
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom: document the Halliday
 RPMh Clock Controller
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
Message-Id: <20261116-halliday-clk-v2-1-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=893;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ZdWzIM6bnI4voexzohsmWp0z+avf5ks6mjxw3tb8aUQ=;
 b=9ADXxuWTDwY36Y5okN2pDe1MsHpuUDbA3CsIUSMxe7gUP2WuRMP+n/AfTAr9ogCLf1caA/cG3
 Q3NVDXq40X/B3Zshwa1u8FXTTp0InIEh6gsOU0Rc03SofrH+/GKLLA2
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa..72223566da1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - qcom,eliza-rpmh-clk
           - qcom,glymur-rpmh-clk
+          - qcom,halliday-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk

-- 
2.55.0

