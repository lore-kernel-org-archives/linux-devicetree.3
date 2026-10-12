Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECCC37B003
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813707; cv=none; b=udnnXAJPjS6sy9W0c1RCtFVw0PM31yySAl2QoqhYDROfPbuIaEfib8rSZ201gRXASEVGz4nDd0Myd9vXn7RpcJWG6uJx1rmlAouHyNIdtATIbW4/eRZ0GDt0Qphn64oj8AR7WjL4c77MevfWCVN+2MIOq8c4fzZWP+OqaXJdMLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813707; c=relaxed/simple;
	bh=hBuZaHp8TT2tPy9sHVBO0/9cnj9TiTeTGPgSlxqIMCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k14CjGPdtje7Vlu94rYRc+pMAGaldGXOB0jdZEZFQofMLcdjPCiBZpkEPklj+Ouq/7db2H7qnc/czoYlUNXfISbZwePODS1rdgeoBUD14/+opKZCqZERFzVEtNxwDdnOt75Sz2NgMqGdSN+hPI3dy8Zcc9ySw+fpRTTFyJT6T48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBHn8v96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSy+atrh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBHn8v96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSy+atrh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Jwu1236677
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=; b=WBHn8v96BmySlV5J
	ZcckDIJSs30babgz5DeWI8UxO4Fbpnv9ogSFdB7qLcAIV3YB3+Ap7BlibnqkLD0g
	SjCknaWTgwahDtDy0tcBE6QI96oSdNq8/npREjQus2oK9wJfsFW7Yk5FQr/R1hyF
	YP2Axpl2uoRMABKagAvmxB7AE4sYl1/1u+L4hVOzwOp8Mh5YPXdrPhhOdvpqCP+f
	v7ck1UfANyawbtUZA77n3LjwRyP95n/qGTkJLsoyQtkLRy4IXCMDlMs10Kr4oR6E
	NnH25tD2zQ3Nkc3Tn/HYc+e/HWOYivMIHz8lU1JchAKhuhvVldh4fpVcNvqmNGqN
	E0wP4w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dk9ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:01:44 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5d873da8093so38127e0c.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813704; x=1792418504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=;
        b=kSy+atrhOAXTMXf0X4LXQHYu72SY4umpVLmkvBjwVUlmLyPxvI52K7WpmB4yKYa1z3
         3d5r1Pmjl+zILPIZVSY5mZKzVpfPBqraYhimOdfHvsz0Nd+Cfut+hPjtqeeVQ6zlzcxp
         uc+yA49erFnM87oxfyhETcN6vpMi6ePyTpAdwFtdUwU766SHK0kcj5fK/1cy4Q8gNyaL
         54VTtJo7c6EcJNxcwImBv7cYL2bQBSgZFT7EZrGAWpeq9K/dqq88fAncyvS5mtc73YCv
         lag+zcPL+qj60mBryReS9MCLl6dd8etknsBFLZAI66RSUAJjMEUxfOCyebSlAkIYmfEy
         5lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813704; x=1792418504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=;
        b=D49vxcOZBc8pljgHbZVBkKFYFoHRpcKIyU6I+mu/SXVGIfYpNVnDPMmhz/BWMZzC4U
         eCAHi+BDm1r04T/9o46pRQ6dhP4/CFTChg8R2UXV1x04ugU3s5r54qs+rCS9/m48Qprc
         k56HOTkYeH9YWXClmnJpHJtKcPraN3UMThXysLwJTCLV2AVu6J0xnXJMZlcchti/UMuH
         OxsXj7a/gZsjjTO3c4wyts2QJHxSXEGI/70QMMHIVjmp8vP2tFFpTkjr4PKtUHXHA55L
         RP9Dc+yJZnX+oYMO903omppGZV427PUUhrq3S5hdsXGLGN8PcL9Nev2Yk7hUgD/vl9E8
         O/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBxOUDygtt4DWjZKIdw1tfo0t6oUaQOA36/ILuRBDIZrv6GFUXXMg0TLMIRlzmPV6E6vhA03qxU74Etn@vger.kernel.org
