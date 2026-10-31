Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793459674;
	b=PL+5rQmqTHv/BX0pHyA7+eWz3RGoj+48ug8U1Mqmqkev0j7yTpTMwNii0X/XMnNZMh67
	 yw6k4lf13jJFsnKLsBOr5Dx6+l4edfB9bPHaOxR3dGaUJ0EixSCFWtZDVmVwD0xs7jfhm
	 tuoaAg1VhN8zvOETPvj6sTF2CW6W8r0CDlqqFH2a1O7a8JkhZlxMB8CqyUzw3e+wXymje
	 vZOz7UHMbAMidLmJQYRQ4oMeayZ0C4q6I+F9wIzrKB9MTwAweFYF5tKosCPPuhwjHBeiE
	 pfKzd7cBjlFX01h2X5I0EcRroyv3Cv5boM8JFvCP6eF52Zp4Xsz2voGxmyaop9UnpLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
	b=HUJfrUPOoUa9ilFiYWjW48D+h09c7bNUPieFcUVQhAAj1zbCvoEX1DKsa7jp3ahIFPUz
	 /TcoKKU0NGZx/TzaFEK4YWlDkNyV4oWGfKJk85koOPntKLcy9l1T9ka/8vBgDa7ToR6yU
	 SjqSzXimYSrkRfgHinS2TnbZjDGuf1yXe6TUFv+wc1B37xC+T8rmxF8XorvAh24YoHHcI
	 hMjTN5l310lx2qTuuZ9vyH6/q1/k1vYnXk/TcddlMjS/KrMq/9ai03l6ftFT1kEESBsAe
	 BxyPp7B+SNMqjNcEAEMBUQNSk3A9rOGFIJrQK3d7bI5+iOOJo22SmvjkcELrq6IhcWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmRcFMjy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icrygu4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8B5606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 15:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8B5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmRcFMjy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icrygu4b
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0Dio2196528
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 15:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=; b=KmRcFMjyc09Fr1mV
	R2JSZmSE1JACLEUT0r5i6anZ39bgy4cdQ19Gny8Kk1gs4ICBLnRy8Pe+NJ3rNJ1K
	SKV8/JWZGw8iz4L4muMlk9EXC6zlNq5CkkkPTPMyBvjXU5ULFXfY+Y/3AjnM6eZn
	gjFFze8o2IpVs7BVUaT8eTDZvP2+apCBt4rlHypzXGL+2J6mdE323xL+UgNHAo1F
	XBBa/+olVNQZMwh6Jf8b/8BS+0qlYdJ7X1poxUsTwBxMj2r30qe5pTBCTmv8/SIJ
	V+Sm473iQEgzh++hD4cUyt9SDQhwcrY5dA1VQT7dFoK++NJPdHx4zkH2QX41p8yB
	/s0wAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du9bkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 15:14:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7c7e8becso49030756d6.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 08:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793459672; cv=none;
        d=google.com; s=arc-20260327;
        b=dZ1vGjp16OAFCz0eFqd6MmUZZdzz2LURYIk9FYG3zCIKlwFYHL8fLukZQArqpgSNd3
         5LHTSxTrIAlekmKJ9g/Qyt4rZdWCsq2mBYnlVrebeCHvuB7cK2h836EXyjMSm3utbjqT
         iC6XLTLZ9B90g7bgnwm7nO+irM9zujg/JOVumfAhT8cPUjrDjQrCa5bsQFfy4QrfkF1R
         pxNKAhHOsCLWpDhSLkH+dXditx8w9YB7B64oIJsmYAN3JiReV4DQst1zxPPp4wShPbYy
         Ew1UvxE72lph9AZVHWD6vK3WUJAd2+YJRyXRj30Q1B1PKPiDONq3ILTn5ql4J4dcnfDD
         MMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        fh=lkRYAF52QeO02XeXqCCl4oVczmbcC2bSd9hIhioKtAA=;
        b=TSibMXe7g2ePO6sZc5aGuGG9MfqS61igSgUqTeTVYsEpizccRsDwt0u2qb5y6ug3S9
         bKTvu0A16u/PYuEkROo3V5Jz5KGYKC9fHV0kuRYsAtXk0nGx4PaYjXOblb6erTxsQSML
         JZoRvokXAIaryafQTyuBWs7x39eC55JHB8S8AA2t1ZPMEXEuXGjvnpRohe6pGHM9jDoq
         GqcCyymZbnYkgfCdyRBFnZpM8ViBUoOuj43CIuEyoou7y5woTEsgX7Pte2zE2gckIlYr
         CB0+uflylyoayvEsbNk7lZCiCGmTa4UCfddW4CLVOhMdMEf3Bd7OPyQ92IAStcbgnozD
         vP9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793459672; x=1794064472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        b=Icrygu4bBIsC743hEnKOye9lPLOFl8OG1nYpZlSUtnfYzxnGdMKvlJOxwR2UBb2DwS
         NdcCW93Q/MTOYxqDR4WFGBvP96+VSErHppCA5LMHOMBlY/2n8VzbBn5QxmVzf5GxY9lp
         3XvCSRbHAPsynBgxaq1blrmV8XJGao+mw/cUNInqgtQ/SFNyDhDlM/4A7pvGVG9j91uD
         3owvMMN2Ii1a0VF0V6BiK2lQZyGoY8w2rmtyHVnn3qasKCUr56wMv8n6yfoPYUOSuJfM
         JB60zjM05at/Qg2WfCuyDV/F+qi1ebImVPD5ALTC+tqMXQcy+6jB2TqkRQzg1IKXMWrh
         rqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459672; x=1794064472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        b=SbvbG+d4a1oV/zGoOelJ+Zk3rsaUkcfSwFnF76c3JQzMeD6E1hkeIS0vp8TN0PTA37
         vnxV87BSioHRR+BE+Q4L/XrDEPtecxpZyUm2ivANpQYqD4L7548kK5zwJsMNwjaQVEqn
         8IbBxGC0w4CRJExAC6GvcmOtjrJjVL4cl4RnNkskIcc/i5zYSYGJqesw+qHvAPWYrIqN
         yZUGhMRfwGtnv5zC6Wn/KvHZAeLNaPcLB+9mA7NdXXXS27x/idVpF7xHufGuSUFnhTs/
         NR3OxMMUhvIgdfE+T8MQoCNsmCc3Zd5VqwgEfcGslFkPHJ9IjWTuY6i5A0e9eySe4Xxm
         /lNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp7bPyD0q4imzPy4MmfaF/+//CjuT88i00IG5S3KPVSKamC3E1q0G5/b/TRIsNqfltOrBnPFx7Awki@vger.kernel.org
