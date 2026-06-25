Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1903A1917CD
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 23:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782431140; cv=none; b=DeFdvQZdr+oJ0zj+GzGw3WTCWUfWthaGlCAorxFsZZjER7ax7MYK79NwZLLL+grEywmOhO6CY7tYmxW1hIMALQR+lkWt26WgafeLbtYo0g5BujHe0Zo0PolzVK41/nw0fEf5GslynyOYkkxz07ukeCiAlWzyLz0vnpR0bWhfwZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782431140; c=relaxed/simple;
	bh=zho+bds/K3sr8/g+6AtV9BHLkTqIWWluRxW2zUqjJmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CX9jakpHpERqohgiOirzKk2A0iJchc/PP9wgAjZ4n4qnFiyoS01d/O2rUKlcm23EKi7uOrihDuGHAI3yA8KDat4/YlyqQYXkcpOld113sFeRVmlQaCJeU3j4mJGNsceexnZuODgk+UxlSi9+CDiaT3BQSo+Efrs68TPUTAr68Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HX1UzVmN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HX1UzVmN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c9c8c2697so164585eec.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 16:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782431138; x=1783035938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gAeg/0vb+Xz33u79vnkEfiy2hWyqVw1XPl1l+y0c8QQ=;
        b=HX1UzVmNIETGP/IykGirRUGNjgfm0ctMQ3Mfh3zMmVqAv93lLura1SJmNOZfKYKm0B
         4FmSN4r9q7HNjcJwY0+bydn/2y96zkO06eVkNHrSuwc/Zpn1Od+sKAJtACnBiIYhL6uZ
         mN0RTe8ourxGZ8PZogtZFv68CaraMlrmwLFNedPdmowuutM/X+VlE8XeWXvewZ+fSXdi
         R8x0vEUZ1mWMjFe6tdp5/rtRAylgPraNhXCPmknqu5lm6s0hNv6bTCXRFwDCmvC588ik
         h1p05z207EBzsAV21ddAbrswgYC0sRoO5bs7R0hT1+/R5kvGHBvBkww948vEz2rxmsdy
         8yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782431138; x=1783035938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAeg/0vb+Xz33u79vnkEfiy2hWyqVw1XPl1l+y0c8QQ=;
        b=n0V9CPYWtFr8CJAvG7+SGn95Spn7cXD119Sps/TmDqnNR938tpYjuDowYUfI8yN785
         Wj4lPmq5KYshxgiJ3a1ZJifWzMYDcxDHCB6ofk+kBHsg0mtdzp0EVzN1wQS+eQlKBlaO
         tHx4ut3jUsi1SZRoDVoo9d5X8MeialG8vaTNWEmwkrWgG/qgSgTAlRsXY88pCvBsiPve
         26ylKyZQZzPHfwFGMd9dAiIQfMxqxe3XMQlm9JphoP9p92VejkzUpJ6UaiX8v6tI4X80
         7TCrG9/b4NVS1pz78MU0ROt/bGInEOmdsV0EgxWjGRyUePBtEXgdgbomf+n/ujS21fz4
         Ga1w==
X-Forwarded-Encrypted: i=1; AHgh+RpTIk69rfd4FwwwJmpt9Gl7uxhLR+GXQcv0L+WOWr3K+yrA+KvXlRaTSVKrdz6M+fzqOVMzx6K2I8aJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQOV3g3ToAcGGtNV2wBAQG5qTeau43a5ehzprFw6vvumQL/Dz
	xpDVDZWBH5Xp6e5+fkmzAsz9gcInSzPBztQybiv5AR8FgYdKkOI8DbrE
X-Gm-Gg: AfdE7cn+CB+4IdqH/Vl3mYdhOPWNqGX7JEKrE8r+w0qJFcs6Xk/RK8tHpArpOQtfDVI
	ZmJxDqmifNZaqVMFWu/3RI2GVFZiFmKDLSlsMw/1jcSCIN0qqP3oBweYs6NZmJAJmQWDBgfngQ5
	cSehHUy5DnMXV97Iw0jSLK3E/S+p6t298Lj4O2YpM9D04AQ7TjReoCB7w0Z2ogS7u4xwQ6qDKWO
	pyfftB1Rrz7it/zebex3KT2W01tKiYghXCJV6KKX8wzNbTB1yYyT/KYaqFel6oRfgvnrZ8frKQE
	ECHJ6HTOZNm5JHsRziE5nGN/Z4xBzzgnbVKnM3p081NZ/SSazUtmQnw40huUpPMn4fhm0Y1tl4A
	axhM+BCr69zeteYfVob8ZwxP2my/saWixebbjSetGMna8KIiBupxlHEJqKh4SCm2AUJSvpWst6k
	uw98lQF3Bwrfdujg97XKB0iNzI6fbitXMTc53T8TeyM2yhaYbNrtgqPQ==
X-Received: by 2002:a05:7300:760a:b0:30b:f0c6:12c8 with SMTP id 5a478bee46e88-30c84ba31edmr4946004eec.9.1782431138182;
        Thu, 25 Jun 2026 16:45:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c782:a4ca:fcbd:6ba7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afc91sm12621344eec.14.2026.06.25.16.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 16:45:37 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:45:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] Input: isa1200 - new driver for Imagis ISA1200
Message-ID: <aj28fvj34b4_VI3k@google.com>
References: <20260617070528.35006-1-clamor95@gmail.com>
 <20260617070528.35006-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617070528.35006-3-clamor95@gmail.com>

Hi Svyatoslav,

On Wed, Jun 17, 2026 at 10:05:27AM +0300, Svyatoslav Ryhel wrote:
> From: Linus Walleij <linusw@kernel.org>
> 
> The ISA1200 is a haptic feedback unit from Imagis Technology using two
> motors for haptic feedback in mobile phones. Used in many mobile devices
> c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Beam
> GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> 
> The exact datasheet for the ISA1200 is not available; all data was modeled
> based on available downstream kernel sources for various devices and
> fragments of information scattered across the internet.
> 
> Tested-by: Linus Walleij <linusw@kernel.org> # GT-I9070 Janice
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>


Sashiko convinced me that using mutex_trylock() in the playback work
handler will result in dropping requests and that we are safe not taking
the lock there at all. Can you please try the following modification?

diff --git a/drivers/input/misc/isa1200.c b/drivers/input/misc/isa1200.c
index c61adc4b605c..fb7f68fa0a2b 100644
--- a/drivers/input/misc/isa1200.c
+++ b/drivers/input/misc/isa1200.c
@@ -253,15 +253,12 @@ static void isa1200_stop(struct isa1200 *isa)
 static void isa1200_play_work(struct work_struct *work)
 {
 	struct isa1200 *isa = container_of(work, struct isa1200, play_work);
-	struct input_dev *input = isa->input;
-
-	scoped_guard(mutex_try, &input->mutex) {
-		if (!isa->suspended) {
-			if (isa->level)
-				isa1200_start(isa);
-			else
-				isa1200_stop(isa);
-		}
+
+	if (!READ_ONCE(isa->suspended)) {
+		if (isa->level)
+			isa1200_start(isa);
+		else
+			isa1200_stop(isa);
 	}
 }
 

If this works no need to resend, I'll fold on my side.

Thanks.

-- 
Dmitry
