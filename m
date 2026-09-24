Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E814438488
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240768; cv=none; b=oyEX/oEhaZyj9LmrktSg0DzI+0ghIN3FxcN+ohe31qkZ1U2eQ1qgHM+L1XbwcHWGwlt1RoZnfFJHsM0ORwUqoz7lwgodQXUxQmBmBaVPisVnre+sOg8qXdQMbfXv2hBe7vkRt37t+0us7hS577swuhuOcQWmzhjXSpr+tmIa14o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240768; c=relaxed/simple;
	bh=poW0PZ5zk0x1aS6ZoUJFhJMAlVCA0awRCniF7sN81mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nR04N593vhT94+tpzNRkQjk4u/RXhrNudaEMeZHEzQIS/kF8xljt8SYkHQQs55ldafuQBGORIRXmFi35Lg95xGY25oB/cVrIRcy/TFsugSxCm0B2TbQAlp/cB9+qM24HBhfdXkyZxspvLhWhUqkpH0yJC17IKQAXoKJCj5uOmtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTkDYGRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbedwOb+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTkDYGRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbedwOb+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eCAL1898619
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KZsUTsJlAuxATif6ogT+hS2X
	xr5/AGSAeT5fyF5OwXg=; b=PTkDYGRG4BI+pslPifUZbOe64td8IeHDTsLiS4qe
	llE5Tqv0ElgQ7n0ZJrJFsnOp8p/zzaKC7znWFI7TBfu/19UNhNxW3o8nBattTZhA
	MtgHYjji6URRqk6dQrSuxW2ZBoxS+I414jmtH9+KCfyfcPwR9J11OMIQr7cXWs+p
	hVF6Tx2iZ5gA9yvKcBfC+rLoR/smfgL+RLjMo4m/SF40WZAbTZMU//xmkhBS48+A
	dClHZ3lh9gaCzTOLMmMBKFYXnGBlNgOAPYLO//fJSkt1pKzrs9y3zZYMhHvN5uYG
	MQtkpXyC5zVQDZ+KpOWo/umG1M5Wdu8mh3uSYucAr78sNw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb64t4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:06:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bb08e80a8so767834eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240765; x=1790845565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=NbedwOb+mTyCXrSvlj2a1dY/UxCzuUU7N0fACF90kwaJ+kULhzRm+ZWpE73bSjXpB3
         0aKN5jQVkx7qBCCZAiBBjBgzK6DND/GiWe8h5ESnrrm1K79s2ZSuJ37hzGtD3wKarNRZ
         DIQxJ31EeNXLvViRDrd1jI+Ce4WrOBvPQH9kLfpdggwyRJbxPcDOTdSljxbPHmlEUDRC
         aBpvwpj1qviXpaJSFNVLtbw3PbS957h2c/gNBxRigfCsK8p2TFc55KDCQVy/axG9tnV0
         T6SDApPrSUCNUxdEMenUIeo91qLGrEsuNf6c2MUqtgJKMLvtz0AI64++4mlhs5c7V611
         bB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240765; x=1790845565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=vurdqsJRt5xw+UdMYV94xPEC/Q/K/5Ld6PlAqLPeTkoZ+FbMAaE0a930WiXL6VhmoK
         /75H1fTkXN0r7jzObT0kvQNPrOjqLd/kaFf3fTb031mZeRS1X0m1VqTbMO7Hk4yC+Oc6
         S6mYTqFWeI5UrtzHfh8kKd8Yb3YhLil3+pFzNVWrZgMOpGvdHvC2RLiN9IgajPQhg/2y
         PEolTV3K1fwqfHufcmvF2qygosVR8rljIc01RO5R/qGBD5Qcu96omIjF9EaSU4m7oso4
         MwIgHuP28Hd4kEkhVrbZFJpDtVN2syRSH5OiW5vNg2PCavGfnBcbl18Z6IFDQ5LBUoC0
         kh3g==
