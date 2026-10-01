Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42C40EB9C
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870933; cv=none; b=CmTGQibSPOiBWxOqkRD5wGdLDMJGx91sHXkSBGCXRi6BVr8NLWPzRdzoCdTLoF9YJhV+yvoaAsS32xGGmDImWgLTDoPUAktFVTcRDNidlPwgz8Y+sSJ7X5dbAr/+qWLgtWnSjR1GyAnPbyt8/YB5EGAcHqNPlavghuCNOK2JSDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870933; c=relaxed/simple;
	bh=km+eyEF9ejWZCj63DVMQwjL7mTG62fzWukGv9EvlEqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoQEHsuWNR2GEExnJiP8rV1g4sFmdz/pS3MJeW1dEmwhw1rHlThBfG6UhkR7LnM5B3IyTZaQ1eMwJ+IEabFUvzE8O277YTUa18tuJzzI/tatVdiPasMVZeVuv1h1VkJ3vC9i7xxJW18mOe/fsQpQ29TGfFingNh9srdJB0qqLJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bmpsblx5; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bmpsblx5"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so2122806e0c.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870931; x=1791475731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Otf9/knLO98bfm0267xs+E0698DkiFYH19su1j8Mlag=;
        b=Bmpsblx5D32+gHLu1pzSb+Gzdxr8n7tpxIni0ti0OKuo/U7n5PhIJNLAXHMsKYlSCN
         kq0R4JphsaL6Nzlh7j2NcYfFlw1t5CKrD4RHjAY0P8At9nYhE34aUOI4y/24ssVEkZ2G
         12mF9gvV/78VV6PZ4BU3vHQ1CIZrURoXaCq1h2ziIsFwbfydPh4E7JZypz2v/2GxKyjA
         t4jxjt6JMZJve4ZejUHthPy+K6tEAFmHE6ROs2jLVGrQ0P8xYe9FH0vSmCwWf97rQ9ol
         e2c8xY99Vq/Yj4yVNMUxK4U9CNtzbBsb9gJqg84a+DYdmjcNXTa89xrMoe4yVZDmzt3H
         PrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870931; x=1791475731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Otf9/knLO98bfm0267xs+E0698DkiFYH19su1j8Mlag=;
        b=ZxbBIXzNjL9Ddy8SXt5+6M8wk6Su7Sm/2Mu2uWMbqn4FHAJPkUNscc5chxlbtMyRd7
         dFn8SmrYrEg21TP/BIPefPrHVksZkW0gkEY4TPrdqG3BGXAjiT05raoCBI8AbL+Sxl+k
         MJTQQC+NkFLg0qbKwWxXCJAUprpMG1KIXjmrM5PdZK1kqJe2WtUvdu8xsKFf+fCkSSzG
         L9WpnRzY44tvar9PZbOe2Y7sRsK+TGsSuo7mbdA3B+ellNs/SpHzkU0ryuDsB4INX+CJ
         HuYunXiEVlaSo2emboqPYRQxUtgd8m30uMIof9RLzWaJ1z8KrB4RmKq2faOMQs3WsDUE
         0ytQ==
X-Gm-Message-State: AFq9FYIAxTObH8U5OwiHqp4+hWpC6nSSHN0MtBci6ocgL4KFMTsdRP7+
	Ofo7tfurOZVikwURlqPiUQmThcvOx+Jyi/OPupMLotygUPux5UQfRTTdwbScBtOlSFs=
X-Gm-Gg: AYBFou2xpElO52zm3VAXEV/gG3hhLTif/ECmaGd4Dl1y2VdE8NQ7BXgTVcpzo5ylwHg
	g9YyHMKoQIFiDOVPhjhSuPVHnw5hUa4uRksGVaCQtTUZYgIHYT8uzrwtMgsgY4eKmOs216nvyrE
	MvWgCWMbLVROjx2ZO8IgwfmFxOaf9l0ER6oQ0yCDnsG5GutwlwCEqjVBgmL+7OQupQSeYYfLE8o
	Y81yQD4VmTg1QapuH4mF5bNHOQO9JmKPB+NpXQ8X6713mK7lIjiuTlKxwqLuecRhNs0cdnRrdk/
	C4tv+rvjVCUDFtjKNTHKAjwnnS5buz+8erlXyTKGuhXKrsqJuAFNQ+PFlMryK3TkS89M1N1OVNA
	wj+ilO1l8EdE/9NoPyKIf4EjT+LV+b0WnnjxfopLhC8IE/m5MRVgpwmdKl4PpFn/PEXQq+SWPYz
	mbDad/diQf7WNjQFc3YUtU2qeEj/Ijvc/92cgVJQMN6DEyPn2feIj9RksgxSSBv9vxlStUNBJ0z
	WUKerCuI90qOaWylO1ccsJ4AaRWdrLP
X-Received: by 2002:a05:6122:551:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5d67c10673fmr1731771e0c.14.1790870930920;
        Thu, 01 Oct 2026 09:08:50 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61f8fedesm170893e0c.9.2026.10.01.09.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:08:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:08:44 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Message-ID: <ar6E4bQAKonCW3st@hiagonb>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001151447.12076-1-andrey.lalaev@gmail.com>

Hi Andrei,

On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
> Hi Hiago,
> 
> Please take a look at the patch [1] and the discussion.

Thanks for letting me know, I missed this patch. Do you happen to know
if any overlay was sent? I was not able to find one.

If none was sent, I am happy to send one. Sorry for all the noise here.

> 
> Thank you!
> 
> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> 
> Best regards,
> Andrei Lalaev

Best regards,
-- 
Hiago
