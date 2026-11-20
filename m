Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138030;
	b=xReGeDmhIQZ2nMuL+TNexxPhsu7FOgFELGm7YCRtWQBENVRL46Lz34Hd1ahTGcpg4j/X
	 fIyaI7aYcDBebTHid6c6a5CEnoEnO5QPo4zTpLCUNZIGCZsXdUnEa+Xjbof3AlDycOlCS
	 YLb+fDRQPgvNdAm0HeXHJb4LJvqqKKEiAvCHHuMI6nJE0rnH8nlngWMatbODunKGaYG+W
	 CG3el7HFK0IcwCxDg3zj9gmXOpgJ3E27qLzHRPuw4MWsa8vfsqsiSPj+j+30HtTOrQSfN
	 O96wrBth17CHzhGS6Zj3Rsk5hXbUtgeO6LvSodb3uXFgvbk/b8Pe/DK6TYURI1anZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
	b=w4sk2Oft0qT9JAJjRKh7iusK5vsiFTrJn+fxU7CR6Zy7de4UVzYPNsuijOen9RV3bAEm
	 Tt2HRxBd3P3XdSwFHCJ/nYaP8dky2GUGOKSGjXB/yEsaZ564Qj5d72tNjIDYzpl1ftUaJ
	 vahmJuRdek7ANgium90jHeYvR21UosLH3VoLVoSFrNzZ3LdaFOYgnUuc7NAoUNew+QJHM
	 XvpHJ0QR2y0koWK+iwdAESdja0dEXupX2PXEnihhAZnTmN3RzYtLglRl+fQFwr5fg1rI9
	 tGNvnlyTPIyMjEdgJ9ELhKEdfX2wG9INmz0rw3/L8yFyE+7dT+hCrz4PeudoDyQblwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT5TT9gF;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140BD606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT5TT9gF
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cddee4abc57so112520a12.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795138029; x=1795742829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=oT5TT9gFVeRsVpTIRpd7uVSqmIfR9E7HLDq2Z0TbkOyEee0JmDRfsxeBDU+HFuRvdM
         HcggF3/dyEQ8otgi5HAxGJaevGnotQqnq7jqFzIz96tQOjSB8r/6PJnlFjT516lVoRtj
         UFQ/YZR0j7lgtbQ017QIHjwf4wrLs8u+zg72Z5BNwh4m5vI+VnG9hpn8zZshlpuihvyH
         GTnutHBlMsVbpryYQYyOKJOsdeYBCVluqFoVMxhQ25lZKbZiOKzYQmdHcqDHb0QOHwOo
         8i8f3X9HZvrq0zTbebY9d0sPIJRedlPqOykfPGl73ZaJ0T36q2sWbbpBbx4ilTsirvkl
         CFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138029; x=1795742829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=iLX5MWvT5Frc2aLVZ6nPpJlUdJtDV0EKb3hP2a24FZLMBpFiLiLRq8IjBNcsm5td/5
         pzfGvm8HGgl/Ge8ouXnCr8zbu8DRODry9FaFRzQ24O0RJCKsIoCV4iTCxtO9SMMkGo0N
         ubPUogD1QdXde/j/XwVNzTa+zc8zhlEXOenIWXV6pvNLhYBjgq1gGPYvztVxKsvGHeXT
         dsBRtFhI4NLkGHneoAuTSCNBMCxpjnz8fUCOlFY/DE3dN7SsPhe7fsweJcqfiKdl+I5R
         ZoUIJEE6uVqKecVI8TUt/KPiIYls/Q2iTDEMzJmGGkl2/XFksI4fROEmGrzLc3HqLg+L
         FVlQ==
