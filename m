Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896849;
	b=IfYy9qPb5c967GXKBYXyl2yqzFUBGYdbDbgmGOYIiydEWmbwqfNmrz7yzUR/nNAAQLCv
	 BV6vG1LCa0ARoPma2QFcSmdmNMYvhBteJql8dhIuu033JPCBlQbq707zxk3CtwA0JMmTv
	 d6tOc/WrBEEzQW5IkZLonDUrT+BG5IcxsA/y9sGLFHpApwLV7w0Nfjj5lggehnUFZDuVF
	 h4XkSmmGzu933BxzIrJAs7sjhVyrfaFycahF5+V/WDk6lZOvpjRBWNvivGN9eR0H3WiAo
	 AiQ4CykprNaKnR22nu+k2KQGYw07QzRbjAJ6lsvD9TzLO6jtlU3XxT+MysfRd03V0qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
	b=gTVdFpqXAQ7fVDz0eUdm9qGqNv80Fpg9ccSDW5uhxoPX6oMvA/CG+NyBWri13m73J+Y5
	 OiIfi+MoBwSqWx0/5jKw8d2JqSxJACmIUmD39nlxhEyvbSQhakxj1tTOwLnz86spJn0Zu
	 PyxqDnD/tJs86ziV7kMJlodgIlkZuS3FNDm3cOjATAhgsiSDo47ptIFXomFhsobCAgH+t
	 s6gq6exPLwMrrMEDU7m4OFoMTvvOFNRlNFnR/G+A7IJBFWyACvMEHb6lZZgh0jgoIh0u9
	 fzaOmj53W0f1Yr1VPlPSxz/BhNm1KnxH6S5TY1v/aOkHo9jtW7taw8XQL6fAAmqKWBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42746606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42746606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH444Rm1699244
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kGocrnhODpwc4HBS0K3dbxJ+
	9nBTUl+OfB38M/5zCpk=; b=RttC8X1Wi3rineAEJsXoClK0awK/HZwO3Pd5wbU6
	n+izFuGy/jM1k6iQY6Uv1tUrkcMVmWrjMiX9MLU9MpTSRs68W6MQQmxp5R/+Sp21
	JbKHf6Hx6mqxR0cqsETQyCXNMDiJloBu852Qzg3+wwqsYXexwgqpuvKPvdbAvtR/
	BUT/ws0+ytVtLSaLadBc6ZvDbfITxfX+YxF1xJUro/SEA7dEzhQONrngHzPw+ybu
	yXutTCmkRwsqNbRM6RJj8zbN0uEd/jn6dendsqozFulF7L0h1QrPUvmHzdwzUfa2
	qB7huaRDz4zIZxEy/k+iGZpagm7xGmxCiQOAaXvOXOqsdg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjuge3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:27:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so4858063eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794896847; x=1795501647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=MF4Eey6XMU4u0oG/w5RB3nqp9nUvCnHLRCIUhvDmN/XTqzjCHzc9GJZ3HTcLj3e+bt
         QC5abb2z5NMsdpqWCcCCTB4wP1isgaFl6cA1s7wRe20dfQiJWhLOarkpDOLvPoPo8wld
         TYyvApY08gHz7+WtyHoIPM2IO30kQcXelGwCM5ssgBAntR8rIsbk3IPMwX5jL3WQMHkA
         Tuk+mJjYT1h7xRSnHqZEdJzFaSvporelXF2IGAybK1tRN1PrcZVDqvc/aMxCTO4No9MO
         UI0jcrH6yDLM/5NytdNivJ8hIbBjXhjuwUA4+xVIy/JA1fpCF+aUgtdYTyEZJ5Gxvj9G
         RjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896847; x=1795501647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=b9kpXI6EslWp9zvULAi4zhRaTYkycQZdoMzGQJhieNPiN9vKYFbOLBuYdtqS9bWFgC
         a8kxLqFqxNnwmPlvBA50XvW98a98OR45OjYwqlrxpQQf8nvn8mDoVV3vIkc1V2gMhxv7
         cnuZOrplEkw88+tW7TmQ0cvWS7Q8TbtpWEpW3/wGW25Xp50txJR8q8grtOhAmb3L9JNH
         qKx08dj4yJNeLEMHs1tyEpG++k9LPNuUH6KEdAseVHnpSEWucqNnLBfjzBLmcRhikEoQ
         pI8Qmv4yocTSF1kGPtnGSqpaZNE9eINco4l5jWJWr/bgYorPu7sEP7nk+k1MWkitHE2F
         YInA==
