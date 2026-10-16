Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E04457E6E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141424; cv=none; b=cto2oHZq+qzju4tl6prbJYzJ6H097K049napXm0l6DGr7ZGuu31Etl2q8XloVFYE7NP4tNXOxYzMxyn8yXsx3Ei5+4i7mTmL7sl4jRgCEHTfyrYE0Wxd1FNbzcq7QWUJ8iPvNUzPBzCtpKtFOCCE/ydW5+dAb6hicR7hLIFWvl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141424; c=relaxed/simple;
	bh=rRGP1hWP1Zq3f3a2NEkF6lXMJMr8GEujcVMurAZBXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/SUBs7JQ/Gl9+EmxXfwxv6GV2j1SEm84DUXjDwVp4TbiHmYCNzKmU9+G4Un5+CrS4YYGdVhU14SOnuYGwuHJ0QK9ktCufN8JgnBuCJ+O4NSbNVqCjV4RkfN7L6qfiXWUMPe+raw4jUm3BqySKux8mPNy1+Gt+OKnqNh1dhT+jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6oI6/+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLvkp8sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6oI6/+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLvkp8sm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m48J1465281
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gsGzyFaiwGcO1pe9AnLoE33D
	r3s8FnQnCBvAQ/pIw/o=; b=I6oI6/+JlzLIx5B4VD7OiMtbUh3+BiIDu2gYH3Wt
	4gjL1+2EfR/PlYNd4D44BprkIrAGpS9etnU4z0trf3NTJQof41gEWcDKbw5QqI7Y
	sOhS2vJ0Z7OxsOVxKddOC3u6K7YUEk6kR8H3MXLj6CR5me3ymDnOPZ4nPzDFpPTU
	tI8K54sroOzMQ+qGLHaYKZsmUeue4ADJocZwT95lFmqcRVXVqxrusGjXxaYZ0Jlx
	XJAvTlTWg9ToCiJ4yP/RlYjgevdqaK3WTdMHwxdZpUU9dcF0Ry72ud4/1Oe6Nv7N
	VHJcFPGPkdKlgFZA2uYHgGSq5LB7NvgsjosdvBNb/+XP7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wufk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:03:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8067974so1453330185a.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141421; x=1792746221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsGzyFaiwGcO1pe9AnLoE33Dr3s8FnQnCBvAQ/pIw/o=;
        b=ZLvkp8smdaGHbIQXHyZ5cZpWQgH8OmnPT3Mb/pxb897FUGDgzo9gpIlmpNbaxqWUnL
         CUW9awRVvjVSRHPM57fFg56UINInKvypIVoPkjCdDHepgju1NA5UOrVEcjTemmrNTQUb
         O38iun3Eax+zWZI+iOPFyr7QaTzKmIjFGH1+UChjmBBeS0XH8/Fc3HuB67PwDpV0wmau
         YG16QrPvuUvHrHcI/2i1Ty1ZA91zOqZlYpD8HihaYxQDmfAy/FOK6ud5J6rnR3wOjDBv
         xy68QW5Gvixqzm0ajPAF6pwjVDnFVyHfLT6pLDXZ9/WCSnKRARc5PlaMR9FbvOAvY0Ur
         jiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141421; x=1792746221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsGzyFaiwGcO1pe9AnLoE33Dr3s8FnQnCBvAQ/pIw/o=;
        b=KIFp5L7nwzj4QoKfJP4b1fD9tYALpEcWjb7k9qXaWYPUntGftLsu/L+BPj0gLY46+F
         79NUTUGRPEvSf0pvuzTAfprbKPifwzUBzAYFbWKx/TU2WU0hFuWl9FLGaRjD221uk3TR
         QzegiTvKV2vbjV/00YI5aNerJNC7GeK8dRVb2YlIg4xPc5v0meLRL94XUArqG/jwYLLS
         sAwNU14tVjEc1mmjv4X/wX6AWRjowOx7UFiGBfLusb0KziTWC0q3PADFFvdYlcyINuuu
         9NfucWsrFaXEDgNk94hpgEW75YtYqBehBJn+grRrUnq/pXzQckMRaHwJxeHRQ62QSswq
         7UGw==
