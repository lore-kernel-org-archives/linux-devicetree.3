Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501CF3CC300
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880778; cv=none; b=U6mYrZ+T9geBOWj+QwDQfwxa2uUi0pjbIz4fGEvkEEmDNAqfxx4oNEHmZ8GHkHmcbKHw8Y64SUxmS7y8IZPwRJDfJ/Jwcc+hFaBtP7MRIxt+fgeyjrIoI8i5wal6sTRVBNxG4TN0tta3ZNd6RxTdGjJ//57pnM9sFlwLhAfDy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880778; c=relaxed/simple;
	bh=hs9NjM7TRMQEyQCVa3Yr3r77v0/qCv1f+brc7ha9pts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6NAutl80GDlvtWos4/Ztv3yowOtLcnwhwspSpZy7Uv691BG59IleKp2ArT9IDig4Fqldv3e0bnaI34gvdfEQAfu/lChBXmuJPR3e48krzo22WCBnjp9z57eTCJ9OIySab7Vbk6ouzi65Tef+njK0CQod4jTkXQYCHr0/kakP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHa0mWe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQuQTUZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHa0mWe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQuQTUZd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lHqW1976807
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b26UwHDtQAaqyJzsDJKH54gv
	j5E19QFW9bSzNby4PvA=; b=oHa0mWe1HQIv6z3rlSCMXNpquaoE9uOwmw+7Wkaj
	mEFS7O2EYWyVb0XN2ElICosbzpCjs15KyU3olbheYN3LmDaF92UV+t3x01NkZPKn
	Di3Q8eOAHPWsWTwQP8K0nNxUY/2h7r7Qg007znruZ6kn2BUQVE9qa2QAqcxqyLX2
	V+lHPOTuMi5CDDaKZMzdNp54J0Wjvr4ga4iSNfm9anPJR+lmV38xgupg3Kq4B6Xr
	KFW6DNdQKvd8QZryJ9Y7dM2doJks7Pp3mjjNiQ84FqykJwiBsW0tKwXgXkMpaOTS
	xURkUBSQAu+MDLAK547pi9txsSy75pjZifzJaFQ+jqt3qg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmkgjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:12:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so205839a91.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880775; x=1785485575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b26UwHDtQAaqyJzsDJKH54gvj5E19QFW9bSzNby4PvA=;
        b=hQuQTUZd3KHoXZrWoUHYcTxIvaMwmn8kV73m8TaZLGHDNjuQFOu2QjvM2Ckm/q9Kgo
         QkbZZUpL/TnvSlcngqxqv/BSxvIZqXAqp6OCf0H/U+cTkFupHzY9p9u+fpxka0muxnuK
         He9H3ZLfkd4sfWNFIh/Urje3MjMnoW/Cgo9GliGcqvu6uNUvyWtHiWYuAyuEmpgei5dn
         M0AqolbKHToy7nQ6nBrZBbN0IeJWuSeQRdPAJfM1r/mNqFc6tOrHRKBzU4BnS7nxzkh6
         lhu0DrZwWq+l1z7kE4YYta5wsH9oT8AK7CJ4iPmIgoni47f8CLtFULbTNV1CuQwPH1uP
         PZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880775; x=1785485575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b26UwHDtQAaqyJzsDJKH54gvj5E19QFW9bSzNby4PvA=;
        b=YVAl+mhGVMgz0B9yLCNhLplxznb8JE27GNwOV+Yy6PVBj8NvWmEixa/gz28q9je+Tp
         hvKqzcUTzBR8ehOJikgHTWdoQtZlm/HWKvdTByhNRf0x+b5EWuizQfIWTz6JGjzJDSAx
         exJ8ZrEzaz7vqXlES+W17fSyOxMURbe0EZPI2yyodVUI2G6tGH7Ryr/tLcLkkR36d7eA
         38UBJDCcbrP14yyFG9LIBdsknJwCuCrDrwgHgc7j2EdF3EygTX2U1ci3fqj3MZ0mUeUq
         3I/9j73cVCmnUzK+f7qf8Ye1OWAxqA1xhzH7lfcqVddWkNOGI+Oit6Ga+pYs5SYS059t
         46bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr89b1FyxUvnljByeIzDhVnybZkyPyrX5tLAsCDZrhXWDq7zSTMhu0KM+M6/8jcXJZy9jMxQpPQY2nR@vger.kernel.org
X-Gm-Message-State: AOJu0YzwR/WaBUxwDdkINbG1O7JtH3Y6/RACsZwux+MlYy+6frTo/6Qg
	yTdowSeYVuRV8TOkz4q6pttZtpYIqEiPwv0E4oXC+ymbO3tkOMEWA3JZ4kVuxuCZcgQg4mgs2fu
	Gkoyt1B8nIzPv4PtQnfxKwHjA4+KcInu/TOPRFfcBarGjjZLNwIYo1dcXhjX06se+
