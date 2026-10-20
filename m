Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501207;
	b=3PcxRra9ykd8WYFxAlrPUmheG/0NZhnSPeEzZ5aovo5DTPA/Kms+SSYaVW6lpJiTubV6
	 Wk7XP66YL4QrzK0MJW2K33THh/DsR/toiv8SKrc6NLULgDhfJ68p6+IOzuO3yJtZjAyt4
	 wzVIg6M47XDJLJC4SCOW2xgnkg74XxAnVqHVUY8oxx52Mm/CIJ7SL9Hvgs5mJHxWjPmSp
	 gvxoGKfvfTp3I4abemA4hr72Y9e18gtNH/xZeBtHUY9Gblc8u+uee5Q7bNaCLdCTyovw8
	 m+vmqH/0UXCupPuUI+YmsHqboeBGJWAsoHkmk4icgc/X9F5jux4uY+pu5/+q+cD98yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
	b=vPx0z3ptNJ8HjGpIGZLO4Oevht9PfNGu0f5Ioc9mhKYtbO8h70fM77jZsXZCrLJUW77r
	 VrupglB0nTTSTII8OpPdi53Ga/enCsyx5zZFB43XCcyoWF2qpINO0jsSIeeyrObMkrE5x
	 D8k76cESrug6+jJqdD6/mZAuNALNP/SxXX9riMqa9h3RVlYWVxO9WCgmlmW438/faBjf2
	 0Z/wenuJKoAkTqptUY6f2AE4c6k1/mQu5pVTMuKNx/NZ3Z17ac04pewl5IYXsrBD/CBsB
	 zgYBFwe8B+Qb7Cz0UcBbrk0GhEIiVGx+Zz4Vem4fXiyDmr8XfZ669eRNvPgZIt/NJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBata8Ao;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Di2gINIR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7090606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7090606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBata8Ao;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Di2gINIR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWSEw1571650
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YA9sqWUQC5W+VQQaSJzAueT
	T7pF0UiI4Jt00f8SsOs=; b=nBata8Ao4VnQ0BieJol34j6v3+8RBs32VD7eaZhp
	wXp9zyryFdPapgD3yxOU2W3hDf5JiYjP88Ek9vXfcuOTmpdyNSxfoBJe8FPwG06e
	HFJYU6HG9XkXi77mdk21dStht0pSLtgXgiW5zMVJWu97Xf52mrC2xyeNv7JTnMgm
	mTEyxSpXc82kgha5oxOYCqhQAO0D+zoKPptIjk4NtdfP6jo35Qx7IwESX7SP+B0/
	AbLNThkdI5J6Zfup3pl/sOU+/oOR8yIs5nmnZ6TmFeT8IT7l/TTX2hX/LUlDFoQq
	aIf7n6cVLxDjNRi7xaa45QG9c2pMkXett3AUJJOBnZ7KDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2892u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso125196985a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501205; x=1793106005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=Di2gINIRkpvGYOKLUel8EAsnQd3B2/+SIigSZiLuf0ACgbLvoPNRBC8ASunmLwvL5Q
         FmAk86Ged56QzGXZZs1Dkm6+hlvXmLbXgsqMjUQUb9r6aMQpEduFwDxE1b4K1IO/FNmK
         KV0LmB/c/fFAFjM/Ed/IEr625N7Yy0/V1u0HPcmLgyD0Wz0yvEZrt4AUNaK/oA431jIs
         8BM7sFbz6r4KYmzGufsXUlm5aFKXCeUms6mUlEo7CMyPwO0wZYGU8LurnWrq6E4vjits
         2+7AfByosvn8bASA7pOhPevnXRDupE4k/qh53wboD2h0x6S7uZElrM7FA5B1Ir0+Z4Ry
         Cc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501205; x=1793106005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=GBKHRPVb7Dka5Vta8XOaVDWqu6QhLLUJ5cMO3M8bgEv2kyblV8DfgBa2qWxcZFphAU
         DZepBj1M6JAVzGHglnbuDOd7UoGkuyA/fnYlyvFFrf4ReRiGPI0yZqVh/0e0ndeIBvvY
         t3bUYvnJ0apdH8LeBGTNocgl0tA1y15lCzF/x2ol3bCTUAUGNNCZJjm8JXR8AVWlGwA2
         1D/8Ymrr++tY2nZDUVcTTLaxymSvdOGNLbpxF8EkkIbEAh1qGABvgqLrxUghP5fVpYoc
         V8FekE62wG7+8M7hRp4Zc6mhLgDfu4QcgocyFeMYeUaFOnY5xe3zUGavoFH0jFZshk2m
         j4YQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+CbHShV9c/ZN7Qty/5gunzvE4MrM3mLHebkJOwXax5Ix3lWLHCBLtpt2Z/htrARSsX2JaWYRlV5kR@vger.kernel.org
