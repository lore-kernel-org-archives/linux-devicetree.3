Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9803C2E1F0E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199869; cv=none; b=EHeRn1uia22DoyPAQXaELxp7V9U/jHyEbokT+mApxPHnvfSkty1UUz8r7n8GyZC1wQSvt3sChV1KKa1QHeaBTRHd1Ta96VlhA3Bevgyjyx7edQ6htg9qySKu+EjtwDyqdVMoEmmzjNi9Z5xcnK8zx8hMkEx+n5jhAtAJEeS7UkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199869; c=relaxed/simple;
	bh=TLkRZA3JuuPX07AMWLzAA/Lk8SLkA24CMGDMP7I7j68=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=upLqwsGm42+50GJBx671ECn2328MYiTchCbcXVBETteKo3pfr+QhR4p0Xt7Bdq4vIY7tmUfDiW67oPrUCDWKcQWJEsY6OSaVh4EPtfmMGSLrppoxvGgSmoc5bofHJ21PM7PkNTRW82v1YNUe6d8Hpw+FS48DVbYs5sHZrrdmbuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZUzA1243; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZUzA1243"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so81846a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199867; x=1788804667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFcVUeZvoh/RAPEBADc2aDhb1dFXKQ/OHpInFaT5ih8=;
        b=ZUzA1243nHkT95cS6ODSQkln9ncxcrLdjKpbZW/CfLOrhQI3SBBEMddGJuFn6oWLC3
         B5HjZbZseXaPuioyBg2IDmqGXZFvZBNpO7hLudPDY+ytcQnyvCchD5rwz2F2KSmkX0Nq
         T0n2Fk09HGQGa8FoK2sxhEycao6wwyzxS//q719EtFJk47Tqr5rcunvlyJ1intZK2PAD
         1+mSFqLxxRl1mz7zASS8uGUZTVZk1/3GCyvSr9wfouD2FnabPXzLBn7pWWIPX70vy8jQ
         ec2Tga7kviG4qzev6b3gouO8KrQDCEPxgqEzGCESxao1vzMfMXa0Zcy2ApN0lTpLGzok
         MGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199867; x=1788804667;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFcVUeZvoh/RAPEBADc2aDhb1dFXKQ/OHpInFaT5ih8=;
        b=dxVPoAvr99w6P0pVx/ZfTgL8HB50RwAorM2zFbyf0zocpA2pl/EJrMeKUd9TegJWtD
         4zdXaKj4uETuXrNBS+09gh2J0WR1LH/TBT8UqSm4gxr9pBjgUZIx+dg3Rdgtah8x4xbj
         scX1urRxwEDjEEIJDPhd9uPndoKzjxKPLt+69EbyopNnu4+mpQZbCQ5PqeVPMRHl0RIC
         spgCL2AGvcck1M6+x8uaQx0wk57HHEbOp4TeWmier7c3AqedzHZZpsCckaQ5hHcNBbHL
         LfUuCd7rMEkQTklb4t86Qwjx3CVKzNas22+2gLufHvCxqD5K9kF0V9Sqp1QRTK5U9WPk
         i/SQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB+BkL/hf7cCZaE4SCUMThThYq9cKGEhioW8tB869G7areFGhxyvWzqcVgoBladmCkvkQsIwzbFAsz@vger.kernel.org
X-Gm-Message-State: AFuF++npxcZe/43y01YQlJYzKVd5D1dC6t4CY7+tMO+cuLo4Yc4pP9Ji
	0TLrvtb3JXxqe4EU3u/G1y542dQK1JfzUHYhYgIHHqVFLx4XUJPs+cgNdvEdBhNidsk=
X-Gm-Gg: AYBFou1GHCSQ+TC764gX4D5ud/Ega1tznA3hfDhbZ/2yhnAPctrQqL9SRLoKoQgjGDv
	bdShtXsAQafwP/AHbX+ZSo2Pf4QwovBYltcSgho2DbmUWa2eNdrj1UHDykKmIhqER9SycMQNjGD
	sfSCdtK9pLhGEiGHm79VffARXwZszKkKh1C6gDEC/Iki6hVyeCLR9D1WEZ/hcbUoVKrEI98CwJG
	OErZmLInVznewRHc1EdrGPV3maj8fJIMWQvK21NFZxmxWFSJOlmYfmjP9x/CYrOACwZwTBUBD5U
	IwXBSIBCAsAoOOat2CGJfHZPmSFDMXaSTflyhvb+SOmCN9OX1heAL5q/B+cOShnTob1rtiiKU4+
	al6t1CT76vSuhBTxQhuKWVW/RwJkmAF5Sdy+VdIY7mKixng3/lXB443p1MPyiwffen7BLWK+XS/
	y7zTnz2eYtcbECuI/iLDYRyQAywVE1VrJNUbxLtuhJOLPTmxZ/9GohKnXyYQ==
X-Received: by 2002:a17:90b:388e:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396d0eaabfamr38282859a91.1.1788199866927;
        Mon, 31 Aug 2026 11:11:06 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d4ede7csm757637a91.13.2026.08.31.11.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:06 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101815.341184-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101815.341184-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: Correct indentation
Message-Id: <178819986613.2869653.4587463597728573985.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:06 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 06 Jul 2026 12:18:16 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: ti: omap: Correct indentation
      (no commit info)

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

