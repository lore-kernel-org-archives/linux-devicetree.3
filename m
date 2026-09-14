Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3EE41D207
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376297; cv=none; b=kevGArHtcNBQ7Ey70OpEdDbrgHd5y7gxcqQVI5dtiaBzDsnHVHel0BzJBuivBktycxAwp/IEF6Ehf0QJ/y8iNGRQ9coletTCjG65/yr2vEPqa7B3olE6317MNgo2b+2FQsLGuS+wW69YW/8mrve1N/DqIVvxHTJ9hcvgFwKbhek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376297; c=relaxed/simple;
	bh=4d05JrXTCB6W9rWQXzcDKJORFk324K5v5YiJJmweohw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfkP/s0HTipHpgO5w2bP64qMWUl7BQfNXJy8jaBRZn4fjcNPVRPy03djqXs+fUJRS3lWb5F4FXRW0F5fvTvvLpaGOx0RF7/lMsSYiqgZGGI2ZJuvKRxaLCnuS5GCFiT4QDOA+phXif7xxzkbhE7JxCJj0jNapghAPDMVZhy6J9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjRJKOlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQLPd+c5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjRJKOlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQLPd+c5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7xxiF3490217
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=; b=WjRJKOlWIyp+M89s
	zQWRyG8WPM+mlOhn8c1uoBXcvExKhTkYEvC65LLaNvt7DO+MN44ef32bHUjCTXB9
	VdbBZuJQ5wogM4C8aKw5CnlpzFFXALQy1pz5UPhygUIxpu3QMH56TGpEshBt7yA5
	waN/VFXmC7UXN2PQ9EwFAdJsw74AiWQ/9P8QJWyfRjrl76U0C53aYsnK0douK6ff
	UgA1DENksk1GBRFRS7IHh5NHHFBdnLPw1R9FUtqHLusXdnUBL09I2oiZ5XB6yi30
	V0VdddiL2sglf9DrjVmi/2F3ASKFrJknCwjnAvZkAzn8E2QQksRwEQgHWJ3+DDKM
	0GGLFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f06a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:58:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso47748085a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376289; x=1789981089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=;
        b=NQLPd+c5FDzeKtegua/YwE7eX2wHg6asDpayFxK466iiJtHIDebHzy/UTrtqZncj7Y
         eZVq+HfnibCImq9uCbU7nZ4hxcq4nUxkjctedJYIbsyCga+LVFOwyt1BhW77Y+a6uAX5
         UphZjGmRoBSfWYZVwfV85OpTVQR0Ml6HNHYZ8rFdiPdSjMM2S2voM+V2RbmwnfsgdR2M
         7pcr0ewLjrZCVkdXHbZw4zk85SRNicfA6hKh4VZET/DM+DD0Fp8svrumFJ8OXC3QdOn/
         quBngJOob+pi2AsnuUkUtrorgjZbmce4NQbe34M1ywlhJMqlRARGJ1nL2S+6oq3LMIH3
         2sMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376289; x=1789981089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=;
        b=KN8vemUUvCGzbs7EJl7wxzTPbl2dHUlKJJ9IX7aoGGQhIvdy8OXeYljkPfv3r+Yvqm
         mPXI1BGC57gBFzUtTTo1Mfm+BMFE7LpVLOE5RbQzUVSHdT8O+ORel4SIIAcihmMCES/N
         OlXDNEHsR+/DZ+g/C8lqhE31Bg6lzLFnHSP8XpWYDE9hMv9qRtuIq9caDNACwPexy2I6
         DWrPeU5SyD3+UIONeVb10EnhNyB4xUCIVI/RnejYy78ctEiXQnpVALL+6SySdacvbI5I
         sQjLGDXThCGmo+IA/99ccpk4FxNTfb3p3X6j479iaBZA3pIJTEp1zoXRzrlXL1665VMX
         7vOw==
