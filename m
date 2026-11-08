Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117273;
	b=4q9oevr6AOvWzCMwgPZTh3NUpdsGVstoxEFsSxkRmfFCcWfIxUsdWqZTQrudsABgzYwA
	 cA36Op4ix00CQ4orVo9bM1gOUZMIX897TyETOpfAK52qUgc+Wwf8Tk65nR7DyVe8z42tC
	 +Twh13T3Jw5dyfIJUI8P8/8XoCe40ZQ5ftA3XzIbMwuEFPABG8xPgv7COLb5PmXpPqhXt
	 vj+mGxfS2qHVSpmFICxv22Q/sv1Z0EdCJ+/PNlyJHpag+sBTMe+ddXA7vNBaaucUxbRzk
	 IcFFBjonaohXjVW0yYKEiYkl7Z85xtNR1AkVPgbCZ8LQtDfPWgul34s3iyZzlv5Q7Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=L43beYDW4BS4N30z31BpymDRZlEfGz6wPrl8MnrI2mT3LENh1mYw0sIvkQUDGpo0EIYZ
	 e3eVgGLSJMpJPGI6mrTiGGGWf7n+6/UuPVopF2Q4pq9TYJTyz/QIKpUDHAGZbw3i9HTXe
	 TlF0DXtbe05ped0Exu4KTDC7aYRUJxJk1xYoJDHc6zjTtMEvj583hJs2f70dHO2keuKxT
	 AcPTb4XKBeh6ftaaiLwwglSzL9ICBAzJXOQB+yi65KEoAe8eXQTlxJ3a9Y3MqWXSO9JhY
	 pcevTnr9gKB6wjMxv/uU+CfVzu1Efop7MaNG3760nuKyNR0JsAPMHNsonyMIpQwY6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBZxT6db;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859AD606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 05:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBZxT6db
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49318428d98so74413f8f.1
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 21:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117272; x=1794722072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=WBZxT6dbmtgGu4NX/AXvPKKVj319Vr/Z/eOdd2LIEwC4/4NrJcpuVqz1zOzGGyb70v
         5mJ/I/I1anK89arOMd0mRfkDJYm/TxSE5de+mZf5LIjwwG6/fu5pR+oArGYglD3KUx4j
         JFN4+64u54wJ40hNGqjFDrT+p+Ky/evMqZVy1ACMH8vagenfG0xpFF0CN0wwtLXtledx
         0NcHZqMzrtpOrecUBABlQGBd9VV/hgWv+0s4ynYpSFCTod2+xuIVLhMq/g9uZJ+VzKZk
         YVX9Y8LYDUS5nk1ZrpeZ2vU+BE3JZ15crcJqmHhQYnArxGf8TUeSd0XT6HfQXz93sI8n
         yBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117272; x=1794722072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=0OHINsJcOc5e0+T6e2htFNu+UfKG0JnyITVgDAV7ihfQ86VcAf0z2lB3RlMpfFVNJ5
         YJK5yZQhEmWFkq9C/z5ky461xDu9Uax3sxDuWBo+keFdeTKwOTTmhWTjNPk28Ljq0Nj1
         X0zxLz4c/X9bA++YSgvpDnwPnvnxAxx6OG3yIeIQryt0rvfOiwIQQ//UYjsex2U1HA1b
         ZbWV/w+gi0PP0wndZ/AnUR72zRXGO1oB/r2YDCuHO8ZlqQAOM5UBeQM1U1x8SxxG+H63
         vps+I2zRhBTsirAGejcOGI5T7rsh36EgP+iwHZ96q6jbV90nzlPaQpkieBj0joVk14b/
         +wpg==
X-Forwarded-Encrypted: i=1; AL+hErFk6583jo/ELxfg+J57o0aI3MuU7l/eJiun3pp4497tZTBSAw7e8u0z8VOkGz+FJDlT0ln+HtoUeqm/@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ld/3fWUtRixP4SknLCrL/WXHx7SZI8Rnbxc9otnaXG0w0JK5G
	sK8fmmtxE8nGq8sX1c91IT+2tqIci8wo+U3ofy0F/T4QkFdPGQuYEPsh
X-Gm-Gg: AYBFou1kcfE6SaVFYkgeMjQ8EZ+FYm5MwmDbOQoSk6AOMi9992ew4hjqHeyB5bszRet
	NgBCEL3aQye70m76I6QkIWGn0HeEtq42/XwkxuDa530vlO66XIGmHkSI3xQR7THu5XpQfsWGKTn
	Uazr63TojdaSLUhmvAG0fYXfDJWcLRWBDTC2No4PvrX/Fxdoy9kj7D9zaxVxAAKgAwclqu3qgwZ
	531e6ijnIdR+GELNoKISylLDTsqm6PvCn6yUFO8HKwawukV+xP/0P35fDHZvqGnZV4Y9ISJ8d+D
	Uu1qF0ydjw+rniT2g7RRogwX81ifMy+bvrSyYjf5hSFjWHbRe93/FPEQaj5VpD/GOhgRHfW2iP3
	DJHLep7496sUhplcPDV+UgPhndBMg20uVzkvKf6fzSCihBUXTd7jMqkLD/vnxPgd2pFasyHy+Fa
	BmdTXawVHTSgQKK0gSvl+5CIxq/638wBtMfn5R6QfdfhwCS+viQfagYmUznHh7bEdqQSaSeu+CF
	W8s/CzvJccNeVjA+PAOK3Zrxhj1hoMQh643iSlB6Qpih39er2yqN16ugkbG5V7ZOPc+6yyIsqxk
	Qb9svXkXxBZpXmdQXV+RuOKHWwuF1p2FHuTGPfZm4oe57B1bms+nS/7HVF9ukg==
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr1343254f8f.25.1794117271833;
        Sat, 07 Nov 2026 21:54:31 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 05:54:05 +0000
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SXR2250P SoC ID
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
Message-Id: <20261108-sxr2250p-socinfo-v1-2-06244862f5c6@gmail.com>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=eusKBr2+0jXtX2V+REaLhJvjDXWsVAPQF2wGIpxdLnCYV8LxqKnT1CEBOuxNDsOIg4ut7aHdV
 pYEIRbrScwVCVS1TplNw/GaP76/vXN0delHjd9m9g9w3l9CnTeLVhpE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

