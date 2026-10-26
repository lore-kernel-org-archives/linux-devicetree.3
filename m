Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974192;
	b=knrC9uozJ3eHrEge1crdZIA9d9W0JxmIFtt1CNaRh0L4di8BXKNUSbJZT5dVrfpc7hux
	 o9ItF1ruAxagGdRdLV25TsJrl4vTikHbwjXVgBeQ357OFHS4eUy66ME9GkjrnyHn5FoZJ
	 Ni2WqG3UEDQae0ETYQV8IEZMrF1QVvCto+/+R/0Qgh1LD7gP0b3P/9OGBfzl/6XkUuXj3
	 ddM4Hrs9EjvC0CEhoSfXKoDFsVKbr5lUDh+EAKeiw8aNj7bIUm9ozgPBVUEZ85G9lCiMj
	 UQZ9WTy9NTJg9oJh7UPiwzOH2vqfrlMOSe2SAtK9PWvf1jPtAqVyckTObWlkypsMUGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
	b=Thracp9cGiH4+hwMWEd5KCXC/ArBqSSYQEO1R7recxOc3LWjg7Xbb4evb2quOclTESN5
	 /ZAFW2KgwR1p3wAKGQC9s/0S/sG2EsTd1wg2j0HS7LQ4VKAtR3y3miUuMV2e+dvdVHb7l
	 VPFrvYD6kTO3GAaP2Qnz/w9zaBIDIT1xkA0C8PsD9Vwzqj74tVRrpY5zvj7P4J0Oo3LSX
	 lpAiL7kSn4SN2Zjzc+Vh4uAQPGkszk/8nRbwO50ubRVIuyBheoCa9QUzzg887STSnCBoC
	 55BVkHN13Gns7wg8VxF/owgw3Usg7NEhwu96VVCPRTNNPkbJgrDEFDZ2Ar1mgpx253w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADE0606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1070976b3a.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974191; x=1793578991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=evuX6trdavY+rQ9hdPiLIt32D3hJt9DYx00L6w8OmzUs22ucw02BNil0BHuuMxkhe4
         8fm689/990j230sqwymJwa3YjRqx/kNmw3Li+TMTM+3ABPNfbLRrc9dBJeHRTxQwa9qI
         jwOH7s7dPgf0yLY4zdCzUv5FSlyj/Y2sRTrHkonfcO3whO7vzcEAOoiMbXiXY5cwSHje
         gP8UzQ3lo+8wkTqA7o+fgHEamuHpNnctKrVe8MOGUG9qvYryv1kB0HJR8455C8wTtwNU
         Rodyo+x7mygqkaG4PSajSOABavski4++afbp+dLQT73Bk8EJKP3qegP9DeV8V7swTJLF
         txpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974191; x=1793578991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=W31wCkfP1tQKb48zryaH1ic8gMLfyapPYSX1l63VdMcyz6tdxW2AdW9OXHAeQtKTv8
         G3QQuvU156g6dZosCKePFWEZhAkJ68+qENy+zEnZstfY162vIGcCjqUb74m2ylh6BLWc
         KbMNE7brUcv17ObHuWSOZx+C01qLa1B8TYPibSol+cUdpZOV7sTcRDVFAxcGO1Bx10Ua
         C4KoCyPfGMcl9fg6hdmRfO9Bmi7GqiOLaVA57geXwri5YmKx+gdlvxwA59Mi0fGzgpOR
         ZAu+ne+HyJV9T794JuOZyypaRjb1XW5HuJULequcWNEObCoLS7RMA2BPzMcCMa86XyQX
         gvnw==
X-Forwarded-Encrypted: i=1; AKwUvBxJCO6QypHYhK0EqzmfzmiJbnDl6JyPo24Ig6WnRxJ1HehT2Iej1DoTNSZPon7E1Xd2QEeIsOC5hNe6@vger.kernel.org
X-Gm-Message-State: AFq9FYKjRFLD0kzcS0ypNcFUkR8JFkI5ipnTxclSMfSHwl7JhljrDNJj
	STIMBKop5QBqKz7iPrMtR3qJ46n83Vydr7sj9Ih78gwpEFd9soR7uhHC
X-Gm-Gg: AYBFou07N6K+jQxK473Qil7zsHYMNq3BeIwXiT3j6X/sPySD4NnBczs7KVaBR9vGWzV
	N/mFlFB15vAm12wEskY0/jt5kEW+HHcewbM+rVZ+HRpPCHSq0fqNgrgcZaS9HjuVjyXN8lvs/2e
	dAabbBcJcH3DdMsWM/0O9fY38YE7Wf5sTiDBPIG7h5H/DPLNo6aZt/UFcU7YEAzWqQnqTwfXEIS
	snFtsKK2ZZ95AQ76WFIm2vWmNPgOmZrBjN77r1iF/dm0ubkh+rtwRLGGO39dTTmtV0NaqKwsI2H
	A8iVJyXCrmM9xqeiWhuzkUX1LQTg9h6vu+6KgZILi/+1tub8OpZpmdsLjaPP3YbehoGyR1Uw7xK
	4jcIla9zpmqaPvThAeWLhgFwQ9WvCy6stsHNbzNay/VWMFsHJpe83Ex3YFWKX//k4lTG74t8c2+
	Y6PExCH0Fa+CvSD/bpSgt9KIVOZMmYkQKVW2jrIPnBAlCS56EvVKYQjNkXGZgvqOqzM0Xhr5HsN
	B9nk2zjjzwKQodkH9zYa6hmxsJwnD7cgfimZvBbgw3T/ZR1fRPMNmqcmA69Zc90For9DbC44Z5p
	faGTejo8+30qLRw=
X-Received: by 2002:a05:6a00:1889:b0:899:529e:dc9d with SMTP id d2e1a72fcca58-8a36a6c5c9amr2879726b3a.1.1792974191295;
        Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d85e22sm783839b3a.8.2026.10.25.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: lm75: add MAX31875
Message-ID: <4c365f2e-8dd7-42f7-b96d-a57daf23bc53@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>
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
In-Reply-To: <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:48PM +0800, John Erasmus Mari Geronimo wrote:
> Add MAX31875 compatible string to lm75 dt-bindings.
> 
> The MAX31875 cannot reuse an existing lm75-family compatible such as
> adi,adt75: it has a 16-bit configuration register (instead of 8-bit),
> four independently selectable conversion rates (125 ms, 250 ms, 1 s,
> 4 s) and four independently selectable resolutions (8, 9, 10, 12
> bits), and reports its alarm through a different configuration
> register bit. These differences require dedicated handling in the
> lm75 driver, so a distinct compatible string is needed to select it.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
