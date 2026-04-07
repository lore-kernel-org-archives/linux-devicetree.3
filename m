Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677233D505;
	Tue,  7 Apr 2026 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574581; cv=none; b=jkiR4fYmwfHhRnN5bVpJqAHBnqBi0TjqG00g+blfYNLgVAzcIN5LUVrM96qo9WH6KWJklf6YylPahsMPRB/tR9xLuQNSZ1xRfItQDYFQo2KoNlw7I3c5J4cEn1wrbBaecS1B7FxtVAiZRRw0ij5as2/qpwX1WlT9P/QTORF9smI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574581; c=relaxed/simple;
	bh=dkcbGVCRR5JfW5kZaQmLiuBhWaoFEwvQeU9ASSY32kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Csazu8yGm3kHb2RnJnijsebcS29wevpTS7kNnCNaz9izaAhDKbEH7sN6ZtoArlHdLCY5BowsVFzPaOrAYF/8o4bvHTVCshPsJpS+2ORgsE5Z6nQ4o7riIaFmjTnoV3GfN6ehXV67KkRcJYO8jJlx2YZIjMgJRXJRkQJRH1SiAV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=gfQT8L/e; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="gfQT8L/e"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B98CF10E33C;
	Tue,  7 Apr 2026 17:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775574576;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fUKRr3PIBlTzdV7W5Whjo5YyCw0hsjFvMeaap8RDMWk=;
	b=gfQT8L/ePFsPjNOlKK7k4A8ISlVQUwClinREShy/diZqB70BOY43EQwB6JhIiJJHrtQWet
	xaxDxyWLPzX1j2RvMm8/jtZinzR9neA6m/dPmrHL2ZTh0TivcHbMT8SXrRIXyZmAc2eQmC
	uWb3saPAGAaNFP5DG1xfevjSqP+YDyCQL3itj/wcesOIM26SANxL4snTrnLa8CbIMkOjG/
	uv6ELiglcBwNlO992owG7IPXHLH6FufdjnKXibgtwZvknkRkApNMm0ql+ASjKi9r+CwxTJ
	f2aqkyl7QcFb8opXCWp0DlBHIqEN0r0td1ZbL6mU+F7VbO+LynOsSEPK5ztzeQ==
Message-ID: <c3a9c4eb-92ce-48c2-83ff-18c7ce03acd9@nabladev.com>
Date: Tue, 7 Apr 2026 16:51:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: bridge: lt9211: Require data-lanes
 on DSI input ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260404034123.340818-1-marex@nabladev.com>
 <20260407-invaluable-pretty-leopard-1e8dfc@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260407-invaluable-pretty-leopard-1e8dfc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/7/26 10:00 AM, Krzysztof Kozlowski wrote:

>> NOTE: For example Linux kernel driver does already use that information
>>        and fails to probe if it is missing. There are currently no intree
> 
> The first sentence must be part of the commit msg. That is important
> reason why you are doing this... but I don't see how you achieve any of
> this. Look:
> 
> 
>>        users for this binding, so no new warnings will be generated once
>>        this is applied, but a new user is about to be added.
> 
> What warnings? How?

There are no in-tree users of this binding, so no DT checker warnings 
will be produced on existing in-tree DTs. I am in the process of adding 
a DTO which uses this binding now in arm64: dts: imx8mm: imx8mp: Add 
DTOs for Data Modul i.MX8M Mini and Plus eDM SBC

>> ---
>>   .../display/bridge/lontium,lt9211.yaml        | 37 ++++++++++++++++++-
>>   1 file changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
>> index 9a6e9b25d14a9..5264fb2b68b78 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
>> @@ -36,18 +36,50 @@ properties:
>>   
>>       properties:
>>         port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> 
> OK, that's correct.
> 
>> +        unevaluatedProperties: false
>>           description:
>>             Primary MIPI DSI port-1 for MIPI input or
>>             LVDS port-1 for LVDS input or DPI input.
>>   
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
> 
> That's correct.
> 
>> +
>> +            properties:
>> +              data-lanes:
>> +                description: array of physical DSI data lane indexes.
>> +                minItems: 1
>> +                items:
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
>> +                  - const: 4
> 
> That's almost redundant in this context - it was already there - and the
> point is that it solves noting in the problem you had. Binding still
> does not validate the ABI and does not match it, still.
> 
> Since commit foo bar, driver needs data-lanes, so what you need to do is
> allow them and to require them. You can also specify their constraints
> if device can be configured multiple ways, up to 4 lanes.
Please pardon my ignorance, what exactly do you propose I change in this 
patch ?
