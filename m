Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21991396D00
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 19:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503806; cv=none; b=iwSD8/3cVKDPyY1FLxD1h6mqD1y39T2FxPjZrMw/r6ffe9uZnc9B4jbYwn2jeeMpw9hS2W54aO7HFC+elTb/PocYFf4t/U6HxdUVbJnSYNCye9PUesqQcI9PdR6dNbhlac2/UKijbAHbAIGgJTXBGfUpNZJ9vrqmdzBoWDLr8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503806; c=relaxed/simple;
	bh=bdTEcQjj1gH1U+L8RU/U+V/DFqPQ30OwOaUs79vlMFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPWFKTc7EUaVaXho26SvYOmEJ8bRwbL4BEW06F57EXJzdSe1VpzBXvkxrNnk0eyfVKlz96zOf+iJUkqBiwey+Jp5HH7ww8Ek21k1QHHYjqLbQPrO7xnb8/Md+SPhfBft5n59vNXjeT28Y56CeGQIeTLsIlZzc2QiiWYZ23f1Vgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH90Yzay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNjOHgE2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH90Yzay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNjOHgE2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636IgP8t3189067
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 19:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=weepYdGIuw7wfXvrgsrZhxyW
	byT3XjFd9OAiFqiXTWQ=; b=CH90YzayVXYgR2A9BWq5UG5HybS+gSC6a/NDTSsp
	cORwoExc04yFw2xtNFWjww1opEmBF7TT3DJEx6H0vtOWShcHCT7x8zsXTqeOp1A2
	Jk/Ac45/SCO6BAOAlK7KbiweM7TxhACyL8vXFheQo+1Qdo+1Y/TWWL4Yum2jLtTr
	3HYosuCXH0MafWEr/DVemS2ytqkecXdCfWnVFdmE07/9LIsa2vU9F9DO1EGkbgYN
	8uU7Py3jWZHcbVhl/1Y1YcJLsL2Mve6jogTCvYWmpZKVjnLMS9MwTPLPprKH/TPQ
	j2bI/lTS9OR8N6v6VAspZX93rwjROAnsEhIp6bOrFIPK0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcff58uk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:30:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so200079561cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 12:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503803; x=1776108603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=weepYdGIuw7wfXvrgsrZhxyWbyT3XjFd9OAiFqiXTWQ=;
        b=VNjOHgE2TrxXpzf3gowk9RzMgoRYP1bmKojR1yLmG6/KWCjkiIOhbrNuxzTVPh9HoY
         IFm8IbzACPE3wR7zz/tUuQbfUgpksAD5jSblID19zyvNEiJOMKSOPKr1XHYmoH9Rexdf
         5OSUSQpqdD6vy7ZHfgIuc1YpQVEiJEC/ucZWHHVr00X34h5U9txIjhyQ2dsQI5MXZWPB
         sEw7AxExXXfSEK0rKGfLQo7ipM3C+Q5POQsfUihg1jxdfKnxeQ6OSteyJm9wma09H1SK
         qpDVJtIgiEB9OVV8fiiDyS9RbvKZYlf+uEzro5wrjt+/w+1Pv6C216wRPnxt8bD6mfmQ
         Crpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503803; x=1776108603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weepYdGIuw7wfXvrgsrZhxyWbyT3XjFd9OAiFqiXTWQ=;
        b=rj+Ld7yJnfpj8w+BY86nBEn8LTWmZH53DTil0S8GKFFKYRyAnoi2Ra9A2DCFX5xOaN
         zYk+/PN4fJox2PYF7TjAwjwQlErkcK9E7Gno7QrG/qT26UM60w1o57TsA70Jypv4xFp7
         UxKD4fTcSh8oibfx99fgdRqQ4u6PKd6Bo/2DINzGANycg7iJmG5XjElDs+QgB+l6iHNl
         KE5+hYQ2I/5D1EwpQ82fe1hIWuWcwn9ZTYiFh3R4/xnoOZIZV8XrYNVUPaM/4FlHWZkO
         SKLO3ozEvMbyBveHvZMCoB3HwRLt4vD88q1CnatYoAqP5GGYFuDcGFrVTmXOHaYkVGj8
         hQAA==
X-Forwarded-Encrypted: i=1; AJvYcCU8k+iC20e3a9q7I2gQnfcAiQnjhf7TqHjWWaIiWBYBJYNtzIemZzcTZ+k7JcxBVn+FD+KB9mOw9FmV@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZv6ErK9sKwpCxX6MLw651NCEJ+rqvw6MBhD2UtOI1NpfWqXc
	6k81z/9jidndduggOT8Bb3wcR/nGtKR3kol4jsGNpHTZ0BNt4HYggfXGWXCtmt6UC6T/w4qfJVz
	BebILFbLZyZlod0FoirfWQXxBez6EyxYW/cw4TCPTcThVJiyWJlm5n4wyuR2pqLYD
