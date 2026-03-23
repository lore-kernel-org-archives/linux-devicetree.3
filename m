Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B837F723
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262729; cv=none; b=NA7v5z7QvU0zXSp3HbJQrSnKhDThK8ds++Gk0rIGdO9gvEncEwZ2/Sy27qSRWaP2gA+N8owXWV3DQr1QdUUTVnFZPahyYbShRaEoKFU0sKOmXQzHId/2pcJGCVEOLarJAXIiKXdomUWIXIwmBaa5hr37ULQcnyIgwWPwn5rx9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262729; c=relaxed/simple;
	bh=bJR3Kdjc1gGye6KW0sXyRoKoFmZCvahO2l+ajWc8zhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJWEeo2cyHmkDMhYyPVHwgvETgl8ODAMR0OWL3H7wL+PI+ndoq9REZonSd+RnHIUFGRcv2LhuxoA81mh+X4Mo8xIujZSbSUjlxkNfjYU+LWjAAW1OCgZbC7CtiNCeEYTaW88+3thsRGQFBzxt3xotQ3RjWDqyFq5o3RSQjNW6rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z69B7kUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8LTsdiz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z69B7kUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8LTsdiz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5l6R13769023
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ZjakhbEwfLw9wMFFasNPzd9hrAyej6SVbhyTjALxjo=; b=Z69B7kUfynEEduX5
	9IYnifSRg+Dz29Sb9lwj+PdKV6zxxFWjBK8z3vL8QFviCOo83aL1e/S14fowZOQN
	s9ulyAKEKZ9jw31pyQhXCBDtaElx6EWM/qyGzcGIBYF51wwRviQYA36friTABnhN
	M7GZBL3Eak/88pXzkcPhlfn1VrJ4hA9ocQ0emudIY6611HHqJuTrNkOfflX81MlR
	jQT+v20Th4j+F8h6U9y6RdLETdzWMjT8kaq+fA5iQwCWFro51XWn3AG7mXp96TPM
	3G3PawmF7iyA7U0iypY4aplDsctdj30Vp8ib85Ns6sdqJvnRsoUlSEM4EtT85GyI
	E8Jbpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvn1q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a04e9d4faso33344686d6.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262727; x=1774867527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZjakhbEwfLw9wMFFasNPzd9hrAyej6SVbhyTjALxjo=;
        b=S8LTsdizo+Ls5rNMYU9aENgQN2rqXETcetHYPgcps8Mpsfrtg7hf+QS7gpDjll8BVr
         TW4a0BrYahCbXjRvE42k0sK4uOYSSKkuVQ4WrFcuWCYcMT6Y5MEwjP4MbdFOAb6QG4eQ
         ueOMO8YPsl/ouQpu4eyI0qTk9ey8mk//8bpe4CShjlbqUYjy7E+9CDAR/cELF3BBGFYJ
         4T1oLrXzY7byglfeHRElLa8uYjzUSNiD5hgkb1eGwuJq0wpOZKNPJ719TTqxsiDSvu3I
         F4jrd1sAOi7r6W2oi38I5HDK4Zs660KS+RHS9usv5Oia5XLdYWkeMcTUgxMrAoUbiiGg
         RmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262727; x=1774867527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZjakhbEwfLw9wMFFasNPzd9hrAyej6SVbhyTjALxjo=;
        b=Ru2kVuTXPy+2QSSImp4otkVg914MxVehFe/c+Qk6TFXh+hausEvRtIsFwnw7jJPecq
         0kJu+C7eIzMpDhN9SLyv9h037dPVhqdEXy2W2A7cX6ntq87+ET3ipPTfmXla65KKgTfP
         RPCk9vOrQ1d5ceTO/jrdslyZk1q71XOuSn+Q7Z5rhYbHXNwCRiToRrVuCuVsxYg+/k4p
         k3sjWtWZETBaw4CXccE8BqCydSQctQjamDYCVTznkJTtZTeswkkmPgy0edSv8ez0Ka8p
         rBryf3wrg3h0lw3esrs5Q+T8jeLLol6nLn5Lzg0dD1r6sTljkoEJvYC0v+slWVZP/bhs
         zeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI9hIGyFXJqwDrSGJn9lPlczbcVGrqNodFNnp+bJ2UgVb1UORZUnMNYTW02ONf2PvM7ushhD4Nnn5D@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+wnwGq0n2HgIJyjxkq2c06kVrS7Kooup9WeDkYpN0DO//bWde
	EaV5n5fNNC1lPenC/kujxHmWl+YEtPVS2zmCHw2aqHyGc/sYMfWR0QHIudO2W2dyhaiGvTw1LdZ
	PCrP7KiER9nTs7SNeuVNsNcAsvfP4UuASQord70F9yVYT/1R8SoXiyTiAehb/jvcE
