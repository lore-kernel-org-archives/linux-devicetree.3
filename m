Received: from out28-98.mail.aliyun.com (out28-98.mail.aliyun.com [115.124.28.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8C8225A38
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778470114; cv=none; b=SmaeCcpCKyEddJn9ZtuZ9cZKopduaqkEN2EGPUio8aoQCu4lht8p5FD1Z9ekG6ASnxfoL9rTz1lMUaUS15pWY7q0Fx0WSek/qgqVZhdkpoHKvKdzgUtdztgkCAlNGUaAMIqPC8gRePv+TB9BILIbJ+wrIPT/oOTKS7YwV2nlq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778470114; c=relaxed/simple;
	bh=OUbOMD1vRdCCXiQeYt2Mz87FWa32wqHnvGGU2rSWfmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ch1WkWU3j9RjASSbq96DykRajqCE0f6PDC5/WPnp1d0+Jm5OJnGFzcbfL+DPAc3Qf1L2c5zcerByAr0ts/Xum3yVcgDJjk3tIjCen4iqgc6akoQFRS36sBTmIu5PaOpuKPt/dmAku8wHQRPSvP2Ebr9fUlnRAI+L07FZ8oXZzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=lw3HtUXf; arc=none smtp.client-ip=115.124.28.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="lw3HtUXf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778470103; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=jfwMaxxdS67rnZ7uDXLCCcnFkL/ISIM8RleOqH0kHq8=;
	b=lw3HtUXfb9amPW+IbWuCHSEz2x+iNW66YPF9mXV1YYE7lckY3oIFlQfE932AoczyZtfDLqNKZgfmAN80ZYVX1Z9jtkKTM2kfurBg7T11FStPbFAApd/H/wKpKWH/qbiUdAFMVg+LlLbj++nfdXFRH2RJuIeRV2dq59VATpEeNPlxkGriHUMiHAnE1O3dzN1ro8kZdZRfkUyMnrvtNPgaeMq3XowLu3f81HLCTIixgN6fbpO+3++SSSIt5rq6p/6MSRsgqt/jvT5qDuikPofwYAM32zIk5TGQUwtZFOyZoXyOyzeNfGo0CHM71uC/SlnJYa7DJAnYFGC0FqcdIZVS4g==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.5200654|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0540498-0.00904401-0.936906;FP=13402756081238397904|3|1|7|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.hUIemWa_1778470100;
Received: from mail-ot1-f44.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.hUIemWa_1778470100 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 11:28:21 +0800
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso3521829a34.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 20:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9rq1tmMDG418J/BQb7yJetsR6mbwxs4vC4ASReBdSikQ8tUxM0KNd3WmGePtpIMqGzgtWC8O72W2Mq@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXGFSIhYkfDrthXLOqc4bDIGelabAM2yQm5LwK7odPqjIEkUh
	h3UIH6gGlL8pnnsjFuemSM2EgdH/lBJZNbYCB5C3B3Qyw5OdeUv43E7sDxL+KuKqHhIcigrr3lS
	p9NRAFd27ZR5gTBmmwGR4DwwvQm3pjjc=
X-Received: by 2002:a05:6820:55d4:10b0:696:aedf:bd53 with SMTP id
 006d021491bc7-699ab5711c2mr5737051eaf.9.1778470099831; Sun, 10 May 2026
 20:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508142500.4922-1-syyang@lontium.com>
In-Reply-To: <20260508142500.4922-1-syyang@lontium.com>
From: Sunyun Yang <syyang@lontium.com>
Date: Mon, 11 May 2026 11:28:06 +0800
X-Gmail-Original-Message-ID: <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
X-Gm-Features: AVHnY4JrxkEnUWzQqJ698dfc7GDXi_1fOf_0kLN4nLtInSVNnYN34VzELwKRFYY
Message-ID: <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<syyang@lontium.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=888=E6=97=A5=E5=91=A8=E4=
=BA=94 22:25=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Sunyun Yang <syyang@lontium.com>
>
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
>
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  .../bindings/display/bridge/lontium,lt9611.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9=
611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.=
yaml
> index 429a06057ae8..e0821a63d9d7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yam=
l
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yam=
l
> @@ -4,19 +4,23 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
>
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>
>  description: |
> -  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
> +  The LT9611=E3=80=81LT9611UXC=E3=80=81LT9611C=E3=80=81LT9611EX and LT96=
11UXD
> +  are bridge devices which convert DSI to HDMI
>
>  properties:
>    compatible:
>      enum:
>        - lontium,lt9611
> +      - lontium,lt9611c
> +      - lontium,lt9611ex
>        - lontium,lt9611uxc
> +      - lontium,lt9611uxd
>
>    reg:
>      maxItems: 1
> --

Gentle ping.
Thanks.

> 2.34.1
>
