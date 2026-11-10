Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337090;
	b=g35R3R40sLU4J+fSYrDRZKV/DgsGTzqQWyk/AhCXPh6xj8XGjzopXL703vEcuGY326zq
	 SewSHa2m5nyFI6KNUpjwXdVs13ZyxyA6qMwEUvk3B5vS2uJh8Gkvs8c6B/jKEoR0lbEuV
	 06khze9AAHZ/+24kNqEktaLugiYrLkFH4NdVgJHxuxTwGdanqfOq4exdfmywQF/wyx49I
	 cn/dcQBA+REW86L5W2oLAYpM/v6Bd/2PIgxEHymbv7+7skxW3QPa8jkhw2gaZ1gjNXq0u
	 Bw02lcuJbFuyITu0iRI1C+QRBcdWEUV4pefCAVj16X17iPKuShFx/s1Z1q3AdwLRGZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
	b=hq7O6/XdnLfpbajuClCxgPTEMhIO+lBJchOXFtJoweq4M8+hK1qiX4zCYaPHM/aR64Rl
	 GiF+uL/zsZACZ04dmpqr6GYeEafl96JPoIyhF6/His+QUuCHHTLrfkNWSCyE6rShgmC0D
	 KUCz2kHf6z0o2npF4sv/yiIyI6y2SkbNuTmyNw8sT4oYmJ+UqJixRGgBoCy3YEEwoW7j0
	 wsIoGI5w90aRT2WsUZG/QX1fqB+iUPyqtKVk983sXmuqcw+DjR+QDml+ypwJdWovUnhOs
	 EtdvxHjoJszEf/WU39mGtimFxRHm3No4fXsZlvVS7GM3yCfbt07R/TUzUSS5IvIrsSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hC8j81W4;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3905F60A2605
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3905F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hC8j81W4
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-943e8d35f74so204498585a.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337089; x=1794941889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
        b=hC8j81W4XVy6GM6NSCd0k/bnKZL9dDfHbCnjIHZEMV4YCCxJo+rbG8Q2gJ1ziBpLGq
         b/WGl7uM+GbW0ScCbcGRV81gVeRTeNgz0MizF5kMHCM5ZPPdbitL1rbaLNattI6y9fcm
         0DpQSnY4WXKFOr6Wn7dT2dmcAELqKsJEKzR++vApSbK2g+bqtAQ3mQs5BCzW7QtRSntj
         GWWCQkNu74fERR+RfULkWg5huVt0eR7NbF0yCDO4S9QOY3TsdNE17R5IVmsDeMYlMoLP
         36wy31vJ31vDKQ9MKJyqWq+R6e/unEw5WoidBXKtWmZIODw2TxbkPGzvtWf17iNMm5uC
         b7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337089; x=1794941889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
        b=U0z+VK7F7dgG3YxRmphpkqPy4PDR59uoGC8RDfv5zUM7VIOhqnpiUuBntGvatshfAY
         uLSmN601krbhWaLnw9m6nLLWcOrcUbM8ts/xcWCqseuY9OGG7btMOrksBq80bhPCtECW
         TJr+kL1pQv8T64RKGfimCyJUCqa0zex05fLnHg3TMj0EO5mTUsNy6PztNF9eLgdUGojG
         fTrmGKN8bv6CnnCDbKXofDLJHi76d0sN5PPYxhOxEnk8ff/p8ftOAcG6yUuS9aVP+72L
         kE88kmFKW3f9WPWizGJvlnT1PzKO/IXX1Ap7bUJp0ltpHHB0xpF+Mdm5LJE9e2LIBEo1
         txKg==
X-Forwarded-Encrypted: i=1; AL+hErFZsZe7xW6fYJN9EcjmQck4FSQlHly/h3ohBK78OCY1hmrxHONuHL+vhm+gOJWBPx9wi+b4higMsvIY@vger.kernel.org
X-Gm-Message-State: APuU4Z8NQVmJWwmAFujst/yWHgplB3ArcAq9dWriDcI633eEK+6Zs3Cs
	wFKjczhJfSa6oNH+uR0wJd7IPkBegFN+r7fk6ToMdemxPC7bSITYvhNO
X-Gm-Gg: AYBFou2wQgVrI7RWjuMlBYC0yrECuUjZsayPkGhwUJk9JFaVPsTszqvAG52xTogeIn9
	6KusRHaAgSgtrSNXE/JCzQ2AX1R7qlfQXW/m5bSSogQn+UycA6xk/xqs7uYQIEtalYYSyLc9RRD
	y7XztgRGQMe0N9bTfOIoHbH71izAd+I28vrkKLwfhyeQMS+UXPN9krDutfKEXNf/IUFKuzzFvbo
	H7ZAlx+une4jqr4ylXJlaRc4q/iGUfpPZzoj08i315JxkKOjRVoSSmLCdlS3meMs3APFsNCc6Sk
	hgGAcZvTMIca81EDFYqL+71ulOb0WKVbBkWnqGa46Zh8hztrXWE8wcqtNPGxcs4KKYe8B+kt6pR
	mvcEBDv3wpYKUZgs4kP1y4AQwH4ZX4rqlxJRPgMPkXxtM2HcLVIL7e8Ce0xJhT6r/46gBXDXInZ
	H4GAccfrna2lRujs/EkjZYhne+12Q5/0fQWrKNUF1D4ugrEW4/G9dCBnEwRKtVv8gfIQB9GCXFI
	b9fSvLf/maLqp4ICDclSPZkTPiIpwPCfgc4keUxtgugFv7tQVmMREL0Gq1ygawuxZvIPDtU0wxi
	igIr6WtBbxO+jvxcyae4OMFbS+p5dEfGKlhZqlRzmsGQwtg38S4wN5gxLdLvL50cnmoHVRHcI/P
	opNOVJSpv0807UdQJt6j5+pA8y9TnBeEpLcY0+Vn1j9xE0/QgwklS9+CyCsYIP7eHPWTFASeHVO
	2L5mPEiX0HtFTKQVvhJCNhyiYqkG1gKvP1QCOoWCjJgZ0BU0zebpcanySmeItXLLgzDXNb85iBT
	Uo43xFj4ntp/bMKpL3VmuCEKlHSvv8KozbsqsAcWlXUwg==
X-Received: by 2002:a05:620a:4041:b0:93e:c12c:f127 with SMTP id af79cd13be357-9479f38d707mr575616785a.83.1794337089011;
        Tue, 10 Nov 2026 10:58:09 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e619affsm290954085a.4.2026.11.10.10.58.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 10:58:08 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
Date: Tue, 10 Nov 2026 13:58:04 -0500
Message-ID: <20261110185804.56861-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A16 (UX3607OA, X2 Elite), whose mainline DT
connects Bluetooth through the M.2 E connector (W_DISABLE2# on GPIO
116), with the QCC2072 support from [1] on top. Without this patch
hci_qca asks for a "bluetooth" pwrseq target the connector doesn't
provide, W_DISABLE2# stays asserted and reading the version times out
(-110). With it, W_DISABLE2# is released, setup completes and a phone
connects.

[1] https://lore.kernel.org/r/20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com

Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