X-Gm-Message-State: AFq9FYK0oUW+y+NUvT6d1kX4aC49s1boQlwrw9KhoZ2Jf0dAliZSUDFx
	VYc6Yy44RF9wrMuZwSXlezAEEqVb/BHTVQ8l8SjAsuAbr4c/pIkGwhCnqk02uKwqOVT9ZVQaToJ
	OHavBFGHRL5knCTNOMt70WDiOEvZJAjZ11mDzlc9z6y4IYpxiXlI4BraHQqCO9kGRHsWqUuNtHD
	LAyQFmtzf4vj/Z6Pm6oW7+SVrzXlm0qCH+mBQz3zk=
X-Gm-Gg: AYBFou0SpHFHIQME7Z6gzcxknOEUmHD+IdZRrnBWRcYguhwIIRHK1lQCOFxFYNmxeHg
	Bo+kwFR8Fr5/2vKukZDA5+dEOWcaNS4b7i1ZpuIrMNHi4sWULUmQcTtZ8ACl9oKKcnxlChQlONU
	hH2eRMZkZOBWas6U0w87fafXVTwEP3fSTOcz4ecPy+5p6VND9bTv5v9ca+0LTpPDk7moLzmkcel
	eALFwFlb88crCq1vWc1Yrs5e5LQE0sD/VemNpWXJRJO1Z63S3Unh1+sjcI/NoifCKGcnXlI2WmG
	9pP3dotaT+yAf6zUUqKDc+Bmx8z8
X-Received: by 2002:a05:620a:6ccd:b0:93e:9292:1b96 with SMTP id af79cd13be357-94421585b68mr926452385a.3.1793459671801;
        Sat, 31 Oct 2026 08:14:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93e:9292:1b96 with SMTP id
 af79cd13be357-94421585b68mr926448885a.3.1793459671340; Sat, 31 Oct 2026
 08:14:31 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026224957.1115370-1-vz@kernel.org> <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org> <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
