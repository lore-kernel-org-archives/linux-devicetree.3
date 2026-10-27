Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115285;
	b=aNidxxxbM1xahqoeoXWZaBCHnxCx8YQRD6iuBhBBzZl3OB7+Kop2RrNcZ/a9cqgHDEle
	 AKgvyQuY9Cn9VwDirPyBvmdBXgbBdSNRQN26BY7Y9NH6aartTPOEbD7YTExqjxgk4UyIp
	 oLkEbxQ93fP6JsaYPlI7/Zzwra9PER13WVZLfzX03pQElt9s1ZGm715KknnKw40iD9NVb
	 zaMrmWX+iwrx4d1haqGVmBcQdSOUag1xDXNUDwo54fjEHYd3mFWcOTia4SpgZBnhqhDAP
	 YgubLheWaIph1S11GdguhprCBalq9eUbgsXcTZ+XZNgJGrJLeKJLZ/trGcULirvg1Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
	b=PDYYCvkQn/Jvpp9C/8QA0C26QSXihsUrI+a38dF2g1Oqebuswzn4ziTFEnbR1RVmG9K0
	 336GsPdVOn5p9b8ddiW4IEYgHkMXwIXn1faN4iYBso41V8gfS4ys23FCNaGsew1+TUtG7
	 HihjF6pPeAIoqaJB/n2RUN4i0w8IuQxSAzQDArZ2puB6VqGhmCwd3bjLvNxMeKAa1t6Hu
	 +xfCwJQQgCfKioAGW6GzYcE71PIqLNd0WAulz8wlHA7KMqoYS6kppoR+V1cUzjc86h/F6
	 EXVcOa05ImpXqK1Ilu5LzHXH/kIlh4yqw4eLjScLwrbvJUS3u+H+aaVZSSVKlr0q+Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VKzNRe3N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PS6lTxQQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2497F606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2497F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VKzNRe3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PS6lTxQQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFLHbD1522315
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=syD++ytwmVWxJtGfHI8abOuU
	UYru2aIJFUXyJ4SbMjE=; b=VKzNRe3Nojh20JcuWbwd2+fSIhUSQaVXcSvs9MSp
	fok1SmOmWKJA8bF/nqH2hioiQkkEyc56EOLGiTW4YRFCfWA2laCWLgCdJlUSp4Z0
	5OgJmmgZtWUAYo74EoOHrCm895/Cp0OvF3GYBcbU0U8SVCJt8jQv8c4b7Vl0LQqC
	UOqRLM+oHibom/s6856oR5engEkInoskYppyPYV/6QfYsqWYFlkMD8y38vQzeBG4
	PXLdtVp9o4B2I8LBnfkqrGS7oWQvd8fVHuodjEJDERrUK+/GANZCKNpRNoGm5ms7
	x9ayPuZgmXLdxoO3Qzf/sJrGWr/Ped0/YKFoTegq6/+D1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98tw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:34:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso1017843385a.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115283; x=1793720083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
        b=PS6lTxQQjNKHMS7hK+1p7ai0Ju45GTgiU9e2FDiGw8FZdubn60KnHqdq1SgHuFJsVh
         /xQ7vN09qUSkZjp8FhaV1RAanzT36tW/PDFVxNMSyBXrLHe7KKDRPPjQ+Ygp3GhoPwBs
         VXucfT0pShdPNuxhro9wedkGjqXw8N88aohyuV4CEzLfscFShxyIgm9eJlyhJqBSdcXW
         uiq5BMl1y5YlEr9+15bDvrXI0luy+4pP49LIXWkhD1nY7cfvkXHne3K9NXnibl3Um0JM
         gOQk9CvlpVXjox9p/SlPkay7JU/s/0CX2uZwPPOQNDEAJQLrcVqTBpRGuGAS4n2cuelE
         mL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115283; x=1793720083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
        b=ifcJl7VdFfNw4VnQKuiMBXKvLH9RxMAgxC3itxFUcI/mdPhNwr0630TH41qGRePN7w
         i6cD5KIgE7+TWbc0WgzrXfg2Tg9vZ4YXhi2fUVwiEFzLAMnYDALSwc7b1vqAtqdQFEaW
         YgszgCYCc1mAtfsCOuoBylii1lSd+5ATqO/TgXzmE7X2rU0LIvv15+8dhmB70/tVpek2
         EIpC5heqbcEH6ExvR6CFbxpLh8jeJleH4zRH52/m/j1KPEAqob8bZFozldZgge68Ohd3
         5P3e7Ki8vmgxgJ2uc9toQ/PfpxTqW0Y3InMuR8kFMWx3Yh2qK7RGyIObzG2nDYNZi0Op
         XywA==
