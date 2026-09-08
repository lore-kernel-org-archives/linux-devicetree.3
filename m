Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6551C327
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865329; cv=none; b=M4BDWz8HqAhSsTonn7oc6TkpyZeiiEPXyINdj8ulwoeMcS6JAmj5Rm4McOHbWzjPUi7neQTfZOLHe2z58rZkMvEFDuNw7Muiqo8Y0M+F8GjSF3WUjI3gevjn3kY9lreKQvCViIVQGJKYclGn/9fNrbBWNpncUMOwvIrjNGyypNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865329; c=relaxed/simple;
	bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3FtBq62y2G5lAoIG8n+pfmLPEbDXWa+ND+B35+DdgQysHRsBYQecOzemQeeIOFgshDi+s/AVNorkY/OjAZdtmFTboL5sfsx7Yu7ZmVFqluABhJRStrb5kxx2TTuy/Hx/LV3HSF1nv03mIjOrN/1K4XpPlPEyfCzl+cvtW5Tgho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7yKtaBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUw2re0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7yKtaBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUw2re0N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADU821472673
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 11:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=; b=o7yKtaBdaCxH4nN0
	VOUWEwM8q2MMaMQ4ISuaKAlmS26Ud5t2akywVqneFO3zXLCblHCFDMfjd3GNLYOQ
	34ckGPXjdk8N0xkmmKmrurGFgqdq9CRrQr/xuBjMYvcA/Bq9HA4WbQJ4QJUVN2j0
	XG4P9jDUUyImectiyRsYH/d3NrdOpXBGujrp+0yOuSEWu2joJYisZT3KqrFbTun6
	lsmexUWzwgQHgWI1vECCGx/GjKO1BK/b9kPDx8PQrJN+RGcgvqmv4R6dBy1Vo1gM
	zfxTaMvvkvB7k8wIdfcgbgB+997Yzfqonwtv+HqVgA3ZmurxTLAoyxQF/SgwGr45
	r6ckFg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcrp96dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 11:02:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-789eb1bdd79so100557137.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788865326; x=1789470126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
        b=iUw2re0NhoXUxtgNKsJpePu3MBPl/YsqlsJVhUGDO67PD/HFiUh+XptxMG865tfPNB
         E5yXMEBU4z11QoOLDuoFOQ86+TDE6Puymr2On2jeXSd+6FyGbc+Tap6sVhS8muHwYTDe
         Y/60eiHNEKOfDiS6BFdNCQgVA2WaI+sQepGmnX1oLl5168OLakoyJCYYxpweZISTYAq7
         SwbeAGL80zpG2gYp3fAe/81VCfc+AG4svJyJmZ2L+fNmorDYXZHOGFftdDSvnu72C9Vi
         9vkcjw5USMcTRHz/jSvKmhnVyK4AevA9fxKM/ICgHQhExcovPEp9UTog6JCePN8d0F74
         BAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865326; x=1789470126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
        b=X2QPUG5OwwBZ0AQf+ScXolT9dwq/zyXwppBf0BKA24bi6xfUFVyOCnsrewPAfpAV9g
         OYZ+vvOg2cxDyUxgq5+zB2ntb6YL1/qI/wm+ZY/CXEUDuKOVFKWO04ng0AafqQc2yFEB
         n7PDENyr5wjBW1zE8u+YGX/sca1wfQgpJro4NNw9RoqZogWw6Bb/RMd3NLQ0G8+s4U6o
         2XeMQLP2OBuv/hRRdZtC21Pi06OAFcgoLJE9wn6ommj7VJTM83JasW/siuud0HRoFMGY
         UoXvvX/iNN57URc/jncNm5sy5E2h7yAYkLsu2tmqEvxa0GePKKP1Tnl21tIMbIAORAzD
         dLyg==
X-Forwarded-Encrypted: i=1; AKwUvBw+ZU3lhp9QxohmYgTtPts2XYxvPNMAeYwZ6zbeRyHnxVuZrDnzw1AVcjkmYu/zJpmIWfaRA7CyJX9W@vger.kernel.org
X-Gm-Message-State: AFuF++lXeGpoyj4UA8h5+kVEmrVrxuwFLiRWmb+sw/J9JGgWhv/aUZML
	PLg9H776ObZUxS51XzZRWav+JBIVY4PnBd61WYsUX+n7pZQ2IMPjai9rypDl9ks7De11nqXmExK
	Y+mksY6zjhmKfR42Cb4kAzvqpeMRnCSyL+2PAeFk7Grnt0v/rEjzKzFrHdsM4Exa5
