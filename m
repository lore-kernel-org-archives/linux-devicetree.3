Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9FF3F58C8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996794; cv=pass; b=SbxoLj1lDvonabCfbUTfursJ1qCsw1JYjTruAb+Sizjc2O+bCGICzluyep4rXnWqnINbt6iLpLwn95Fx1bkLWspyN10pgVaPX73DAew40+/VDE0TOzYSw0vht3xsyK5Ug3F5exT002gVwq15v6U2+XhshBfkwXoHByPzdc4s5wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996794; c=relaxed/simple;
	bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAT8AqsRPtxzYcIJTfs0WzzkuuGVHVjPZp6lC3YuSjhGoqNjg2armO+eGOLWNp8sK7VmvSq3irk56wohaGqwE0rLJGV5n/crrV71HspvCELrFf46N74GoQ9mDkF+gegyP1vRFnwd/4BBCTzBUHBnbLTkGwloW73Dvo+9cgEQnZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSzRjhch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev461t23; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSzRjhch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ev461t23"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rgrI2034885
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=; b=dSzRjhchuv5J+lA0
	VNfzn1g/9zxFGeqrtj10w6mP+5Vx15ppW68zOAui5kM3IYYYrV/FVdhtdtFjAFNw
	Njo90gM6dPM/GInzXIdglHf2hVk7m/0SsMXmLLN50m+xjjCceihnhGAUlzr7AMtR
	fkz+GgyVYr3L2YD0dF61q0U1D4Kg4JHF6Qlk5v76WGgPnlfPZXMQNKfBLBkUAXVN
	hlsViLtumFWLgxE8/G9zq0IT+3pq3YbcwZ30UlQNaQ3FLXC1Bg7SreQ0tB6IPO6Q
	+uJCXUYqB6O93OSwbJuHpNx5SKbI/RnTF8kpSvscvF1oAfroI0Bx09Ns+492qPd1
	ICzikQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearf0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:19:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157d38ab37so614429285a.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996791; cv=none;
        d=google.com; s=arc-20240605;
        b=d7jvGsDeWnhC9HpizArcL0TDc5xFdPh5Pregz+hM8I+mloRtTDacV1IjEAFg5UbwDC
         HxWBAR+CXCIuXHndmjs5ZOGraE/8Gi2fDIlotIUN0rRD0FXXcjzoiDYtmKj+8lAGc6Cd
         0BnLuuO90j8rdexJkyXAsiEbK0Dp4DoSZuOsmwOhfsHxarUtNqv2Hzmnf5drNx9k5ayN
         FJLJeV7wrjCLcNLjQLKWqiIT4Q2d+sAM0OkCNbC/hX0MrjXpCemByMS94zDMORwZymKW
         EKrKaopZ0BL9qywS7z6l9Bna7veCOgWqxjQ11+zi7xtnM+tW3UiAVp3X6BA8d232tCth
         hneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        fh=AbmXOnOTO70eJbgr+mwi/ISlAVPCNBw8MvZJFeIjKfY=;
        b=Ya2vph5SNdsv/M8HWs19aK2HDqdWxOTthaa+A3uunmLUepamq0F7EJ4ho7wyBLJgaA
         ny12ueMf9aYEHi2L2m9QTHWJ/I78YhX/W7GOp7v9V7aYnV1wtk6S5BcMWCbitWdlaf06
         Xr9qx/tXuAE1aQT8wbsckeacAMsStbo60XCMsHs7kCGKTAlOUYyOnkQpLZMGMQCs6sLv
         HFF9F6s11wzpTQRRUhRVgJhRRDswKCHYEt0smGJXFerjaBKBnYLR8EekxwoMYAgZfuos
         pABHbExq1QDjFcOPbo/QVhkY9ofQn+urRr96pax26VNdd5gLTEcg+zk8YufEm1m4imPU
         mYOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996791; x=1781601591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        b=ev461t237CfjSfw4zZBnCE2sV4j+BKrdhdFtWDdCN3b1mZ3MO0arSmlkSohSiXOIa4
         AcRZZqqIPtAwHFQRkzHMFGeTbiz28rx8an07uLQSX2w/if55sGR8TJ2Ypi6fkWfPOTqH
         Rr5hlNSoCEfJxdI20eKQlzc6xbIM74kLlB6mPhJrbJBJSOjMxNiu0ST5at1mXUbALXUI
         hxDzFcdyY9MIKDnfSMqtaI0JmPRThKyi6xyps7omOEQJA0wt25sigFuzILTGEqsM+bhf
         pq0WYWEnImvNXWleZufjXVsg5m9U9ieWo5fwSIKjX8mtqO7v/qLcTAE5DW+c9/34MsE+
         Zlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996791; x=1781601591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        b=OIYMLaQ2XQn2jtz84n9XnvJlvqlqnUbvdKNHH4vy5O9RXdiWRgHgXJ/4P/WMbfwC5n
         nAKuq49Qq/nz/uO4m7N20RjPOhj/USSLYSjguFi7CliPrbtvvyAjJ//sDTAeXug6ZUMi
         xFmVk6Z8uXHci4H5Y8pl91glfhE4bqxFWtruRIE16S/woxleZEpPYh0mZaStjbrusjXn
         DAjNb62YEdfzgAYFNEDKO9b9FrLH7OLOXZWWqJzGvyUhscAOCm4qmE7hG3g764ZJBNjp
         e9ueE5wBynG4H2fUsy2zE0GzXD/i7A2QhFYYc0G6BHkReIPM8r0FvUzqSSaLuLE+AHyi
         KCzw==
