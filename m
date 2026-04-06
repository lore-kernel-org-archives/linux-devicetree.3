Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111939E6EB
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518950; cv=none; b=L+SUOFbYWcOtQ1K+LC40TcY+BelduHSKQts76Tp2vaBWiB0Ud85vVejmVdcYhRkRKZeDeqvM65QOQeb0V90fne/ayNkIOLTOh5EAVjpKYgR4upVxDlJuyGaA+IoNeeOM7YmDK0fiVJvy7/0IBgKSEY86cGyO/w44oA+JOMUkyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518950; c=relaxed/simple;
	bh=NgT/+YLKkUaacSBn4NGV5ooSuOmkS8Zu15O1bETSCuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ns+yQCIGKLBGc3UoXnPwIPXT62rHbWp7ZXiwi5agailqgS9rKAev63f8bmb/JBd98kiijC9QXHFm+llRTk+l3HsV8OKQFnm+d9uvhl305nTpz/v6LrPkGeFhThPu9SgYgvp0g24TrRXZja7s0LMdV4FgVbyPang7r/qujN7fiFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eac2oUM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP6d4yQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eac2oUM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP6d4yQr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LRa062009139
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 23:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QBNE/lG5K0Ju1pitUfzLaBUYmxhHI5uWe5vz/3zRmFA=; b=eac2oUM+YcUi3qaJ
	xAKTj6SwR631NEjwCDf3w7rDOZTUi4UWjQtuFG5wddp7UfrY+GizSmADeSGDDD5l
	Nr8/Qd5G8eQlIS+mioVet+mX8/5I2QlOOMYdgabOlH9Y5xolViGB5LobPBAOmYMo
	hOx+7KtGJomvO2/cFjWVmiinomKWjvm5Vjz4qbqkSs/zzPmQrFMO7U/Os4l/Pgf7
	fvwQaklgVZcbWbTpEXw5WuKYDa9OWPtLrkatlqOYSkOPSX6IxMCW/NR29/w/VIeB
	km0S0Wba9KqwOpMLsmWOvAHB2xZbDwh7NL6npKJ996gC7la9H2/U5OGvfDM3GZuS
	MRYwHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrr8j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 23:42:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so201979691cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518944; x=1776123744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBNE/lG5K0Ju1pitUfzLaBUYmxhHI5uWe5vz/3zRmFA=;
        b=EP6d4yQr/tqBa250KLODQGHFdyrXuPBVub8oOCeOgbjX89wiPE/rAwahCXQAt4kvo2
         ta3okQlmD0SmqdPTn/LCKcOPcJXGR+qqX+moBSvEgT7uMrjqUFVC1i+Puct1xZqwLym9
         Icn6GsaKnKwxrCVb0SwmxP5urHbvLuS0lY4lkeRvehWbqgZFGnL2iRtYncSvU0k1vExW
         A2K6Ibh4Fubg7KHvkdp7SR54Pj0HsutuXw8peLU0SbzFuyuuSpDMpVZiLs+doUUgq+hd
         ChOKllV5Xxd9o+ZMKWDWNNb/JJgstX4+g+DJrF8r5yfBhny8S51Fg5AeuL916k742jec
         jWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518944; x=1776123744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBNE/lG5K0Ju1pitUfzLaBUYmxhHI5uWe5vz/3zRmFA=;
        b=NUPPV6XNc87JeWRC3B1e3NjPh/H48Kny9PFlHBuyqqn2nzG/CSymwUlW40eycECFKO
         NJbzOAc9Gu85AzSbNmHYOTPxsV1ojArft06W30wF7e3VgQGX5u1kW93sO5R1N/IWYsvg
         SPn6ckux/q0mqsDR/6CsVNhmcAl7E1mxcftGZVpiRW/K7mbuRMAlvUBaAKGnnl6nCgRs
         sGc3zHMzLh0fH6iSFe/YXAJ+/I9nospjJs2snmafZmkJ3j/CT/y4fjULq0FHc/8GYgKD
         Y6H6v+yLSk86rIwazVbd6mjeUL6qw1IzJDkMVEuUCXMk17uzFKEqAXwKAaO5KAbkvNXI
         93Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUKaNWeEmWtGFMADKilgBfqjxSLMYja+fFcNadPxVwtBBH/P2AWAVqkUCthYLNIZ9pYgLfBGQs8FKNT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9cVOxpjj2j2ExOU314A1iaE+WDGP/gg2KAPAny27jK8DoFi8
	PmwCHHMJKrfEKXUBTfVTWeWzdTkLsWuFHFGlnrOj5zP5zMDEhh8fz1Y/FKWItqlkuZpxidsp6uT
	387rYNg3XYo6zifL8ohkATulsPaUWqogREYFRCpvE2i/BBvhQkZvdWQCJ/6h4czL0