X-Gm-Gg: AeBDievj6Z+z9gnBo5cZQYuLOpqwEBVjUx2Ej7dNHRXWLfML+T/lCgv1KKMmA1x+zlj
	TCJlajUEpRyIDEkzbHPRPoBsMISU5xqmTfgGNxSXHAyWTVHpX6+IkvkZtarxkdOZLkTuiluCDEk
	c9S+fMvYuwefsINbrOT+vVCUq2OmNIMqc5ZrKAx0cNtvny4AsmoTtxo2d4PJWoWXK/xwDPWIVzy
	e9rX9xxq8lIYLoDEqPu3JITk98m0oAcUyeWPVWGllUIQ11VDXvr3lh2wOFPQ829j6wsKLIdlhBZ
	xHruHUcFQQ0CTDnPMm5pe4oZy4oKeGxHk5qjEigfavINGsRoGa9IlOi1CE3AZ++dqVVdzBEI59+
	9GxkdwJ08WHzmHsCMFwSimJG66H6IJ9jEDLuD3/Q87JPPYylm94+y5Cm5DFoZpBEoxHuwPL8Btw
	vvWXQrnY1y+XgdaCtFOZPGd0WuzNxswlZYCWs=
X-Received: by 2002:a05:622a:514d:b0:50d:9033:f2ec with SMTP id d75a77b69052e-50d9033f8a2mr75248671cf.50.1775503803365;
        Mon, 06 Apr 2026 12:30:03 -0700 (PDT)
X-Received: by 2002:a05:622a:514d:b0:50d:9033:f2ec with SMTP id d75a77b69052e-50d9033f8a2mr75248231cf.50.1775503802773;
        Mon, 06 Apr 2026 12:30:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd15f8sm3507743e87.69.2026.04.06.12.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:30:01 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when
 doing rproc_add()
Message-ID: <4e7pymsle2tqbdferfxcdawzlujzp53qf6ta33tc3scloaqakp@3mizwzicjopl>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
 <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
 <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
 <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
 <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
 <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
 <adPLDWz6_QmBa8w1@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adPLDWz6_QmBa8w1@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfX4teIlER+Taf2
 4QP7tIbbU85PBmN0HHeaOJzQZxMFI8b7HWDXsTjt5UkBpiSRZJ/BpFrLzlr1jtjo0gpwp7c5wFf
 Wb4EqhcoyN5x+cQCwqTwq74A03F6ErV9L0c9ZTWYmtm6l+ieKQ4HZpbRYEsyG0PjD3NT/sc6vr1
 sp/L9tB0wdGseaqluGVH1okV8TpC83atn3QwDLcLU0f0ZZmhNl4s08O9knYgjF4JCESMcc9l9Fm
 oNNHFzEpxcLVxT93mzZISnn/WcsrGyNniJhiTHmqekWA4lsNTfYD3D4IMSytM/lMUenWgxvjEj7
 cCN7TpVuDbnuJOgsW7/oE/8uM4GKCV5dYxp99PIWcqh4Nb0RUqZSCHqJ0ZuwLgVVB6wD+BtCdvO
 KgGggpeqNY6ZpY0ylwDiMPkjgNsk2sCcJymIBKjD2tlYnKbsvvDs3RDHs5UIcS5cTE/r1gxBpf0
 WBitjsD7ozVSzzQWOqg==
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=69d409bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=IGH2JOvre0YMyb4CrocA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: RX7Bnk4EikpBVnk2oxZJueq1p2NhYIbn
X-Proofpoint-ORIG-GUID: RX7Bnk4EikpBVnk2oxZJueq1p2NhYIbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060191

On Mon, Apr 06, 2026 at 10:04:03AM -0500, Bjorn Andersson wrote:
> On Thu, Mar 19, 2026 at 01:44:48PM +0800, Jingyi Wang wrote:
> > 
> > 
> > On 3/19/2026 1:23 PM, Dmitry Baryshkov wrote:
> > > 
> > > Isn't this patch necessary for SoCCP bringup? If not, why did you
> > > include it into the series?
> > > 
> > yes, will squash to soccp patch in next versoin.
> 
> I'm sorry, but that doesn't make sense to me.
> 
> The SoCCP patch adds support for attaching SoCCP. This change tries to
> address a generic problem shared across all remoteproc drivers (that
> does attach?).
> 
> I think you should interpret Dmitry's comment as "why is this part of
> this series, please fix this problem in a separate series".

Exactly.


-- 
With best wishes
Dmitry
