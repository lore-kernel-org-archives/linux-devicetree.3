Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607653;
	b=tCJcVTeKffPk2ymHewVKaUa3iyMVqxA/QdJclm7giI1og1mqtMyMb2ToOpUHEz/fSefg
	 pmPDfoSQtuFZcOdk/kbf1IVd6GXKjBh4GiB6tO5D/HaA2RS+GQcDJxKsggmIrvogtgQFK
	 AeQWj98PWxS/ee4YmUgwmw4vvmUxCxDRcU0CAaSTgdA8wfGqJU+aWddEwEeN2aA6q8O39
	 hGzc04RCTdmFHvZ+bf74PHluHIvt8d4KEWl9iUeiPtbcUkWW4ryrPNxNDtf0zP2Fu3yIF
	 tAginbPHVGaMzymH1oTwdCcE20hbipkFuiRacsh0HfN9rVZMSP9Z34CeU++DTDs3LEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AA+CTBIe0i1VFM66iKXDbZe0rv66Bxd6BrC2gPVTOMM=;
	b=KgltTQAIJ1tDFHB4mYLKZdi+7zNfzP4FPfJXzIyabqYwI1gtm50TarDCXziZ7Xy1Bohx
	 tFmDUSdxnpJFUSiOYnEA+u7vkGUlRlHjoNesreqoK5s4oOyUF2kj1TMtIfFs3vv7Q8hk3
	 CaKoK9DiOMtIiNppKDaNlFreCQKruNSFnSowfftD1SPbGkAr2hsCXuSqJp2I1dAzdEvsw
	 B8Arn6HQQbtQswjRLUBaK6S2UNW+FRgodp8IgHmJQB5sGtq9kGS+Q/xPUnHGKCkrr40JO
	 rYGs600On6Gb790uu/05i7GQbTGK2UqJF4ZywiWWN3ZNLZ1/qbG2UcZSjAxwEtuoLmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NBh8ovAt;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1AA606A336
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1AA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NBh8ovAt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4372912f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795607651; x=1796212451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA+CTBIe0i1VFM66iKXDbZe0rv66Bxd6BrC2gPVTOMM=;
        b=NBh8ovAtlaeZCi0uX0ZwCSQj0L+54DbjuHuci6PUcaZoCr9MhLyDswTNJkvCr5goDo
         pvxwJmt0xo4YHkEq/FppG419UgoGEUaVUWrpWbgjPpNtdqXRfUIwLza7YAOPRpiuMK0O
         a9m9I2bIMaVUAQvnrBpcvW4Gj+0Ty6JlX/hjQJhqa+LWtVBBxSwL51gQ5KIWQl/e2Cl8
         AR70LRS/goffh6Z8yajrC5pNr4uYU31406nfsBhMf7aRLe2Ig1Q7jtlghYhMXuz6WRuQ
         NSZ0jVT54G4D3FgvhPjL5ZpWxDpnBXOU1enanMsYBD8evhEcyjNEq7j6kMLHaC/NWLbm
         qGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607651; x=1796212451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA+CTBIe0i1VFM66iKXDbZe0rv66Bxd6BrC2gPVTOMM=;
        b=pXL+9XTA0BapiesXa6WucDCQbpu6TT0UoEoeP9dH7nRP5AqU4otX6QQVfPZfVwMm71
         QhFDzU4YeuTKLLw6GaAWPOLqdOBRbB5sawzAMGmQ6YT0obpe6cII26FuSUGDQHOyDtKO
         2M91AiMDZxDujQLJtYvBZvOXhIlAbGHZM4vu11m9faRIAApDHpXjDefE97sHZpveXWQB
         lwwlj6/4zp5hT+pYkf9uqE3JJOszb3ageZ1CgQB/pN9Z/09qOej+kezz8pF4mY4Bezk3
         qsJhG4Pd7CyoBh3ObIlAoB7Ww2TU9+DbL49ev6W25us2V+p5S7ZCGCHZfqhHwnvFEgBE
         sC9g==
X-Forwarded-Encrypted: i=1; AL+hErHFhk+RfSPqL/gZxQhtOmqz2568EJYIBdA6BtUAuxuiLYBHej3weSAqm+04QYjCdR9Tflq+fY9jw37h@vger.kernel.org
X-Gm-Message-State: APuU4Z+41g7PQL1YW2wkCoj2hCXGpCxCPQAZp64rk+w/xNat0/sINcLF
	QEOcizry5zX7sUum4kapk57eBdtr65FqJmDEkXy4vSOwYQwJ8ggIqPLn4M0qkJgVqbU=
