Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E17B339384
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722543; cv=none; b=ukxshOyZmyTq4SeHP1V7s1zd6HCj0hPn/RMVUmOsbO8ExIT18Xe23GFRNrrRVCxbYVZy0HG4IoI/cUp2SHs+6Dsr3WA7hSz+8sgkTy303tLR16+J6OhcFUafacGqIbvzyyq+uQ3KbEaw4utfdKIDWkr9MN0ACgilC3NNa36dckc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722543; c=relaxed/simple;
	bh=iUamnWT6NmYBsSueT3Oc5IPXGg5zIZozv4mCBmVercY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOuT79/iEajWL6itzBCYmPy9g4Wt9jHfN5QyPixZp/5X4eitj+xJFxDLf6aOBsFQMKIDJj2d9i6jqBOoN+oBtM321VXU51u/mHi6bYfdloQqOn8XA5WVJUpFuYAx3M+F2ppKriw6dh0+T1ga+4ucSTuecIs9JCJ5GQPcWvsdR8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcyrD2jg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcyrD2jg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955484387cso25211365e9.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784722539; x=1785327339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xw4PW534JRt7W+7M044jqZN3M/EBMZUMhKAoOTNL9HY=;
        b=fcyrD2jgkQKLwyudX0UUNZK6EwfuoDt+0sWRKNSDJNADxHvslqWsOxIbz5gMk0cZJR
         RFu7lR+J+rU0zIX9/DMbRzCT/fX8lgfY1p5c4P4U0JI9Ef++3CpJDQHGgrMPua68zQCz
         f2IfTgCH8ypAewS0cLb4j/8vRVkwDy6VerCqmQjtOGcNbkNSly2pQ16F3aiqvmpIKZai
         cwT4RI9a5eB93bf4/lj++OwhVY6zieg0fTpC4z3WZ5CFI/pjXW5o8c56/ya50Bx6J1Ee
         2vLK28kRYVlLOeuQX3I24/0L27w1iJG7/LFl4q2xfYsTXXGJOyRBCVwZLImnfMkJ4Mcb
         AMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722539; x=1785327339;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw4PW534JRt7W+7M044jqZN3M/EBMZUMhKAoOTNL9HY=;
        b=qJyR9qo5PX1a4dwCAC9LlLA70Nxn1mawwsM9znHGI2ldRxe0cSr9UV9sqY+V67BR6m
         ouThOmfg8f252YBmz6AqiksnK64pfr8bgk/ZtxQldfjQd6GCj0jDpmhVRJTK35C3bkhs
         43R9ntszGyaAuh8WiWZkQwUDG5DNCL0h0i0qguE+gaEyld6rMdSaCAWDBLjZx7VLifBG
         dqOBsMRu7grs9GY3++EEdID36L+S4DUAn4LimnNFblCC6eaMvIgdojirvWzy2CCZrYDE
         wkBO8UdRs6XSppTjUxkzGqfHSBxyIrNSClKBxRsgIbVU27Dsg1nbY6LkN42X/BpY8/N9
         FbUA==
X-Forwarded-Encrypted: i=1; AHgh+RoBwIN7dx7UzG8Y+cseANN0wHYfqCsyz3+fICKxwRulkv6gwIoK63PGUxNubW2Xd/H+vTPmOPV2ZVlV@vger.kernel.org
X-Gm-Message-State: AOJu0YxKqOB3ba/ULaNm73HSHAy/lc6nxP5Qd40+N9VGUxVHk2JvNMpz
	5TDABFM0Ffw0/QH5l7WVXVvXt4LjpeP9TiuGtpvsmJL2UGqkaOnuC3z8ogei5oK9KY4=
X-Gm-Gg: AR+sD11sT1sNi2T8k9LiOqCkRYVk0i3TawNMyth3692SavqEaUrDQakGk/NIQxHKkxp
	G0AmbMQ4WRnolUI6sSA/P4hWgI5sJZJjXkrYpp3OzYsIo5J0xsZ3CpXO/2tLvyWpoUwiXsBcxnV
	QDP/FjM9QIWB86VTR0EllCF5blmOLy5yKv7hUGslEFgrH8YcH4+GNvH+4T2nBCSdIS0QUOnCsgt
	d7T3XaP4F91OUMaEMge7/WvsJh56LeOgrDMX763gO4q5+TacVWwM2RWMor7PAlN8YQnW7tAKXZS
	zbBdhpDgRLDR49yKGnv7WgVgyvyeu1fdsr1kADxLkrG+iDeqLk/epmE6A39hCOyIqNKI88nqoIt
	bixOcSnOkCkAW8cxoX10J+yIgpW+EIoFJ8xCFfpar5q+PIJTXvMvnxeePuqK2P1b9xpBGXP393Y
	tMOmwZ4UYYlmS1suoZCCaaNhg=
X-Received: by 2002:a05:600c:4753:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-4954a413024mr250331295e9.38.1784722538803;
        Wed, 22 Jul 2026 05:15:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f8635c8d7sm4379093f8f.21.2026.07.22.05.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:15:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/panel: Add Novatek NT36536 panel driver
Date: Wed, 22 Jul 2026 14:15:14 +0200
Message-Id: <178472247749.1745070.8996806935280043926.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709142846.12463-1-mitltlatltl@gmail.com>
References: <20260709142846.12463-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 09 Jul 2026 22:28:44 +0800, Pengyu Luo wrote:
> Add a driver for panels using the Novatek NT36536 Display Driver IC,
> including support for the CSOT PP8807HB1-1, a dual-link 10-bit panel
> found in LENOVO Legion Y700 Gen4.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Novatek NT36536
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/38873dd52850c3d713f006c240a2ce0abad52271
[2/2] drm/panel: Add Novatek NT36536 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/75a5dbd1f4f71b1382dae973538af00178ba55a0

-- 
Neil
