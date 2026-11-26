Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680733;
	b=hZDNUh277+uth1t/zyWcjyh9gW9NmBxF8/2QrGGErVI50DSEWx78+ucASwFvcWEq2D9z
	 38qhCNXgc11LjKq0i6cSiRHS1x+4vYn4cBRz8y0ilwVF+kSezRVhNo0IEkoQ+4Ni1bzse
	 74p9+s5yQIsmQt5aTPglWWxNn/htQ4gCj+3gSQhgvhE3HOvdtI6kXvtL/J8KUpYWYJYni
	 9lSNv389mooARjdZjThMSUqeFP0+P+clJVBIneYU7dbVyhVR9YDFkOk1czyfl/Uwhltuk
	 /u1vIJFtuHs+yvYRc8SHlozoPDP8q1aEK8xuafzEzGhOmz6EbtWav1iDj7KjX5saC6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680733;
	h=DMARC-Filter:Received:Date:From:To:CC:Subject:User-Agent:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tebrHz3IvqJVQW9ErRGoXMPDohyN/Z67oVCXnCoU/hg=;
	b=z+dSdAOoItYg10rrgPmKKPa8XPuMbJBMhho6Tv+fEUMWEg29hmJ5Vep7Hr2kp15dsXuN
	 Glj0CgcFy+iELU42nBxS4eWKk2XGolbs9tgBXtbuXu8DCbmvOFjvpPPC2xfHMBDqhH4CZ
	 +AzC5wBxl+hYgtoJX0EDQ9PiFmgNoe92kW5B3wOAfP7KSuDFlM5jT8IyouAcE+XsvmSZM
	 QST0vk32qb73IBoGD1oKSEpXQ/kDygGi2N84Omk9mNrXBcfmZJ2RbINai/WUlsTO5Is0O
	 ydUuxNTJGoDKaRvP/6M+qwjT/wftaitSxbWf4rW6W5qnjsR51yftnY7VET2teW4JBGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C66606A31C;
	Thu, 26 Nov 2026 08:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from ehlo.thunderbird.net (unknown [IPv6:240e:404:1a32:1906:6486:8bff:fe17:3abb])
	by krgm.moe (Postfix) with ESMTPSA id A7B2B82E;
	Thu, 26 Nov 2026 13:42:09 +0530 (IST)
Date: Thu, 26 Nov 2026 16:12:01 +0800
From: SignKirigami <prcups@krgm.moe>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Add PM6450
User-Agent: Thunderbird for Android
In-Reply-To: <20261126-netrani-pm6450-v1-v3-1-2343209bbf4c@krgm.moe>
References: <20261126-netrani-pm6450-v1-v3-0-2343209bbf4c@krgm.moe> <20261126-netrani-pm6450-v1-v3-1-2343209bbf4c@krgm.moe>
Message-ID: <2D9293CF-5F1C-4CE5-AD68-4214DACD1C99@krgm.moe>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E4=BA=8E 2026=E5=B9=B411=E6=9C=8826=E6=97=A5 GMT+08:00 15:39:11=EF=BC=8CS=
ignKirigami <prcups@krgm=2Emoe> =E5=86=99=E9=81=93=EF=BC=9A
>Document the PM6450 compatible and the eight RPMh LDO resources used by
>Motorola Portov (SM7435)=2E Add the parent supply properties for the
>PM6450 package input groups used by those LDOs=2E
The remaining PM6450 resources are omitted from this initial change
because their RPMh types and voltage capabilities have not been fully
established=2E

Regards,
SignKirigami
>
>Signed-off-by: SignKirigami <prcups@krgm=2Emoe>
>---
> =2E=2E=2E/bindings/regulator/qcom,rpmh-regulator=2Eyaml           | 15 +=
++++++++++++++
> 1 file changed, 15 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regula=
tor=2Eyaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulato=
r=2Eyaml
>index 9115885e7985b=2E=2Ec91f01d785174 100644
>--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator=2Ey=
aml
>+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator=2Ey=
aml
>@@ -37,6 +37,7 @@ description: |
>       For PM6150, smps1 - smps5, ldo1 - ldo19
>       For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
>       For PM6350, smps1 - smps5, ldo1 - ldo22
>+      For PM6450, ldo5, ldo7, ldo13, ldo16, ldo19, ldo23 - ldo25
>       For PM660, smps1 - smps6, ldo1 - ldo3, ldo5 - ldo19
>       For PM660L, smps1 - smps3, smps5, ldo1 - ldo8, bob
>       For PM7325, smps1 - smps8, ldo1 - ldo19
>@@ -72,6 +73,7 @@ properties:
>       - qcom,pm6150-rpmh-regulators
>       - qcom,pm6150l-rpmh-regulators
>       - qcom,pm6350-rpmh-regulators
>+      - qcom,pm6450-rpmh-regulators
>       - qcom,pm660-rpmh-regulators
>       - qcom,pm660l-rpmh-regulators
>       - qcom,pm7325-rpmh-regulators
>@@ -203,6 +205,19 @@ allOf:
>         "^vdd-l([14]|1[1367])-supply$": true
>         "^vdd-s[1-6]-supply$": true
>=20
>+  - if:
>+      properties:
>+        compatible:
>+          enum:
>+            - qcom,pm6450-rpmh-regulators
>+    then:
>+      properties:
>+        vdd-l5-l7-l9-l11-supply: true
>+        vdd-l13-supply: true
>+        vdd-l16-supply: true
>+        vdd-l19-l23-supply: true
>+        vdd-l24-l25-l26-l27-l28-supply: true
>+
>   - if:
>       properties:
>         compatible:
>
