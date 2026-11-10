Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794339049;
	b=D6Z7NAev2XFcK0FpQu2vibJgK/IajVzUvkoiXDajWdKanGhy5hAzIgLg4LubtUe8tMsU
	 FtgL4U6ojDNp6I5VBJimsg/MQIwdhW67YNdw5JhPwiAonO6iQT3neJPj4PJQICO2YMfKG
	 Vrp2t5bFHBbQB3DUKaqX2G5tkwx8TSQllrm3KKmux1PUq9JX4rMn1fbV2RuQOdriR5iQ6
	 e4SSy1rqKo39iE0OENLJ38ZlhJDAQQINJVz5SNU/N86+pLXBnNKJRJwoHK1z5hWA5LVpp
	 m/yn7pFhMTgQLW+CmvNyVK7COfq5MWS4D45njBsWOJNCyzG6ucwkgo3KTC5KZMs0vLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
	b=I7b99jFjJzDlkgYUBP98i5KNwfFCM5MDN3toqJtq3c46LJz6bL2P3n9J3lkZqOPqxgp7
	 NpP7OomWJY/csFnsCGtrw+awAavu3BObSdhvPAeSmgSAyTRdUJxVmZwBNCHDoiP/yeJq/
	 R/WwqZ/j8yAV4nvRLagRSF88EMt6NkSF8N4f5q6NRAENDx5ftITGjT+P4S1klT7jW1Oaw
	 L1ZzcgzPAUcLv7zjy7GzmPSeP7adEVM58fMilDEuWX8lOCAXHebPyOV/pOlIQiZSRT9Hh
	 EHGJ+vXpIGfbPU+7u5z3G3C6+SJGl1l3wgTO59kN7BBCfQkzThkAFzwyGNjNgIU8Ptw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lCMkQx/c";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F20606A33F
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F20606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCMkQx/c
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677bc4704cbso2835035d50.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339047; cv=none;
        d=google.com; s=arc-20260327;
        b=Lt/6Zg3IQMI5JN8cqSFmDPEwv8lKmyqYo5uL6fdxe9fh1J27sm5E3I/YcDpGwdBcos
         12h9RtLta1eDxhHcj67aafBX5ily/gdoZbm4ndMoiBeeOmGns4U5oUKfueFrOttAElP7
         bIBvWCTmk9uC12P5prBwir9QxwRzKuCqfzg7blfmqEWNurNTI/xJup07rpiE/vVuzGsA
         tC02AvdnlTtoQc00x64r0WvUe7Adbf6WqqMyHcf5BV/6oigxg6knu6aopc+jug5SmB/Y
         yRR2T36wo0s5KXHnOA4m2v7M/LJPej/KzEz8Vv0RjuHMJpvrNyPwXkSp90FdBM0lH81z
         FHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        fh=UBQh9erWftk+avJ4jJiiaq7KLFfu3Ny4V6FaFWnh8zk=;
        b=Y3qYdsILWp181t6pDWw4hkd8HI+yk7n1kp4OMK0YlOqnk4EKIDGKDUOSbE0C6OGz0t
         64Ech88gzZVPUdPVvbOBQEpmNedqSksSLgW9S8A7VfWt5u/yTMb3Jt+rQSiP3llYDWqQ
         /KKl6eOskJxmtT39cNJBzoqNUp39NMMP+RVQzIld5IDB6GQY8wPIGzBCYLhyvvaTJyYY
         ibHTskXlBpZ3OJbX+ej/A0E0qVYWbp8LonX6MbeDycVM2+aF5E7yVo9daYwvg0u5aaiq
         fC7M7fC1h1wOdtEHQ1NZ7LU2tcx2IAdJqe0QsQkJFq/K2t4wdTR7TO777h0fUQBaeI4q
         y3kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339047; x=1794943847; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=lCMkQx/cZj1NAfy6KCYTYzp6/8rt5qKzirF4luXEwMlX15auMOwo4DXzGTYCJFsuhF
         LdSMJPnmoMuvTRSAtAl0t6sB8Iy1zED/Y3Ocv3jPh7yB+k5tV7sPSQT3flZdd0KNIXtW
         PFHTYQPN/UMIKrbvGsZ41ybtXUmtbryWrKi4kF9MzhyKWlIh+/lbxONEwQKzikfuUxH4
         +c9LMpcV0Xb8ZM2ofRqI6gk4FVqvMSrhlcLPOMyUEGEUzN39EJxw08QElFAbKVcT9qEN
         xr+XNcrmjfiDFxpP5BjKQFYEACIZOtbmqjJR0fo/FSQCU8QJBx8GBawJ6GHVNWzbSkai
         38Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339047; x=1794943847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=szbnv9UJmPsQ3LR5pvr8v03uqIOscRI+XQReTZNXUhwDii305pyK1bPnBc/zp44i+D
         CcqBf+cgRftyzg/dfvEicJ8eYSxyhgAX1z7unUpYslAcwqbTLGYQHsM/GX4+jHliDlIh
         YCeQFU4y8s+pkT3VNg6ZC4Xv8x4rJls0gExcrcwLKF4MvCYQFDe4TA23swhBVo3k1pro
         gU0dszh6S9oly8dQxZQXFLKFGUOHgv1zm+WmK5mQuPTUuhNC5J5mlwayVKKZ2zlvBLXX
         Oa6AhOgi/uPOc5zSAvTVqMcmXEfLFJ4UvCzQjIze08JjPpajfTdACBzCGKKVaXPQAKFd
         D1/Q==
