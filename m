Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314800;
	b=Zi0t8dWNrdiiYXnzuZr7CiKYaCBiYK26YxigXYJvR54rh+kejqzkZfxb4fZF/7Ca6Thm
	 IKqo9Z8VPGi3ZQXnTN5hNKsDb75uaJR0n7m+B50sa9Oz0lLyTo+FWIRJdLs7QnZsbsHlx
	 gGsTj0XBl5ot/NKvJS7zfWjDugA8ozgCeAlBiSKwbDYw4+6c5ITkRIi1jLcfA3jcRi8nq
	 Sk5RpkB9U5ZU7SsYWCG5yq8Bdob57qisBUk9sUOLCZpsG2ls1BrRkBOrvLG6MHIfwkJFv
	 UXq5WDhiK2Yu6fUi36xBWlWsvbHhFyQxTS8yMAwVPBXfMH3J4eZsNPJVFHhg/TRZj3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
	b=EhIScPYxu6M9/i5wkYGEIFuna4RmcDdLbwBT7cYF1PkdXfMjmKgpRNDVk8nKsA2SSzQx
	 Plwkw/6jCut3Csp8nrljKq3fhZzIAkIfxlaF7mcH02aZnRB6UnLve1i92tUxa1KElQV+B
	 5Zhn6mWb6Uv9ITXKbrt7jJnGHXNvryjmv62YuOzBA2rPHbYWY+UqrjUnmNgpnCOpM8J95
	 gVE+5Rd8fpsIzuLm3V7eBonuTTRfWtAS3zhgwau/vTiSUWN0c/iUDj76tY6HLAyDqg65x
	 phzsbLCYAd02zaOOtT5HcjEsrvJTTQrfmIZBC4WbIi4geGn2ttCQM8KzEI2z01f50NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B6606A33A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B0B6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1120940265
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794314791;
	bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=TrICYwcAYTtrym8vDSAPT2wgzAF6FWMVQILkGZ048uOL9bJbddoTVrQ+s2aIVhcwv
	 /h9YG7JSJFBRaNN0DohhY/xSM8GMZ+4ZwvUI0jeuz027MjN4YhVbTyteeQBWTtNxlT
	 PJpMAiWU2YLtuQp48TDReaMZS9XTSAMG8L316JWIZ1xxJvkMjEark3j8Zj9vIsM5ps
	 EVfA7daemXnXcacplbEpxgZl0i+8lJ8p3RpFo024DSeM0rep3gsHuVc35cpqE6l467
	 Dm3yasT5zTR8g+iva6PTrUi3L/rrVuxq8vuT9PfsVnXnlXsksyosjnEPLg18UUDQIZ
	 KhzKLiHqZ6uuLSS0aHO+908AYOIOX4ae/fRS9qGw1RgQLoQqlnagxwVJePiVbtf+Ti
	 /ujEoxzpXtCEIcJzPuyi9ReEvpSogfu9PViRDmCAVrW6ICd22KOgw87mOWQYMQhVf+
	 64zB5k78FQbmaHlrHkzdhkDLxTcmcb7B/7Dpm0zRYXe4s413Z2v2KwGPm7vKmuGk56
	 7UsGcDmRW0j/PxxS2A9V5rnXK/aJPuQhmRPb2egmrKw5eAt19nYA04nfieHyu+IRS8
	 XpI+aYVPDXDqdWlXVwib9zs8A/jD8hbF3QiQBT4vvl29aQTFaTD8zPkPFqabWCE4Kc
	 JRudUlc/u6TkibyO6nuWY578=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49febef74e3so13638895e9.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314790; x=1794919590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tf9Nhm3wEIZKlX+voEioL0VaJtWq62Gp0ZaFsQlRI4=;
        b=n5Mb22tPOyvkpkk2MmcakgRIgf6CmC7/Qzqc4ISPQLSfTCKR2g1On/I0Vt0dw0ecmF
         +7+mvFtSEZKs4n2WpAes8cnMMlDmbFA4XdcJA3yH3dQR7lT3TH+OvFUftbZpRxYI6KCg
         3kArOIDjBVy9rdfs7AlMsIzOUoz9e6KVZPGC7H/KrVGX9KTmylZjG3CmUd0bRQ91k/hL
         9TqXSQgs2eylwSHK+e8HokxE8MZLKSGfCq0/XDQnGsWUsU/vwNpwpTw5zrqoh4E80Geh
         fESvy4/GmM4fCFk34/cEnYlqEzpDBhXHT56ItDUK13l1H4gDVlMm9pbxSmCIJEptHjVt
         37mw==
