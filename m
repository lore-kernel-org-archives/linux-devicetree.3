Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228470;
	b=fW4GI8XC9r4RjTVjaWSECk5Lgz0EjsUqeTMxnFOmDOXzOvR4MKHLzSPlQm34bVC207sH
	 aQWn3dOGyKYB0szxlvHb2xXkHakZZImrZmniy2vAimnlTaAbyXQDaNMEgWWkfZBKsTD7k
	 9e/qmZL5mDgXzBGRq0WUBO+VafU8OnfLttTOBOVt1qf7Z4xyyg1jOW5lIqSsaRtND7pjH
	 aDl+UqIz3QVhGd3yeixhK6rh5dTsMcJT2M/vjV1Tju5Oi4VYBnWQmZgknhyZtz4ScKydz
	 c0t12ycAmemFzyk4/fU02C0q94bhUx39OG1CcqKfqIKDBP3FbD0qsP2Tm4NRkjwaD0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
	b=zj4GKy/eNO+puC5zoT7okfC4wmg2ksFJBYY/xd5DG/1ukUhgNb7Fm/o9xWkzLyOr8SvE
	 9YP6krEQSuHjzUkowH7cY20g6XeprzKyHl8dTUO/eE9RS/1zJ/JIW6jeXtP7nNnz6q2pr
	 OBZqpscFAHo+bh/TFwKHQz420OawgIOQSmJqEij1osDFE8NUZQCBX+r612ut2iGFaePBp
	 uSKMDBhGog5/rKaqku1k0a+XR6+ygBqW/7bqYpS/yL/5/umFFlT+WcvFdX7b5q/jK7UyV
	 sq+OO0XFTmkow6Lzz6wmLwIfGWhs0K2FxSwjlBharSp5DYMIkMzqSYYrUhjJqFFR7qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5lOCSAL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EUdX6/C2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E4606A337
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70E4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5lOCSAL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EUdX6/C2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99unlN3600472
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 12:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TeOdNADF8PbWanyh3zeJ8VVt
	qapoi4A83pKR8WNo47M=; b=B5lOCSAL9XED7EOwzb4VP/rR8c5y0c84FDAN1u0f
	qk5AdWusuRIEf33+PYlELJrIJuy7HCz1ZwxVIorihS2bNZ2pE7YX3L7GhhwNpKRL
	Qkb2o5C9JfDntueUG78WSDFtHPg3OEDe1CBlJ4ZLSgVYIJcOaDVRpFi8Y7H0h4kO
	jcxoCBsR8cHUZlTcQTHOtJufPVQ9wKTDfMG65dZ7V2gTZCW1Y9N2SRAMlQFUV4iL
	JiWTHAKpg620K7Eg38p8B7K45pZT2tt9WGR/1Qgl02CEUTR78EjhbtuP7/TpNYup
	Gz6h2rsMmi4JIO8q7QgH6kwYrfbPLhqVcDcyMrNA3Wqh4Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5890s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 12:47:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so103880137.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228468; x=1794833268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
        b=EUdX6/C2waqexumt93zXVr8u2q/mqRyBKML2yyDMKNlz5bZi8UMWdRmlWLT+PAACMw
         Jyel0GlcLXPYZooNWZ4imwfEaqI72I1/S0ym3X/fNK6PMwkvlMStHSOvRb49Y3rctgPI
         +t7ec58NuIsjEup0FT/NRAmto/keqrWcI4qBqgnyoh1THb6noxjzUAy6iDOvWN6AmP4I
         MVml1/AtowWTEcrVGf2sfqBP8UFjRxUwZ+ElhZDOYA9zRBOFNJP8LetV0s2lpAXFmyAE
         SDbW55zurnSq1C9j+omrC3dKwRbbeHtMCfMw4qROc2fZla+HFFWAA7mwhHvpPpRUnYca
         Nd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228468; x=1794833268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
        b=g9sOLTCQA6cTMUAZtUPaGDTx6hqXpdwmThuxlxHdyOcLVY/OD/ykMFPrlhC2OIRDT8
         dYcuK/q3qxc3Viv3eEFZ+2mab0JNTVxtn5vVGX7VBQ9IdNMVcPjc0x09Ii9bNpr88HC6
         Z5/rmhobIk3QVsiLIfUu3QIkvEPhgw+/Ou3pbfd4q8eYxgM6Q2pn+55NZHgNfwBTBFuM
         YL0OYafYYHEQFEjAKMyTlvdVAf7YiySReP0CFeC7cXEiXl2a/b0Zu0+Us2u+G/K//t9X
         NTtwnhHfrCAsvQSa/0AUzRO3sF0tlPz1BEGgaKS2dCN/5LBQXjwqgzG3KNKx5jFgrZmw
         3zDA==