X-Forwarded-Encrypted: i=1; AL+hErHRd5t4GQfBR8Rdt9rm9dXcbI4uZdyW01BD2HHC2sth1DE1z2+cnSvz/s6p5dVF4UrNkbLvVzDPjodc@vger.kernel.org
X-Gm-Message-State: APuU4Z+EYCuGAhRVpeNhCshIPRopZDpqJaXe+RwaNYnumeGsUjs0urv2
	T2U/PKVajqEUGbWpyk1y0EOpDWOhwvN2wkrHG/CCx3crF0LGCWXswZmTx9/qZZ73eA==
X-Gm-Gg: AZFdTZfvF7lA0vDJSt+VXTrAprde8hLa58pg7oeBip4HrQNDoMF5uazJPs3ZTaSBrke
	WAgUIPBM11i8Fe3JEvTub4XJX6Nzf8igvgUscYv/rSP2y1DsjvGYQUUpHemE3j2vZAZSrYypGpK
	v3Te+LyreYSZxYmkwHBBIOo1Hv+0tMVzd5H3asgq6kfveMONUbqL22dMJhAgB6WnHoUaYDvvktb
	f/ZdDUWE7Pw6ufXi3s7ZvqV+sziDdpqxitniko09+9n0ZF/1AFPQvZ8Ghq2Y3HSP7m2/8sEGl+r
	d3jyOINpsF2e4Kgy4Qmo6EOVLgTqpbAwEPjtQM5r0DkHA7f1ygx41XzIYGHfsOZzvGz5ciI98Rc
	BASZ+TKoh+ttL/CIJHTPSeZIr3nuDFOZ34V9wh0McUvd2Zz+3m4OAocqWf6DC7KIpCb/W32FJ3g
	34tHQU6YC6SOJBgXPqByeJyB4I9sCwG5c4LO5FjeTCeNKNjVbOhY3Gy0ZcmgPe73P/uKnAKDsW3
	s7cGnIV+md6nU6hf45sWhWtJZWPjpSfyzg9s0uVhE06NZtAs+I90wGIf79N2RSRClwcffgsJ8B0
	2TFT92hi+Oy8H/AzkbuZiYwmoE4u2mrcpEpjSaJFWbPA6joTD6T/re9AvrTMj/pAsKhwwk7c5To
	4u3fAVgZAkjSIMBi+
X-Received: by 2002:a17:90b:4c0b:b0:3b4:12a9:2e1 with SMTP id 98e67ed59e1d1-3b41c931d36mr1334543a91.33.1795138029298;
        Thu, 19 Nov 2026 17:27:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm1763326a91.4.2026.11.19.17.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:27:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Rob Herring <robh@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Fri, 20 Nov 2026 08:27:00 +0700
Message-ID: <20261120012700.1878745-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119230614.GA1147583-robh@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org> <20261117004133.1594972-1-jjc@jclark.com> <20261119230614.GA1147583-robh@kernel.org>
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

Hi Rob,

Thanks for the review.

On Thu, Nov 19, 2026 at 05:06:14PM -0600, Rob Herring wrote:
> > There is no other user in the tree currently. If in the future something
> > else in the kernel wants to use it, then the solution would be a small
> > driver to mediate this.
>
> Would doing this imply a DT change? If so, your binding is not future
> proof.

I don't think a driver would need a DT change. The property only says
which CPTS input the GTC push event is routed to. It does not say which
bit the GTC exports. The role of the driver would be to mediate the
choice of bit in the GTC_CFG0_PUSHEVT register. The driver would bind
to the ti,am654-gtc node. It would not need a regmap of its own, since
the register is ordinary MMIO, so the node can stay a syscon. The CPTS
driver would use the same phandle to find that driver and ask for the
bit, instead of writing the register itself.

> Not the kernel's job to validate the DT. If something in DT is optional,
> then whether it is missing or wrong doesn't really matter.
[ ... ]
> Is that true for *every* kernel version? Again, better user experience
> IMO to just warn if something is missing and continue on enabling
> whatever you can.

On reflection, I agree. For v2, if the ti,gtc-push lookup fails, I will
make the driver warn and continue without enabling
PTP_SYS_OFFSET_PRECISE.

James
