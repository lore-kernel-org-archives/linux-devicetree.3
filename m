Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375D723394C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186648; cv=none; b=OVFbW8wzT8XRFilpLBV8J3fzecKcf8hgKMedJsxnRO84PpuYWrgB0Bb3Pown53Jw/kq4aAbqXlAUTPcAW3Wn/j36/14a5a/Ci2TXQ7AEEgQMZnNHo4rBNPVz6PSCFP6VWG0zfKTNuEf8ApUBK3Dxk81Svw9eCUqSaMJHaPg+FXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186648; c=relaxed/simple;
	bh=DrHYf7tqRQlk8+UMJlzpuLDOe7qhskYNuKQLTOdIGBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G0BUQgwdecUwT8pGgMdoExqbyPCxB1yPtGUINp02fdUoHiZPs2OO5+y2yolGu3f7Zx4vry28MqmOf1dzPe/FMEB3PN9TGsSHAKTGoQeCoIGrF6GLk91ZT7ikxb6017qtNHmvKsm6FJWetQFLSW+vl+T3eq4q1Q49vtuinyR0jao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3hkma2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xurs1aAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3hkma2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xurs1aAp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9LsiF4063029
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=; b=H3hkma2xRjIZtP16
	Csj0mBKxkVcPv6DtcNTKqaocgLwHueHcZ96igOx89nPEZTLo0fJ9INS1V7Mh79NV
	7AznsPqHleu7XeWJ8Y/4/g/hChEJ+LzyGOh1awoLzGuoTd1mm1um8VeVdKE/N5/S
	TNmcGp+HDNqGIstPoRY/aytFmoISjPIdhL6OtXHD2Pl68kYsmbthYWkanjP+G5WQ
	XX3YowAoooZcD+B2uFDBLf+uh35EUhmBCDSg3/JP7OrKujAMbBZmxeuOiR+XNspR
	o2zLdjY9Pn8Rf0iJCStGLm2OtM+pelnu06oBkVpSvVh9nvBIDvT2W6PnhVgz8Yos
	tSWmpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u094c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:30:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faec938fcso9323691cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186645; x=1779791445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=;
        b=Xurs1aAp295XWToBaHA2/tCFXYbQ1laT8Ar7hUOnOFfKY9yP0zf1tgJ62LRtHritRK
         7akXy3+2vn6rRASWeKE93HUaSPVoIdbolIH+d1wqHVce5V4NRMWG/HX47rnMNiFaWeR2
         VnDJi/NK6nWheOsJeA/UyfQqeNfaOm3FpftXXVq077vnkV7g5E/SL5k52pYs5BHJs2ia
         IXSifVDL9u0UVfBEODlP+cJvEU8WrvQnDGSstxvuGci8i20/CVq5av26Z+FsQmadTsrJ
         QIpZ7UpcM7gQYpVX8VCkWH2acqvTRsVRjXEFSxa6vsS1mSUvXEy887LcpQzuRt5jmnex
         tEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186645; x=1779791445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=;
        b=eYO9hnBM5pyePC03DiGJrY2m2iRXJqpVxp7rsxcJk40Bd9dZ+CR3XutlVm7u9FmnoT
         OnIdCOab4p++SX04xk2FQOp5YxkNWPfpNpm4EAR3K3BqueIE/9lU7YUXheGbg2wHpAJ6
         vUZgPD7lNjJccR/srP7OopUx2IziG7Cgd0q/Xj6V8AqMVX6zlmxa8WpGbmy52RGgTPQZ
         9Q59gRliMaPmCgIR8uufvZx3Yn5bSWFbsFvjH78Ti/9JWrRKAdc1R+Whzp9fcDKYkQpR
         b/1y/dvVjDNSisggDqPKwsdCIwS1sL0SFXUpriCLIkUtQFtFh5V9UW4Ro4EP6g6nr0e6
         4a1A==
X-Forwarded-Encrypted: i=1; AFNElJ866TAgyvKIlzeHMfR9sjBsNPZaGqvYpgiKCOTtMsw2TwnBTv37vOaKxxDckIyOBfXC1q7OSCYQPswE@vger.kernel.org
X-Gm-Message-State: AOJu0YxqppxgS0skwaJ3mteYnk/YCl038qQCZWjyajUHJCxKNDVsEhTp
	OlxBA+S31y3kxfPfVImG6GcEHk6gRokaNdI8ahG2h1Ge4hjhXyiEkgIeR/tQ8aXDArD23LFXSat
	dpOOWNaBqbMII9hlwjHh54845a4y8ZcWRFDIkyjDCXawqtjhR5wXUnp1ybQYFKGki
X-Gm-Gg: Acq92OFUjj4Sa78FTrNrbvKW0yUnYj2GHO2wverhC08P3IBuky5wXFfYm4GsVnNf/jk
	775VDHlDN3cNAwOc91U0p03UU6gLF6B9q4RY9mS7PvYsIU2L5WmcJfjDTx0YR8luW7GwF8BTT/W
	xq4JIPzsAff1Q5XToMHF2F3z0uahablEGRZ87MS21lj98k6AXEyQ8HSMsT1aZcBmKRF2sF1mJWQ
	n6Ts2fzPouiJjdCk0RxMMULbOuk2g1YHjPgmB0aqYU/Gt/Kzk2zpp0mB3SxkkBYvvz8QNQGg9Kl
	XaL3BjwdfWhCMVPzfwoueNyNN3DFwwv/h2dIob9RihqO6jJI3sbiU5UPaX0pu1KVHrbRVtEtJtj
	DupP37+SkaQS7kVm6u6GChvhmdxzHaSXPe/bwPw+txHmEYr2sBmTJ7gzQzYJHQEhWDa7kkE8bGk
	+llSM=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr174859161cf.8.1779186645635;
        Tue, 19 May 2026 03:30:45 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr174858921cf.8.1779186645103;
        Tue, 19 May 2026 03:30:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm692805766b.15.2026.05.19.03.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:30:44 -0700 (PDT)
Message-ID: <6773be1f-d48a-433d-927d-f2a90e56e82b@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:30:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c3bd6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nMIgit4TKir8xPiZD48A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5F0gAMrZY8rLMNZTADLFAXXhr-yb3pmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwMyBTYWx0ZWRfXxDkfpAWaFUup
 px8WiL85bB9PKTjMfkxxvto8rL927oUe+mHoqrGxq3Et5EgUBxITiWOkNf3QyBeCHzORKauCmBq
 +Y/NRhRAsF4mswLiGH8HboQ9UpTr3PGCtzs39eABLZ8g9yzu2I+p4EYqUGrKk48jbYNp+FAlWLa
 6gwqAVk1yXHjgRs9ZMUE3e1wn3RePWurgubN/DLs9sNMCOEGEgVslM9G/L49WJ8Ftmycf6K8KhJ
 359fnWpPE8eFDB6AfGRbabi9K9rYGvnB61e9LIO/CIzdKeOyrXGg7FfXvJtCh9zsj6DjPERewMd
 vlg0Y63IqbP6Spm+6A+hYdGYfPT/ZliMmmDQJrxgGjoAuh37VstzL3gQPmEBvOD4XB2qghj0Zum
 Y8eIhfP5SiHcLz9Uhhhlb8rDSBj0FZ0HccJxG2NNKSKDoXUDy+gH9Zcm65NQu432ycmofA1gBl0
 MY6eG2593m3IqW1KuWQ==
X-Proofpoint-ORIG-GUID: 5F0gAMrZY8rLMNZTADLFAXXhr-yb3pmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190103

On 5/19/26 12:00 PM, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
