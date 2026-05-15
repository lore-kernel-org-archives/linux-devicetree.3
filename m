Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E1326951
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808964; cv=none; b=uQZ3nbpuykFSISjf6zsER7hX7fcPtMXR5f/1ZLTRA2BRc9s704tVl90WkXu82IUri9HhaS8wJc1S0VX8Osq4UQJup+Sm9hWNhTTt4Ci1KJ1srwliudT9jAdsJ801cbl4yH/DqFGw55QyoUFzfacE4tGGUsZV+i7u883ZyTtdhG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808964; c=relaxed/simple;
	bh=qyG+SWsCYJzW6ePta0HqJQ0JlnEc88TZlimHgFAjJAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHFDsfnH7Gyl/DdTIcxuVmfshvZagHxqkH2L+F697m30cXBC5HCVrpcCumT+TOypAweJrv6DCwWht9xu9xNQEGk5DK/32UON6igj6FQA1hUQdGRml9aJwdMsEQGcwoxaUmxGYN7/KKxLQPsn2CIw39eszDJVAZ1nDciKVqLZzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7vS/yh/; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7vS/yh/"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ff5472f263so5018598eec.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778808963; x=1779413763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krEBTTXiK5mCDN2/ksztHps+97IcSWBntWKsCM99zy4=;
        b=a7vS/yh/+bXHSvfjhxxRKShavtNDHg3JqYLQFNg+fynr101ELtBp1OePyLnelfpk0p
         T/AGq9b+3n/KkmVYgOP+26qgiT/K7+Rbsg/HFlqG6hDVcLg0LDXcBzsRJtaD5yxafomq
         9dfzWLEzVqcIHnZtpnTpR0ckANM4KeNVFOWlhqRK00ZsuuhHSNBsgRoGQwjjUh6CNeAQ
         6CqCJQpjjn1rLkTe18Uu4miqgmYbn2FxoyTDrjLg2qwb5zOwpaORs5H81C4beXeR+C2P
         Flfusr8cgkKKT7PZFZuRA7SzlB/mRDAcB0uehU/VCapqPMjrLiKpoTswkrzY5fndsUVm
         2Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808963; x=1779413763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=krEBTTXiK5mCDN2/ksztHps+97IcSWBntWKsCM99zy4=;
        b=ZsyMQVht1Apa89kfTLFw572XuiUU7+1LejeF+RKEdGhmXQ3YCNwK4noyOLc+2/4tsa
         dlebvBb6siPOOq3UxDJeOvfo0nrIQ7KUhs8rO0PgV7uvwv79JEvGzrOxQFbgi1dhidrP
         90ABWZm+RHGLe7oAOgUcUWJBPShrB2Trbx/wu6FJ0UztqCKUU4de4a/FjrQstkZu+PI7
         2GFI609rG8x1j6d2+uG6vXJN6a6q5a9IQc4sVDaJk7cefzDWmzpTkPbFD7QBvV8X/lYf
         GCPD0H8Gf15R6AIzoTFiklMJfwlxOy+INagH5um6UWTJxG0zOPCJqQhvivPaty4/fWZu
         6jvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Djakej3/Pw7EbrR8EHB2iQWWI/ftWMZKne/Tf3D/mNqCa5KtIqfoPIY94rUIB2hADpH6TMLxj1Ulp@vger.kernel.org
X-Gm-Message-State: AOJu0YwgqZfmRFp6vWOQ1KmXUVpC4HJ84k1snl/PKR3NIS1T7Zy82MJV
	jCcgaGtBE/FshWCwgbVpqhIOL1M7JE3RmTGnv/94AG2ChVvhQXbMRe19
X-Gm-Gg: Acq92OGEx+94RT2igDGV2i7uCQyH97lEmX/kOwUOJqFJxMVCBTfMLAweMFLSc8jGbS2
	XltRgB6Jp5Nh4pDLWC8d/7bZTsFnom7UXKHtSb1l6SGGKvWKNinwf2/IvVVfXUGgRQpAOTalwDJ
	HJdZsOyMO5BPySs3jUuBLWNJqARJHW0yK3BUqd4USiIU9bPRif7Ohv3ool/yeS0LPlLTJ7AElYn
	ALEimgNizBvDDIzereYvgJ9x7ga2fus84SnTuENM2Xak42KlDfsDie5OLw/XNye15e2vhc0RZcZ
	IINH+wDyO5WQ6mKW5bYb/QBgvYxoLX9jEDVDcMf2k0WUKbwmvEMDJ9vA5lRLi/UmQx0qb29gHkN
	9hJb73t1CFs/q059c0VCdSvGokciVYgPCOoWwDk5ijasuO8diuMxMbCaomxoOhlUkKfntsZFY3o
	eaOiq8kobgyFwT2BF2juPHmDQPLw4/hdYww6Cq
X-Received: by 2002:a05:7301:600c:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-303982b788dmr969693eec.8.1778808962665;
        Thu, 14 May 2026 18:36:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm5316673eec.24.2026.05.14.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:36:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 18:36:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: qcom-wdt: Document IPQ9650
 watchdog
Message-ID: <d06d3948-acea-4f92-b032-5149735733a2@roeck-us.net>
References: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>

On Mon, May 11, 2026 at 08:10:23PM +0530, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
