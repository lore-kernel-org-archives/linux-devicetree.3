Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870454;
	b=yrHRBU9sLVRHgFlxDPVnrF55/yML6m2UzkMon9pldTa/yIqLIEQdJ2MK0e4BrZ+n0JrG
	 HnArDyR35420LDciWDnP96RYsz/BO4NDJauMqJSoP3KC/fGUl/PBNuNuNIgmlz0HzYGoa
	 mO5cfhJdBYHJEpKKsK/c22vdnk2XPP0H/2s4gl83Bl1s/Fs6z1o0prJJFdm/7fvJLBNfL
	 jftwupXoQl/394ZkuEtQjt7OGAmQmz5SpGe7UHnt3bk1NKseqHc/rWs64tsH9ihTSKeT0
	 J1pCuMk5TN+/m/6g3EOai9Ja9TmEs4+4KtIjnbaMBnwWQB61CxGLtIPQwOjxsq0HzpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
	b=lN80inof5t1t6XJI0BYErReskubXW2RUhSet5MpeF4pyFzxUzKLlPhQZ3sSczcCX9iEG
	 Feo9RANJ6MM9RZtXzmLtY+YbYudD6v+k90nSvBzZcLpmoFZyuivOkZmuOWBAiS2hx7Pao
	 sByXO3jLzFzAzLdn8uyah3bgidH4c7AZeW9IGRkSLSDZf0Qj5dPqrO9A3AJy2kFbQE4VQ
	 cjY4I5O2E2Cz6ogW/GhyFnmvwY5QyfgVZXezVxqMinpSkDN2ZUMel5jpu7X2TN60V5HbG
	 JaMw9Ls33AXkSvA7T1P1OyiETWdYx8omjrri5DZH5mIQFOugp4yilUzCGoIzFUJZdHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CCsc6fve;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DB606A8BF
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074DB606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CCsc6fve
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so299735a91.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870452; x=1795475252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
        b=L72EKGX+oKilN+I6V/ncSq02RGlomsOk/TnDtMW2Pu2J6zhdoMHejAov3L/0gnowm6
         Z6ejR4PR9w5FnHrdlprBYs1bqH2DuEWxlYTK2ckZGbNxwWNMhByxNIIIC8VdHV7A71xN
         WGENw+w1l7PccMWfnA4bdO+pbNkvjjarwU2dQ3Wvu7v6xBJhFCCrpxEKgIO15TxrSBiv
         NPb7fn2NBirgHWX8OokKcC8hZFayNHmG8O46MD8JTzIt6fmM2UhBUOGXSNp/93O33Ry6
         LaYqBeUf3r+8T4ZpC6WYql7KmLHvAKe1aToM07jW/1YguMb67v76xITsnelzBQW4spQv
         IaVw==
X-Forwarded-Encrypted: i=1; AL+hErGy7lK43KQz+4WfaMjuHi4t95kjQjZzjb1tRrt/uf4i0n3RJYr6K5nsxK1DBFGjWOrDn8Bon4YwshA0@vger.kernel.org
X-Gm-Message-State: APuU4Z8+fOO+8F43Jbj0Di3aGS3y7kiTRaXW63JaDLO+2pAAetaytooV
	fulccOn9OWjB3sVCjG+VPstr5h3oZf2MCoJXNj9AzdlXq2JBVBXNT+eWABU3exrgzusTyhTKEhi
	274z1rkI13DrXhWBUNGxwi9s+2A9JTWeBp+jkEwTCd4CjF9TyU9pks+wdW8mMwvfk2g1+bp5rG4
	1gSuPhgu8CLCPvsm55TVrjulbRrdmu5C0a7znoB79/zhAfDxKUUQ8Bf32y9eZluuQqkAi7+0DWK
	bdqdFEGvaAEJPtZgtKarw==
X-Gm-Gg: AZFdTZfQSLnMnSZZNnL6yKTMwm0r6rXDUjlqaJeDmOn8p0yu3z7Lyz75GO/QUvipJCY
	MWK1BTQuql49eOo563MxorDzbJvfeA2a/TcJJJQ6Njjo/eUFUfb3oIAtGYE9IR5pEOY/V8CWRtb
	+It6XhEEvEP1kUgF1IUjm8w8M3mbk4RwnJlcKkeMJt2S+VtSzrFkVYL3Z68Uq85ZTM56e6JGs+5
	VuuFfePdVOUGIwIIlzQBkjSz+3GPUsyuvuTPN0J8vU8gZNQmXILcv+dJl8GCH6R7lj+8sUrdsbH
	er9YQWvoSS85TOxKqRcRgSuhq+CTqIG9ugGVmnAag44+HQvqJom+QLOJr511VJC6BDuru6pbk+J
	MuoBh1cbNEnit0LSsbpl+nvGBS3BTbM7arLpySDXIeDHrMnoNXdlVa/uRWJpajtZrxhtfNrqnTZ
	IWdIXGt9Rl9hTU4E0UcOnlm6aMwRW07FIXuvMCHM9J
X-Received: by 2002:a17:90b:5347:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3b1b0a3ba60mr13339021a91.41.1794870452111;
        Mon, 16 Nov 2026 15:07:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm557428a91.6.2026.11.16.15.07.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6132554eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870450; x=1795475250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
        b=CCsc6fvexHQp5kbxGis2nJkzION/CgiADIqoWcZQNlqWjhULXR03igQ/p4t3J55eii
         b6h2MxjqSWgfReRhei/JSnVpeJKccqgPCLc1DyoQ0rXux9jwmfyvtxrVemMbbBhXSjGe
         ZLoHfmHh/VThEzBfkj+PUqo2LvF3kkCOTeEnc=
X-Forwarded-Encrypted: i=1; AL+hErF26nZvgfR+fmHFZuieb5WRRIRqyS4PhNiZK3z9axhwp9pzX8ACa21MHv20wURxwPQAmCC/+nLfgI3O@vger.kernel.org
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr11453321eec.16.1794870450465;
        Mon, 16 Nov 2026 15:07:30 -0800 (PST)
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr11453300eec.16.1794870449743;
        Mon, 16 Nov 2026 15:07:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e031f3e5sm4677314eec.12.2026.11.16.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:29 -0800 (PST)
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
Subject: Re: [PATCH v4 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 16 Nov 2026 15:07:27 -0800
Message-ID: <20261116230727.1490184-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-6-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-6-florian.fainelli@broadcom.com>
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

On Thu, 29 Oct 2026 14:25:12 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> The AHCI controller on BCM958625HR fails with the dma-coherent property
> inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
> FIS command, subsequent engine resets fail, and the disk is not detected.
> 
> AHCI allocates its command tables and received-FIS buffers with the DMA
> API. Declaring the controller coherent bypasses the cache handling that
> these buffers require on this board. Removing the property restores
> hard disk detection and operation, as confirmed with a diagnostic DTB
> that changed only this property.
> 
> Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.
> 
> Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
