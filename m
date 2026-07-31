Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B5311C15
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464156; cv=pass; b=cyDL28SFCe5OZqbCU/ibmL40BlsV1RGBeFvvUyoD71MiZXaIM6ZV493uhiTcRIYybxMoNMZpcVn20O83Oq6SQ3TcY4CMt1TA/sdTW7buZc6Mlx63R3vThxrFjmkTeOPA6kObBQ6EymoBY+iCxWCosCmjA0SCcQmyd41HVjWq0aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464156; c=relaxed/simple;
	bh=WUnHklQ5Ba0l2/EdXcAG9n4coc5blXeAvMdqGp7gsO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzDweKuK7SB9lQ7zIzy512KFtal60Gs4/3VnWcnYYgrCYYmdxW9uo9hfEwwe7Qak2Wm+tEHrvHDELCnU++EHULBpTcycxfo0eKlOxYaITq+hJFxT4miJ+EQ2nuh3e+ux3LcUkrkNsU3bih7198G+Qq2ET9UNA0DuTAYorU/2bQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtHAHu/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV8gwe12; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtHAHu/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV8gwe12"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V1ufNg2399724
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GO4NuLroNOQHAFGy8okpcL7d
	vHtULB/L036T8NANI9M=; b=dtHAHu/1D6nrQDqpiAc8OQ27uc7KMMhVcV27CXkO
	jVk6PdJIJ9pnjtrprXsFNmaKWoLJHjIqVhjDCRd1h9FsHWZr/+wb2jg+YJeGdC9u
	tvcRroVkb5s+WeR4s0ySDx41h3zLglaewv+w/Qb4m923SFzM/6dWVuhFp7/CUbKE
	RlS+CY+h4vvZGcXslw5ND07t20geKAvgyLqTJY2q17jG+L45/cUEm+wmCi+XWLeK
	rTRcnXtE07eD+hMFfDweDI0onVVVcBr/UlOAJs8ZfBqLDtGfX9wjxG2FaiCxTqRB
	2qbQvEa6eicWr9zUBqYnxS6K6NXIPnm5KFrnwI+7E5P1vQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frhy804ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:15:54 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7383a52d9beso489217137.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 19:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785464154; cv=none;
        d=google.com; s=arc-20260327;
        b=T75giJc74aYGRYr1dlf9Nvcl53xSZALOv/XYyQTiU7nIoQv0fuB8NA+U683UBGoW3s
         Pxn9TueYayGrCyWs94rbb0/FF3FDiMHrF729fFRURPusx5kZKjQBZYAGzSnXSRy6P7mB
         7Oo681qYw4oA0eKCEbrS3v/8bND4SaIqzhmSeGwepphK2yPPHgNfZovDVEM/61eVYWPC
         ZxDNv4F04jjvZcvjECnqgVhq1ig6Ig8Rr1ImAG3+n3atFXu4fcAea+/CB2O+SqMuZNC2
         4DbQ8i6cInvmPI8tdSeTRN+5X9V46yPqK/o70ntWYuNQHcloXlw0S6UKHeCjNROSu/Ga
         it/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GO4NuLroNOQHAFGy8okpcL7dvHtULB/L036T8NANI9M=;
        fh=aQiOFsQ1jOjDQoqSItbgTghGRRMFrxMqovFrXw5E3RY=;
        b=Y2paxyDoqpvfyHWYywG2BjyrdH82hnyIPpZEoF/y/lZf/OUR2urzMPhOks+hbZoFOW
         3+HdKYVBq/K4+E8dkPFo3V8ij0GOM2zLfIrmksGT9x1eQzaiFrSpqExUg16wL/Phb7CU
         QKPb9bf2mFecAHQvZHem0AFaOVDLFYeFjXcMNnn2cHXVVdWK5pYHo2G4sZ/8boaDNIVm
         QNxt5HbHK3f4iL68B7zObQ2Uo6KOaFuX33eHBJB4WsIo3WQTQS7gNM1gRBjF4VhWadOB
         mPoxR87uk+pO9Qk8fQg5UlrXfEH+F1m1V707vnUW9NZMiDZdB+BReJsPaePuK+QxgQ0v
         xEhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785464154; x=1786068954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GO4NuLroNOQHAFGy8okpcL7dvHtULB/L036T8NANI9M=;
        b=GV8gwe12wJ2vxmXrfKPZ6OmXyPANe5cm7KGunjFOP/hPUbuqOvc+86dFICPlGqmeg8
         e//j53NN7FsM9ixz1F2cOIaLQo7DjliSecV2Lxk7W0KEVgDXuUrpaPUOv/K9cD1uTYXS
         wkQ3vySD7joHu5C5LMLJvHDqs7Gyn2f/NN4DOBX5tsUUZt7HTr1THSqCoL+bjsRW5+SG
         qmLZWT93j9mJCkWM560l7hW8T2wjne8arIqniXlwaj/mxKEuZc6SdFXQ7kNam3CtjFb3
         4w2iBCUBUlIIGtii14Db6g3RXGa0xW0wxXMHJwEbnkqUJPb9U2nLn5f8/xOEdYxAmvQz
         Qfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785464154; x=1786068954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GO4NuLroNOQHAFGy8okpcL7dvHtULB/L036T8NANI9M=;
        b=iHhoVZM99EyWc1NJlz45gQWxy8GwfhrXftQHi8hpUcwDLbcvWr6bRlGfTixM6gcYps
         quVmqoBQTcY/3N26Cy2P0V20U8qUFwqb/v7aY5ySl+KAxa71ROZgL8grB0SzexpAlxks
         0lILCuDSordPKcB2dTBP6AZ/amrwKS4Xp6LpqtMJVIe1Yo6WIVEb3oVqWu6uit2aDWf8
         rXnYDsWtOAsDClJma/ltcE6ggEBwNvp46mAgMXCyvtyEJcI6LsUw2blLp7L4snla4fWE
         25IaGXa//TA21oLbo1Gsuo63hsZ9rSD7PA3PB/yxFE36ZUYjr3O7QY5IdaYRA6L3+hYa
         5FSg==
