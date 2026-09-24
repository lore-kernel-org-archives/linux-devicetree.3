Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07AA31AF1F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232485; cv=none; b=klbtm+vSPO4KjjWIIL1PAt6E1sMjuGi9hVLVGlLJ2bh5JuZola8DfaMSRQTX8PJjkKCxdcnwsG8ZhfQ5vavGtCkAfrHGHCwQYp5RSSaHMzRwWuvHgkJpZ4oNZnfcV+jsgejh0CLFykozQy8GvDDR1xr/gRLVc6VPEC6z8jjcNcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232485; c=relaxed/simple;
	bh=fW+16a03X29jP3HHA//Ncu6zdQj4og3vImEr0HPpdtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz1NsHl8EU6YVz7G6pBL70NUgRcmxKoh/8i0yNQufuMx0rdONBlkScAY2a19wNz3EBqDCuTRQYHRLOsAetfZmsK0uYs8TQQy+afDfdZhfNO7HUbJquvdq/TGwiZ/Bb5YklmhCMaPaUqKc+nAFtOjoCbYZefKUqaqRWwhTi+0A58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=HJXaNzDU; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="HJXaNzDU"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso2569559a12.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790232482; x=1790837282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25SG6aMFG2Rz352oaTZw6WQsjeLeQiMTMtzkuCycS0c=;
        b=HJXaNzDUqCrvfgEiGFezH3v6B1miG+FLBiYRZC+uy6W7PunfQt7cLQExAtws94cvhS
         TzzO+GMeHa2UXBxXbCGrJGG+LWx9bTlxDOKffTTkwJoYxMBnECOYARgaGZ5Nf/9FE3hp
         JQI5+6Fs2TbrapUmps7idlXJ12FL12iaXPhCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232482; x=1790837282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25SG6aMFG2Rz352oaTZw6WQsjeLeQiMTMtzkuCycS0c=;
        b=BIWt8NHsTKa0icJPLVq2Vj5QGqc2BggeGFzJnvAe9UnKyNnwAA3y0g5NQ04ys3mLIU
         W0xZ3EdbQNt07NlkYZDNEXTns1FAVwjFmHr/gd9cVmJDa44WiPZPXHmEkdJ7wUfOt2j4
         PunOmor8d6W/+dyY1dphAH33ljndddZysJLcgBWBjMU+2t17AYLs72Wb3dqUCJyybqz/
         jpdXsb/pE3iKZRjR2HsJ1tOmKdka77LDJpz9XjFeXOLB8dNrdg5QCozVb5M0lAJiAQuT
         y9JbtaoE5M853sgB9HCPlRfY1PNqg09p+qEKV0q/zAoBtsd7nb4Jo0fNWxCWjaV+051A
         Zvdg==
X-Forwarded-Encrypted: i=1; AKwUvBxQPSGyMRwzRP+pE+sNOBt46/OYkXsbZ4gUG4TYGDp5V5ILEbUIVss527j5qiLGQUnYmlhj3Jq/gzM/@vger.kernel.org
X-Gm-Message-State: AFuF++mbvkyfB1Yo0N6ZCZEmKDwQ6aOge4K3jnJl991L9JNq2zO1r7he
	6f0XNWLsU87RAwojugz9eEroF3CNe5h5owKVWKNQrBfLxl+r0oSNfF0Hl2p0aNGb9XA=
X-Gm-Gg: AYBFou3lDeJVys3fZTajNmkiGyZo7/HmUnE4YdzYrgMeXB3L6+2f/LU282IK1Q2mAI+
	dbLkhDt2l2zol5fcVNtVaKh9POiz+d4+ftJYRWcRPiUj4q2cKM8XEciX9s6YP0EQhAPv0edipXH
	XOxQ/LgbA3pr8L4Bl41nd0PC7DM8fTo3z4N2r7zvifdvE1lKtmgYRHYW2/SXThupSZH5u6ADPxK
	VJQzPpZJbS0zW82XMQH85ykEmNiL1n1h+aPzGvSeE+04m0nsaOWIBa9qO62o5MpKaesP7VasY7M
	vFwUDUrR2JreeMSo0L+GvCfKuHXUn+8N21hbfSZmwzpEggWkr6OgUXCfWicOf94kAsvXS2+nenb
	PnQomV/ifya0PHrIxw3zoPDLmJrrLGgkAYuqnuOHwmbRBd/JRfSZ2eYKQS70p8TatcdQtH0L2YM
	ylO3mNyomVOHY0s5GV+8SXmAOpICHvMSyz139cWrOfpmiZZU9tmusk0mvGOIX8X+EX2GblJqIH+
	GQc1fdvMuUvrngUX94=
X-Received: by 2002:a05:6402:5410:b0:6aa:948d:1c1b with SMTP id 4fb4d7f45d1cf-6aacc868480mr824334a12.42.1790232482124;
        Wed, 23 Sep 2026 23:48:02 -0700 (PDT)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a95b3sm2949392a12.26.2026.09.23.23.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:48:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:48:00 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260924064800.GC6325@bender.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-3-petko.manolov@konsulko.com>
 <20260918-robust-spotted-orangutan-4b669c@quoll>
 <20260921074224.GB14552@cabron.k.g>
 <d6b1b369-a14b-4605-88cd-7ce348720111@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6b1b369-a14b-4605-88cd-7ce348720111@kernel.org>

On 26-09-21 16:11:06, Krzysztof Kozlowski wrote:
> On 21/09/2026 09:42, Petko Manolov wrote:
> > 
> > Can you please point me to such example?
> 
> Any recent NXP-based SoM from their bindings.

I'm afraid i do not fully understand the above.  However, it might be related to
the following.

There's another patch that is pending for submission and i just realized there
might be an issue with it.  As you already know the M48 has two independent
cpus: socfpga and imx6.  In my Draeger M48 socfpga patch i add "draeger,m48" to
Documentation/devicetree/bindings/arm/altera.yaml

Unfortunately "draeger,m48" is also the string that i was going to add to
Documentation/devicetree/bindings/arm/fsl.yaml.  So the question is: is it
permitted to have the same string in two different architecture bindings?

If it is not then, what would be the best naming convention here?  Something
like "draeger,m48-altera" and "draeger,m48-imx6" or some other combination?


		Petko
