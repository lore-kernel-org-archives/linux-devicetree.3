Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189DE514769
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677928; cv=none; b=OvxscHUOt6QzlCnyesfhbmF0oYG3KHLUMdlRaq2K05e6SDnF0fZC8Y5TPygMDyc/jk1VI1NYd+Hi/uflWD4Zyab1sAJTQPfyEoLMGvYM8ddMpazuEXV7XCXbqbXTcIEg04bxx00hT2vDzE28QvzcIfuVZbK2D5S7I8lnJ/tUin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677928; c=relaxed/simple;
	bh=ArQtZ+9cT8gS6u0y+rbtGV6l7T9LtDxkG5F67zh2qbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+jg1xctPfSoEsMpDK2/QBeS3wLllO9hDSYrTNLsEOfEfDcRUu8e8Pjsb3Ntt4tR+xInLIxO1xlKnjwISMcrVPIjX+Xu0+poBlutT6k6+G2oiLEttmhb7FSJEUaGrhrS0lg5e26/7oCOi0p7i/uc3F0BWBq7qd9mOvRu7k3EdOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adkz0bBT; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adkz0bBT"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff23d81cso2693895ad.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677903; x=1791282703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gKgYa/panWCzY7t8wKelcXz5le9XR8NMGeIjQu3y4I=;
        b=adkz0bBTmbl+aNAMAWwPNelIdldyHnQrmqhkfOFHzNifJA4hvd4D/ImXavAgYmoQTe
         yC3pIWz+qMs/WjSk3EJcjYdDzmMhYa5QFej3LzcuuDzFf5SxnQbXt0O91HEq09z2lJHP
         Lgnly6nhU1vhAqZ2dfXmA69Pv246l08EYNjFE327oK5y4DWrsrGirggK0u8uPUzBPDql
         8C15kYaGp2132hnhcbObVv0JhOP2jaF+kO6x/aLaQnBpVZN5pG1adf9pYhMcpgthM3MP
         30yPKo4nJdoYtfFkrD/NtD4foOcRMgAjUMSAiFFSEasJ+0FABrewsKG5L5d5ScCJW71s
         7aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677903; x=1791282703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gKgYa/panWCzY7t8wKelcXz5le9XR8NMGeIjQu3y4I=;
        b=vafA4kqpfx/hw88GaIqAgP77lzor8L2UuqdTPMOs815vroN8+4yxy1XKVkYZqC4qam
         NqeG7/xocm5SMVlt1P/9F0YhVavogUYodRg6o1nxXJTDNKYiUepl5jbp/v3hSsQ3nxtw
         D2JJRAGNdeoSyO4cJ0/IQCYX5Q5hYjZT0JfqPx1EaMV4J4WGgZzsYV5tai/YbaS3Mb1T
         7Co0UrujMDENsJRGo3X5fDrRnz93WM08+UR+VDl5e7B8Us5imf2/rrGBq8+ddKFltS+r
         vS9nG0qVFDcvowXvIonJfcPPSKfAJpH8l/3M/pX4qrBoCx18X/vcZai1vkvQuhUljpZp
         HIFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsaShdvfl7DlIac0qT5RfwBiMm5kkmCCn6jHVC5q+C6+EWnGkfj4WCgUIuqYgFEUYeS71XdtiW9jRO@vger.kernel.org
X-Gm-Message-State: AFuF++laM0zw/fyYFRSFCP50GMzunnX8oDG1HE86CDSpTNs4sa9Ylf+7
	wRblU4A70G1UAqCVQYIBgf9Q48CFIBwqQrfG2juMwPV8N7bXDB8duEEg
X-Gm-Gg: AYBFou01kBf7bfCcKfmcneP071qLbk0LCGCRaSZe6q/n1sDr8S1tJgoqYrSveROsqAB
	fRJ0y0eI21FshoeQxEic9okl0oRxyUc82EpjDGu2PpY5Oyerc3/vk2UNnfSFSmQ4KTpqIx0xpj2
	e1Cql7736qK7vuYnXCAPsCwS5BF2vD+mEnx/QG8buj7OiAjUDcObg4+T/nzJXGohmMOkIHDtiTV
	0jOaXO4YKrXj5F2wwevS/uLMO5my6FXRiGXSnl8pj1rBAEz3unf9TD5dpWE2A+S9GaTsda9CePJ
	cHRnQm2RtE9SaS36fc0Y/ajBFBZ6gnTx5CWr7yx4jLs5iB+hNGV0o/rP92CNMN2MUVjJ4xC/9tE
	UTWeaQvxn1NlcPZWPvlKzCBp69nros3wqVRupbKfbrX9hW6vnrKsQyKJFN3CD/ztkqdjg7ynktU
	2cSP82alFyw7WvnWOLCnVT8AJ4H5rkdNjqndlR2/xRZlr2BKDhFTXjSGkLSz2MIO6ko6jToIyc/
	50Vh7dZUnZzeg==
X-Received: by 2002:a05:6a20:e212:b0:3de:50df:7faa with SMTP id adf61e73a8af0-3de50df9a66mr11320741637.1.1790677903224;
        Tue, 29 Sep 2026 03:31:43 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:26 +0800
Message-ID: <20260929103053.10241-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929103053.10241-1-liujianfeng1994@gmail.com>
References: <20260929103053.10241-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Changes in v4:
- Update patch mail with commit changelog

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e6b123ad58c79..651a89b258351 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1204,6 +1204,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

