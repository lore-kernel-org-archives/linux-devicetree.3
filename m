Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168579;
	b=BJl9Jvhkc3hwl/HFNpIiNhalt3fEbqasvN19JFCiR/gUszvfcRDkZjP6ybyPUcRaDfFW
	 N0I79rnkTmZVna2yLZwCadV7fAi00hCHIl9fzddGUdGTcBwDJHmE1iYo4vA9aiYqqiYgS
	 Rj46f/vpFqSn+unwC3Zdd0MrW5x3lND2OLQ8emEvp73fbTuzpnPHNytz9QICmM9Ws1Vov
	 yUvqw/LKFuLHQu70smHTJyC2lG8cP95WN5vw2l95XRpcLKXENK4sK53XVVffaAaDW64mI
	 8bqv3I0JLQbfvxwDi+gpW4M/VPTWDz5lqgTxbrpwAU8iok5cpdlybNvXGtmU9TfOH2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
	b=Ltht+iZxJp11GAu7F2g+ZQ762FIIOFJEjTSrAEuaaVoxT9Ud4m+/TwR0q22wvMg03Dp6
	 WtEJJV3XdcGipOP7yI0pkAK2KWiHS/beXomZSof5QGHF+UVRvmrKbmB6PHtG7JXkmy7UR
	 x2AUYScm4EevqfD9NY6mCjQm2kmfZVRR0Mnaec0TXmqQ3DMU3lwZgcngJZxuL1cA2SeHp
	 D3altvGEeevHafZvunJ0pU7Lq/SBTC7m3H4xrp1m1RzxLKxOPZjcqUq8hXvzWg+nxYHWW
	 M4sCuw6oZlgNTfyR2xn0O0zF37krr11tqqTG52QHbZQSvnQRPMt6MrB1KS6MgdQYapA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtBZuUDj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTLBdE3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA89E606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA89E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtBZuUDj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTLBdE3L
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fqPh2695550
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=62eMXVAhsdOLajmrx/nEro/a
	U3Oy4TAFM0MOIhVJt+Q=; b=DtBZuUDjme/84lhCpowIjh4IA7DZGsYJ9xpjZP+i
	kV1Z4tp3kMmww3fOatjtqQZ38Pf/Wf7lRdvRn0KEffg8CiBaC1MIkFEjSvJft4bU
	d9J9rt6BmsRA/VPAjktQn2F7U9KwRXWz/xPgFEvwitq0Ivsqw3q64DfFNV+nnT/7
	gr7IkNBRMlm6s/mC1FczAeaLcyQV+XfhFFnKYGFqoDigURsH6GZ4/i/EfMfAZCUJ
	VxFUzpoEdz2OuyMCaofk1qJtkEElziuYtXxzSIS+HCrZT+9mA+G83IHFHMUWIzlB
	77UTAKN7z6v1TBUfM7eHSFOFeyjWERqLRkeSr07DVSPBVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au33c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:56:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so132272185a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168577; x=1795773377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
        b=JTLBdE3LjVJxvkDC6Ly8UL7Fb7xbgpvu/LTV94IfDcHvJauprqlS8/iFkKoOvT9o9W
         d41A5RP0GZ00g1Mj2sUFcih48dQItsqUj3txC/IZaA4heSmP50lyiPnvYZI5Pu1ab8cw
         KCaV9FeS87aVnfb6D4vKT5T/a/++unJCg4iCACHhGfvUMTi0vl2NrgbMsT3YsBJCQSp4
         pZ6VjHaxFjrywa88Mt3O35t0gbXuvQzJIq6twUz2CI39TWxgZe25cq0rlZt4ksMtILyx
         eN2Bty8uFX+En23W1FdbNBveRLBV8QlRzcUsG+aJzuFRO+hTft9X+YVpPio5TUrjfld/
         wmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168577; x=1795773377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
        b=LsswxoL9AYT5uU/qHUiqBHvrEtUS3bhLbNYgbVY4xKq1H8Eem1Oczr+CpR0iEvf6zv
         h0a8M2/gxf2+VnU5ZZGOpHYPgGrCnETYCAhTmzL3bInGNqd8XzN5TfiyqQsJMxhnGEOk
         3jKPHCvPjJrBHB01LoXdeEOQyJDqjGoZ4VfM3GFOxvyyOmlqG/3ve1bUqqgYDzOeMeGY
         SW93fQgV+yfKhMH0YjUO++Fhdp6hutNT7Zt/WT/JgfZqhVe3Ru7xTXHzMy9dPGOzo0BB
         W7fa2LpQuojZKZoUJzgkB5zfaxCqvQf/iY0RXoxU3Bq4zLZzpKooGu/IRSqjChf2gqFs
         TNCQ==
