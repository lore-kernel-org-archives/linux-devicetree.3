Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337664;
	b=qpBZzcL2rj3E8eajdA8QH4S7HzNoSS6Gu7/XQvQgxV0jKol/huohixoNNIxehefck3ED
	 QIum6CluC20O/BtX2VQUQ5EdyhXEDyom9vI303bPMzjl7+m/HumOkGQArXGa6rJojTZ57
	 x1lZLfDvFzls9RQ6na3mqYbUbrbPerQwssYPjcwle/+arDytwJBS4P5JgVOygzg99bidL
	 TaJUHz9FBiAECrC0F4DC9e//AGAbPUUKF01O33GEsfpLPREsIgqMTtrtCf/kWg6snKgv/
	 y6maOvbZ5U5JSDuFb5kv/0SrVvNX+qu3AI0+hC2LtUMJd04z40dXA6Aq0qG6WYHpaaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337664;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=DWMrPh69MIlgCAASSFlOdVPK0cuHXI4P0bcgg/LtNhY=;
	b=JDyrhRqiIfTCVKEWNPwC3Fq3ir4PUY8nthfG+yjPWEeSLd0iAsUzObG3T7PlCza8VR77
	 5J972AaKdMozbiPz0Nl5BeWUvuaEVtYhtTWphU305VkvsGI8CYchXr7FBWdzAB6JyyvRN
	 MUtHK2E8jM9Xk76H8gKe+MUU8KeWY4IDSJsY+IMhpB4ri1TVSbdn5BiRsTnGoWtGrZVfx
	 ouW0aFz137pKzYVXtkFVugYLAVypphYFXA1E8mC38SraDJ96Y62pRnwaio5oWL5rDn4YH
	 cpLhKqKg+tU3T3jJy9F1fhYoi/suogcuYrhf+izamqPebf7t5wJYJ8L4qg8U8ME5okQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hh5ZyzDv;
	arc=none smtp.remote-ip=209.85.160.228
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9C606A320
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B9C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hh5ZyzDv
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-53cd0c8614eso16083111cf.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337662; x=1794942462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWMrPh69MIlgCAASSFlOdVPK0cuHXI4P0bcgg/LtNhY=;
        b=r2jJcGu4iPD/cfylUPNG7UZyuEZ59BDrgXvU1MOs9ORZ+rKt/ie/1qjP/HZe9CbPze
         QhCzzNk7gWknFOQdfud84uAF307m0/bQnVffEoTh7hAtw+CpluFUn9vO/Be5Sh7fYvBN
         geJUlukinnZji6qkNVYpZLERMp2elruifyNiRXJMqrdz1ave6AkQ9eWidVKRDIx87G05
         hv/Tr2Nv5Xv1h1jX2LBodD1Zg3ignBKa94maWJxirU3jKOQMo39tVaQBjm02u6IrRGa1
         GxfNMBSq8/wHws2G3SlDmCuvWI57iD+16Dviklx9K0EW29itTLVZLfdYDfotaOO2/xyp
         t36A==
X-Forwarded-Encrypted: i=1; AL+hErHTrzjtUs553dlHPg58Mvnv8xP4IZq9JXqHx3uR2fKTBoIybIq422betMycrw+JZbaf9Zlde9h+CYRr@vger.kernel.org
X-Gm-Message-State: APuU4Z88yi6O8P7/N8fTAiXqmndaQ2nQgFDIeLXPa+tAnIBLPNfeDEvE
	KQzR+uYilFrFufBv1uLmsaMpNsXJUspKl3HyRtM4fW3P+96IVedHhDKNkan3WtLLd+jCHwQsM9R
	KLR1xEFKgGUbY3iog3J2jcRClQQJtLcqszYwdaGVf78al6TU5BwpREPI5zynpFZ/lgEXLTD5IUn
	aUpxHJYV99S45wcOUyC1Dy9QvsglyFFDetTnjYo/j6gibtP5F6n4LymEjFoObpVm1YI7AJrdjLJ
	5x2EulPJNAoXhp9JG6i4w==
