Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12122A4E9
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236890; cv=none; b=OIY3wd9GVw+65NLEdmXIYn+TLFRqs9/qGZzPAErFwbwJGV8vyPr/wSH4b24+K9Mki8pcFFz6HjgRiu4iYmVPVtQLWetl12pCJyZ5h4w7aG0XfNcmHZ+PzNxeOc7U6SKo4VZ8HY0TTCDAZzoeI6M5obzademhFhq5ZV8TTN2+AaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236890; c=relaxed/simple;
	bh=Dzi/8ewF/yjGgYC6+hRky49FSOxddaRMZkryKIOqpAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEDcKMAQGbqLiwrvgO2OYFFU8XGpXJgccs0QlIl2FusTyVTAYA6aJmBlk0SCoTf8krmQ8BkqpEmW17iuwkZL+2t/tZ4RvPi3khR/CvYT/7uPwQ7YX5+Av4OG0FGyO9m29hJ4bE13lT5UzEP9YnUrQUQuYsfAUwI5zAMuehfkpQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpNcdcbU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgpgJH29; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpNcdcbU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgpgJH29"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLwQIf1200097
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L6P7AUuJUNNKnoKSnfqsIhB+
	EmqYHXSmTxiQ+qim5ew=; b=gpNcdcbUYYmoC8B/6K4Do6y13gNQuFB/WwhbWVU4
	EgHcW6pKn7ijAew/mbzN3IJEb0KY3nQD2wb9GH0r3BdhdGfQ1lt2dblx/KugVkTu
	yzzU/PyEO9Rw17NIF2/QyDzKC/NoW7Zi59rOUOerzY01rtSjUTdugFUnrTl3oWH2
	TKIk6hlXlCkLTeB5FIWYTx+OGZLu/27gx3X7MD6477JE4VweOOBGVpZsprV2mj0V
	kg7dO5f4YjGKv7CIPWsuIvDrd0mU1NRJH2pl6aOboSaIN3w15cfcjbRSYxbEmISR
	5+TPztak9rSibJucAFt5ycLH5TAJS9bUENr/uU/Hb2zxOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5uju6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:34:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so305908451cf.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 20:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774236887; x=1774841687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6P7AUuJUNNKnoKSnfqsIhB+EmqYHXSmTxiQ+qim5ew=;
        b=dgpgJH29+QOV+8fR9vUjmjrjNDKjoMmYOQ10OE2FhA0CuhthKCq+gI9BJRbMADulev
         KZNNVLQdB+O5FjWYsDA7ZMT5UuAiILv5NmL1jWfaofZtenkD5vzJETFwNBk6XYjlPfYc
         befTQR9J3R0sLo1EfOpUfk1yBlISL9bNU/iOGNYooQ4jt6ZI3h7K7rX0n+LvyhisGrn2
         PypjIqb5ylLaq9w9Oy45LhsyJldiAk9uuD3p6JA3amMnp+h9R3bRU0149o4U3/cSp2rr
         fgjZ9oIUuqOOimaSFvUoViCzS5Cv7QyQRYGsGjY0hViKlqcmT18awsQb4fjZA/13/BYJ
         2tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236887; x=1774841687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6P7AUuJUNNKnoKSnfqsIhB+EmqYHXSmTxiQ+qim5ew=;
        b=d2UsCTywReNxkL1WQkTCWWPusJHCP5mK58SnjforTtINIBOByUMv1HE+LUqhdfvls0
         Q7jM3lOLSXYI0cSFwxG4q8DlMnjzJd9+i65dsbznDp5cBHs2sgScstTybPHU1g0rDba7
         hnTlW4s9Zxo2wjQXiTh2bVVA/RsWknfdII4WyAR2uORt8WmVsjc2mCtsGSkJznWc0O1p
         O08aG3XuKKES3joVklNUxJ53adU2LnMnZNZCByprT0rtRHqUYwXLGrY5FfzX3r2D8xt5
         lGEaOipvn2XP4CoIqRmwKTGrjQcB/wv5SrOoUN2r/7ATIiKhhIzvfGUPf5TfpiehfLly
         n5lg==
X-Forwarded-Encrypted: i=1; AJvYcCUc+5hm67l2VIWNOFrmVFStMG5uNUTxVwM5BJCal5vT/1eiwnUhOyNHUcrhdI4QnWQoYL0n6leS4Iau@vger.kernel.org
X-Gm-Message-State: AOJu0YyJK4yc+14d1QAQXQRZ5T5MJd4/sxRfDeXpYW90GV80NxIYZfP6
	qH6WVZkNdWh6cnISk3G3Mn8HC5GPBrunNSwja4bYDQsdzO3kcHpnCmNb4og5bL/If9LxiMmwPCz
	uf6YN6ds1lzX/cnALHXAgaBqnZH+7IM6PdTiHkbvXODsa4lD/HlL2u7rWPhtwGIpx
