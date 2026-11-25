Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607651;
	b=rnxVkN097hkhhINwcSXvOr1ONbT5x7Q5vnsbSkbsgJwPAiTlMEMVfq+DRH3Kd60zO0dq
	 A7ePfrVTYwmg97IllphPc5LKLU6BP2L0p+hqgh024qiJd6/jaVIT0Whxnbu7T99qUeBYC
	 nJPKT9dlk++8GqslamYm7yT1nWd5mGXtegO7vn2CHnqWNlnfQZ+ZrheTgFEhgwHx9P43C
	 AjkJZu56jkD7CFSlCPfHtXG/fNA9VwVDqExnPQZyAvYoAzBVpQI+mTaL6D5rX4rwsPa/j
	 TiqBBUEp/gpgzLTkvnUro/C4aE1JRfKGKKzFYr018XG47n6DW1SWG/civSYvlz+Lcyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zRhT31ysuaijJ/dU24/Je9/a2fWEfgQAeCCZFcrzdQI=;
	b=yZ3ZDev7TP/VRCnfyTlneoaFgZPxpzfkCnFkxOtu9BcEu5LcFo17wUoPHW4716Bi5hLL
	 SWYrQRU79BLH6n7Gh/7V1OjW0n2EAdKKwjUoCt+1N3D+cboj6s8rnwj7EkXJ1kJzMe6Q3
	 omGiAvyPu8VDHP8yWBC8x1FHaxeFv+NE2UGCmnoyQZJsmzLy5fIOjLarZuJlFm0Omil1j
	 OscbVoyXLunKq6RCy4EH5+rsMTYX0im7e2TvfGDtB3NQhrOh1kkqSE87Sm8di5G9AqLCU
	 APn/TrLMCbSsy38w1zDeNuHUAlpe055CQO5kLKOeWtq++Tl5kUZf7IJGWI8zsAyQLuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=STIQ9xx0;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5BA606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=STIQ9xx0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so50054875e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795607649; x=1796212449; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zRhT31ysuaijJ/dU24/Je9/a2fWEfgQAeCCZFcrzdQI=;
        b=STIQ9xx0NMRYYAanmIAcl43MIStvuWVS9AmIs+ZA+QBeKIL1D+7lReKBMQB3Cv5SB7
         +rPyW2mjEfH5+4xw5Z0CodMMdZU/QAlqdh0uamGjn1AWiA3pt3J1lwj2zsBbvv0MXo1T
         CBGyR/n3QfrVg7VTNP51eE/wqi7XkMwnQx3V/dkc5ZY7GWXIfZpv/Pl19yQMvnOvUybT
         wHMne/8O1aHQguG/UNuMyIwFMIM0MGcVIB1nJZLXVA5hYAvysF9r2I+gZMabXtlqZE2W
         8D25DSGlyZWsuJ9pJ/gvtGDGz9l3v/S/f2beKrGo8Yy6nMBDitVUfDvmA4+mDZw44oFh
         6Rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607649; x=1796212449;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zRhT31ysuaijJ/dU24/Je9/a2fWEfgQAeCCZFcrzdQI=;
        b=gbYM8mSFkAtmK6dOFyKs8VDHTP5Ie/cfc0Jc6m2buZlK9RRdf3ZONKflEcRSy8Qyv/
         eJBIIDc6VJHaocljKmoh4mXpPtSjB72ro+eKLOqUn9dfEw9WpDHvuPQudUJJuXiDAqsY
         UTfg4UbJqN5pslNASSAhx5D4sem2sljQCLbyhTBfpQxqR2WYN+m0GYuRW8DWSf6T6Atg
         pp54ttMrZgsmme6VcQMw0oHGa5b8agu6kMGzuJMTv8Q83px8+r35ApeoGnKvf0fNX5fi
         R1A8Yxhc+WjyCKmkEo/x/0t4oa0ULSE6myRE7nVNtiS2B827JolVMsdz1yNApjj65Cap
         s/Aw==
X-Forwarded-Encrypted: i=1; AL+hErGTcPc931Hwkj5gDPxxU/52Y77rsDzjT/afya74n6af3y+qcByvo2S8iGpu4GSisY1NY4gF8qCC+7XL@vger.kernel.org
X-Gm-Message-State: APuU4Z/G4EQDg/ZcleGu/toeZtVCBu8Qw2hgwQfQzj7fDfH7fdhtyNZ9
	2TZCtVm6K4DIiiHvngXIkJ9glC7qaYGT29+g0ZqycverEqyh0/NOmAy1QS0irtvtSII=
