Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723585;
	b=Xs2/7wf0lYG25oIiQw7BRLFj2dnw8XTcJEwZyT0yoTnnszeQj6l8fw5ITghbZn4Hd31B
	 n4RAiJRiUHAYaDlXqtgpWKw2D9HNz65Le5kw/Yfws1EDWnMwlj6OMn6w+ewsm2sK3swn5
	 sHy+hHIz/AZY7FAl2GnteXl5zE3rzokqtfsK9iSz0omEuEe+Pyvioy42MWBIVUeBMJjia
	 s/WpBom9I0YzZfItgNwVA2Vsb/6uIZXwNyBVDSoHFxvmZfD0cz7btsJdVKsndtgbQAR2n
	 jg/T8aXbILvuyRjlC+91FZtEA5QqWsNKZCKHsNaxSfqE2IhAeZImSXcR1wgNx5t6JAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
	b=ZfORkXx/5As2fhmD5Yo6xdU/mb0IfoRZRYyNLvP5Wu8B2GZ2kZR3ACVkdrZWzS+1lWBx
	 F9p5roNPdiWfZB8Q4bdulfRdJ2zP1HNIo2VkFRMs83S7mGHKMUJ3XA9WMBjOYJKhNw4g6
	 RBCtRLmuTxbJ63p4lE/GSidchHPPXU2vufpBw41x/GrmRDAGyYp2qxKhJXRhWc8hEsfYh
	 MmZvskhufKQP9jyJTmAvD4/5Bn8Caym2hCx1rdG1j3ed7b1Oy/z+c7KiKVsCdoCq/nIWc
	 3fNLEvsRvcPcCitUdfgp5YLU+1S/X45lhitdEJS4JQWYAJ6Dctj+jFNs8RkxQoBvxsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZBO26gg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbK1vZIo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DCE606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36DCE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZBO26gg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbK1vZIo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FRBE991288
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V+pqjCEFgknm+G3XGUd3Ph3K
	5ObbbOwQi0pMo2Pd7bo=; b=WZBO26ggeAqzfQ3dDhim0tuC0CZ+hb1/CXGB4rc+
	MANT+wG64BHCQi6V+m4/d8eIoUyoSw1m/pC1bzrMTVWSjOToNS9t4Jaz3+pby4HB
	FMzpCbfu+i02j5x4T0bvCoBxVNwTVCglkXlmQF+6iD+V5gLoN7/mBgRyLf6nCB6V
	ROxwX8cC7gIPcyAloxPTf8ECJJUgz+VIhgkZvWM59a9JeMDL/Hyf+GyU6n/mPgLU
	dVA0w2UjNUxgoA1JWsS2nWGWTWCOWNF+bjKGMhw1sPPXUkCDeuMxNu/4cAMqXbFX
	471fOfk0Cec8WKylHbeCCm+CzMtObyeJ4+FDL0soYWGiOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahsy8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:46:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso723933eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 19:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723583; x=1793328383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
        b=MbK1vZIolr/333dQnmuUMJA4Jz/4Bex4fIoe53z/aFDxEIrv/tyiMTTi1Sfg3+oM3A
         AWA3/7KGn2UA+nVvsJI9pOefD3vhR7iNQFmjQ9cagScMLfTj7vlLIDr91euLoBZxUSwt
         uEUlBmAYHhgNuRSuiRbRbLpaV6+XbMAK7o0IDIzRaJPUlJAWm4wFkAxbCgKidp7KFGY+
         dddMyo2TSBg4aqQvS1EhBFQQMP+Kex0xACsIPDWoF6J/8t2lIcoCf0bO+jyQ2iLWbFBU
         GKu9n24zCDNKbAoE4e6eKLLN04SnRi4dBVPwmFIxfZJTCIARdSlwGHUizFBmJSwFHt2e
         v6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723583; x=1793328383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
        b=erQr1QlHFTzvI1ewh046bMY0AXo/3kSf2oiCpGZh1wAsF2lI3eMR66A4RzErujyPqt
         pFNXW0SRoMNFCo8qBN9g/qAMaf256RhfUH3jRwSHopEVzEXPbv/CyXfWcAE+VvCjVOh6
         67wfmDLZUF/2hPIT8fCZJouXhoPfYnzV+Ik2J484WA82wZPB1v66F1qMeEaIgZLvHIge
         o6v437t+2yf4ls820BvyO7NiSEthd1QpS0nRCNrxIsEjXc+R44GTsCRvrXwUcyx5QYQm
         XgMElM647zhgvOh4ISjZOWgViSeUbdJ8VxnLJJqF+65cWPwexDgW/TDSQLXKsDnGPIoy
         lQFQ==
