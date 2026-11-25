Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604969;
	b=sugjqOw/8VW51LH3jV5zLs+mTzloRaQE1au/Cs00fr2ppm+BQU2jaQZhhyexxtht4tvN
	 t7zmZ+HlkW7PUemPa4KlqOn19nK3Cl8vFOSu3qJzFrOP9dBk0hPkXj6lmt8ukXdQqMCts
	 Qr1oLuwU9QUpu/qBuhNc1gd3WfRzBAfRsYeMszWCidDmFY/ZhGzSGuTIAqJQr7KiDGTm4
	 leEvACZ7zHmvkcUWdSzf6oJL0sPJXptte7pl4rWr1RAsO/LuDROrlYxuTN5vZCfWPXUqY
	 EUH+IdOkHUpF+M3a+apWdou+PcaYV65xGX3FopgKnno9mb9c3hM7PefRGC1O6nTnUFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ImD+XWYg7dmEgbPDTDuEosa4AyFv/QwmIju8d6PVbro=;
	b=zl0bzuUZhApBSY+UU+4bujWcLhj6ZPRZg+NxY8ZofYWoRvESpAG9Omp77j+MeA1Buo2p
	 AmxiUiv/BBon5HhBtvdAheF9E8pOn9fzzXfVCZLwMVhaW9nqy3rDI9MNa637VpCS39azE
	 kHJm1+Ny82SmfWGHHKeaR3QMDWMJpACR8aF2sVtjQl7qpYvytE2Eep0+cJj2BuMaXCVg3
	 FweKDz6sVh4i/hL+1sI8vYqGB8PDhmt7r6rqOHbt7tHMmXWneQdVjfaXeQTspCvzZ1w3i
	 FPinf8LhHG7xD8dVI1eSP2nreKMAybe9/xAG82ChKgrikSVOd1qHJWeyZA8kQizMDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=icmJ4Xe6;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D8606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7D8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=icmJ4Xe6
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3257818f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604968; x=1796209768; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ImD+XWYg7dmEgbPDTDuEosa4AyFv/QwmIju8d6PVbro=;
        b=icmJ4Xe6+2T8/x3hSSQXxQ8dUrLa0VR5fc0t2rTa23vjuGMhYlEkfWfjROWF0R2fxe
         Kkuojf6T/hSXelrwAAhtB2VnQTUwFd7R0CR3tQgWpHp2PaAwO2KJUD4J80XDUQEbSH51
         7QNk4oL3A6oY00qjy8sdMLC4a6TFhcDguCnp+vzdPUhxRGxgI/zIao1Rc0Km5OEUiJoK
         tvwPDCacg//NbUbMpXt2B0TdTlfMWajn+GlnTUDp7O3sIATuvLLP20kQ8BHW57So1iFI
         S7fywNSBgOwRfIS9vkZGLN2NGZcg4kNGDTx42r7NDIOi2VR1nFBxl4m/tuoyDWrfSi75
         q5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604968; x=1796209768;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ImD+XWYg7dmEgbPDTDuEosa4AyFv/QwmIju8d6PVbro=;
        b=UR4B7xsogoMXppuqlAaXg0jfZdbc5Bg3By6Vekmtdrsc+RVskiDgKeygq45RRe/VMk
         Yi4WSXsh/XHeVQu559kDdjUqmLHjUMldXIHj+qKs6tJfVpiY6eVSz7UDUQPeg3alqMiY
         u1y48YtnjcFl0EoTfKaeSfjK4PBl3aZzrgAq0YPCSBVC+2637frFcqQ7ZhjQG0o1adOG
         ZJ49O+t1bRoj2nByCkcsjgkYqeKsc8LS8yJatkuDP2KdhSClzfqDqJLcLxQZsCc3BthA
         7WF7BFECUouwGv8maRiAVJ21a2Oz8PAHlndVaBOcfVJNl1nm9++dO1mH9NwmjN7W8B21
         mGIw==
X-Forwarded-Encrypted: i=1; AL+hErHCvKKb+tagcmN+cE1KB0Bf0xc7yADqPSy3KOmwrlZl9rh6MRyCJ+G107Tx+dPa070YlvOVdci+V1qx@vger.kernel.org
X-Gm-Message-State: APuU4Z845rTKhJo76NF+hZLOjXfCHHRxomW4DJ9a/WY18ui9rGCLzdNp
	2aCdRJ8G0DyPU9e9dxIpfxA+RJC42NEdITn+A/lGYrhsVI5IydJwDPNh9F0zGxjCP4g=
