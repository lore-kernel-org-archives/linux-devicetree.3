Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6A3B27E7
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486218; cv=none; b=IJTjHR4KamTAVoAEZnh03ZFjCalSJ/+pYa9LuKtiGftvU1KXaWVBmj/GU2Z0HL75ALURYfX6h1HMlHI/VETausBpOfShYwotA7HKytT4MAEuSnEspwRyD2aKtFivYlSM4n7Xl6azP6VPfeYDcfZFP/bauWoH/wX1gMcryvpZPZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486218; c=relaxed/simple;
	bh=u70zE9kKbMu8cXkcrneFHIuTZ9n+rPXq/dVjJ9bP4jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOUT7XPNec9el86EbnANBWoacBviyT+veZUgmHUrkz9wGGHTbjub/M7ffWPu0rquZtlurcvtTSvtZsRCgp+O3Gl6JUZ+aw2Qscf3B3cxX90V9y0nixtojk3Q+yHh0mvuBfqnqP/Lgjkhm7TOS3Q3B8GB+vI2IptD5X28fFuHkNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwwDwwZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5Npoh3z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwwDwwZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5Npoh3z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gWYX775035
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Edmbg0v8IiJzMS7+pZj6+O12JMZo1DqojeVoLzn6d+0=; b=bwwDwwZkN19D+dg7
	Qik8/CgVd7cIyqU0UOPCzEc/Eu29+h/67A/pWrjZNsY8tayPTDjBCAUO7KEo7a/k
	D5LeIwhJk88/xoNslggq/5W09RT/ugioF4GNw32Jj4ZVDRbB6FZ5w/ZzqVMIZg0d
	hB/Q6kGrgbozOdQbqz1BzwGP5i98MoiVqQQRGMuF0UtAQJMM9REHLjJehnbMwXOt
	+ElcxCGGfJwGOWrBsqw4xYUdnh62Gq9uCV8W+JMLlNyHA4h9sjpgYaDstq2K+yA2
	DPVLWI6ufoTiyYte7XssBqedVBxKJxoLvAxH1TRl7BqJ4dBTUKFXL4iZqR5bAUIZ
	qL4qvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32g80h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:56:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0edeb6so31797491cf.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486201; x=1779091001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edmbg0v8IiJzMS7+pZj6+O12JMZo1DqojeVoLzn6d+0=;
        b=D5Npoh3zkYXz0YdSiV/xrnNxejxmG4SLbuq6vIHuz48W+cnLmCs05Yem+fXbCh7H+y
         FjYt2ZsCC4TqSvJM/yR3XN/8SQqF6tL8EwIqSF4S7trM5orsWn1G0E+0gXs67ACagu+z
         5jQ0luvExa0b/1V4YRP+YswU/XCeFB4xHMakopQs0/bsfo6FAY/hzvB5n2+xogT8AkRU
         pYj4e0teuf5Iw7RoIjb2DJYeXUkbR83YhgLauVMO5VaTrCSkuE6HhOZJO59xJGGlpn0j
         nZBFWxw0f84BcvTcd2m2N8nk7VueVMBWr5RFoblkgWYnUl76SVOl92ehH3xR7ldd5QEV
         K+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486201; x=1779091001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Edmbg0v8IiJzMS7+pZj6+O12JMZo1DqojeVoLzn6d+0=;
        b=elrvOrDyY9qE29LC6qnaLUMFt66+TxjHFvfdRk64Q7ZLGL8F/Uegj/7IcYG8auBleJ
         Gz2PUTq1APxNO50U78BQzwPY70JnukJPkyc8ucdxxbEwenedQk7n2BPh42A/nOSr0I7J
         TiERENRjre9f/lGxR/XsViE3R+JQqjfJ0USE+YJowIJnyqdQ8FTo9ndjUXk2LPZChcnv
         dcgNVpT3jRm3qyUtlzcb2bS3kmbbJ2lNTLClh88FvhrvCNu1n+ST9E/tC8VvAhzgJt5h
         m4b6hUpnbQ7C4IakitoLdIRtSVN3y4pdLcTyu2C2qV6AK7KcrX5actoOQ9k9rtdpLQ2K
         P/ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EsOpp0a7q9qlg5+jZQX10+Ql4wJ+m7dINgVSbnRTB6bGC50gbh7DjC3WPUYPJmBXGvFN4vMtXnuuG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5UboeVmliFB2MbXbVcxJgANJpv4dRz3y3RhFhaHtdbFZQDDLy
	hEmolJtXOd9rqsgZS/Zx8bi1pMjVLrfcBHnYOn8BENmpYNVo7anwuj4qPyOEQo82Sb2DyNoo2EZ
	+UBdrJzifnKmfhW4tkXPQ0tl183yg1JXvvrq+mT/POqVmdFPNc8hSuYGoX+0YqyzY
