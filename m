Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94E38333A
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851075; cv=none; b=EDVCo1f30mYEFTetkjYjQtkdoMpjnUR8cyoePg24YDPbMpQ5ERMz/8/Zjfq4eUiTemPG/WQHXszm8bNvF4JYA9/tLWrGqthGGgXiWFv3ANYtzUy8pMzPStuPrNl1fQZRvT1khd8UG6+HuJzdOxeTgTVYQyvoDh4s8jCpjLZskoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851075; c=relaxed/simple;
	bh=QzWEww27danke6pVuKQ865QkKlQ6qEvVrB1nT2Ssj5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqE0j8MLmAdl/rLGgzBysE1Rdyydh7CffzNKEgtpsxvHt6CIiyzaJfEAtJIR+GKvtQf2pjps+CYl1VeGeSpTx3uZy8vWgUYGjOmpQaMx6hVlVtxq3N2FWbFzEbyuc3pFAB0gRE1hdlHaoWMo5d68l5/2gnOMXPzhrfU4xr7XWgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LS9eJkNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xh2Mo0hg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LS9eJkNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xh2Mo0hg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M5BJ2502683
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qb33tFd7B0AHkg7R+dCmJclp
	qBJUbuxxgUYmiEyjnXs=; b=LS9eJkNVCxJeORL+Pr1WijtqzIvBVlEeDFJyJi2U
	p3gIZiASmuTQmAmY3ZmqyHwSu04egCxuGP4237LeLhc2e7V8L40wfYyvNy8vRIZJ
	5phGl4FpbTPUtsOgv7YSwIx7WIKcNFq6o0lwb2WORIHaxl99gFZ+g9jqoMpoyVDC
	kdenPZ+lgV4WktmMq2U/IogggEEQgaHRTdIpS2R2kyGdEiR8gC0sXS+EzefbLZ3g
	OXlPWNclU0oUgwr6VkxCCrh1Ia5OkE5j8ZvDqZ0EKykftdj3FThaFhrWXb6n1LrM
	dkMnkECQsm607OGnH8gc80GdHPw5W2Np8JMdW3yrjY+7gQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7g7qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:04:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1640914a91.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851072; x=1789455872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb33tFd7B0AHkg7R+dCmJclpqBJUbuxxgUYmiEyjnXs=;
        b=Xh2Mo0hg6C8aXqwAA01OzK2yZvb4zQYEPetkOhf1qKLhVTYKm1yUB2g8UByzgDRNzl
         kGjhVPzXTdbXL8oitS/o91DX0f/t4mwp1hmVj7fwsIeGBhT6gWQe3TNLZcY/n8Y5Xtov
         Aig9mEPYwTUuYX3PFKKTT9vXvWN2OCmcfUX21C+8fIrI8+Dp1mZDBNA0cHDqTUCrg7sR
         uhUtIJLMBh2OuXBtfI0NxSoP6Hk2nRxEAJaGm1bsLsWM2Kulebuz1KhGtKqOvwQ5sxYM
         LFvFGYWjHcLg/lqgZD6RRNdm2DJ/i2ocopAw20KoRz7HHrigzUIKsRTOwKiuIyhQPTiN
         jaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851072; x=1789455872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb33tFd7B0AHkg7R+dCmJclpqBJUbuxxgUYmiEyjnXs=;
        b=r6NzMCHyldA76ONq8qexHkbaMOqmJsYhgVWZDyC1KWEU1yLRqTJ16Jp36LhRYGj217
         m9gqV17Q3CyETtlJ/1EIbAeIUayyNhnZS3YwLHf9Vegrf+TI8jixjTIAJzgpTWRKww4p
         yS91TLnn9BDt8khwLN8iJ8ZLB+kjbjXnPhkLdIAp/9P71jbllQ9uor0a3eMjXNnILPfW
         F6FLFAAc3+6my8J2UA7PIOZKOONpT0kSndt8iVHJGKWzXFPJnnokYh+tE/NaihyMm47x
         ZzWOkgD7g82ACEQ6XWzIkUgxdLYALseuJGIlnus5GYE56dQpvQYx8a1Y42FVYWvQz7S3
         coaQ==