X-Gm-Message-State: APuU4Z983EKEE3En4cIl3QnbWUsdAdUfN2a6YPyjhc3SszOXCnOLtv29
	35ypqn1cUIsBnJCQ/9Xmx+nL55Gkbi8/bW5V5gF+4NjweapMbcOfXbIVn3MCJ7Dzt55zq0erFcF
	e1eU3xN+Utx9c5Ck3WE53f+iOpBPcH1QQ61N9gFE0eO1bPXS3fqd1yBi3GOMH+AkqBaZ/KPPjfA
	RyaCw=
X-Gm-Gg: AYBFou1tATAqZs1RKm00GqshlIFaS6UV8ei0TkvNrs4uk6ojclMbAsmPE+MdrdZSluO
	iRHzCFLhh9ulfkDA4n0Cl4UAF0v37frTF5kCBgO6+cRH+/4xz745BZeT5VrcupE8gWOsQlFxJo4
	YaWcafSqXjmRuPbFhqm67E4wsFRNfcY8skslMXyaAUTu1a8SqcaPUvLiGmNc43Q7x3OBMik2J/n
	pPzHNOxng4yyITKiTQ81MlMPqETonJC5YTOrXU8VS4W+MNqeaPt5BqLZt2yZ3yAFSy3x1tJxMCO
	j9yGkAQmdDYAgWuWEb70DctgGlm6bfMOrQsruC+hfLn9fje1y9107+3rJM8MvRL+eU+CC4DleRt
	0d9FAtb17zHwy5gs3B92hvdrxpYwvLKmuE8JMbW1vQkCjlwzjzZIQI13fcT49s6Be4qa/5+aGZ4
	oSww==
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310555e9.8.1794314790557;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr41310155e9.8.1794314790230;
        Tue, 10 Nov 2026 04:46:30 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm71022925e9.9.2026.11.10.04.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:46:29 -0800 (PST)
Message-ID: <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
Date: Tue, 10 Nov 2026 13:46:28 +0100
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
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Troy,

On 05/11/2026 09:29, Troy Mitchell wrote:
> +	model = "SpacemiT K3 CoM260 IFX TQ";
> +	compatible = "spacemit,k3-com260-ifx-tq", "spacemit,k3-com260", "spacemit,k3";
> +

On the CSB1-N10SPK3 server from Firefly, using 10 K3 nodes, reading the 
TLV EEPROM of a node gives: "TLV 0x21 (Product Name): k3_com260_tq".

The latest EDK2 from SpacemiT derives the compatible from the TLV EEPROM 
name, so EDK2 will report "spacemit, k3-com260-tq" as compatible. This 
is by reading the EEPROM that was factory-flashed, so it is not 
something easily fixed by a firmware update.

My understanding is that the nodes from CSB1-N10SPK3, the "K3 CoM260 TQ" 
and the "K3 CoM260 IFX TQ" are all the same: a "K3 CoM260" module on a 
"TQ" or "IFX TQ" carrier board.

Is there two different carrier boards name "TQ" and "IFX TQ"? Or is it 
just the same thing, called differently in this patch and in the EEPROM?

I've seen EDK2 referencing both configurations ("TQ" and "IFX TQ").

I'm not sure how devices out there are referencing themselves. But if it 
is in fact one device and the EEPROM calls it "k3-com260-tq", this patch 
will not work for device-tree matching.

What do you think? Can you clarify the situation?

Many thanks,

Sarah