X-Gm-Gg: AR+sD11S2Hqi46cj9e7B/KtYKeL3QfCUrx+8SmQptKan5FF5DjNT42V1FQU9IG6Iur0
	SD1XZvMgG+78GFrPnpC2/onUqHJuGYgVNh2LwD+6NX1NHg4JHyQidp8OSASPe9TvzVQ6/3mUbbY
	KWb7TfkYnznYiOw0sz+y0JpIXnBZC+3/0kQIsE3Q+nArF3ccOI8zaUJVEp2NKQiou2xIXXmbxuT
	bi5Ob7fZso+DA4CMJFdtskFNLiKWc1r67XN/eHY07SNykzKRVzlfPk/UxHsiEdun7aAPtgOsldY
	jLpqfOaRRBA7AcVW53EIxPPFmvbcfep9lQjA/VaUSXAHWYCN2+2SH9nQlzl1LeIE6Cr2sIBvl69
	sTnu6naWetRrMYfVjIzTmYL1G9MO5jxrjIrDMRMR/lXs=
X-Received: by 2002:a05:6a20:9397:b0:3c3:bf10:419a with SMTP id adf61e73a8af0-3c44b28fec6mr7026506637.71.1784880775032;
        Fri, 24 Jul 2026 01:12:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:bf10:419a with SMTP id adf61e73a8af0-3c44b28fec6mr7026482637.71.1784880774622;
        Fri, 24 Jul 2026 01:12:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm28343821eec.29.2026.07.24.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:12:54 -0700 (PDT)
Date: Fri, 24 Jul 2026 16:12:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Nord ADSP
Message-ID: <amMegF3qxIUEeXEZ@QCOM-aGQu4IUr3Y>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
 <20260709085149.4072181-3-shengchao.guo@oss.qualcomm.com>
 <20260721-sepia-kraken-of-authority-a5ff1b@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-sepia-kraken-of-authority-a5ff1b@quoll>
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a631e88 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pO2P1Pq6CVdrrqLjY-QA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: cieTKzRLKKfkKJVWh5Ni620kpHwMsZpR
X-Proofpoint-GUID: cieTKzRLKKfkKJVWh5Ni620kpHwMsZpR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfXxlqsecd2nt84
 Gdo4RdmH3+fqgHqJWZsRrq4YuiDsxdepSjvF1tEzPNl9aOKZZK5N7yk/P2ljMApyPvf+VNpHt81
 OV10jfjXUDDXBHB5mZ9xfRe2AgqsrMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfXxTPIR7Z127L9
 goN7RaK/+44x4CDuOEvk0KpeffdbW0qU73X26UeBfcPB983JIEjluRO5yQjVtCi+XwDUw/cIm2j
 3zzcjsoskUJO8BgdK0SdJ0gs14b1BhtBnOmPPtFsS2yMVbkwid+0lUutjTwj2ea1DSSpc5Gfk7/
 TrQqmREROfCZWmFuqTpcgaGn3JbI4WSDWCc/x8nMlBfjeZ6cQtyMok1ERvPdL8XZA20sFq2dEbh
 mfzKuN6Hid0k7T51EXmYpTFcpDVPk6HbS2CbCCtttYJYtwT16igeX+82PThBMfughHTxYKXVq7u
 XeMrQadh0arqRBh+UEwmZOYPIxvtvfSRcn9rEHAw6OjBdj8sNYGxaJ5y2pfQzoch61jldml8TxF
 PkUxfjGnDwngrR5JIuZovncjmAnUQwAgCbPVj3+6ginfb59F4K+JKXCR5iO9PuQxVlS9FzXxyI1
 AJn0ti97PE3qt5CtC/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240073

On Tue, Jul 21, 2026 at 10:54:07AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 09, 2026 at 04:51:48PM +0800, Shawn Guo wrote:
> > Document ADSP (HPASS DSP) for Nord SoC.
> > 
> > The Nord ADSP use CX and MX power domains, so add a new conditional
> > block to enforce the correct power-domain-names for it.
> 
> Then this does not fit here and you should rather find other binding
> which fits your device. The entire point of splitting the binding was to
> avoid 20-if-then-cases because they are unmaintainable.

Thank you for the comment, Krzysztof!

There doesn't seem to be an existing binding fits Nord perfectly.  I
think I would propose to add a new binding qcom,nord-pas.yaml to cover
both adsp and cdsp. Will send a new version for review.

Shawn