X-Forwarded-Encrypted: i=1; AKwUvByLtgy8rcaYVFVba5Y2UW/Hg/nDGfc+rMnBHQ3NuW3aDrRZXaC0e9QgyWT8ZjFnbQsnXka1WGuljuVV@vger.kernel.org
X-Gm-Message-State: AFuF++mgjjUaEBBcs9tizL2ag989xaJ0AQ2MXuxHI+162BQf3OF5Aygy
	btaX6x7ihnf9bjuEz9avvu2A3k2FEp/O7NSpyaCU3MwZ2iHoylX1SwpirMDlR39NR+WVby3/UAv
	LV6z5gbWFZ8CihhdyGhsCqiFNMGES96wUuONlfs/vM9zSALIIlzQHTtCvAwG1Y2LB
X-Gm-Gg: AYBFou1lF++Kp3LDVp5pjkGdyB446Qpjhsnj5H3KcjI64pB/gJBAGuBvGTja1mspR2A
	YdkM3+LgYl4dWwfmFk/y7feD+36Zi6Wmr8WP0RSAm8NaMB+I5hg63zvOvIQnfBNTJn7zh3CzOC6
	baVfLcvThsbFOUCqRd+MZ+w0LL4B23QPCHV5mEhhh6mOUlJK02a/xMHdxI1oIAQLYp3Wjl/QtnZ
	L83OEe2fZztuvxdQNe+fNByqwPttytnxK3NKFZ0JvSFpnEIElPJlNT4D4Z3xgUg0mgWGOZifo38
	82up2My2yy4lEGtbrseaNA6wnxhc44wPhJiPuo8p/S5PZ/skpeHWsqbDu5Iqiw12VtZ9Wc7jbog
	dLwjLFr8zGPaDFA==
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr38627635a91.8.1788851071174;
        Tue, 08 Sep 2026 00:04:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr38627601a91.8.1788851070748;
        Tue, 08 Sep 2026 00:04:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm32734467eec.22.2026.09.08.00.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:04:30 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:34:23 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap+zd/2QmerMwi0o@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fb380 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=K0Q-0DoUKIFXmulf0hMA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX9JgGBhoDNO7l
 kXli1Vx25C85WKISJkwjwrX0t7mgJHL7UAQzn3xd4r1kQh4eKX++zQyX8B4tMuDFsqtVF0v8VRP
 takwBY5xOnF7hhDO9ltBzoINq+SQbEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX+EYEE6HOcvSx
 wj5knAYHFwGiaGEPl503i+ItfR2+SDg/yn+JF272pSqhv69YKkGvCmzGvd5JmuREd8r3eNWKYkp
 0b+8lg4NfIhHLG0UnRheinBEYbxai1XMENLDjIHCqqPmJFYwd5W9zrNZxv2s6ct5zaJfX19P7fs
 /oz1Jscn4anIIz1SYTGgV8vTyt7za1a39UptjgXA6UKVFj3C77WdBmoRcOnTqmkLHdVDuFYXThz
 spDNbvq4ZLBQ+xCCZuuHhG+KtbzYVtvAeEQ2PUJFy/pawQDm9mYBpVSTFIQnS0e7IfRMe3uDtYX
 d0xDePM9Yn/eC9gO7w7dfO31WUpxLWfF60g+/YHywpn+qJUc9vbW3qvWblBKDBFpwX/PomTvxxI
 KGYrSTB3w6optQyrn46cXSU8+VqYNh78QLiptAWZnG4KTqnF+md/4zVSgQV7CgnzMAUIS70vTFj
 IbCWrBMDclw74KWCPEA==
X-Proofpoint-ORIG-GUID: AT24wCh5fr9hUNMa9BU1xg9yPJx30Yez
X-Proofpoint-GUID: AT24wCh5fr9hUNMa9BU1xg9yPJx30Yez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080071

On Tue, Sep 08, 2026 at 08:56:39AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> > Hi,
> > 
> > This preliminary series adds the DTS changes required to enable
> > Ethernet on the Qualcomm Shikra CQM, CQS, and IQS EVKs.
> 
> What is "PRELIMINARY" patch in upstream? Where is this process
> documented or expressed?
> 

My apologies. The code is ready, and I was hoping that sharing the DTS
changes would make reviewing the driver and dt-bindings a bit easier.
The original RFC had them together, and I split it out for net-next
and linux-next.

The only reason I added a PRELIMINARY tag was because these DTS changes
should go in after the driver changes and dt-bindings.

	Ayaan