X-Forwarded-Encrypted: i=1; AKwUvBwz6d9/LQJTPVpXi0MaQYDCFtCZwJIF60sLZYJiGZ+vfdhUvDdZli76vJ52EOMia3O714nc+Vp7IWZF@vger.kernel.org
X-Gm-Message-State: AFuF++nxd8Zr1KmmNvE4o/9k+elCGyopvJfXOw4+NSDSSPRyfgkWv9Kc
	i7pMD++p5JwbyhD+riV7gLJwbjgELAWRWAT2BUvfP5txakrJ2OjFmF41eGEjikH3amNXXyh/o2K
	OdqEYY1o5/TupoNCgLrHegjd7pK38UlHMK4JVbl36E0v/OvpzwEUyaYypJOyDm0ox
X-Gm-Gg: AYBFou3Svc64uab4p66gIiZo7XUO2Ohx5FHSd0b/asVyzsqZb8a+zYmlCsfpR8fsDwc
	qVLAnstLxTeWP/W9EJbD9hg1+R1RM2kyNI2yGdWEY5NJAGt4fxVZjSYmcjrnzNKOZ6kzZenq6yP
	UEsIO1uS41MFoiitPUVwsly7RT8+VDh4aWp3cP0gyf/+oicLYRHvUB6mPdIxIAYwK5/1pfJ8nvk
	A25VC1ql2fYjy2e0d0zFg1M16XHqBmzsmHBA+eT1ljFMDXShMmuk75S3rar5uIJIHvbC0eYAvrh
	8d1NoYi4x3coC9q6NlwlMMIp+FY3NT6Fr1IBHmc8neVLdHC4yqT9eoqr16lqpfKCX1yZ7bcMyGd
	eSaJqpViWsm855Zom3QCpIQ/xHWlbN2DkK9VJgAFC5A==
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392564eec.6.1790240764521;
        Thu, 24 Sep 2026 02:06:04 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392540eec.6.1790240763930;
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm12602799eec.0.2026.09.24.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:05:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Message-ID: <arTn9HKZGNSUxt0j@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-GUID: _nAi478SXfGIuOljLKTSW5rGHBmhe9NI
X-Proofpoint-ORIG-GUID: _nAi478SXfGIuOljLKTSW5rGHBmhe9NI
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4e7fd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=geveDRkZF6hWoGEvibMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX4HEm9fEOl0+T
 oL5qdUKJM9u+xcud4PR+yuh6UJCZzL3NiMRgEEVSo9G/rH4X5OTgahqHrjXodRO5eYwPbsPwNe4
 /6+rOuYg9+K0zFn17rchdi3UQ/Rg4dg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX6z4r8ef/Ii9z
 Ho37NkNUTOWdnz0EKIkrhU07R+0m8dCP4iaDU9NhR13AaTVm4jj2NL9kBVF15Q3SUSOFFQ+NSE3
 h1d+F/cqdhJlb8k24UK22nt9Lcm3TvXCTYUxwgv2vguHOgHWKfpFUhCKLj12F9orY3LP8t7p3ok
 CE4Gzgg/G+/5V/MqAuwXp1XL7qHu1uZoQjxJCscT1aQVlQT6bBLW56w+otQXnha+q/VYAWklJ/6
 7FM7pGnLhH/lOCzqKFHnt0ip7lP7aYdS+DbH15fEWb+nws0SZX2KL8nt70KIq8ic5s+IZRTsJ5I
 vroPW4BHQu6ipwnj2vRvzY4WtHA5BayNGG4ro+FsiwWRUkDZGECCpy29ZNI4rzF8i+ti2v0C9V7
 XOH4pLwLbNoVydgxXM4u2GxznQ+r2uHIIG4RVYKA/rvbNiSSEwnl9b9jpDVScBB/sVYl02Xu8oJ
 LNdvBHpvsuSz0tvSnOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240038

On Thu, Sep 24, 2026 at 12:51:33AM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
