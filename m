Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363541;
	b=n/9si7/uiQyP2fmg6c11Cu6k6AWAu+iCyaaLUbTr00SQoainsfqJvuFaNjCX59jWKIxe
	 PxTGxrx8ZqoIac7i3lxsVXgPmRB3kuP6mva8VDCRGbmSxTQvcnhtyol4LBktiLZx7G+RF
	 o6ErpCkYEiwGc9mwCTE1VwnZqmkedl/CFI9R+2mXXWlET17HWLZl624JXC5WoerquGRPb
	 usIBx8DiPzbd87TtPbFDaFEmITw7Vrf9pR9D+RIW51vX+2xVy5byS1VpmZUtaazfyga8V
	 csxxeioLhoRQpuwC7Au/5+p/pQaJzLTBPBzzndlfltKQ/ImuqC35k+A2AEKxD2qPSOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
	b=cccp9gtx5ecFUVwvfe2Wa+aD54foL2IO7etFZdxVvZN13CgZZyuubFK13qLebYkjW9Zl
	 znH4SNxc+unvhXXiamB2q4MPqSJ/B4zNE3kNlHgkpJAmIR08Pt738JO/R5Ty9tzrb6kh2
	 qS1ghihYa7isu8iTTMp1WSBswQXP9Xc7Up0fUtZyk6xcoeFVyTjEexkIGHeJ0NTJcRSDN
	 gWqVhHvvoI1vnmwH+olt9pQWMNH2kw0FsxRCOywax8ZhpwFrsOEdVCa+BvEIF7cqNFkoh
	 /dvUXJpBa76q3zX0CxujqdhGfmIGSzi8nhwcl98fF3RT0fdwpv7Od9nOmycZGUgexqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2krku+Y;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52F606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD52F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2krku+Y
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1469818241.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363539; x=1794968339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
        b=m2krku+YjvL7RwAHdVnX5JwwsKjAmCTwylPED02piBX5bjzoH4ibDEntBz6HiCdspr
         nU+8QyqtiUrsnaUjbaYHQsStgBvg3X/67QQ8hZWYApOh3F0ksrsMTvGJaDQ+1AZ8V3Ct
         6Q40Jf3UD9YQQyYjI3//L/0W33Btupqqz8ivO5Z4dVW9QRngt+HFPgenN8crFEGxGDdN
         VCRHCwsc1Q9F4g1OW695Y1ARMEyvtjb6LFZvr990hyM+jF8q6edfDH6irdZbQw3/uMgV
         MF0pBlfW+dCPMd38ESEFm7u4AUX02QO6jSr1JCTX+pbbweQ6MprJg61/EDmyOC6ZTryl
         /fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363539; x=1794968339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
        b=NkYG/9acTqU4V5bmmLuTdRM9pANfI/flHBDqDLiQeKZoMm9sF/9pGzYUOq4+Jg3cwV
         OLLerXhYZYe3XElUA7LbtAzdJPujavM3WW+CT9oEAWHlQyQChTJ7DDhbji9B1G0xAbWH
         6vrHDpJ677Dd96K5lQ0bLHcuR7kz73gc5EwKjYPzYZuYiNzQe35Quo1NF2Ej6V1BI5QI
         6qFzjpoQesSyToZ2TUDroPxnxSamV4YvoelaCH+/3HR3VZUkTcl1N08jjhhQ8nEDl2Gl
         bmZH0JKuILvWZ6tTuvsnO+iRqsa+Pr1USFkk0S+2BBdTvkulnVso8CeDWHr2t7mkMomX
         iytA==
X-Forwarded-Encrypted: i=1; AL+hErGWPmnmVTPFqgybdPJCU5Zf1eG4uuYz0vFHaHlsPlg3BbWWk/yUe73ncbB9nyt5BfSnLPfNC77lvLgE@vger.kernel.org
X-Gm-Message-State: APuU4Z+g9J9CD+x8x3yQbpQdMlbmUIH3+Xfsqek0LkXVjNZpcZkrhFn7
	3TVZBAwAl4Si9pIZf7zTr6BGeefgCm/owul5UtVcEC/ak6i2LcNmDjzV
X-Gm-Gg: AYBFou2cRNDgTqusgAHENBO7l9cf+4YLsPpUJUV4blKnlvz52LBcfSjohfMM3uSCPkS
	ODZk2DekrluzrGa0Go1UHyR5sNuS8+Q81wiKmzh06WUSfDa2/Ljd25i//0VGc+aIHYLHQ2j/dm3
	o8UjxdgiyyW3uLOYr/looZ+p/KBbOaL3OFOXdjo9lyJ57Xst5uhdU8eCVa8ZkjLjEtWY9d2WhHh
	L8paj2mlbYVvV8wK+Sg1hVyDnOIKI90ah1EmNGWQemvTH9HIe2toVosnH1y03C9GvKFjV3YKd9d
	EbzsDsPdsG4CeKq8M0WFLFxdb/qB+c2SGOX/gLtOoxCD2rfzuCnHL8dGn5yjfDzRemI1y2q8Lam
	dSCEBLu125gGKaxueQ8D1tgB1FvZnBMWKtdvhWxu6LKDrpCkXKomp3B2vNGSm+nt1mfN1jB987/
	jPxnqxgVygAelGZJVtS6Fykp2vMe8UNvINz3yi7oJvRCZU3BS1tdlnr8SCnO2f6EhwoQNV+4zL/
	FIdHUPfKyxIGcVMuoHRSEuyLOU1l9zMljqVjlGzHUGjIwH+XOCP12DpxPjgQQxO0btT0f1y2AxK
	jztRiY7wt+72ALm5qzuMx7hNcJ7k/nvXU2JPShtW56DbK6ZVWGM=
X-Received: by 2002:a05:6102:5092:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d4fb2a44camr283379137.8.1794363539520;
        Tue, 10 Nov 2026 18:18:59 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm2888590137.9.2026.11.10.18.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:18:58 -0800 (PST)
Date: Tue, 10 Nov 2026 21:18:47 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
Message-ID: <avPQhxfKOpmihOTo@rdacayan>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>
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
In-Reply-To: <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 02:23:15PM +0100, Konrad Dybcio wrote:
> On 11/7/26 3:24 AM, Richard Acayan wrote:
> > This series adds a user for the SDM660 sound support code [1]. It also
> > adds the ADSP remoteproc for SDM670.
> > 
> > [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> > 
> > Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
> > - stop using fallback compatible and add lcx power domain (3-5/9)
> 
> Can you share the output of `cat /sys/kernel/debug/cmd-db`?
> The SoC also has a LMX domain, which downstream seems not to wire
> up to the DSP for some reason.

Here's the ARC dump:

	Slave ARC (v16.0)
	-------------------------
	0x30000: cx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30004: cx.tmr
	0x30010: mx.lvl [00 00 10 00 10 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30014: mx.tmr
	0x30020: ebi.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30024: ebi.tmr
	0x30030: lcx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30034: lcx.tmr
	0x30040: lmx.lvl [00 00 10 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30044: lmx.tmr
	0x30050: gfx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 40 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30054: gfx.tmr
	0x30060: mss.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 40 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30064: mss.tmr
	0x30070: ddr.lvl [00 00 20 00 80 00 a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30074: ddr.tmr
	0x30080: xo.lvl [00 00 20 00 50 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30084: xo.tmr