In-Reply-To: <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 16:14:19 +0100
X-Gm-Features: AclHuK-O47xt6538FuV-XMWFTsdZCSR3ExRvh49zm5hewMSlbd2irNFZ3_KkfeA
Message-ID: <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae605d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=J-ewYRROhU9zWjNAoAIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: IFTH6VBSfQPPdRI1tsqTOLdErLlZu1_o
X-Proofpoint-GUID: IFTH6VBSfQPPdRI1tsqTOLdErLlZu1_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MCBTYWx0ZWRfX71YvUvhe7imb
 6n7f0QmEe3q062zaMkz1kojZxvHOAeWuG8V+mI/CPUvNRLQ7T6vCvxe6qjiwC5wLZoJshyhW47j
 DxBmTp/EB5nVafX+Dfs2xVGJpPOGN+zHXXn9wLBocs5kFnKAK7p24G7oc+d1R+JOGJFbM49Iq6S
 dOjA+t8PUCpR64AEr7vaFOk9KPT+PLMnh1fusUIZ/ZsiAH6ChIHd/EFxpRkI40cvUd7g4C/Lbqx
 0FBLB62TeZQse/DCbHc5rPJtckNgxiB8090CDWpzJAp/c1Ho+NtUl6fc3ADFAGWw/lfOUYfLjKx
 P7e5vsjzCUPERI9z6ivB7J2Mu9HF2Qkgrl8Wveae0/LFCcyi2Wi/PVIu4uiDOqEGUA8Xw4ssGvO
 KQt8v99BsZgj6csVOZK08Uv94dThOMH1L+uUg7HfVD+VeXTFvwl2hLr13KKdQYTgckfCLERefOB
 9a/X2hwFiJfgcslWdbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MCBTYWx0ZWRfXzZOx8V9ZTIx5
 aQ4hqXUu9D5rpmIc8wEh3bXbFtLnj+m+PME6HHzLsTLuwNC3QqBxvaOFpiqFjvHeccJD5TYK2Lu
 PnFUzKoaw82VHolEKRzD/TY2dVOLxJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310060

On Sat, Oct 31, 2026 at 3:14=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 27-10-2026 22:30, Vladimir Zapolskiy wrote:
> > Please note that 'csiphy_res_phy' was introduced a few lines above
> > by this change, it's only purpose is to provide the needed supported
> > media formats, and this is unavoidable.
> >
>
> Right, agreed. Glymur uses the non-legacy path, but that path still uses
> camss->res->csiphy_res in msm_csiphy_subdev_init(), at least to get the
> CSIPHY id and supported media formats. That is why Glymur currently has
> a non-NULL csiphy_res even though the actual PHY programming is handled
> by the standalone CSI2 PHY driver.
>
> > This change follows the assumption that pixel formats from all
> > non-legacy PHYs are SDM845 compatible, that's true for this platform,
> > it is expected to be true for the most of approaching non-legacy
> > platforms, and on demand it may be changed later on.
> >
> > The current form likely is the most compact and the least invasive
> > change, which gets to the point of supporting CAMSS on platforms
> > with no CSIPHY resources given in the CAMSS driver.
> >
> > For instance, note, the recently proposed Glymur CAMSS [1] references
> > X1E CSIPHY resources, which is actually incorrect, since there is
> > no "csiphyX" I/O resources anymore for Glymur. This change can be
> > reused for Glymur as well, and its reference to X1E CSIPHYs can be
> > dropped, but any better proposal or improvement are welcome.
>
> The intention was not to describe CAMSS-owned CSIPHY I/O resources for
> Glymur. This also follows the earlier suggestion to reuse/fall back
> to the Hamoa/X1E CAMSS description where possible:
>
> https://lore.kernel.org/all/lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s3=
3rogi@ndnf7zrtu5ex/
>
> Moving Glymur to .csiphy_res =3D NULL is possible, but with this fallback
> the CSIPHY id comes from the CAMSS port number. Since Glymur uses
> CSIPHY ids 0, 1 and 4, that would also require Glymur-specific driver
> data and DT/binding updates to describe CSIPHY4 as CAMSS port 4.
>
> Bryan, Loic, do you think we need that change now, or should Glymur keep
> the current approach for this DTS series?

I see in the following in your Glymur series:
port@3 {
   reg =3D <3>;
   camss_csiphy4_inep: endpoint {
   remote-endpoint =3D <&csiphy4_out_ep>;
};

Which CAMSS pipeline interface index/instance is CSIPHY4 connected to?
If it is connected to interface 4 on CAMSS side, then we should use
port@4.

Regards,
Loic
