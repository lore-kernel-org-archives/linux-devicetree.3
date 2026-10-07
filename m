Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A94442586E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383794; cv=none; b=TRiydsZuHykix6FeYjKREbY+wN/MWYlLwyiYVhQrXC5y0XoX+wZeruUF/AsyKBrGF/lGlHl0zXdd+dqa+frk9ugkK3hgt/QqRMgWSeRaEsOoo0v65UHEMHwClOqfaNlbF6xebMFkDxm/8a2q5NeCLipXmb0TUmYWvSGylwrFdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383794; c=relaxed/simple;
	bh=m8BwqGpGaN5NyW0o3YS7MAF/UiHjObuWTcpN8dzIZkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htRIKTyxpCRBMMcMVu3dwPNf/cI2btwLV/ead7yAJ2FP/KJCapIVGESdE6HHJPSz925JWArlAAMzHdYIXmtTsx+g7KFH77yBSq1MyIxVvCDRr7E8zDHEFFvbSDlEKp5sOoWb0i6L5hpLemrXAt4M1TOrSigOtIGXDUBOy/FS0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9uBFNoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWuo5Xix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9uBFNoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWuo5Xix"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVKs04178562
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 14:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=; b=V9uBFNoIIsGfBCyr
	IFLJ5olOiamecqFnaLTts2GOhTpHEymNOai/gCB0hvfnx5X1eH3dyD3O5XSMDqX4
	rj8xP7SSbIOMMjizZBTLGREznScKUA+oY5DUvUk0Rf05jSw1fDZ6MhRC66BY4uDn
	xmWluEYrhkXsMZwDFtv6PBxoB/aEUbhGkH09CAqUdX4KRN3Q0COgzo7dq6hXvOyy
	snYta1slspHwZownxgV0I8NzS/dma/XU2bMZXNzMhJ8qm71OaRliuC8KG/sea2XO
	QpguKd69sA6YzE2r3dNiLN8QpQOLxNWCsZrA8eRvkT3DueXlEIBAfpGYyfcYiKWW
	rOjhcA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c60am8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 14:36:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91235881828so92015876d6.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791383789; x=1791988589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=;
        b=LWuo5XixVgti4FK6odpqCNzyUUKgnDBDsnNEjbJPXSyoet7fLOvQ76D/PohaIB6Is2
         WtO79rhSOkGV/aah9RaSrRN0o/0pveZByxQE00yYc31wdfcF4Wxtz3mBiQ4WzaI0pPxf
         gXlPqyz+J7QLii/MYmDzgVESKPYyXRJzyHQyO0PZsS9SgGY7SAdtolOC66uj380sgpYx
         0ABqyug7KVxTVAKyNBChcsk+JRxvJGkO5MDpabBHl9AGVDvAHbEpRpe9QQe+wssa9TnI
         DRD441XASxXlDi2s1vtIA1oeww/MZ8LOd6ZRjs550MsDVc/uCYS4P5/PHGN+Uw1s683P
         n7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383789; x=1791988589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=;
        b=YgaTxyqQbfqiAYzWBILq5ESqbdplj7fJ1iNqG1IcpmkRB9QzkejLOOgf5WAor2ugsS
         9D+z8VuXTt5qUGEn7mQqNy5VfMT00Xodewluk0PaXMa1D7wDhunpHWaXehj4KdPvu+8E
         QldJdpf6J/SN5CfNqdC3a325lMTtLCaTURicT2C6EwpDOsVP8MyDsibR+9zyBwsI78SV
         K2WNDgQT5Wrdjh1NNoe66EW1AbGeHJZI31++QT3v2ZgkVce9XYIrYLTT3ejz0/vtjvYp
         rk22kvv3ifAd5RmBDXG1k/Jd0UNIt2BtY/0IT6hhMPSoA3AfscWaZhWzRtY/Qr2Iq+xv
         r0gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjwnBCtWXDuJuLzwoRwyfqST6FOr9aY4xJtKLsjP+UmmVR/dsreGHguEdEhW6CYRjB6EamYKssAP04@vger.kernel.org
X-Gm-Message-State: AFuF++k91ZP/CTJ70Xz5DSDchO3/sfwNb+ajjimiA6ndTR9XKPtjbVS6
	ut0Tking3VFcmzmGg8Jpq6c+S/0t2xWNCPrrBhsCHrbnd6Jk7Mb62b+q5CiTuZGiR0e8YgvGN4D
	i08fFOBFOIfjUgNkRIvuv0SGXVCtMZpjAB0oVvUwoftqcFnE/aq//7C73SzOmjlke
