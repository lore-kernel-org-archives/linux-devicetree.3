Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870442;
	b=TbjKwLV6MJxubkhd/B9bU4+kr2cfITRmodV9Ai+/Ixvb41qYB2ncJnsKSYZaqodPlekv
	 kILElXDgL80CZKIq5My89Q+jojbiVfm5VfpR8i+lm7IeIfKCKDyyvmLpRNbNcxZitYUuP
	 USJcmVIA0PA19M1UAAbKI6aofQrvJvtjSl8ESPLIkGTuBhiorEHiBv8U3nKPpbB/q1Da5
	 FQn3iUfR23s1Nds5f6GdOZ928wshKr464APqqASkFLzL+xA8K6KQTvlAhlHQgLySFg/tW
	 /NJyMo8p6x+oPXLR2MLzgSpJ+MbvQfXZAxlxZSJ/cNP+gAP6t/m/pj7accz2JzGrGFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870442;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
	b=LD7qpZV0IwxOMBjaXMqnJz6yN/ud5DNv9Ofs9s4ugdhaYXiqU953q7hZnYrhSS3PZIGj
	 CuAW9O4U2buDpy3wiWKEv0eOlEzFxMA7qIp7aSe3dPTwNyda5F0MzJygoX96VD2R1JjG3
	 NwFivEtlqItFTJfgBzLDi44B0KgYEnj2slosFqdfK2AjAqu+mH0kHabilx7XHxZp0WmDg
	 Qxe/oLbbWZh4yTHqqyk9Qnf80RQ1fH3AVputDTHSW7wCYubl2WSNW6tNPlfmPrXPQMvHX
	 4IEFcwAhKbUrghnkpunz0Xix+xW1plqc6Q9h9pneVI50VfrzasMtPAB1dYHtzOK414g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VaeBDszm;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC660A263B
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7EC660A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VaeBDszm
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-91f0ab17747so47829966d6.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870441; x=1795475241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
        b=1JoQlRGbHHZgHttGKwCEZwvqkn17nh6JF1Gajv4fUbTX9l3ywoILt2RLX04st+whVv
         1KnekJcPCRMetL1ZjN29858Fe35k4AE5YIidNKmsjoL9MEEiBPenBx7h8NOTmWQZwYrF
         IlEk0EjFLHvPeSyWz4omouBle47iqkxc5otBM2GWeiLY+CGdyQIIJNm1apa2cLymoS8H
         xEh3s4zqxDCaPZ+B+wTeC1092HLFDXWvt087ly+I+r7zxhnygZx+lvnrER0QmMRTNIrG
         sowvS0naUAV7F1kuGmS+sz/B9xu1j6Vd3PFn9/41v1tlBzdC6+58cZUS7/ZiYWuztx+C
         O1dg==
X-Forwarded-Encrypted: i=1; AL+hErFWDv7KJ/JZJDpuEsNglBzrPy6RfUUgyRdvIeWaBhhFu2w2OEbX2Tg9pY0iSDHhKSg3VeDPZ4G2ppo8@vger.kernel.org
X-Gm-Message-State: APuU4Z8s0dIuPvVh54THhYiEJoBWQxEPa9WgP6371xKFRlnACucEC5kr
	Bxp9FqieNTMbUSOOoI7hQ4xvIUARom8QgglQuYFEB85gfQ5bs6craFtGNOuikEYqUTQF5go6Da8
	JShKFbQRJsbLAnZLVfh97aHd0q7CaV0/WTuvPFos19ZDrnkqo3pmH4yLfeTq/8ShIRGo2Do1RL7
	4TIX2EeGTsA/rcm5hj2veZUq7FuGbLwvaO381MHtL2NPmb4JYReQsU/MG720eO5FmWjyIDZ81QY
	dzWoVd7czX5AmSkKjf+EQ==
X-Gm-Gg: AZFdTZcyK2f0MuUpCJO7oyHLCgSqM5W9o4c6JAUuKwE2SZWL0elRUgh0iEa+PhVUKa+
	Jfr6VTKcEod4jbH6qFAi9QOekIKCjFvzUeYIXrn1Zm73LyO42VStiHNZflYSx8oI0QWp9zuWeBc
	k2dQJyqUKNMccz2Q6VwCQz24KY61x585ortJpF9LowRkWaRdwsTh0bP/N2U13G9484JGc3hCinV
	cDO1Gyn8k4zLgEjSXduTvrHcbyqEfJsMB5NEgkXAu6MOIhuqjxP5b3m9fdx33SZoaj2M8XCya1K
	Kd+CIFp1HrI3Z59lHqMOz7aIF3DrAuNtrbO1xst00eFSrOC0UAzjhTy3b9KXZKku4dCVl8mHZaU
	4mI6yjfPtWS5vZYiZ48ih+wrpvKLQ9QCJdpWxE9WCDCeg+4E9VZyiIpwhWWBtwOd9qWDY3lbJff
	8MMoXcaps/gIE7Zs7RwoyI1++O/rfEUXpH2k4ogb8F
X-Received: by 2002:a05:6214:246f:b0:91f:30f8:73a1 with SMTP id 6a1803df08f44-91f30f8753cmr144178726d6.14.1794870440706;
        Mon, 16 Nov 2026 15:07:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-920fed6f2d2sm38416d6.45.2026.11.16.15.07.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so2206890c88.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870439; x=1795475239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
        b=VaeBDszmKHnDGk/R7SIAlVzIe1CwFTI9g1YhyDFwB38Ltud2DWD/tmVEPlcnj7gASe
         qxAqxciVVs4SXBKHt0SNl7h+oDdu/WV+ODf2bkd5biR1stNy+FZvaLSH7yDuBLcViTol
         3eDG7iAP7ru1wX21Ti/DrLRLEcg37bP6BGA3I=
X-Forwarded-Encrypted: i=1; AL+hErGZCM11JNldNiqmdBZqD+TnOQ5AAggq9Bmbs2Qv9iPQSUbV6K38xb9f8/V/2/l1MneY+7tlnVvWOSuL@vger.kernel.org
X-Received: by 2002:a05:701a:8458:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b522fb84d4mr6306500c88.16.1794870438532;
        Mon, 16 Nov 2026 15:07:18 -0800 (PST)
X-Received: by 2002:a05:701a:8458:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b522fb84d4mr6306480c88.16.1794870437878;
        Mon, 16 Nov 2026 15:07:17 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm50516401c88.9.2026.11.16.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:17 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 16 Nov 2026 15:07:15 -0800
Message-ID: <20261116230715.1489712-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-5-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-5-florian.fainelli@broadcom.com>
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

On Thu, 29 Oct 2026 14:25:11 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> The NSP SATA description omits the IDM block at 0x1811e000, leaving the
> interface clock and core reset dependent on firmware initialization.
> 
> Supply the IDM as the third controller register region so ahci_brcm can
> perform the downstream clock/reset sequence. Extend the AXI bus range to
> cover the complete IDM aperture.
> 
> Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
