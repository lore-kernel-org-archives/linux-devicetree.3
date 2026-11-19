Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082311;
	b=FLJoZCSExychFEpFvXyG/un/Phr1IU3fGpynoOTQAWzyZfRc19o1bCzTzKAucczLlL+V
	 2Z+mz3Yh/Aay0OInp/iKvy1H2bAKwz/HCOmgofRYWYlyRvqWr0zQegvd6KkJCf0wZ8WwN
	 dL+cWBsOHvryERxyCb4xNMP2SuSmO8+VsNB3sMhOXIggvMIqz2ahvDUzWoxcqUDbLJ4N7
	 qOCqmNr3WBeJo5cZaHCN5VTPam8TWV7pJsQ74CW1VVgiIYVEMe5XhaB7eiOhcCbph/Erd
	 FBYbmR7kkwkQEWz11Qj3/4JDj3Pa3UFn/wRNVwuIakjlN6S4Oq652+QtHSf++Ux+Dlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
	b=KHqR+RXW1ktYhoT0xRzMI3xxF/d2taHmxeUXXLDtoZI6y60P2JoLj7N+vkEzDQabDlrf
	 LYqQvvPFE1X5d+xFFQssSisi0GpSoFYAQq2Bl40DDezxRSRiZs9LzTPGnx7+gSwipyqs4
	 +YcVfQGOlaQzX04niBNUYFB49FEUQQfhfBypfuF7bUBCiZsMFIKpWYQdy0rBMVV7XKIYL
	 5Bt1umjd/e5pIW7/OPu7HcCvKvHelbZAaYK0ha6YgmKaYBxaMfT4y6MMJ/Wyi6QPHit4e
	 P62CYPZR5caiHOLBWbByDGkMpIBLMvkUiIYdadvAy4Kyxp0IK2rNtH9jHrOxAV+jcPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfWzlh7V;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29588606A33E
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29588606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfWzlh7V
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so14909505e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082307; x=1795687107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=bfWzlh7V4mIrnzbXOwt94RyyLmgPx6+hm8wRbDJrOAWxaQer4uDxiLz8+WgYStEtcH
         OHfIfRI8AeBf2c8BH8JRdjGd0SD8TnAdEHsgHKq/r5nGgk6i4Q5CwIZRx3Xnkjtz+dmd
         Tf2v9dsYILgihHEZhXTZGBIA+OvcxvILiUI1m9ze06mgmwO51ASvs5yvLRq3fHb8gMaS
         lSmAFJb4IYWcM1GpCXOrtfpxS+Gt2qNUgGAM/e9n7wVQ3IBZ2QLMIlQyzynpj50lDAH1
         bWcHnHM7pMFM/5yvMIWXweA+fov+DEDBEHaUlYf+TK+oD8QxfAI0iJIKy3O9NICslpQR
         5k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082307; x=1795687107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=Z9haxXSaoXg/hjeRanKR3cALUEb6eWQSnmYLanmtSDZ3sMaqWTPoQJGRE2KPvpy84j
         bxteLZ1RrCMtOv4oCSicQd621ErJyXJqprYoY8pEh+CRTFbRww5kAruNiP3T7YfrUy8h
         cmmxr1r9OSOae3PuRXcil/5Gj/xiE1g2nrM4FTVAezJzg2VbPgg2lHmnkVhfy2VWumB1
         XYsFaGwjaC08GnF2nYSq556Z9Aq7EUDaVNetXp5MRDcW5hoe1AIB24Geg5/tCk6kX+3Q
         zwN/q8dLe5EE9DlJFxAHYE/Za0kcHYv35rWqkpUu2s8tjEubBD1Z+JuRB0WAsOHFD2Vf
         UiRQ==
