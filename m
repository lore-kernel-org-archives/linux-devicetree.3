Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F336E478
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 03:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393387; cv=none; b=h6TWRRAxSfOw/nrkg4NdEbuzWXuMfoC4qO/cvwD6R67G4EYhMAVNvilZLXRPzgzKBVWj8iQeBvqNy+rI8RvI7HC52DV0PiJaRXScKO+3fi6IVw0uZ7ESd+cXttCHRCGz5e4B6XIUOYIj81NKwT8b3Yqf0P7XGpX3WxaUq3du3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393387; c=relaxed/simple;
	bh=h9PxQncYBLh3youqxgEia4ZTQ8uVglHXzoWmBgb9eiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/9Ao+g8NYoca9xrfRYIllhPbCSksmdhxR74BZ5C8DnvZzrbWRcHG5lNsdAP+KKqTy7Jcb3WLvltc4w+hRZuKhpJVUyc/649EX59sjaXPu5FQdQcRykHtGzdWtVTW/kMNQbqquuWgJryX4PLwe7gkw4XDIDHfg10Egb6x+SL4F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEvOuKUo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEvOuKUo"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso6679655ad.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 20:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393382; x=1790998182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1b7Xj/vB3OGygIglTW5p4IiMWkGrQYonjQ+99wVq5Rg=;
        b=jEvOuKUo2XLi2xxmmQhs29NlRRK5d5bdlLIodxW99rypmn5WhWMaVIxzDRw7l5gJ2e
         pl9CX0jtau5tn3hlThMw6AqgCJw0xKLJi3Tw0fgLfy0oIsDuZMsh/NGqgiyDiq2S5A8/
         RpnyQTT4sC8DzCICbhlXXEenoTlkZzY0Pwt1v0owjecVRAw5Tyht8UC1HV2O9SwMVwnv
         UAyXnaoKgoT/6oPmHTMPGmEmONkPGjpN2gGc9mKJqQwTe0JTD0p1i+okLr35/35aq89e
         UIjzfRbL7oZ84SpktFfLwmM2+8xDi3qTq9dHABQiE07tNNfI58Y3Zq85QkgRjPB1t/pg
         CJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393382; x=1790998182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b7Xj/vB3OGygIglTW5p4IiMWkGrQYonjQ+99wVq5Rg=;
        b=xl4feBFhiH59ov02usJAoT1GcT2A5ULoWqROavmhXf/1rc7fzM2iZaY9tRRlxC5eRL
         hezqgms+7QErZKq266QtPWJchFb+tNMYbpO2z1AFke4xAa5sWpIJgB5QyjdRcuhQhlbm
         Lz+qarM/nvX/bawSJqCXrWEQT5NG+dTMrOQUglVTUdm4osDxWV5yxs4p7IXBrZH+YM+l
         25klUq0dQrbtuiC7SEQcgLHP2X9QGyfvjCVGOw98EKbEym51zavcoWqnPqOh8w0/YhSo
         +8IHCrFsKnvXhynDFHtDc9CVa2DZgPTXjYPrNFuk+CR8nIFK6KCa7+HYSWkNyzEjNppA
         mIGw==
X-Forwarded-Encrypted: i=1; AKwUvByAwRZ3qRinnwRJCUvFBACOHmQixLuMTBeqh5td58HFA5ybRUJmNieE2EQ+qECPbDF4W7e/dKg76vV8@vger.kernel.org
X-Gm-Message-State: AFuF++nr8BAkj6KmicSrf0bG3IkMNDRyaiACwFxWVJedc9sCGP2RAOZ6
	BRhn6Kytt87Y9XreNJ2zxA3ZRD4z3lpo/uZFCmdsASVgrD3M0eVO8N6g
X-Gm-Gg: AYBFou0Pa3jb09FiyFeNMCxsEHMrSZ8Wg7dqQP+psY0eiIfARBY2soWaNt3y1+LEAjm
	eFUr8vEZr0XNTJD9B2NjfQw1JuX3NhqhRSWvyQjagxs5xTgMm0NcwH5SDTvPRjRTZ7sGZ2sij7/
	UfDm6BbzPAlPGX9FjMDFxsXYUh5tHsxTyv5pg/3X4+30d1amylIrT5zZia1JJBMgydsHuOImO4e
	s/uSD1fJJzCTkCryblQ602qkXrLwggPSsjluwtdQGG+94IYy6F4B735y72P9UGrZpahYfzEeOjG
	GdVZy/qEyzw8tWcICNZSTU5UROVh2bYMsfVniO1Mb6OZa+zYIUXJ4tYul9nlhFY3fahw1V0DnOM
	sBjhQ4mXgs1T1vN0R9SXQ6O7lsEkjlPnuLZAXxleMeq2tR+82LpduPZHP0LNsWr5bBGQ9VESCiw
	CqFHoWCrV5KnfYFmjOOH7VLUkHSfvSq0pIrjTsh47KG5G4OhF6DeBXJltzsHc5gUED7awnk0X43
	C27w2Vygr+o
X-Received: by 2002:a17:903:17ce:b0:2dd:8b0f:70ba with SMTP id d9443c01a7336-2df7e267763mr60112075ad.7.1790393382425;
        Fri, 25 Sep 2026 20:29:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fede2sm18554725ad.33.2026.09.25.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:29:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:29:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c
 controller
Message-ID: <46a43ee9-7d2b-45f6-9751-9436fd69f7ff@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921065702.93196-3-Ashish.Yadav@infineon.com>

On Mon, Sep 21, 2026 at 12:27:02PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Extend xdpe1a2g7b driver to support xdpe1a2g7c model.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter
