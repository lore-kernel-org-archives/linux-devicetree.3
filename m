Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627115;
	b=OCajwZ6tZS7AfK6zCGx68MK0FyxW3qqHhUqrYcqG6c5YNv1EOlEufxOQc79sZahTRY8C
	 4Kf+sVb7euy1YNog0lodKZUBL5NQbM5Rgahy0/Mzm0+0k8BxxGje/gZ71CLqnFPKj2ZRd
	 WL6D/495QxNnp206z1m2xXRDcVrTCYcSQI6eo2/XsH+mMwJzo2mE68F5waCTwWZTOQyy6
	 5q0olXAfvflYDO+7YEE3D4WxPEIQHscRKoIHKzfD94BYC/9AZrr1XvABslYFO2Tk0Lpk4
	 9yibm3e9QzVSPzZv8872gsqCkeEKQN10jo8+Cu1bjad2dlVKsmVJPm5ZSxbHLbUyy5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627115;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
	b=DTgYImbSEWuUz6oWL3ZqXTF43jeARGdKki7hKxZeT5ppkSRExhUtNosx081BWWfiD5Fn
	 uhkrZCHXikM/SJNh5No49IuCiy4M0HiZF0qCnz2fiS9CVkMQE19m+u0eIqZWKgtRCLI66
	 zjTy08M9JZ2N21gQrxcZMLXic1zYB6GLNPbCImV+bFF42unLp0FxMTnB1NUzH6vDSScf2
	 o/2usK1Wy2MFrCdIqdUaFNEoEM4RgDUY3zTOMkngEMVDEaxNuWmCViSz5phma1GQ9zxsO
	 UeRzF7J5Cv2XCViDbC4viJU29tTVHm52xncUiGOqMNxkLdsvXe4WXKHWD+xNZYSi6Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="LSO4/5uQ";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBA1606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFBA1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LSO4/5uQ
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2285223a91.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627110; x=1795231910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
        b=0UtIu0D70atIBbAw5XSze/Rb0I7PrwJtqMIK1sUBih+RWqSYqd+v95AadtlNVd7a1R
         Z60HmHoqxEK6CyZno/KMjeGMcNdfswnRLrUslELjbqk5+1Y4yxFpgVeOdCJDNzJSeGkx
         zRGISv0USPgIplP1Sso26JoNbX2lno0vW/5xZ97fJNXY8+L2pmGHiegY6UCr6ZJ3A/Sp
         t4TbGvKTDXK+eY+9o2nnYb2P7qe0zuqU1Y0wTxa4jptZnnTblTFD065OEo8QNCYXrY+G
         KzHaeiZ6z66sQEqGIelMyq6UmocBthrhuHTWhVhk3qpoJVnoCTy/G/CrbMohYwVDhxZ+
         LsrQ==
X-Forwarded-Encrypted: i=1; AL+hErF8bVIxxiwohjYy6TDv17MuuivjXiEmvnedFMkU16IMLwOdsCzi4wkbkwoG0kFbfbiVS8FguFsi7l62@vger.kernel.org
X-Gm-Message-State: APuU4Z9ICKZXO39PP7qzxqjUC9ajeb5otMbLKQ9knCvYBUMxbFULa9ch
	6TfuQnU24sUvTRHwot6p8/jXs5TFdtexSRM5Tqvsuo7XiUZ8MsXeh78lzEqe18rTz+CwL4fpkPb
	HFtlMfaFnqeOxBzzk2JHrn2UEvXju3qYToh+07gLdS+2F777m5sktnoOaCa0YwPeHaofiNqeo25
	ATgHHt4yO8KlwdYEn058WKZXEz7rNc7JtPPW67gJEXBnxzY8xY7nwGGCgph6tWSu1mL11MET/YF
	GR4aQfCGpn6BybrQOoenQ==
X-Gm-Gg: AYBFou23nJYuX50ATJPz6AThAmn0C6FNie5+V/w15iwNftdeUE6vjnJGnhJElUKMaTL
	OLEhhJuU9K8ALSZ7cgheAokADVCk4803sfhrYlfn/Ppkp/VfiLgD+f8Ahee0cJfDWEbY/OQNXBo
	NoolaMax5r4/isJLuaCGkOyJ3LecPod5ziNUQokXisogvdTQe7U4QkTnoRsdLDs0x/bHZFiZCVR
	9gT3VI68X7mLHmxRFfVWfWDG2Cc8vHJ3opF8E3RgUcMl73y1ruXZ3XCyIX/vytNltqAYqZ05X2B
	M4WB4Lqo6mlh9GOZzvD+0tETANKMkNYGAZpgIigUQs/MrJd7LN98D6rpgGMbY4X5OXQYM/uTeR6
	yOvGqp9S9ykyHktAHM7fg8+XP8SuWrA0uurfwaeS+93pIoNgMsdMLLplHIH0pqNg1stJxVPj9ND
	La2goJM7paWsZV+bIZVWh7FvOfpNz2d6UlMYVdni1r
X-Received: by 2002:a17:90a:f947:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3b1b0b55384mr4407689a91.20.1794627110210;
        Fri, 13 Nov 2026 19:31:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm3086821a91.3.2026.11.13.19.31.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:31:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso26361275ad.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627107; x=1795231907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
        b=LSO4/5uQ5HqCwvED4RQaC4OLT3swfTCH775IXZUSrPX/1T6HYAp/yQXupokaoYVklV
         KED3eYi+TplXAyhsrTtzs1UsMeuxGosVmCvfD9XNUxDW4NoIFX5j6TCNJusR9xOZdVoD
         dyMz6KJQoBX7WZ1t2bIIq88L2ztrRRtczBhmY=
X-Forwarded-Encrypted: i=1; AL+hErFTnu2fN1NJzrQFYdPUJDDoBRecJmt1o5S4GOtFkXx535ZQ5nsvkMRLcBHoUa+nVaYdWBYOy1JIrTUz@vger.kernel.org
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr48907105ad.25.1794627107456;
        Fri, 13 Nov 2026 19:31:47 -0800 (PST)
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr48906795ad.25.1794627107044;
        Fri, 13 Nov 2026 19:31:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b489sm17051065ad.18.2026.11.13.19.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:31:45 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm: dts: broadcom: bcm2835: Add reboot modes to firmware node
Date: Fri, 13 Nov 2026 19:31:43 -0800
Message-ID: <20261114033143.875897-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
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

On Tue, 10 Nov 2026 14:00:15 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
> this mode and normal boot mode to the node.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
