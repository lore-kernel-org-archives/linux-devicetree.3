Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E6B37EFED
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467590; cv=none; b=QxvpTu9aSvPmwYDOhYntd6LrSUB8ye4I5qlAJSWxHVgbir18yDDSvrR17UMX3WqQE6HQKOwiz+9xN7XHJO4fBcqjvbyiS0fpDqE5UylIO8Tfwu0c5j7X5Ur2jgvUo6Fpv6E5PEiOr5jZW23SYPKImNrvn8SmoK5L84WBYvU3hSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467590; c=relaxed/simple;
	bh=Dv5bNXnz2J0Qg3V+SwTiwXWaMf4jKZtR1mk8ZZv++Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WREffktt5YcwkzPte4jg/GJwe001DcbPAa3jXFSUDPnKoJv9reQWjdDip3mJE7cVKeVHMFk2panNIPjvm0CzDv4rLPBmMtLEiXWoukZKYHodR2gUGPypC0LkKSaV8QgzQtlU7c8nzdS+6nqgHQv6Gf0CM1s9ONZ7CrFA7/yleWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUrVMkpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XImrlF6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUrVMkpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XImrlF6H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HNBoRb1362613
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ppg/BYocKMHGKMXDduQI/Ihg8vvo2kwlYswUyzAQZBE=; b=DUrVMkpp0MrrPyUt
	CLPOYilw3LlxFz46KCvynIAwRCUknoDkyr3QoIjiVqtzd5WuhU7BCG46Yd5OO+RF
	ziFJouRs8Xa+mBRtEuZ8vf6HIda5bjqZMrBja3VvHBK3R/3Nu0pW9oJKqCdvrJPH
	u4DkVX5bE90H923vJfwkBvLx7xXyJjqHqlyycTAy2ymlBbe4BuXcbRPa7Ft7luQs
	cJwb8NeoOq6HtgfURMjrWEbRjW+rsTPERYxT3KMj7oY47NfNI8jk+5dKcIgr90Na
	Sjbc4dqGXkObmxVdHLNUSprQCgWHozvNz9HvPsIH9GFlGAUxvSv3Xspv52sbAHES
	pmEUCA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88u2ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:13:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a22dbeeb96so26019326d6.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467587; x=1777072387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ppg/BYocKMHGKMXDduQI/Ihg8vvo2kwlYswUyzAQZBE=;
        b=XImrlF6HwVehkUY+U7tr3PGfBo4qzmHeX8ao4nX5he5qTeMJ7c/P4nFxZ/B96NHFO1
         4YYKpXj6by41jooUc4K0gWNCAOHYZjfDxJjUam3e2D2pnplkWZ1jeDxcMVEC5M1SSSMf
         wM1mCtHEWzYtzSoG13r+o+NZciFOjcUOAvmdIdBPWKHgkx6aZHi7lzMn8dJh4KkkJ3tt
         Z2dmukhnDxtoZW4EVglGIsLB8L8ds+m9IuhJWZpIFbudvKbx1f2Pkxq1b6ziN+fPX4kb
         eqlg5GG57qwbVYjFr4H3PZ6NBl1AGlBr5VHm3moSyHGTzA3WUVfGNibxYohv2ojo94A2
         2jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467587; x=1777072387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ppg/BYocKMHGKMXDduQI/Ihg8vvo2kwlYswUyzAQZBE=;
        b=ZCN2M6glF+KEtg3v7OiFPjWZLmNpvTmcCJKFSMqW9xBinU+JwYQWI7VidXTfPbJPoS
         X3xXorAFNppYKRX0Erdx6SpUzZUp7ZSP4CxHWB3h94pstLxHZyqY2Qheb1+jdV7j5m1l
         91XUJn2t007Vqa14G63N6xn5+p1ZmUGQN3m6iZQjMyVAtKprAenAeoaDj5uXEH8hxlox
         whhEcC3fnEBQtxj0/xavrd95LAd+oazyRXUFGQqtM1i79eKCP5jfJ0JW/e89gMFDT8xE
         quNsdPtiq5jGwHZARMKgktqdhqz/4uhhq0X7OmZhtLXqDRUo3ZIFdmSdt1NjzJWwZJwj
         1vgw==
