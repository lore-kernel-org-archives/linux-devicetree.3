Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBFB242D62
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934415; cv=none; b=mNoXIxaOWF3+VgvFY4XcTqM6dTioQ+wbFDGrc1zCjG11iFW7S+n+Arzt1muHpwMxp8eMNdlejZlB6u8JoIsSDu/tACyZl684+v61sphVdpj2HOvu37vP1EZD5ZeRfBKGNUPl0ToM/4DJctZ2KUQuJly1D3IehmcQnAS+mQQdUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934415; c=relaxed/simple;
	bh=tbZ+AvvHbrL75au5Rx/mr5ZMruUtLT3oIM+mD3Zyhuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feKZ0G5OIRGyyGGdI4DDIVPX2q/TD92SKughIn4w+JVbzseyC1mhQxI8pkDwTdLthJcdaf18oMTEbxh1y83VqM9efeYqnjJOcyGX9Vzmgt9/rouncOBvDfUkd5uTmbDOOuWUNtX3WO9CTZ/TK800XQG0s3fi99MHms+wwaPcI+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1S7IowS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJYkgVgz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1S7IowS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJYkgVgz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LkRst1430674
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 22:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fKsRobYlVid8ozPAY7e2ux14
	j9F4sny35spO5DP0VcI=; b=I1S7IowSpcYgHQ4H0pXji/mLJv8SEaDLiv/VUtgp
	/z/FvWfVv0fDY24+m0OZoXQnGzvajzffJn169AGtzLyM3aYgk0+JY8oMisC3Uqab
	bWlYwEOeVuHCUbGHjGJ7s+trig68WzJhmOcnpy9nfd0LSdcIwjhL8nLKt7lleAy+
	1Y7PVLyqeEz/mlIGlNv9sFnWvSi928tP8L6/O1Evjw59pso+RwZnnP21HLRQLILa
	TvY0lJPOfM6fC1+pWb+594MNE+eWojJ/040hW/3I3rg6g1PAVOj3xYFtAotXvJXn
	gS+9sKljpzc5TeA3mi5bicUZ16POTgsIgNeoR7iuIfaGew==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6swu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 22:40:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d25cc8f5bso1592710241.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777934413; x=1778539213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKsRobYlVid8ozPAY7e2ux14j9F4sny35spO5DP0VcI=;
        b=VJYkgVgz6MJWh9PtioszXFJubt2RRmVrtpj/4aoQaWqcklfYZ8EGy2Q4DPBKIq/Gxa
         SU4yCcBkvObe6uZS/3lhGCO/aVp/mH3oIhRHNx71MSjFN9ef9+hvsXatvMvLfyU68b5V
         WtLZutxx1KvRp8OLZSAP/6dNtDhptTmx/YAH2cNSYzsVkXL+9updfTePMzX8ODj+mOjK
         hpTPdjExpvE9Mv/xPEeOgOrFSK7wV4skfD/LoDLnDcCC/LmSHGMUmwPJyvnCyvU2XUQH
         WEGjEz7Z3XJoTFIVnEILoJLhT37s/bZ6W2lm2BqM+5Om75M0/mLWw7NRHYEm+RgVutMb
         eHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934413; x=1778539213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKsRobYlVid8ozPAY7e2ux14j9F4sny35spO5DP0VcI=;
        b=c3hUx+6RVzzf0FIWEAaZQnpZ2i+OPRwarPKJpG30G6pquLkg+KwsLDyVriGCOwHgFR
         FUOP0r28QayfCO2qOSz6MOto5PxugbWwqCqT9OMvcClNQlDHFxMrIpeLbriu4EV1cJ9t
         4slrzQ1YMljk2wZxrpge67PX7W09S7Iqw+V6HNYl0YyLix6dkTainqQj6zUXEZpfZz3I
         V9/S9SVixK7JUEn18E6a+xM379bbpYP3xOggjR+D95GFIp9Wwv0n5IT/JxfocXupdWNV
         YlHg1EPgC01iIblocgSzj0argQLHtfEyPYYuN29AukEJwrpHZ3ROHG90dFNz86NSEz5i
         LxOA==
