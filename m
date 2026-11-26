Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680142;
	b=SgXZfXqLn3677DUUVW84T5mZBqG6ra05yFtu8ke1zQskrpw/FbPXMHUvVKcmOgEYsqmu
	 98Zv8VLCEPuSpqgC3MUW7cBKURnumK2YUWUBDks2XQ3YjKXJu78ojC+HrIGj9iCrW5a4u
	 0IxFh0qdL/nywlg8LU714EFhOYA/c50FYJZmEoY+xCpJs7vXXuDwWlL9aW0UTkoiDFITv
	 trDR/Nsyy3t24BS7WwuGDJcc5vYHRx9LA8w7VIrtgFvxyKvGfW5Z1HPeDuVZvnm75u5Rr
	 2c/+IFcEOl97jj7mzY1AwxVMHFIKXBhK/WLL9GihQ2sjiNiNZIsWPFsjuLJaEaOJBow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5WBdpIC7hrsUSUFK3RWJNVEX1ybe0b8DDi3uNiJ2FOA=;
	b=Y6m1t/6nNB8x5cdp19FSq8saVCA3lPZbA21juRzDnRPtEABgF5Fnd7ewFo4xeDZxIL85
	 G9BUETuqutKQNbZ8fDf+1d5+FLUblG0wcIz7A7Fm2QmYzqI3N8KMTl8dhZDHE5I29L4+G
	 zqVom7DxYc/WQ3rrxQMxh1su2razBOiOSLWSocwbtYzdYf6q4UNq277A6sWLPN9ze7PxF
	 Xlq0/k7TzsreDgluSv22RVkuIc8RgPM2Hv/FCLMZL5LFB46nasmadwshEkXSTCFuM0bJS
	 p9ROhmBIBUL/wjfpOq81cL2wtRof/JDwkrYTmZrFAqowYplKrXXhpoc5PXd2M+Fl04w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQMG4sjD;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77676606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77676606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQMG4sjD
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3863db981d4so9473596eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795680141; x=1796284941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5WBdpIC7hrsUSUFK3RWJNVEX1ybe0b8DDi3uNiJ2FOA=;
        b=ZQMG4sjDBseBrkpb8YZxaNE8cGyH9yxvtDbr2gT0+NA+lVdC98JnkhYqQOgEEzRI3Q
         aS/AE9iPIa3W+cozWuyyYHFLpzpcF2BY6KDgoWMadFxywb5uPGoWFFvIcVa5bb5MMLtQ
         6JRXRHmKB0lqQcnaoa0ib7gaps1DpHmqp9W9qUBP4L2WQlGdV4cwr49w2fXAtKIX4thT
         6DlmhuG59QIY+uctl1M26DVL3Af5JIA9swoH8qbDkB9v+vMN/eWtWUi4aCKf1KHvb8kY
         GsLJaf6DvK18KkdZseUewIDtNLdcDtEH3ylCPNC5FdKDik7i81k/hElAL0ZckwE75Zox
         KopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680141; x=1796284941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WBdpIC7hrsUSUFK3RWJNVEX1ybe0b8DDi3uNiJ2FOA=;
        b=LU0vEySIIk9r2LTUwZfsLoYAVebXWIos1p9q9z0VF+u6bfb7h9Ss3INZWSp/nRjao4
         a9OzakXb93EVgYFZLUFnZFHNNbEYE3CuA1qEbHITPwkfai99kuMjqz/MAH6ynMB/tPmK
         PNjQqsIX3FrpMwx4ddY7wdxqzqRSc+3trgzjzuweQFbUMjQyoEhjhImTaTokiHG6MZFD
         mkPd0XLm2RRncM+EiW+1ycoSJBjKiyXeLtug0vB7TfL7iABoCXkBCo0Oh5MYCVvUicP9
         ZOt1LVfUIR/Ovk/ug5IOtElB+Zwu5/6RvAZ7a5s7jxNzp/6WIEX4ORg2ky/jw4q2gckr
         5/7A==
X-Forwarded-Encrypted: i=1; AL+hErEId6qaq8GIBZj+Mh7rmXw20rjOT5lTYNvTUoaBasxGrLCR10PRaF9ua7lNui8re911ZGsRVRlkGq5W@vger.kernel.org
X-Gm-Message-State: APuU4Z/uWu4J2g9tvnTH1t3IzZp3ADvS0TYSYA4ZL2fYZXsJkm6YhYrf
	PobsOEr26qLyI0DmRSc33s4TFT81xKLKl5bXd5SUgw7saNUYxdQpulwd
X-Gm-Gg: AZFdTZffxZJSBh0GfSI/kX/1CkcCVwY3gM86iinoRe3QM3desbmlt+/VvSIzJsyZOUT
	UOrT3D+0xw0X/b0CtPHaNRELRzduZCHS2rONtppU8UHKpxqJVBBiPgFZSUvReZtfePQ/bK6oTE8
	1Zvczh9hZoa6BiqLBEW/CNYd2/qBDhmSBEtUf0yTEMHR5udxQYRsrZhdXO7I1BPflJFbFVLjyra
	vjTJ59Gg0EcYk8/pGZfeWFVJ2k6/ydoobfOdbSZqdOZ7HA0VLyZZNE78kYKo6VxBf0m/8rjSBsm
	x/CvuRBGSTHNj8p2JuxgBuudvTYsmMw0WI0Dhcn38uMPc7HTVAwQ/h3/whpGqZKJHSnrGxJyRQX
	6xaBytsyc1HjER8Nj/KND/UjrHCBoqPkcrV5Vj+uwjsneQx1KlRwrJPhx032cN5DF1vcqNKZ2o1
	X5L/zshB2EanAI8fP+CcyDxGfZ6wVmbXbfUeFkluC/YXWz+fJmjkfw6atNitE7Py2elZ/O+Mm4E
	rDQcc55INvL2DJ0VHFs49/+udSmbswTYDxQt0b9cs7BckwpzdBNnRbjoXIUVu/SDp43SBj7e39A
	6TAyCdaCWMmmRWptCMCAnXcN/lP6be7cCtzuNFFsqhskfTRjWyJsokK3kVZSi8oee9r6bnQ=
X-Received: by 2002:a05:7301:2222:b0:384:2662:a7fe with SMTP id 5a478bee46e88-3856c9a1180mr18683035eec.1.1795680141364;
        Thu, 26 Nov 2026 00:02:21 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm27499672eec.9.2026.11.26.00.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:02:20 -0800 (PST)
Date: Thu, 26 Nov 2026 00:02:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Gerard Marull-Paretas <gerard@teslabs.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleh Kuzhylnyi <kuzhylol@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] dt-bindings: input: touchscreen: hynitron,cst816x:
 Common properties and supply
Message-ID: <awfngq8zPyqYC-d4@google.com>
References: <20261122093405.70406-1-gerard@teslabs.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122093405.70406-1-gerard@teslabs.com>

On Sun, Nov 22, 2026 at 10:34:03AM +0100, Gerard Marull-Paretas wrote:
> The CST816x binding allows no properties besides the controller's
> resources and gesture keycodes. Boards also need to describe the
> coordinate range and orientation of the panel the controller is fitted
> to, and its supply, which is often switched along with the display.
> 
> Patch 1 references the common touchscreen schema, patch 2 documents the
> supply.
> 
> Gerard Marull-Paretas (2):
>   dt-bindings: input: touchscreen: hynitron,cst816x: Reference
>     touchscreen.yaml
>   dt-bindings: input: touchscreen: hynitron,cst816x: Add supply

Applied the lot, thank you.

-- 
Dmitry
