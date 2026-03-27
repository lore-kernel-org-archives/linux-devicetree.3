Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7070810
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652336; cv=none; b=lv8z9uWuo7aN6EkoO+4xEc3lPXRvkQjCEIN4t2ND56DcX9aByyPZpCreyl+Fuch3tF7CfVAmho+aEJ6iaR0e5o2dk+toBGoSbYN1Fu9CaLOngylopHSgWW82yqKFt/fmxW7OeWdH5J2Caf6hgeWIsnAUxBRgAoqQqdvswE+uFho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652336; c=relaxed/simple;
	bh=mOzK7YXq1NAAIWkYQZTgBV/ApYcbFSPmYUFy2XqonT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2ECzAaeMbIGiKaMWdygabHsY93Uar0GzCHiQD4/mwDmn7TDCAlFllU2vbzazXIG1FN/0PtNKXjBTpHMFbgbq9oEHuKkRFBE2SX9TajxFGlG+kzUmVduH5z/1cypZjgqk/1UYOaA8Mp1Q9SkAGF34k/owUjOnJO3HrUQTl51F4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3RUMpUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlE1sF8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3RUMpUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlE1sF8l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLfwir4127104
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0HasHbQ7U+CmeckZsO+aDEKW
	CrV/1CPpy5fZ05F1gXk=; b=T3RUMpUSy2wWFZf5tz1/4GjAtSbNtg/sWrNJ/uHY
	yDAFhfuQo2WfR2fz0VzRBbMcSxFAbe5HXJPftZgfPJgFssqzkpmOas6Biqj6bmoA
	025lGTQxcTevlltWgJgDPiERPWLwhG7Hd/ozvVloxwOpPLz0ozPteKitD2YPfYfc
	bSV4tSLyXKBndBidGo+N/HseYyvhB4zjJkyT1k2TT+0wOGmBcv9mm7kUm0vu8ybg
	LBcRlzpf5za3+a+tsLO3bVFJUhOrKKm7L0mvxZKs6G1OdPfn6IIpMqXL0mJGC+yS
	IUs4VVNZ9wlCjAMtuayejU+jzjx4IRcK3fSN8SYBqirP7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn136gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:58:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso119293951cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774652334; x=1775257134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HasHbQ7U+CmeckZsO+aDEKWCrV/1CPpy5fZ05F1gXk=;
        b=VlE1sF8l9/IgmaszERxqGQMZJNuz4n/38IUDVuLjD6K4dp/Pz1gWkvbDTbJZ2X2FxX
         9Kc6SsLw6kw4pZ/UTzqCU93F3jRX3DPcs798kHHNAZypr0Vu0ZOo60niNkbZsbXZ3Kpc
         +iy3v99/AKdlvHkyOnTGFWiDfa3PZGXPVsM4Ld2zFKgyOj9U/oiu2Cpg+iX7TcHET7qd
         4M7e1aK0Vrvg6atd6HgIJF8RDWi/Ob6capRARQcVsC0UPRlvlqGdN4PsTxYDzs4ocafy
         8/wo5LjY8vI265k1kyE0wwBU/go9z8Al/Tkkaef8dgrJfjbHzoMrAsChE9iQMmxOcskL
         Tk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774652334; x=1775257134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HasHbQ7U+CmeckZsO+aDEKWCrV/1CPpy5fZ05F1gXk=;
        b=Yj9sWaxbfQXQ369PkUxvUd3nixWNlcoC+Ngtj6FyJ2JvowVRD29ne5l/Q5OAV6N7VF
         1W8hYiSXkJELtaytCPXkt8wPYHtynBAlYMQH/PyreDh/e7j987JEcqavXpScNG3l7YTE
         LL4a0xS7GaYioCDYb2I2f76VlzMkVAakevSHfoSQnHgzGb2Wg6A0oQqhMCMMCWzx52jj
         UyaTRS6rVpHUsMoywZHZfy7PzuZ6aKGwGIpcLiMsYAq3s6K8U3cxeJsS0l8yILCket0y
         rTQ9+QpOsXxQjG8zvbvfguTA0myn8Oko1rBj3o4B12ato1ysVc5/AvzyJGDvCBzmJRAr
         7Lcg==
