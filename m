Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF94E44683D
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934447; cv=none; b=tDD6X8Q7FR6+rB8EOFv3RhY1LDZoFlHJdgVpzu16YI27yRqBYeqBOFWGyxiC5xuN+eB9xFCjTlfSxqKj0XZRV2OAkxIUqEBu5q1R7Ns6Tpngqo9qHnQVt6vLuRJ7qX06x3sKr/NJIxwXBffhLwKo9dmGHQF51djMMVSNPZpHXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934447; c=relaxed/simple;
	bh=DsPF8SjSUErETsimgL0ZJd6+a6VSJ+qHd0qfvNgOCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/e/n3H5VHsqb3+qHSLnRAmSwNXeyXu4EhU5OhQ76M/4CSLiGFuC3eRrMasmGwRnOUfYT+vpTDzs/ZjGhh4VVZEVTeFN+OW5ZTVCoHRWiNgeW7Ix0pi00bla8JUcZTmBptFYqIpDPzN4Pe+ep6K/uxstCwxS1MsoPfCh+whOxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSQiGAtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmejdOh2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSQiGAtW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmejdOh2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jQKk1068273
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 09:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6NWwoC36/rmexB8/5T2wdYS
	MyIqsDLRTt1zm46ISPk=; b=pSQiGAtWzBgHX7+Rz7qbSXiF6oedADOO65I+vX6s
	5IQQoPtnfjb+qb2/ouhGrYqvyTMRC8n4dYtC4OkqDHQLnmzVA+P5TuBKAfm1+A2N
	jZ3AxmfcQwkIW+/nmgFZTwezHNaY5y9SSobx9dSMKfJketPhRs8WNJ/aa9Zq/Rkw
	jhUh4WlJ50+6PV1HVCnDY8975R8k5Du4DEq6MGRJc3XTVDVg0EUcoXzaKS9EG2sy
	3VHnQasySB33+q3ofPPVW8FC4NmWF9RRbP3UfoEzUic4Fm1R1Kk4JmwdTedls4xD
	eSxR6tkCfAjiFWGcjONqZPdm+o/eNTTc3xOATuIqAymLpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukc8pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:47:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf4c0af4eso361187485a.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934444; x=1791539244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6NWwoC36/rmexB8/5T2wdYSMyIqsDLRTt1zm46ISPk=;
        b=ZmejdOh2eKU7fm9DmkLmU4O2vLqNNp/hxOkSyRHJy9IAXBNVD59C71FY9GHWkiXIoc
         4oZjwtMZHAbBfLi6mcQoR960MZiVRIDS+ALTZfiusAT7wwXpmJJMFzQglYVvHli7Dspz
         k6RPM2/tBR1BDa9GYjO3h3ttvNax7ocvSRQIl/bO7fkI/tudSz1ZIm3wmyaHILBDXWSK
         n9yc8/Foo0Nw2o7m7VOrKZEjLGxZLq6Bg1BGQafCBhj5WTviYKQW88RQbdaKlk74g57q
         aktgdqn4Z4Wv/zh1zYnVXG9umCJIRXYnyhxgvCtCL6upsfrGHmOaYsxN7GY1aKIV0VCb
         rGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934444; x=1791539244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6NWwoC36/rmexB8/5T2wdYSMyIqsDLRTt1zm46ISPk=;
        b=aJC5BdBhgWZvj/LQULyGuoxZUmYlu9N0FruETAHhWoaROPnvnBJlcjClVbfH3Nysqm
         BQwr6Fd7HniaMWywJghAgm/3ROJWlcWSk4BY8QNjS0XU67IC1MvoW9Ed0S1wqQctXP5m
         ubWux/PwNwX23kfoXsx8u0kqKu2RIBDqmwXV15bRy7srCw8jku8hetnjlhYcsNctue9w
         jJMSNhQ2tveKXZzCbSksE0KJCt6HN51znHyoFZltu8gwxuYRiIf2oHLeCy9ePzj3GskB
         nML5Tt/g3VukTzl/vq0zT1tW0rZHlPNhKlO4w8o+tA7oiT0C2w8AMbXFGI98wOyaIqbq
         95hA==