X-Gm-Gg: ATEYQzxny2tScjvcU6eeavKbVdf10wx4qHrLnbUnRZmnonDitmhScESjYgSHvZyaFFz
	Yg/CaWQobGRwGkqIro8Z/IYKiCFVn6TqcpLqPS+XcRI5TY8CRWWWzRwwVTfVoQh/0C5YzhCK55e
	znHyLQhrbvSle7zgTv5z1i/95xRcA64vy7zR4DZPF/sh5WZcCB0ATxlztI9SZjE3sPGtJEflaJJ
	j9wpO9jLbOt64oxMRuuB2zEMhsrOFaShTV/maerJBbuGsvO+ETrZDFXwE3SvujHqspHEJlKkhRR
	1DO4t4p8KHFGQrDQ2dlI66DFR+lBF1HuLsK8+w281c4HQaFaLuVllwraVo87leYjk0A98gaqqxu
	5X1+XNCexFpj74PeLBiZj90HdCOAyK+Q+SqR5QUqH57gwF8kOf3RctNQOPZ0imEtwgTlfXzgGrl
	VFlGChy3LJX0rnP7tptDNuTNJDxZCYEKt2zWc=
X-Received: by 2002:a05:622a:354:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50b51ad3854mr70154121cf.20.1774236887354;
        Sun, 22 Mar 2026 20:34:47 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50b51ad3854mr70153891cf.20.1774236886880;
        Sun, 22 Mar 2026 20:34:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b5esm2221882e87.16.2026.03.22.20.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:34:45 -0700 (PDT)
Date: Mon, 23 Mar 2026 05:34:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.Wu@ite.com.tw
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI
 bridge driver
Message-ID: <raiofuwt3kizmnkadsry4ttiemv3dr6p4iydvwfond36fx2xbq@ugrw3zr2agqi>
References: <20260313-upstream-6162-v3-0-8497fb7c4406@ite.com.tw>
 <20260313-upstream-6162-v3-2-8497fb7c4406@ite.com.tw>
 <i44ock4tspw2244xuagj554d3giko2ck47smcic42glwrxwc2r@s4uj5w6xagtb>
 <e76a20e92ad440e4bc6854ad444695dd@ite.com.tw>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e76a20e92ad440e4bc6854ad444695dd@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c0b4d7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Ns9eNvu6AAAA:8
 a=TUF5HNPNit4jWLsqbl8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNCBTYWx0ZWRfX1IgkTplUK0CL
 zAG5ebwgc3e29mhihWODy6V6YkOK5BMeA4e7XIU6vR9MDv9AH0XMTG3LI12/kI75tR+4JFV790v
 P8FqWUOBL/sR7js0l6uDsgkvREzwOVBzfoRIfLnYghf3l6xvENgZ7xh4k+b2SFoyyMnvhh7ikHu
 rIj9f7pAtXRr1haSqUfBnS+oNxQrNCbZaBZy4eJmKGlDaw6ZANYY9jG3srUBMtyg6fg4scsHIEg
 dUY0OB3/GHgzN8BqrhdsQkyr5F/s54sWZ5ngHnpK5aTD7LZkBhjfP+ZOT/piUv++lcLD/OdG1uP
 cfW0X9aP0LYRteF8LMI6y9SMvvS6ZLuleb3q+wO8wY+yYWsKTewSX+21bxpcvCpx/LQzGgOuv/M
 0z/55dtepfU432/daR4vamWFtXGvuO42gTNQUlWgNY3782NJ85OSjPJ+2aafGswOikkboI+v6HD
 7TNajev7KeBFC8f+RXQ==
X-Proofpoint-ORIG-GUID: 9Z-aB5EEqJbY-yPwI76GBXUWtKCTY0Lw
X-Proofpoint-GUID: 9Z-aB5EEqJbY-yPwI76GBXUWtKCTY0Lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230024

On Mon, Mar 16, 2026 at 02:12:36AM +0000, Hermes.Wu@ite.com.tw wrote:
> Hi
> 
> >-----Original Message-----
> >On Fri, Mar 13, 2026 at 02:16:01PM +0800, Hermes Wu via B4 Relay wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >
> >No HDMI Infoframes support? That's really sad.
> 
> Is HDMI Infoframe means HDMI-VSIF and HDMI-HF-VSIF?

Currently we generate only HDMI-VSIF

> >
> >> +
> >> +	.hdmi_tmds_char_rate_valid = it6162_hdmi_tmds_char_rate_valid,
> >> +	.hdmi_audio_prepare = it6162_bridge_hdmi_audio_prepare,
> >> +	.hdmi_audio_startup = it6162_bridge_hdmi_audio_startup,
> >> +	.hdmi_audio_shutdown = it6162_bridge_hdmi_audio_shutdown,
> >> +};
> >> +

-- 
With best wishes
Dmitry
