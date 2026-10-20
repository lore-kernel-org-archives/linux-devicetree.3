Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501647;
	b=zZYVJ+mj7AbTep409RuhyUWXZG7FqzSsTqFsO/HGsWrGV774GVGLspAABWSfu0NzapvP
	 y0SoUdwY9knT/rsaiRpn0Tcx+qWYYLzx8PaXSWarLynzPzyPWBAJHCOUoIVst18OmrOaG
	 DdTqtINqGSQRT2TN+uBSWaEMj+zkgAbIYnrXOHtF++L/FP1B3V+TF6yKrBFf/oDn8S4p0
	 wbrU6x64fKbdKfdZ2p1z5X069iPf/ImK7tvdd/BVmKBmbFnaxTN4F+bqd3XP3aoPcO5K9
	 SIepdnD14EE5jHfkn0ak2UeDBvYJTw5p9WP1E7F+GpeQQ1fS/Oyr4AG6l0lBo+X335A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
	b=ty/SgPS9hD3C/LZCinWxCFJMdSl8qGbYOPYU4NjunhDTVU8g90aCCzsQCUQvQDdtAaY7
	 GdlK5pVB1mgEKPnF1LB3byHB+mFgvKInf7B3zWoX6jeC6bZzohHOWguM+npWPwaUFLKGo
	 JXIrtzI+bfv/6c2Z5n7OW6Avr9X+7/QSZtGKTfCwxrgLqk8PGH1wdpRb+xBvOcuHnB4Dz
	 cEnjWS3fAKHulSVcD8pMDdNtusUHVLbFH01pM/DU0CPkTMVm4B7t9iDf72pXXWXnAt+Zd
	 /g9omdGEu5hpEfo+PuqEWowSmLWKqDCZowm2sCO5Ztt4ydIXMKGiVH4dc/d40s1eTow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAYYT4V8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsE37CBq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0799606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0799606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAYYT4V8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsE37CBq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KChsWM2239646
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4gduBN8y/Akb5TuPhoYpqkFt
	KFLolNkjuTQDl1aV+6o=; b=OAYYT4V8z50DfjzUMa+yqdRtNxhS9fwDbdY0tsw1
	VrTptOsnHlwyf6k4Z6VNuOOy/5pol8DVeORyuXsgKvrxvsZJdzbxVlQa+aCFSOLy
	8XURhBCgEg2hUMiZ8Z2uB1UiABvuuMp9Ma+i8ZKk0LlUQPIUK5bM1TYVt+vVSqVi
	kYKusc6VLSY0y7llVaI2qeN5Czt35Ao8l7uHJ2DF1ZWmnJZN+TLFER84Ust8R2/z
	SR0fXdHtB+BANj2foRnnKwfWmjk9AUg5SKkIuueslo9SbDh88JvZglY9u1r9GjtT
	D34/4g53Z0xIOjWZN92pj9HGlZvs9I96dDYUZs3j9rkQ2A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjk9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:07:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc48fbca26so698917137.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501645; x=1793106445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
        b=HsE37CBqjQo/lE3dvKlMwvywhZaN7OWN3zlmv1S8kepCH9tBR4P3wjqLVHkTLvrGch
         mXnrKhY57CiTueH8cqunisbTrOlKv52xbnP/6Qh6aOWV1P5jXwfB+D/k4T+aGAZjBHl+
         SU+jOUqpdPLcOsImMjB7Uelpj9mgPyfOdwZt0XOw9J3biT7TQ2Q3ixR21FqNjTlcNxTR
         thNZlr6lfd7fPNZJJEqyVWIh+Eq/aSbwfSobLtMhhhNaSBU3GojJIX3G5ngaTTx9Chml
         Il8kH4dUB4wOAoMuFEEXdLc1X/QrkdUgMh78uiJhabNt8zAVFZQkifuy4bRnrnBgLP/t
         Fj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501645; x=1793106445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
        b=iYcbDd6WB96WBKhu1te74S6o+c0PmpEpuTgpJyE3/GX2/2q5gFjYruDY6u+3rd+P4y
         SB+KPdpP7N7GS84SGgRq7du3IxYKPkxa2pkK/r9uuoIrU8o5W9rKdDiVu5UCHAt+BKVp
         jJfLZASJ08XXTCRAl9Q9zQ1AKZy0OO61wiH9FC/5yDzITDx0QK3j1lXDFdQn0Rb+9cc7
         s4W50RZY221DKC86cEomxVtRAm0nHkBSllhrXNtDXmgltYmxdhH1zFL/e7u8HTtBS8g3
         Diuyoff5jIKaMD80CMRlVyVyzTWoQ3aLtzUcwXSCQKR06im0dc+wpqQF1rJZEoUGamHv
         MIZg==
