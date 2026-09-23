Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B42A331EA8
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156651; cv=none; b=iubNn2d2GLZgJnyB47rzq0pBV+8PRZYAsIQyUX4I/4HGMNZPk+YeO3mkmvlBwSP5eu4qKY+YNV3GdCjOzl6VAdtaI4RWQ1rioVvDNlD+crR6J5tRwZvN0zfc2zspDibF0Vtd4HXUPEI7U23voe1vY2+MtKchK64ME9X0nwWb8uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156651; c=relaxed/simple;
	bh=F4OSOZ6QNkL9RkPJ9OENWBp9oqWXQ7z1vT7cr50A03I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4zk3hG4Nve1yjTg5IH/o0xLn/FsmQYr7iKbK5svL+o4ILfnQP1iQoMJsmFOKkV+7XIhnFkwh9EVHA93NrT/SyMvp4iQU1bdZLNuf+bfHFdSEVdh+pOgDAJTOrt+pEjozaFFMFvV6t87jQr9H7H6IrU6Qe8kW7tkru55wMARpB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzY4E/jy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzY4E/jy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485843116d2so100205f8f.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156648; x=1790761448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4OSOZ6QNkL9RkPJ9OENWBp9oqWXQ7z1vT7cr50A03I=;
        b=GzY4E/jyhJ8LtuyED97/Cg10LFXBsnmMT/tlnIxX1Y5ftL7B48YCSF5QNAJeSn903t
         +alIPBy4zAtKQ4bVAdWxUvDXoPYW0DkmARbRofzY1r3PpVBuSbhAggSdWtPk3t4c6TZX
         MJ2EbXkZmo8Xshurp1wtSTz1aXZJKJ2G3zQ8iPn+bxcd1/xClVdHGPWfMsYcJz0REEOk
         3nVPFl+AD6oHskuF4c19m2T8uzvO1UiiUH8GOo/1d2YAB8bvhG4JK+gY1t29ND8aI/T4
         wo0xr6QFSPfLwyE8GQn9Jd7S6WmtWs2gsoPIa7MNUyO9TxCPqS8FxwRt9Z9Hiz6DCZsx
         onvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156648; x=1790761448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4OSOZ6QNkL9RkPJ9OENWBp9oqWXQ7z1vT7cr50A03I=;
        b=OhuXXpbA2iP96mOkqOWJq6lCnJs48V4Ya8c8xpaAltp5WIKzVO/Q4N/rr9YzsZnnEt
         wHCbriEG1zbXXqRvIZQP9qM7l/FdBN/S9lI+Oewtx9aSP3DUDPi6XtQWbyvfuEgttrBk
         qt/J4Ueah7DYdOujjt5IYqFsgbzW6HwJe1P4lkshyq6dGH/SJadVsshB/QJ1h5JVQTWa
         G5fW69m1y6ZSP7dEmUkFcTYVSn1lIxUq4uZv36oVCLK2dbY6HTdXfK0MyDbotZ0g/ZYT
         e+BCKYShcNoML0AhdT1dxkOGzrQuOikGDBL0CWu1cEL/Bh/gcy4xLwUBwz1/hhShmMVZ
         44nA==
X-Forwarded-Encrypted: i=1; AKwUvBw4OCXYuHrvuAruP16URUrTbCssEZ+Obkz5BoBHCxetzhyzpU94PYLQpWAF3ivn3dgnykXn0W/WTrZP@vger.kernel.org
X-Gm-Message-State: AFuF++nKRZUPT7xTKEZzYkZpVCc1be2o6HFQjW/YQGy3nc4MLfl5wgw0
	4MEwnDMNiGsh3/DU4wXvxjynMOQFSjJv+k0DBpZDWtWgKAdU6g/gO6MK
X-Gm-Gg: AYBFou1JguHD6nimF4lRhY2uG/O0LmQZ68YoKCgRD6dAichA+HdQOEayVR5WaAxdb06
	k8Ln8IMEVWtHLFDBF+AiUYlKAksMMlIAtyJgfJ13NYHC+BDZmJVK8zo+YLDB3pxAAQ7PLngmjuL
	Ye5ohEEZcgtD2lCo/Xz62xV6yMGL7uBDDAJajoLisr0BxL/RLRp5g7q4m+EcGMh6a0p0LXeObup
	ml1tn3ScWzIHIL1g0feydoeuzArDzwPiPNVuFOAKWBVDUdcarzPjGF2KsJytft99F3FQIzl5B2B
	TcOpyQydHReBGzOxbiFP370qMBpzPBbCo5ubvqc6TiKfHj/L7zOPbafgbjBY6ZYLmlM8r9/WMJH
	HRXiu+2zAJtN9aX6OVkqmOM8fTEiSQhL/9GB9OsFgBsnt9eh7U/yWcIt4Tn39iNjismT1QlkElF
	fyurxsoKbHO1kOk+zuil3UtQdhNXPAUlPyvluUwNl4OzT+YRZXL4WO2MRukpt7uitHhd3HuXcj1
	H/LKwpMjBsTfmb50+fJOSN9VgjTGD4eMP+Fqe8WAqGTn2YbzFVYBmAHaJSQgUHTjseKYh4wOG6Y
	P8c=
X-Received: by 2002:a05:6000:41c2:b0:487:240f:b0b6 with SMTP id ffacd0b85a97d-48866fec88emr3319246f8f.0.1790156648286;
        Wed, 23 Sep 2026 02:44:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm5535223f8f.0.2026.09.23.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:44:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Diederik de Haas <diederik@cknow-tech.com>,
	Rob Herring <robh@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Wed, 23 Sep 2026 11:43:53 +0200
Message-ID: <20260923094353.20318-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLMKYI79QQRS.28Q4ESQ974BU@cknow-tech.com>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-7-royalnet026@gmail.com> <20260922160602.GA3529337-robh@kernel.org> <20260923085755.16219-1-royalnet026@gmail.com> <DLMKYI79QQRS.28Q4ESQ974BU@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 11:15:22AM +0200, Diederik de Haas wrote:
> On Wed Sep 23, 2026 at 10:57 AM CEST, Igor Paunovic wrote:
> > Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
> > two DTS patches, 07/11 and 11/11.
>
> Doesn't the same apply to 'checkpatch' as well?

Yes, it does, so it goes too. In v3 the trailer will only name sparse,
on the patches where it was used, and the DT patches will carry a bare
'Assisted-by: LLM'.

Igor