X-Gm-Message-State: AFq9FYLTprLYRD97APg5TZ0ypkHdyyRiiZkvHmMS3MWtT/rXvH+0z+zL
	vkMd9BgvAbCWqyQkPmumujwMRWMyTJgKdBOfS77VbpTGMtZEniE+GyZ2TN3B2ZmUAHmgXeTdaJz
	UCGYiA8NDDUxOWDjKeMCsQ45bIjDqESVbgo2+QKPEg2f+jmWSSxYzZG55ItBdBlX3
X-Gm-Gg: AYBFou1xTo/RvxmfaL7wZuiuZG92NYDH7ixUao/sySWprIf/2E3+cW716uZULdwS/OJ
	8c1urhZC9DsVq/th0ez4yNAhut9grVBDTzb3Vyc02/b5cJPA5ztr8YbUSJnpBBq0uYsBsaGtMAx
	TgUjjbqIGcgAOSndb/j9EYxxRI8QmZRFRwqx6wf1ne78+YkceJ2zXZFtx3WJ7JzSTfxrZyaPIhd
	niWnOV5Cc3jpzwjbBW/n9r0D3Zdorfm1H0B3XNO0uofq3wzxOXgSFCPa5bJUzpEG4i5vAEdIqYt
	O4oj0kIiF8mdyfACYz9S7Cl2cxQgMtEGYM8HXSIe3V3i71FpP3BSFoaeqfuelXD1UN083l6d8zG
	EKuPVasgDOHOpXKA3
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311655885a.19.1792501204398;
        Tue, 20 Oct 2026 06:00:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311648685a.19.1792501203724;
        Tue, 20 Oct 2026 06:00:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm83132575e9.0.2026.10.20.06.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:02 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:00:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
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
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-GUID: GqgnEeWXXlhteo8mCZDX01N2eQ2dHcGo
X-Proofpoint-ORIG-GUID: GqgnEeWXXlhteo8mCZDX01N2eQ2dHcGo
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad765d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EzgOzLDDTgUawJARWFgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXyskvy5Y1j98s
 dfHBlIkd9dadmspV/jSX+nnOLdXf7MPLzMVoFgqH0bPizMZDtzFk8I2jDsqNj90pRE3pNrWjw0Q
 8UXpINt97zA9TB1UvbKuBiVGctSUSCk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1Y+oJm0EBNxl
 kN5EtLjN5LV7RW3kVKfgFH+QFLUjUULRQd0+9Rmj+6tuGLC63R5+B1WtLN3Vw1S0tsZihba/8Yo
 dAGLLiu3upPmxXxTBNwGP9tDKWkoRv9WetMokvzlB28WNds6avRQrId1vmAozx+Q/HdduntbusP
 wpRifOT+2XQw8q1NTV4y698DlaoD+0F52NMgExwX2kKsIbbf0vgRVHAsST6ZgeErfYvee4B873R
 JQGb9cSfVmsdoZe6KgcEFTXOHNU8xJvhb2HOvfPZN7yVC+GDdOxdhaIFs3JshclNib4/hz86flU
 FpcFp7l44E1fkj5crrDlQHI2Rr/zki9KYmqORrmiDZ+jJvDtKMJ6V6qXY71i2azTuf1SblCyKb4
 ypEBvwPox3xgRVwLJoj9xiQLtLCV8GaNyLBE6WrpA5BLX31iKNbPHTq+UJrf0CHC0ntMP3jQxT1
 2BqH8dmvQLxxAZm6o+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-15 15:25:22, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.

Can you elaborate a bit on how the two phrases above are related?