X-Forwarded-Encrypted: i=1; AKwUvBy8BTyE8KuzYX6qZg1pEO8iumPhHmGam8LboGWYDWhlAr9cAZI0qULN8m6Kj/G9iBjeerBFXD08rStS@vger.kernel.org
X-Gm-Message-State: AFuF++lDx/RYdryHEIDNW1tyQEMVEBZI2FuPuDeoicDXllfjtv1+UiAg
	vYxKWGAqodq3SNxl0P8upc1U8aTKeQRFlV9tZ7foDwUgAIfxp0sNHg+xlz0p1XH4/UUD151J1gD
	GhvpvuqOVHRDEeCNTmXn8bVUdqY3b2woH598rYVptIHpzMlSSZHEP2FULQb+1DIL/
X-Gm-Gg: AYBFou0TxmzsSxVKQpcpiKsMbRQ/ADeFHVQd6l4U6CAns/ORUOOmh9Wvt0swnl7NlaV
	p1reC5qZuZgEcTpYzlJNNvwpTix/poXED+vYb6GLIRRdz2yOI82WnszIqzZzzcw8F0KtKfoXsFB
	10MAwLpxYHd4jibs/jcC004e5c1Dzn04QPiHCTxDp/e7kr7mMrsxOeAhapHBTMR/VcBbzBegUYs
	t4XwdhUF+3YL1uFgVY40eJ4Mx8LfWu/EZp6KJd50mju61qxDZs0SFMnqV9PlJ3kdR1E1u3+tNGP
	7TRo4sI5Hbg75vwR2BKemCJOLDzZqF9p57HpErbqTylyycfJ67MeUJXuOEe4NTPXu6hbvJQWGWJ
	7sUi3r47IWHWyFbvli02JtQ==
X-Received: by 2002:a05:620a:258f:b0:93a:14c:329c with SMTP id af79cd13be357-93a2979a599mr197349185a.1.1789376288708;
        Mon, 14 Sep 2026 01:58:08 -0700 (PDT)
X-Received: by 2002:a05:620a:258f:b0:93a:14c:329c with SMTP id af79cd13be357-93a2979a599mr197329785a.1.1789376283524;
        Mon, 14 Sep 2026 01:58:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm392151166b.4.2026.09.14.01.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:58:02 -0700 (PDT)
Message-ID: <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:58:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LDdlk_n2YV1jRKUp8m-hkf-fTzHvBwTW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX5eVNQy4+Ita0
 TmgbTaW6DfsbyCrCuxSMVUgdx8SXjtotacps49Z7Wg8kX5tSM8kbDnAjj7mTUqzPZ1RSL2lL95N
 EQu4ajrVZlq65C3Xr0f80lYE3S5XWcQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX9I/V7HfwCA43
 kYgvnm2Pyg9Ygt81OT1I9YXpvxyHkWmjrtNVhrd6O8jBQZiHP40jSlZMEZm8CB4shPnQEuUfGEU
 5dshE0sLhzgai6MwGfGA76bLdQDie/TcG8d9191Iqu+0ttY1gMGr+wmWRXPkH0yDbTsQjtFRgvW
 wgKgboODxC+0nex/mbW0Fr3jHQLLqAJFSWG98eS91hNgiB3T1YTiTcJ0aMtg5X08cU944MgQhZK
 kFjtZO5uX/mK5jP/A9SMfv4bedkrNccOd9/50JCYmaLgYHl1xo8jQW81EWP6syNTblcfgg9Ba0B
 qf/W2lqvGCMGXW8clx1x6h4ZziGBBHRj/tFenloS6ToE0fZRrnrHBn6vdoDKyJAeZPpDHbUYar0
 YjzCzhgmXQN07YpEQwXsPaFsqhgeYmp1Qp6pmIELC6VgHmq9/6rIONlB7OewBkZ9pWdosMhPe0s
 +OXrpBVGPPipSJOfpMg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7b721 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yfiF4Zao35L6hQxt72EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LDdlk_n2YV1jRKUp8m-hkf-fTzHvBwTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140126

On 9/11/26 4:20 PM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.

[...]

> +			port@0 {
> +				reg = <0>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* Same as usb_0_qmpphy above. */

Hm?

Konrad
