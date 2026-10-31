Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477778;
	b=W1/cIM2zSpXOvEXwcnbEks+PvVwuYGY6T3y5mupVWxktpK7fxyAE21keeB4f60GwzFKL
	 RVwnU7FDtHAK5XNdqRs8rAUF87/LWJODTCbPGP6p9hJZiGlGQL/cPvu9Quu1bE2FjIXm3
	 Ue+8ljCpOFJ0v32CnJil9mAByIBbqevxOqwqGvLLMeTgk6Vcocg8p+0ZafmhCOLgil5cl
	 KVNbVbpCdswj6QzMJgijZFvemBNe/YS4o9QjU1glz7hGeRL0kRQncCBqu6CKbmUwpdcmU
	 AawwXpAIIpuo/6hDDhkLYVxR47EmVTCIwCPe3mEDwV1EvAuJD1CIcyMZoiz9kRkY5IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
	b=zwh0flDbs5dAenQBScKktQM07B6u0gsAAXaFM4TY422PzHRujKbejc2dJcNRBm3b35x0
	 dMlaKltBYpiMz9+WPM7oRF7QGXWAJF4TsuBmayBQ0a9PklpgSsfWceLmsao8h7iHoYSd7
	 LEPCndSh0s+6KnAWjGiVR8+vbjX2vzlrZrDacgfLsOnH0sJuIZ90umVVjmYvCeWnEml9T
	 iDcHMcqjSOUSuj7CeNv4z47mDAmAkdk9KETLTt8n1Bnw5u143VwC0rEWVsQq9Y56ChgBH
	 eMHo4lAWJWY4zlOjOVR2um9aRkeiTcaBq2h5YR7S+VOV1K1aly5EF+UQFN6CJ58cD8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96377606A31E
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 20:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96377606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF2nf2614246
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 20:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=; b=VygcVeebGI/ri9YQ
	fhErQBAM0zlmBh+3G/AO6X8Iht8tVCCqHroXDlWGB6A5COKcG7ZiiO8NAwwlh9MY
	y26uUS11faVLGvYd7XQqcamy+LLSsWunkK/qlm7Vcni7i8QpXdGZf6uzxxNC7iN3
	qjqCJswC6pu/TFUCIOIzw0OKktEhsxqyiGoKknSR+ddBhNfsfopYl+4nOoYJ1Z9B
	DQ5TLrLIbNOfcD2SpxBOdFlSkMHMVhCUYXVdGk3XDZnIwgZebB6f0Q98XaXTU+nc
	1lzPF9OZke8Is/ceATWUw2dG4/vW12NQ5+7cOSJ1tXI7wUssJR56QVSWae/93hT9
	M9rkTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nft3a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 20:16:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so251976685a.3
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793477769; x=1794082569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=bIVanoOa0vzaexjnqqPTRZwjUB9qlv7AS9w0wC9RMCE2R+KpbKZD06ztEg71CvJhnv
         w/RDzNowSjy45ImSh4Wypu5s7Opw8lyspYrWaRqndA2qnqQaZcTj9w0HVOC5e85O2bfj
         at9F3ThFJUpL8o/qmSeuDyP8NVmEPuo6hfdDjRxhepTaJRsEiNG+DJeV0tyCm4b4bUt6
         P2bC53GnI42AzIarj5DNIg3a8Xn1wa1PWSA1i0wCc26lFlZzg7V0lBPNyb0GIB9yXbTh
         xvCpaOqVKPsrs+3aCVYYYA+62ZJOe3oHg+F8oVeA2/yqWMGjhpA82NUN7RjnGgztp1f4
         Jz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477769; x=1794082569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=KyfwP7MzJ+y2UDjR7DPLKIQASmlA+2C0HkKNliK2PDXv34hje4IX+k8KZv/6Qdu1Ug
         k9j4AkElvqz1tx3me3HsA9iYEO2nS2brrl28tLkymb68ZLB/Ge6L1eN4EGtCp0io5QD7
         Qn9qL2gBhQDtBqr1i2wrat/R/iZOLcBqM82orHhe7hOYX7wxsCOzdhCuZ5orOnDiNj15
         Q+Zof5tgZReHSZgD9eHfcsINd1MC8f+4SoEmz2P5Bu8hruo/V2kJJgY4LCqlEIj2ymLL
         NytyICdHv4O0XvtRPZJH+DoA79d5ttPZysCcWJuQ9X1cNDey8M/PZmV3r4rRal0IG9Rg
         Bpww==
