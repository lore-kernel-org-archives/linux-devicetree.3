Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422D46F495
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699029; cv=none; b=AMlkN3lgSFs1RHiP9hUJtb2tgeY5QlYz2OxQ02B8Sdvri06lMlpkG+WACARkbJEKjZvj7AHjjilzZeBA0iEorraDWQtiCRRgW6xzcG3pUHVRpKfSWm3ohi36/FW+Ua3MqEG5C19Znp1gm7RyF78kdkwGU55XraDnPXxfnxeWltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699029; c=relaxed/simple;
	bh=evkrn0j75RReglnxUhvOP3feEazxnHrK2bSv7U5QRhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XVDs7FyEuCbNvGoImFEyPgtsMvCOi2SZpj6Gp/2sjFSYQQn/Y8cnYVJVq+F6stWBlNTypRTvSdJ8LyWXFvsLl+kpHw/zy+moLc4IkdqqcCzMmJzI2b0Jwxs5KzHxtOAW7lxFpzKvy18HLMY3jEOg9Zz6AZ41zM8FbTbrHpueyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J99PSgV7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+TEKgmS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J99PSgV7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+TEKgmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790699026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2GK2VSdmDafmmBxGyGfx0WplyaoJRc/Tp0fAq4VgQg=;
	b=J99PSgV7Q878wrKer7KDBkHHwPMSkZH331HefYF2Su/AUtT/K2OoLCg7dnrBHpBtKi0/6I
	pkoWodM4/KOJ7G7Yefzr3CpLOGIqtMF8ByH8njbcJc19sHnBIHFvrdOlDrqMusTj2OBh3o
	xCd+cnuTyJzrBRmDEp8IcHb+rMr/ul4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-zIueR-dtOFOLEAidgL4DcA-1; Tue, 29 Sep 2026 12:23:45 -0400
X-MC-Unique: zIueR-dtOFOLEAidgL4DcA-1
X-Mimecast-MFC-AGG-ID: zIueR-dtOFOLEAidgL4DcA_1790699025
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-914447243f4so48620586d6.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790699025; x=1791303825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2GK2VSdmDafmmBxGyGfx0WplyaoJRc/Tp0fAq4VgQg=;
        b=T+TEKgmSncgG98x7Z04d/W3CmDEEsYrt9XiPfQ04QAB4J5b9C8LLesAkuA1olyE9UH
         Fo7z0hmh/9h7Kg/GWewx3u5sulBhbyRkn2zfF/ZdC8wrzyS4e2mB9WOHo2JY89lAfkIy
         WOyKjjygY8ufPxTIBRClSnOajnJGPow4tS7RBxddfDqwrBS+pS+wiI7YFFkDobftKQ1T
         9gaGkPVH4oZQIe2PvMESDn9ZQ+xoukM+Brzfs4K00KjsqvunO8PwKwAMExNCjCDIX2Pm
         T5unVkOibDQwxgc21TG9HVP1+wIKsFZPRK5I3oMG1OvZJnTxh9ZLVxS9v39dTMUxNS79
         4Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699025; x=1791303825;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2GK2VSdmDafmmBxGyGfx0WplyaoJRc/Tp0fAq4VgQg=;
        b=V+ewnG6XkMl5bjDBOrUxK1gE/XpEY7dbwsBX9NxFoAEoeHW16pS52dmyArxSFECPfX
         4Uxu43wcNZPwQg9tydOq7nslFMEbCLo/DtBUa+c+tqAemX/uAtQw5dQjp+bONKPf7Cys
         aCxW6FVTknzgDsaNftrYHdzuBkWAOopI9hGIkZJ654uiB3FMC8OCUadu25M3vPVfRDBA
         70SgRrLf+IFi+PvhUyhiy/1pqD0k7Il+A6IIGCRmsCBXO3AfeRzjZT5DkRHv4ru4CcGI
         9UuwdIvRi09ljATlyCx9mU2w3V0vhqhLbrmDQaWkZklRfLHPntxONlZKa5zxK6PvWFBN
         ll+Q==
X-Forwarded-Encrypted: i=1; AKwUvBweVcjpITUXd4cb8l1C/7NESvCwCs+704c77nTC34VU9UOGYUONelrP9NFkYuWO3Wl5RSrd1+rmHzH4@vger.kernel.org
X-Gm-Message-State: AFuF++nsjhcVX/d4wnlyraVIzg0IHEcbnBmrwxApDmaVA3c4ESsf64uv
	xJZEFLFAGBSsXCqWlzJ1ByUcCujYm69Qq/GTtQo5UH+hJY4dWvbatOwQZ0/uY4H22p9ruW2usqM
	9fD6uRRfDCYoUNi54i525NtrMX4dFSsU2WnJ90WCB2YGBXc931S/QoYqpr9aoPR8=
X-Gm-Gg: AYBFou1xUYzymNZiPZW21tNVgH+KFrmiP05/htvp0i3m+tMwugV/KAE8Rh+tLfnCjos
	hKfyIaEoMOPun+4tGPNXnzR5TY5q6jKNmRZkAlGmcZoJRXVbBJhiqUs27HswZfYIoTJAjJMhC9L
	GLk6tlDtLQe8+0yMKKOI8OrM9+fV0MPHOhrxyQ8woEd/vR48GhHKPX6F3i1pZyLLsOq7rbQ+Fel
	LqJN1J+rFe5HG7KoLH7gDUDmlRDdkSZYKQiz45A6LxLJm8JxJYV5BQkl9Xrhr++SB0mron5hpME
	H0zIlkXbbe31MhkE6RXq3FwkKjHU7YpQ3mDBaLYws0Pw/qFv5hoPmms5KJ/GBvSh9HtBoccuYSV
	cX3vhI89m5Ug35Y5VJXSiw0v81Y20eFRftzbTNjwJ/p6XmHq9uD8=
X-Received: by 2002:a05:6214:23ce:b0:917:8964:74c with SMTP id 6a1803df08f44-91789640eb4mr45316396d6.20.1790699024784;
        Tue, 29 Sep 2026 09:23:44 -0700 (PDT)
X-Received: by 2002:a05:6214:23ce:b0:917:8964:74c with SMTP id 6a1803df08f44-91789640eb4mr45315646d6.20.1790699024126;
        Tue, 29 Sep 2026 09:23:44 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d3726b6sm13632146d6.39.2026.09.29.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:23:42 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260719141236.3563471-1-egbostina@gmail.com>
References: <20260719141236.3563471-1-egbostina@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Convert TI Palmas Clock to DT
 schema
Message-Id: <179069900262.199845.14288580116711428199.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:23:22 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=318; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oHn58vqKcd/4D+xRhJXn7ToD1HJyCAscD2yUqTDYu2E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2P2M7sOXJ6yzTF0sX3N6tPmWDfeeUp4klMsGZvGdZ8
 44XcaoFdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRyn2MDHsWMjFZ+n+6dlJ8
 2Uzmf1KFhbY7AtKbX785O+He+YqudRIM//0NIsQvZ7bUmJw6oys6+U2UWfXkrm8lF7u3lMyKOt5
 8igEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 19 Jul 2026 14:12:36 +0000, Eduard Bostina wrote:
> dt-bindings: clock: Convert TI Palmas Clock to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: Convert TI Palmas Clock to DT schema
      commit: e44caef8848790e3515c7c32bd3460e948613092

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

