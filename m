Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473736;
	b=ua7thnAN1n7+0RYlgd1jbWxM9mGOy6D0C3eyhc6Evw95VJe+Ro9wGcnoLMnehecTVTY3
	 aspSinp/JYdbbui/2rEUd3pzpja+GrNDBjNtdyfTtAmN3WhW25krkkcZkAGfIjSKM2Bqd
	 8K9WomuZQDOE0jNFjPwFTd/0gaPxgpjuWnwKLSgyssgw7OcIGWgS/qbGXhBHmd/btmvuN
	 CKpGx4RCeo9Qq0JOd/At8P9lW8p51rVdBp2FXyoFbxx2wZx3zU8/1CCmpORHlKKeUR3uR
	 pW8iwIIGphWHaNe8z3RkX8dRlBLAjuS8mBpy1jO0mhMzbH4OUMOQDWHc5rdSCkNl2oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
	b=HeNWnMi/+nqy4COiQaopn+GscUSnMNaIuRHnfiw9zuAlgDGxlsDdUlBskwwsQ5aI0hgE
	 AsNa6BD0gtwTjOVLwrHQheDvcX+k9pSnKhRQ7BY371r4TZn/wNr2jJluBUokmVkizFqPH
	 lW+O4bEUE84dxvPMiFYquSm4uKzuCN9CqO7N7tn1+tvJEZAt2SmYxsMmEVk8thDXK9qSa
	 aonuY9ktN0vq4acaGbcYc+2RBuRep4WkegxzyppobiKBgVyyiqtebnjHk/GhxwoAW04mq
	 4SLQhYrsHRQmglNkI2Ov3Wg5i0puXUAamRXuMZwDJaTtEWRsv0QX7QeViTuPngSMVcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nD/N2SXN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TenkQfs/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E0606A334
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7E0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nD/N2SXN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TenkQfs/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zgul2514376
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=; b=nD/N2SXN55lL3V5r
	D6GYiRrgBHy9LM8zBSmq3npe50GHV5M9UxSONFkfCmuBWtpnR0yQ87kAtOd09uBn
	ux+FxY3b4uISVao0kT75UqDC2pDCBMy+gGcir2FREBuDSfOc6IAQr79IsEcbdWMh
	rbyQbCmm/lSnS3Vg6IhCWft5ynEciNr3iASUs3dYSbM1xlV4NNC5Sf0WCWbhC9GS
	90U6EDf+4ngzyOyCYx7CzYgQKK3sf1c1Qkq0aN1Epqd9G14D+ntq1dyFPgUkDLI/
	vAeDI1DMg2Rd4/DPRDwhnZJV89UZSocOlkwcQiJ2MJE6OkqjwmxJ5XcEZNH9FjQv
	R3aNww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tsuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:55:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94933639929so20820485a.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794473734; x=1795078534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
        b=TenkQfs/FnyeTgfnvl0EA8o40J/pZIM1q1GLPZm3k0TZGqkUh0pHi3NAE5ObP/Ab3y
         Im6bMqK1NNyyI5+9SeCjp5hqN3Fd5Nn/x3n8XB+438dlMPbAcTMD8gceQtZaV4phD9bI
         C+LS4nZFj1dI9U54mAxBYxC3E/nFnJmaW0Ss9ewsZMF5yPOVHlvARWmbOwwLWZlpVvS3
         CuYj4baBG/opjmIHuw27MGK3DNMpdXECNXR1wevK2vBcltp38qBc46eBgtV48fgMNfWr
         H7lLb2eTLUiyrfJdUJB0T8S71hR1ZHw6R/qCaoT0OtVvYI/dc5DPQ26+FQhtqsfUVtHL
         OQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473734; x=1795078534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
        b=Spgzf3UCfMZO9kTJfPW9f6Mr5ulgVqRewM7ca3k66t7u1ejzoSCXgEA8kCoTzeEfwv
         G+qqaLeXOx23XBeTwVHhEZ0RrfyvBIm5PbcNLDnx7sDspXAo8Dn8+SJf9A1ryDtuzvOE
         vC1FORpC1ZkgrMtpADIec1mIf40GEdh8UncpxIA8EpF1tJldimWC902XmHawqF6PKeqM
         ihzRUK0hj+ZuocWGzDzNGR/MwOkvaxAak14B8hFthHyYoEBny0IIGB2oKHmIVJ/dGOpy
         r+55gCtT5K2Qes9udh+YYhCxdp5opXdClAcjfGZ42emFph2fMS5VLEEgRCCGNk0iSBxm
         LrdA==