X-Forwarded-Encrypted: i=1; AL+hErHgBfiTReBlhUUzZzKcJyP6eTxQ9WR8KxApEdBGX3IMY3N4Mz5wE5kBPkq0zyZByoWnXjn6wkl2mqT7@vger.kernel.org
X-Gm-Message-State: APuU4Z9heEBTFXFyUWwqLVsgm+o8szhV8DO/WOFdH/it02J1TJyREaPH
	fgVVha4XADMr0oQFB6KnV9ypuzZsIeFExzha4eQD4c6GgEp0z6Kvw+viPZAKnli7/Ut+XIHbTSo
	CP8amOvp/qXWiIC0+C40sqUr+YNwVjv7p1wrfpTn5nvoUIJFkFWFBe5WTGnhNaWP2
X-Gm-Gg: AYBFou15JMNXXl25si1NjJ++LRqlYBdzzLYoHzMOuxOS364vkuIu5niNkKZtbt8Mpku
	jEQ7UTUHbdhpxvXSpsS03ICR3Fg5XEAz6jmHeDvEsWJ3hsw5/Ez+m6g5yVZAmTapW341D5ZQnV9
	rW7/Sqg+929UN6BSa2NCNrvrNzM318RRIxII4rdlOAvhwTwqsjP2wXUA4p0aeIKwKJa6CZ5rypN
	1IMHuGSsAw0SgKpQW6IEPEMBTc+hFO5ve23cDDr04CbeIdANArALEtiMcC58vAU5n/OQrBJL+rN
	V7Z9VcLisCwMiGHq9Nj/vtJPvlG+GMFYhTp6CczqtzV8WfhkvXNFd48jHoJcx0k0RtMCv+pdCOk
	3+ZCJFKOhVbvzZ9ev5xdC7qHFNcd9f5F45WFS5Z+V0ETFDJ04tC+mcHh647ohC9or
X-Received: by 2002:a05:620a:4693:b0:93f:2b23:481b with SMTP id af79cd13be357-949ba955b51mr440889585a.22.1795168576953;
        Fri, 20 Nov 2026 01:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:4693:b0:93f:2b23:481b with SMTP id af79cd13be357-949ba955b51mr440885085a.22.1795168576349;
        Fri, 20 Nov 2026 01:56:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm4320876f8f.26.2026.11.20.01.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:56:15 -0800 (PST)
Date: Fri, 20 Nov 2026 11:56:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: camcc-eliza: Declare icc path dependency
 for TITAN_TOP_GDSC
Message-ID: <vgclluwnmognwpaxmwazb3i6teyrktvbig3ykf74ppjbp24kze@umzxgoirryxf>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
 <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
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
In-Reply-To: <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXwXobY1NUrA9h
 FyLZv4XsoSISfiUbISao1kvRFKFio1MNjwHTKdHVHoJgfnVYaSfH3m6o9zfVtaoaCjI6rtCeYHK
 jNhbzFaiG3395JQ1fcNrdbWTDHqy+YcxRu4i6P3AMBiFyrGANEToMqsyfyfWKueKHmWzr+doJ3e
 O2BpuzaXIAVcoEqtvu/CH8GxeV1tU6yY5AOHswHA+xa49NuFUbeRckFzZDVPWTCxvcGSo0ms03X
 WCTK3LLDW5ZvUtAmTp1ddR3QcoDO0HDrlRH4NI+VvSvb0mAuZwisdHYplzTexoRDkv6CbAx9pMZ
 QjUKL4hLqvE6Q0PWL5b9xYZUypwiJ7J6NoReyGU/A77vFlg81kXWsCzwGVP+1h+YDSJ6Q6F14Dy
 /5zTtMRNvJuOJl32H5gYcypz5VD0djDXoOogcJDfNt88N8zPwkF5+qOAcfMIszOmk6j10c8fzA9
 7DPJ/O5onIpMKfEs0XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX19iv6kcWTThN
 J1PqU0M/v09XLjys2GAfc99YdqbMPWeczHvKjr5MYaWvlWgDndaydOEnrPgTTtmvyjFE3ICHfTK
 xge+ACQzuYvSfjTI5Zf91cXMIKyhIEg=
X-Proofpoint-ORIG-GUID: 8aF-0kdOgf3YXzSTXNuQEUfBrj5_doCz
X-Proofpoint-GUID: 8aF-0kdOgf3YXzSTXNuQEUfBrj5_doCz
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b001941 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cBiroVCkOlD2lhM5SNwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200039

On 26-11-18 15:45:06, Wenmeng Liu wrote:
> The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
> without any client vote while TITAN_TOP is still on, MMNOC attempts a
> power collapse while camnoc may still be active (QACTIVE high). The
> power collapse then gets stuck, and so does the MMNOC BCM, so any later
> bandwidth request through it times out in RPMh:
> 
>   Error sending AMC RPMH requests (-110)
> 
> Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
> voted for as long as the GDSC is on.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
