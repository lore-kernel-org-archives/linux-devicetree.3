Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478699;
	b=2njqw/oJ115qhuBMXKRewMP95mRnA7TTbR31XvRiFq4pmsZPqAuUWpo8g00e2E1lXmXS
	 bSipt4DxFtmlUCtiRFsFdGItjZXsJnxYyDfzqpdCuk7jRRe+YN7vu1ZBWhAM991I2nuU6
	 lMuLBeTlw1oVpl0tj2P2/BZ2VMM7/POM9VE3EWfv8I5pC17UmhCN/iPREfBD8CUZOwkQj
	 htn3ppqRZEodxWUQ3r0EV3m1LP55yhDhaFTbn3PtiOOunc/W/vTQbCVxHz4sRnh54lYx8
	 lZeB4baxkJQZbCspZqnvfoTC5crcI2plYOnrfMwmWcsZiBcFzTBwRPKefiyCgAZumvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
	b=MIh96l7XaVYtJLG4BDT8y1nKYdZHKzT0GqoBYFV4ZfT3BeXmxHl1Ww4cYy4JYGMJiwxb
	 m0cg+z1/+cW7md0VCD4+53Vq9/Qks4r3Wgyhxe3RLeeOJgAirpjSRyAUNW4TeANUOj43Z
	 +4oYLsVbI76P0lB1QfdZOHzaoLcdcd57/cKOr9qRJKGoPl7GmaySctUzFecum7+qeFhBe
	 cYkdIq/ndjlR4FtI10RaFROKgC6ccP+ogcjpx8XTGoli164Q8N1LZEYNV0bum1rm9/HVA
	 6jIhyAiVP0mHsdppFwOVthYDdgBxhTfwLMVKSGu/GlaR4QqBefcCJKsN2csRquRaXmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJOcG6rI;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3740606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3740606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lJOcG6rI
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so17737355e9.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478697; x=1793083497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
        b=lJOcG6rIfW84QMQcgQEh6NCqonY0PgoUVhn7Rwww0IjPzzS2tQNp4jnTsVEx4i1Cks
         +TEVwjTrsXoEeLVW8OOb1VMNigLC4k/ztw+MG6mUSK+9o1Z9YLTNnmBou1EJlccy5L4E
         Doa4zqS2lzi028EElhqpFAIkWQZWG4xDoAwmR9bM27lVb91pBcZJ3qB/LhnmmX93lUq1
         pP2WKoZq9swhspp+zCyFXhY7z6lLxUgO/m1NJCerppFN4DtnvS+aCavbUFAHfYbcZ30U
         9APArkDxlyUNTsdwjyBoE/EIpCRW8XxtDseUKBtaWfFM6OitlI1dM4y4UfLesX6xb9lJ
         ZOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478697; x=1793083497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cn4L3s18S9NAavDRPauTds7AtCfmozeJxP0dUPTZGcg=;
        b=dNrGwwA1cc2o//zklTdyVqKs6zs92Egh+iP7hnIryzi8f9LcFm2N/Ow67uUdMRLTFQ
         vekrfVgnbyc0SfUvHFukBNSAsynN0EUZw+BiCs62Tra0yKG/XnQAnte0ouig9NTnBmih
         RhGBvrMNZwss0CAurS4ZJhENg4HrrFlzyWiNW6jAQpMCzU0JBvyQvUWPIZKNC1VYLCXm
         htMYlIROyMR+rQdLRgGiKmZlYmBHeAnqmz69h+9XDpfFQRMYy7We8dDXzd47NgkQVEBb
         gY2lUPfK46Qg385aog5bowaCO/hCWxSszOSpGA/d+jORsjo+VT3WYqMhDEFH2NosRZm0
         UOJg==
X-Forwarded-Encrypted: i=1; AKwUvBxzXbv5BJ17uyu1ccv3TMxCVAMAggKDlTn/UfCH/qVwLrYx479VSVylUoB6FLTcAiRvL9er8ddbLmOD@vger.kernel.org
X-Gm-Message-State: AFq9FYIPcfqo64aHKc8kYNcM5rMlEquP0y+2GuWrfOhINr7on6m5vyvp
	DYA6Yzc84suzmk3eOulCD38Rz0gHayqYmPzFxYd8aMPNKEsSF5suTYav