X-Gm-Gg: ATEYQzzaxOQew3aTlufuVdL3RxpLoall9c75NUC7XWKApOfuevcKQWuX6flHLWInnhU
	hBpYvEqIFq+44VKKQjG8WULZRhEjosAEUhDRSqfE/P5ZSAprn9NbBPe88Inc+tTCaopmjUlX0Nl
	GWE7f5QIxCuR06vEBPsaXHWXDIQkGbwdnohh8WBFysJNrMOVTLzzErYGh1lqR2U3+SIHeHFdmyF
	tjnpGJHg3vI32Xas0TRg3pgROSzOy2WyjQuTO2iNxzg+OLkWjpYM86pj+uTJlseNcm+pFEEtuyg
	xadAH7e4gdWDNPcpRIgAK1Qt9iSHAlG8YD7Xjti0zEniK8QxS6DCOwRrEbGwdUPJ/Z/lsM167pv
	m3H64OUnWcBWk5f0Rtqv2Pjh9fMqOJhs78y1Wbso68KkMv7ygLwADWT1JpXZcY3O8jYcvg37hfF
	lD258=
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr136812421cf.0.1774262726868;
        Mon, 23 Mar 2026 03:45:26 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b37233ff9mr136812151cf.0.1774262726318;
        Mon, 23 Mar 2026 03:45:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2a4b390sm3567344a12.28.2026.03.23.03.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:45:24 -0700 (PDT)
Message-ID: <b58ae1d0-d4c3-4b30-8bec-295ebf3b9380@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:45:22 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] interconnect: qcom: msm8974: expand DEFINE_QNODE
 macros
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-8-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-8-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MiBTYWx0ZWRfXzotcFj0IaJP/
 SvVrl5bTwyNEvqT6lQkpuD9HsvSdpXi6pdvzCahoReJ4/Y695m8tj4GaIvJvUALolaDrMrf8Lo3
 VXUkg1rbd5w9zZb1iK2rQFqmO4VtFdV5h5cWN4uyhoUS0ts1Pk6xm99Zm2PILunJ6vAwcMWVTK6
 f8zD6hvGKRnxsgi6BCPQV6kV4jcmkREhCFnhbywzphvqL/JyeMGhc0188SCYX0BO2i39WGgZ1eF
 ocW6phwgVf7ed2U6jaisy1ebB7EXl938BodFwFKAGia37AIILFwNKLczD01c0t3jvgzPb+Kp8Av
 JKoM7DNrJIZUYVssBhePlxPU3HE32VOv7IoVcgsVtgn7gDQFj8wedQyPKY1jMFjXsKngDpD724v
 E1EVCnp87QTuBz/vSypGukgMXb46+Weip0crWzox9W3vQFLG1w9pJBdPPq/LAifThR2LLayxndX
 TE4ilC4lcwNVFJuOJPg==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c119c7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KdZTDNEmWR1w-4yzcOIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: -J5x0LBavnjapwQQcFqdavL6vxu9_EkM
X-Proofpoint-GUID: -J5x0LBavnjapwQQcFqdavL6vxu9_EkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230082

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> The rest of Qualcomm Interconnect drivers have stopped using
> DEFINE_QNODE long ago for the sake of readability. Stop using it inside
> the msm8974 interconnect driver too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I'm not checking that by hand..

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
