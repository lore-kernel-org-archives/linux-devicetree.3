Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EA4CCDE5
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201597; cv=none; b=sb4YHq6Pg3EDqCyUwxU/GRIP/u18IRgIXvkpGUkBe5VWfZFLIo4mYl+MRtqgYRJgKpT/njGd49PQOElVjsS2liif+5Qt2wRejkfEsLeItzei7lBJ8xiYfyBRfp5GbtMLpoM4IGBT7gTgKGNL1se1OytLfCZzfPQvtj2cs3FZcT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201597; c=relaxed/simple;
	bh=vSWGgy7165n5HscQuY4VoJZwjj7zMUN2+1Bm5U0tmng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qc1xfhY5Q1vTgyQ9aM076LM4vu968WDmUJxd3SzpZTnRoQebvAU786+TkecMFBnU5hbVZluQpwcD+5YpgxWFukr50JmGH3mnSG8F+cKf1kDhB3V5gNdrrsmohIs4TtpkUDgBPLSTpW8NTMTRVRLmInUPceV+UHAFtC8Ho2Z5JwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUwlRdwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWjsByka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUwlRdwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWjsByka"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYTAa3897911
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QxMgKDaOstJSBOtr31wH2Ju7
	pPTVHzgnyzroxjk5cwQ=; b=BUwlRdwbqPFH9U8TJUQ8Lxi54h6uiWVZfIhEt1Pz
	fpUKCy9WUIbLxL30OgDarf7W0vW6P5vZqFKpX8b1yCPfhNCroNF35AminW+q+ZMV
	oGLc5JLaJgG8Xr7/qDfOV8dq0zaJdlMiP7XLl6D++oPXOj7+zWl/EHz8FFRA+30z
	SRoz2FMYrXvv0pYaqv95ZkK0iN05JQvZtqbuR4KL6BRAqwrHjuz+A3QL6VjiWgvo
	2nDjq2zm6RWnpn9Ncib/2pW3aCpkcMV+23asLcdR+d93vRn93Dnzs5ZMEiz8lq9n
	eUD1EcMHC/OlaVcm08nh7Y7f0ZSTK9DFGSrraO9IknmhbQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556u0ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:39:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so911493a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788201595; x=1788806395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QxMgKDaOstJSBOtr31wH2Ju7pPTVHzgnyzroxjk5cwQ=;
        b=eWjsByka5erRkC6crn1N8VZ3v2sZ2EKxT0uWcSFizJGZe98Y0enP3R34ojCqsnplxO
         cQtwhA4AWW2WXmUgrP+u99FIlJmHlf1hjQ07R5j9GM6LUqglz1ps6K3AnGveSjkgCl0N
         ruma09Tf3367R/IYta09Vu6XGK8+LYT4U9qyjwtmjjeJMjarZs+BJ/55+k4pDUH/Ahbr
         kF0tnU+JxFe+J51jGQ1Lwhfq3/jQ11gFZr+jj/d1VzWZxIw8cC4oPYxrfr3Lv1xmnti5
         k1yNaX1F5MrjA2dxMeqnIN+vjQ+2YW7nJ9U9o6UgOndDFwAzA5IafJHiSr6Y7WHwGxLb
         jxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788201595; x=1788806395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxMgKDaOstJSBOtr31wH2Ju7pPTVHzgnyzroxjk5cwQ=;
        b=lhu3TXFRT+Ji9OhVMfc4PvkCO6Ir44aFs0M/+/tohbAD8gVEL+1HINd3Xs46c7dJnG
         jd7473oMTj9hQwVRSQvRYT3GlRoWH9UhXQFx8ses2dEQfaBFC4jM+LE0FZzQVKwvnc6p
         WEFJAkPVcNyLSJW1YidwUxx0oe0no72U2gEq5BTFRA5mfTNuReTcvOlRBDZ6OTMbgzJ1
         y8NpcU5tpR++ox3ABWAsBGeKOILcRQU+DIG5aDumLH8gLSib2IvSrj33R418P90lae6w
         Ghz+o3N3xtg7go5AmiF6PtnZKtMNZAYALYHsz2Pl3NzdWtHlAhF+edvdWt1Yfu7gmK58
         rkog==
X-Forwarded-Encrypted: i=1; AKwUvByX2bTVwWldw50ahPEohOXkTBbiUHC0SrJm/zD0pETwtfUTuz+7L17JjhV4tBEa+E6KWaUBsmU531Ud@vger.kernel.org
X-Gm-Message-State: AFuF++kntVIzH+IHve1JK3OcJBgjMWUG5ghh3/RS7lASqT8FvBQYmH5H
	rcvq18+V59djscxxUnWXs/R46VyZYLX/B7QttIbnrNidwyNFZzE/kzUd9p94+x21Gk0APC5z54x
	DTonh53hy8VE8FJ+ncIEmprqH92Wuz/oKgmjf3tupBoCA50t5y0v8kiNpkv3AlZK1