X-Gm-Gg: AYBFou1ZMFTz3NUHrT9NP3x50PZrBKHwrEqxnsqH7u5TSjEmU/nXQo4S7rBK4CzvD1j
	3xZcS5anl7nBOK2JWuNp9c0G5Z+2Rsg5rM1rlRxbSUEf5reHguMvSoOMF3fdM+NrIJxcUA+e8ki
	JsPnRPSPlLQtEzOo4Pmmtm3jWxaD7IwttW1MIwZNFJeIFoIbNNi0uuir6KWk57/LMPa+qQjpu/i
	hIAsn0GCSHE/zT4uYGTPz2MNZ928XXzOVRIDqWZVQLB20jyK8jtGYX3MJPHzSrcZ0x5fDrFzbU0
	osI6ScAgfVoILlBjX9O9C213P5hoKgDI9FQjyZR0GuENdjmJkr9ZWNsG/jxx6/PLdoe8vWPvmac
	J0MCXE1z3sIrwbALO0wW0GGqIfNDPJPUIvWIucmENGZDi0UPm9mchqTjqUF+qVB5R1FWrzc9Km/
	8lXlKSM79cFuzgixY+30Uyr4JKi8TK3psVxFFM6C2ipo0ff+zd8bB7GQ5NvYl7qiooEXfi1Gadi
	QPNyE1qP+dR4K2KrTBtmCnbvG08+K9IIdR9EPJatvYGqJ6LLbm0+pWmOQz3g9quECo8toDkNY4=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr211999865e9.34.1792478696868;
        Mon, 19 Oct 2026 23:44:56 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm223467045e9.4.2026.10.19.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:44:55 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Tue, 20 Oct 2026 07:44:54 +0100
Message-ID: <179247822513.25202.7960395606350309657@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019193402.52923-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 07:34:10PM +0000, Sergey Lebedev wrote:
> From 19.2 MHz, 403.2 MHz (806.4 Mbps, 42 times the clock) and
> 384 MHz (768 Mbps, 40 times) are exact, so the change is one value in
> your board's DT, in the sensor endpoint:
>
> 	link-frequencies = /bits/ 64 <403200000>;
>
> If it still stops after one frame, I would be glad to compare what the
> two drivers write at stream start.

That took the clock mismatch out of the experiment. With 403.2 MHz in
the DT and your v1 otherwise as posted, the sensor probes cleanly and
reports link_frequency=403200000 and pixel_rate=134400000, but capture
still delivers exactly one 644x604 Y10 frame and then times out waiting
for frame 2.

I then went back to the earlier VD55G0 A/B tests on this same Snapdragon
machine. One result was particularly useful: the 1200-pixel line length
alone still stalled, and omitting the 0x0329 write with the old line
length still stalled, but 1200 plus leaving 0x0329 untouched streamed
continuously. Your driver already has the 1200-pixel line length, but it
also has:

	vd55g0_write(sensor, VD55G0_REG_ISL_ENABLE, 0, &ret);

I rebuilt v1 with only that single write omitted, keeping the 403.2 MHz
DT setting and everything else unchanged. That fixes continuous capture
here:

- 5/5 frames in the initial Y10 644x604 capture
- 120/120 frames in a continuous run at about 60.2 fps
- immediate stream restart: 10/10 frames
- v4l2-compliance on the sensor subdev: 46/46, 0 failures, 0 warnings

There were no new CAMSS/CSID/VFE errors during the runs.

So the link-frequency correction is needed, but the one-frame stall is a
separate issue caused here by clearing VD55G0_REG_ISL_ENABLE (0x0329).
I have not tried to infer yet why clearing it prevents subsequent frames
on this sensor, but the A/B is repeatable and agrees with the older
VD55G0 results on this machine.

Would you be comfortable dropping that write in the next revision? I can
retest the revision on the Snapdragon model and add a Tested-by once it
is clean.

Best regards,
George