X-Forwarded-Encrypted: i=1; AKwUvByEKgDc7EZZUxLBq8k4C9qElrqr3JUpBz+92aJNPvi+eBk9i3saU8/ejCpNvgmXC7nWX4n9ndvelH4W@vger.kernel.org
X-Gm-Message-State: AFq9FYIEkgfBN4IgCnNQtnM5/2KAHfxIcnUwXU+KxUz5GvCw3mjbKj72
	CNUjKEGuM+dpb7v7ZuivrBHllb1BSgfsYQGYc89FK9X8LIlylayVLGe5L2rPv3a+Pgo0aPlfm5j
	g8E//ejpqMRtp8BLb0b4CBcxDOB58gqb9x/OFOPdKJ0xeHyzUpxgtlaZMlw46JPAe
X-Gm-Gg: AYBFou3c1tqcwvoCJzY7HK9c3JmQigGHVYAi3bUOvUf+soxE/47ilPO6wL0emJKW/m6
	UjLUaDAbtPXngwNSsiufSPhBsdLE0N/GKjcVgTJE7WtjOYyCJ9TEYDdHIaohgXEB15RaGa+srGI
	GvTGrkkK4X+j8Qkc8pyJSBw5i1iI3QsZqQCbcS/hIf+rqqplkzxh1K9l+SuTeXqJeVArFgl84gV
	YNZvp1eOKO6faiSOZcGZV0Hc16sFnKj7qKdkG5294D26QxLGxGqIjVatbUKd5LibYo9+cSdygIz
	IJhdJ1ELpHa5JaRw09yl2b+YtVcIXF0+/C0829n2fcA6qP43WJ1kfi6yVt0F9wfM5P3NOhiRAB4
	r1OUvNP63fEZ7kauPIICLI1N+A2eV42WrbDlMVHS+EQ==
X-Received: by 2002:a05:693c:414b:20b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369d97c63femr1366819eec.20.1792723582998;
        Thu, 22 Oct 2026 19:46:22 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:20b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369d97c63femr1366763eec.20.1792723582146;
        Thu, 22 Oct 2026 19:46:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d892b1sm2312032eec.10.2026.10.22.19.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:46:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:46:15 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
Message-ID: <atrKd0jDer9wAznR@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX/w/aKKQCXYq5
 oLJkIboVwSpZMnlZDpExulPdGOrEVs8pOL7WU+FWjDzciTBt74Vry60eeRx7xYV1WjGyeGRs0r8
 z286GhVsriaKT66vKsk/UhVI46OGzwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX5T6CyCBobmfQ
 w/VGU/xSxVeZe531UnwHYUb5BqL5Y3eWjovN3XleuAd3uBDI7cZSvAUasw8mGIPRRIhQT8UePn8
 pLDK2viwgv7BRLLZSlU1+yUmnIPCWsrFO5F8eZ62/7pRBYrn7tn2PLbupfLYpsS0u91q0Em03Jv
 ZLuHwKJJkuY+eK1XzsSUUZ0LsUl+zS+i8W4pkzggRRleL3m5tcnksmj0I+4IfZ67WBndFvv/l+y
 u44ylLWLE+RasiKY70Q33u0Z+fWfAZS+02SW12DVFO4YA/QC/qhzqR90KuzRl5JAQ7YYioSgG8Q
 yJ6YHXTIUtdkillKL5ZT+qjY95TNUVxASpcYANPvB4cVUscEgLXhQH3RI+rudoDWkLOuzO3vbgz
 TW3lNo97HukH37TFiIjhiPw/hrx/6R1HSYqRJcqljuybrHZu13B4D0mAITLUsDibia3dAonhSYk
 FllhalmH9RJwbIr+4dw==
X-Proofpoint-GUID: DGyTq281uWrMjuKBBbnk-HyLSfdVo1u9
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adaca80 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: DGyTq281uWrMjuKBBbnk-HyLSfdVo1u9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:01PM +0530, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
