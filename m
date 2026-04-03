Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6882FF657
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246258; cv=none; b=hA7ScWCP8rNqBZCRoMmY3KkqDTF/gp15Aq7zGjgpjuc1wBAYMlJcc62lIqk5///pcH968teMYxomN2kLh3fX10tmbBtXZ8r5S1Pq5doxwRxJ9gwDg8JWYQwx/9JQ6AFdfScoR6939YuUDoBlplUBHMa5PBcbQh25Vn4/I4Jsx5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246258; c=relaxed/simple;
	bh=ZfgYI/B2dtQvP6itSBrOwXYKvJ/kEHeKcxrISgqQFWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUX33rPV/A8uHYOG5g2EVIiHWfAzD1JpIRewM5rWO6wgPvNeKYx93IGYyAkcHlCVN6/88CnDAFKPuexA+x06k2tne+1HcbLe1jctGEILJZgeDEPlTPDcvUqnDqDkrTVfZwIclcDb26dVUWftEfbvcErDiuOT0bMq08KvnnZxTQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOyRI52j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQjg9i3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOyRI52j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQjg9i3u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EUbRH948009
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 19:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PysCDH89SESlek6biv7T4EgV
	nU6bMf/7kJH/aTj8i/k=; b=QOyRI52jZU/NFiJJ6fKz1aayIf9ycqoAkFey0GtR
	pyeeqyduuWKWcz6wWD9oUvVqci+ZyoFCH/wiUYo9aV3HPrmwXXvAEvhr6q/FdcvH
	ZTPLpqH2Od7JFkE1IJoS+xa8BjUQ/bneIe/hVXVaF2BHKsmNLZVgF/XKJFsJ9Ng2
	woyosPJEwLV4YpHPF9e+F8QqlVb85ESw1yrzbIQ+8rUwfVigdmwv/jhoop9N0QNR
	LukiHxz/xhmxgB/1OALvKhFypm/erm+2d3ZNNu2md4riqEsRRDbSkCE89wulQOFO
	3qDJVhEAnPnKOs6PM+6WwiucPtJZF63vuLr47bYPoQ9Xsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfksev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 19:57:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso30746681cf.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246255; x=1775851055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PysCDH89SESlek6biv7T4EgVnU6bMf/7kJH/aTj8i/k=;
        b=iQjg9i3u3gHCxpPCZvRnLprDxInJkHwjyn/jF4+9GKzwraXQIvWqUTfIcfx7sHYZCv
         ZCL1qMPm76LAezn/Jmrp5/SP7c6i3sALhoWHJOapD3mKaXnJ/b+uVH9q9pSHCgogObeK
         yputH4nFfpFTJh32Ej9E31Ud+/BEQsY4X/hYN3IEArW4P4MR4O/oeQs0TspNmVoru769
         Jrd+21AsSaDNI2O+I7zeyXmKU1MjNESfGlUIifTAJPfFJRmW9kQCwbylQ4nsbb05V1Ws
         i7SlPNmY/o4fVbfp9etOdHFXBFnVULn0zmspayuWlWPPQnYJXAF3IeyIeoB2vZMUWS95
         Dryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246255; x=1775851055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PysCDH89SESlek6biv7T4EgVnU6bMf/7kJH/aTj8i/k=;
        b=pxmeSJw9EPxg8DDpgXyqZYNHac+SvPV0jfOofJDylLjole9NPcmPddhyOCdo17/2Fw
         hVUvg4pNzHUuw8o2IMm4wrIQENORkRErCGPhxZfLC/xs/9A5nC+mEfTiEbuJdbZnr5pE
         IP+v/vV/hM/3ahe9MJ+sCxhoTQEZVX3NoJ1Z2tPS2D0B64e4pZgRYEpzY87IsfrFopAW
         n/kiUUzAun/VoScgaGVjFqdKcvsF+lxwM+keKlxYPpe+0gLkdfvapW2iIa9IbZM+GIvB
         LxQoXBORet8CurOLA/1TmzQo/+9gJtXLjDfAiSqle5qrbf2lWp4CxRelBCBU0k48w052
         vexQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd2O5J3DKtEGR8ffEoD7C93JX7HCtGeSt/eKFeH+Sf9/iUaBEJJO3LpVq42lZpZDuws+TE52yFri5r@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh1ePH+99HyVe9E6xMsnkhEtLBh/Q2trhGJZL+Cf0+VcZXXVs7
	U8InbW1Q/qIqB43EDL3CSbm3VYANTb8LWU4JriUY2Vgyzp5S8iuah5lS85ITkmTidvXKRDYEF7e
	0Ai3gNnOmeKI4wPnWcUTZuYWj2/eMJA5EHOtOr0OWyMGCTryo3xezyeXI93vKJ4eM