X-Gm-Gg: AYBFou0LpXIhJAj4MW3bxwYatCs1DajCFcOg7tNdlQ9p50T5s8F5GNFF0Jx9C7F4taA
	Z/ZbsGLzEPoY5+w76zkIStxwnSZ8d6SXwQCn3pANhSfxymtlbRvFr6EDx6TFHGa4kP7Dk1VOxEa
	eBvxZfRXhH+MCSq567Ws3CPiZvulMO2W8RYFkN2oDemvZfwnsqlAlbhAGPRgTviUXGwsK6Paok4
	qAlASgFDc9tp8B4AAuEj7KwWEg24wbMyFl10bowpZhjdM1vSGcUjLUV98J4/vf8W/FGYXpcY+qI
	JIv9tsGE99nlUM5uHweRSpVC2/EfPGZC3f5Szz0wUkce9weZj3k86RdrfXDXUxuNbqz4fvmENpM
	KV6ucza7a2MsjCvDj1cAcOf4LmJXh8aUbfwXKHvqxustr
X-Received: by 2002:a05:620a:454f:b0:93e:9809:270 with SMTP id af79cd13be357-93e9b87478cmr487222985a.72.1791383788440;
        Wed, 07 Oct 2026 07:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:454f:b0:93e:9809:270 with SMTP id af79cd13be357-93e9b87478cmr487218385a.72.1791383787932;
        Wed, 07 Oct 2026 07:36:27 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm5679687f8f.8.2026.10.07.07.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 07:36:26 -0700 (PDT)
Message-ID: <5439d103-cfcf-4fa0-ae8b-32417e30ae95@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:36:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/2] Add bus clock for t7-thermal sensor
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-pm@vger.kernel.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cmAjA0cd31w0859fZqxWhTPMrQp5IxOB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX74dDijJi2OQJ
 R1zF2sYnyBbvxCJXbz5qzBiWah9oNrU5FsJrY6gXpICsLrv28WnIhyu4Y+aD4cOtEGvHZpd7Njf
 mHToXGQKDTF6BIMGuHUfJI9Aook/crk=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac658ed cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=z_e_Sa1Ot6aGCMGJufgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: cmAjA0cd31w0859fZqxWhTPMrQp5IxOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX0HvQf+WUzxHx
 Xf/sdMsR4n04qKLaF1sKe628ODkokAefTgRQYM3Ogr/XoZ5/5Z5slIppij1Y9n1YglDBLsgKJAV
 IFErUTzSEDgR5rzIQXJEyeTscDwIFCuzYa9XOz6bRF/hXBlg5YPs/XtPB4TMj0coTiddAGoTCEG
 QwESfdIUNxvc01sE7GAvNdW01s1mVkZ3LwsJ+gQkdhOWMZ+cAJ7JqehB42k4bqegqMFpH260YVy
 Z22qAK709QQfHKCLDCL3Tn07JOEtnIcqxAa7epqocN1m4XZIX5J17AeKpa+T0ioyVuM3WYcHlHS
 Xy5SQNUqLirAtZ4vlMCaMA5Gth+KCB1d6fEl57ycEEnRtYB2Gxhjy8nt4a2Kq9P8Vo6P9C30ja4
 +12hffYHESMXWPgwX8aU+DxyOwoQAZa42uSh+u0pYSw/KpzEH0DaF4pukjsC1XhnrdQUWsdkT7C
 Blv/RtEVJCdAitVPBYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070058

On 9/23/26 16:37, Ronald Claveau via B4 Relay wrote:
> The t7 thermal sensor requires a bus clock, gating register access to
> the sensor, in addition to the functional clock that is already
> described and shared between sensors on other Amlogic SoCs.
> 
> This series first extends the devicetree binding to describe this
> second clock, making it mandatory only for the t7-thermal compatible
> so other SoCs are unaffected, then updates the driver to use the
> clk_bulk API instead of a single struct clk, so it can transparently
> handle however many clocks a given compatible declares.
> 
> `dt_binding_check DT_SCHEMA_FILES=amlogic,thermal.yaml` is ok
> 
>    CHKDT   ./Documentation/devicetree/bindings
> warning: python package 'yamllint' not installed, skipping
>    STYLE   ./Documentation/devicetree/bindings
>    DTEX    Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts
>    DTC [C] Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dtb
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Applied, thanks
