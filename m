Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003639;
	b=bCIBfGxPAkyMIWLuKcsOP6ZC6m9zqOxR72i2Mo7i82HmcUnRXlQqlG9j+ilKsahUBbD6
	 wk6LLLLD2vwv/CTv1LAeW6CVv1mTEB+endTa5cqLaiNeEieF2X7fK2mVxB0oxQiq92ZHO
	 OKZFL6HFMv/k01/jpHjvywSPMg7P7SZgjt07bLb17SicGqG4+cYgAXFX+EFG/gcBAb6dt
	 EskYi/scxXlPfM3P88ftneqa87GZUguWYGMQht9Lnr4SVrcp4D8pztNbyBDxsvq0fiz0v
	 hkgxBd5iimb69lKdUL5bdMXHXirHvsXr6JpYxDwSWdOMlgjCuN0rXxWquLeb7im8I+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=yabYAN78L21m3hUODeBgj+S9uA/K0JZUvhZOMJkIVN/Uvn1o62dZsWiWlaTcWd1KgKPC
	 2UlpIO7pLseLcHiygToQHroPlwq9vXb/V3dl9ocGYJC8O6ke8DYbcWU5tzGKlYryvru/F
	 4JoDi8mrL5w3tcsSzn3s8DMeNKhNUT7eCp7GYZtUpwtzinNEO+b1fboUfDeoaKlQqCehO
	 F86j2ZZuOLMvdwaXhMGtgPwVK11WWYy2GXew8qYkpuXxqHIvD/yzYdBr9LtejC3ECDqle
	 2C/dxToEzvB/BVX8HzCLca9fILvAbFhBCH8o70DeZynsnKDyz1hQdKojlqiM/Hc6lDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757F606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1757F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492690dd5daso648132f8f.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003637; x=1795608437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=rMquM6ptDsutIaiNx2Yw5NPovGela4gqxe32OKyBmkc9+Gr7c1LXKVFsiz0LwoHMGi
         580ZTI/Av7s/ToqUw3YGWhaZdKj7L+hk4AC7B7/p3oUSV2yaMvuL4fouNWcm5dvtEiAe
         E6O3Oo9LdLfW/a+SEPyGwjfbvyak/8GurZcJQhewbWGcsuzxAN0B9s/B0EsgD/osUoyt
         c0GJIVMyfi/frV5jVG6gZdURV0zzIO+LR1T6rddoFztdIlwcozOBUT/HzGNxP/7c5zQ6
         vFlHINj3hmsNKKhkennDdAzLsee+13zqdezn44hmvFj2mypUMX0AKnSBH9DuMy1DG1jC
         gVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003637; x=1795608437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=22Yb+etrzTQjMq8QVs46K3WoKdZCkY73lxUO6EQ81a+qKErSdWTDo7IuayfOPjRgMt
         FCWWftRMTVGQC7nesmEJRpHp5oRi9TdDIj9YonXJuZazeCVOyuxCYYvcvblM8cxkWftB
         lJuIVOPxsfOCMWN5rM80l1nzLGqOdkB4Ee6YhVLpH2SvAB4LrCNe0wEoEfFlco3/TzBn
         qY383byK4B+T+6nkqZqezSv2kgd+P6xvMmxe7N4yjNT177RqUDZyYiVFLLPRdCp+zWwb
         JVUrG4gb8T8AK5/t+8XX6tbUjS1cLyUmJ7Gp9cGUT7KmtInc7ruy5/bfBw7AELBM2t2L
         vXeQ==
X-Gm-Message-State: APuU4Z9KR7e58oMshvVAKMNi6kftKRde7uHIlbaGGWnL+4MMR8xxpfeW
	toj2yPZmb+M5IcEe5o+wj3u5T3RzK6zArNOoszRDZbtFAoJqREb7EPsw
X-Gm-Gg: AZFdTZdS+lxAF4q8QoBjSFEGLWUyGaoCC/fR30X8B/wifTSmAtMLkTyv7Kh2zq+AL0p
	a9wh6PyC2x2LRXkQC+TB/qIUVD6oK3RoEtDcUgRnlqpJZNMmt1JLGel+DwvrFY/oJJKQBFjhii/
	I4m5ZyNeL0e6xvt9VMCWl5945pwvL4Kklnl30dpb+dZ6W+FJCpbTYnfkVWXTmkzfFu1qwm9UCfk
	lkx5sIZqBGOZqfQXcrDfRrg5NPuYwwnMHAh/sUw9TGgetKrvuzs8vWjnIoJnnrkBEnf7+gOL4Wz
	5P9XdB7wy/vunsArmIIX7vKowicwWeNJLvr40rOi+9VcSVpaFQByaV2q2KIxaAhvrn+txub88IN
	ReFJ+um+JXoIdCphS4tiEXkaL2vUSPx7haaQ8lAQh4WYIEY5Hmr5q20OJv4BzUkjKk2UH+OWNKZ
	Sj9EnjYepJU7oszDdwWZ0sgrhtP6PPpKXxuZi2292a58ALRT2GXrJkKLS/L2pSBJOUHbM3d4bUJ
	XBdxAVvf2+q3tHudWKYlsvesgnlqTCzYXRF5tfaOoe5OXU0tC/X2B7RTcByTq4wO0nhW24FDpOj
	LIhojJNJ9AAMnY7YJ8B2vRlw5axdT+D6FLmL1q+DOu/nkQwN8s6owPTx5rYEiLoObL4NW03NJ57
	F00flS9Z6JgOJjUWm24DP
X-Received: by 2002:a05:6000:41c9:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-4a638eb6cf5mr4646275f8f.21.1795003637378;
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 18 Nov 2026 13:07:05 +0100
Message-Id: <20261118120714.31505-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