X-Gm-Gg: ATEYQzw2lWS/5YckUNjT7qohaljZHBUv088ZBcdlS4GsE7uzGrIHvTusMreEfg5JzhS
	TfvMKcnETw3QEzG+dFoiVdCGQsRPKABXCmbfs129flT1vON5rOWrhyi84kOMRfxw69AJDVQZ45q
	kZD6se1Nig76Bg6OCfyWRIAcAIahH4rdTMg6cUTDHm1rtF05Dfc7gwDXI1Z0qJNxwmDQ5+VytQ6
	rOC35uFLq5mDrDQTBmA/LB2VRMZzoOR3ePIgms4wHAou1h2ulUKs69qzLr7zWzlHAa52DkqMYzi
	awqwK948o7M0/KsoSaZTyawUJFShsEyUKQqLlaahtqI6J9G5kNFoSFkHj4NyNpe/1/hQtv9vJ0S
	hxfEp9FTov6DeZD4lTNPosd8f+hyT6LbKcyLdHFzlzRmO2A5pz4kCA4jhzyFdcxY/Wm0ErDvmKH
	zLyEMfNp15BihTMvuL17/2mRwvFS01ptwH7BE=
X-Received: by 2002:a05:622a:5c89:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50d62b53accmr63620931cf.54.1775246255134;
        Fri, 03 Apr 2026 12:57:35 -0700 (PDT)
X-Received: by 2002:a05:622a:5c89:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50d62b53accmr63620531cf.54.1775246254565;
        Fri, 03 Apr 2026 12:57:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc9fasm1624857e87.63.2026.04.03.12.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:57:33 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:57:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
Message-ID: <qzmdcdda2el6ixyhwjzyaptagujt5zjdfwuunbhcproua7r2lk@6i7dc3byefxm>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
X-Proofpoint-GUID: _AjsMZz_Lwkr6QGW-l_ErZhWxyn8zGOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfX8VhMPf0VPo6J
 mxO3G5zND6s8WMEvQ4FJVzDJfzpQCTrYva/NCT8DzUkgxwPKkiVa8r8vRFyGiFBtl+w0xAJoQTd
 n27xJGpdwuwIBzZV6VES1LaTCIDJpiKehtMDhasXfzg6RWkz8OsXieUhZEnUvTHJEObtRIs3eNK
 owqIYNv/QVhxi6TvuJj2hZrDMW4UMJ0w9+bIMHiKtQPxodKww2A0ZYM3AvQUqf4RkTqJJpJ3QbY
 y4hd+uGXiOMq5K3P572bbQn5ZhBX9TO7R7GOoItWLebO5RO/QEXCBu7815zs77z8wnE74HfOLrI
 qPQ88wARiaCkQnK/INOTI2QmT85qj/3gxTfbww2KuGBPauLaywmUzCwErlCJgtJMyjwX2zNIiyR
 DiJhrsKG08hlYOTSuZ1FXQYE2mzt1mop9AbwAmqBfvGHI9ob0iqViXi72CjbMl9DIbGSdEfSTet
 HKUIdC/kAMZ7ebBburg==
X-Proofpoint-ORIG-GUID: _AjsMZz_Lwkr6QGW-l_ErZhWxyn8zGOt
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d01bb0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ngLGKwS_UPeau5fYbXgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030177

On Fri, Apr 03, 2026 at 03:27:56PM +0200, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 3297 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3305 insertions(+)
> 

I didn't perform a complete cross-check, but looks okay from my PoV.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