X-Gm-Gg: AYBFou2FOTpomZgjQgMHxgceODD27XkMRTzPV2qPs5onKSTGRh28AtryiwmqGpOPBT4
	vsuaMXXYp2Cv7vXFcyF/3wQfrVk58gTraJUARH/1WfXrscPYJwA3JGHei34IgZjKrqkNFaYIhTQ
	4jFvda7fzFYHrG0dakNwcU/qM5LeEsDxzNUl++UMGPb8SaSKpPYeEN5woeneMcOv4XqeOKadpVu
	lM7VCZ1k0BTaqiJxARzwDwJfkEvzxZDdHS2TGwWZ2xauMZO14TRj/OyUFfSKxmgvH97fxOPJ2Tt
	n1/F2eLRU2kseGUo7tPIGVwkehrolkQKy+r1y4RFtIeTmSudk0Fjv01yKTe8CeAqCBvlHyjZnJM
	XXETVHN19k9D8ZDvJmwpG8Quxzw==
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr2954950a91.2.1788201594828;
        Mon, 31 Aug 2026 11:39:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr2952407a91.2.1788201574207;
        Mon, 31 Aug 2026 11:39:34 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm28349715eec.20.2026.08.31.11.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:39:33 -0700 (PDT)
Date: Tue, 1 Sep 2026 00:09:24 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sunyun Yang <syyang@lontium.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <apXKXNBPA1slpAXi@hu-mdsor-hyd.qualcomm.com>
References: <20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com>
 <20260824-lt9611c-v7-v11-2-eb4a79cb597c@oss.qualcomm.com>
 <178766696083.117435.16339828039068931624.b4-review@b4>
 <ea3accea-4c20-488a-97a2-7675f54fe401@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea3accea-4c20-488a-97a2-7675f54fe401@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1OSBTYWx0ZWRfX89Pob5iNy+2z
 qBHJH8CkNpe5CP0wJx1b3gjHgHHAtEYA7iXe7EOob0mcn2RT1ygpV/Zj+eRShNm8U/dBMTtfASG
 qPmylO65uhKl6D+Dde9bKrshxhowq7o=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95ca7b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=BWdvLCTEkTRRry6nPpcA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: uFDFvh8nG5L452suJw3PO4SOKsCWzFoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1OSBTYWx0ZWRfX1CUNUTjyU8rv
 8RU1Ssl5qXYDk5ZpvvdxpT8oO5cG3ZxfPdXtV8Uj67bYFF8smyzf4vTRVUh0zRyPYr27pQjpFui
 0NB0cgLipcTAbKnbO2OH6lJVWR+O2Zo016SokZe3YZWi5GA8KAczpQsFcLFIOQR+mlgZNDw+JHQ
 FzFeeDs1z99uxDuL1nX1hJZIphkHGTk/XlVHT/NAEFjctMkjX/AVlip4YIPK3E0SQ0cIfYJ/3vg
 bWyL+oowav7YMHH+J0fbtBt9YSHVplatMf5SBYYQn/ttXQ+Gmz0XCt4rDP0ccGBADSpQfnk8c5Q
 rgSJbDF2ZdE7yS9SfZ2S704m31CTHR/8v3d3slFPc5yyDFu9+KxCXeMV8hkKfj97zFUfaL5gQ9C
 jDv+JOyxLfmp8b13K2/7e9WGaIOz8DGNZpVxcpYRpTf3k4WRryt1zisp+X0FLKb70aQmNmFx89w
 dRwMiuXoN6tybfj4Cpg==
X-Proofpoint-GUID: uFDFvh8nG5L452suJw3PO4SOKsCWzFoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310159

On Tue, Aug 25, 2026 at 04:29:32PM +0200, Krzysztof Kozlowski wrote:
> On 25/08/2026 16:09, Luca Ceresoli wrote:
> > 
> >> +static struct i2c_device_id lt9611c_id[] = {
> >> +	{ "lontium,lt9611c",   (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611C]   },
> >> +	{ "lontium,lt9611ex",  (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611EX]  },
> >> +	{ "lontium,lt9611uxd", (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611UXD] },
> > 
> > AFAIK there should be no vendor prefix for the i2c_device_id. Have a look
> > at the docs and other drivers for the best practice.
> 
> This is because of bugs in the driver, which I reported at v6. Code had
> NULL ptr and to solve it, instead of fixing it, Lontium added such prefixes.
> 
> Obviously this is a no-go and they MUST fix the null pointer in the
> first place.
Will remove the prefix in v12.
> 
> Best regards,
> Krzysztof