X-Gm-Gg: AYBFou2vD36uqMsAPGNY8EZLu2D1qEepyvEZ8HjneTtCCoZS787aUwLpgdKJBSgzDBv
	/GZTXiMMgzAmRZ6o0wNRW53Rb7k3HTK7OOfQL6VJwvm7Tw0CHfMk/YrBsLIwzpDQFXZBEqGPWNw
	bVEwZVUmW3CQAGMnUngZT8ir24t7lJ4IlQczXOvkHVrmX3N8/aYqHjBr+JdXTQnRKAtpVIhLX+e
	a1sXT33XPIe5fuj2mHOhfuWOnaUwcchANdR6CUbYAHXspkry8IPoOmZ3QnadwEVVV/gtBntfWkJ
	XQxW3GHEy5SyaGpB0xV4ZS3H0AUCQkGONSwcs7jghqUAXKnDrr3iiQCRRS3t7Iduh/U/kt7dBSs
	zbuEWgaoM+bgYIUiQhBtFTw==
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr3144944137.2.1788865325782;
        Tue, 08 Sep 2026 04:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr3144904137.2.1788865325270;
        Tue, 08 Sep 2026 04:02:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm607243366b.23.2026.09.08.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 04:02:04 -0700 (PDT)
Message-ID: <47344b6d-d64c-43ef-9344-0409a434ee44@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:02:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add MDM9607 APCS IPC
To: Dmitry Sinyavin <sinyavin@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908081158.2399852-1-sinyavin@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908081158.2399852-1-sinyavin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UfRhjqSN c=1 sm=1 tr=0 ts=6a9feb2f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3ovIoLsmiQdKh0zOvnsA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: EvvHA6F5XmrVI6cPn8WdW61Jz9Pmmwez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExNiBTYWx0ZWRfX3BB5nGtZWBJ0
 eNqbZGo3tPzCNDE8I1fU0Hkc+FmNytOhH9ncUe1HhigD97ACIvc/GB3NCEfvPYf1/QaW/LSjYQp
 etyhfyekh6LU8vF3V3JfhZwRCrNf3wVD1ep8D58jJKaIG3dJZGWCRxVUEcPF8Vl4Q3F632S13Dt
 2eNBW3/g5HlgjFxNPzp2IvTrElDtK4P/SDRsK4ASJJzlh7H446eYstlEvnCnm5TzUMzX/eb9e/D
 WOolyUGvTbDyx94/C5ITSQKtMcij4wc5HPEuTinXSYUvATqpmhOediZnJLgFrHaoDQVV9CzDq/7
 l2B4/6Yx1OJrqOhqXQsypZnGfhkD0k7018MXKQrFfeo/lSAEr9YYQk23KveGd89gy9A4oqiz6VW
 Xe8T5v+guLYel0v3reaoxFwjWHKNFcdQJKvW6C7RE+8lQFGyaG3ulSqrYSTtpA22dGJAjDAp1/2
 LPGSOZ6/OCnG9B/V/cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExNiBTYWx0ZWRfX0nzLmNLRelFD
 Vvk5GdWU4m4InES303YkIK6pH9qBy7/IPqWgzd6xDuTD69BSMqqZGyubumZai7+hDu3/T2uOgwe
 9BheRCspU6n+bV81XMPkRMlLL2uGrrU=
X-Proofpoint-GUID: EvvHA6F5XmrVI6cPn8WdW61Jz9Pmmwez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080116

On 9/8/26 10:11 AM, Dmitry Sinyavin wrote:
> The MDM9607 APCS IPC register is at offset 0x8 in the KPSS global block.
> Its CPU clock controller is in a separate block, so the existing MSM8994
> APCS match data can be used without registering a clock device.

Aren't you going to bind one to APCS though? IIRC the setup on MDM9607
is somewhat similar to the one on 8916, although naturally a bit simpler.

+Stephan may know more

Konrad
