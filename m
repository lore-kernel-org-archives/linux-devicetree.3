Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE52135AD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659042; cv=none; b=r/lpEXcVdKg/4nNHk38Bv7gHRJoqo7lwIkn6x1LbjVdBErQ2g7yUEJzLgFham9noeJ/bpirHTIZaR/hl8QI/A3rTJxOZyWdKvQP/znePnS8OeOvYHA3fBHM2dWY/YU+wyHODyEqJGPe9bo9He4kNR9C5OmjrbyqnjXv1fhPExqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659042; c=relaxed/simple;
	bh=LnpI7omOEC6ed3yh4sMYyXUnlgF+nBTRExdP6+eDN24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZQNbmNpdu1Zda3hcriaeNbfoq4k5WYxrlQEjTAItuZ3Gpsi7wQdmcMgJByZBMN5KCpctKGoQn1LhOziDdYuou/bFk9760BmVtbUKMTWSDd8qCyNp6/SLkj+PiyuusO8ZBaMg2S+6YOA8qPdm7c5KnIzzVXcIK6uibD5h9KNLOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joks/iQZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joks/iQZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso33090515e9.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784659039; x=1785263839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Zpdvr4EUuwpLXzsAE7Bu6HGFDWU6M1piUgIe2pUnOU=;
        b=joks/iQZXKRx0cuX83R7cWMe1/rqOEK/CzeanK10Qhruli84xCOw/BLDM9+nFLPiX7
         aycVpJHt4V5gjfTyfcXeH+Uwopm4S6YzmH7vEnbhfROnHXvhWzF7HPt4qHWn/8CLZD6d
         reSq+d5JVWOpze7iRNbDvNMTBIhfoErs0jZRD8zjeFrgAqodoj5jcH731/4RO9Xzi3K3
         A02ZuV+akm3PwuRPXUwsRYqS6tTXCB13gnCfcwkS22EHOlcIOH9kVjRPFc5N8D8KGTBi
         mzhe04sPl32RNkOsnr5lIUrarjHfJ1JFFqJIlBgee6EgXWsvL3jh9ZFywQKeZbe2bC7r
         yFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659039; x=1785263839;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Zpdvr4EUuwpLXzsAE7Bu6HGFDWU6M1piUgIe2pUnOU=;
        b=g4vUOJ+9TzjkfICI8C0sW8fFq19vSOnv0+r4yiFhLAOUTqdZRiOKJOOni4OIOGczdb
         wsNRMPL4Y7ErUNIRwnmc7uXyz134GQwungCzVaeiyx4gDQfb0xuCccKb843xOkcIJtw2
         bnZ6CIu2pQXu4d+jvdGAPZeY14IJlGtml7U6m84RNaq2PL7l3yXMyeeq4loJ+mtPuY+b
         vDR/XabFf0/UIwC0ul/c6M0LwVyW+56N3pO9RkV1F8+4OXyYuhW0Y4yr7Jl+3cGFjHJV
         UQLDO3X0lzH93xlAD/R2qDH4wdnstmR4xnDYQtqn9LBO9ZqhlHH3gewZQ/UNK7N8riHF
         FtbA==
X-Forwarded-Encrypted: i=1; AHgh+RotU6air49HI8EpwYfSV+6Ohjfps7rhhlKeC90TC73oDIEoRbu0FfzSO+0Y6UWCjj/oM+jgyFl8FKET@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xZgf51UCPx9OEDB6yfmdrF5nts0UopKmGdYO0WndctVbImPG
	YpULWdCR4lZfhT+P49hL4TkkuG0RQ4nTqQ+aWATwgqJWo7m0XlmQfHg8mj0/7A==
X-Gm-Gg: AfdE7cmEu2O0tkfZDNgKHvkogYb/wHhpr3SLZmWk0Jo+CCVtKzSQBIZ7yql/YnF8ALZ
	0E8tRFUrobuiQPowEQbLtiRweXDcNHTowVNDuitQZ27N8+LNVEoPGUctnB1G4mf4byTkOFf1hMH
	8XNQvaM4wS4n172u31jo4BVwYUVanD1rMC6kjF2QKSHhJf+StHLlBu3D9FjgWM6gHPV5TUuHRzc
	YrSGVZkQ3T1Gie3/k55R/nAP8HflG4nc9+9gm+U5mhy9nvWQzG03Oq+on798qH2nRuVOAApIGGC
	uh2IDYCspMd7QBminLGXb3tVyjd32pvvGi4XpGjp16MTC1bM6B/1i8wpg8nj5nb833/yjmHky+j
	OAchmqV8QlM82PBB6jwQylK9BmNt3c19kWbzTMd93/x/8H8rR2mMjXgbevEKt8qsxRpbvlcZJm9
	n09TLIJW9MY2POymPRW34BzdWODx5tbBSbrHajduhEdOFBwMJ7Cc31JHy68dyP9Su5nKA1/8Udr
	DJihprru9gFYBzwx71CkWkuH/ikBNXYciLiJFRDUkXQM3U+RYefecRw2ihFDAnWSOeYPFn87F/I
	y8n9venpVoAWMUj4M73wbANHiQ4+F8748Hb+PPxG5NmBYhexOZHtX4FTec/ouhKBzk1iQK5tr66
	8oGlKsQgjUEs=
X-Received: by 2002:a05:600c:3b88:b0:495:4d2d:82f2 with SMTP id 5b1f17b1804b1-4954d2d8335mr224381425e9.26.1784659039580;
        Tue, 21 Jul 2026 11:37:19 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm79422215e9.2.2026.07.21.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:37:19 -0700 (PDT)
Date: Tue, 21 Jul 2026 20:37:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add support for mcp47a1
Message-ID: <20260721203716.0fc5313c@systembl0wer>
In-Reply-To: <20260721183358.67E151F00A3D@smtp.kernel.org>
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
	<20260721-mcp47a1-add-support-v1-1-da045a2567e3@gmail.com>
	<20260721183358.67E151F00A3D@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 18:33:58 +0000
sashiko-bot@kernel.org wrote:

Clarifying Sashiko's comment:

> [Severity: Medium]
> Does the MCP47A1 actually have a dedicated VREF pin? Standard Microchip I2C
> DACs in this class (such as the 6-pin MCP4725) typically use VDD as their
> voltage reference.
> 
> If there is no physical VREF pin on this hardware, requiring vref-supply
> here forces device tree authors to define dummy regulators in their
> device trees just to pass schema validation.

Yes, the MCP47A1 does have a physical VREF pin, as seen in the block diagram:
https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf

-- 
Kind regards,
Joshua Crofts
