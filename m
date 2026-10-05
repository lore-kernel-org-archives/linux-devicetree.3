Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39319CC0F
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791169848; cv=none; b=ZQkouh4gkz41uQdXbjlz0AIZbsj3iUtiHxXRfJa0SBiQ/3bLigfj729dgCg+KV1FwodKlD86hpLt/tA7CORQlEp5u85c/rgFNQXy1AzcuSjgF9TbqblpHBxK+qi7yTamT0HhVYntRaZY9ACFbG2EuDjEkMLx7W97jlKoGSEGDD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791169848; c=relaxed/simple;
	bh=FkAYTVSx/narKs44G9kWV+3HqbiiTQQLw1ziMHERtW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIVxx02kYBKGeY+86QPPuVNkDYXZFBsfIDTiH9jRaL6wQAcBamDnB0lA6jBka/1YK71A6dzeIxNpxWRInzkXlI16ar9NtTqrgJQaj4PHptvDGflSXQd6VOxJFyuxf8DMtLgPdy5I9InKASdJP50gNnL+8Cw6iKmwFfArmsJmte8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+gM6bE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdtJ1KyB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+gM6bE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdtJ1KyB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695102qY3838382
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 03:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3OfEK2icYr2I7GSUxSDco0Fe
	v4FbkyIVeW2fdTVpW8s=; b=d+gM6bE0mp8gn+PS8MsvfEEFXa2AYtPjzXEvduFv
	bISDW94sY7FXV2hxT7ss4R+hJuJkDg7/MGREAEXDlrw2y6yBGUTTBRtbaUWreMAX
	1BJ3dqYZEXzZ/BJEHbFSrGcQfbLwehjIrHtYlM0tHLBn7GRvA6kW2c+IUWdUt66I
	OIEdwDWP3955Iuj9tzOOg79JHKCskYXfWLelN40GgIV48WuR9NY6UmWsr91sK4vk
	vREcrp+x2iU+1nbaPALvUV2UhBJ4oT8jNmPKpc9Q2igrOrrMPM6NJw75WsEI/lm1
	UG+SroPbg8/S81xTjVEx+77w6gZLf3wxkBFgNMIpX5Ad2Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08m68h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 03:10:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf71bbf197so1198443137.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791169846; x=1791774646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OfEK2icYr2I7GSUxSDco0Fev4FbkyIVeW2fdTVpW8s=;
        b=cdtJ1KyB1iD+oOm5+Sd+EDNvhKJt8AmqdUEICdclBsT31UcfAdpFGTP+coBdvjq3Qm
         nk+zWmXGlMX82vVdQLY8Srur6uRNt/MtI2kWQrJoFBHOg5PEWYnECDClwbptYc3hfXAO
         TfEzC4vXdacyifM5JOHYoDH6YPK06vaK47D6Jwt7B04PBa86tpEptH9bQ5051iJ/YXHv
         mrDT4zuzpEu/dhSUOPjJq7wKOmm9e9+P4H2q/rCr4Jp3kJLCGam4hJSPu52NclEAsefH
         F6Maze6boJGYKkdYQviR5Q8Fd7RoN9zrUFIIZ28kmPHvc14/ZGg62OpYee3cIvMZLhJQ
         BOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791169846; x=1791774646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OfEK2icYr2I7GSUxSDco0Fev4FbkyIVeW2fdTVpW8s=;
        b=VkT8hELWVw0ZGpuJ0dItc/6atu7JAB0/2dQV+IpcNKDZ0/RuTnQEzHFZaFuOfwZIR3
         qCyvJDpGd6t0tfReqYD3J7unaMx8CLeqjOiNSVh68p3/LRtzwFd3j/rW7UOl1MlxXw6m
         dHfocok85F6LizVMkge6ZH4aSuBHHSQjvsGPI4C6Ao50iYNDCR3AzxdALrFiDgU0wgeD
         6VVecY7ojsEnWQjQrfPC9usglhSj1928XUh+DATW9A1DnzwrWhqC95jUlFrmYcBDx0iL
         lZY9cprFh+Gotws9+Zehbymqg1VvRXzOLNaVzjOO/JGuioE8EsFKxPfAdzQZxuS81OxU
         ggag==
