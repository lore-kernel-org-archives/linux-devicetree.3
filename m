Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8423B52E1
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778241967; cv=none; b=LVSYteJwf4ZX/jCpDix1ob+E9udwYwYWRUrAdAQX7XlBrnfTte8H1RuAlyqNF5qK6jYCuzEsiuLeqUxqNZXv5t9CW2IuTnvIJsc2RlnRqwweTMwyHj3cvPdJfY+MEcIpv8W7UMetG2i0lxRXa1NRof4DtSZhnh1zChOfd3Ap6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778241967; c=relaxed/simple;
	bh=zvTVfjbL2OrZoOY61Pkdnmd68huUQbVboDuj8aozplA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PWAsQFUVqGlz2aRPGMQ7mH5uQlXTbRCU370F2a+OFj49ckB5zZq/IHEWrPoqiwAZvTE6NL8hybZbmMNW8OXm3I9BWj+35jeZRPcjd+5Ey+pItj2kxosyMAnD/BMQ89FcLk8PTd/rQbonffyfohMwars135s/jaqsbQoGLypnIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9hLCzpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfkG65jz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9hLCzpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfkG65jz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jhMA260579
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 12:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsPeSJpm1Gzish10iQDoB6ixGKak2ISCVny4R91SuMQ=; b=l9hLCzpGgu1zwdIX
	qsB74BixolXE7boA2iDrwC8eYiisxS/Y/SVd2F+Sd6akxBp0m76VV/kZJ+mxYh1z
	TIrRe18p5woVU9Y3Sy8PZ1IXs1Nhi0R+X/JT+cN1ocfiSkghDocXQvJ1xZtus2ia
	bUo4ZI+GTeVpY/ssOa4qCbP8H5bi8lrMxWLilOSsY2iYAm5O6ewO9SoFI0kKXXi9
	5PgldEpFZ4Al8PKPeGUFD1SHthsdZxSD7cnLCwu4mzr+4l9s6cWeWMHWReyXxh7M
	chBsnFrt9abEA7+4VIlLeTP5KqM8L1fHs5QtA7vQRTmu7PPmyZs5I8QCu5Qpou05
	aXG9uw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh61q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:06:05 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56fb91588deso1888590e0c.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778241965; x=1778846765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsPeSJpm1Gzish10iQDoB6ixGKak2ISCVny4R91SuMQ=;
        b=BfkG65jzJrbD6FIhTzl7DXWDg3HM+7E0arVNswFkA+hTWYkp8Iw/8Rj9dXfp+zbAfc
         ttgx+uF9B4CJJ4l9WAvOEBI4Ekev0XxIF7+ZINOGfOCUUkAXtKz3oygMt0j+Lkl6O3Jg
         aZQL/WmXL2W1x1na9ZDz/tpOtqXLqN3CkRymaf2mwC4Hl6zfraSdneoimsZ/L04H/vpY
         DlfqnR6OYYxU4zQApNafwicby8Yqzkw82z7IkqjvfRW/Odz9/U/1s01LNDHQ+7hyRV2U
         899pPImH0PetbAIXxKBB1JYOGmEG1aMh87KwlPsUxWXZBS/jzALnWjV/Fu97egtu+f9o
         QzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778241965; x=1778846765;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsPeSJpm1Gzish10iQDoB6ixGKak2ISCVny4R91SuMQ=;
        b=Mik1JKl+oJ07DiBbd1+bjMxFyzpSysEEz7Q/wNScfHxXlNKPIZDjtWHwwQL46FNNpb
         qJ0WGXeWpK0T7qXDIOSBUxAUxrtGxk9rJXnCiHq1TagzULJddMV3tv7+5QX04WKnM0lr
         HsU1Lv0eGrQKekL2QNYTAXKcopQD+alj7TjbYb+p0mvodV4uiwTs14It5ZQVG53G67PH
         uVe1p+Ee9C1GOQTsu3laju5ehKU2bhZsFHqALRA6R/ELrB4BUAHnWgD1X86il3xhSGTW
         m0YcuedfhE4WVSHyVQUmWuIHZML6LVKYu+3M/IUVY7jpYhFOarF/nAiK3R5tvMFfqPMJ
         72EA==
