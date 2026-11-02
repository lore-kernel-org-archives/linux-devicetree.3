Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620828;
	b=j3hW43n5fo91DubAupb5j/uoiNNrOS1uQKYwTfpzsFJl7SiaxGoIOGYscSg84rfl73OY
	 hOlxaP3+HLwEa7aCl3LrGh7Ex7f5sHYDI/WpCMIeNHLRM5W7o187wqiDs5hcSHNNn3VmF
	 6Ab+YpOPlcz2r/za1m1DYBITq/33jwR9W1gG+ZZ/3EuON2UNCTEviPCWPos16xNrQsnaT
	 RXd1DJGL2zVNkCD41H91XN4Oc/G/j0SYzS3qEEZnNjP/gXJHLsq6hg65rPloqw72xnkaY
	 cCp+SYEldzEVfL9WZKnmUMbgfZvp1uK6wiLsT1td3eZmCjs89FGbe+RLQIuDBKX5WJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
	b=ofDFxlZJ8/q1PCoyEYHdvn3ZkFqFkAnqA70FwHlcmbrLBKlh0wJdlqPMXWN+Q/v6TXdo
	 121qcOx8s6UkCVaDakMPHr+NK7PSHEzn4nSuKw4Awxod+IELkP6n+c1iY+3CdyCQtigMt
	 KCIuwllL99+MCIVXdQMnmcfD4bqUe4Vqmy3LF+a5H3Lho+AmmWy1ukNYZoQYsAzOsmInM
	 ZmP9lc472XRRp4emWiiYFGjMQHVu9wGUhevpCt8wJwrX+VYJ0dzBvIvlnFYq+2f7eG9pu
	 KHA7uTRe6cx8b26143GYpEjxEtTHxU9w9K1UFLHgd+Q3bG+4L06lcYEp/VH7R+2V9Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f/7QXLQZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKEc4MQX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CF606A33B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323CF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f/7QXLQZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKEc4MQX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6rH213997
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=; b=f/7QXLQZPnwmp4m1
	ZUVYDFMF/eoPWW7FrjclGu6np/3fhIlm418hZsTYVl0UPZjXN2sLW+5BPJx0S8r0
	zs/97Vbad7g3Qr2Knm/qCTgB5ehvfrRoMbd1IH4NO9RYjicr2yl0YWP434iNQ0El
	OjmxptxCL8K0Q1vJeNYjfYeNTYFVIhFzMfzyeDxCrsf/+24iMNn/dTkrqgA5TkcQ
	nrnApZbUEAh+sB13cyupW/r9CUBNaDr5C59Rp+rR36+9avYbgPtNtCHyzoyw80J/
	Y2IN6ryDe5jdYhM/3AfiTRj+aPsCnM+etYp+M20nMw3N7gnPFihH8WXDiMG0CbTp
	UdgDkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sf6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:00:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso31395385a.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620826; x=1794225626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
        b=VKEc4MQXqkpw0qYeZfMINYeYgAuzfbDs4wi1xcciIQ2BClRmlq3s2ra7rTgapx+AAy
         WpHDoAr69z7BA+qTNNYFbVOY05CbvoIB708IXlqXQxSsTDy7okiE3PrW8ZbCwgJVE4rp
         E8jKLXTIaGVzgnFmcmbNCGQt8aR1UvsKA6JCWyW+/PljQK0mv+Cpj0fDDq9WbYzgIonu
         zoW4a+Uf/d8SsK2ubCBsfcvCahlDLoSL6JPvRI2G6p14SlK4C6w7dg3Zr8WaQB+KenwO
         Cb4KWs/T2y3Tr+wgyKZmAF10dA54JBIP06cLJ7Pe5Jc0gep36iDz+Jo+L7ZSpDATP75T
         NDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620826; x=1794225626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MljPg5apEnzZuIOweleKga/OQMxPXsuquwAJikFRpI=;
        b=PpwfAyZCDaXsjVQgJtfZ61ftR+9sxv2jsPlAwqVvDCknoflyeS5BtIvbet/x8TtdPD
         d/kDWtPEOun6SZXJlUiXf9E8joSvxvLrye9RVu+BAR1dcexEHhCqcUcBqU8/rFeQY0Hq
         78Ohohi4wxUB+7SOAWVbwj0eFtKM9onx3geS/LC1lPE30z6aooqJpMsNYTpwfWWkwjS+
         k2nJMuPXqZGLGs36u5tl29qm/MT2Aeq+pa5Q/osudXhq3fd5iioevXet9OwIQ7iQeRX5
         eRin+ZbjlbPcXNuQkjm7xGT/NTd5PyGynAire2HvfxHHfX7PgRjCAD19+nHEDMKBvBHI
         KRWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxruiyVbGSBPrpp98odZroac9XiRmKdInYSE1TnF0VlWCmoUSDhMxJXIA480hEYZkbAvvFkSD6aSg9A@vger.kernel.org
