Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12AB3A257F
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550110; cv=none; b=FaUuqg5Oc6RRZCzMZ8bmmTitA54RVJLYuDicnQgsjvxRXRWqX6QvqesOu/3KjEza/laL+FGp16vF8La/p4Kh9EkC0jQv7eN8J5f1XX69VbzBKcAsLcG/sQI8PS5kTZdiUYlYwDDpTxUpOgTuNI80Koy1cMB13IsudZF03TGdAds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550110; c=relaxed/simple;
	bh=GrX5EJt4t9cQ0y5PJf5xNnceKPLkSMXbMni6kC0vHEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dFkV4PxcpvUPtCT0FnLixJEebuaGPPBuSVPJamHch1cJWK0q454hhpazlRu5FasHDnaQbSRlS5tjj9dIPfAi2W6XM64epEFLYmJEMWOlGIiPHw+yFVVsE1mXIpgEiB/aaYESECa8QmW/5PdfYPFxpHI2Pp0UwHLq4Tx4p/FqoWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2p3KwyGA; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2p3KwyGA"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bb4d4fcb4so1830464a12.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775550107; x=1776154907; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61qWV5sp3TCv0+h+N/I/PUI4iC1Lq3vzfWty1ImfKAk=;
        b=2p3KwyGA/dKlU1tpK/sdHOTXlcKnBJLR36sSHWBQUul6dl1xvxMzUz5qOMgHD48V2Y
         HYmsAtUUJt0GFdXiQ5B0reuR+2cJhahNvaUXbHPG3ZNUL0C/O7DpfGiwoNd6LSkM+hLz
         2wjhySye0BQOnm4wAejTHtFchMH4wWx268uAzqL6JTPKYRkTMvl4BNQqNrGfX0nszMU+
         xH9bL8pKJPTXllaTbI5q85ENnev7r3kTsSLhLvkWDnlKgMGMOzcMnsnTgz1avn1+ftxE
         jMOzUhnln7k1uCztmg0oSuxQ+xyFc4Xf2Y7JFDTtzruAo4kJ8nBOAFG7C0h7aF8O4nLZ
         wmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550107; x=1776154907;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61qWV5sp3TCv0+h+N/I/PUI4iC1Lq3vzfWty1ImfKAk=;
        b=KtCuXhffFWtKBz0dzPnYqGpBXItRh1OsRIIbPSIAcgKex+nbmgRgXZd5BAAgBQ6wVA
         rfRaziPYLiVfQoZv6M4+8tAIBAkHHIepULV9FfR5CBC+4h+hHcelYDyABJXaQoHG2sxi
         jNi3ga1uWYOttoe3lfddhK+qyJTjt7yBsCHXH2Y4EpAONSNW0v6PvmQpSCnBX/IhQ+y0
         MHHrXaxwTMItarIARaQRi4+4FpD3yXrgceHgqoZQAW0zOeVGIrOSiA+6sFCn3y9PbYZt
         N3EID4MMlKdAbt0QnyQWHEBO/OYMuxWztAJ45F9Kishcfl2CuzXaClbxF1IvZXPUYFsD
         Y2xg==
X-Forwarded-Encrypted: i=1; AJvYcCUjkquSPIVUqTkfJNcs6bfFTDIp+KrTme005Gb2FhCbEyxFyW5IMFlPooYl7t7nLuofa0XlB5423rWs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu3JFgCFaQuh5RyW+phXZgBxL5z2abYyf+FBzMza088lca4yhY
	majG++JJtzdhwAS23HMjROTKCgFSdXiA0hJ1trWQHWpUWPmgAzfxsJWv8kv1g14IXfA=
X-Gm-Gg: AeBDievXmrhGedagR91QpNxgN/KgjUhxrxRf5JxyP2C2B2Q7LaMEg0kesfppDEXiW3z
	ClEU9nYnygJg1uW7a++/5ahMOIeWhqHbOROfCh5fW6TXkpB39gLs8o1yEFiFUJdVQ5OGA5EG0KS
	9Ep306UkQFRjTEKjdUvZiojypxw85WZx8ir8nFYxx6MiHVzKO08unE7Cn9qmte44riCdbeWB7QB
	P50/e41ZnfuFCIEz9fx2k3Igwh/Y+uDRHxp5UIu1tEw8zWfWfT4zEJ31qL35Q3+eszU/HZiKXlx
	FCnZsYzAWE3bt+nmcGq/UHh9Xu3BMHBYzkyBfQk6fpKv1kLrYFoc6P9RcCrWxOjNeUeJTPXHr/8
	DUUn3jjFOkYFjUW7Xq1E7W3C7s8/wW0N/jcNDvj7q1eCYjXM773R7Xljf4ldyNKlcelb17vrY8n
	XqazG4rXVH8baIljK3LuNsbfj7xmPKdmX+fmXwdGZuSTLCztYZXc+Xt1YM8lCVlRCIejkIF1/Ml
	BGlj3k=
X-Received: by 2002:a17:907:c002:b0:b9b:6869:bab0 with SMTP id a640c23a62f3a-b9c672f45b8mr892867266b.2.1775550106969;
        Tue, 07 Apr 2026 01:21:46 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028831sm525473666b.59.2026.04.07.01.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 01:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 10:21:46 +0200
Message-Id: <DHMRZE7498YA.2K983P59ETZ7S@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sram: qcom,imem: Add the Milos
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
 <20260405-rampant-green-harrier-eaf680@quoll>
In-Reply-To: <20260405-rampant-green-harrier-eaf680@quoll>

On Sun Apr 5, 2026 at 9:54 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Apr 03, 2026 at 05:00:23PM +0200, Luca Weiss wrote:
>> Add compatible for Milos SoC IMEM.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Doc=
umentation/devicetree/bindings/sram/qcom,imem.yaml
>> index c63026904061..38488e28a6b4 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -19,6 +19,7 @@ properties:
>>        - enum:
>>            - qcom,apq8064-imem
>>            - qcom,ipq5424-imem
>> +          - qcom,milos-imem
>
> Wasn't this imem binding supposed to stop growing and switch to a
> different style?

Then I missed the memo. Is this written anywhere (apart from LKML)?

Regards
Luca
