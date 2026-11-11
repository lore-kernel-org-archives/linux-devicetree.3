Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392027;
	b=biwKr5CFXTljN89AoMFWPeUfgxYeGNJIq3R1bxP3C8TC+5M/htRC42fuZBx3FPxBQeJi
	 YVpFJHIByZPci/81gMF5V+8Au+vgPBI2dqnBBfZFXn1Ilf1jnouRdopQsRc6+03EYIu+/
	 oaKoaoDkROifFLHIf03EaZ0yagpVuZEDtx00YPWJobyR5v9t4FkhccTK2imN36oGrWOmq
	 sZM4IOi5zpIEkv9n8HeY2gr4qmwG0LJlP2IR4DZCYk6W/fn975orBGYvNLFtptlBpvYfZ
	 R2ridlEVesr14qr+hAQSwEgaTM2mS/YucM5Cs+CtG5vMF8/Uqdqm5eUOhg1b9ypIoKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
	b=PZgQqSrFm9VS3fKBfedOv4kPs3ug62oJuQB5T062/E2bpe6njwA/Gamqf/2aIhU+WqGs
	 YGnEwvaSZAyfo9rLMFUakdO8O4O5stOiL21dfPoKvT5Tp8G3IqXCQpOb9GMfwDRaV/Zdz
	 kEAo7Edy/+oUwTNEhipDf1/Lr3UwA6l0P7Abzl7bpsSohKuvIkrCgdcCtCcMhuJI1EToX
	 BfxyzFkRhh1w+Ymi2SFeR+931OGvvuYjBGjWIjWEHXicr2jnOv3lqTMb3Z4Pkc8Dza8ZE
	 RfKi/GUqH9Hp7a/vxzL2TpbfJ/5Pz/Arrm6olxt1nx4Mz2HE4gS7SDSO8SVZy+0qdYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx7qaaDr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOpiTRlG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7AD606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7AD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx7qaaDr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOpiTRlG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KcwC2017788
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5McJnxb83WQY6Kyk4BRcLwQ/
	t8a2Otwl41DlY+4EO5Q=; b=Hx7qaaDrgNyaX1pYAxVX9pZF39S6QKy9m7Q6v7yt
	24I+xxtIM5XoHs0dBHptK1Ir+wxRh3oYHIggv9PTq/A9/odrPASt58sspaYYd8RQ
	tlqxxE6rx/EPDv/meyxv5bqJou2dAN3R62caSMqA3Xp48qRWYdko0vd7/LhGqUeq
	9skyEkcpkzHdKMJ9zNuXortCeomCpHxj+e/9bbI7PxTUY8V2yGLS20iOh4cgCHmx
	Q4LOKAS4es4o90jpYemRpDA4rrFFvaMclm3swKwUhJ/0ufbSShXuLxh5KlgkNJRc
	hvtZ5Hi3UR/OJYIvaE3UCnzIzlczMLST59CgeloZYQml2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cb7qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:13:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so542768785a.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794392024; x=1794996824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
        b=UOpiTRlGeZym+Yl/c1KdTpZpSLEXAyKj/EVyc36g13N9he8c7CltOzE+QlGG8+O3ps
         gDmUWOI4h6D1RSJ4oHC0MdSs2Y4tF7w9f+ZzDc3tYFCHlWYy6L0QD7400ohEOVyUQjbu
         x9ZXbtnfc7Y/KfixdVXUl275vn1ac/qO7ulD8HvawppDw8ff/VbazlzaNwquiZQhBsZP
         NRBloS/CBZbLy2wCch4ZTj8uVcSg3Ez/G+872Eaftj4+ui/x3DEUHIwIAi0SzSHi06zu
         Bn8+oOQBm/GXHrKAJTrWhQaxxAs6Gr2eZwJI66Yx0v+ldKb6XHMZHjiHGcdrAlTs0tPD
         s+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392024; x=1794996824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
        b=IWOknHSYAazemodQfF47VUn8DOllvVahQAh+isb5kiImSgJq+pqPHrgZK3E6+ZQ3xD
         xGkYeeENk0jE+jSMNr/8vEAIGDe7VfDfhy9UxhgQKYhDFnbjxLemoHrG36HhDQOqSjKV
         THyII2tKT0cJDn/ypQL9YgIx/CeEFQDrd+pqfe87jaC6H+W8FyDwBI2hdsrpK7FRILNO
         csIkUEIKC+yhvCExs1F170qi+wWey2FPKTPz1QIbhvhENUyaxJ2mCKoXBiv4LTzhajpg
         hvZzvDMOwkBD3JPyNJ0vmSmQeYvz9fZRxsfDn3k/kDcnBvxgKBUxaGhh92aUkKZMGnzC
         kv+g==
