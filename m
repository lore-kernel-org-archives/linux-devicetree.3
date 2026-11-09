Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213794;
	b=yaXmoN9Il7p3ktPD0G87DIDGEFOzy5LnFzcZiP/ybIW1TfYhvQhFpz35AzAC68AVjhWd
	 QRnK5pR1uOJoabH3mrYRoFfOp4gCuDSyuQDz93v3HTvRf1LyT5fqexkvI6l83xVPFhtzy
	 qUTE4nhgOIWmIstyqvwDwKsBTC0Hy4khSKkpwyEXVEsrKnMjXM2jhp8vhh2uhkTZ4XerE
	 Ru3AJ9ZV3Y605qr7z3Wocjqcc8o54Q2rV5zUiSCWecYeV/hElN277DqyxTYCDUCUorWoX
	 ezl/OvrLO5y8lpQowqyF3qMmQTBSztq6QkVdVTsUhHTSdhsVHidJlKA3iVmWHt3wC9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p/ZKyylN0Urkjhx/26exU8C/4qhR2hsoHR+1hsywbWY=;
	b=0tH8ruTqZHE8s/H+m5r4K50X6r2n0B7vlc5cEWvd0Kg1YMhw7eMbzxvjvZXaXh8QgwQ8
	 Vr0OQvCpUQMc0yWXONcGEdINfxkulHx7qeXLSdOEoC8/u/vVwjv8Ln/aaZcVEFz8Xb7th
	 Pw+g5VEfV77HKrnefkgf4qj5+eqh6VT9elRrPjp2K9YkDBWRJn/0tscm0IemHBTUC7o14
	 cyem8Ef79qFstCVZyOo4GvpYsO0yUKHz3tvvZ/Hwd5xS2di8Om9mTdF9oD8AQ0GFpnt3/
	 gbD3tPjcSqlK0e0BFnst6O+LKovv//fwPu4iHrmfKE28SpPM81tOpTjP9/QXOZ/Galg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gdx/3HWj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZN6kJWHk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE57606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE57606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gdx/3HWj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZN6kJWHk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969v69055767
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p/ZKyylN0Urkjhx/26exU8C/
	4qhR2hsoHR+1hsywbWY=; b=gdx/3HWjx7bdRK5oIOacDwJIX7V6Qb46z7HwDf9q
	77L/LTC5KNg0qDA9Y+M54cY15sj8Y86bPonjqpIPnz6PDqJ8aFEr097TGY7lKEJM
	GlxCgqZH7IOAz5xppM4IayJRucTK1sZRraCot8+mppUcovVq5nwjkgmP5MlfcjFa
	eQzzejKYfN4/exBqwNXfSvm4SpD9VmrHLu6NOP1AGF/qsXs8Ff4F27e9EQQvSTL9
	zDhlCR8JCFpqyDtsTXaZfu1AqVOi4jzsvfgH6ug2LtVYVKOq4LKIMu6/ER6dcAGA
	cBj1nBxcBJC20vM2c0/JJrKE2wRtMplV8I3AeKwNVnsw/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2avp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:43:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so117214985a.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213792; x=1794818592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/ZKyylN0Urkjhx/26exU8C/4qhR2hsoHR+1hsywbWY=;
        b=ZN6kJWHk6haOMJX6Wt2zh6y+0vNvTzBJFenQ9fDGNuY0NaAb4SdaA5T1WCwiHuP4Iq
         RS7apD9brmCbVS24X8L/HzGoNIkzB521oiiF2/vdg3YcmE5K0GZIhO6ni2oc4Sw1phOh
         fScFkuYEffDstSUW/UZ0ihh8XK89Lzb6fFqoGKFQGUW9x4zx9qZv91FsqaXHkA5aQ5sj
         zdgCsXNQ5HttykkpD0pTDmywtmZq2ClE1EdhhouyDtNPH4foZSerx7zRUO1maJtGmyO9
         4C/E6vAsJB2ATOWkrCXvG/lIdLbBdBQrFKxhMvgeZyzN2HhlhRs6x/MjhFSchmDcgdDJ
         H2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213792; x=1794818592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/ZKyylN0Urkjhx/26exU8C/4qhR2hsoHR+1hsywbWY=;
        b=SQXyebBjIxrf++I6GFQa7v1i23YX6sDEO58qodP39yYX33c1FOmnHVJhA9Y3Vo8pps
         aVogFL+GN3RsTUF9S6/+c84+LRkNfGnYjSbcN/uFrXYBDEAojSKfcJBtnytVB1sjn7O5
         fSxwXVISlO03M+YMhtor1BxBXB4yNNrzwehr163noioSZNA+Dzi35oLlUPpkdXUB3+rh
         SV3YMQHh9CGy/N4tHrxidHHND9O95MMUW+vAvIqPBDkG5pzfb6MYNMGlB3QRmegVt+94
         RhS0U01GV4yFih7Dlh0rYkStRH6WGJqfCw8azPr8M6AzP3GLi4ZBQovVwrFjRYpnlGf/
         L5RQ==
