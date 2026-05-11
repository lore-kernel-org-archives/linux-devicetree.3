Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F9137B01C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501642; cv=none; b=lELsh5Tp/57uvjDq2zpMbuUfEflohpd7qNt9OW5jrN/rSgV83kfcH0p8ruRiS2lBwlM1nzNzZ/Mjd0S2zoXjVg2Fs9womqI7xGcVS3DTvYKI28GwszIb6uuOfsP33NUzvH0wyIp982RwUvnVlFM1vLSw6xSlyjVD1zBWb1EW3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501642; c=relaxed/simple;
	bh=ctWfY8g+ZnNLbh+Mmvkd5b9yvYp2r+YlNPDU9DYCzq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP1o3sOcrLz//bCVtHzb3JAKRio9Uw57RyeCKzJowtnrBwvRxh7+dsjbULqqTLg6Z32QPYGglVljHs2k9l/1piUYSRco3Smj2T1Z44Om26sWloWGJddOTzS1+iFsBrLrSxeu9Wd1UCMEVLZ4hzU1tfUSdS6yhlig1jwmF5E2bII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc5m4l3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFSHBbEW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dc5m4l3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFSHBbEW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA53FI2039514
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=quguLxSCknJrEL9+J3GE5YyD
	UjFoFl4iy3lBytmvO3Q=; b=Dc5m4l3BDfqdia6eQzWv66BBy+aTuDoj9f8gbJW9
	N6HJ5QLZp1cB0BPWR83IkQSWxOq0pvZQX54WIu2cvDdnyA/7yNRU5KHR58vtC1q5
	ma0yzmINe9CBB4YSQgVe3McaHZ52tdUGCX76kX9CqFjKGWjctnIciuOhG84BYvZm
	CFlt/zs1RwCZ0u0ejpH+4E3BIL8jn06RwGR6TI2UgGzd+cGV8lE7X58XRCOklZux
	V3OpBYIJDH1ZMgZ9OLZgi6C/wM3B1kXi+IslhZ3eov9uMlq+3FbhCaH9srqr9kZJ
	DYeaSmETVYGjRxj35fCQLWapjCWgo52oegWw+lRFqrWJtQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22rdus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:14:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63144b84f14so2922154137.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778501639; x=1779106439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=quguLxSCknJrEL9+J3GE5YyDUjFoFl4iy3lBytmvO3Q=;
        b=FFSHBbEW42YE/eRwk7St0hTmvH9c3pvJrTOwS20Oh7DoZhW8AZqXi54csFNxcxvvmY
         5xSael4KK1qOsRbPMJOLvZPBXo1vNogfDQljaHtnNuuJlNNIl/53csoNbFy8Vxa6a7Ek
         kz0UXZgX/im19uA1CAGqwNcNgCqYx2V2SqhTYmp4p5EWgq49wscRh73mlOMwzD125Jes
         oBnIqU6cHuuXduiltNaZlQ+tDh/yFqoYTeh0yfSGpT6UldNa5OtZ2TQ2dsYgeI2/0oL3
         SHeYUi9E56AaRTSAUEiePFwRgkm2S5QntM5F240qDnOoyK53pCY6yz+5fZgfhwpHTYaL
         oRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778501639; x=1779106439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quguLxSCknJrEL9+J3GE5YyDUjFoFl4iy3lBytmvO3Q=;
        b=U+YO0JBmAsCbRDKwEmIiVBORfv0CRm5y8ueofRxZTbPhgHfv4fmToZyNdElZwcInTk
         Heeteg8vXthUjCnns85zVbQlIiGoVnQwqGbILPE2QElPBuKASVWAZGslaxu0Q8Z3V/tK
         lbPuZyo+6JGpDf76t6IfzvyipY+gJFXqr60Rl9gnh0tDFK548+e7f3PZwNkyQw62Pt5z
         QVKjr4mfX5cR4XWasDFRRJtIhgHEGlZkvWMjslwZB0ZldNafmm4OWoTWWFNg4+TITzh2
         AzC8viQiHbCUhaoIvnyIDrEcghvBV7uTk5ew0LShNXwfzDE+qMvrkq176f9Lnq9GkLAG
         ugGg==
X-Forwarded-Encrypted: i=1; AFNElJ8qr0awQJzvxSbip6Imv9synSY/oiyn5AJLKfoRFUeNBLfItNis8p2f406qg+it0UBthbsMG4yRV00Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/tzTAENSgkhsmKlFae+aFsyRSkYSaKY1A4qGmfSb9u+wXC2FT
	ndJeNwb2cY3JV6l44/sg89Y6vRbcKRLCIAZhGaqgUUxIeNQI0HY9h07YZmfrgyxwUKVUvuTV9Pg
	DSvnJImg8dF9LBcjT9DZP4uvKN8dVv/MPfsyFG1md1eGPbAqkCEzKtTYmK6HMosN3