X-Forwarded-Encrypted: i=1; AFNElJ8opIi06qweUk4fooIN8P9Ey+V5HvEnhPYeTBtPHzGEYkmhwdlDkdN3USvvydMwhyrkzD0QSSEj5tsw@vger.kernel.org
X-Gm-Message-State: AOJu0Yycx4Qs0/ZydH3gHC8repXMyIwXj9ZBEGezpCL0wTTapcZSC19U
	MlEtBypwMdICCTgRXQ9MSim2PupimUfpuWeJVGtZO4pvLpGBMh++dgahLhsplEWauKBki+7yk4/
	x4bxP8SqS+2XsP7EM0LM1/18vAQaxh0rzv0DXPzT45tBMU6KGEU5glLEyptbb4JYL
X-Gm-Gg: AeBDiesbc8PWV4aSey10wgBwJAY2hifrz5jIsy1y4aO3gUy4dHnNW5VX4v4esltHDib
	8ORqGKpbHJrbDFAz65cZJlnmMIy31oBvcEL7D317qCZDGiA2EYov65feI7KxKf72NqqzsPZ+h+E
	b24f/EUhm0/XvCR5F8Vrm3IDH3Via2U74JEUUaOYqVnq0E1LvYvvcp4ShkOiRjlAMH0vt8cCUR/
	TOlgMkpBigjpjIAeG1UksunLf1mcS5V+64Lu/SbnrYWKU1pwXhiOuTTItMq+E/j9ZC6ecSzfPYy
	ZNfUxcVdy98ydqhp8Ej2aS3ymA/C1DHGNh7tweX+hGNDxxi+PVvWHmbFzNB3tH/ryOeGI6DGTw3
	LIvfYh/DqH1VX30FDLZ0OkFTnVsz6D67tN+31mt5Eb+2FxiBHbcIXKv3n+HYhTKDJwdat/8ppYz
	ehJ447TI/8cYSMbta2vFp1WRKvOzY6D70CZ6ab+vYvGU4MXw==
X-Received: by 2002:a05:6214:260f:b0:89c:5e33:2cc5 with SMTP id 6a1803df08f44-8b02812918cmr85215686d6.20.1776467587210;
        Fri, 17 Apr 2026 16:13:07 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:89c:5e33:2cc5 with SMTP id 6a1803df08f44-8b02812918cmr85215146d6.20.1776467586818;
        Fri, 17 Apr 2026 16:13:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm813306e87.30.2026.04.17.16.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:13:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/panel: simple: add Waveshare LCD panels
Date: Sat, 18 Apr 2026 02:13:02 +0300
Message-ID: <177646757854.2517306.15967451744879550584.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
References: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pigX-gRGBpEUUdx_MSGE9jfBc555qx_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfX+FtcEnj9NWXS
 uhDL1sZMa9Hx/713GaUfKrwKuurKbFYwxBBNbOOIs5xG4eES17WKNnzEJQ2XL97vLou5KY2qkmt
 +tG39TMGhUl1QgTW84QMfFssLVGIroy7cb5WqGQGoV85btIbN8eXqWQvTNLQGYosZZT9hAnWOg7
 ZIvucotLPF3MbauZseoy5Eq1N9tg14aFrJ9kB923bL82tGZx8eQZiBOQtZ2CFt2uHIc1fuNlCaM
 i3EXEgEyFnc2ePDiQmro5yywK4a6puWi2rrSMVQxOEVyua9RGDF7XWytk2C/OcAwFXQbjlMwrEX
 Y3hQUsufZVAvAJ4OUMOMJQHQg48uj4hqRYnXVK70RTMevPtr7sKv5erOdjG7ekpie6Q7UkTKyDI
 eRytAtAAmvsUpaOHJkpvsKJyq85rtK8bWPa2xE2zHdsI7EZ0yQxmqPsxhsmOrl+WjWn5dfOcoth
 l1NIXL7gHjzCdJp2obw==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2be83 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=XqiqF6kKystFwB6n1pwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: pigX-gRGBpEUUdx_MSGE9jfBc555qx_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170231

On Sun, 12 Apr 2026 20:32:23 +0300, Dmitry Baryshkov wrote:
> Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
> being attached to the DSI2DPI or DSI2LVDS bridge. Commit 80b0eb11f8e0
> ("dt-bindings: display: panel: Add waveshare DPI panel support")
> described two of them in the bindings and commit 46be11b678e0
> ("drm/panel: simple: Add Waveshare 13.3" panel support") added
> definitions for one of those panels. Add support for the rest of them.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] dt-bindings: display: waveshare,dsp2dpi: describe DSI2LVDS setup
      commit: 7fd2875a932276926052652aaa44fd29a950b015
[2/2] drm/bridge: waveshare-dsi: support DSI LCD kits with LVDS panels
      commit: 17394e05b295e4936e0ed50d2f02ed7f08fd4f7d

Best regards,
-- 
With best wishes
Dmitry

