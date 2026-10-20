Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501684;
	b=rCjLk0YzlshBAYPtIYJWpdrRKJm9KNGQEnrKxJk63WLypJNHTfgaakhV0EQFEgL5swXS
	 OotrYXJVqtDb/fztbAtwN/GRfh0S5UTeF/aUDLALfmtpxkRHumMKIbIUk9MPEdoz5duoB
	 fGm4qJnLKd3yDx/T+fzN1DI0ytcBsHAHdLuoqNTfEpLRoZ/sMXzD07eUZJ/u3WStlOOc8
	 4uHPwIpOgeKVet5NWxhz5UiqoBCUIo2XdaLvupRp8jJHmMv4s+ok9BbIT/mf5UJB3fqfg
	 TDKjfA7LcUjC2wIB8Qlqp1GA9vy5zPZg+a9PPHTipRT6ueeg49b+WdtrtxptKQIW1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
	b=IlBtIDbOi2CPSMOqaErK5q5GLho3MvyxE+RGOU7xSW3c2h2FySLdkmN6qjjgpq1219TF
	 y2EnlLKQkDh++YqAh8m8NMAPKGghMrUDFjmE+PIr9ukC7fVULBEN/OzCJfg4r31lzsb/E
	 9KnQNxRCtJSx47JmxdUCiAAcaP1XpitRsg6IJ0oQcpZgxH62XEeQ4dqYa4bMkquWJQA5j
	 j/6wFcQF6LKSA88zwHmBNqjsjR2yblyxxi752NKGfeZZt1MRECLZdVCCaqLrC93LkhrfF
	 tlavHwU/2oHejIzT6AJF6eY1lEGE9JKA1K9W2Gxk7aookGbbqFFAvE9uBL2Z7mjpt6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CkYlAD/G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h70d6fWe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4B606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B4B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkYlAD/G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h70d6fWe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxaft927015
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tsVaM+X+He2qAXNYLPkW4269
	T8viIt6nfU7YTJpM1Fg=; b=CkYlAD/GZ9N7jQyCWq6NWS4nrvWk3+jaTlzasDFG
	rmmDIb9ZcEzE/UVXvfMcnRsLqPb7CtbFIPtHBxMIXV3/lRGNVcQvxDqfkIfJcoFa
	rsa/fGM8wZp8MFjXhmOdO9fVBz6lUklKO3J/7kfcXF9bhZaG7zphBkR1D/4CATgk
	RrMhKZnhVc8rHvnr8Eb961Mt2mycbTromUovOyTE+aHnljJu4vIvWulF3pZJ2v4M
	qLkqNbO4FzK+6Djl2w3Iw2cbDwIArDUd2F/qZMi0C5AxONHjmNsmO8v9VCW5S8+6
	FWKCW+TL/FUpS48IRboXZBj7g3wEYJqdKOV9VyDTop8yYw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pakax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:08:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso548720137.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501683; x=1793106483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
        b=h70d6fWe3663Tlp3vn5QMkwzVNZFJt35kI2ZyCXpUTp33JXfVU7EzDfJyzHwEXVSlL
         4dIMJbYn9SkI6SKFhL0pqHfoQJZe5vqPcZpIoLkDZacYY3ISAB/nlREMNg+4y0GPK7Ut
         g4vYXg09xr13x4LKC2v2zCgrNwxet1lwY+hQM9u3o+RQ4jPfXr/aGimCC1tNtXJ8QnJt
         gESiCgHRF2yQz1pL2P1mFbMAQRQ6XB2L/ZnVsf5pTvP/UJe4rhyJ8kkpkg4qMh1mEbb8
         g+dsbQEkoG+t/xVqofRphZL213Am12xE96SfCO6pUA8BMhqYfH9r6AQLnLCv9s3IpR0v
         lZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501683; x=1793106483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsVaM+X+He2qAXNYLPkW4269T8viIt6nfU7YTJpM1Fg=;
        b=OOpukg8ig6aitQgd41fzNJGd60LLUQsOw6nUlr7uzCHSKKHIxpSPtQjWkDpbWcKkdr
         zow9K2wr9PC84nVl3d5FtFeQ3n+XZRkV2ODn/hQ5kErFe/YtHPSHhnr+euB+yTWFf0kK
         QmsLTjb/IyEmtWl826Vv/DbWYS/a49vFzG0XQ/zFU0gWCng7WdUHodq5tjYbFbTt9/nJ
         2Q8DEmgbx4kjFZGMIC+q56ymHmvRkvijxQNX4smVi0ppEDVN8mXZoeXzmh6Hq+Uh/0or
         kkX+rPzmvn7bwWM2PKU66YkoMaEPpL5jwuWbH1GGTyP7wAcYOqcSu7XkV+ki4fz7cRI2
         +yDw==
