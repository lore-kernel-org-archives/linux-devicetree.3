Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3E366072
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322045; cv=pass; b=TLjzzQGuGW0G61dQ/QSnljUWUIJDQJsF0zoFyq5sBltnMSekkm6a8hanG6N08yXVDn678WhayqhV7xyMvy0UcwBcSSMYqRQZ8jWwwMFULUKQrbVjYKP6RPQN/YtQ+yFtOkFs+otezO6LDOwDh0ktBDb5mIy7nPM/Guk/i8uJPjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322045; c=relaxed/simple;
	bh=5dFf4SUBMP66al9PPeN37zfbBUVyl6Hn9p/qcpwkv2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlSPKOuBhiQg/HQcKv0E/M4XwM8X5S0JDCZuegp1/BSb3Ivni3Zxpc38aVBznZxsv5rtmNW0loZtH0yZ3EQKjjMTQ5u2qvOhXSPdyqrNkSLOwQ2RY5R4hu8tw37opNrK6T2tL4LR+Iqm/gEOYMJBIarPZxfHC3v1rLw3B/zGzzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flLk6J9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdTOCkXl; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flLk6J9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdTOCkXl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RGH6vC3123751
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=; b=flLk6J9/5KJGIGro
	3UckxDn6KkOsQ5xfqbYUZRKjIlrKEn0WITFWx7wYwnZK9Nue2Qs3umRUEJ8VVa7m
	n2HIVM25BX2K2lcGvFESq7JthJ+8fbE6VBrcBiU+i1NqP9dpZTBmymG/FJ0MD/LV
	bQoYSkqo81Pit0iLqYUCf9DJWStajsGjiN5igoJB0aU8EiouHHLmKKzcc+n9mACT
	qYdsna7negCmXiRdLh/4MrGhM+7DJSEIBC3hlQ5+fEW6ND6mMRzMuDdxvQhmWUhV
	Rc3Fl2+dS7jv/KV2LinTwpegk6Zj60HAvjQ+Np2gV92KdlmeFiNSO0Z2WLVo2DVQ
	6hRC1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgjak6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:34:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ae6aa148a7so210848456d6.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777322042; cv=none;
        d=google.com; s=arc-20240605;
        b=aCI+QJFEv8FK0ntEf2C11mnzQ55O089xGgcXsE6z+MnXR7G/BpjRcD7Z62Hk2Q2Vum
         SKLeStoNw4JFGEgY5lDbqUufvA76VsatvM7DzysNpRIydTjU664tOE0NYvqvekuYMCV4
         GTwjVBZ3EB/0UEuPazFt04v9tSp8we61EW2+4zAO04x71sqlwsJF126X9WzMXLRHr4O4
         iCpKR96FEw0IMrxCAIXkj8aDl6pNRvuGu+/DUEgMmRJ3SZMNx21i0o1dcL63P/UFZwCF
         SNndSxWFeK6sy/Nsf8HX4o4xfbt2lVFsB63uTIclYMDeTc0A9NVg85nqW0KN6rJetZvq
         Z8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        fh=ZxTSQWDtyCUL3AirvTz541qtAPp1JEjooLIoas8PEzU=;
        b=fNc2MialbKjKxl8rYzGGJtBTZltj2w6Xb3j9NzRrBsbxKJYtds297kCnI5WN/BwOKa
         jwWG66XRGF/gyLnNMf2/ms3ge6tNaOC6TpzOXa1WZCVWfiYslpy0cWv5u9QYWm3twP3k
         Wwck+vMuJJN727h1VhBtCn6Q98SRBqs2hMtCHRZ5XYQ2ZDgSLsP4R93uFIqJzTDJy9Su
         W4a8wne+Hnc50CwG7UR9x30tVvdtR/DREa3XWL1P8It4bqFx7n4s3hP7aUkxPAqY0rbB
         SPewaNNFIJ7WX4JOsbhvUNJinN3AStkex5en/hNN1yuyrykwZ3Rqqm1v18XmHQ2Cbu8q
         R9oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777322042; x=1777926842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        b=UdTOCkXlWJSMgHKj200eRfHIMhm87R5i6AVeKir1zzkOir6l3Md8ZHiH4KTQ/e6Ojh
         v9fxYYFHbFSg/zVdjDtLqxCqH7x+jg79ougpgmYK8TPzp0lAQr9JIaC7bswYB3sjj+XU
         T6LT1jL9eSf425ux55G9PSeA9U0wwMNjAxcPXahuPxjHFQ8xoKKXbYBHI72PV4eZH+uq
         v5txlCUW72U440SENhBArS9k7u1zwNLGM3/3qbHXxlYQbhc9Tuo1P8hg7A1kHT7kNvWB
         chneS0bnjrTRJ/8Tvo26MATPVTXEfInBugDLSsg95bLPmb0L67oT+3kbetn2Bp8aPb0j
         sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777322042; x=1777926842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        b=NNQ4I7zmk2hOxn9RZxqL7nplLc2oPZXbnI9MOzL8+dYmx65gxjCkHraWzFFiFhnyWZ
         byl1RS7P64EJPPtntBKRlVCvYp7RedWiuik3F24rT3rH5dPgIM1dMG8/WGravvcw/1JK
         qa1MrwVeqfu8/t6pctwTQtNsZEz6cWLf72exk6Sb5deklHos81t+w8kLCycUffudYApJ
         ShUq9nwHXtdF/r56gWQZwvvLSvWD/fSwB/c/K5XtaMRKrU9ZsG0Z6qNrrQg4Rjy7vP/i
         INnRkqnA5T7LQfRuycWqVMTH6HHhRsPDurjKSdkTRiPE6B6DyirazWmEPCBV2CO20JAb
         bHQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+N0wHwPZjG/Z2TqVODnlfdZ2pFH7EKHzzfRcrt77dq6mHYSiuXv4O6Iuwx3mbKFsAlc7TfvVajJDxO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7stT/gF58JXu1rxjUGiKSEddTJF3FPG7/8rZpIZWEVPfKztb3
	byeH6FsnFO4aSfJuqJ6ikqYzqq5r+y4/e0v9I+Fz2uom53AHajIEh8JrLbBbavfCwtj4c1TzVEb
	5tKYnVUX4hp3QmCpOhQuX/EVqMEhmbrks0tVkvcsW9XJwPjmmwMtTkXuUtewg32dU1sadNMegu3
	tjoDBbAzcLKd65Lt0msY0AyO7LDgv9C25LuguaBx8=