X-Forwarded-Encrypted: i=1; AL+hErEVx4hWu/iy+HNZwyWTGTlevNA8p7y7JnxX2mjLQLSeso5q8ZoUqDNg2GZXppaMYMIXysb60EZeS489@vger.kernel.org
X-Gm-Message-State: APuU4Z993c1v7B9oWlhJe5bsx5ZTW7bi9zQv+MQxl3/B0Icun3sgtqOw
	oijVWLGjQ0Zm1jieFQcODR/lmeln5EkDfGMR9FkS/qK4ZfSOJdOvABRQqStEupc8qOU1/lovTyp
	lUV/dwGmyWg81s0wiO23W2dZdIf7Vd6D6cv9/w5ZT2JJILxoEqcw9GBdKez+D7eX3
X-Gm-Gg: AYBFou3SYDs0ZNR4k5kR622hudjxah95TX0xKEbUWXd3rEouWKlXUbuO2NsC6o0GxsN
	MjzJM5mGjLVtGKiujOw//Hxy+PXRFGgG+nrD0pxeyKkEGRG+K6TBq8K5DhPwPvkd18ARnLNK+IM
	SchLr6K3U8rgLf2Nz/Y8k8F0I91U9VCW+f+zwms78zYapkkNkekkkOGOidCGlWbOosgf+w1k5Xr
	pyTQayczAOdnLrp2AmDHawM9UUGvOxM0OF2uGVlJSDpnACm7I5qAML9CewxX69948PJLeF0zefr
	cVe/XoclrRxSnIYayYe7TMIyB0K5d8QHchaEwgTbn55LdNP3Xo1L41MreBT6vgNmv6/y1OaVV/Q
	ZiALe/bWUbsSHJHN+gJNAhs5FBfJPhNjCcLUNkbkmAuq/MnAfxzQDYm7/o2x9Vd1A
X-Received: by 2002:a05:620a:6c11:b0:93f:19fe:e6ca with SMTP id af79cd13be357-947aff8efecmr302492785a.43.1794392024356;
        Wed, 11 Nov 2026 02:13:44 -0800 (PST)
X-Received: by 2002:a05:620a:6c11:b0:93f:19fe:e6ca with SMTP id af79cd13be357-947aff8efecmr302489085a.43.1794392023805;
        Wed, 11 Nov 2026 02:13:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm10339577f8f.28.2026.11.11.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:13:43 -0800 (PST)
Date: Wed, 11 Nov 2026 12:13:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Demeter Barna <me@fromdisposition.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add the inline crypto
 engine
Message-ID: <m54copzsq6jovs7miluvkwwczxiquq67n5vgddy34vd4otycxw@ezowb2pkeesp>
References: <20261109-b4-sm8350-ice-v2-0-fd5e84985e90@fromdisposition.org>
 <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
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
In-Reply-To: <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX1I6BPleBGFFv
 pqLUGAEtjMR+KOZHI8XnwMTzSr4PpwICq1gUgtAXpgd7ZOrDibF0YVWLUXyfbH4mQuiDmjxav8m
 GceeEHue1BAq4YjnAuTi7C7kL0X0Aq0URNyKlBkiiH8J/OMxsohJuOiyX9yp+xJJUNlnM6VJwFK
 ULXS2e6NM+yBrAbBZ4Kq6Eg4LR51c3chjmS+wpVCbzTgK5iVYHjecwxGyXwvUgtVRi0IrX3zfVX
 W7lgVNiTGUdJ5rbbHC9oUxYlrgEhbQQ4/JnVMl6XHFfKFVqrmBSnGJ/5V08ghIP30WiDh5A15q5
 lnOUF+dzeVebBo7yU4XJlnR4/ociUMFxaS9JP1oJPUyypX8JOZjg6RJMaPBhC+SN6Eax+iP1kkl
 9VmrKwRUe8/mJPprFD304U8V16lt2f98EusYeHcYQ8s2UsP3q7kh4OYcOygGidr9vMj/uphIlZc
 ZdVn/T9nyzParsFZC6A==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af43fd9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=z9-AyCJIoEr-Zpo9GLwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-GUID: J5x4k0DxyZa6a45TscxjiMgmeKc884G6
X-Proofpoint-ORIG-GUID: J5x4k0DxyZa6a45TscxjiMgmeKc884G6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX+z66hT23G6UQ
 QQFeMooRThpatzDU5CFElu054NWA2vPXz9ZABI0gwIt2FJTuzQQd9URfRrELVzV+yvPNLM9wArp
 hlJJoxwX7zL1WVt00nWOZGgLVnlAEfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110040

On 26-11-09 13:55:30, Demeter Barna wrote:
> Describe the UFS inline crypto engine at 0x1d88000 and hand it to the
> UFS host controller with qcom,ice. The region covers the engine and its
> hardware key manager (0x8000 + 0x9000), as in Qualcomm's SM8350 device
> tree; it is clocked by the UFS ICE core and AHB clocks and powered by
> the UFS PHY GDSC, as on SM8450. Without it the UFS driver logs
> "Disabling inline encryption support" and fscrypt has no hardware path.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
