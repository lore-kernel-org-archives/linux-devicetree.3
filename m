Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4028A3264D2
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237847; cv=none; b=rK4qs0kjHJWP6aGxeh56A6amVlzsBQELjK9myCr+lqkNoA65fMJMmzmWbCMUsvfAT1m9z7LMSeJx/p1/qNpjSZHb775JTZ6XHy8RhM1zl3Psic+2jIe8oLUuqorVOcvDmUHEeJOcdte73K3FX8gwl5Dq3228RG+X4wQHHg0JrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237847; c=relaxed/simple;
	bh=t3UEkdbU94HVj5nKi8Cl4Rw7eUN1E66WhXCwZhA9aww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G95bowEzRHW6/He3UydbQjdPq7KYAvnhZE0Yl1W61NF+2LME/3XVPPr6p6ektu7L/3RsDzuyRr6YMUQOzZ+ZNX7oRQL6sAPV6x7fER0mc4yt1YPg41Jboto1TB0fhxWgCBI3FE+wGyUv2+0+mBcl1LOSctaKrT7flH/SxbEbDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCUWnA8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akXmvyBv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCUWnA8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akXmvyBv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485V3LP2531220
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=; b=RCUWnA8A0Dkc3BhJ
	a0N5CzTaw8w/EP0tJAxJlGPPrWwnM/aQuUGHWXAyqqlaS01UKiJje03sOlFv+IJw
	fjmIqqMqYSUIf4GJ+cOb6FZNUgZu7kNQuOi5bpxIuuJaHDt34PN96IyHIA2dS4S5
	l9k0OXs6frvBS5KmMmb88C3q1YNTH/yqIF7y8KrvCrTMERYomiBcD7HXu8lSfRQx
	xb5hNCMLDR4qf4wCa/tO6Rr9lfwFz6UkduS//i/P69dT5q1ZgzzdRrXheIljKTsX
	ylMi3cl1+raD6AvWyjnmNn3OIedqM6X6PKjZVUHxUR529uy7Z015Gdfnrq7Z3ZOf
	qV2G8w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9u1rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:57:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9568c79b893so113290241.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237845; x=1778842645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=akXmvyBvNPID2apr3Vr2cC5tN9wEqlKkrnNLpX4QmHkqXrcfyHnQYNf9TbOPy0qDJE
         J2nk4wIoseN7armGPh4A2yq8YzV9bw9Zga4ygAArZJrACdYjyDnlgA0f7VSHxXGQXRs8
         wf2qS6HU57Avr4fms90ic30Hg9aqkDE9TyDucdzWHbnYdL176uec7iXVJFwZYueU0WxX
         NtczMEwJ78cVponuUhg0rO0OJMRyaKNQ11HVvVrIkydcBEJcYvCcJvvVKX2chyhDLJ2Q
         JpeonsbtKFkFkdePHtrvugqDmEp7xOE8UEwC8tYl6lOyGHAuNEEMi+2vUkH32x0n542Z
         3aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237845; x=1778842645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=m+s+lPtzGqtToOwYkuQEbyCphJehB/I4QdRVwplrzx27yK6KZyOlykhXQ3JC0o1AKb
         1e7XcZSKLBeH9CS8nGl4oEqTA6ygg9e8gkHc8M5bwPtaI3uMaGbCCMibPZtyQ/RCrGSU
         6mfm5qLXZklkHijw/rwTqdO9dOgHIDIVdqJnhR6xIb0BcixeqAOZrBL8kgNAT7DV88/o
         JBXAZWS9bCCHpvGs82aHMiHVnpNUQPdj/k3CScMcSlFEHztiAhbLOkH1XF8bk+QIreNE
         da1MBiH9Y4aVrRIgB0QMgUrxeeGie0ol1eFTOwxJdE/ayGtRuhG1xYtIaCqj/ByOQqCI
         Ub8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+jQ8MuQVgYC07Q5Nm0zSiDB6Av5w9A8QxTTfH4R/sXAcomtx59sNuKlXdjIR3n3M/efTweP5Xbfn8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yze2ujfPgV7lDq+3R2oaOZwPy8FeeHL7ug942AT+h8FFChHcnwP
	UNqK+gVK81CjNmSjJLCE5f5h+wUXLQ4oYqsHdub+hTVE12qzSN/Ox0D/IAHUbW/Bjec1H7wLqo1
	vY/crHv79sLU5/vAif4FajE/w3YWn8CN68LNjBCRKBZyBdZosg7jv8sNy/4xu8JG9
X-Gm-Gg: Acq92OEOz7GCNmvWKf5nusYpHUFPLFwBeGSJ9pJJF7Hk2HS66K9tmuprs9eCvD+HP7W
	G87Q6zd+vYlOb3qnZPB0WAdqtMzVS+togBQ8ul8LbM8ihQvQTGU8qc/UISGLECAMzAbzco3xiK9
	B8+VuuRZPdWUVUb8OgKB2FUE//Beeljcak8zQZWd0Ib9/XtP5KicL9cvacGc6nrfI5YuoJ1JbbT
	+pyc9fpEYM6R94u1i9jD/e86P25PlKipVaUYFZMw5T5HEYRP59mAHQmSu7oed/E7jEVWEl9r873
	5aKRZb26b6hRCqVqPu+Rv5ZqDiJOahoc8aqQeq1XY2621FIoMZA7iMxo2SL1gVVLMuIOifFTWkE
	IgH1rv4XSo5jCpIQTw9SV+LkdcnU6Uj17CP1mczWFAemSNVe5uPxHRAGvKWbs55dHEQHkalIsV6
	8xVrY=
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37451137.0.1778237844553;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37436137.0.1778237844149;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359db2sm65177566b.49.2026.05.08.03.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:57:23 -0700 (PDT)
Message-ID: <faeb57d4-5260-4d62-85c3-de51d6623195@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:57:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zWduEUhmrnnmhTfOVE73clpk9WC-Gkdb
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fdc195 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMyBTYWx0ZWRfX/2kGCYHnNoJM
 KFuy7SRw3s4Yo1TrTeicdckcJ050e/6VwEZgkXMt5PScBnQyEZ8yJ90bth01wkPLvzLZxZmwGf3
 DNi/dyJKeCKd7BwKp5taB1gREuEbpNVFoOMXYd7jIrV0IPpYUiw/K4HMRDJm30mlscRNwgk8PJ0
 VxFc86N5pF3yVlAKrV+yWyzHJKt4AeMKwFgGF6rOptnMzY6J0dXh573oOfcAK6yKPNza0AePGIq
 atN9UdVBBLal/S4S2pRRhVYZkjIJM08f7VYJZgaGenCNH9YylssPxlwAPu7/H59yW3m7jE/4d3r
 reAz7/VLDz8G1Feol60MLX6fG/yl2buneqyM6kUBlvNsl53bDgZJhncUyx4gsOfzxr95Eh5+qfx
 BVkKo6fn2aJxqNm2n6SeUeRvcHl65k4MwGiWSpVuTdiLjpmBqU9k2qrqjdzY4uOqWjCVmBWoAzX
 97dKfENEdjIRjseOpBw==
X-Proofpoint-ORIG-GUID: zWduEUhmrnnmhTfOVE73clpk9WC-Gkdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080113

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