X-Forwarded-Encrypted: i=1; AL+hErGib4r9qs9+J7ZqsKWyKFf1lAEzg4QetDueOLIP4twsOkgkS1fiHpMbhtb1eNJ9X1/3oiTlMF2GjYng@vger.kernel.org
X-Gm-Message-State: APuU4Z/8vSWxYJaTuoKtl50yefWJhikAf5Ax68iaiLBgVoUnut/7yGct
	nw65Tk2wQfsM+0nWRDjvPAhH4PYJOcluQ3TsBeCrKLCMB/tbGFtJoskdzoWWIBMP26WIJOMk0LQ
	RNyPwKwqCqRZM9cunbcwRpOa9NtYTWl/5nWSy/1Xk6B50jGq/V2SFs3dMNTW7yIFC
X-Gm-Gg: AYBFou3ujF5LHGSatI1yiKiy5YccYuwnh/a7pefSSfw2EVyEqYkVDJSaVkvXqZJN28D
	jUZ6s4zKih5sIabI493f/LL8dlwj/VPZVndS796xndfe4t6NshrtBaeB+L7pSCY5+BhpNSBWQmO
	Pr6pguJR2B/NMjyIVjamT/ie4YKuNkG/Who0+T+2rp6OPi407skMJwnaRRK/HJGFLs94Qz/Nnir
	+G8pWDGLSgWbQjWuMVEm7dBqa+VSE4rL8dptlyHz9+IU8MtrU0n8JtD4TPNawetHsOZBhIpJaM5
	6koy5F8OvfQOGTcqar3jO73KLuQIy9BFfYxhBB4mLVTC5kl1nEQGfcsFRrHLbbyUr0eR2Dp2PsW
	6ocz55oX8Q8WsRd1MfBb7xRVb7GdCdGGQNBfwdubVLBcI72DKmzmfWD7SZwy2JaY=
X-Received: by 2002:a05:6102:915:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d2db0dd505mr782541137.23.1794228467817;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
X-Received: by 2002:a05:6102:915:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d2db0dd505mr782530137.23.1794228467118;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb0b0c2sm207416945e9.8.2026.11.09.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:46 -0800 (PST)
Date: Mon, 9 Nov 2026 14:47:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sdm845-google-crosshatch: Add
 display panel
Message-ID: <nt2zeflxqbnxxb5v7p3ncaigrwlzatspcx72be3253bsq2t24w@q6s7wvdb3k7w>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX61jDqwQbQejE
 hjq4vq8im0Qy4OA1wLMj9Iza54BG7UNHo9r4hDWZRKOMEEMTlTBq2rJ6HwKvymDBYcuwI1BIly2
 iCcLFekt5cnnm2z1rFeivd2xSZ5oPsK4UbRU2qppax36YZIHT4cuw/mCAfs+3zi619VXp7C/bWm
 O1lAlFrjYdimIrba1wCrxOQjOBf84NX9oQoldIoxBzuVZILj9OHTwGcfC1Kvs2KpsSXvfws2IyO
 vmPTiJAC6xVVNJTz0mZC74pGqrHS3zOS1h+EUAJFl3IiM2gqMpwlpH5HHQxQdwVveSHke7UCn6x
 CQuVh5v3JoP4oTFZneOK79sWRtk5cLZZu9/kwEs9lBYPxR6W+pIlTiziPZELwRXMumhlDb3BQDP
 3tPyaDtsZZVKTIkIoOlgDFiGYTUGXmX3n2wg7abbnHGil8tbH6I2/vVRlW0/W2mQJZ2C6+UH1SM
 9Y2Vs1LDRK42QUECuHw==
X-Proofpoint-ORIG-GUID: 29z-2u4BN-YmDd0B0KDjgIpeahYEl8Lt
X-Proofpoint-GUID: 29z-2u4BN-YmDd0B0KDjgIpeahYEl8Lt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX5nN82A8ws0kW
 1fzO8+u/w1GUoX/zwrovVfTmDUcTDlTQmW4NyVAmRB8x7fLj/meOkDlJaiIRZHHEKjRb+YzOplC
 1Q/VuCj/p0IgEQ//JISdJ7QK0B+YRqQ=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1c0f5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v1rLgdUz5MECU32CcTsA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:31, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Wire up the Samsung AMB630QY01 AMOLED panel on the Pixel 3 XL and drop
> the MDSS/DISPCC disables that kept simple-framebuffer alive.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