X-Gm-Message-State: AFq9FYIC9FFwT7RLyKxoVkAcs4bE24S0+W2mhizgNl0ulsTODruH9fE3
	KSN50g2gUmXiX2g6XpLOUJh0nMgSa/0VQUbtKjyO+ISlzKktXwGFjN08qCfWyKhh7th0YagTMM+
	ICEczU1ziKauoqnyEtQ4NTkb/0EnoMbV586OTab1+Oilmi+52syl6UtRUftAvv706
X-Gm-Gg: AYBFou2dh84q9D4SfkZdCSomp1No3uKEarHo9MCZUZ84E1vvlKZnurQen482xAsJcyp
	5+Lcw5OackBueUUKHZHO1hL/xSw4jfNLBORyfqazbVkTwpSLxn1VjOh4BTUpOxRiDqHdA3NJ7h2
	nJC5kXFTvOdBDdLr/6Dz6whbCeconXmx8trW2YaXxN2OgfAPHll1UfAg9nLjZO8iDop0m9Owe3c
	fmEyzCH36seakobDyEZAZSSN1+CpIJb32F7fnzbVTOMzFTw91yugkhYbvtCnYS6Zd7D2wsk2R60
	n/hqyA5rT7FQ3iHrWpx/ZHYdgQ6mon/DttMnAlc84TiwoHvfAD4W9y/m8rDpt6SlT4+RN95ob6Q
	XLK4xhY4+vcUKGiCHlcQyVA==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr1786276e0c.1.1791813704135;
        Mon, 12 Oct 2026 07:01:44 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr1786149e0c.1.1791813703157;
        Mon, 12 Oct 2026 07:01:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c338d5b170fsm237486266b.75.2026.10.12.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:01:42 -0700 (PDT)
Message-ID: <04672b02-cdf6-4719-a17c-4f7ce95a98b2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:01:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX/C0M3WH1kUcf
 frSJyOLOc2ME+d9pwaYl1yiA2Bm2BpZl2ccWYKzZQTCANn1+3GkH2WniVv4rUNmrGA0V2e7pY+0
 Fc32glg8KRdlj/pOXyJSKCWThzATEdGVohIpsQEA50DREa5PCxja2YTCGcn5hK8nDqr7SzpAMYn
 7gBxZhc/PapG1LhjacIvb8dIbCB8MQ+H1vPbEW5R5vq/2u/5KefdjGlr3rN5VsE83BCpeN8v90P
 3UW3C5zYOi3gMQA/s45DJBY8E9Do/11r2E5glFDhc3RtHbBdnRazreK1Qodgd2KSsYNa3fNDP8x
 5hd6EN4uJUP1gAItRYfFZUlXoXKqu2HF1L6Bb5QcKDNI7CZMfNs2yt5ivDsujdA9uOnNAKbep3x
 NrebSxXUcZualP+cfRHJhp4a0PAkoxua2MDOxl407lv7Df3MGnyn/mUr4NDiT/aGN1LpTfGxcvZ
 35H8TZ8jHhEgWBifyaA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acce848 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rMXm0_BZOgqvqhzNPSsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: zR7jUrkW2Yx9F51S4h8gmEi_MoV4zFlC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfXwQsC89r8Lt/n
 pioILtmlk723XpHJf64szGUTi8yBtzq9vZLE9CkNZq2Ts2gT2GmpQ75U6sJG0nIPPQ4oC246cfR
 8Xg+i1xedu/iPkSYG6ATkLttFtK713Q=
X-Proofpoint-ORIG-GUID: zR7jUrkW2Yx9F51S4h8gmEi_MoV4zFlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120055

On 10/12/26 3:32 PM, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the Nord DP desc and compatible. Nord is supporting the
> four DP cotnrollers, two per MDSS instance.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
