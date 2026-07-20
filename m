Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988E1388E7E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516980; cv=none; b=L7lz2yn0JuRuNt07FZSeK6+lC4L7Nb0N6H8heoQixGaBnlaXHTpp0lXgLo+KC6i5277SB8XEkD69t9z8Z9cJCKOP0aBzL3P9yQ+2QZoRHP6KxiqxIyLtHUDs8fhbvcaL/yxCrycqydGJG2j5J62fToaPwVoaDKuZXiZ+ubuEhko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516980; c=relaxed/simple;
	bh=D95HInvC/7wNSJPaJQt6SRLmjUKUsLq+wBbHfpIjARc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYjx3IztqYRD6H6RoSMPJxjTkmDkz2c03dLRujX2T/3E7FO/I9pqmN0SLRhii8+7OGsRcmgNdXcIbVA2FuILl3yr7BDHZc0mEujHy7S9c6AD5QqxevDwEyJnT+cJNSOKofkk4W8tyLAiUodqxIRhpJ1t6ulyOKu6XRC6yLcedgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdUv6tJ7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdUv6tJ7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so4007324a12.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 20:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516979; x=1785121779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uELaWXedQ9qQGNcAq7Cw7Bv4z3LDW14NAE5K6u6YwA=;
        b=kdUv6tJ7Zp7mxZEpUlH3s/7Unelkyf5lAOkW0aIZm06SXVh8NUccheUUm2OzwozvoE
         2quPVXPJv0R3MHttOAEVvQ74fScKz7GuxIeJbqdbAO8N/dTsE4l1ITPpu3CWE30B+hCg
         IXYQyyf+huI821STCDyz9a2U1RSgq3BT/nGvjqQeuXEtKym5BlK6nrTgsLuuKF7cmAC0
         EVGPad836kJ5i90y/mCx3asQbkGmV+w4xrKZe5V2bamx2QRna4n1PTkQvK+ZcuMvTdL8
         gHAxC25wA9ZJjx88wN84dKRNveHrEKxjd3AwF2HYuawopb8xr1oaz2BpVYh+VhpGbV0v
         wFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516979; x=1785121779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uELaWXedQ9qQGNcAq7Cw7Bv4z3LDW14NAE5K6u6YwA=;
        b=JC3gku8SPvDR/UJf0qDz0/zCt9LZUyZK24wz0e5DNLMJoOF8hvWU4EPmOcbjS1OzL1
         m2ZMWr6KSl/BFrzJYQA9m15yphP0T7DIdPyrsckwet5yLB3EZTxoXofzxx3uN1/MFi9M
         jgVIuABFAbfpEMHDbU44Qv/uPv2SZ2tH30iFi3qfTwXa7BtKqPkeECgo4uhVFRufZzMz
         Tj0MFBT2o+dLsaZr4zVG4WihFzBN8rffCq3PtAk1a7ftIZlT5HimuHO3cFmCKwMI+Ed+
         nZ6AQniKBHtn/6vqWhX0tyv8h5eaC8ZjKHYo6ORFAJzjZFGlef1/Yk45sbtEPr7dV+PB
         Gyng==
X-Forwarded-Encrypted: i=1; AHgh+RqbRFMHNN1KQyAB7Ycndt6LXbVS4WHhZMOUR1ZogE7xSa5TyUqWxf51bNEUBoaYfluxYv/iePTMYDVX@vger.kernel.org
X-Gm-Message-State: AOJu0YwXy9fZawn9pgev6r/ierIYCBBp/Ul4igWCMgZBvqf2XZUJLlsI
	kTuOWD8B9altB+TqkW5o0VT6CwvOIRqwpG7LD9Az92DmVTNgnKvncJvT
X-Gm-Gg: AfdE7cnucFQ9eVpH7Y/MUo45L2f1d3NkpPVYOkklTPaCGmXVAxuabzHVdmHNg8RX/rs
	0Q082Wi38OcoVVawHmivXgMIcLW9RGqLnBN+vYV2TNymGRO+aKKS7AxfpyJH5uN93z7ghL9n8+J
	Nd7q+SCzZ4Q1/yZ4p4QCs9xudXwB5yxodHGR9S2+o1Xhas4btZ4F67azgbf3bBS7PXeg0XgmQ0d
	JH54R1v+45/WGEj/ex/eL9/13hqXn8hT94RIOfo6mfe6rxHCzFro/IbWGvyKSQtk7vwvbeTUaTa
	rOHSz5Hvtf1kHoWA/oP8Bub3D9pYGGceh6bjzHBZbrQBlWccTSiaRHOFln+IF+3lgw3qa189ssu
	xrFoQl41RZjRpn2b9bD+w5MSmXkyUn8O3bqVI9VUfIlWH64bct7EokR74+TlkxEcrW70cQHVTX8
	mSycouLLYWum2L1rW+9bEv5B/HOUoQ5ldo492PFONE2TFSC3Ey++Wasw==
X-Received: by 2002:a05:6a00:391f:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84c2927fc39mr13129007b3a.31.1784516978856;
        Sun, 19 Jul 2026 20:09:38 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc7adasm4962151b3a.19.2026.07.19.20.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 20:09:38 -0700 (PDT)
Message-ID: <5eaff736-9271-487a-a9d2-225580ff449d@gmail.com>
Date: Mon, 20 Jul 2026 11:09:35 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, jic23@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-2-cwweng.linux@gmail.com>
 <20260716174237.00004b79@oss.qualcomm.com>
 <8d757505-ea93-4dd4-a374-79f143f6f949@gmail.com>
 <CAL_Jsq+5N9AvzQ0cxUVY97Ad+CasR29Fan7sUuprDYjgqzWjMQ@mail.gmail.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <CAL_Jsq+5N9AvzQ0cxUVY97Ad+CasR29Fan7sUuprDYjgqzWjMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

Thank you for the clarification.

 > No, document what the h/w has, not what a driver currently uses. The
 > only exception I can think of here would be if only 1 interrupt pin is
 > usable on a given system. Then it would be just 1 interrupt with
 > interrupt-names to define which one is used.

Understood. I incorrectly based the binding on the current driver
implementation rather than the hardware resources.

MA35D1 has one EADC controller, EADC0, and all four interrupt outputs, 
ADINT0
through ADINT3, are connected to separate GIC interrupt lines.

ADINT0, ADINT1 and ADINT2 are generated from the corresponding ADIF0,
ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is a shared interrupt
output and can be generated by ADIF3 or by any of the ADCMPF0 through
ADCMPF3 result-compare flags.

I will therefore keep all four interrupt entries in the v3 binding and
add interrupt-names for "adint0", "adint1", "adint2" and "adint3". The
ADINT3 description will state that it is shared by the conversion and
result-compare interrupt sources.

The initial driver will continue to request and use only "adint0", but
that implementation limitation will not restrict the hardware
description in the binding.

I will also remove the redundant maxItems property because the fixed
items list already specifies the number of interrupt entries.

Thanks,
Chi-Wen