X-Gm-Gg: Acq92OFwUR4HvbastomemqH8xQ+iACp1qVmdaIGKGrLzSR106sSS2wgC8Xzac1y3KqC
	1oV0JFaZ627WHkwQt8Sy14Ns1hI25kAlyuTVKK6+/jJ8DbhQknJRQX4tzu6eVr2pnRtd4VVFGMK
	wferqt6n5QjxYMf4GWhUXRnMB2v/5qFcuW7Rk9ux9gG9KbUd9qkPd7FbmaOfjEarKazRRPX112I
	AXqvT73nCJNF2hVZXvqFyerFaDQQQkFLbJk0Sx63U+Dw/vMOG5mDYDnHw0wW5fJSgZoEak8NScw
	wjpLH4rIoIHXA4CNrEoiG+cjFOoXNsuSL6kHLrzanFPtdBmmchBmXEBrt1eUF8DtIevxXPNLigR
	un9PIw68NvF9TcmlGk7ACGLSpG7rI0UKOICsY8ivRg9Myxpj9wQ==
X-Received: by 2002:ac8:7d03:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-51475b70afamr199095441cf.12.1778486200764;
        Mon, 11 May 2026 00:56:40 -0700 (PDT)
X-Received: by 2002:ac8:7d03:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-51475b70afamr199095251cf.12.1778486200306;
        Mon, 11 May 2026 00:56:40 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm24431737f8f.13.2026.05.11.00.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:56:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v5 0/2] drm/panel: support Waveshare DSI TOUCH kits
Date: Mon, 11 May 2026 09:56:37 +0200
Message-ID: <177848619477.10327.8599254658370877009.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
References: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zbAYRI_Hei6lZ0uoAzvzP8zIYzDFhFK9
X-Proofpoint-GUID: zbAYRI_Hei6lZ0uoAzvzP8zIYzDFhFK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NSBTYWx0ZWRfXzoF7kyScDYUK
 /Z0t7iK5+5R4ha6y6bjslYFSuZnmW5N+foJFKfcafN/+lSpwgnrUF6341BVsyMwzAuNdxxVQNEB
 6U45PDVKrqAZtTfz4yo37K+G8CUxG537AB82V3rn6zsNw3IDJr1A/POjfGn8kvlh3t4sUvOInbh
 MMZgrxCJuUYVaDQD9/CBMSDdvBNQua1bG8xwIgMQFFdjumBLtrzV72yzes9/1QZjqjK9MfZUwXp
 GBoQ1hIqbf3KnuK0CLdgbURVm8eqWAGyW92Pzlfh56qSTP0JdgIkNjC277V56KSr5E9UMNx8aM3
 BNBUIC4d5wgCMoIwF4kf8oECBpYBXUdkgPrRzEKt5zTwA+myPjGLQC+8LnMaprWf1kqJAuSCS5L
 Cymb5LcBRpauBjog/4niaJ3tS81zSl3Laah4ePDfBzYeX/5E1uu2ZcJwbX0HdSZDZ+hyi3SLhb5
 +Ysnx3mDLEvKS7zs92w==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a018bb9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bE_KkYOeAPwlOS0bxDcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110085


On Thu, 07 May 2026 12:01:31 +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
> video-mode panels, bundled with the separate controlling circuit,
> produing necessary voltages from the 3.3V and 5V supplies. Extend panel
> drivers to support those Waveshare panels and also add GPIO driver for
> the onboard control circuitry.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: describe Waveshare GPIO controller
      https://git.kernel.org/brgl/c/8cd19f5560218bf263b8ffc622ceb4bc329b3bf5
[2/2] gpio: add GPIO controller found on Waveshare DSI TOUCH panels
      https://git.kernel.org/brgl/c/79f44c8acfe66ff8cbed5626e2535245cfcf43cf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
