Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B23ACEEB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 04:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780545995; cv=none; b=PuMb/Me44Qtjx5AoFIsOxPHFD5wAgiKNMuTrO3+44riAG1Ca8cVB96KsXRKF8DOwF+RjkHTMZsQ4fv5Z7aPcO7Oq3mSINzR+BMPDllx6PedOxFjvC+EVzcWY/r4EsUNHdJnBC78Yk6g+BDLgqRM2p0lwYGviYjyCJhs1gnZgLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780545995; c=relaxed/simple;
	bh=cvU6PzPx7VvwUybXBHSGGcHgzrpcjC7wW3pJAtXFR5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqFCeg+6aK1rCx3OJnJBUISOEc5hfQpFa60Si4Lt0iiavLYiNUaEitYKtC42GAGiinnNe4+9LksvcpK6za27O0+CyQDsKNMjacGauSqVfH8HaaafaQT3jpIrJRQG60/aRo97pcVGdLC/9X9qT1PgN1vEvzZTn6IjCbWIk/kv6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgEB3lCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f51EVOdr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgEB3lCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f51EVOdr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65418fHK140358
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 04:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cvU6PzPx7VvwUybXBHSGGcHg
	zrpcjC7wW3pJAtXFR5c=; b=LgEB3lClk87m3qrLz2z/CRsoYUvYpNltEOkRxWCV
	QB1lL4AKeWWzrcQ3vmcQmaqbw41dkhYZoxPPC9I1k0FjRNboDR/leCjxThhRNRGV
	y0524tTHVvdtqN8lukUpOmykQwKifPPmuGVLZrnXf42U8uGgq0eDU5LVHNw9VaXd
	mzG8dm/BXwUJk82cI3oEYtD3WboCSiBSqCESxGRuHbgGScbuvtLnCPrUyjJ9RdPp
	NtoGCrjNl6MIuDHMnUXjNv0woG/2lERP/kGwFeD7azfiKVGdGXQsX1LjXFSpt9tG
	9q6JkCeYb/opHo/YNffvDQW2i1U1V8qwbCurvnnjPPFovA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen8h3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:06:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso482941a91.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 21:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780545993; x=1781150793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvU6PzPx7VvwUybXBHSGGcHgzrpcjC7wW3pJAtXFR5c=;
        b=f51EVOdrX3F5JC4WsQFwap6JS9sIK0LrSYUKqWhY0D0h4T4cQ+V5iGr2xEY0zSyMJd
         otQ01aaJdAUiUHuonE+4EVyIEkQKjE5LyL2PpBJBQBd556rBmYNJgOPf92E9nHEgFDvg
         o4GHr54ux45/GE9kMxK1YK6kinA1ZV9DA2SrO4E6x13X37OMgsgpLFKjSE6z9VdKqIeI
         04RjWwxkcgcwER0W/S3GPm3KaAD2V/zW1j7F+4Fa+vY3ujLahfCTsukG9R0FlrsBDag0
         5cssOrHEZkFWYg5bLoZT5/dW1uPz4L0k2HCbwuideJgAS18Q4xSMs4z7l339+aAYrkm7
         6T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780545993; x=1781150793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvU6PzPx7VvwUybXBHSGGcHgzrpcjC7wW3pJAtXFR5c=;
        b=XtB5o7FQH0OsRV/vzW4eRYs+Blt4c2VlOT9YNtutYj3KHj0507qwF64bY1huUqHM1c
         RCaDTwU1eK7Lnt/nZNjclsoiP5PeiCXV+JQsbkLwFbB692AXngPn5I0R23lJDNQWXAyO
         0cbdOyDETSmhOhPj6f1EgauFEV4P0gKE+ULBWeERDHIJj2PN/RCN4cEnvUrTT2EN5Z6L
         echVpf6wRUydThPEh+jm3MvKivKhSwZh+n1lGEqFLlTCl3zYaNPnJNWN/ILbpw6ruK80
         fLqWZG6eBTn0PpkJ5REAOihtgzWbsFx5lVmony0BrQTNCoi1EXnEMODVhIliOiDEjjLl
         9Xtg==
X-Forwarded-Encrypted: i=1; AFNElJ9JMy9/33pcEbOW4DTxCOBjk8hwQq0zf16D0MUHAxEowRN3xshUnV4qNczrVDQokW5K4Rfs7t3TUoft@vger.kernel.org
X-Gm-Message-State: AOJu0YzJhdfEPErgJSo+6B1kUWbVDbci7YkeEkn4Pmih7LPsrCA8gffT
	urMa2krJJnb8zYrBLaFTGwVgteT1wp21KkNWKiLCpLz2RReXd82KnGwwfr9OISetoWyerY07ALB
	X/UKmicaWwV/zKlbdOvuNo8yM2DpFjalKTC/qxaHHVF+E4jUEM1YB/JTuBw1Jx6Cn