X-Forwarded-Encrypted: i=1; AL+hErGwMP8e3HTHAJl1r63mGrAi4oUFDd6fGegi5/FSOYRYpP4yeXR5NN1SSiuUVZHWPIxKEhL+J0za+NDN@vger.kernel.org
X-Gm-Message-State: APuU4Z9AaZGrLoZ3sC8pdX1iQBJKgY8jdDyPcSYCo8fYi4qRnEOMC7Nv
	KA/UFRlvyHuN7rLbIM81ZUBZPKNj3EG/4ZE/MYB+zLAuD/dMM8hhqolkwPP6iqbEFibck+aVZHI
	oQx/NESu5xmOb0mO2Lg5odpMwzqszZek=
X-Gm-Gg: AYBFou1uCmvZ1F7xrt1i5ybD5gQ6mG2LfuOcYLhNHDU9r+9MU9QNMry2aiGKwjEqEzx
	QEUer1T2aZz+ErfOUlCDxHygj1lAKOE2txuRj9LdNBhuRraX17o9B0ncF0pTraGRqKBzPzkALOk
	8bmbZhznjh1ZOhv+R5peTOOZljpi5Yo7nWQ45DDGce2exmTIdd7VKc1yBK+o9Kpew3XxYH++cKK
	SwGA7APQQhk5s9YE7xhgArEGG8S3qd9eMMjOesoJJNzqgQYBMVcc1Ls22eotKiXvCUPUxVl4X4P
	9QGhUngN6mhojZpluziSGFpXuKFCQIv3szXjVLRmN63ambSdEE1YFgs0J3vnugHRxnHdnEhrB+Z
	pcpw/vW9imQJpmKqk1w4p/0epifOmq0Wctlf3RA==
X-Received: by 2002:a05:690e:43c1:b0:67c:2804:fa9a with SMTP id
 956f58d0204a3-67c67fd7c9emr126041d50.36.1794339047361; Tue, 10 Nov 2026
 11:30:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:29:00 +0100
X-Gm-Features: AclHuK-V5XriYQc7jPlMOpsvH2O8V3xAiSzCm-87ylsSLg9H0W8yUGZ1h1oG_o8
Message-ID: <CABdCQ=N8afBsoZcTA7He3FOR9D2K-yieb9i4cAa=WksjoHm5aQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] riscv: dts: spacemit: Enable PowerVR GPU on
 OrangePi RV2
To: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

A friendly ping on this RFC series. Any feedback or thoughts on this
approach would be greatly appreciated.