X-Forwarded-Encrypted: i=1; AKwUvBz1+qtMQ/w5s5jV2GbYwnFwCoPeLDdzpHn/jxj7Q/o6pccEZvV5m9UDloD+pXhAK4e0FtUBsLOriJTm@vger.kernel.org
X-Gm-Message-State: AFq9FYLFniVLWA6xDZt0gGUj3k3qYSC+Ez9Xpk1NOT5PZjsriniPiXTA
	8I3MoQEx384+GMQwkOXzACeKAGELKEwA0rnITJiQa6+vYauTCnPyuzSZUq7SP+31cSxedFRvDGJ
	RqFGPGHeeVw9OPT9lgdbHmksox1c2FFLdQeVKt4OIje3J035xsMNovYfBeKW2ox5b
X-Gm-Gg: AYBFou1QA7QayH5HZfq56isQuyYeovb6ttzOYsOHbAFYZJNr7y7OqsVIXL0OOMBefw5
	pqyLYS5rxf7rE7STVZWkLScO8ckrV9OMEw2j1RrCe+TWJJPIQ6Rh+JUT9GTC7ZYuvbq1Qi3+Ylc
	qEq6xoGli4PeARLb78ctxhOZ9aK2qkAkYuf121np77wtMxLvLXziusXpOf0kFUl3B/dZLdKlwbM
	UBX1w/C0OKCDQ7lUL6Ln2oeKmG4fIRrZo6MGT77O7QxwDpPxzb1fnSUwH7NbxAidkCnq5mN6Cs1
	3p9sI2vZJrGLdLkZRSRZCykJY83YJ42xVC5s7lYjnog6bjLgtv7n6p7MLhU+KZeqjWxVmpQJe/8
	63t64DQCDnrYehZA9
X-Received: by 2002:a05:6102:5809:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc3697d329mr2732869137.15.1792501644893;
        Tue, 20 Oct 2026 06:07:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5809:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc3697d329mr2732853137.15.1792501644217;
        Tue, 20 Oct 2026 06:07:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm64448535e9.6.2026.10.20.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:23 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sdm670: Use ICC tag defines
Message-ID: <lxtdscpjqwmu3gt4rbdkiumzi6yv464izxx7atwfcar7fabit7@rsrp5sfxlr6o>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-4-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-4-cae8d22649ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad7678d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i2oNlF0cj4oJyyjMQKYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: EJWee_1aO9EBFE4WODQzKqvkLrxYWevT
X-Proofpoint-GUID: EJWee_1aO9EBFE4WODQzKqvkLrxYWevT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX1X+F34P7I9al
 5dmfZ6TtYgTKdoto8LcXmdbKrFB+tx/8THf3lW5ppDE3wODKAPW/WqtethS5o/im1lhmggbaUgg
 tgEzaVNY6ut99TbYSUblFVxL0vkjz7JjVtWvHGSVxEPUGE42i0A+I33zgkVKMRQOUDVEtl1a84L
 HQxdwFZBE5uIm5h1LA0m2sFK+BYNHFJJkNBzLKQ07OVkpWio9PUikvHQKT+uWHycGzR2T9lqKVr
 ow19rY1t/eTb5Eswjv4pr5dzGWTdNN+FELYGgz/2w1TRsvibVQjVxDWAqlKVRJUbQz7mPy64vQJ
 q0aC2iwRhYMRf4lM+t6YSTP/NrLytAQSgdHrV2ApTc1CQzmFyHGK0IF+to7/w79TjxHcCX13U1C
 J57dl5vse/m+eZZTYUzgrX8gOyBXtLE1dsQ+n/Yo1puBURCYpVIqykFw2RFhBHs7430UkrKCvF5
 x3AfvK/k7boTf5ujQeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX2sWRLOiGItBa
 Z+o2bF9b0mACaQJbFA+2U9cRNsY4S6om2lhWfFQx7uk8o++92iiwupwBbFyt8RvwIjBYKOZj9kY
 k22tZK26zBx1ru9imISXGBnC+cgSZU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:08, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
