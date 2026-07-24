Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9675427F99
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911918; cv=none; b=XIVe7CI0QsbG4hiq/ylllQOMJHP7NtGtVy3WxNckcTpKlkaCgiI4hdWbtBhvWVh7/arsNM8TeeE/dF4UF1BizzDlo77MvXF6umW1KaM9GjbNnHVRdom0pAw3nvlgeEnzYjtRmT8atFj1H9FzmxYxy6AQxZHg6MEV4ZAJovwyUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911918; c=relaxed/simple;
	bh=t8Ji/sVdLJdsE072Vnuy/Ml12Q6VvXWCvIgrXAbVoaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8VbhD8Dh5yHID6NYrjT7d9SHqfjOQh1q+tSESsq422eU4btpLkFjDvO3YTnXGlOehzX3O4p/w6pAidFMihx13blBSj33OjkyWY8u/XaQWyDydqxzxfldSyvmQ9611TFPhcMEUA4MO1m/z0DK5ZKOA7kor9wd3pSb5gFcsdnSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCU2ThHw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCU2ThHw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so580505b3a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911916; x=1785516716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1C/GoAkmFNMbDtN6SIF9YJ0GbcDsRXjGUvhLK0CpR3I=;
        b=oCU2ThHwYL/MkTUbAn6KHIkbjPvEClzn2q+6b5rondZn90LD5tLrml8dFyPVl4TcPG
         HG+jGN/fFyztDOtiEzMSHYtiKyosax43c7b5qwPFiuTg4bh5wMYgrE+rmcZXPl/6+ijy
         qjsLC3g1xoRKz8xm2rwb8QJyZbNc5YpGxrOZmwjutnahPvFaThWPv4eQnesPeLvcYQAz
         /bQsUeKs4Vrrfio8qHgq8xKN+l4cZ7fM8z+huwg8MxA3sKhZx23qC8ao5/aKsLodyJHz
         02mYSy5bTZIrAYoxAWMKhbAvXTo57a/dTl2YgylY/gouoOfo0tIf9L9L53MVPgfBuXYn
         vZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911916; x=1785516716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C/GoAkmFNMbDtN6SIF9YJ0GbcDsRXjGUvhLK0CpR3I=;
        b=JmnN8dkQChI768vBLsnx2pjl3i6aq6JxHtRWukr3QcURQy28Y6lB9MC4XAHdVL9WP8
         NBrqkf97dNFfmDDtCeHi6gFDzbzXc4C2exF5VAtobgmELb+NY7+yyB90DBjL+ykj7/8g
         Kem+trnmnFULqR7hOvF7XQGkQV7IXndYfY+9ioWOozlAdVg+yxgYSqSCkGapDRyqD/V6
         UfEXSWewElcpj8VR5AHXFFFrBabdQSWWsqp3sKvtl8U9TsJcB2t2QzmPtcL91xg4jijk
         cfDjv4K1onOyLqC078xm7VEwT3NTrJ125EHj5sPzNs6QXELdlIsr5mDrjXzv3MtXvygr
         MwJA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb2+gcVZYATBRTGlImHVfmq6KYx5Pt9bYuoQcnAUwzZcKKKntI2epwpM03/EW6VG0I+T9xNHbQIdww@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuZWxI+2RQlBhb7qPAq+mbToSOxQBFnXhmaY0rvIGIb+G8zwt
	WOdEzwak6kO4mDw9CiUtUA36mqVm1+8+33dFVC6OFqwcOpQlpPM/YI1E
X-Gm-Gg: AR+sD13OhQq+DqKr/wTMYsFjUUWJXImQXI4xWNUkM/ry/bHFJ9D0M9nxO6I5W06EbUT
	zZtnDvHtkCDj7pzKn13MhxvH9CcndrAC7WiriPaO8KGvMYolg5tb9fYw5/+Q6KcLpPoVPP4nDyv
	rFEVE9CQ0Yg/lpBGfdVLS/pZ7UpqxcegB/LeeieiBKMfwUwNd2cFpWhkWu6jzvfRzSbuUtpI4D1
	etIOk8JTauXOpQ6nfOsyWRxTwpNbYYw5eGOxj3LhmF8EfbPkfqOaxNdCfashApraRgZeAWgnp57
	v76vNGMq/esXfeRsvMNJzuQWfcC84Rbpm8S1MlzO3SX5Kzq/Wzyi6iGN5w615E07tlPC9IFlipx
	0rZZsOJC4Czm4roser4DSvjFb3lHrSOAq1KhD7U/pwGw6cGxdGpEKM96wHkaLFurGxMVNZUAQC+
	1+zWuDwei1WiSYeDw=
X-Received: by 2002:a05:6a00:b93:b0:848:2f84:f426 with SMTP id d2e1a72fcca58-84e2bbfc88dmr8648923b3a.63.1784911916103;
        Fri, 24 Jul 2026 09:51:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341e69esm165061b3a.43.2026.07.24.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:51:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 09:51:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Message-ID: <2b71e6e3-d831-4d56-92c6-a4de72d7a3a3@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:40PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
> driver.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

(waiting for DT patch review)

Thanks,
Guenter
