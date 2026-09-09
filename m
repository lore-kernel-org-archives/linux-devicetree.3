Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E243058FD2B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986586; cv=none; b=XafCeDndHTdQb5YbnYuih0//Wj5GKJG/O4Bm+h1VALvT0RRbhkepY/pFprLC4lXT8Xev1VwlBrGH7TRRzxse+zYakowlo7Kw2kgQrQmvjJOtttlOY22wRMKNOY3glW3dqsabk6Z8hv8WfafCyOLSFKJJPGboyHoxzhXCN3wLU9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986586; c=relaxed/simple;
	bh=E7DWEF6kIazrc+lVVClekzdOah7P641Dc3PJ2nRN9Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U65i5cmSBt2s0CZU9GdrbbvOv+WvahsArui4UN/7mesOesQzVcJFeMxMi6/THSJA0jWFVApEe3XncbiZXuzg2wqRh/jzzJ/B/kLnAVEe+SMQzMbh3j4cKaP+61ZOeNSw5sBVIxchZ1VobUbhnMTYOsex6YuOyNZxduStj9kvDNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzutj+q1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzutj+q1"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso8135092a91.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986569; x=1789591369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=bzutj+q1Fppr+Gt9UeN9vABv3gUmz1FwFsm//AkzqFB/cJoa5l/wuPpFwLHMwc+Wib
         nDgppEui6tU5k3BWZfuv60DElJ+ybZaXpmcQUV7Ja89RhWUqhFIBm9C5CPeFUPD/aTvh
         P+ocq3ccwaPJ77XXCx3Gwm74BHkgd+iQReOKa+5FOItmOE/WaOsRXLHyVy/C0yfmk5BM
         8yJEzdpi9Okz0ydZYilSs2cbv6Gnguaxw72tzxF48pcu/Chua1Cas4kqqjbSTzRLzjIq
         DmNUJmDrURL75lZA0VeWNmLmUWPAumCwZuslZjpTWgVmjlUNwt2axVVAO/ZQG9KFBseo
         NOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986569; x=1789591369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=WMkbbp0+6CmwptrNDgl6xD6DBFrLeFx6Wq2AKANNW+Akgp7e/fvTDGDyh5SBwZ98jH
         0v5gyuEL/7zZfXX+IbZvR8zplDtRBVyXWpFk/fCqNOYUDJbTOUb9JSLTV7TEATJQdQoB
         b4gY4ICTkg8wEwicIl4iWu5rJwY9GNw5fAF8eIa3FOT64QmYLkbUemS47b9vKumEqnuL
         Kp3dtFTJbccY1U+OBovkKEjGgZPzGS8WcRRaM1cDoo/0Tn+UVSc2eR1AUj8JcRtdglec
         zp8bqHVCjBB5ItTSLIoH8Gb/vC+qkaFLHic759EkfGbbYLQDgG9MOs5jj6d5Y0qyZa9K
         /pNA==
X-Forwarded-Encrypted: i=1; AKwUvByTGvz31s3JKa8x9/RTYZRH5fUa/p6s5stUJlnnm829N324VDzOQVozLV1vKX/54GEJ3E++3jwo9TrV@vger.kernel.org
X-Gm-Message-State: AFuF++lR5n5xfpC9xZoCBSFA0qyACT+lFj3ejDx5qB6Jzik1Mr8qfpYj
	bBMlo0vhj09UQse9xkr1vmls7tR8zNRpqTRqILEjkQv3dE17wPuPTrQ9
X-Gm-Gg: AYBFou0Y1BP6bjAH6A6huxYKmhI4y+U0ml6VtWsvSHQ/wheVPOewmFk1mY0KYIzsyXZ
	kMVt5bTSmhDyPPpm8pJ+ftAYQP/xZ4xbH8Xft90XMlu2Ex2IvNl+oUe2TWFm8JddlUWzHaIFdXZ
	TZuBrdvUYCUWGJDyOK8IN/R5+WEoOI7BsGMQ1HuZHl7ro00fA9ygWgjgf6xN4XOhyVe5/lObGo4
	BCxNqxE6W/LNoZpeT7JyUuFSnzWiCv1Jyz9c6GQ2oXSIDm77WvUth2sKXXtfvUEZ8o9wwmUWOHd
	Q6BAlzht3bXC29KWNB/L220KdXBbtiHCh/2bYVstlBid1Iwc5ATSq2eWtkDRwnu8b34sxryygMo
	H8EmWtGv/FqWXI8lN9JJtdDCVtnfZgTG5/jzrZn7q7PvrpCUa9f2d9tfD6kni3B6I0Hp42eayqp
	Lqpxox2ir1s3o64RewJUKWT4LyOlVk8d+ZjTUYpKb/91vDVJNCn4gdXG8ZnZOw4cOhpRZ8Y88rf
	gWf6iTt7GHG
X-Received: by 2002:a17:90b:2f46:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39b260de5c6mr59642710a91.2.1788986569020;
        Wed, 09 Sep 2026 13:42:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d774197c4sm1220340a91.8.2026.09.09.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:42:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:42:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <6a212071-3b1a-4dcd-8d9c-8df6352813b9@roeck-us.net>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>

On Wed, Sep 09, 2026 at 09:38:00PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter
