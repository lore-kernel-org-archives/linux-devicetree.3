Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D923EAC90
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352082; cv=none; b=asyerwBy+rDTzkRumZq8nA3ql/agt7Rgn7e2+/i0o8z4WZ2fd7DmB1yCUpxRNyghVGqZMkQMglK1XWilQCRfosKW57inDfOgPaVKwj+Q42gaw9nFVJhpofXCA22A9nnW5nxuJR1BT1a/B3OvA2CoTJ70w1MxS+DvIgF+7w64e+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352082; c=relaxed/simple;
	bh=uGVKFNxgNtVtvj48f+UoSa6UUkgugrajqAExR1/m5xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQFQaUKj2YmDPRLGorZ/WrVHzVCmEDmpGIyQ1Ih4q3VYFvlbqX1Bfwl5TFzqgApMeVURiys43WuEJ2yneNT1mRZOIF8QrXyMrj1rV+ov2Uxlm86y977dPoGGuGPDvo1escIEM+PDhklbHq6A64F3M0iv95k3N0b47yUf3PjzvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfKi5Ev2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKQEpXBk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfKi5Ev2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKQEpXBk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9PooJ3934878
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkqAg9UTp/HJSq1hFA8KE7U6oPq3yJOi9YW72TWgtH0=; b=TfKi5Ev2T1fiTdhu
	wUtuBTNFTStkP9FmQd2U+VdpOwWChIjh8vZIR4HaG9cQOXJ0m/YA98F9vzE5oe41
	GqdElH8SvXXPnOc+ly5mGEA28/9hKf1DJ20ZnBp4VuLtq3Y5MXRkqtexealAYyY3
	swL4tocu1v0KduYbtqiPyCsLnTJDLk45JR6OxHxzQ1LgzJxUvtxYBXxelhB3hkoJ
	gWDVMiBB2fCe05MDGQnXO0Gflj1d/vHOCOgpK7oXcO2zr1Ao8h5A2Wr901JpiFJF
	+V35EwpvxzTyxrGYCMxPdbQL4alpL78Yu5fwVYKGOwb5+wewhyG0MyjY+kMeY8me
	aOBimg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0m6mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:34:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094ef8c28cso22681781cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774352080; x=1774956880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EkqAg9UTp/HJSq1hFA8KE7U6oPq3yJOi9YW72TWgtH0=;
        b=XKQEpXBk3Ok5lIBazPDiImQiZPMIV5wv2POaD/vn58N3zG7IYkFNt+tScAOeWImNyk
         90dwgcmdXgDhQYSXInHJQtFk/fcCkxIBXe3aWy+gAbj/axt5DTOd5rVKSojWpWE8AWxC
         em6X9Jl9Tp3Bi6MuDSNpB/EUa7QRUe7UiIQTJCqtG0x93/Gx0MeUtHX09Q4UwEsFUInv
         kKNIz33bb2jbI9EGohLUsU39xmK5/WY8cet8ebu7jiO18QHaaD5GBDchnKCw8C+uDfqT
         ynJP4d1HNXr3f+b1HlJWGt7ozE7ZfyooS88wYaEM/yw7Jj1bk40m57/I5dHN44riRJ73
         RfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352080; x=1774956880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkqAg9UTp/HJSq1hFA8KE7U6oPq3yJOi9YW72TWgtH0=;
        b=qpXjYTxUYkkgYx44NwDyNXW85/3K6O9Hy6279dOaO++UQL/QUTNHUc1vuY2P2hwKIJ
         TtyHrIUZhq9SaXn5WNcVt86gPnfDPcRR+pC8IEjMKFIdhSfPhyWkLTtlHXo/2aI1/4eW
         EDujIfwaZOxeIZzUeiletpok5W/wg0S2rl5TgPpGVJL3kVCyveXh7BPaK3SrFGOyIUEi
         GrXyzXa5Qjdqmouekek3Tf0x91NjoT+sNQFwQCG4w3OtlyqfvKDjgr7tYsVJG4WygD8+
         cwW3xX4wKOjC6qbhfWTFsu0T+FBTneNvNMkqDnKgE+LJ9Fr8wvqwXbUrFjJWgDrga3AV
         6p/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrz8zDMDwTpljTeT92BSobiEcidSPP8rCwsXsT+UzN9bTUMvc2mp81yhVno5t8JKeI9BL7VfABN2nY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Ix8ANrzS4S9lRqhnZyDy1YxbJTiG0jcLVlRdWnUZBzeSZjBM
	C44wMhJc40ggjPuLyGJMqx60et+J6ZSY9EkNq0B5KHyhmoumCeUxqf+ViX6Pvz5xL0EuhDDXJm0
	DiTIIJMYa1rZR52hg4bW4aT4pARPBLQZIUm0+1mDaD3AJJ0p8rz0Zs1mRJwurkVlp
