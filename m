Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BA630BF6D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098044; cv=none; b=FWMr+a45Rjc9vIMm7KOS0iaBgZyzIiHXE9lZpbPfrcKxLA2RzXXgDwQtvRJaXnRAKXUdoJvTny2XX24+dXMvoZAESIevITroZmHYVkOLBUU9F9RGMd9hwMUNerk361kvKZonq5OD6BWvc0UBP/EG1quqR78lQdqytfTFDwZmUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098044; c=relaxed/simple;
	bh=U9VLoMW0IalIXXKj3TNG3sY26cbk3ZeDVGzH40pQj60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evdvpXvKqf3yFzw+9sme7n3K0q9g9Cq6UNJzDEMWHdCqvWrVzrCyi7tzWXV0jZ/pKf/jp1hYrJbsuvGUeOQDXHHt4HfL/XvyxNuaeAR7s+oi510TL17pGATDUW+I1u7whADy7C/2dMuoRLwaSGDCVLZZXwSxUYp6SuSGpC+ns9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDAJGF1v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDAJGF1v"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cdae130cso22833575e9.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098042; x=1781702842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtc4C9NcRRM9nTNYMQQDv4iFGCBOEem01v80xMhTf8=;
        b=fDAJGF1vyskCZOCWn5fwVuQnIFLFOGZNppEbJ2XPWTJVUpfAqfAFYXRXyTRvjNFEmW
         FMaKtThu9g9RDeSe+oyOfbbrmLXn6r/Dicj5nMQOyI9FIzuiLlrXyPteMdryZ4cWJGVQ
         JQ8YpFPaGkWUq0M29dZ75fckvAUXQldhrdtBkLTVB+Ub1+SQq/xEs6l62JZ31cnPPOW5
         ZmtCs7q3FtwgCjBwUo9iDeOppEBfFuzf3zqCNyQodWVfKths6JLpZOjSgpkBO495KBcL
         Xxn8oIsd2vJQ71mHyA9McIjTFl6tQ75l4H0Tte2EPNm2uJUeynTrpg7yyCS8wfCP/2ZC
         JHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098042; x=1781702842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEtc4C9NcRRM9nTNYMQQDv4iFGCBOEem01v80xMhTf8=;
        b=CjxO4lq2rlE3Ug3clL3YVsUqahc8IH9urlmNB1uY+dPrQbTqh1hNZRWcfV+sjtYUKi
         TCLhdll8zQQK2jxrxT/VyoI+vopTpKwG4kLv9/bGxq54bSvLhcTWfTo3j/asZZnX4OW+
         ex/NA1ki5YCe7DM5Jb2UEaV2ZMVTusqE+E59DQRL1K6E4UH2+D4+9GaOyuxRfbnMwjMg
         nZjFG0Jtmqn6BncJrci68pu2tuBlVIOJXdUO4WtaDhn1iTi7a3QKetmD9YOReOsX08r9
         lO5s+C7N0DOxnCscKB3v4cCme769/rI/lIu45ZnvSGTNoh082zTDkSRm3QF32UyiFXwq
         yppg==
X-Forwarded-Encrypted: i=1; AFNElJ9afZkEGmDS7fHE2PSShUHoYY6CHhq23bChQWn266yQ+yLkxQpN8e197ego+/A8fzwDFwp2bnTdAxU/@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGWe5zall3p/FpakxbACMv2waBwg7aj865UuBiQwzYdD/pwv6
	ZbzZy86cYjpucuhZeRpGATCL4DwoYJ6xBKpQO5jMyV1wpq2dofQg4SxK
X-Gm-Gg: Acq92OGkwcknOKXNBXVn2u3vJwRJKwY7sUdEISpX+xdPFYGJ8rm0lGB4jo02wGylVxC
	uMPD2izsCea8Xp5vaPSKjLkbQG/iWFzGl9JBgPXIywfBcvGmvQ/LePShwhu/77EYc83JiezpFU2
	JK41oXXZFyKgd+dcnNrj17jJq/tzz/VbjrFOe8Jryj84el/lUPWdYLBmWUK5BBteKVFMFlOyBlv
	cOGG73XoN/xXmCSgTRs52J/r4kNdfyGTLQgq5Eswb4wOMOih4IFogo76rDTiEZQ2slz9GJoKlqo
	640wN2jv1NqhF+2k9CxRe3/UIToQ+l4j5LcEnk9N+tod9hylL+nWp/cp0cLT5VrsFCyAyADZNzI
	ajPqYJfattHD3O2TKA5+SuegCaV82yQOfUq21fmWJ0IHAKqZtzMRNtH1+qAs1w0H6bawiZEYeb2
	uZNBVlKAynFzl3LEgzTdHDfKuHITFM/+406G3siM8EwLFNQ70NCs3cC79L8n0rInGFRzc=
X-Received: by 2002:a05:600c:441a:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490c26e1b8amr267071875e9.25.1781098041631;
        Wed, 10 Jun 2026 06:27:21 -0700 (PDT)
Received: from [10.25.222.173] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm114022165e9.1.2026.06.10.06.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:27:21 -0700 (PDT)
Message-ID: <f9f9c026-716d-482c-953c-373333514846@gmail.com>
Date: Wed, 10 Jun 2026 06:27:18 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
 <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
 <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/2026 3:22 AM, Francesco Dolcini wrote:
> On Wed, Jun 10, 2026 at 02:10:37AM -0700, Laurentiu Mihalcea wrote:
>>
>>
>> On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
>>> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> The names of the carveout regions are derived using the names of the
>>>> reserved memory devicetree nodes, which are referenced using the
>>>> "memory-region" property. This adds a restriction on the names of said
>>>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>>>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>>>> specification's recommendation, which states that the devicetree node
>>>> names should be generic.
>>>
>>> No, it does not. Names like rsc-table feels exactly like DT spec is
>>> asking - for a name matching purpose. Are you sure you read the spec?
>>
>> Quoting from the spec:
>>
>> "The name of a node should be somewhat generic, reflecting the function of the
>> device and not its precise programming model"
>>
>> and looking at the examples provided in "2.2.2 Generic Names Recommendation",
>> wouldn't "memory" be a more appropriate choice for the DT node name instead of
>> "rsc-table" since it's more generic, while still matching the purpose
>> of the device? Or perhaps I'm interpreting this the wrong way?
> 
> Please see
> https://lore.kernel.org/all/CAL_JsqKRW-=er+DCTob0HmQv9OyVt7yiej-Yht6UR-mcW=LHUg@mail.gmail.com/

Thanks for the link, Francesco! Things are a bit clearer now. Based on this and the
comments I've received so far, I'll drop the binding and rproc driver-related changes
in V3.