X-Forwarded-Encrypted: i=1; AL+hErGDHA9zuZM7QVnGD3MjNF4wGZ+rBCefkFhEzPfifPxO4LWJIpT1Yndk61PERlEgeQfnADTSLXNiYHwx@vger.kernel.org
X-Gm-Message-State: APuU4Z/H+o0seW48eP/CkQuLNGbsZL7gaasJneo2n1TQtZXfLwZKhNA/
	vDXfx637AkqA+Ihy+U7k2tlgKVAqsDj98ojnPKK6bh5WTJdtPc4QJ/R11GJxHONnokbY5k+ZoM4
	eLHAp5/NHepGgaWagSHcngrSiWdh1MJnKrbW+Ch6sqU/oVSEuIn7XELXTk3D2xJ2i
X-Gm-Gg: AYBFou2lEIYR40mfg7oAq1Aq+GfFJKdoyxKKdN1G5dYwYsecHaN/shL6/vebXdVM5Jv
	XGXLabYqHqfO3LEKdj/MTYkxMf6f0OizaxYx9QdmxqhPwLPo0wMQSrBwRur190DB+w38AoKPtHb
	3hehhUDlwl+hunMMiq4qU32gNWxl1kBVPQY+UNlDoBXrnXwvEAO7JtPo3sP8XXFSjOx2BiJ1RZE
	mWNzYh8vq7D+6n0TDkLJhMPwTT1kMhhPs0w5VwPGvgVpb2urKQFdH6YjuQyKYOBIv/qF1axLJc8
	gJheKk+vzvYwHupRgJR/emBHiWmaTtdPuwkju0C5D3dHb1rLgiNpT5cndB317LhDvIuh6UJMPNz
	YHdEgv37zwNT9e8qqzxYScI/pSpiPUsEDNSi7oJTaDuWDNNJquUmT+L4UG4oT34HvQBPIqes=
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr842045885a.6.1794473733672;
        Thu, 12 Nov 2026 00:55:33 -0800 (PST)
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr842042385a.6.1794473733043;
        Thu, 12 Nov 2026 00:55:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a63f8bbsm317160966b.60.2026.11.12.00.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:55:32 -0800 (PST)
Message-ID: <6a1f3aee-6e5a-40c4-94a6-5c523116bba6@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:55:29 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit
 address
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af57f06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=V6h-8VdV8C8-G1v_c3gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QqMaJrnGetm3Oe042TlhizaJB4SXw25J
X-Proofpoint-ORIG-GUID: QqMaJrnGetm3Oe042TlhizaJB4SXw25J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX+uoo4HM2QgFw
 1rPo3IWHPmxV/A4LsqD0r7nSalRJkKqeIwlGhrH0KUOuIfLvvK6GpDABvnz4gSQ2h99Zse8YaRM
 5RXWfWH+aHChQnOAt3pPhq+OzZPa4TmzsDdAWJwBV5LWpJ5AdYjvPOsjIDLtz3yAQRoiRQq8y7q
 JjdoLqV0VH0LtIdOa0f9P7eIjqjkOMwjzPjDOfECELwcrRiDcctFNDIhnmQjusv1xsN4dFD7gqI
 0BSmoxaw3jjLC5pHhUExbYOjwCsVwJElaHs2CXOgaVDgkPOtN9T42NZhPls9V8BAkXOvytnwhCx
 jefYNNRNiEBsOoU4WBmG1hDJdbmR1wwono/0phoc4EuP7fUe6dcQWWE7JxBAHwuIhP69gGplpJT
 P9jEyN8GtodbwIzNxRDu2Cp6vK8OvZQ/4rHUJgiFzIfB6wMpaiftyA5Iooa4i301z6c4xjqmb0R
 Ns/SsTNlP+S9Hr6Lr+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX69OOQPP00Ftd
 oN3Wma9xeuSzRcNyoNviywMruV+tcXcS278Wk02LJzToE3h2+gGqiS+PwgHiHnf7ZWAsmutsGAc
 v0B7RfJPMNcGRues0NPtWwXM0MMZB+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120035

On 11/11/26 4:47 AM, Shawn Guo wrote:
> The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
> breaking the unit address ordering of nodes under /soc.
> 
> Move it between syscon@1f60000 and remoteproc@4c00000.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