X-Gm-Gg: AZFdTZdP9zs7i/rubG+Ja66SZapXFsnFD5+kkFQO6vQxgwRddbAFYB0/iya8r9qU5Ql
	CdYppfD/7Uomk7zI6UBaX9tqaYpCdwaQi4b/5pTfn9Sm+0ZLCW8LYNNlj6FdLNxHmxIyAGhKgG5
	8AOSuspyytCjywdaX4gEYg9wIs4g8k1W90vSch9T3Qtov6O4Lu2w4taIxL7LSuzfKhO+ZIa0VEq
	7HO5MfLUSSIt8ztWZKweWqKqchPtpW7CkUDHl0vgvqi01SCMdF/zBPXbCowjbKhfkIoKLuVaXG0
	K9ShkpuFbcVZ03xeQ7TtecUSC6GsPvSJyHc4m6k5dwGGWGv2nPSt0Dvqo343WGOvP0JINsIA+jc
	G+8h8vjReCKpIGUovAkiGk5qPKejJOiUEYKtNSfSndcvgLL8b94piVCXDe2pgY8XRqmxdE8Xx7k
	PykqXK9DdtvNY7VZ/v2VeoYzY3HBXye0K68lTENdRb74wlBXz6hI7DimFy9rAwfZi2tYJSkMSPg
	lciwuR9pJEV9cWpdsvoMAVAwjNbqwIBfNkZE2XBRvtBgerFV7UYJwScHlMwVdjWqxkx+NpvJy8h
	RTjPPuJW3RDMpb9Jm5Bpga943tWMAOHOf//D4XLrPdXIMoljvQ==
X-Received: by 2002:a05:600c:4e87:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb88922c81mr357192965e9.32.1795607649300;
        Wed, 25 Nov 2026 03:54:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm234073615e9.1.2026.11.25.03.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: qcom: sm8650-valve-deckard: enable Type-C
 controller
Date: Wed, 25 Nov 2026 12:54:05 +0100
Message-Id: <20261125-topic-sm8650-deckard-tcpm-v1-0-4af33e89ea9e@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAF3MBmsC/yXMQQ6CMBBA0auQWTsJLbRar0Jc4HTU0QBNpxoTw
 t2tunyL/1dQzsIKx2aFzC9RWeYKs2uAbuN8ZZRYDba13hjrsCxJCHU6eNdiZHqMOWKhNGHf9fv
 ggzO2C1D7lPki7997OP2tz/OdqXyHsG0f8W8w130AAAA=
X-Change-ID: 20261125-topic-sm8650-deckard-tcpm-434796951239
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OAXA7tv4rQ41VW9EpqmMAyss+JFEaIBUrOpUPjQ/e7k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsxffJFCCf4SjJ6kjvsBe4Nw6WEg7EtnDjNo5wfQ
 3K21DP6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbMXwAKCRB33NvayMhJ0RFCD/
 9hQ/gSbyCYyoWiKCMEkj5sYTOduIW2b+m3fCc4EB40ALq4l7YpVQAUcKGd7VNqU2IpXj9a26YhEGxL
 3guozDUgWvjahoe2DtESN1erI/5bxN7o0sW29F48ZdlrtJyLqxLWRahIIWo+ytQMR5+trGt/EObPi9
 dLN37xoBRb2DirBHpM1gabZCfy4m8pKamNVAd/iBO9MARKXYYPZTZRokjSXtibTcJEsxe965cROsdX
 Rqn/hUKr9DXSqKeEM58Tn5DQgXVMzD49LFPwbJ+0VIX0edgx0LtnXWbotQ5jWXgLK7J/U66WB2zxz5
 jH4cy/Z6XC1IWDGVjA5Mv3unJvBsnlojnl6L4EAG9bfmtx56apNajlHGIiZIgRc8ekXCMlutWSHUPl
 i+fQ3I0PVon13LlKYw7qUCz0Q0d9b4zRVQzl7Er+uZ4y8kEWjozXMGYHO760f9pMyFk7Ea6vxrVsMT
 lGYquJ/R2y+hvccM+S96QJCNlGpje2GXQ2sbiihmuEO7+VYa1bLis7aCcbaaKNpwziZfY9vfU41a7R
 0Dlf+rEOaRkVyTSpeEcUufRgKbaNIZzUZxqvtLWoc71yYvcqTa8szHbyg5QTUvgYOj21k5MJRcIStJ
 O+yPj+3oZ1/ctuhXL5mMl+QsAUuZG93x/+yrkY0U6tx8wBygzfkW6vuzDIHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Describe the PM8550B OTG VBUS boost and the Type-C port controller,
set a regulator as always-on and enable the Type-C controller and
PHY on the PM8550b for the Valve Deckard headset.

Depends on:
- https://lore.kernel.org/all/20261125-topic-sm8x50-pm8550b-tcpm-v1-1-f54040ccbbaa@linaro.org/
- https://lore.kernel.org/all/20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      arm64: dts: qcom: pm8550b: add USB VBUS regulator and Type-C nodes
      arm64: dts: qcom: sm8650-valve-deckard: set BOB2 as always-on
      arm64: dts: qcom: sm8650-valve-deckard: add Type-C connector

 arch/arm64/boot/dts/qcom/pm8550b.dtsi             | 47 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 52 ++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 1 deletion(-)
---
base-commit: 392248352ef971b473b50349ca834e5942bc404e
change-id: 20261125-topic-sm8650-deckard-tcpm-434796951239

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