X-Forwarded-Encrypted: i=1; AKwUvBx/bpV/FcxFwtPWaJzjXfz7O5OsP5fGXkkhhzysOa2DtdDkS1T7WuFIk2IFUS95nUWJfUmNKBvblm4N@vger.kernel.org
X-Gm-Message-State: AFq9FYKwQiygleJZ99S70pXyWmXIp1Ieio2DxZsk6tIlI3cW1Xy+O3e7
	u/Y1Tq2fuIaP8O6SJT7JX198kEHQFzp0OYQitO7dehdgIst9ASggtI6wflatrEiKUq+HmgSfHM7
	4ErChFNoHQIVsA7kHaGz4zmCrOR5cYLn2L1eTI86ihkXUZyYILlYt5ZeWCAORws/D
X-Gm-Gg: AYBFou2F4YmLjiTvPWwSQ/giIpiva4CkFVfgA6ljVo7nCV/PEFg5Vx6q5d4hyW9JF26
	yDASdMtxXanmm3KtGGI4e1/ydhgYMPcVEvrtemQdHOEaJphVZ3c0/sMJYS1mtMevmly7nvapMMH
	GTtQPfUllK8ZPrtj8T2L2pMfhPtczRvY26FBKS2FDeeJwk/Wp4CdIcqGu0XVu5MCxtd/T53aWEW
	4KLokpzfansZa/UfuSzEka2CVGB2a/PhVqFXPmTUK1OjyzxhrltPP9YpzPSXpIB1Sb4DYvdri6K
	IVmM8+D1F6nIl8v1qjqlUTkpTSft5q5hs7QP6Acn/1t4b841oWBTZ/y8O8WnNrwmYXHyBP8ac3M
	L1XXNEIHtKE3UE4jH5X/fBwP1CquSYvThJaU131WfqpSQ8P9nW5zLEBN0NQBKd3bJbaGtTMiCcG
	fkkwoELfX3QxO/J1vAaM6opgTvnkTx9gjfxVMgTeZ1o+GBKwg9BQwnJBnIHqx8cA==
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055213885a.76.1793477769081;
        Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055210585a.76.1793477768621;
        Sat, 31 Oct 2026 13:16:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0752a30sm731130e87.78.2026.10.31.13.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:16:07 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:16:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaud Ferraris <aferraris@debian.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sdm670-google-common: set chassis-type
 property
Message-ID: <ucyymr5uvakzqalebjvx4cnxaqi7d66urnjcogjm7jdgcmohu4@63uj25mpulyn>
References: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfXzyIDfrVyCaO2
 do7O4s2QALzxxnEtC4KmU6PiABrwo/nJDLulenmfTuIyQIagPlXM+MOezeqO/3r0vQ3pShUBAnz
 yV3ZV81Jvdis05lBfYd+JHEevVUv7GQ=
X-Proofpoint-GUID: hHGG_eW5GgniY_JDgel_lLBRIVOKZ7T-
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae64c89 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=xNf9USuDAAAA:8
 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=2Uk1DsieHeZNntOzPjsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-ORIG-GUID: hHGG_eW5GgniY_JDgel_lLBRIVOKZ7T-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfX5+tpdbcKDiGV
 kBRgen3DzfApNNTTH16Ea7ELBGG3b/CuagP665pzeIMIoYjPBzdubdo6xVFZeW+pY+Zv7A9rp/V
 19qKViGTU6JxdY4NSSexIiZ1wfbGgpAEYHvavLMhlva5R2xEch6FhYQ89G2ulnT0I89AC6qo0uq
 VfchmnKbAFKP6fYmIlZqSbIEjXxFeVBsANt8NazIhaUwVAwU8TeKnCCsqFXdLumi+OIvj/Tu8wd
 REiITLXWRVRBW+FcwEUrEWyrD6re0dbacMFgHHtLul5hiyLvLSINFrl5gB6FrkMbF6wWhJeAz/W
 +M2RJ4b2PDj0QI9FpLi2dsDTxYOW0kY2HLi7GYabUqwroacDZlM1apK5WKN3cKFiyA7dpQXssEo
 DKUuF4QOjuShHxf3r6fS+27BMFrEazldXPoLVsnLbzcjXm77y/FDVfsho7IDv6SASFqqeAt63RJ
 OemQenZ881ysTt6G5hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310080

On Fri, Oct 30, 2026 at 10:27:38PM +0100, Guido Günther wrote:
> From: Arnaud Ferraris <aferraris@debian.org>
> 
> The Pixel 3a/3a XL are mobile phones, we should ensure userspace can be
> aware of that by setting the `chassis-type` property.
> 
> Signed-off-by: Arnaud Ferraris <aferraris@debian.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