X-Gm-Gg: Acq92OEmt3+AXUVRA9pKqRxofPWkmpd5aGP2cHcr+WoazWRxkfiHgWexE4S1zLyk8zY
	4nKdsSx+iW7eSJuaXfDDJ7tF1RwsFJeaZDlQxWIumqS2K2vwc8dZAyR6T6kstMzfUUhmD2uZ13E
	cPBy9CgmZxGVQ9XVieNf2yCkqYHR50dAcnO3IRc9q03zUwOZCvZrv86zJPWOyl02fnyLo+iKFOv
	kz4FTHrp++kRCcBM0YhHMAyd3LOvRP+m+3dB5+/w1If2R2ydJBSb1uHPyjeujJFUedC3y7eMFG/
	6/7uvwxiM6qJnNiv+B94Xb5l1PDAXKAY6kzoI6MjhrZunk7XK3+8xUUgBp/5V6Q5+RmWIblr3rZ
	z7JE6ikgL7J+vl5ukDECbJ15g8VASnaduTew0iz/6/huLuSMiBzv6mBZWgp0C4vgh8ON/AP/qN4
	XK3XVlQiYEka2oL9S0ZCTfZYkmTEwxapiiixWQEuuRs+haT1PAmJJDbJgcrrT2uA==
X-Received: by 2002:a17:90a:d406:b0:36b:a2cc:485b with SMTP id 98e67ed59e1d1-36e318c0424mr6180734a91.21.1780545992488;
        Wed, 03 Jun 2026 21:06:32 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:36b:a2cc:485b with SMTP id 98e67ed59e1d1-36e318c0424mr6180702a91.21.1780545992029;
        Wed, 03 Jun 2026 21:06:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b26bbsm3566591a12.23.2026.06.03.21.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:06:31 -0700 (PDT)
Date: Thu, 4 Jun 2026 09:36:25 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Message-ID: <aiD5wRww9sxClQ86@hu-varada-blr.qualcomm.com>
References: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
 <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
 <aiAQ4lzRoRIzAXT4@hu-varada-blr.qualcomm.com>
 <d46a7c9c-ef20-434e-a373-c7f519335230@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d46a7c9c-ef20-434e-a373-c7f519335230@kernel.org>
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a20f9c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=wzrz7JlyjnULdPGyGyoA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: mEdr_OYOqMzf-io3PHozS-dg_GW2Lm6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAzNyBTYWx0ZWRfXyY3PJp5YlpyR
 0K2zIdEPf2mcApw/63Dzj0hAKw1vXC5wDj5QyiugtV1NWuJLy4RK8wTUnC2p0+nXWe4ke9l3sit
 tt9wtcbYqtBY0FnNpT+5TFEjtV9iJ8K9tE0ejTtrnJKQx7KpT7sPxBpk7FPXXwK9o5vLZy1u1kC
 uKTwFjUSpDnxi2pSNZ6AcF1jNnU4A6Qfrdb4+gb6MG5w4F3cbJ1MtxLbjzBuRzCwgbfNVS1pYe1
 uIlAN/kVNjOBnq1NukqrDEj+ylcywIfj0936JImrDSjDZYP9r0qaCi4CcGbV4KzxPVPBDga/Z0d
 gnTPiuj+GQbfNHQfCjFabp4ocaAn8mrCAP9oD53cLbEVKDYWu2rIe7JgAukgef53E465PKjFj15
 FMFJ1rlc6sAfELetuvF38Xy0oaHSEOwWdlgU7qpz3qwOc07r7XZ1s7Zd32YXxOJW9rw+/TnIzP1
 l70qX3y/SFkWSZVstAg==
X-Proofpoint-GUID: mEdr_OYOqMzf-io3PHozS-dg_GW2Lm6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040037

On Wed, Jun 03, 2026 at 04:04:43PM +0200, Krzysztof Kozlowski wrote:
> On 03/06/2026 13:32, Varadarajan Narayanan wrote:
> > On Sat, May 16, 2026 at 11:55:35AM +0200, Krzysztof Kozlowski wrote:
> >> On Fri, May 15, 2026 at 02:54:34PM +0530, Varadarajan Narayanan wrote:
> >>> Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.
> >>
> >> Please wrap commit message according to Linux coding style / submission
> >> process (neither too early nor over the limit):
> >> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> >>
> >> This applies to all your patches, not only to this one.
> >
> > I had incorrectly wrapped to 72 columns instead of 75. Will fix that.
> >
> > However, in this commit log there is only one line, not sure what to change.
> > Am I missing something? Please let me know.
>
> Hm, that was two weeks ago, so I don't know what I had in mind that time
> but I imagine it was too long. If you checked and it is fine, then
> disregard the comment.

Thanks for the clarification. Would you consider reviewing this patch, or
should I re-post as v2?

-Varada
