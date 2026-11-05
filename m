Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869012;
	b=kyANwh/X3zrKgG6LXq9otV0Vqii2/YnjlnD6sGAW3RI7kqygU/YSKOn6u63wAE1/blyz
	 ae/VUtX08dw6bCYM+UfpPubpreitAkAcCzxeDdw9taYK9YASTyFQ/Idwwcs0zAPSkCj24
	 Oln0YlWVO0dq3aBqTfMZ8KlCDZErVGIEBouUYQN7cUGKIGQRiVgVanEBwudVqb2nhXO9K
	 0dJPIovzmZtUeaOaMNYfM7kqlrjuDBRseWE5VTRKpgqU30853EAmaWG4JZd/+XnU6v+WT
	 +JJ+rJmxmh0fjDZvcgOfNrWFejN0BkiM1hUujztKKzdBCl+peuYg/x9thzLv9IY3Umw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FB1C5WDv2k0g4VMhoAfgN9Y85xhLplp0at8UMrU44m4=;
	b=fCoCnqUvox+2ov64SzEF0tnDCRiYF5mkFjdy2uI+/lCOUzhsd7fvhRbx13LzfeMpmbWi
	 sSPEasNwaMkBo7xhNjakElvMg6QrS4QFjBwUPDuJUGEGuDg+/vO+rLBT4MH12DIQvjNxo
	 5FZxUZNvpxsV6TJTu0JusnYRF51II/IKHkkp/emfA80RpkBaleCEJR61KL/8MOrvFejg/
	 V855hWORN2Wn3JHQZXdpnhPGyvm3IXgnawCuSdXcQaEILBVRf3YlbpferALanMhPmmU6D
	 bna0CZZg1rK5vsXLqhsufolcTIPEQJFXPBt7FwRZbAjD9GRLXLdjKvTHhaUJo1OD+ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4jpRyU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjIkJ5Ag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF4606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCF4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4jpRyU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjIkJ5Ag
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UAQn3819639
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FB1C5WDv2k0g4VMhoAfgN9Y8
	5xhLplp0at8UMrU44m4=; b=jj4jpRyUuJ2OeSTNxPibUFA/SC0e81ThCh4vngr7
	KVcr0qIwm++o/H86jrwL67Vl/VdAojkju1WbO+ucBsy2uDDMz6tITOZ2Nh+ylE77
	qY/eSZRSv3Rp/gGe5TkAJcfiZmTyINYEYKEHTkNQHQBdIBKj0XfZLbjjp9gJOf6r
	XstmM5Fu10D5b2vKO3wZUcsbwumOdyHlKHjuS/UFe1aHdCfJ8O3swxIqkUIWmzE8
	Bpow4jsCBqMNLIjwQxKK6DGffIe0JF9MMaFzOPMbfAAceQjp+qCyEukvCE9h1KST
	aWILXma1Ln1zMFZtBajr45rH3GE6FelUJnBWVXJK4lhfVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tk2dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:56:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so324875285a.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869010; x=1794473810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FB1C5WDv2k0g4VMhoAfgN9Y85xhLplp0at8UMrU44m4=;
        b=TjIkJ5AgEe3MW3K9GASPJKsvRdkY2SwhOswYkdpAFjgrzxXbRMsmjeiw2zPJvxJWai
         Lr5s9ggZ1USbr918AjaoRSWCTz/FWVjBOXHLwwfaeTyarZdQdt14x3FjcFEvxpYEw1Ea
         +k0HmM4LeeC5AhK2BBc9jM0PWx0vTOSl2KN/Qf0RImJyoggyzp8PvH4+8IvZF/ivOOnj
         cweAv2HMpSgdp6NepmFzXDzwa3UUqz8bkHaDjH2WLCRMtJrBlv5C6wu6+5SrE+IXeHBx
         fEoMP0WS5S5TfgoocXn6egCsc9goUpcI2i2JJRVSaWNN3NFmqP1r1RSAXoMwYUM4H3lk
         QeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869010; x=1794473810;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FB1C5WDv2k0g4VMhoAfgN9Y85xhLplp0at8UMrU44m4=;
        b=lekfcqvFYHtpIHLJvtx+w7x1p6b9MIx60DOPDKpdADihLjg4m2f8Y4NV5xPBAKJUG5
         aIjuqB79fGz/EqbdAP9r5LS7ZZvBv8nv58cHlkLoUUQecOzumNbUpwZbcON6TI5fKLhr
         RyMVViGozI+6wxyWor+Dy/wwsx9DOVt3AA/XREKqgKAANld1soHc4tsZ32Uw5laaL/Mn
         l5eOi5cu49N3oSGtgkGgR1ylqLrcseHggQAbdM19ZFJM6wIJKN/EnO3CdclHcrQfEa3Y
         NmzHtf98cOpND2/FPd9HP77R7710CrFtDJV1yrmQfNic/jteSeAs38g6av4zxGN92Wlj
         rVrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxK4lV2Ho+MQ2pkcaqE2mWRvf+mMSUIi3e13yTUA96ihm238aGBpYFBO0J0pdfcZxjDbT18tPxNh3l@vger.kernel.org