X-Gm-Message-State: AOJu0YwiloqkSZLDun+PCx8hIwfc/7mHEOWBRLOxbRfkfN8olYxRUJCl
	WcNK9mn3FRhjVhSW2ZiI/1ed8d7Lc3b+1Om8NYUIshXLgBkkU6dpcZPhBcqzZ8n571uTDQyIJU4
	m6Oy/yN76fx6zqYgiRYpc1rKAUN69mwPtPhVFovqGplkW58YrO98svtOHPI32re6K
X-Gm-Gg: Acq92OEoBqa9yLM4mMfBzSkDUYIjIxbosK3IeDSWzuCKobFICG6lkIevSBPRP7vEd5b
	QjkPPbziuPRD7a1G5vloHpP+emICh6DBBXuBHsvWj0rt8ZmYezJ0I+pxWi4I3zHB3WpVGlQ0kCj
	HbG1dIHtQ/aeezKd/ZKQgLyb6IweYHmv/ilbJWl2ryngiRvd0r2zMgpCdTcd/kufCPQrlQ1dzNi
	RaZ93W2dDxeRWBbDj07MMXfi6n/1fk2VCXNUjjfx+L70DLwxgGRHYJw+ZEJNahD1ab3Lvgn0LJM
	OSbsq7/3Fu9SqO6Fs+tCmkAwHLn0wEl+Js1P2LAAHldVWaLuqCNEdRd5D0b1tlWjDyRzCrEqa9w
	+YvC6WH+QhxY+M6tDArTB/rOFTY8qXZoADJEdZ5ZPlyXq+fLXRb+3xkvgZU8hfZtk2J5c33G/sh
	CJe7krQ2rhBEXfRIv6gwibK8DPsfip3Cps8EM=
X-Received: by 2002:a05:6102:4b19:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-6313eb7fb77mr800480137.30.1778241964935;
        Fri, 08 May 2026 05:06:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4b19:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-6313eb7fb77mr800403137.30.1778241964433;
        Fri, 08 May 2026 05:06:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6131c08sm4477931fa.30.2026.05.08.05.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:06:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: devicetree@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260407203109.34302-1-marex@nabladev.com>
References: <20260407203109.34302-1-marex@nabladev.com>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: lt9211: Require
 data-lanes on DSI input ports
Message-Id: <177824196296.236860.8799112140087444595.b4-ty@b4>
Date: Fri, 08 May 2026 15:06:02 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyNiBTYWx0ZWRfXxXNFBsV3nd3D
 e6wF/rw6Pyb43imqxXX0c1xqFnDN1SHbGnqK2bkhWAlkHBdhuQBCT7ZXizfk+4aU4G5jg+1sYVI
 fzWJDHkHJZEZL8DPfW3hQqK0ADb5SEj52ARCSv37Mnc8yfsN4RfdS1DD8NkHGmDbp+3qG4kthc1
 ZnomN8FjsQeJf3RRQE5gbwbl2rPtTBgnqzbITk3/MWXcsp+bfSMp+0XvbBuKIqq87uDzGx8DceH
 A0u6HJM5tq8gGvlp6vlZY8LaOSoqDy08bfV9iqn8ttXIQ1XMfffFvaXcM+Y0qdRHi3GFQJ5yU0r
 QDsYA8MpdKmbHpqcSXwPRCenNbn6RXibmzmwr1mNcOynv1C5nqZfcR+StuMZB96iSQXvjkDKga5
 4r+ZB5NnMsMdk4C4pDirFCVVUQx6jkXk1LcN9FtFuYAUROpiNnLekHxSJBThecnP9Tg6s+rzLOS
 puIbAtz6ZlV52arjfKg==
X-Proofpoint-GUID: O_Zh9lBool7bZL-MTUpq9xQKQLApUJRB
X-Proofpoint-ORIG-GUID: O_Zh9lBool7bZL-MTUpq9xQKQLApUJRB
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdd1ad cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=YpGkoaE24zJHBMRrs6oA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080126

On Tue, 07 Apr 2026 22:31:03 +0200, Marek Vasut wrote:
> The Lontium LT9211 is capable of 1..4 DSI lanes per input DSI port,
> describe the lane count for each input port in the schema.
> 
> For example Linux kernel driver does already use that information and
> fails to probe if it is missing.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] dt-bindings: display: bridge: lt9211: Require data-lanes on DSI input ports
      commit: c2738d88b624a977e42a1734fad4b15993ac354a

Best regards,
-- 
With best wishes
Dmitry


