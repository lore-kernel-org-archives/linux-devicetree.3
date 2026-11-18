Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029053;
	b=jW+EPXmoLnfgqfHdULwyTsvxPiA/Pt/7lthpp1YclXp3pXq9A+3wYvNhipqUNlfFQpxC
	 CwGdq12sPTy8rTWuH06dPjiYzzw7eGaiBd+ZgzDyZb7GxrT38NEcyxvIW2fJMae7CuYrF
	 RLTBvPxWmAU1BWFOolrH7EQkZ8z3ml/wh+XAgx4yuS6yll42h+M5438ThBBRiZXhPBu3U
	 CBQ8yfYby32hkzRcZjruTmAjmtQZDiUdFFtOsBrk1zuHzmKhIwx1TwpAoReFapImftOVj
	 Z1RI57yjaYO9n4GPK6yR0HpkgCTu6AoyhI9Hj2/7JRAwbWTp/pWImOchIpOxZNgxUWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029053;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2tvf2EcWGz18wBidfXOpH3XHWyYitQnho/idJ3+zHjw=;
	b=JimScs6yKcj6TnJ4WWdM9hM0R4M7W88s2uzyAMM5y9+orhZRs3NLgDbrbu/ekGpAhFYg
	 azgyEWxQC87K2nlcC5LzwD3wEabQBqBfj2h2JIr27REP6PK6nT4daQlYrm3hhB9pTSVrK
	 pvqR7BpMZNNeEEV6z+KvDT21lSSi1m3Sc4PHMyKTHn07kxCt8EHYdlqStXKE2k2Ie1vV9
	 YzTV9MSTOZqVfw+xpJD3e1nDH+ONtGK81vD5iz5HK2fh6vXnSU8oqp+eoQKJRlSINow9v
	 36HzW61FWoOygjLRLXkwxtHGkWN80cYnwPD2GLwAPrja+ad14a0exMoe9elGK2G8oPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=DZPLUL18;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6718A606A334;
	Wed, 18 Nov 2026 19:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6718A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=DZPLUL18
Message-ID: <f0c5f3ae-5a37-4f38-bd32-6191a6a98485@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795029044;
	bh=y9UgIWQynPgPoVUM6/yn261u+b/dkSIroE44iaL3T2g=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=DZPLUL186iJM63saUsDmf+QkaMlJDFQ0b3i6Pn4Ivn7rDVbd+CdgMfNGuJ5E61TgN
	 4nqWYMEs0NZYMTWbpqLapborXRKZ7R0tLvAAFshU3+Irce7MP/AlT4f3tisXyihh+g
	 56re9lp/cNYBe2c8rEQimJQQU13wKmVciZzaOq40=
Date: Wed, 18 Nov 2026 20:10:11 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH 05/10] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys and phy-names
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
 <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Content-Language: en-US
In-Reply-To: <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/18/26 13:34, Neil Armstrong wrote:
> On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The HDMI TX PHY now has its own binding and driver. Describe the link
>> between the HDMI TX controller and its PHY with a "phys" property
>> holding a single phandle, named "hdmi" through "phy-names", and update
>> the example accordingly.
>>
>> The properties are optional so that existing DT, which do not describe
>> the PHY, keep validating; the driver falls back to creating the PHY
>> itself in that case.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml        |
>> 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-
>> dw-hdmi.yaml b/Documentation/devicetree/bindings/display/
>> amlogic,meson-dw-hdmi.yaml
>> index 416fe263ac92..5a033fec21b0 100644
>> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-
>> hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-
>> hdmi.yaml
>> @@ -108,6 +108,12 @@ properties:
>>       sound-name-prefix: true
>>   +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: hdmi
> 
> I don't think phys-name is necessary here.

Ok, I will drop phy-names and use NULL as name in the driver instead.

> 
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -136,6 +142,8 @@ examples:
>>           power-domains = <&pd_vpu>;
>>           #address-cells = <1>;
>>           #size-cells = <0>;
>> +        phys = <&hdmi_tx_phy>;
>> +        phy-names = "hdmi";
>>             /* VPU VENC Input */
>>           hdmi_tx_venc_port: port@0 {
>>
> 


-- 
Best regards,
Ronald