X-Gm-Gg: ATEYQzwuq9hH3SPopEfXr23Ff621Y4qnt5DPt25RH3CErQWp8d7d7TE/qStnRT1C50N
	PKrLScriXKL4xMUASBWh+ZXUqy4VNFhAyWSgIex+9VYLhEUjW+v8wSNB4Ka4GSSx+YMXdUz6JAO
	83lrVgjOq2ev8Mt4k+SIVa1JlEYHcyZg2SH0/Bw3FUSHJgnyHCSbb4BXsn9PUq+LLilTCJh5XM0
	vtg3Wdj6WEj+B0HX4HzpM7xToO3ebABG1QIKZD2Ai/p8AusDxsKAvnSweg9LoeBEzg6XrYHt1k9
	gb8LVqaLf3SW4DNY2ptiuNBa/WEbZklWuu/CDwf40IjApKEYGGAJmYaFQ/PRdwStOrzWK6ZCYnj
	1kuFM/CzTaGclCBBI9lwF9wmDxdE/RrdreIonFNH+KtUfozc+44j1obYrwmHrJ5V8drZlhJbif2
	vu1sU=
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr34046781cf.9.1774352079486;
        Tue, 24 Mar 2026 04:34:39 -0700 (PDT)
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr34046291cf.9.1774352078974;
        Tue, 24 Mar 2026 04:34:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365dbe4sm620521666b.47.2026.03.24.04.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:34:38 -0700 (PDT)
Message-ID: <1376fad4-efc3-4b7d-bff8-9510ab0d3800@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 12:34:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] interconnect: qcom: icc-rpm: allow overwriting get_bw
 callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-4-7892b8d5f2ea@oss.qualcomm.com>
 <abb14718-3d94-426a-a0f0-d101470951ad@oss.qualcomm.com>
 <75zgkrwvjsmnvjeyosl326vcudklj6yhhyskdrsm23kbzhgve3@64nezs6c54kz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75zgkrwvjsmnvjeyosl326vcudklj6yhhyskdrsm23kbzhgve3@64nezs6c54kz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c276d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=in80v9g7ds5Yhk2LA68A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5MiBTYWx0ZWRfX8iUuUlKEfY5m
 dWCAgfJbtnz1TSDOFLJbKVq+jHh2C3myr95lQUha6L13rwes4/oyqMQbEdNKBkc5On+BCFym/29
 GOx7GljfB76pVWYLDofxfK493dmtsZldAL5NgcDLAM8+C28jBL62s3PjE4dxFHsbV6mw/06Vaaa
 YlaS8uWntUUXBRK4m7foQHCUuNj89bdrFsUWqw5zWhfC2hjspI5no+mRDp+2b8HBN1prkjkZjRc
 HwTsyelYqp/FA2xvRFQzRExnAzyoysL1DvKH6eWkSqGH3K8v8KGfaFB+rNf9l/Q0WMqXWH7GUur
 VZ8xK+zzH9gaUb5Ez950FQReeju/yDgzRXCUPLZKjKgN9bxbG+U4F1TaTnW1lNyYvyQn3LVWWcd
 1fCN3Y4F0g3ht5Sy/WHGa2fGV37sAJtPxlPVVaqHnU27IFRb6c3updCj+kq10vbuiJB3+Y2nrXO
 OZIF69HwWhFywdP2jjg==
X-Proofpoint-GUID: EQSgXtcBKgsJklnDTonb4QPEYr3IZrju
X-Proofpoint-ORIG-GUID: EQSgXtcBKgsJklnDTonb4QPEYr3IZrju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240092

On 3/24/26 12:14 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 11:32:33AM +0100, Konrad Dybcio wrote:
>> On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
>>> MSM8974 requires a separate get_bw callback, since on that platform
>>> increasing the clock rate for some of the NoCs during boot may lead to
>>> hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
>>> msm8974: Don't boost the NoC rate during boot").
>>
>> Is there a single specific bus where this causes an issue, or is
>> setting *any* resource to INT_MAX problematic?
> 
> I'd refer this to Luca. I didn't experiment that much (and also note,
> this behaviour might be firmware-specific).

In case anyone's interested, it _seems like_ it's

(RPM_KEY_BW + RPM_BUS_MASTER_REQ/RPM_BUS_SLAVE_REQ) failing with certain
nodes

> My goal for this patchset was to port as close as possible. We can drop
> the get_bw later, after enabling more interconnects, writing the QoS,
> etc.

That's fine

Konrad