X-Forwarded-Encrypted: i=1; AKwUvBzcDrG2Aq17eRLLwI+SBKqn0b+7E09zPVil5JxoG1pBW/GlvQCaospSSGQzGFJwklNcX4QMnJAf+2tI@vger.kernel.org
X-Gm-Message-State: AFq9FYKQFfAhfNt1LQCVlD740A+liTjOQUK3z+Wd+sRIIKfsS/Nzvj08
	B9y7Eu9O2RPlXk0vFTsNdsa27y+rvnP+tt9IEGLpH4eyAWjkg3p76cci6bb1FCMErEYFcpXBErx
	gZqVHRqMfE5FwbC3Juc/RZw6Ybw3gk3WvaQA1pcZSCJhhY9nupFmQCETIgX79Jrgj6zoCUcMY
X-Gm-Gg: AYBFou1mGUj91/pKGS0cf3PFQRpQPmNgsO8rU8/hHJdUsIresLpuxX7VDBNZ7WxogpB
	4u85kZWOz99vBPrfnxlPpOslAzcFXYPfTPwOzKUk+jYl01zlRg9ros+AU9CIVnJa6OcCt1DHpG3
	SoFJKMFpFlJ/PnaHZQ+z2Nr6xtG49SZ4O3tFngJ7+kcAw1xowqOpEjORQBhqe3kMqxu2wGCd6Hp
	kgwbFj7G+g1pP3sOH6QHfagP5u3CXdAjRtJK9MErsZ7qHMMztLtJIVsPWNVWZQczvs4Wm9zOQy4
	sB0vY8VrDCV6pfU57JaN1FpYaToy/jcuM0BN64djBPqQGSlxOlcQs4YZ7oKmtVfxsZukiSwInxU
	uYvh4S/5nZE0Vis3n
X-Received: by 2002:a05:620a:6286:b0:93e:6f65:de63 with SMTP id af79cd13be357-940ef8f8310mr1655474285a.47.1793115283136;
        Tue, 27 Oct 2026 08:34:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6286:b0:93e:6f65:de63 with SMTP id af79cd13be357-940ef8f8310mr1655467985a.47.1793115282534;
        Tue, 27 Oct 2026 08:34:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm23217567f8f.4.2026.10.27.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:34:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:34:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on the Mahua QCB
Message-ID: <527ui7l3vbr6bzfqvlyre4lhw45323eqmfuy2ehqdiqvzzpmar@oztr3ibem4od>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
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
In-Reply-To: <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0c494 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pfxcL939j8YmDoyFsLgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: N9deEneJaP7GrfZvzg8XxBFp0b__f0rL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX+UezF3U1XVm1
 F3tONtWtWBOmRiwG7UwZ5/40qI17LbonhGWzMJy30IczkAAd0SuJpTNP4NNc8LlsQO2uT6GLEVs
 BYW7FVm6CM/vCr6ZtHMqK210PF0X0Aq8HYadnOyqeZlPoJ3CAkCilI2ANyox1NsydPiNRK3Rb97
 J8LLmF/7xHz+/+wGL8Sn3me/FS5nqbynMT+CDKveEXctRhKf02DUwIdJmI2Nhpllq+aRzRY8FsO
 eTEzI6whHqVjiEZkJxDMVj6g35eLNHlCyfwB60g9LrIQ1GPMuCGs9Stl4v2YyEEXdfTt7+eHDbT
 TcW8p1okWvo1p1JE4E4PYbHbQWCWUP098mRQsTlrBZ+rO6xcTDyTTYKh4QlHL9SCrJNCuJJcnCY
 t1jgE1cJyvavgv6Q1o+BQ58bPimZDOBK03Y3oXD0yi1KzquLfj9XHqbar/5LMe6bP9WOV0fitSj
 gsC8GCuJ3WrQIFYWGyw==
X-Proofpoint-GUID: N9deEneJaP7GrfZvzg8XxBFp0b__f0rL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX6WNpbBLeO5cv
 pV6dWOZe9JaoVdob6NAOb7fopDO7z1QBd84ku0r3Vtt350pfEKh91oAr4bWsqShvRub23/CuFc/
 XemCqKi4g+YjVBBINeEx8Dck0cARy2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

On 26-10-27 17:19:53, Sivansh Gupta wrote:
> From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> Add the Mahua QCB to the QSEECOM allowlist for enabling access to
> efivars and the UEFI bootloader.
> 
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
