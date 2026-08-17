Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2C3BE620;
	Mon, 17 Aug 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960021; cv=none; b=JQ3FOe7WncEcK61/P/W2pblhYZbL4PlDHjog8728jpj+ebFXfzg6rCrHUEAsKMWuudxa/ujzHZF13KS74XLL4aZ/IXTWoY8Pgt2Diu4FXih3QQHZAYiR82FWZ4emJ33MwhOImOkEVZQ1g41Fe5Rx+S5Wsx6+QYu7R4BR00rku6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960021; c=relaxed/simple;
	bh=RKlBklNLnh1ZVjxUS7d2PKQy11HJakptQR6mkTbaNOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ekpKNjw1jUkrpGViGvYDKGiXX4UtS6z5wMiS7y8ULsmuFHf4ot9CbdeYHnE9Kgulb/MuGIe552ci/QuFidCE7sqLUkVRo+xWOPehmSj0wZj6Y+TgBXFawZxihp909/HDp7Kxg24QKU6VqJW2swW8y2o7DIIZVrK2bAHYlbi/Oy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFMVVi+u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFMVVi+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731331F000E9;
	Mon, 17 Aug 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786960015;
	bh=QB42Q74WKWHddDWR6/3ij0bZPGx0hcDAtRyHp5pE474=;
	h=From:Date:Subject:To:Cc;
	b=mFMVVi+umgQ5Cj0V640rjq/HVP24v7/DnC09mchZVYsD5ASaMWU5OZQJWePbgsfKP
	 T21rgn3mEQ3B/4ZBnPB6y0d8SlJZ5wYghvUn4wEZLR4VUS6dQjLwI4aKVJA0mjOChL
	 Es6TMlDJI2C49O3eXW6pjDB211cxI8NZ88ZHR1ZC6z6zSh6OzC/gkQ92CrMstK8Wz4
	 UPVoZ5aNZDzh9ozeSjQjO4MdSlTvvGlsl5048lCubDQ7uBiqfUOeFu8ZSKiYigVJqx
	 U16mh9QW9ccAecdLr5oAoooiYOs3/xPOlKoC5aCoao/P6Tb1e2Xy05SYMojkDLIY5O
	 JAsZjMUay4icw==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Mon, 17 Aug 2026 09:46:39 +0000
Subject: [PATCH v2] dt-bindings: vendor-prefixes: Add Xuantie Semiconductor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-xt_vendor_v2-v2-1-8d4eed65a533@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH7YgmoC/03MywqDMBCF4VeRWTeSjGikq76HFLFx1PSSlEkMg
 vju1XbT5Q/nfCsEYksBztkKTMkG690eeMrATJ0bSdh+b0CJlayVFktsE7nec5tQGKNRdYORPSH
 slzfTYJcv11x/HebbnUw8jGMxsH+JODF1/2wpVakRc6WLqi6UUGKcPZO7PIgdPXPPI2zbB2Yv8
 bKtAAAA
X-Change-ID: 20260817-xt_vendor_v2-cc721afc0de2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0

Add the xuantie vendor prefix for Shanghai Xuantie Semiconductor
Technology Co., Ltd., which provides the XuanTie processor IP.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
Add xuantie as the vendor prefix for Shanghai Xuantie Semiconductor
Technology Co., Ltd.

The vendor information is available from the Xuantie declaration
page [1].

[1] https://www.xrvm.com/declaration

Changelog
V2:
 - Remove "Add Xuantie C906/C908/C910/C920 compatibles"
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..89391cb467d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1905,6 +1905,8 @@ patternProperties:
     description: Xilinx
   "^xnano,.*":
     description: Xnano
+  "^xuantie,.*":
+    description: Shanghai Xuantie Semiconductor Technology Co., Ltd.
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-xt_vendor_v2-cc721afc0de2

Best regards,
--  
GUO Ren (XuanTie) <guoren@kernel.org>

