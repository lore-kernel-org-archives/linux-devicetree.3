Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905561;
	b=YL+HZ2CRJ2s1ZP20LUefeBhIOxLKnf3ZP6TyOjf5ySVG1W03rAsZ7Z+c04HtdEkdV6uN
	 NLBjv0sVjD8Op/L0Q/l5ZFT4FmOx22qsoY/ZduYNJNL9jlA+4frixFsjrP+uoFebUNN32
	 sQZMUvtUbTGWU3oDmSk3cLKA96rSNJ3svmu70lYD3C/my2IXXvfru17lSrB3vo93c666Y
	 3ga41FJsWNadgPIkFM7uCL4W/7EDfDZkVzvdK+LX4AqQvyOQl6KAE/9WlE16/nHy/Vzy4
	 8nrWOK8BO8SasCykMzZmc7LudQ65EarqyKIsqCYe3T25ZPU99aUpavjTpsQdB7B0HHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905561;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
	b=NUNGUSoAbA/tKDt77U7BftZnTgVgWbJmfMCWYNaCX3gB8RUfgrcZjSxHekM2Ks0KCfnj
	 L4cIhTtVPARTNVWLQPPiblLJBh6aT71OtDkF6wQf5bQK2FnR1vMSX4qspie0Ov89Vbrmg
	 7AdXxQlGt0HfN/rpKUkw70VJl2+ea+dmvJV53WxtUXn47aqCGMlwXtdyUZkUGA1PmVxLE
	 8Wbiqa5iUc7CcmbyQEm18v5ylBNwXKLPtUvAW0iu9JjL9aT7hwkYBy39h69fJbJqZ/Hes
	 jjNpjxR2BGFK84TDYfI5WZJ1cIy/PdZ7Sv7YHuWsNq/OH/i9U+4trm5T/xmZnO1uOsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noe5qyDB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRFsJLrA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FD606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noe5qyDB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRFsJLrA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6exAs2998599
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hhed3X0YRZpLtQTvo/jhCcuI
	l7K8NEaUxlz07FYiPso=; b=noe5qyDBG+XwO3W0xZw9csfNryCz16p+L/v6AHeB
	1MpvdvzJv4dSypTHy8SCOmGMYIf8w+kL+YPhWCmSuoZXmR3JcsbVUELt7qupatMw
	yDcNeZPxXXHLwxHVd/P1mjjIwCZD8Ku2pal5yVAfYwD+aK9ILSGyV4c+3P53tIjj
	YE1sFkcUwXPoYrXkHufOPRf6eCWJHV/6cFbyfEGib4zR8Xqu3bbL0GSFDwFWp3AT
	yDa7Df8jrOXZ/9Eo9g92YPJg7TeUIPuDzlSPrK497ne1qfjnaVCo1dBf8j7vtj0V
	E8g0vQ/k7S6WISybfnVaGjcNqXxz8YnHQORQrFhYtDfbTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0gva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:52:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94970ad532bso391990885a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905559; x=1795510359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
        b=dRFsJLrAd1jPUHU/h1UWNbNr0RsWx8LcsMRP8niyPSODEg10AQ8rdjBFdepDdUlVwr
         /9IHomwSM37fUJvoPvQNLOLv+2dErZIsxzYlfOtkfU0bQVyUD3YSobeMZMdd4S2F+vHh
         CdUyxplE6nLgVlTE/1pl7jI9zR1NhhRRscbED6Bb16jFnNLHrqyOIWenKuMd/6ACoTqE
         jGz7h8miR0nqeaeLsAraijAM47DVNyO0LSpU9VD3zmMby57A0aEUFjNMhA7aeIq7BbtB
         xCeKukU7NcEDvEDzYgnuCW3FmZEI+S1amFpo+BnMxJO4QiJw8tYoh/FMdrFtXCQmBots
         LuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905559; x=1795510359;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
        b=RPZdtJDcHwosryoW73a3IYZjsNsLqdyoPuK71OCvkgZJ4Z6E1Ff1/g+lDVdftBO/TE
         mia9fPlb/VY30Q7wAPg1D4leFgdX+IdkPK0Bq0y4Yh2ZCs0J96uKSDPFYQGdrw6VzIbY
         97fQhFMh1lymtLNHk54DnElCKZNhKRTli7N1hhQof2+CjNXhwRRRDQw9HhFQKLin2EPq
         /g8WBpQoDEv9ghPvFX5vITezqJCLdsqK4TzQrBWTPYw2ymj+YlN0ymDMYZR4rZixvtwB
         GbegCso5bC+HjmOflnGyZ4IPBIo6ibh6Nk5P45M275PZER2FfU+wQhafgoruvyQARc0q
         73oA==