X-Forwarded-Encrypted: i=1; AFNElJ9uk1uC4T/GjByA+s6EaMtQ5m9kBXKzAzp+rNGgHuPEVccoeHxrM6ItBK3E/K7aSVkeHh1jbCCi8wW1@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNV4WtcKSKBDi5G3KUqPI/Xj68GFFw/XW7PIrg7au4qRKsjxd
	N9/MMeg1OcT329zJi1bYSQAdhcGXNfMVfltBYX4f1e1ALiQEUDAgbDl94t7THUUEFmdeC8iuFME
	nLryE81nOpDgorGmLaQNKrX2sqXQCy/Fc8WlWfWka3nVqZ6yZM9lXUj42q4IbI03nK+/PsVNc52
	Jz7XNIo3cKSkwDtFGVK2zFaLqLqCsb+SsopdXbxWQ=
X-Gm-Gg: Acq92OHnXDLzaa6QCf1uOvGVNJKX4Vl7nAN7TTeB6tTeYnph2UCM4YO35tgIAtP3sdZ
	8mKZ1SL9/NRi+wzf25MtJ7NsZqlEnEyvjz4V+2TFwx+d2FbuFpFjHZ7RaCQP5s3/ImyISKWOrzd
	HhI7vg962uG4IW2Yx0Cc2MJ4NA7hBlgHtEHS9oaCSBMb28WJroiT9Jezn0Bdccxo7V471qjLrdI
	Ni228a9cWfvVU4reD9gVcx+U9OrkpzEJUb1HVBb/AXrCjV0F1ZQ95AadUCN9WqXznthi2YxRmZn
	UX887/AVGLPIAPEzyQ8H+2xKjZo72/QR
X-Received: by 2002:a05:620a:4590:b0:915:89d4:df22 with SMTP id af79cd13be357-915a9db5d00mr3035342985a.50.1780996791274;
        Tue, 09 Jun 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:915:89d4:df22 with SMTP id
 af79cd13be357-915a9db5d00mr3035339585a.50.1780996790847; Tue, 09 Jun 2026
 02:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com> <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:19:39 +0200
X-Gm-Features: AVVi8CejLh9w5S_OQ6YRu4HaLtjG5GDBpmdR78mQwKNwD0qnxyg2L6IjHLml8Xs
Message-ID: <CAFEp6-3imORRS5FqjTMYV2zOn+bpf54uwhf7Fy_4-uTDadtAxQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 5eYpPJ6o-ySthJoomEbZWEDgZO97A3y3
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27dab7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=h5pAuauRZTFNeIU57NgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfXw1dBhkjbB2pM
 OVsx66xrm/PfL9csNdnYuRpEnqUNF9hhzYkzkjDOglvvvPZauQCAHr8DLjMMGrLJYjPGZ4wRWrx
 fxYtZ1EuTejw06i/ZNvSDazjqSerOuVoc5OOyQBQy1OYeBJGRZE85EVQS01KQW00c2PXvJsduAU
 o9h6jdq+JP9gomu71xxW1uHQ1DpnKS2TEAYTRagAcTDHAm2vKpEzY/GFXL1O3hF/c0a1JrSl/fj
 hJiuaZfRnDvp6zT7fiNPmyaKBYvWoW+blrUUenxiB0IL+JZ6lH2Ew04joPcG/NUhjYncl5NEoWh
 pCbPzqXwolexnLJLCp2X1iNyQtP1QHKSb/BBXutH/ejnoX/OzTCw4AIdn/GwnqGtjFHKnHkYPYp
 z3W+KNRmacaMCNbDKj4lqtfcweaYBskZYHrPL2RkbVLIlPvF9mZkTN27DuCLTRv2LPWMltUkV3G
 0Eyo9Uu7ijWiUdIDU/A==
X-Proofpoint-GUID: 5eYpPJ6o-ySthJoomEbZWEDgZO97A3y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085

On Mon, Jun 8, 2026 at 9:02=E2=80=AFAM Nabige Aala <nabige.aala@oss.qualcom=
m.com> wrote:
>
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
