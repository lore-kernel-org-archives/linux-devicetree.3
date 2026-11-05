Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900684;
	b=dQFAfG3dY56vcyms4R1F/O4jLgQ/EHVBdEmnGbOcDp4xWwA2OmH0BF+QDJ13colDkVr2
	 w9KpPHahPdpLAtTvw74nQNLvmqL+L46d5BbmPEn++6qFKUjz5lPAyBKU2R9LLGWpMlSgg
	 5McV4tz3hYiA6WhVrGhIq/bAXcGXU5Bvjaa3YTD53/gUP6T8mQePVJAgImj90+cMESelj
	 Sr04oOAjXG2Y72+MDGJ7EM4OGFoUeiLqlMhNXYY1FDu4ESE+xv5wP5RuoQ5VSdtKC2Kmo
	 kVZq3QNjhm29NTa7Jji1cNHoyuMOPI9tGjOepH0ZIQ9g6SbfYL2qqwVRqvwDCZgw9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
	b=WdGVsddZ7BiqBWppHGP1gb7HK8Z62iwp3YyEmhKMe/mJPkc1q9Wc5aVVAAKsqxXVf2tG
	 PtnOrEjJgqBs5GtHT1zH5ilIz0M05p08H2o3hLj3/SKcwmTawr7pZ+o4uAte++yN+mqbc
	 sHIGXkMWDSqDh39JXb9A881mDbgt7zvI3iXbhOCsrD8oCaHcO3g+ZO5jjzAU01zLQnVAA
	 37INgx1/LDNbPo2r+vh+EaqvPeFodHvbxYgJA0JzXOl5KzWEPvfaX8K4WCg3XqBf1F2H9
	 tGIFtN3ruBXBu8Uiy08DXK7UuN3NLdXzOwv+F7svn1uOkgBsN6FXe/Hp46T8lEp+JoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQdyTsJo;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9EE606D804
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 17:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C9EE606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQdyTsJo
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24389135e9.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900683; x=1794505483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=MQdyTsJo6HXeHxH9BNw28+SuNcBKayOk3Uhzn/A9OEQpdXM5NOgZRm+YICTxfaKljl
         1sw0x8YU9eQXFQF6esHGD04Fege4rdmZ8qd+67Tb+Bf0FpUUOI12q1klb8g3yiIufx6k
         E9Sx5dpO/8LLHc3lDh/lQ0KyYjY7r/JfI9ztPR+Ro7yaR/tMeRHiAVGBYACNGB4EKzWK
         NIWXqWSJW3fuCv7KqQ08FOm+n04U7R/JfnXJVydCddFvt9ePOWIb6HmYV67gpEbNM/nM
         WOoyPyJLLaJtNokFTs8Ib7o39eMQJcoDNDYLxq4/0ut85lJBIaMf9sJQvKeafOZfr6Ra
         tKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900683; x=1794505483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=hHKiSJcgQXYwJsNnSW1OA7VayKfyGSdgv/c/71dnmrtclSysBugzwoPVOE845Q7qPN
         6K8St5TjSkg4hs02Pp/H4o40S9UV5WXhXsVFVAkb6ZAph3a8vRDgcrgQR6M95WfimE/g
         Ylp2031SDDFkFI3gWzidHq/cwWid9h6mwYwxEfQcszrh7QnYV6QAyZjNqyUJ7ehYrnoi
         6cTW95CewpK8NasbG6gu3FCjEXMSw149UYktoNMM7XTeV8t2B4fH1PWWtNF/f/mNkApP
         1l3lUFfzvIu5Ox6SOURTPCsNkyg1B8NGpM/V4KAtWRhnoUv0YnAyt+yKDLHrdKB9Ctjx
         hgsA==
X-Forwarded-Encrypted: i=1; AKwUvBw7eRBu2VVMGwcf8M/dNQ9iEbYrkgrXV5mKUktjg+UoRyyNXvxcUpTio+tCm6n4fcYNCWT2eyWx1jxa@vger.kernel.org
X-Gm-Message-State: APuU4Z+3PHiLhtmNaQGlb0UmPy8KgxPGYRFcQB1Ptbf9NHb9bDGAJTGw
	S+6O3YJg3Qy4g+bJ6es7/ciKXFhcDBobu0K/REaKsgAK/HvP3nLKM1ZG
X-Gm-Gg: AYBFou2R23ddmG5e2EAFUKa51G5ko5+KVKLveKul6ED/zabxnIMhzHuQUFBS9Dksyi+
	7NtmfBlSFnrTrmaRlFj4TQ9B8SPZyIFyNj8SdmRDtafhEtmcRcUiiSyLbzbccbqlfejjJwMNxZ6
	3NxczBF3YzJw3+ZwjlwYGjbV5LcrOinURtbRrPbk9YVkkqhr+Nz0fdAs9+GQKLVN2S16Mie/OG7
	dNhsPcmFwzkklqAiZKQG0cO85CMWk/8hgFVv0m2DFdas8nN1avGBO+fwUoNeTcWUrfwB80fvVY0
	XFYEr3ScqBm1bHhujEo4nLB2ZuY9jWqV3MGVVpVuOXRj28/hiHVvT8a1+eT3ZmUV7VbSA7kv4Kc
	w8uREMjiYVBZxV3gRyKmYqmAm2MIsiwGpcwEjHrST22v5IKhCYweBP/7ZOQP6ZA7CqqXlOC0zPy
	3FQdqhgvQHPYbSv3xZv64zYxWCGHd/ZwGVXYvAW2F+wiHMQnxmDhvW90Jn/rBZAMc/PruMbnuMO
	Skz6V3CQWuS/ztwErsdo8ANPcHlWn0cwVitmvrE9AyzR2vNiti7UH2DJbOfLqkvT3EZJXv+4/an
	J4zdhg5MR0IabUEYsmeaDZEXJmnm+WFPBy7Y84Ba5UMLOGGMnZfoG/fXJbgVPJ7lXwdHnd62uCz
	w+crldbHympYiaSKV9rikqFCOXZpyLUULoy6tY4xFj+jk24Je9+OlHwEixw==
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr454773675e9.14.1793900682397;
        Thu, 05 Nov 2026 09:44:42 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm86889775e9.0.2026.11.05.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:44:41 -0800 (PST)
Date: Thu, 5 Nov 2026 18:44:39 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzAh7404GAsY-U0@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auy-OW_td7N8oHK_@SMW015318>

On Thu, Nov 05, 2026 at 11:34:49AM -0600, Frank Li wrote:
> On Thu, Nov 05, 2026 at 11:17:39AM +0100, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > The Ethernet LEDs are physically on the carrier boards, but the
> > VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
> > include their LED nodes. Other carriers therefore inherit LED definitions
> > that may not match their wiring.
> 
> what's impact?
> 

Hi Frank,

There are two main points:

1. The SOM dtsi is intended to be reused with different carriers.
   Defining the LEDs there forces every carrier to inherit the reference
   board’s LED configuration. Customers then have to override those
   definitions or explicitly delete the LED nodes if their carrier has no LEDs.
   Keeping the definitions in the carrier DTS avoids requiring customers
   to undo configuration for hardware that is not part of the SoM.

2. The Ethernet connectors, LEDs and their wiring are on the carrier.
   Their definitions therefore belong in the carrier DTS, while the SOM dtsi
   should describe the hardware on the module.
   This change makes that separation consistent across our boards.

There is no functional change for the existing Symphony and Sonata boards:
their final device trees retain the same LED configuration.

Thank you Frank,
Best Regards,
Stefano
