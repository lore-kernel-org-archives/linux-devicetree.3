Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3E31A55E
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896421; cv=none; b=Fi/8ZqIsrX1Pps2s3Oic7YoTfiGubGrJ6n9aDOBAcZ3reRUlCim7RbowPDJEr/rXuFT/nEBddBDbtV5ixdyYwvk5UIBYa0+jwxCq4iDitHcmeGPJAFZqCtbkyJHSvf5UqggGlJY/Ojm2caG6a3a+r81y6PSs3W3Sa4ojnX32xsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896421; c=relaxed/simple;
	bh=a1lPUx7YoLnWIcITo7CrGZIQIbKO0UFk/H/zKHK4q4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mouCbrQnsbwJ1sfhCItw4+N3J1yU3/F5X2tUf7DWToOzcX5kPHH2t512Lsh8gdiIOr0JmqzI5h7Qsy8dnU7qYL7zQQqvi+7U3Icwp0tLh/IOH/Pbg2jbPplihfdjgTlxDzJkaicfYtr+T8diY3qWQky+bpMCa6hPbxA+xGSu0NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLIiIwS2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLIiIwS2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e853a56c3fso4994735ad.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896420; x=1792501220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPjCWxUSfRvlJUtSVwuDIbCnah44rNQ2fIrGmDlzw+k=;
        b=aLIiIwS27qUE16gpgFTyBouwBeNMBf5VQcrZbVsdjiq/cHMuelft+8yVl3iMbPhPdN
         RFguWal1CdErndElKT82F5GSN+W7Dk/g6hdqegVgsSh7I8uL/C9PyM9HnQcecfzrfEW0
         aMrJe+AscQk96gDoQ3WypEssTg/OtFrfU6p8SMuvhoH4ybs6u2SZVlDeW6+nUAkv8cEo
         InLlrkhhxJfAERHMTQAr62JnAatKDLUr731jK07xUHFInL7m9fknPRFCnZCwnoIEX2+6
         7FvnkuXSWw3CAgVUfwyGr4shWF9P/iglYc5zN3PIPTu5x/FtKdAQLueATPu4vhrJhwKv
         6huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896420; x=1792501220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPjCWxUSfRvlJUtSVwuDIbCnah44rNQ2fIrGmDlzw+k=;
        b=W7clQsG3oVYrlYtytdFi1LjkKS6iYDi0FfejPTIl60j9X9Et1tFiliMGCbSk/cw7zB
         MjHJGWQZx84743DYyCxOhZk6p/kvpDB/U5lzgGmlJgDCEi6M4PptF4YdK6rClTxSpKny
         Y5rlVXznTKM32Vlo+Wknoy05i1Ms6Nj4NeaUyypwdmONq2Y+6F6OA1CdjYXqj23LhqgP
         70XEVwqxMRG0cvJXcBnT49Ah6DLk0W+MvDKsbXSuq9WYNGUEjXBFjcW4rvgO1dtvprEf
         orVqRHf005V+DrEg9j2TCbO+P60z5Fq9MU0TsQI8xaNIwR/LKWpZ9L8jsQuc0wIqFitk
         woIQ==
X-Forwarded-Encrypted: i=1; AKwUvByMqUIkqWZwatgCQ3s/ck9Pu6ncNfWLpxvKT2rszXCj5Mr0eIpke1yFCIe8llu7v4NyEn/MZlVfVoVk@vger.kernel.org
X-Gm-Message-State: AFq9FYI395Zg2uDSmTIkiSm2jmQzl6vE4aFZJVn5i3BHbdFrTU3ipxDK
	bE8fXHk9AQ6YyTORgdJoOVed96m/T3RFgebNs0DmlQnp1rP/Y527zdJl
X-Gm-Gg: AYBFou0SX6+RDJoV6UtEAXTMgvEIBao0NoI6oveDIWNoS3+A8QnzxhznvTAtkSs8VRW
	Vbu4IcU7qOkIKkR23Lgn6kNh3/j9nHcrowJvm24+W1HcMX1uJOQ3Z72bAdGZHDYTNXSnUTb33Wr
	vqVS/gjx0joVRQ1BoyfJnQKxTsDHcgzbyl+MIHORQGGQB1LKlA6UELqzvVlHka3Wgrekkvp9EJB
	IJ0NhAUtFhy/ult6c37e1Po+pHst1dEmYh9WkXoTmhk3urn0ey3lkGWeIJgoTLBxJUExVgGtpN9
	D/bipYZ3Zfuaexj6xL7m65V1Q2VsBJFZtd5/88VN+JylYCzfsqSpho6+/q6vq/XRUIdtNj8XAfb
	N/cFvhVu+7axvI+N32/e8HXffI7aDSDw8R5vOcywZ5Fvev+I8iCSoJNZjwY6ydUqFhN5faJH9E2
	0aLzBv2ssscDJl+mkwLtgRfnDvU0nZU2ofuDzEuhNP+zdS8irl0wrLBxu+2fbZrhFHP6SdXA==
X-Received: by 2002:a17:903:2f8c:b0:2e5:c78a:5309 with SMTP id d9443c01a7336-2e842ab6bb0mr178440135ad.4.1791896419592;
        Tue, 13 Oct 2026 06:00:19 -0700 (PDT)
Received: from marchy ([2405:3800:834:ced2:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4cf3sm53869375ad.72.2026.10.13.06.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:00:18 -0700 (PDT)
Date: Tue, 13 Oct 2026 21:00:15 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jesszhan0024@gmail.com,
	airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <as4rX-xVWUPcczNp@marchy>
References: <20261012064518.3497285-1-azuddinadam@gmail.com>
 <20261012064518.3497285-2-azuddinadam@gmail.com>
 <20261013-artificial-splendid-goat-d078dc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-artificial-splendid-goat-d078dc@quoll>

Hi Krzysztof,

On Tue, Oct 13, 2026 at 09:33:38AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 12, 2026 at 02:45:04PM +0800, Adam Azuddin wrote:
> > The RA8875 is an SPI-connected TFT display controller by RAiO
> > Technology Inc. It supports display resolutions of up to 800x480.
> > 
> > Add YAML binding schema for the RA8875 controller, along with
> 
> So you ignored my feedback.

My mistake, I misunderstood your feedback regarding the redundant
binding text in the commit description.

I will fix the commit message and send v5.

Best regards,
Adam