X-Gm-Gg: AZFdTZfzGi0Z0Bq9nu4MmKG87dDGvKCWmgg5Ue+OcJdpUpPnaciQRLME5nKpw9M9QSY
	19tSEgwApfxDIpGVicv6/RclzdHml0oHOmiGRzST5qHeqK1RTeEeORWtdTwez0U0cK8BtEGIDFm
	CSNwZwbctR9yKpxAMV0ip2g3W39I4BPIpfCl8ubT6Pp4vTb/rZDj0T57gg7jw7VWBe8ql5YW+Kr
	LnQKseiZDuwaje+Y/h8DSN9mUEsZZptG/DmnmA37DLAyjsQrsZ4Qp5IRBkej6h40dMrgBx2yOGg
	4GGvgc/DG26yXU6MjKPs3vEqdNIbra/Y0IMsFxaBOM2okNh0XHeUHYqPs8DAF6wVsut1eQ9otjd
	YKBx6ODujut7NmTkjq8GORvk9Q9kvtF1JGornSn6X2V3vQ3ZFQgoXx5BN0l+mfddxKT2CGEORdK
	ABaOCSuCTZ7zc0M5h4q+woNSnuTFiijGvN0Rx46FTjuBGLEtIGGJ/jSuwxyTqBOBsyVNtltdjzG
	FfgIDQ/jImtftpGYPAr6ubQfKK10Kxiy2iWZI6XECt1hfUkm01AN0+cQn+XsjETBAf9y0xu+9eq
	gZynoESNSq5rc58jYyOo7xUDrXPwjOZLwH4C7JTiBZDQaMfIyQ==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb8880ef6amr382305285e9.14.1795607650791;
        Wed, 25 Nov 2026 03:54:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm234073615e9.1.2026.11.25.03.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:54:07 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sm8650-valve-deckard: set BOB2 as
 always-on
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
Message-Id: <20261125-topic-sm8650-deckard-tcpm-v1-2-4af33e89ea9e@linaro.org>
References: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
In-Reply-To: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=877;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FPVkmrAWHJoCO846ejNKhvk2pv0JLVFiozgtm5MAmUQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsxfSKo/4v64Oxh5LAQOQwSP1TNftDoK6Vetaxgy
 u5/6w2mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbMXwAKCRB33NvayMhJ0ThfD/
 47sDEULk3AKuE4oRk8RvE4kioKOChwyDlCbs7g8dslDT40wkk1WHTPwNshrpT2t6WHR8qwiZKQi3ZK
 VwXmqzq9IjJ04eKuiW1dT9BJImZEwrmI0bXD7VoaPL16wOfeRz6+woydp7pg6wRXsSilW6+VPaaBo0
 +9MSFnsvPE2SMdaU8IFvOKU4/HU7NpmkXRpYrTxs5mEXVcyqw9WUvApzfpsCFTOC87SPwJo51UojLH
 5tKjoyJMJDHN46bsxgf5cmrthsJ3As+U246zBbTBEWI3PI7cHD7uMpkcseA2vNPc3hn2O+GCLAF/ut
 ojp5PLNdDJu6NvE9OC7CtyaGVd8ZTq9W/ckiW0Cqf7zlIZEIKokSs2qIXIkLN/Wf42ux46jFfWPlxn
 egCNFUcRmJT255DTCRGYK3s+Fd5Q9cFKKH5rfcqYEwZy07YiSJl9dF7B+ZO7zs8c81e+hUfkEvZH0s
 55uLMT3p7TKETI2+X9YKqiV/Cz/Ph/N1H9eY6OxGsGwof394aYBaATVrWhVDJ44hgL8RPqcaREpIQ8
 +Q8mKW4qF6BOVtRIxspQgp5NYxOHUzdCNJsCQVrroAeRFPQCY8bx0S+YycH3yl6SfCj6UML0TpYYIY
 Z0zQyDVZ7n8zxPiCvOlxmW4qi75yvtlXT6GfB6vDl5lDTA/92h0vILhlf9GQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The BOB2 regulator powers some always-on USB components, keep
it always-on and expect it to be enabled on boot.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index 6e7a8606d179..74bc0728ae7d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -333,6 +333,10 @@ vreg_bob2: bob2 {
 			regulator-min-microvolt = <2720000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/* Drives passive USB protection MUX */
+			regulator-always-on;
+			regulator-boot-on;
 		};
 
 		vreg_l1b_1p8: ldo1 {

-- 
2.34.1