X-Forwarded-Encrypted: i=1; AFNElJ9l3uLM6LL9/e11M2ujXeXObdhahvdJ8Jb+jb/tnJmhXaaG50JhB5nvcGA7linamkLqfCCNTjPI3tXr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6Pf/O36T87tNuLc1+vjuF5s38U+C1fe4tMiODH0QXhcYTXBq
	b/rPDyHcXWIKRLgDafSixOmDursOZCzYybODtOcEokRY6eu1hNiey4QQO5w9UR4mq9p3Lfg4xLL
	HIZXjalLS9dZnXV3vlEU2Kc/MMT9FfRCo7QxdmbZAbvmqaZU6LBituPxMRdtNHVeY
X-Gm-Gg: AeBDieuoyhHWzGN1E1/qR5pyIbf76eFJms3m/h3mgKX2aPtDrwrbTcL5UkFbWnzaiCC
	1DcT5i8fBKvGm/cNluQe/Ai0JiBf7Ty/KDGLF+/o2ywZXwZFlwfyGc0atkWfddjVnPmikN+QFtj
	BfOIHhgHngVk9B76ZnUOMAkjLOYMFTQNKvKpQkAw96tMPmQZnu+3Byf1g5yJM5VzudOPVVLLCQz
	Ztpqt135AnkpaC2OzL1JQ2NENnY6CZvdWz+PZ7gAgTvY5qypNOncMD+cpXfvX73qoZEfu2fH573
	8xjEKfqav4L0hH/uE/nS5QERPRD9s84yGxImvEbXdGvtew+1xj3dsuUP5DUdk74TRmElKps2x8v
	/1PyRvEz1KfmA9bFdihSgjqiaFYbqCh5K/6CDvn7Xsj49NyYeju52KMbBFyaa/hWZscs/RHuW/p
	zcaIFcoykwNOlfrGi731k67P+jzvHeESaKPyhD7FncYD0BFw==
X-Received: by 2002:a05:6122:896:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5750c6b2f14mr6080116e0c.13.1777934412927;
        Mon, 04 May 2026 15:40:12 -0700 (PDT)
X-Received: by 2002:a05:6122:896:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5750c6b2f14mr6080099e0c.13.1777934412502;
        Mon, 04 May 2026 15:40:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936108fb8bsm33734251fa.2.2026.05.04.15.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:40:09 -0700 (PDT)
Date: Tue, 5 May 2026 01:40:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
Message-ID: <6hygg2pm6fbp3scdurycihyov4ffgpkd4szmtjvwjpok7qbfk6@czbszxhvn7ev>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
X-Proofpoint-ORIG-GUID: WqzeHYJrBoOzLfl1Xv4LsvjVKC2yTteI
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f9204d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=t_WoDEAhxH4J7FjSGWwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: WqzeHYJrBoOzLfl1Xv4LsvjVKC2yTteI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIxMCBTYWx0ZWRfX7FpWe2eXP4iw
 +c3nwtWxO4oHGSbt1SLr4Mcplhb55R1Jp+QQHb2L6oDKB2vfD2wfVIp5lacIkN/gHEQWoPPRJ5W
 eeF7YBbxuxK/xad7Uke6lHbAaQ392WdJTWdZUrk6sOQ3C/LOhmpaNAqaC9rJkkdpY19DUeh7SdX
 LaDsPZKmxCTHbKGqOl7JAJ+A7ikogMAdBh8fX5iamylgCbWpcF9OhBA0wOUPipwCPpKAh/isOrg
 gb6hE1/NIGNGENWLSapd87phQS4WzA9W28RzZIzPCdN1K94h8evALFsg/IHaBIVgBXOrBASMGJZ
 27UIjb44sFpA5KyjEmpE6UqO0HsxQCGV5y4qb7oewNMjOeJTEHKt/KO9XCfyGWAvCwTQxEGOkxK
 XxlPpVYYtv9/D8lndMHzJ69BkSYqcsBVjh2yFHZpUeasH5PONikEDz5dZRcCdyJA1LEZQfBWlJC
 rHVnxlCvyWI7RP0NefQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040210

On Fri, May 01, 2026 at 03:52:48PM +0200, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 

Modulo panel's compatible (which is discussed elsewhere):


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
