Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3A238AC93
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554543; cv=none; b=H4Gx+mUydczYvuGf9Vo7BhBYofJTcxcUpa0ifLn6+A3g2rNrg3UuKiVZ62NOYIg7k7+2DR6d8emkU8yCqBsleqbaze9vJCuvBTaayJWm98Ms/hMOyotix/n/FnByXNeL7yJNDHTmibxL599cwhc/IOEhu4OB0JXT9wfSCau9RLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554543; c=relaxed/simple;
	bh=MwPyQOiSQ6RdUeIETXwp4mpKmHfQUMEjHUb4gqtjrKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2Hptl0CAuoTGlODcZM8HcXZ/aeyJRatupgEiIVnCHbA7EFCFj8Wpc+6l2DgzMZB+aGYMLyvP7r5SrORqav6VmBb3Uvigu3FCLezzA0uUli86N3OSf0ckKDuQISTfYXmbfkKO2IM0hgBTZJIOAe2vVKp+g87H9+2spwJgaPi8rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzepB7am; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj1+CMts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzepB7am";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj1+CMts"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gXV3492497
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=; b=RzepB7amkneQ4mjW
	n/kBSwAwbeYO7us94i62DaMBfxEnQxK5hvTc84zycMW29DKt0PJoK6I7EEwm1e7o
	62G1hmwSs2O7XtdoKM5mmSABd/7kEGkqiL3XkCpir4eVow2JwLeCiyW38YRdc2aw
	2gLiDBSNnrM1UGS3PgM1CadkOWVY5OVvV6tb9CUSb8sUFYgeRnmRTSH58PhmylHe
	IXo+Zzu/acsprtXbOlCCRlCqc67BPeUe5ytuFOOAg8ahlJcUc3X+lZfm5cPk14SP
	EMLdi3dBTQb0dcZ02kdufIyJ72RQD92spN4WqFYvPOjUdYW+iMqqBXjNVWKqUKNL
	Wlq6Pw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t25c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:35:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so19947346d6.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554541; x=1776159341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=Lj1+CMtsPfVEjDCfYdBeA9uEyulZqZziVDZUuF1Ks2Eeq9SnFTuaC3DYy/zVBDkWnJ
         GxQdQzFI5Zy0zVQOMv5ZBi0q+fXrE9ZdHr7rJlCyIxhUL1lpKH1Co3JKdu/odqECQI9d
         WBmJeHO8zhb7fzcSIqvJov0LpkD0/3qktb2gFMFl3WOcM/1sRFgoraj3BKOESxnO4SHn
         WZw2KZF/sn8DxtluTa/DyhDR3UR7jwaIRu1zQUSWhbRd01bLGypXBaBaHT8LN9/nCa4z
         5171DMW9l/h9oL2S3YYRuPI/rkzmKYgFGJAlBCk4vbOsm7UxQiaKwGThpFhmiwhoroTp
         WsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554541; x=1776159341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=GgxLaeZ4kOlQw1lnh/jdSGhbao1HJ914qjO7tspUpuuLVUDLPMsWFvnF84nehiliWQ
         S8z1SdHhYtJPNwUtgGZjpa/cxZEHonm+at7SkS1fMAIqR4zRAXX0kaKawfKjO/ls5cVu
         Z5l7TWFXxRhdGPqJgX9CJtwSWZMJUBm+PeeQc0Gf978Qi1LpycX4W1lpixw5f4lFNKiM
         tiVYH+zuwdKexZD+nZa0QMcUDKykakme1SAyepv0kseZcg4WkUN37sNwte1W4bsj9K62
         IhTYUiegzokx6h3Fz+j5gg8cgVFzj3/88XMERBu8u31RCM+9yx3slh4iztlpr26/F+Q5
         i5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzT/UP4ExFfUekD3Lmo19Tfab6ZIa5vS1L98Qd6QdGBM23GoLJx/DMUNBmznh5yWNSdMOksDKVpsj1@vger.kernel.org
X-Gm-Message-State: AOJu0YwnJkVqVQaUvSuvEzkecQhfOFy4/PV0cX9Z5wTLOI4cOawsaftY
	ukpyLl/TXfkWtc/yVQioyBN3lg2KaX6Pw22H/Zo9zAGvCsAOOYjJz1EnCoT0WAbFPSGc4OpsV8X
	VxKbb+MbpZH5nUdw7TpVEQQ7mcS8mCl+ea9R1S/nTUF3BcH6vdByn2gs+Da8OfAjf
X-Gm-Gg: AeBDietRaXSSQJNckTGFrtzhfEG4ZpNDAJmryHqQIPkDqQIZxURjZUydJaRURPHBXkb
	iemUaCWsuwe5pg8cSKwxkPITPVCaUVSe0HwG5UdIkAsSeX5VCwzOlb+NdFh3vdSn3/Syr5Hcivn
	FDdXUlrkMXOpR6AXtE66oXnRkXFPBL2XHwHSSNKHwNp4lJhCMWjFaX7Zm6mbae1Bdu7Hj/PJoK+
	TtoAlD4ej81evHdPMOOF3JYRHrWZmnCSBaHgkSX4hFkVmTPvWZuR8yf8lb2zGMqVfBg2VgiSiw5
	rNC5UfonLTfx6k7kFn1a+7TLn7IzZvL1Pdmkf7awHySqfkKyOcqBiHQBNcVOMzib+mkB2TlZ2M8
	S2t1AQLYXTpNFRXxT3hw+vjoHuoBOPPctLpYRR1bMCBOIflnePjIpBLZ4mgXN7Y7nJYBMs57MQX
	0r8wc=
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451881cf.7.1775554541031;
        Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451421cf.7.1775554540574;
        Tue, 07 Apr 2026 02:35:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a780esm4156402a12.19.2026.04.07.02.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:35:38 -0700 (PDT)
Message-ID: <14c61b77-d790-4e75-be79-caf8b7ee8e4f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:35:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fJ2F2TlqFUIwUQuOx2hf916ZsAHOPR-h
X-Proofpoint-ORIG-GUID: fJ2F2TlqFUIwUQuOx2hf916ZsAHOPR-h
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4cfed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rDrCEZzy5hQS5nTwK98A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OCBTYWx0ZWRfX3qUPWIydPeb4
 1bZvCllJRE4dNx76N/VeiGtCgnUeU5xn8CiIf3BVfGGvBS8YB5PQSJtIT89MpiwEZ/6kLQToIVP
 iYKhKVEhkAwSDjX/k9MsxjkiXQVBsdocahUD9A+QPwXA6scO67wtskMe6kd2JPY1jEzkmYlYwQK
 EQLXXSQA+KAyS6RXUo8olFJCR7hidT9S+Jl7qbHd9t53rTFOlD0RrOmF+aehjJ+cbkn2ItirQKk
 +33bTnHgFyt/NfQmBhbLHhOdausyLTpQiP+gMJkZ/O4ai1SEadtk6xsyrmIYq4FbXj8OAsw4Dja
 MUeH0/GH3bi5lacBwYcZI3ukH2PeE1uIaX43A9WFJ7ALaEQGXc2JwB46YQoFAj/lfJ3U1GMhE1N
 0PXXPfLPsID9iy3wBPBH500af2FK650ydD0OeXSwqoYLk7WE6kf937dIFkIaFFW23A1jlu3YjHQ
 lEiF0ADvVpY/Z6XxERg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070088

On 4/3/26 3:52 PM, Luca Weiss wrote:
> Add a node for the WCN6755 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