X-Forwarded-Encrypted: i=1; AL+hErHiKMvL++t05kySAfQOF/FPFX1PPdvMH5cPf0grifj/cKBads9Qq2Xwca+OTV0sugL/mfqr+7p6rRpR@vger.kernel.org
X-Gm-Message-State: APuU4Z+geUxQ3t8SdfQZsEStPKpilvYNgELsDJpznIFE/WygvuX4Wn0A
	R80INzK+qa4ZF+l2mrCJRKSfzAIPnFON0IFSGznQEe74hMYqi9qS9TZjAwcJ9LjRDaRaS7gKOv3
	w/ssBpp/m3LoyV+5JWLSb+Ox/vF70b5KqnRU+s+jl6g+kE0YiiExEHoNQR1Q4dzKI
X-Gm-Gg: AYBFou2AWovl2JPzvoYNYRz/0+ON9O8GcsxIogq7tmZUGkggBjj9loelijVCv79kOQs
	N02yemHb53PXNPHPL/RUB9dCZYrEN0P5vzGqdm/5ssTQgJ4pmB+o410kuIsbI0ebWunztA5phby
	nRWhSVIJNAEEZZF/Q1L0mM0vDQnVSKmaiOpQDfGyPwp5KgSMeJZ+bxUM5PEEcF1lr7OrgPg3lpi
	Avw8wdotsxB0aPJboftIAPC3z0uAHeYslo1nrSZMipBFc4k5YOhiGNmjfXG26xNQ99w0FltvWlY
	b1CUCzjjh2vSbKkKR9cM5m34XiANp/SkgsHHRW30WW+E3TmXa+InlcUZ6hzgjmvt9xt5iJfz2r3
	E3teJPixyrlDBL/co7TNfDNTibcOtiH8WW7c8rz5CVBoXzmxdd6HrQCx8B7F4KPE=
X-Received: by 2002:a05:620a:7014:b0:93c:d209:4ea1 with SMTP id af79cd13be357-94604d64e78mr903641985a.24.1794213791703;
        Mon, 09 Nov 2026 00:43:11 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:93c:d209:4ea1 with SMTP id af79cd13be357-94604d64e78mr903638285a.24.1794213791066;
        Mon, 09 Nov 2026 00:43:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm221574505e9.7.2026.11.09.00.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:10 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/8] arm64: dts: qcom: Unify Glymur/Mahua regulator
 handles
Message-ID: <rda5jcdbwc5xuimxvpz26j6thd5ktgw3myg5yvsfv4jkvvqrk6@vmzjdppfcfqo>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-1-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-1-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX7NyIHRtianO4
 aQLjvHt1DmfE9xWuIyX+TYfVQ8PoWVVwIKnqz6nGxA88ASJrDrxMFpQdAsBKha2IKdsz3zlsUJr
 3J7uTvzDgcSSE7aUxFMTcybkeYW7tAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXwuY70Yk01VXr
 +Mk7Xfz6h8dcCDUQpZqLFUy6UysayTZA1h/wGstdA6bDqn3jHifYSwWo6dWDfqkLwyZWb3lFw/c
 vxLcXPuMRkgwvRyQ6XhI5sfwUN9VxzdS3ANzKzD6ehWFIu1KNuBTAyNyzFfz03Jsg025nPfHd1j
 5Co+TEh65EElgMMXZcHrQjv/oYiVm0A0RskbCiwzAaFKzgihMtCAvWOuAZL5mvfEjM6CKWKav4J
 dQgW+zayFGFqpgsp8Yyn3j34vPCFqOb6G4sYgdU9W8ohVMsUVEbWRCEBvBf0JzzlsCXSo/bkS3Q
 5HZn2big3Pnpv1h1sibCKAYC6leAEUVplGkl4d0gEag1Z9DL8zGKtAHhSsYoYwptRAONAIXAi8i
 OzPs0xaO8e8QYVv91FNn/H5DGYUxOITmIFYt+xuyJSPwzPbu6kg6ahczD8zRW3SOkpwGHcGyb3w
 cx0Pp7UKbzh3WqPah8A==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af187a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fi2DgTRXG2WKjx0KyZkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1bqjDC68oK7F5U0DsFmOF2alMpwfftSc
X-Proofpoint-ORIG-GUID: 1bqjDC68oK7F5U0DsFmOF2alMpwfftSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:02, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation for removing on-SoC invariants from each device's DT,
> start with aligning the regulator names and phandles to the format that
> appears on schematics.
> 
> Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
