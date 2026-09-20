Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE453D9DB0
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891118; cv=none; b=F7NO4zanE9EAo5M2iR7Y6RcAQJ0FmQyMGjrcDEbBPQpAepTIev5UjEovUUM2sEwRKm0BmXNoLL2xNU0GAkZM4Y0D+z4FAwwjbWisjml9pH2qheVpZF9mRFmYJtKyMHzHcUXTqnKhYNIdG/71RerrC7m89DMkAYC/iBbKCxTxNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891118; c=relaxed/simple;
	bh=sIPjK1roC4GjTke/gQdwaT3BQ13pDX1XWahschRPsts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiqD6yv8JmHSwChSLfH3FaWATEiF7GgUo6Qd18nipwacTV4+5bNw0aTXcsbsnbGpTUbN4ORXsfmqjHnvF2byl8vpLX7H79RnOvmUcH0DIYVqlbW670iQGb8v+9K5s4yJXfWymVLje642mhEHnhzXW+9tkyuRYGfoaGF+XjMaja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4ASAqEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RO1eO7Ho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4ASAqEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RO1eO7Ho"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54w822455682
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7W6rf8nTQJ34DibSctX6UNZK
	7y7hdh6Lvz+TUAjbqbk=; b=X4ASAqEmJRQr8oPfp3MukGEm1FScI8NpXcByqk9G
	21AGj7RwiVCc/YMLcUmCFpj3jeyOPFWzhNHhMaGnhFAryyesIfnPEPggyDxTb1Tt
	e9x/LYeBpquzi75GufcDsXLPERIWky3wTcFJP6/tV4EQwYTWFuw2kfE8jjuMmZLH
	k/Zrw+rT94vGb0qiJnrBBTfUiSjvK0JdJLSRBr1LWgQ+E4wXLUwlKuvok7OIIA4J
	8TeNaTV4/r2xsNZ5keTxnCaGFKlN+IcDzfmNAuKQPOtP1rIG/kuxZVTs5cXirWiw
	jxMc6SzAvVryHiTkb0XzmeNPNSu8CDJSSEdRW+C6ej/FQg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsapbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:58:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1968251a12.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789891116; x=1790495916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7W6rf8nTQJ34DibSctX6UNZK7y7hdh6Lvz+TUAjbqbk=;
        b=RO1eO7HovrsQL9u9pDSSJkWBNNEMeN21xFN4j3kyrTgpleQv35OIfgMuq+wfQxYiAc
         DUSSG6qve+7hksAPhF2JW9vvltIns40G7jtRh/zL0vvGR1Nnk4XceHBotWbBpKrrzxb2
         NDz+hNntp+3ZbePByKGxRHnqhCr3VJfKxLcipcnFaGwLhgftjg4gX5HWt+usEGnos+uM
         w/U3ubTl1zFEobm/44Rh+VcJdpxAwJahRNBGslpxQ3altsuJtp9DxuEaX8QZ04mjF7Km
         V/vBvA+JqzWK5MsdRDnywMvA0Zj2H3tDWBx8gZrGFZqjMW7jU8Kazp2WFDOM4cUrFmd3
         UCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891116; x=1790495916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W6rf8nTQJ34DibSctX6UNZK7y7hdh6Lvz+TUAjbqbk=;
        b=rinGTaWhIiB+McDfpo51J2IsFPj1/9XrcTF5THg/Ws7Kvawt5TiYSoxflrOD/nSykb
         UWoF+pYSfWI8BCgb6sZtvWC0hW9j0R8bMchEFTJ4tqwuiWGZd0A16XMPrCE4DRiBfTaU
         iAwgmGL5K4AWvctF9bw76QwbEtKCrg0JVBOLOp/jdHdqc9dJmDMcq4D2Z5sW9fu8tCkd
         r+dpZDWX5jUQgc1MbbCw6DuD8kS1Og7dxhWQxczk/5IbFoLM7J9mWa+SDLUtXlsuiHDY
         RRn5h1BT4l1cdese433qcx0kB321l46vU657SOq5dSlHo8YCzlEfVCtdmnyRaG6OriGN
         soAA==