X-Gm-Gg: AeBDieteOhm3vT6Nj0VQZXtM8Ba1u1yiaESdWxAse6Rxj/r/S3S3+wrUoxPLYbgZXjm
	lQHxAoxP3BPrjH51aph6gHgoMi25QVB9ZxguWOCVOEVeUARdGTcddmWLx8vpOqlQUJ+Xyc/IEFs
	kZ/KlhoJNa5R0Izpy1vvUIiIkI16MniqptaEEyLsZk5q5NUX0WQ7ZirmrN27IN+HnXg2qaznvW4
	izh5614l0RblnWTTvc25B5vL/VcyJRi9nkxcSsZ7vrEHs9CgkWsnSJV1XlOlvpxCsHZhnUvuxQt
	PmM=
X-Received: by 2002:ad4:5f09:0:b0:8ac:b0d8:65f2 with SMTP id 6a1803df08f44-8b3e39240fcmr3249846d6.19.1777322042264;
        Mon, 27 Apr 2026 13:34:02 -0700 (PDT)
X-Received: by 2002:ad4:5f09:0:b0:8ac:b0d8:65f2 with SMTP id
 6a1803df08f44-8b3e39240fcmr3249106d6.19.1777322041639; Mon, 27 Apr 2026
 13:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com> <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
In-Reply-To: <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 22:33:48 +0200
X-Gm-Features: AVHnY4KDLficlBbaC6G7fd9Wou7Y6yvKL42b-mOiAZ8QDOmheuQtn6aM17Lt5So
Message-ID: <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIxOCBTYWx0ZWRfX4H+HP9xzWvTF
 PXP62Drq+Z4T+kZCgB8mdoTrGmhFq7yH/aYrMcRmgFJFTuVHSAJf6p0MQ8+DIo9NcSr/ygqU4hS
 KWeYRfn3lLnP0WmaxHtn3T8hJ2y5TKGQUYxHxDlCmOQJnSxss26PQyA7nGMOyLEmgh9yeLVsubI
 4p2Gwp54aJK19Ei8y3Joj2nst7AaUGgqsRHsCxx9FTCG794mZmF+Q3LHF4o5rNXMrzCHYtMJjng
 kVAAg9XEFJ7sGDAdl8ZHPncWn0jmA1k40RCOpHANNxR0aKUAUp3E7kG6acdLELpMJb98tullgR2
 faWWHmqCu9MsXqexYwLE7lSMC0Om+ysw4+92LIdcEYSGtAvc+GqIwnVrf9NaEr65OiJFo9oIRXl
 Ftnjw7lV8s1ZbR8N4zEwEWNslSI7rj0MX9gJtiegvW0kJaEcP3u+gDWHPRTs40IEjOcHVhZKXKo
 TYBZ+Ehdh7ug5tjNU3A==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69efc83b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=n6yBxzqcbVTERbX9KwMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: eFUN5ETikFEF1G2slsLmjD6pCafEdxNP
X-Proofpoint-ORIG-GUID: eFUN5ETikFEF1G2slsLmjD6pCafEdxNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270218

On Mon, Apr 27, 2026 at 4:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> > Offline Processing Engine (OPE) found on platforms such as Agatti.
> > The OPE is a memory-to-memory image processing block which operates
> > on frames read from and written back to system memory.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +        clocks =3D <&gcc GCC_CAMSS_OPE_CLK>,
> > +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> > +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
>
> Should the two AXI clocks be aggregated by camss-top instead?
>
> Otherwise we run the risk of the OPE driver setting a rate of A
> and another sub-device setting a rate of B

On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
while the capture path (VFE/TFE) relies on the RT AXI clock. That
said, this may not always be the case and these clocks (AXI / NRT=E2=80=91A=
XI
/ RT=E2=80=91AXI) seem like they could reasonably be managed at the
camss-bus/top level.

The open question is how the NRT AXI clock should be enabled when
required? enabling them unconditionally (similar to other camss PM
clocks), introducing a dedicated CAMSS top=E2=80=91level interface for voti=
ng,
or leveraging an existing framework to handle this?

Regards,
Loic