X-Forwarded-Encrypted: i=1; AL+hErEXoJ3GZLyIU+xYEOJjyqns2DTCjLgNd1snsXCo5WNZGKEQYj0tTm5Ib5RJYqW+ZDKCMrtmU9cE9gvW@vger.kernel.org
X-Gm-Message-State: APuU4Z9CcT7HrH8xLy8y4OTXaI1aW25TteVIQSvog3XUSnznHV3/6ijX
	owebJWFEvaK6Cix5R8XwRJnc+HUF6J1Ewpb9B5tphF2XyafomYbT/s5mjnCedQn+X8M0X/e42Ix
	5rKMtBfL2FWXSx1i4fwBfZwj5dbrFYU67943nWi/SAhIWpzKT906USo7dxaPpHdVx
X-Gm-Gg: AYBFou3LOdyeJ69BE2Ea5OVi+v+BKVAsgoBntMIws0d+kx+SZBGQ0JRW5aZIqQyAG2W
	agVsTqCBHKipmvaQEesCdpc/Ilx8eofwzLqLaR2cVBPg4UkoaG7+YtQVMgz+EXOnyOfVkkYDVXT
	eCssoHkzq8PUStrMq1XWKkA2KN9KLdq2SgKx+79UDNTLOP9OPBk0z2H+szEQHq9DR1usACi3wqM
	nmQlrx8bpOixVTlpa94rYV30uw7fEzFdcMFxoH+lfV6mcxjRyMJg6abDAEvq4sMFYTZKTJvbCKL
	AfewTLL58WhqRYXYq7u93mQvtUjOxZfeGu8FszqN3qnt+UdyDa0UmJdE8jXlmmYpVNvJNH99SB0
	Sa4ZHmQ0qNl6jHFkL6SZj18ieRkf3iVhrwDwiLxGh/1Ja5KC5D61OqR3WW69tNesM
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr1996837385a.9.1794905558669;
        Tue, 17 Nov 2026 00:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr1996835385a.9.1794905558009;
        Tue, 17 Nov 2026 00:52:38 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm15117005e9.15.2026.11.17.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:52:37 -0800 (PST)
Date: Tue, 17 Nov 2026 10:52:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
Message-ID: <qm3y3loq6bjchtt6xvcdnybh2pz6krak2srvbivtqnajti2iaw@b7wyan73npyn>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
 <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX8MRMAjAaQLuD
 tIGhPdd28J+nz7YV0GT8AtIA0iQul1kShu66ngm/GUpokBV1UoYjgYQtGvZIhIZHcHz2CkL7FQl
 2QY7Z2Nv3DV5eZNCrjZzxWE4iKqJmJY=
X-Proofpoint-GUID: -OQW1VfDMK7yCo-aKSKz8ut8od55_cSK
X-Proofpoint-ORIG-GUID: -OQW1VfDMK7yCo-aKSKz8ut8od55_cSK
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc15d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lB4lvwQLOsKnOPBdp3AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX4cx70kkNATlH
 9gbUmSVLLQouVxyUie1JsutdWeJDIHUEIVOlVGRMiWpHJe4+14CI4rUvtfVscKtjRDaoVp7VNRr
 XAg/ARjnSY/u3QaX9dlqCEiwenCQPa8S0dMhklAcGV9H1i26WxI3wAzvtLI58iq2GZ9NJ2cfAb4
 oZExVdTT3FXEXWK52rDj6zSGRT7CccpCS27GpI9djIiF4RLxhQns35lCWeAEU8YOvhYI62NrZPm
 ZAfjDYFqoXXsXgyY1pxn07rEuvENPlowoRW78zy59b8uj5ELj+qB++mRlqzhFkaIEscYkqfAZSN
 DRCIBixjjZQ3QUGDP+p3KI9gy3/q4i+qgWyFIB8ZOeLgkKSSqQ/ybJhJFfyf2gntMeN//Wcqq0y
 /QeKm1SNM7LfSObG9q2M8Op1B3UGURDMil/CcfKOcDoL8mb9nQk3fnPiL6bwFSOhK2UWleAfWhk
 VSFYKJKvccWMBgrbKUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170035

On 26-11-14 21:33:02, Shawn Guo wrote:
> SoC ID 690 is QAM8797P/QAM8397P rather than SA8797P, which is 648.
> Update the soc_id table to follow the corrected dt-bindings, so that
> boards with these modules no longer report "SA8797P" as machine.
> 
> As ID 690 is shared by both QAM8797P and QAM8397P, name it "QAM8x97P"
> to cover both.
> 
> Fixes: b0bc160c311a ("soc: qcom: socinfo: Add SoC ID for Nord SA8797P")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