X-Forwarded-Encrypted: i=1; AKwUvBw6yPaOAXkrDq7+bbwnH6CZGToePk+IstGBPgum1cRNRS/uAIUfcjl9r++UsjG8v5Qj4A+RrblJwWON@vger.kernel.org
X-Gm-Message-State: AFuF++mnnMTaUNQdzZPgUKKfvVcqXyYbd614NAVelCLCWV2tE2K+pkzN
	dni/sWZBHYGusZYtp23/3Rc+hM1SlmFF3zhB5b8PdNEAA0JjLugUb8314WHhFjZVZGx5WolMPXM
	mqvwKGSuMGc8o4oMqh19L35JmgWCmq4cOR5wsgS23mt/RtX5dZv5sU3EGuyebW6kA
X-Gm-Gg: AYBFou0CS3TBZwpaES5v4O2EydQ5fedGDQLer/k83QoRlvaWXMXkmg7JHcSsTITOntn
	L5SMV1dt6nBfDZl31jsbeyKSt5fe3VbWSigRjLUnIBikwod3hgCMYn6U97fuclkKbe/KNjrvcnN
	PMVo8ul4M8/zqZn23Sw+kqNy92neFUNCVJ/fnI1v/6rUZSmVNTPXvdpSJy9wfHvEXNZZZHXAjac
	YKIxqNpS5DuT3/XcimlK5NYKkwhYOIjMhX7jdsVknl7Z85vK8B74D4q16ucEc8K78/4Qa2lwPwZ
	ERESF5jobNvMd1xM0Q4/hxhuKsFpY/bAU8B2ptfbDgDvpzrEkyJqcTvLSD1mekfCm56p6GKbnVY
	aShpEdOCno7o23TmuUergilXYqXnKv69mliDNyUkXtEo=
X-Received: by 2002:a05:6300:6ccf:10b0:3dd:a197:7370 with SMTP id adf61e73a8af0-3dda1977468mr3929211637.73.1789891115872;
        Sun, 20 Sep 2026 00:58:35 -0700 (PDT)
X-Received: by 2002:a05:6300:6ccf:10b0:3dd:a197:7370 with SMTP id adf61e73a8af0-3dda1977468mr3929194637.73.1789891115465;
        Sun, 20 Sep 2026 00:58:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e71a4sm10282212c88.13.2026.09.20.00.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:58:35 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:58:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <aq-SJY3UkLb9HbXj@QCOM-aGQu4IUr3Y>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
 <20260918013740.1355096-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918013740.1355096-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 4XM1PvFzahnMVKefI82hwygIk2GXfxVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX+ET6hmrcaK+w
 JTqZU3OxupGqz8YFUx0wBX/c6FJwy0StpoFwo3s3g5Br9sp6+FZ020fxj9cdApPBYl571x9pFIy
 rMGvyW4kMK3m2RJeW8KGLwkvj+T4ES4NtceViJNMuBFdruGdLsZpcDrBJ2UfK+d+blndXichltD
 nx3/IuMKPiaGzQLI6tOkNFIzB2MTq4paMda0uOe27ayjbUXhUvFueQ6bh1EAQZ8Ed8MRwFQZtlm
 JQ6e5iJjgWy36Qpn9Nbf8TIR7tiEGhqNSjU/7FFYrt1DEoptX1op7jbqHAWBNo4ND8mGcBljacO
 H/6Biu/e1YSYFwxcLqo2zvVyeS/GMV9ljOndvzvVJfb7iUlnqTd1+XRdeSXXDH3KwJKJP6EwXAk
 waeZr0N7CtW3/zCH7PkvxYfv+D+Z8CKAzB21+J7awEPHmi8S0w/ImjvK2REU/ojK0WTF8ecKKh3
 +xSwB7U2eOdKMv5vCGA==
X-Proofpoint-ORIG-GUID: 4XM1PvFzahnMVKefI82hwygIk2GXfxVD
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaf922c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bmYPeUY2ZynyBSnN7qcA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX+ScToFKCdXG3
 lPpqKk2se4hkmfTmNeWabP4RBZwU6pxCvvG3uubDpyKnxvQS066UBiO4upAUJupZ5ZmwZR8lkn4
 nsLKy1u6Ya21OtlZchRz0hOJCYJMMkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200113

On Fri, Sep 18, 2026 at 09:37:37AM +0800, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

I will separate this one from this display series, as camss and iris
depends on it as well.

Shawn
