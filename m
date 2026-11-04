Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778133;
	b=ZdP4V4Gct6k5vmnK8bYJxwA0vQHYK9ULMcBH8hcMVG3HgmsWmvbTbYVG76HooacnNFG+
	 VDXbh3igVJ1h/5AKzlOYt69Yyt0PEuiJ5owywY/5nnom+Vh99N0qsZaBpT4Mhi83Ohtu+
	 DiivvaCbrnUDaiEeKxfU4+HUw+OOP5V2AGn7wbJaoPlSA767YOuzxN+eXfjec0AosNd/p
	 6zYJ2TzA+KWRbhHqXgVm+MNfEtd9HpOajasGpt6Bti36bHtkQnquQQ/ry6LcpSU15jJP7
	 qWeBzHojdmr/swWCcNK/GmcbxaggHdO5jF/9cu6kx3kGdVMk0yCxj2+vvdvMhs/OIyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
	b=JWAJlqeEtwyzaiC0ur6hgP7N4OdGUn5uIBcPGTFXRs/PhCFOSnvwlPL2qdeFjc1mF8A5
	 5E5jQBWsnI6FTWWGtiAWGFTyGDAVsJOaQ1ZHvsw7HPYhjaXGTlBTPH6fmjkj57wSvlhHv
	 /JXsihqNVi2gFdE0dyizk0nRXLfoqkEST30itTZ9hE0B63S+9o8If9jWspIsh0GqmpQs2
	 4THevowHCRthipq8eF2LtsRWZhkPACUX3Vh2GqDehLlr9ZEJPoWHmGFWy3/eaSljCmSEr
	 6qAcT4G1F0SQSq7CXJrzlM9gNKdxdBKLZJqTaQ13Q1HkEvdg5zhqFa7NGK5apLy4KZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFkDsZM1;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59808606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59808606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFkDsZM1
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1aefd1bf74aso306513c88.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778132; x=1794382932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
        b=GFkDsZM1X2fvZz7fpFxwGKgbV3Y0f2EwxqtIEVZ7CppVOXupPs01n2FGhSODJ/HwCo
         8rMt6ha9VIM2fp74g86DkY7D85F9IdDGoovji5s68uv60eOKq1gYRGvlKEGsU+7Ddgv2
         jUt/tVb9mYlKeN/vKv//GH+bPwgiAV8hU6vY6HAbMEfWtEdsT8+xbVLML/BIznkhoahK
         1naS7Et+tMlJlVjSNDZq85Sk+48UYxBW8Ebh0dYTLU8Z/yyoDQp4/jzCQemr1QdI6j8K
         YvT8pb27yUltIZbjOwM7Rw8wOaP9ZH19nIjhCqNLYeSpt/IkS6+hXsUvbaFbDgothKNy
         HlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778132; x=1794382932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
        b=iowNxVj6V5OvXycUuNIk0ZRZzpYsWicZ/Q4yq7ngij87D1nqSDsN9v8CG1GHlebcYT
         nY0hXtmhdOtWxUVdiNk4v9pZ8ky4nWpSAHPisFT1+ZGq66xkLrfNVK4UFcTRO4K+JRQU
         ZSUy6Ar7abVAbL7xMq0ssqT71t0iTuNn+vZszawZQQez/9l/zRqXS9cxSNO4SV5sRdYx
         sSTWLAUCzKLmaoYLUfmpA2In9RbzQrPNg8ogHBElvofZDff0kN7F6W9YtgVydjQF01rF
         RayAl/0vmUfT2Ypo7vhSNNGolO3OrB5331fNd/T8v3nU1P0ZCszSmHjx5r0K+hWfB+R6
         K1iA==
X-Gm-Message-State: APuU4Z8gr5Dk2y+20PyGp4iCJBFHVbOgqjAFIjeaf7SoJp39qMBCOIrt
	eYe3j5HbwUycd0oQt3jAd2uScNwHEJ4lnhPH+RawOs97wB4O41ou0zu5
X-Gm-Gg: AYBFou1ECsgGiCEfYSFjBAgbIwJ0RhDz4ApAD/EX6K+86KIGRQtH250hCJ5SL2q42hm
	OelwbZnAlG75r7oMGh1uPv5igocSLJp0nSUk7jhKsRs+nrrtWoMSYBJrIMsbWpVJjn/5UqXbXeI
	FQKvc2p/WONyOzq7T6U7ckPd2OBiRR1Ff/NahfniNOc6esABvJSYPIITQnT66cBZV/f2AoGdOWb
	ZNYsiSyWhT55xRoAtOgjP8D6MbrufBpM+6pQcZOfEQC6BnlNEZa2rHZyrAgDQu3M5SEeTUFpx0Q
	LACeiQWUOUH2oA7INDpND7s3eTHGcOHbd5hsiy2SkRgPzu8X6dOPOVNyjOLgj2ET1tkYt0fGe3g
	fnYwpTB7W3wSNpaXX+CkPRiI23x/aSF0bIQcAaNnlMhG4lMQeSR5vUI8eRys3no61DnJhSr4pup
	8xTgGZmYOSNLNe2Vh03Q0YYYc9qYOAriLsgYtHQxq3ozlsGnw+5Auw+Ii4Gm1xo4UAMQHIoN/dg
	OQ59FkEPNesPn8O+UdxpJ8ejVQ17ETbTV6/sXvxeJOW8RN5V3E1Bz906PhbwVWBaq28HyEJpIT2
	OBDz4IFBCg4pqH6YB1rdTEX5RAFZHIeHvcMmgBRf1/LhimHE/o6Nj/raX5MlcoOWpD4zzF3tVA=
	=
X-Received: by 2002:a05:7022:4588:b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1a94b852aabmr36592212c88.27.1793778132148;
        Tue, 03 Nov 2026 23:42:12 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:11 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/2] usb: typec: mux: tusb1046: add HPD_IN override support
Date: Wed,  4 Nov 2026 13:12:00 +0530
Message-ID: <20261104074202.76712-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For boards where HPD_IN is not asserted by hardware, the TUSB1046
allows software to force it high over I2C using the HPDIN_OVERRIDE
bit in the General register (0x0A).

Add the optional ti,hpd-in-override property and driver support
to force HPD_IN high when DisplayPort mode is selected, and clear
the override when switching to USB or Safe mode.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: document HPD_IN override
  usb: typec: mux: tusb1046: support HPD_IN override

 .../devicetree/bindings/usb/ti,tusb1046.yaml       |  9 +++++++++
 drivers/usb/typec/mux/tusb1046.c                   | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.50.1 (Apple Git-155)