X-Gm-Gg: Acq92OG80Dt7S9RkTZWeMkoxmKtXN+E+HJm5x36BESfjyQ80vth9dJH92ZKj/6klNHa
	uNHNCzCT4bXhDy3v8WEfdyt8bSWT33RPN9zvZueqtk5TpXqEHBomHmMOwG4N7uMab6FRKweqdJ/
	4WRxqq2z+6wZpSYOMparY46unbo7YYB+XLzR+UqCBbYredDG/oAGX4twFU/X2iOA7LSAZgGB1XX
	l3D2soOKalcpkW/2L9wIIFOeNMpy9m5MgIrgKdZO/BPQANgKzizvxzon/m0o4DQoDtkhIfuMpXg
	TOTX3QP/82LVz6Pcc4FZxZXkiWvFw+mJrzGDKeSIQBtGlpzckgnoLxXnINR53M23buk9ulAJfDu
	dq7naSACuxYfjQVJYXK1ZmM0+ybaubD5wpfVo
X-Received: by 2002:a05:6102:5787:b0:62f:3abe:907f with SMTP id ada2fe7eead31-630f8e78da2mr13940080137.4.1778501639365;
        Mon, 11 May 2026 05:13:59 -0700 (PDT)
X-Received: by 2002:a05:6102:5787:b0:62f:3abe:907f with SMTP id ada2fe7eead31-630f8e78da2mr13940051137.4.1778501638696;
        Mon, 11 May 2026 05:13:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db09ccesm59901085e9.20.2026.05.11.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:13:57 -0700 (PDT)
Date: Mon, 11 May 2026 15:13:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Message-ID: <4eyvbu6khzuyyxepa2yzx2gmkbnayazvl2hp6r4tgm4na6zqea@wrilaji7wgzr>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
 <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
 <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
 <486d6b30-8762-4f14-aa19-7c5497cba00f@oss.qualcomm.com>
 <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
 <0e0b9933-f753-4a79-b4ed-dc992733a387@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e0b9933-f753-4a79-b4ed-dc992733a387@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a01c808 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3pvlDPVxHvEVv69-bkAA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: bv5F6WBXs6F42Wq2cRk7SFsfNXM8J4Un
X-Proofpoint-ORIG-GUID: bv5F6WBXs6F42Wq2cRk7SFsfNXM8J4Un
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzNSBTYWx0ZWRfX84tsWN7FBeYl
 i8zEoSS5/OYsPoatYx1PlVLj90N0BkWQJGb9UIQcj1boSATMb7K8GOyBgH/+FQr46pgjvFKgJxy
 3yJe7maN7y0ext4aM+7lVlZS0hZ3LsSVKpSpCWrhaLkd6hWBCfn8+MDp1vm8tlAd2TPQsQS120N
 pWoqZ347oAnoDhU+Q2jjG183OGt7GIMoFJ6c/Ac83FMrfLuClbayCnpSXMY6T17DgV1sgHLriz3
 Nv4zkK8eNtJPf8GEBtZT8yFGo8pWcAbJIEygXP6hjsDUJQdIWBBbUzUdrLZjeuQQ/lAM4OJEDka
 SuZSoQ5bIsNwE3iBFq0+kcrSi2qsghL19RmuhdLHPMPOmHjPNywxHo5+aw5QZF+1W2nqeDR2O+X
 4PYAizLk6qrbuBtc2SQtFmYcaFrdexXxGMDSYcs+WCMqfJUFw9BZvl7aote1ZNY3RDE0h4P1NyZ
 QIf1HcNVXFJut6RI5Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110135

On 26-05-07 12:47:25, Konrad Dybcio wrote:
> On 5/6/26 2:15 PM, Krzysztof Kozlowski wrote:
> > On 06/05/2026 12:47, Konrad Dybcio wrote:
> >> On 5/6/26 11:56 AM, Krzysztof Kozlowski wrote:
> >>>>>> +    then:
> >>>>>> +      properties:
> >>>>>> +        reg:
> >>>>>> +          items:
> >>>>>> +            - description: LLCC0 base register region
> >>>>>> +            - description: LLCC2 base register region
> >>>>>
> >>>>> LLCC1?
> >>>>
> >>>> Unfortunately not
> >>>
> >>> Then let's just skip the names, because it will cause unnecessary
> >>> confusion when name is llcc1 (since it is the NEXT entry) but it points
> >>> to block called LLCC2 in the manual.
> >>
> >> I don't think skipping the names is a good idea, especially since if
> >> we keep them, we could teach the driver what channel the region actually
> >> corresponds to
> > 
> > You still can do it, because indices are fixed. Names are only helper
> > and makes that easier.
> > 
> > The problem looks to me purely doc-related, because this is logically
> > second channel, so LLCC1, just like qcom,sc7280-llcc or
> > qcom,sdm670-llcc. Does naming it as third channel (LLCC2) is relevant
> > for programming interface? Imagine driver taking LLCCx and using the 'x'
> > as offset?
> > 
> > I tried to find something in HPG but no luck.
> 
> On recent platforms, channels 0/2 and 1/3 are paired, perhaps that's
> where it comes from

So what is the suggestion here? Do we keep 0 and 2 ? Or should I rename
LLCC2 to LLCC1 ?