X-Gm-Gg: AZFdTZdpshwRn38PW53iduu9UPfTrcnUsNYLNJydplV/9a3WtbmLCIvic6RJUcoOewI
	MhOSR/zFTF9ZW5/cfauaD/pbKAlg2S42gvcflDpo2Vcf4YkrtGRWfpLvx3nwO53GKHHZTNyhwON
	qCqXTF4C8VZPAFIy/P5z80XaN4rF20YwYCkP6RQZB+glsGI5EL2dtC+XfGWwgbiDim0dITye/5A
	xpwAdzxClvG8p8FFTdFLaZdj9XpWr633st8pLQYHTsJl0fJ7ibnWdb7/53cEzlpBDWG5rTnqj1/
	/kFNDzRYn4zwur8aCF3IOHU+X/hVRtxw10snTaK+YLhbypvQPwtoNFh3VDTidJaDPW0VoT4J2UG
	11x/cQnfYocbJekTDmoZ3BwcsTGFsQ4Wi01f3KWtJSQap2wM8jYd5yFqf26OV1t2cdOAmDKF0Jp
	Yhe/q7yqpEfh8EIyowo923rutmdQCuc0JLHbxpRGSgJdm2vjHgX0IdHLTZe5rX+ICJvGN1/Gvul
	QIwdEiGK/7xlBrag5Q++wpEeBGnaMNiVC67xc42/wgzkmPOnDK5cVHznv27wP79kzx/m3GEftkD
	aWKEoYUJ1yCt3Yy53swwREJyHrqx0Tqmf0JKiABs05B9EzgezA==
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr28801183f8f.40.1795604967776;
        Wed, 25 Nov 2026 03:09:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm33967355f8f.28.2026.11.25.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:09:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:09:25 +0100
Subject: [PATCH] dt-bindings: usb: qcom,pmic-typec: document PM8550B
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
Message-Id: <20261125-topic-sm8x50-pm8550b-tcpm-v1-1-f54040ccbbaa@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOTBBmsC/yXMQQrCMBBA0auUWTuQDCYGryIu2nTUEdKGTFoKp
 Xc36vIt/t9BuQgrXLsdCq+iMk8N9tRBfPXTk1HGZiBD3lpyWOcsETWFzRnMKThnBqwxJww0emP
 Jn/kSoPW58EO23/t2/1uX4c2xfodwHB+hopurfQAAAA==
X-Change-ID: 20261125-topic-sm8x50-pm8550b-tcpm-82d601264e78
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FuQL+IjmRUt6MMl8jqCary/oDQ34SKkKjkFqxv3HV+o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsHlB95kjyXmCvY11h55JbqVbP3uxeI0WLZTMTlb
 psRe0oKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbB5QAKCRB33NvayMhJ0UnfD/
 4ijooKzFMNTzNwSuleuIosrftyfy0fR99F16X/txQjsb+0LOCRDIvbvyboGLgNKfiYlcGloAECRNPd
 VV4bQRAM+4iNtMv035JadeTd7S31Vykj9HPDBUJZuApop30COilrN4ORBuPI9sCTvjx7YrNWeEkT8Z
 dTwpQPB3KrOokvUlU6x1beL6wIc69hyDn78OUkHdaxcrIrfpTvuN8APwxdjETAABgyGHw0MYf5vneV
 Cq7Juw5wPiw/6QouZJjJrNmwyv5aMB6ftVhGVggFve8n5wwfg0S8/Xcyh1N9D5++0CzwJpxaO220TZ
 K0rksfbh3zM1++EJKNja2+qzNk3daXbVh+UmRWeXCj4ueXbzJoCrd9TecIfvgQeERmi5MRvduoRFBd
 fGiCodwnqY6ZAaLfu+P0JjvG174ogBhPLkzC1xk08N7/TpWCpiylDUkRBlrbIrQCiNwEF7ujJBKJ3d
 i3m2DPuZGs/SQMQLJT8Fl7M7ttIaOYhf/E3E5QgWuwtrKY+EwS/0O7Of+X5Ezl7mbpmvTj3pm3y4hD
 5ag+jr48hX0rr+0y2YoXmnCmHc59G4TqoH0ALy8aM5sZU2BXLIf0GxJO/XltTDZdmRq9Z4dS50l2xj
 smX1NmL+0zL1DWZbBuTAqPN5LU8Goiu5au+/agcSIBEaMhoAPLnpEH7VJAAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the PM8550B as compatible with the PM8150B typec PD and PHY
controllers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index ba790c4488b7..84ab93e70d99 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,pm6150-typec
               - qcom,pm7250b-typec
+              - qcom,pm8550b-typec
           - const: qcom,pm8150b-typec
       - items:
           - enum:

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261125-topic-sm8x50-pm8550b-tcpm-82d601264e78

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