X-Forwarded-Encrypted: i=1; AL+hErGHjPu/rr94z3iMUI2vLiatlHiYq+Kbkm5fV+R/SFe72KWA6zQx61wFcbkN5R1/pO7xWwi7d8pPz6ku@vger.kernel.org
X-Gm-Message-State: APuU4Z8RvqdWRog38OSBSHeGXjq26w2iNpM01F8WlsiUOIhbPsUp11/p
	qGT9w7XKJH8L3SD9OWmqfx4naz/hzpkKnhLabYnDlVasWM7ZOH5n289TsHIos1BBuSK3nHEtA6t
	WvNpVy5QMkk6N/PMsMjusGvCl0l6AboykmsAPz9j3uW4NXRZ7rneQjaAXN2KvNXvD
X-Gm-Gg: AYBFou0piZoTdkJQYU+k3lLy0c1FiAThU/qq87HL+rbSlr5YOSF0OPwuACc8WbbzCOV
	s+1+ONLDF8ZWSO49DK7ygpJu+zCXf4agrknJxh2U8LMf5u1dzBxfyQ6goWUy1ukzUfEP2CFfSZw
	DgEv80wItju5fp+aWnkCtG1F/iXmBE7mhIBGMJ0BXx1KVXlJKUy93mcNoBKW7tbbD3iUIvTIa6r
	tEyBNII6TDw4sZH3Y/ZpeKGlxZPiu3Ol/A8bQpdzy7kzUdW0wfRURpvvZd+1EEOoOhhmhymbFv3
	ABGtiHClZ+kashR4sfjBGohZW3cbQIaObRp/h1dCRbb0c9+Nfsvi2CTZomZqGdwkdhfzK4uniXM
	4SdKMRS32nMDaJ7nPf2NwmTSGm19QB/d6vxDjDD6tw+tcEPie6A3e7Wh2SsQnXA2yLLlHi04+Z7
	ZyUdwWT8khXxW0tBdAZLoqIsdfi3UB7tYaHEAzFRNsgSFx3bqu+Z6dDeDpDkwJyKW6o4juGg4EQ
	/DXuCA=
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663835eec.40.1794896846981;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663806eec.40.1794896846413;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381cf17c443sm713717eec.15.2026.11.16.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:27:25 -0800 (PST)
Date: Tue, 17 Nov 2026 11:57:19 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <avvzxzjzzHP3o+4k@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260930-striped-copper-cat-7c4fff@quoll>
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
In-Reply-To: <20260930-striped-copper-cat-7c4fff@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX3hDdYj7EQHgo
 cRt0MRpeJs2PZo8aZVCjR2W3/ZISwg+RE3T5JK7JQkekI0Cr7ZP9hkiRygxid4iVFTSok6QTC12
 LSbxqUHGEVzegkEGO+S0NeYhjyqf3xkoP1hp59Xo6g1kslApDj469c+ixPAkIQgIL4BMyeOwWj4
 1ADtYrP7s6Roh+o37OfnoLTRvsuUFYmryZaHlwFBlsLJbY8/6h+0+jXrRyLyWmEKz8XyM7zS6qe
 PqM0c9aM6lMtnvdXdvOEjbJL1u868h7puDFIi58WityISHrpjBliFe32N0lzrXFrXh3H/9z3f5P
 n/s2D2zTn6dc1z1uFA+pslzVeNfCvl43aU94SF20O8hvRf9MOmX+vLKoMB2PG3NmHNeB00fiwNB
 KPAz062T+nOglWL+XEhuTXVKhM2EvgE+bm/snsopvixYBG7VkA914g/2zG/oZbtzSa44eFisWCP
 w8ak6phlAy7guCCG1IA==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afbf3d0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xdh-gZmfb6x7HAvpyVYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: CgEVIhQFWcua0DpX9cC1GRq5hNgR21g5
X-Proofpoint-GUID: CgEVIhQFWcua0DpX9cC1GRq5hNgR21g5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX4z4kqhAYngD/
 6MuwvTxXtQLS0h9xy3GEHjwTLWI3OGK3Y3v7IDEGm9vxuBqkdWdZ2Gfk4ANVl7+XLbRJzMzDMIO
 nHsBY/xq0+hs0dA54Irr0G/+QDyMWAI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

On Wed, Sep 30, 2026 at 11:17:37AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>

Greg,

Can this be picked up for merge?

Thanks
Varada