X-Forwarded-Encrypted: i=1; AKwUvByWeVV+XAzfm5Y5jb0HNiUJUbk7OjifA1uBLT/m9RVadHeOLrStQliSWKr5roLGCQAWtCyXV9jSyfO4@vger.kernel.org
X-Gm-Message-State: AFuF++n0r9RJPsswgMGZj2huoAUO1Sq1pbcwjXHis9vpPHNWkXI9H2/y
	N7SpevZQww6Y2lTupNvSHwi1bfOGUNKQx3AxT2XT2HiiJrzZHHYN71wLJ2zlbkVX356WCA3hJeN
	zfKZ/9xqIeJ2wy06+F9Lv7PzpZ+6+uaWl2nuOoeO6IqNaiCK68PmEjGOgallkleGG
X-Gm-Gg: AYBFou2Lf2ENXWH1hMWb7A4W6hAMm0ZOdA6nJUkNh9/63ih95r9MknIS0wQf8ppGwhl
	iEVZIoua4eu1P7npm4R2kgsMHAF+0xCusTtbm7JhaMP2GSRTzV0SsyjES0ql07qtwldApf3n9R2
	A8tO6M7ZZto/+dZnkZK3q2ODOQ0ybkXcpMLLspIcVV5pRjx0CKBc46wYcVbB4KJX87GGdXyARGr
	gRhS+U5Y7pJ8ryX4RtPsQNVkh5Z/paHsk/PEs0aQLzcypL3HwiF4SzdRf+8pU+kNiVClQVVtH8r
	JvEgVdaAX5bWrsh9J0NCSd3ashB2/DqHgYO2wcmhwd9XRfXo9NLJiWHCCHs+EteHpJSz3dMEvLE
	ArSCTZdV6a3/uiHo=
X-Received: by 2002:a05:620a:4442:b0:93c:7861:675 with SMTP id af79cd13be357-93cb5649031mr1092330185a.1.1790934443762;
        Fri, 02 Oct 2026 02:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:93c:7861:675 with SMTP id af79cd13be357-93cb5649031mr1092327085a.1.1790934443206;
        Fri, 02 Oct 2026 02:47:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm85350485e9.15.2026.10.02.02.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:47:22 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:47:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: Add watchdog node
Message-ID: <kcnbtr26pgehhtnnfd3xrasnwer432pqaqllf6jggyk3ckhwed@l5q4pggyqv4l>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX4nF/arYsyUiY
 mwuLaSGMXZLfbm9aPyomVpY36d9ClFmZvms9bky3hig9YHkaQvSH435VYSY2K0x9SrIQq7AL8cp
 H3vjagN1WHAaQbbnRQOmj9bE1J8BG3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX9fR6wwxhXRbA
 KpDCKS6ppfJCerMcLKQtR/g8Js7egeuEcDNElwi2eC9/GNJOt12wymWq3yQrHihwen5L2ZDURUJ
 L+pwbKG05zQGwUr6JOpL0Ma+h+NjL1Y4A8d5+YM4SlgmhVvGssfvDSjtRPhXrMydrCoO3+39Trr
 HlXI2ehbb3wiNEpGJQICTzcArcrWOg1MDCsHk+XR3lAnkFLi+X6nUxUiTk1VVG46/72lANVA2BA
 /eUrw6ODKMYzbYvjEOSx//gUMC16m050U/CZPx5mxmJLFshQkCHsqYGhGW5Ck2dNbUpJeRKmw0p
 7k7+/WEm3RHzIGd+e/yFWBKyXAicX6Myup/vjX0RV/X1IyzkZW48QwimdPKJDwc+zKkTxCRxIiz
 HZGY8oFdxUqjiErSy4fSNJyxSXvCFhod4/eYlqR6DyovemR7BouKflhFCNG7kP0nsF3uIYZeB9k
 DYKhRuEufdm5FjSzM1A==
X-Proofpoint-GUID: fa5a9-mRjer20jVPU3EiU3iIsQuSQNzd
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abf7dac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1I-uu_GJYuiuqpjYtLYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fa5a9-mRjer20jVPU3EiU3iIsQuSQNzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020038

On 26-10-02 11:45:29, Neil Armstrong wrote:
> Add a node for the watchdog on the SM8650 SoC, the node
> is marked as reserved since on most platforms the Watchdog
> is owned by the Gunyah Hypervisor.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