X-Forwarded-Encrypted: i=1; AKwUvBw0plMt3cyKmzNUzUCXuoQpNLYAGPbhgipc7Wf1+NsQr5Vz4yDtQK4jzsZkcNa9PuuEtse2YdfUQKvl@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0D1xM7P16YSxkIfGNB4q2q9gRlDGGRk1Lluc66/1XKn8G3qWk
	4CgbaRRyGAPSLpYiUD2t6/+oM7MPjTInk3Oi2yn4trj4kfZDHQHZ53FIKidecFDrpF+MLC5h6NI
	yh70DFV3pN5L5E7BC8e9zpDgGsVNp6FGi5/hrgtB2JyrwoxC0yQ/ePv+SPAtnX5Ne96j/29Xda3
	GMjQ==
X-Gm-Gg: AYBFou2zIKuaLW77OtiZO/U/40eyI+2RPdYBEJmZFJYdnIdiJ9bHlw+abIrkPtumNJ/
	fM+YC2KOImi4Nwp8L8n6BoU5sFBwhkZe3Ixw97qD9SLaUdERJUr+b6QtuMljxthvcvce7JmjvWR
	YjHIgS9xQ4Wn/X9OQoSXyS9TqV1lm8Oqr8eZSh77fw6zGptaQo5Lfs4UpNd9Ij1Y3oLzSss7HUj
	oNHyjWWXN4X9Z1dLMPv1kzn5Q5vn1MF5G49o55rocWRJIHB6JnquFqu6oSIwPJrFm7FolYITkuZ
	kOxAreIBTdu+R9W0syV5o11coBzoGwg4V/NgThS62h2D55X/Yroudgi5jgMXg/PAD9sJ3TJitCZ
	TqLFBEZkC4kmzdB0p5p6IzLdAwmSr+rZ2XRuAr2BaBDOI12LDxxACOfz5kbvqu0+aYefPVKDDQ+
	Cv30sR8BrRP8wG
X-Received: by 2002:a05:6102:3c8e:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7c0f51af767mr2878350137.33.1791169845771;
        Sun, 04 Oct 2026 20:10:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8e:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7c0f51af767mr2878337137.33.1791169845260;
        Sun, 04 Oct 2026 20:10:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e31035esm36650811fa.30.2026.10.04.20.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:10:44 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:10:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB
 support (peripheral mode)
Message-ID: <3w2te74boo63yqbfgi5mwiu4rqdjd67nmb4ums7p7whucdr2gj@5l7euw4umfun>
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
 <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
X-Proofpoint-ORIG-GUID: 10PkqY63b9-jQIbjTxvJHDNfwoXsjkH2
X-Proofpoint-GUID: 10PkqY63b9-jQIbjTxvJHDNfwoXsjkH2
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac31536 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=AYGg-ij1XDh01NWh1ucA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfXzDSg9ndiBJc7
 EpkpTGtQdyQDXxyKEBvegrfvRSwfcYCv780bAutqkl558WrR+IKZcD+oePwcdbF+Dayd0xl7pPm
 MPXP5eo4ubU1gGT0W21UEZR9zdgVC0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfXwb0I5Az591/D
 qqjbfD4CqyujQDIqzHS7HNQhTEJlyxf0m4JI0XEG1q7jnxS7P2E7w0VPcNRusd7ykacCf2o6mkC
 NTkwm1GcZycVWj4ZpO8VVwp3vBqAHOQba5xyABTNY0AeXjUQuD1HZturBOrjFuQsqDwHpYH+wY0
 +C3pvkGvw5GL74xczNgkFYooOwI7xH3/yrtW7Azbuyg7Wr2e6CIxWOntzjdKSFSr42VktLWY+0v
 taTf75CMcHvBflHxQ5ys1hvPAy76ZEFz6uGnyZsibMzhaCncTrMihpXNUx6XgPSVH5wLSTUoNJ8
 8vC4CS797p9JWfA9jloa2UkE4yBVF9JwytgV5Agw61JLhxtDa1c34MuzFmGGh0vbC6ZSYQgM+oi
 Fos98KWg6Iu6qTZNcL0VPLX2PN+oTEizYUUxIWnS4EUX6sNIrDgymKRS/J5eXhSp2H93eyCqzVb
 N1NZg5p9P0YwI9O+WbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050012

On Sat, Sep 12, 2026 at 10:18:12PM +0700, Reza Kurniawan wrote:
> Enable USB node and PHY. Since VBUS is wired to the charger IC, also
> set extcon of the USB node to inform the USB driver of cable events
> emitted by the charger driver.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