X-Forwarded-Encrypted: i=1; AJvYcCXgaQ0CIUvXpUhUc+2rbvUHmqhnd1KOjU1BRMmd7ugnPdKBdpi/MyQ4dhIJl0pPTNvJP/0T1UqHQOz2@vger.kernel.org
X-Gm-Message-State: AOJu0YxXetYAaizk+Vju1VY/LMCrYhNT/yxW0eAa2Ax+nYtpj4fsvzQ2
	0HzcLDuIcUthNJbUPjBDdYszFVM3xrsYm5c03VxPHIV0Ukl5pKLko5dSfmhRbybtwW9hDkG0eCL
	2kjODjpxKECI8gv4cxvN3RnvC9SUIUCO6lxOiu259i1YILcYxDhpljQLp4uuiR2Vm
X-Gm-Gg: ATEYQzwa6nErkGyvyNOsrpgFdx/caZqwlPfaGJeeywZlL+vM2yR9/SOWXfxfM57g/wA
	gByiNSPzoxYVAbNL6aXV/nwBUq4Az8atdAUJad9qhVI+4UrOLxBdzcYYvlJRTQe5ZsordqqpZJ5
	5DlqEcGujkv0lqCEZrYQSE8oheKtXZRAe8BkrvYbMQ6trdG9IxUwZC7spr4dgroG9jdMfJbxegf
	AJBc75mIRZjDCrPdyMLr1C1D7If/a1mnHBZ9wWf7hMBeLWaeKHnG2zjJ3ig4cbQj1Xz6C39+tjk
	JP6pFKfXXJqeDSl+EPkIoOvAL0YwBdjHq0XPBqF3jBL9j5SOc4222qOb00N8o/Au6fzKaOzLjdm
	Aau0zv3NhRaQ2D8UC6Koa3hJvHHyYQJ+egeS5eueQuUgjCi+GJnKbZtKxf5NgmFAxt6ig0lW46+
	CCVvA4/PUoUx0VpXsU4nlQjApI1o1RjwVEQoM=
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr90546631cf.23.1774652333905;
        Fri, 27 Mar 2026 15:58:53 -0700 (PDT)
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr90546351cf.23.1774652333475;
        Fri, 27 Mar 2026 15:58:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f431dsm72435e87.10.2026.03.27.15.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:58:51 -0700 (PDT)
Date: Sat, 28 Mar 2026 00:58:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Message-ID: <skmtzw4acdrlovne6jyryurxnxwlgieqtztygzt6u4i2vchtez@edd3a4576ecb>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-6-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-6-06edff9c4509@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MSBTYWx0ZWRfX96LRzUWjsp1j
 MwmnQO4dk6bleCvLwmzHCMMWpw9FFJp6zXGBz1UDEQYj+JGp1wrVqsc8Wuhj/dG/a5ESmUpXf4H
 ZlTvC0iWUe+SkACFiArZ6YyJzxW0WS5HfO3sd2/BdAHhHzTom0gX9N+oa5TCYEqsvtgy6T2XylU
 0MAu4Cy8aO0PZWu/V2/8plTFrp+MuBJqUSyeCHoPVw8uJHL8zCujuI1g5HHjTa8YjvyeZlwqT2g
 xubt9L3ipVLwGK4HBAaMIP4wCXNIxYA4eg0xffw8R7rRHz1ZSTM+mFiqrsdtQpFVmbxO55mejIF
 v2ZFI8g9Pe5HKOn4pWqNSzNCKW+2LeYZcxDCM3Wdoa7hvMZvvZL3vuegtfU1RVH7PBeqxUIwTym
 YAyxwQnQ8DgyKmsKhlW/WrE+sCPRIaOMTtDAj9rglWIi0en+EULE+fs+AY1pa6KGnnyD5FuLTvO
 KkV6iisXFrVZlPkTw/A==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c70bae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=wzU05Ad-4HqZ1xQACKwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: SYdFYuwuYpDVnjsgZaeFm_g8D0v_kEXw
X-Proofpoint-GUID: SYdFYuwuYpDVnjsgZaeFm_g8D0v_kEXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270161

On Fri, Mar 27, 2026 at 03:30:52PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Enable the Hall effect sensor (flip cover) for Billion Capture+.
> The GPIO is mapped to SW_LID events as in other qcom devices.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