X-Gm-Message-State: APuU4Z8z0cnSlKxzHIBc9oZE60PkVnaJ0DN8os91bdjdoDIR8daP776H
	W/j0eR25tI+amOtNAmaR31eTSHFHLHM1pt0faSrSghPnMZ5IL0drZDq/ueytqvrHWLbjBSpKv6d
	xdUnQD6vHk5Lrz7zP+6rNKdA/9IVVfxc3rLOWuTiCBKtR+cpx9Y2QQP94r4Cy3FFw
X-Gm-Gg: AYBFou24ihv5DB2qaFC5EkQIt3GtGZ9zRWVUYXTKgbC8PuUJ4BDNNekXdIn6TtA/iHf
	rXZIS9WmPHbTp0u5LYxn09yV6K0kJI9UFaLEoexGTryW8FR5uABTKujIejzHWdVx83XEi0UAzbY
	kZeSDzoQAf7Esj1eYlfQcIAFczu9V/pgeCYPEzS+R5zcgQ5Uj1Xonx/aH/bU8JXiAeWS1yV/iqZ
	w0z5/Zw3gIncZ+xs+Prc8xlxWlNODx0hKs3tpORLAJZSXQ8C6LyY0bPI7lqIuo6H+/4o6gjzoES
	HwZ5DCpeoi0ZxSs/2DX7yn8o/aLrf81BP1YOQIM44de2wDsD8FYXL2LokjbNa7h+e0CydBh/eQG
	qCNVBkvnZyTzan2g8ZOdXKKHo62gDHpQgmUc730HdpXopVVyRcoP4P/YoYyZiLWo=
X-Received: by 2002:a05:620a:6483:b0:93e:c12c:4408 with SMTP id af79cd13be357-944217cd92fmr2720753285a.68.1793869009918;
        Thu, 05 Nov 2026 00:56:49 -0800 (PST)
X-Received: by 2002:a05:620a:6483:b0:93e:c12c:4408 with SMTP id af79cd13be357-944217cd92fmr2720751385a.68.1793869009420;
        Thu, 05 Nov 2026 00:56:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm58629445e9.8.2026.11.05.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:56:48 -0800 (PST)
Date: Thu, 5 Nov 2026 10:56:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
Message-ID: <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev>
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
In-Reply-To: <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX9X1czBd76cDS
 HO26HWC0cAO/xi8VuJSWnwMK0X1Sm0hTfTmr0/W7rfhP3p51buxx6Sm/lTMyZnkRI2afpBusA5t
 Q2QQvb5ZzFKRBg1anv5zAmT8aXwCSzE=
X-Proofpoint-ORIG-GUID: Rz8kzedZ7zcs314rhk_ED49SS8TqFgkX
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec44d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Bg7KoihMCtH8JNtkfXEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Rz8kzedZ7zcs314rhk_ED49SS8TqFgkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX9MtnkmuBgDEf
 8Zt317qBRrvP35hAeVzmhOj1Egwwdav1mvvlaXMSshnvqND46AiR/FCFtTYssrunwwk7motZs4u
 Qp6UznRdEhaP3c9RdeRSdsnvXdUDU8/27KjE9lgSSfuSmuu99TbttGz3Dvfv2vlQCloxNbcIeZk
 /JUEsjFMGeHgIUV1oHLS2P03Ti/ACYsm7V1JbAQS4wbF0uiGaDr6WPNpRTb49nRJgT0YkFoDxHY
 1d6Vypci0SD+wvNDyGbjuzVUyWwUjLQB33cXlFVaq43WBd+jjJlVk+VuiAabNQZx74Kb4wFr7GB
 MTGdy0kwv+af6X5enkH7uCWAix8rxKv3Gw1lsLPRUYLJMG9z5nwLSAMeHkcxkDzt/G//KZweJyh
 WUdDdMBrBUCKxKILEfeOcGRFNnImTDiAmHBo30460uxsiFg/i79cqE+DtAcEsEyFVhfXTQq14N2
 tzCqRR3eNnOZeOQAXPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 26-11-04 18:38:13, Andrew Gigena wrote:
> Convert SM8150 UFS to use a standalone ICE node.
> 
> Move the ICE register region and clock from the UFS controller node
> into a dedicated ICE node. Reference the new node from the UFS
> controller using the qcom,ice property.
> 
> This brings the SM8150 device tree in line with the standalone ICE
> representation used on newer Qualcomm platforms.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> Tested-by: Andrew Gigena <mail@andrewgigena.dev>

Tested-by tag should come from someone else, other than the author.

Authors are expected to test their patches by default.