X-Forwarded-Encrypted: i=1; AKwUvByC2pJ7tzRUCW/X83VxtG0svg4NVGtjVznHM5x4bnHADvpzRSGOObjaqQ7kbEfMOST34B5mzNBtiyK2@vger.kernel.org
X-Gm-Message-State: AFq9FYIHWu+MhFaKormlRt2wHzTYxEmiaiiUsWOx000V7SeOMknouZAY
	V+//OQMUW5Mx4r3GhtzRbSN9gwk5t4MPvz3M8OAGBHuZ1/g+sxVyK4HPItka3+ulXdgxtFaSxGF
	jfrwhzbxYAr25jolJ7A0GqRpBqqvIX2JqeKKOrYXAusdiHUTZq42NutQyXnLQlAo6iGk3mRrD
X-Gm-Gg: AYBFou0V39LO/oPLInKf8wByhfoZ9sfoTkJKyCxg7D5G6G4Oc8UNgz5hHi3dWmRHZ/W
	U2Mc4IcgcVGdvW9yeWmk/iGFrC0bXciTwwUjOCFuAKkwSQsd15mFXpCqlNCSHK8kSkadEzpqT5l
	eVMkeuRZZGSbxAWDmJJhG6PSoz1zdmXrUu85iPISYOQsLKd02r6/D4Hx30OyB8NPps/+99xbUfI
	PvqHjmp8x1V8HGhogEi5WCq5Vjy8dWXGdvsh0n/OEofuYUmleb8Pq7gc+HVEmF8iRfVmRyiIWzS
	DNPtZZxbLm1FkRftgSA7bgDk1BA5W7Nzvx3gUWdPRYL18YrZh3aiPbG9792Xzid5pag/yAoYGMJ
	3RgCyz/BwVhNud1aW
X-Received: by 2002:a05:6102:6113:20b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7cc7bc8f258mr360518137.25.1792501682572;
        Tue, 20 Oct 2026 06:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:6113:20b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7cc7bc8f258mr360506137.25.1792501681954;
        Tue, 20 Oct 2026 06:08:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb6d82sm65693245e9.5.2026.10.20.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:08:01 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:59 +0300
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
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8150: Set active-only tags for
 CPU interconnects
Message-ID: <6ydb5v5dpryywosyjbovdzedywpdpdyc3lmeea6j52hpp7b2ai@l53sdm6i3emj>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-6-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-6-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: F0rAO2koW3sFC8aeQ_8Ov11JdBS_Ez8Q
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad767b3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PhDoQi8S-v1mXI6LFy8A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX3KhAtSffJSqj
 Hu5jF6zJxXL3KSLMP2Ferl5BaSr9I5mqr0i4rdQjPimLai2XIrEMgac+lGbqW4LgLYnOXV80LDo
 zE895+2urX/afI2S8wkwZFXSa2uttzDjHdXECp370SyhKBTJ1DO8Vknv8Lv3q6q4Q40MaN6mHSI
 ZvDtQQJd6922gwMOBExhwd7DWrt340oR0UVAi8ZZiT10p7c9C8NGLj9e+jyJSli/6uSxlwqI/of
 O/o35qgsPf5NF5N8pxgvylrBTC3riV2hVZULvFYM1EL0iJKZdIbstE65Np9wg5cR/+6Kz/jDbXk
 tKho47zw7/PJ4VgAr9vqbjrFRZXHMOW7Np6+VLTexPMSpJZWkkOXAUUn0myoHSHxICUub5fGp1a
 8YTTX1pG7PxQxuvhY7RenocSPyRH1IDBfzERTxLgotkWqTN+ppbl5G9WTCEPqtpm34QI291kCJ0
 5ro5j6JIoetPdr5W7/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX1MrotvzWCZI0
 ctsIKaDVpUehI3aPsSUVpIL0CwiU8bpbQ/rJrNrlcmqRZMbPdGEO2r6eXW7uyuO9k1h83yYgPdJ
 jsvC5wD33KBjWfhyc2m49v9NyWXAEpY=
X-Proofpoint-ORIG-GUID: F0rAO2koW3sFC8aeQ_8Ov11JdBS_Ez8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:10, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> RPMH lets some votes only stay active so long as the CPU subsystem is.
> Take advantage of that and make the CPU frequency-bound votes behave as
> such.
> 
> Fixes: 2b6187abafea ("arm64: dts: qcom: sm8150: Add CPU opp tables")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