X-Forwarded-Encrypted: i=1; AHgh+RrLMEN8K8xWZIcyI4sSjl8403DiSjxCNitGzUmKIAlbhmvX2p3rV993q+wDoKw4RxJrZzL4eplKj+uW@vger.kernel.org
X-Gm-Message-State: AOJu0YxkR8L47dWxhEntGYfYNK5Zg9qeZFp6y6DmDIgG72dD2oCTO+rW
	kIJe0QYcRhCq3IjrZnSBawRzzIsZNPtLJeLyFu8gGDyFwLYU5fcVRZDeLf56r5M5mQPblTabr9r
	UFDJWwn3tqACoWX4UUi2b2apiJfunNG6Bq9MEbFy8/LeQUtNHu/XDCFl4ei2Rk22d0tbyeg2iWI
	uJyz5wYdP+lMh8x3ruGKHBrF3mR9tWNIREt0D1y6k=
X-Gm-Gg: AR+sD11IKFAI1yDO1sB5B0u0fncPClD3FzgCSAeX3rTK8VSl8RJtYHCRc6nFKh4Dt9G
	jThHfyD9Qb6cDfp2xj0x4kvBREvvjr5PueIoqyx+HQbCbS56MdSI17rnNkuvgJir995FLKgSjj/
	5kxWSDnlmziX1AYBREoB4wv2n1z0h5Lo1j9SpOSvMHD18ZZg8kF+cmjQU6bKGRfTG0YkYy/8xLB
	1TfgRJmKztTjNR2PA==
X-Received: by 2002:a05:6102:26c5:b0:74c:551:d7a with SMTP id ada2fe7eead31-758fe348fcbmr8278137.26.1785464153676;
        Thu, 30 Jul 2026 19:15:53 -0700 (PDT)
X-Received: by 2002:a05:6102:26c5:b0:74c:551:d7a with SMTP id
 ada2fe7eead31-758fe348fcbmr8271137.26.1785464153337; Thu, 30 Jul 2026
 19:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
 <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com> <e3de235c-e962-4882-b4ed-8001142c838d@oss.qualcomm.com>
In-Reply-To: <e3de235c-e962-4882-b4ed-8001142c838d@oss.qualcomm.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:15:42 +0800
X-Gm-Features: AUfX_mx2uqtzaDLPlcdhXc3xsBnuCIvxn_FgfBGtKePJ901IL02XQgcXYzZnFt0
Message-ID: <CACbMrhrF=jQ-vzAqOPQ6TR+CgJ_tZDc197zPkiTPHuF0RRD2Zg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image
 sensor on CSIPHY2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: _maT0TY-Fq8N2WDxvjx0s_kjSYh7EWB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxMSBTYWx0ZWRfX2jtJeIwp1LfR
 m/DYSGzcTUO1GSWkZ5TorEZRDRe0V8Np3oIxYAXdNG7BMrM9crAR9BMC+riTaGV8kzsRoa/BKdQ
 VEOiU/35z7Xbyx/6M9g38IwcqeQQRc2jb7L04EXuR7xbVozt7xt/pu6EO5+iZAhiTPXoob705ne
 XI/xWntVGPBY7ZScIGwUqZ0RKrDEQypB6lc7RZCr+g7rhnSwtqLjNT6UM8a5eXLye19+8DBqiwz
 rmMYz6DwYT1voLcujo6oH/rV0JVQAQ6Euy1BAYLgEq180a7FF9TdF0J+haV/yWFJ2M1HaJ7+lBj
 sGBjitPDjAJd79qYlljzXMJqHx+NwTjaAcHHgEK8D+m8vcBRJDTiItO48xDBVarvSdig2GaGsu1
 tlD3fbWTXOnSMpEVT6iEByY/r00+vAzCIVCxZtoX4diEdzgzVRQs5u+J6IqB2Rp9nbnSVy12MFr
 /pn+yVgqDtTwhVP7B0w==
X-Proofpoint-ORIG-GUID: _maT0TY-Fq8N2WDxvjx0s_kjSYh7EWB_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxMSBTYWx0ZWRfX/1J53Fmztsa1
 aDfWyd0qnE1IQNWGe30ug2CTP5pWkF5KkIC3Q2J08gp+/QV88DE11IV9cdDhW+WiCrgeZt43w8L
 6bYBkpOMvIQSIQ7zHexcMS4eRJcACrc=
X-Authority-Analysis: v=2.4 cv=FvU1OWrq c=1 sm=1 tr=0 ts=6a6c055a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=p_339t5VP85-RoGMPq4A:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310011

Ack. Thanks Konrad and Abel.

Best regards,
Hangxiang
On 7/24/2026 7:50 PM, Konrad Dybcio wrote:
> On 7/21/26 6:57 AM, Hangxiang Ma wrote:
>> Enable the S5KJN5 image sensor which connected to cci0_i2c1 on Kaanapali
>> MTP. The sensor appears on CCI pins connected to the CSIPHY2 interface
>> in four lane mode.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>
> [...]
>
>> +&camss {
>> +    status = "okay";
>> +
>> +    ports {
>> +            /*
>> +             * port0 => csiphy0
>> +             * port1 => csiphy1
>> +             * port2 => csiphy2
>> +             * port3 => csiphy3
>> +             * port4 => csiphy4
>> +             * port5 => csiphy5
>> +             */
>
> This comment is SoC-specific and is really not very useful, especially
> since it's an identity mapping
>
> Konrad