X-Gm-Message-State: AFq9FYInm7NyncWy/Jz4AianA7xbLhPCLin6iQGaJcbdrsBX73DNbm8G
	pQtZl0W+3HLyRc68O7XVl0w4nAOwWUEt8/KPqwQLHU1JGZSkW3wI3vWFuxo7xSQWy5FoEttG2BL
	F91yhEoxcByJKYeATjOkfyAiXllfy6V14ZdyqpRP5+0SaGN0ebbsOJcTGmy7PJj1o
X-Gm-Gg: AYBFou0u7Ik2RZg5W28C13Dlqoox/k+ThqOx2hhqwb0iRuzLIRI1BD6R3rSYRYMrMoB
	o5+v6x4/lnmfZD61livjmiWL69ohZiIjA0BfKNjGOTwkN1HxIhn5O7V7Cz93VokCcXB5/hVx/wy
	3aJlQAo0iNa2nFMd0O63AKI3chz9e00wXM1XPJ/aq0JM+FIpaOcew8lahbG2O08WbshVC6KrXhC
	eECmpZlO45VlTarRdRS3fprMLm6oquwF18hlem3H+uIZKVw61QScaTC+8iXGoG739ULCbBgkwq5
	c9Tj1RfU19yW70OTCJj0IFZJczZUsLVu3xJEp5qGClET5pd8WuY7FhR0MpysEcB/OX1pMqQ4+y6
	f8AAGl2yDSd0xBZ5jTcfF9JP0VbrEkR3vxVYGhllGk0zAxYRv3NB7IWh2recieVyM/s9oV5A=
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr1606916985a.4.1793620826334;
        Mon, 02 Nov 2026 04:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr1606909685a.4.1793620825694;
        Mon, 02 Nov 2026 04:00:25 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm377507566b.53.2026.11.02.04.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:00:24 -0800 (PST)
Message-ID: <7264dc6f-ff30-46d7-865e-32d050c8c4a2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:00:21 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ECgJRMk5zqaJE2c7hSD6mGBow4Bb-c98
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87b5b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=XQlgmqBj-IynFr2M_OMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX8xeKkQP8b5/G
 j6v32KxxHqP2y1pYVLok6Wj3TdWmSEbtEnBqrtppGfh+PyTK6Xw4ZysXije8Vyp4TEZL6UXgtsg
 9U+DZ+l/S6XOOakzLWkd12oEDd7Ydr0uiDRpWotrw/j1br38K/l4wOfZKrO3WE5HdTsciuoOugw
 W1zxD6bpG/XomXDOrkg/CN9+JW++3VAREcsaQQktaL5txEGtkcUu+VCJUi5Tmv3ppKV2+/of3D3
 qxsjwf8RavHPGl8R5RmWGwsTwpQHs44JGi0eRsaYJlEGeFsWqqZ7uSAR9tzny/KLMKSIfF4rdue
 k7dP80ejK+AuM/X0ZmjK+62zQb9z7jVXnek89VNMsbxqKusUMNXD1h/8xbv+5VLk5eq8XfMA1aU
 9N+jT2ha58GU2HXSLjq/7AdNk5CVa5R+0gfWT8MfF5bERv89ox0ccg8RksDHUQ1icn9Xch5O3yu
 sDqCpPLxnqxX1R2/DKg==
X-Proofpoint-GUID: ECgJRMk5zqaJE2c7hSD6mGBow4Bb-c98
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXyK2Jrt/z0kkV
 JZ+TmgCHd4oIv7ZVzw2xZ6ufQ3abaVYknb3Lq/WXeH132equoFCAjjUoanVOqASuMS9CknuOWXU
 EYjrkcWPqhMzzFwhVb1dwI4lQzhBK80=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Many of these are fairly low-hanging fruits

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
