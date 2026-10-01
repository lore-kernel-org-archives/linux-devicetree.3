Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2743DA53
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833420; cv=none; b=gDqP9fBPeCs8Orm8hFu1lq2KcnG8edyBDU9lTbjZ8UxEm3KvRJPwHMQcR4aFeAJds9ltG3xzaf8S7sjOba3Zk9I/3GBpmhNNtt2iz35mzGvpH8hsktf67QEMfw/uL2nudb64NbIEmXusemj9KNIkyY4H7Bl/lVWJs24CX0iZfvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833420; c=relaxed/simple;
	bh=rcxUxarvckFEbzwc+77lGqnMQwy+i+2zfogoe1pGPuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DesbyWaLhsQ+qKOKr4ISq4y5XJAuQ9sNCpHTG46/rA+9TM1KRAONhIzUJSfqBNxvDq+ZNPtEJv/A5DgIhIT2pPSRYBqtv5Qnxc7lO8NnCOiw4WD45xxUbIECZa+ZLjx2HwyIbR8ftXEoNV8ha91JUUaURXsuC6b6aYCqPoYsyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ih0YrXAC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ih0YrXAC"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f9bso29365085ad.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 22:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790833418; x=1791438218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgvrIEOpw88VrEORT9HbHbyuQrZfBbC4ttbFKpwgFuw=;
        b=ih0YrXAClCgFBCn9SASE45n0KaQdTZ8sJoUMQOnUf8WH3BD1LIfrruRykCRU1vYoeO
         +JIpWL81LBuL/fJHeNPsCvUMiL+CyjIGo2FipCNL00ln5x9BKDkDNI67yglabz31gfAG
         13ut3ETxcZHXx2pJII9NFqw7+srZD48spPcXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833418; x=1791438218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgvrIEOpw88VrEORT9HbHbyuQrZfBbC4ttbFKpwgFuw=;
        b=itnSj3IyebT4/04Yh7Q+cFW9gA3ke83J0+VfL65wJRX1K4qqipspxTq3TIxM7HSo5o
         X7Pe0Mx/b3QrDcUjDZdv96oPg5KlsIlhSwZPmNgaKdNpxHAmhBPvyFlKY1u8d4mCMiW9
         ux9dYKJ9C9kP3cdeV9e+fC1R1bzsHzFdR4xWbfnUgBYn0BaEuUTCRscif5spUdYjdgHa
         oYg7oYTCm2Nr2jC85Vtq+yOl/8Ql4Ru0Z+FevonnFKkFf9PjPX0r8XQNb89dxHnEUnJ5
         TYB8eIYgBcTS6GNORg/5n/CDyn4I9l/geUiEKtBD60qS/XFW631/2/4/rXMOJcl5VZ8G
         8uZw==
X-Forwarded-Encrypted: i=1; AKwUvByAeE6o+eyz2a/J+4G4Tm1YE6hXUNhhsNrCY510vikLSFNLgJdzUGu6VeZLjpdOuzKFQ7XXYKk8UZwy@vger.kernel.org
X-Gm-Message-State: AFuF++mOkHZwqIjraFMu12EoElrZN1rRtbxaMkXOclCaH/IA/odkRk9V
	z7Oop9nd1oDzd0lnQEuebz5fFIhDVIN2ZDi1LLxE+zDyueh/Mg7ULUV685YWZvBOBw==
X-Gm-Gg: AYBFou3dkTtEBAw89LpO+Xgthm8IOLPVt4Kh3CKIsSzWbVFh9cXoT6PjA2ZaLLVPiU1
	4IAF/5DOuaUcr1NT3Jr6NTOMORLCWFS95sMbmLWdsJWJTTe9hQm8AFVrIxXRnqxU9ep0zgB20lF
	wIJSGBFfqUUvvrLiyuxGcEPGDLVUdbL3OpztnYLS+B/sBq3ywEw1dM3Lbi2qvd0q15chbudqqhz
	2yVcBvXBq4W2dE7tyhEWcu+y3EVJyRAAEGj0/g2dIbDRWtoGruq9/t2JQEdjuPPTqB+0uGNGvMO
	ccHjgm4AvWt6rsX3cZKrVDtjpJPwY8BMZXX3Ux2txKNEwu0HXqPKSGtGl34WU9XeE7b9VXPD58p
	IhCk2xLeF0D8wftE/XcuVZhp0NzyrQAaWXkFj/qURIhsoRFcFG//De9TsXn/jBcYFEOPQfMz9tY
	uPry01/j+6+HJh28Xrl5gu7ZoPCYnYgKEbLSVrjdWEHAJXVmCH/wUHmuggmTkbBM8mJzNd2+/fL
	VqzM0IkRgc+2qwXyske45aAdOvdKAR4DOZBL21kTLS265TOWw==
X-Received: by 2002:a17:903:3503:b0:2e1:24ec:df50 with SMTP id d9443c01a7336-2e2e499e1c7mr26745355ad.21.1790833418058;
        Wed, 30 Sep 2026 22:43:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:d042:b5fa:ebeb:ace6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30cc14cbbsm1942765ad.37.2026.09.30.22.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:43:37 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:43:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, minchan@kernel.org, 
	senozhatsky@chromium.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ar3yt8Kl3WUV93lP@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>

On (26/09/30 07:52), Georgi Djakov wrote:
[..]
> @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
>  
>  	while (backends[i]) {
>  		if (sysfs_streq(comp, backends[i]->name))
> -			break;
> +			return backends[i];
>  		i++;
>  	}
> -	return backends[i];
> +	return NULL;
>  }

This hunk looks unrelated to the patch in question.