X-Forwarded-Encrypted: i=1; AKwUvBx6jaQpEc06YWxeYGvOzvdbCEsgmwKSI/tDoez2NKBNMSTwLapLlHmX99FUb6d4ZIcQBz02+XuN6LJn@vger.kernel.org
X-Gm-Message-State: AFq9FYLOJc7+eS9RAjdwrDjQY5A+ssI0gXLKxdD2eKWDm07vQr6ljPRM
	j0pdQwJ+B4FGEB3enoZlHq4mREcyHOwJYJe/CZMUVPkM+KcPHhTB3SYkuWLiDLs7Lyy1brauXc0
	jRedG89+FeAj6vlBN6bu22mqu8ZPiz3PGdo7sHU930gQY/uY8PA5GbmjlgKntKccW
X-Gm-Gg: AYBFou1sdHllVc1f+EPEIaom4JdypL0D+eBOHcS9O3g4SR+66yWadbdjXHVWjuTKd0D
	dSAlQVVpVZxtq/li+b1wjVGxsZ9JjeJWvq5/KJN68BgOIvSXRdNq81qgpY43du8z1kBHam1lI/S
	WmFkBFU5bahEfa3cZ7a5x1YvhiY6iVxW3p8ZGex2bf6ajm9vs7GoFuWvRhI1i8ghTTEIOQReXZA
	2bLHG3RzxB7RxD7MgUtoQ2EbskB2biCbfZpiRzyAFa06uvHYSPz4I/uV3WYUClvCNk/F7HKoFgc
	tVEflW/NWOFfE0jgzyW0eRpSWdweuPMJxlnYS0sN41SxX9ZnJmzpsgb6AmQG9/TSJt08pZUzF51
	U8ufwlsvVzWu6upAN
X-Received: by 2002:a05:620a:199e:b0:93f:1f22:9698 with SMTP id af79cd13be357-93f1f229f30mr112584285a.28.1792141420595;
        Fri, 16 Oct 2026 02:03:40 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:93f:1f22:9698 with SMTP id af79cd13be357-93f1f229f30mr112579085a.28.1792141419788;
        Fri, 16 Oct 2026 02:03:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm3205109f8f.1.2026.10.16.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:03:38 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:03:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: nord: Enable SoCCP on
 Ride-Embedded board
Message-ID: <7swyl4774at5ntcttwd4vpshabwg4rlg5ykhl4spk7lj6d74d4@jac75gglzivl>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-3-ee13aef55d8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-nord-soccp-dt-v1-3-ee13aef55d8b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oX38CDkCmfC40A94W-m_uFOP5xl7rKMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX4FGS7+Ha6eXU
 XEj7UNuVNTE/xRympZMUPhdenktNIhjRoHBVo6TKtEqE9N/oCti58Lmr6YtxPmGZ2bkrGqDp9M6
 P5yZ/UtmaTCGIN6i8XWvU2UT35+CPZ1Xujw+0TF3I7i9N2nYSgnfClIvZ0cZ9iSdSMZL8ZH+Efg
 +Ha+rBZyyrkaS+MglYkjRItpsXsfOWbtMxz7as0/KVgZ24EfrkPzpcc+gSA8Neu2uSxmjPlkXtN
 3KMMmuKPKYeb5vtqSQL7XiHGPs0/UN3iRyN+ykJri04zlcWmunFUy6Le5HMVqxC+xEqgYXvzDRu
 KwWCBoml8lvkufo2nq+7MrTHCklVVV1H4r5ig4BbQ9IjvY6lx+WHcpXwy3FGMfHAm2241yunfCL
 uHPVBFlYdrG2LEGC1cfZCc43ebwb2JUQHjqo48N8HQywviUAZUFAgNb8mK799ld0OcjALM2W1bO
 4SghwrYc2J7EJz2iGBQ==
X-Proofpoint-GUID: oX38CDkCmfC40A94W-m_uFOP5xl7rKMF
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1e86d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Pl5ZWcywM73K_Xcq8j0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX2Sbmc3hTDys3
 s6u3nhsKLZ3WQJWTukS1ibUt3Qh3g2MbE9uUeYel8f0x59BDGjGngkkoIRbenEMF/pWTSwdfuMx
 tkm4Wo8rnsUgqOHZppAwTT45T0g2fKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160035

On 26-10-16 11:09:56, Anurag Pateriya wrote:
> Enable the SoCCP remoteproc node with its firmware path on the Nord
> Ride Embedded board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
