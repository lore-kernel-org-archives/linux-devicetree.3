Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80EF44E038
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625930; cv=none; b=InsYQiKC18aIxp2kPOFH8zO80xLVr5jjJOWQ2JjdbwwllqhOGnIeg7335QaP06G1x7uTyGjlPonWbfFj25C9YzOhzQc/YUOjFeOyMk/sc0LUZEnpc6614JR3BED7R7o2eFsuX1w4SjgUCGPzydXbPCGzw8mf9cAdXlUMvhvrHQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625930; c=relaxed/simple;
	bh=5BmfNz31elL33W+DFqbZwIg2spmNt9o818h6vIAVZKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXCB3E25ghOIGLk6XojTy8+bvXCrxb8ZXX++EuKAy4I19QbvCU7zYZcr/C9FaBu33oDpl4okMaEGTE7QFvNATuwXIKTcviBK1HuwVLfzENX+WJ6x5KdV11i2uML/kyr7oWORnwonxZQSMUzBcawipcLwJxKIsAPKb8BJTjN1dSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCa92KX9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCa92KX9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8434840cea8so2901265b3a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625929; x=1782230729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut8DH62cXwFUGIFCmNmiDVzf/3BRt6aDfnSwnTkGX00=;
        b=GCa92KX9dgx+KMFa5WLUTiq8Me6dfhZ9kDbmVlOCt7FgxYS9IYxg6qPgxyHtSyuhQo
         zTbodRO/puG1F9LeHgNV04k2FbDO4qxzjIsQdkq678d/QrlipLQv0hj3aqIjC8BeUaLr
         pMCW9LtxL+3n23Gps9zNR3KnVOmjzetTaC6wxriDwZplVhYLviM1g0wszfyzxLEPCUaX
         ci6j34ZDpH8aXKcIlCDfNNIE9HlrEJvlVS41aipdgWa5atsWhASD50f9Qv0/Tx6Hqqn8
         NjLIaG8wnJ48pfVyx5goJS0pktV5rODbCKUZYZM/WfSR77hbQHhVQJC6svi7+8ZX/Sr+
         JJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625929; x=1782230729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ut8DH62cXwFUGIFCmNmiDVzf/3BRt6aDfnSwnTkGX00=;
        b=Tt2f2zXMfyZ5/WJpLWYXvOPTiS3LXFvXqPgTBJMHxwwhYReBxQdmDC3mydaQTVCTV6
         NF8r755SyoeSWuFyywPU/HCVjJ0UU1e02OjEja17BndwtssgcQaQsiZGuBZ897P0ghYV
         0JSkdR8TIlf14p1uc4uoQaBq8tbsQCPoZBGrBJX6pNm7+QpOLgZv4lckb1o+yDBb35Si
         Kz0z7AzvPa4oSRUE5ZOeeVdrBS6uU0DlEkY1eKNsEiytdY1gfYXUj9cNOOFsTDDdSHMW
         8XcfnreGtJ5ZmFzkVi2js6fW1UjVRSQY486vXRxz7z1PK7uRg6wmRmH54amZZ678JL3s
         dESQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KpiQucx2Rx0sRJ6C+gPe3DKrZDLWNc2IrqNhMkym9JAMtydD4z4jvYZINiQtDvHcblTCsJZwY5OnG@vger.kernel.org
X-Gm-Message-State: AOJu0YxwpnzbR+DlChZ0+z2a7Ff8UTipsk2vuabb/8AMzVOogc8aI7go
	DNtgQWRZjvjXpM2s0Msf5YMhqk39VehhCh4JiSGurIUi8kV/hP5rs2ag
X-Gm-Gg: Acq92OE4xwcKugHLUStVYhsCH4yQMaQ55e0VcNC7tDtNfApxVx1vKXLIOdByaB3l8Tq
	ztp8NjDcSN0ArU7SvaKPboVtP7AUEEOMlv+z6Qv3xvt2xEcAfdbxxJjHHQM2yMoizuhE+DGBnRE
	puwSjB0VVIMefKLNui5VajjoKC9iYZw/VyJDk5h79gmrwaRq7gHEAcRxfznwCYVJCET9MqPe/Su
	jtzVvx8yRNrjmiP6qY6RADy9NlVIwMyp4iCF/K2S0+5RcimegevNOAif9EmgnbuF8KZ/hPq3DXy
	rooIqx/9uMd+EgkbC6OFNc55HgpaFyDzUZmt0wjkrDnSG3UhC9TrsK2nPmc62r6Dcnuaz/eZ5Mx
	vU8SJBWmqss6cEsdI5YrEUwuYXH/6Yq2sZM/ZVFEdblOVeWbu3qm0sC3F80+paTWLTqyazzVJ14
	2V3xkndGvln8ypVhdbEK0FaBVpkKDRHteiz1bT
X-Received: by 2002:a05:6a00:c83:b0:842:6004:3fd5 with SMTP id d2e1a72fcca58-845154f58d3mr4332436b3a.25.1781625929241;
        Tue, 16 Jun 2026 09:05:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm13513779b3a.50.2026.06.16.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:05:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:05:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v4 3/3] hwmon: Add documentation for SQ24860
Message-ID: <c011e1b9-3496-4be0-9f82-65c918b776fb@roeck-us.net>
References: <20260612030304.5165-1-zmzhu0630@163.com>
 <20260612030304.5165-4-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612030304.5165-4-zmzhu0630@163.com>

On Fri, Jun 12, 2026 at 11:03:04AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Document the supported sysfs attributes for the Silergy SQ24860 PMBus
> hwmon driver.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Applied to hwmon-next.

Thanks,
Guenter