X-Gm-Gg: AYBFou0s2Mxk9j1uOr+mQLVDOlE3CxY6AGFgdfeaVIW4EEodBWisnUbm3l8mdbD0l3C
	NP1FS+JD3AciXTQ2+P9Ba5sHGM2qDptfU8wCwZvy8bDTJ5rKPR8ZWfhpC5GjO1QZmWfTv5oGZ3o
	Cfc49dp2VvKHFEQNUU5zWFCxJ7tekfuUOt6AjJSnliLZRtIyV/IoGnV0OjsEsP94ZS5auD7G0a2
	wZqsUUSnm9EFrik8p7W/PqMP7QGPhw3Nox+ZthX/wHL8PHUDR1Y4LCVwZucuw5+TTTFb3zJL6T2
	xRZLrC1El1rKffrCuEk7dS+W3v9PagJKohyNhy/wUeisqRv5axQcEcOe10WrycT+ttDcxxykbr+
	5aAvY2FvjhAjBiL+kXy7XleaWHIxrqLb2KTtaGaNKHbzxTIDkmMtdwsQ3JXy178jPAQgggQVe5q
	VbyL1qY53SLJt57cREN7hPnuEcnI/E1hWHgl0hqZR8
X-Received: by 2002:a05:622a:514d:b0:534:5df5:aa11 with SMTP id d75a77b69052e-555283f0f39mr51700031cf.50.1794337662212;
        Tue, 10 Nov 2026 11:07:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5550b350556sm547971cf.15.2026.11.10.11.07.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:07:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so285079685a.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794337661; x=1794942461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWMrPh69MIlgCAASSFlOdVPK0cuHXI4P0bcgg/LtNhY=;
        b=hh5ZyzDvfuTpMfsNZrYB5gS0m/L1gkGwoFhI22J0cMZgzwB6FzDrkCNTXFJGjuOBlo
         A+6a+tLZAk5mHJG0p+gXtjOCwC872a/2gQRT+ibiI5kjvfIWV4KNmbZ4C3QPwYKkcqjb
         lIHgOpDxDjkWs0NGLit8NGLwTjWEWOVMddGg0=
X-Forwarded-Encrypted: i=1; AL+hErHBUep0yI4XXntBsmADQC0nzjkkzVlm4ByNhOjpBSc4OkCzMlryObMBrm4Oby71OF1ab0wXt+vqIz6b@vger.kernel.org
X-Received: by 2002:a05:620a:1720:b0:93a:824:ac8d with SMTP id af79cd13be357-9479f2c3ebcmr618019185a.27.1794337661397;
        Tue, 10 Nov 2026 11:07:41 -0800 (PST)
X-Received: by 2002:a05:620a:1720:b0:93a:824:ac8d with SMTP id af79cd13be357-9479f2c3ebcmr618013185a.27.1794337660811;
        Tue, 10 Nov 2026 11:07:40 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm293230785a.16.2026.11.10.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:07:39 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
Date: Tue, 10 Nov 2026 11:07:36 -0800
Message-ID: <20261110190736.2346011-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org> <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu,  5 Nov 2026 14:39:47 +0100, Linus Walleij <linusw@kernel.org> wrote:
> The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
> not provide PSCI. Starting Linux from CFE does not install a PSCI
> implementation either. The working PSCI interface in newer GenXOS
> firmware belongs to a different boot stack.
> 
> Disable the inherited PSCI node on this board so Linux does not issue
> SMCs to an interface that is absent. Set the CPUs' enable-method to
> brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
> mailbox only in CPU1's cpu-release-addr property, since CPU0 is already
> running. Keep both CPU nodes enabled and leave the SoC's PSCI defaults
> available to other boards.
> 
> Also remove no-map from the secondary-boot reservation. Its overlap
> with ARM's initial page tables otherwise causes the reservation to be
> rejected, leaving CFE's holding pen unprotected.
> 
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/soc/next, thanks!
--
Florian
