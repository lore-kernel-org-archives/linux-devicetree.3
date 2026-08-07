Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2723D0907
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091843; cv=none; b=OpEa24AX0YrrbXZXZM5zE5PoLMGTDuOZ+3PUALNpm6hvhbNnISsgCp4nrR75uWqD8Qw0Q8SgQ35GQDJSDayAGk/MuC1hBnEKXZu0frDfYe1nfwWl0Ch8tTd/ev+TAHWzOyyEhFZx9YoIs3C762xvtpdxhYkdo3/3Jy9R5W0j0WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091843; c=relaxed/simple;
	bh=fuFEj1OU+QhcCZyLvfuNnHiX6rf0ZBxSPqBHjTqQNjI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PW0V01PQ9VDZ1g1Xx3GcQzzlk1SB6aDbDbc3K4234CYVyrOLVaYZIRpMuNpVaDCCb4cYP7Q2A3YnYmfX7HDURszTA0RUNlg1ctGHZCJQ1W5PdJEtIRTy2AVtxuZ1dTkr0TPgTYTiBB9eJstrxSGunfdRKEd8Cf0ycrNqIf7GrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=TptPmv1C; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="TptPmv1C"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980dc26022so30273595e9.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091838; x=1786696638; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=;
        b=TptPmv1C4KkEXtl2QxRW+JJ73QS3sCexm1chhPBYZCamhTXdAPxLxXYHfMni9GBIqK
         LtbrS1q6+Pcdz7tC7BZEvrO/R5Yimz08XaNiw9Lx8T/lcQ4OZcjqHaGl2kd9Le5Qm6qw
         20TfYlBj62zzDiMsu4TKZ9UI1UpJ0ENTF1sbcjMJelo/ObLGT1uSnxxSGpkWmG2TEP7r
         TNlP1Ah+oV7nwwpD9KsXj3zXBprkG/WJQT6Bo4V++57WXUcxZ9HIqD0HPsC1r4x1PyVZ
         oM/0DA1sXApj8MuSiu0Kj3+SSe2oH75lwCvLNFuApyhYpyHUS7RC7sxke81NOk31wbpQ
         5/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091838; x=1786696638;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=;
        b=l8Ag1mKe1S7BCmbqF2PrrQ7vjpG+UyXWrJq1dmLXeIdyevp3L1kfU/MoT803YxLPMN
         tiUSA+xP7H6OBoPOw5c1kphlxp/92p9cSMCl9pdTxTMgwmQc5i5e0IqgnaHr1zun8ned
         QNpOTXJ5UY1B75u5/tbS/EA7tuCh1YuFZksCaBZ6NsC/xPiSG8hYz0N3AP3idgAPX0iD
         C8mpbffpZubLFFAtEa5GPw6xogr2D9LpqshMGEqC5t4Fz+S3sopgQlh79/Vsqxqdx6iM
         CGE7EhtD0ePx/bfLcE9FFVm0hx2d9A/R3RdksoprR3KxoI84K2z6Pg6/KMcEjvskMO6Y
         ybAg==
X-Forwarded-Encrypted: i=1; AHgh+RpzIDL9fF+rnf1VA/Q1PdJkBl1uOgVS5t6mDk8vqo7mm3hRfppyC9BHsQgLOMJcE5ToydV6yC2ZS26S@vger.kernel.org
X-Gm-Message-State: AOJu0YzcC83jpmos2+YHAHimporucZmkADH+20peraj7o6Kus29WeR/q
	irtsgzcaSP5sQMn0PA9rCal5cbGlMmJW85cVO55KJ/lwBDS7vKSBSsRxi0jO6yf5Sy0=
X-Gm-Gg: AR+sD11OYXLd3Ypw8k7TJVOJug7pcTayTQd6Uj2CPZVzfVXfB7nHAfa0EMlCfraTzdg
	ZHJXBTfBD5NJHxstZuhMoRGFfsdSSWlr2Y45VgrYptVsaRP4DIU7uichiiH2EhM5rHxnUSrpG/g
	pXFngOztg6/zf77qKHrz6gRgTbnZ4ZxYnfLjZ0QznuW9vltO5mqXWiK+xMgqihev5MaQflJyS3L
	SFdDSokj+HlyDUFGLaBzqYYVcHyrRTyKmq2jlNM7/4hc4VqAP19MtxyeRDXaN7ywiKxE3riOB/8
	cpigIIZt7f6Uqno7g8pVRxdliyjL9+agsQNMgCiwOLYNEY/P57auQdmvc+bqbEathwnXGTp588x
	Bt6ANKW9DoHvhbzBRn+f4f156ZWN2ObVjNDAApo0Z7FT/ckfPTNDQG6bN9leTdfruJOOwa4ibop
	7UDe8MVlHM30fNG2lMmK0hme5q1hAX8lZiAVpGkJC1Ak/RaDV6GmnWxCoB3j3WgO1okimtSq4=
X-Received: by 2002:a05:600c:3226:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4994e7ce0dcmr191510415e9.13.1786091838712;
        Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.5571242599516025969.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=355;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=fuFEj1OU+QhcCZyLvfuNnHiX6rf0ZBxSPqBHjTqQNjI=;
 b=l/snFEuA6s9C2vYf6o5nTOQ8zlqd9Il9CufwGf1MkTpOA+4+PTdQ2n5jUh9glDVuzfjCNBQVJ
 WDZc+yLTygNBpO/pif+3n/9h9ZDIVzxwiVZwcXHim3sLopjfT4uTkcv
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On Wed, 05 Aug 2026 14:19:52 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Use the ast2600 compatible string.
> Make it more precise and enable specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>