X-Gm-Gg: AeBDieuE7EcZ9dkFyGzGfMciiNAq0hDMRbd1urnNJnjmSr2noMxWyzdCRLw9/VnTUTb
	1Q7LFlns+PKHcptoKAbapH/BAmjzKl+2P5QoZ7JrAM01nGNHBy26tMCVpCOLwSx+J6On4mMJL4K
	U30w+pdoZLSrgGrCrqrESPRFquLg+9f3DsraPBlOFels0FgCdArOnVce5Pwydvx1uaiuS6mxffk
	QRigQZ4jIC6hVFbuSMJ81Ha73mtY6eqrZFIlDf5MalipClOARlZ6uOE/n85ei9cJgwwWMF1xuwq
	MBM6PPTKCSVHWFBB1gK3MIu7MEVHzNfddFmbj1rxeqaLqo4xT+vIGlFnESz1sGYgR1Th2oc2fcr
	giUzGrVBqHIYstvlmBkEo6LxKCoqpBp/swaMz9kNBAKCHOcz4IkSReNpFjSfZq5+DV7tiEo7hqe
	lPcaPW45alyk8skwb+A9bM59JJKetoaLpCCSo=
X-Received: by 2002:a05:622a:2614:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50d86cbdfd4mr114591461cf.7.1775518944407;
        Mon, 06 Apr 2026 16:42:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2614:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50d86cbdfd4mr114591101cf.7.1775518943948;
        Mon, 06 Apr 2026 16:42:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display/msm: move DSI PHY bindings to phy/ subdir
Date: Tue,  7 Apr 2026 02:42:12 +0300
Message-ID: <177551403338.616257.13801012061085104397.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
References: <20260305-msm-dsi-phy-v1-1-0a99ac665995@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfX0IoIrDxUi26q
 R7nO8q+WA8lXNiqlKF9LZaxB/epyX2L2HAYgJdX77aS1NbbnPGuCCopqDBBo9tCnA2m4anSbs9m
 NaC4gmrh7Ygkj86i7kT9GaK03unZQqhfQEByX3BErMZMCcBQmKz4sEeiJlCsvsmb3ajh6v1jvv2
 t/y07EpyQjrtfys7Z11A2nKDdWik5faEuyAvTvYu1SWymIP1PrLp7dezwHPlGOQ+0HPRE9+20CI
 1krFl6MKouY7kbW66b5AcGeFMpBBRgkuwcYOXujQNUXjd7APJwfd5hzYWweDYMW1XsIeAmkhbqK
 Uamy42oH7XwxR+AorirvEMQ63rpfHallcCSOBoHu7j3yj9We9JkKkmtgPV58FGvzuSWOpafcgc2
 /xUcP3QYsoZwjuSYE3o3EYPFmUly0rPo9I0B5EQsLfS4f7RdjhFUiuw9kyd3x3Gz2GtfI7C7edU
 gEsnsx0HDwLJlXkj3MA==
X-Proofpoint-GUID: 1unNNkjCtJnvC5TMpkq3cBhwfwM6ZsCT
X-Proofpoint-ORIG-GUID: 1unNNkjCtJnvC5TMpkq3cBhwfwM6ZsCT
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d444e1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=jUgDIxc-ftyl2Azd1b4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604060231

On Thu, 05 Mar 2026 01:47:12 +0200, Dmitry Baryshkov wrote:
> Historically DSI PHY bindings landed to the display/msm subdir, however
> they describe PHYs and as such they should be in the phy/ subdir.
> Follow the example of other Qualcomm display-related PHYs (HDMI, eDP)
> and move bindings for the Qualcomm DSI PHYs to the correct subdir.

Applied to msm-next, thanks!

[1/1] dt-bindings: display/msm: move DSI PHY bindings to phy/ subdir
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f94aa7e9cf68

Best regards,
-- 
With best wishes
Dmitry


