Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5593E3CFF70
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234652; cv=none; b=AWc2bMhy4/fQRFw21gjhfHIGFln2M9MLwWzpzrO32pc/Zc1dEK35ueM7TOTw8qbyRYuNstm/Bh6pNVWxHBZ7/evHlPh94cydckKkT+bJEBEgnbtWBQ5B/zt5R2dOoIGiD7SWaPEIlLizrEcVddoPUp2lOixMfyuE06VgGdNH0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234652; c=relaxed/simple;
	bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oc+M03os63Uk/vCKyN1bFEePapkJa0nfx8RiV3qthitabMAFKHCaoF746g7w2txzT1PGaeuxRcxilVD5ASCZLLL94SkMefzEPdMn7S3q000x7mb+l+fkQTQc5nzbDRVA+H97nJNmcN22V55Ik6phYwBP4081+6l30qZ06npa3CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zqcdEjHa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zqcdEjHa"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso147050366b.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234647; x=1775839447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=zqcdEjHa9ePvncK9nBm3YpJMCC5jYwE6eAoc3miUGvEVknCKL+nwjw/1w/wiQwuFGB
         x/WcPzyzFxyryMhvTpJvT7mDLVep5NGaxbP7mcCnOIWHdBe5Jv2SAfv2nU0e4HVhWBpW
         mazepIQLnD8M134/ZF/p5JYxe+XKCkFkDvjlsXjGzuaECto2NVddXK+3vLJhTkmPuPAO
         6HJKyPt9KZeufIyJpBQyDAw/4Evd1665uDyDxXETS2Fny0hXMLP0V7HuEuCQyDIvvsz7
         Gkj6xrgK5eDU6KFCSZIw4MhcsFsptBU7+Te1bqcNTu93QPrl9OhSMpfET5Rih7GJQHTa
         bJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234647; x=1775839447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=SPGYEglXTgkFkb8vfpZ0uE8bByJ9/zKwCEaaE6aO8BA+MD76UqWbvJ2VtLKYJ9Yg5r
         uPpuwmpJFTB3X+4EEPDeZpyQj826ZWlMQQnP70lqePoqznyP+ffA256QWAJWbDLglAtD
         1z6XWLQ7ee6eNeOj1ztR8zOjfV0+gE3wDmszPtdMV4yZwn6etJXApuJWz7OYw+ECHDZD
         2qrht6B7AzV+rtXh8jIivEwrsSdTIdM/Rk0PUaqSscgN7Tf0XQSoLTL5sxst+m0TQIAZ
         yWWft/PQ2sTxdIaAPGNmywgCm1AwRx0NXKXdiYHHZTIIUGzhAeNzEkIlW2a66qsJXQ59
         3/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNrrEXkBvh7+FIMiiPHCZ5uQ3EmkaNiU2GomHYyjcHwmZthvnGkKreZFrbMtNKl8jtJMtY/NbufkAr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dcuc7rlSH7NIU2xiicFuR12oDAJWyZ9/BOcfn403o67XyleS
	JpQ2ay1zAT+AxU2hze8AsBzHOAFHr+Yc3smv3RNmNbq/P55ov7LS6b6yJHGGh8aA52Y=
X-Gm-Gg: AeBDieuNTxRz6FlMs4JJoqIQu+KvxM45QmS7JBNV3+dBRA6zwCOdKA1aMd4g/PyddPO
	+rPl9TZ8+B+DBgTGZRvyz8Pp6RTkw8ZB8DYMuipilbIZwF+Yl/xJInfWar/Sn5LtSX2qDl+5iJR
	BwxvRG1J7Q93p5Bo3hw2LcDinvTXbEqREX8V1QIeKhm18xZO2cEZ0iwfV9XJpGs3REeAU9elSBg
	vwUzUgxEcMBRh4epIfIlcZ6xmQoLXGXo6Qi43krSrUkgSjQqlx78dnCOeNXXFwtz5gL8CFLBccc
	CDtwcJPet7nl2a1V6HBttBCMsynlnJOmjrEUWvPq9k9HqChCn9nK81EGyHoyw7zRLNRoVLD6n8Q
	9JetAwmkdLX0h+6R4XWifJgHHODiSJSO2vYZwoLjidgAuJZ/RoEzhD12rliZyy/DoN9R3OUmAyr
	8w28LbD/6+qkz+YV8a3Wp2JYXVi05cjiWWK2KgKQaqfRXMxi6kwwaHpp7WmLlU5vg2lstsA/Ty3
	LVMXswwryQC36FZmxXjsKVsWXpY9QZI7QAxBQ==
X-Received: by 2002:a17:907:6d05:b0:b98:8e42:95ee with SMTP id a640c23a62f3a-b9c67b9e36cmr170984166b.46.1775234647458;
        Fri, 03 Apr 2026 09:44:07 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:52 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-6-01e9e4e03d3e@fairphone.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
 b=JH5s532eJLrbkYEhCO81ATxiNZvSlOjA4jvYKqWx9Im6HP9GJB+uMtLmI6LL+WUd9YApjuxUY
 XnsscnhBa1nCaN9g1z2pFNSWuIl/LnuTKTRL9nqvdqAlri9/er5aUaD
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the node for IPA which enables mobile data on this
device.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..31c6d6627619 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&ipa {
+	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
+	memory-region = <&ipa_fw_mem>;
+
+	qcom,gsi-loader = "self";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

-- 
2.53.0