X-Forwarded-Encrypted: i=1; AL+hErH4k2qyyhD3St5NHg5PDltnb7RywFy9BCLmjXXVIFpruYcoAtT6rJz5y6ymbq1lUFLRKcir1XToiOjL@vger.kernel.org
X-Gm-Message-State: APuU4Z9/POK2CNR5/ZcyuKdATD4aAXl6tL05qf5hTMn0ZRzmbpGfO4aC
	+2tNIxLGRoA9O9ckAV70X0BFpouKeDUUYjHetvTneznRpKXbcCaRmL/b
X-Gm-Gg: AYBFou2lsJCb9mcGTRdtYmHKbMJLdA3YMNWo62jtJFOjZ7vTBkXpyxSt1ExwpPRkFvU
	ZXstP0v+86fW0ARsEb7whQiLzIMO1vSPDFfX0z558bJCR+vpAXh+GIfd7ErdPctdqjimrGCgCp6
	7jZ1ysWaOefOAcfNVy0U38yuuoEgNM4QY7Kgt0rwS/v0iQuuAjYcehx4FSCH58dQrW2X36GFUyR
	lYcQE/nU8YNeCKn4FO/AnWEfQz26GdKjaWtbxccd2vX4W2gofWN+e+JvrijevqNtyZ/uSqHHnWd
	Bj4siWvuyLjJI7h59bmcCs75wARbDJJ8IMwsVMVp+fDqePqpI00VA1tjFAyW7MuSfKyV9KWXP45
	+ot9WYwxZQuCeWdvireZtYx6xCspNKAY3zM3Oc7rvcLDCJVt3NZBQH3vPurGXCqgFFrHKM3C9W3
	26GIhviOOiOoWCS+V0rO+CXY7YgKQ5elKM4zGccLUmPyCe+cLWvcaUNfknVz0/iylMlJvIq9tBX
	PXZGltQS9LzUGf/bCyjFcRN+fXDtItEcoVe3q2cDZQ2QaIDbmCR8OM8bmXthBiu6UYgsqdckkdC
	xq/6YSi+tEXUX1H0EY+AnWT57ProWWYfADyJWGNf6btkbOQWTUb4c0m1/1dLzc6Fal1N6cHQ7mA
	wOc53bvyD3r5VNAii+t4q805sy1cR5GEdUTLpPhCNEBFM6YXCrYLRwNCDdNlOVQ==
X-Received: by 2002:a05:600c:3e0c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb7da458eemr109808135e9.28.1795082307133;
        Thu, 19 Nov 2026 01:58:27 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b1ddsm9462578f8f.28.2026.11.19.01.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:58:26 -0800 (PST)
Date: Thu, 19 Nov 2026 10:58:23 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7IP7M_UAtYFm4D@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
 <av7BStmo7w4_rPci@Lord-Beerus.station>
 <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>
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
In-Reply-To: <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>

On Thu, Nov 19, 2026 at 11:42:54AM +0200, Daniel Baluta wrote:
> On 11/19/26 11:28, Stefano Radaelli wrote:
> > On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> >>
> >> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> >> on the Application processor because they are used by the M33 FW.
> >>
> >> Also, instead of disable in the commit message I think it is better to say "reserve".
> >>
> > 
> > Hi Daniel,
> > 
> > That makes sense, thank you for your review!
> > 
> > I'll use "reserved" for the peripherals used directly by the Cortex-M
> > firmware, and keep "disabled" for devices that become unavailable as a
> > consequence.
> > For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
> > for the M33.
> > 
> > Does that match what you had in mind?
> Yes, that make sense. I wonder if it is a good idea to split this patch
> into multiple patches each one representing a logical change.
> 
> The commit message suggests a lot of activities going on with the code which
> makes it harder to understand. Either approach is fine tough, as the changes are not that big.

Thanks for the suggestion. I'll split this into two patches for v3:

- Extract the existing M33 configuration into a common include,
  preserving the current behavior.
- Add the M33 overlays and combined DTBs, using "reserved" for the
  peripherals assigned to the M33.

Best regards,
Stefano
