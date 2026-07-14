Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52243FD03
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022050; cv=none; b=bJWBGUqFtoVfgIZ0K5/WEa6IKGZIApUjx8qNjXQWOGEuSSb2aWedXpHLdOz6UXQSNsPILpmKuBwviSZ62LMW/HKzWeIJ7RJ69UHKwi+Lfwla9uouG7bMvGOV+NU+NcIMOZerl3pDnmfWffWwOgEiff9+oIT+BQFB541aoWBOr34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022050; c=relaxed/simple;
	bh=4uVlRLOB2Dz2ou/g2e0sj8ArDYM9B8BpWIoR8yhRqos=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TyrTHbxKGrEpX0FfeHjcUXJW21GeoITcoBfDYqdveJOuvabhLtVcJx0MlxSdmqp9+l6rmyuO4MUpISWAJBPsTcun2eVEQytrqb/74k6BQoh/IxER6ILBLvMp4OEda8LKJ/37pTE4mmYDLsUERMmFRKwgY/BIcDBeQySG03+Xrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZogzCITA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLy1sJt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZogzCITA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLy1sJt/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SUSc3929125
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 09:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WmUzQ33MErj9lXDVH3MM2QRZKZngI8rpWpc6ys6++4=; b=ZogzCITAYjBl50RR
	IzoyMdMx7TJwj/U4yfgyiK3575WU78YkfPZNLsPdjL9y5Q07VPk0jumgDCO6F7Z9
	DwHP7P6bd6YIZVP6EoUvDmhJmJ2aB8yS6/uqCepFHIUFMJabbsKB6gvCywo1zpG9
	/K35sQrK2r+OyEjQIf7BsYxKtT5pw4k8NrQIUX3olKpVQe+PzEyaDd7IzdZrDaC/
	Sf9Bgn9gk+YU1fsnVEB8Ts/rXxxXkL65BrEofMqHg59PBbZijy9prZW/s7VsGBLz
	ftrwkxf9D+pA2JOT0xviWbn94VxeDo6t7T/b8C6YmtNt08sfPnd4SIyOsZxNr9CN
	FpglMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xbc7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 09:40:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso11075285ad.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784022045; x=1784626845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WmUzQ33MErj9lXDVH3MM2QRZKZngI8rpWpc6ys6++4=;
        b=gLy1sJt/K1JtIgs3xqi/UO2yeRkgpZJrJ0VmZZsSjQFljhf9TQzQT2EPqESCLHX4rX
         TLUbfOer84YjSYhC0TZyb7RbxHFaL+tXuIWBWVDXYQGXLvYJpOEVIVi1LLDg3L6pN7nv
         6YATN3LjXcaifuCxlmjAMAFW4rMuXX4t262W0GKQ2NJ4v71uXCjzXdXEwbU30tniw/4F
         5VhxMEtT7v4me2PwX+th51f/37yKZ1CAQdm7KIiMZ/DzYQ/GgvIcrP1l9vJrI6bnnksu
         VjnAum3jh6iuXmWVODWYcQh8nHexStMfggmJX4PG6wuisCrkDwSBQZqBS+l6XIYsIAKY
         FNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784022045; x=1784626845;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WmUzQ33MErj9lXDVH3MM2QRZKZngI8rpWpc6ys6++4=;
        b=WvYsT1s2Vl5V8ozwm5LfvCGKiXl61E+FFlb4MN8EM6aIAOv7JCf/vZxP64imZRd0dT
         d8QgOKyKJ7AF4UKzeFGKQb/ny5JltOnZnQNh+62pYlO4ZLuiBki277gr9K5Uk768V/4F
         fIRHmHQHtPIb8zp+tCZK+bCE6OtfFtwlLQKFKC+GVwQNwaMP2uaWHeqFVKLltHoXoJ8p
         QZx6jelKtM+H1KC+0BgAX0DqTrqmmOECLnUA8AclgOXbqsNqKReyNEAWbljocjVPWWkY
         /w1lLaMnM1+yLSuyCiYGBEuULez8KDJ/JcGNqNnzfG5Bmh6ilvzL7A3jbXwm5yV9ViWa
         cGEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqbqG8/10184r/hGKpKG/eqVMopN7yhoKU7b7U4pYcteVFehfFv5y3ECRQX/6f8lYjwRhyUQ+lwNas@vger.kernel.org
X-Gm-Message-State: AOJu0YxUNzkvzWNoRCYmyeLiVPAwYE1Ea3KmksiYX52651h005CcNEbg
	D2fHZieXSnfugx5ve6rP7yMVuuZedW6f8CXs5jUYqC/ibwr8GHGLh8ZpYBm3TFpQX3Xi1uq70gO
	53mdAAlAoKVgqS9if33HWvMj71V7EinsYby/29DAf8vhz4tYw9j7GBjeSkVIjaCFcviZbQ1ug
X-Gm-Gg: AfdE7clNGHAVxYcVsoDweXkWUjIeO6CUFuh+3YiTs33XNw32VjCRDtPaM62af8hI3i/
	S2TRb2v43h7YzBUGlkRl2ufKGykG2e/h8eQfjbbfiwhr2ExM2hP5XB5VpGD6siQ+mtBSICMvNJA
	j2ODaCPNIgMiAqFF6u5+fycW4FVVRGt1ESUBlvnzbXZqFMS3cRYAINRYoQoJgGV8ptA2pLFfdsZ
	LnODYOaWiNFtEo/EA1tzpEoLnXpCLU5ewZuX2pEZUc0QH2AG1mdwj0CABNt136s1rfCELN6AaAp
	XLt89Ft+9DKY9My5+yxDpW1kvoThHxu1iZAREbKic0DG1lQnkIayCRA00LzDGxeA7YMs7F8HrbI
	qfKfmBTHwzCxEu+jZXM9B8OFBne/BYfsi04TMbWWwOQ==
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr125379125ad.13.1784022045009;
        Tue, 14 Jul 2026 02:40:45 -0700 (PDT)
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr125378715ad.13.1784022044490;
        Tue, 14 Jul 2026 02:40:44 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm112560315ad.53.2026.07.14.02.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 02:40:44 -0700 (PDT)
Message-ID: <3942cbf8-62ac-4bdd-8fa7-fac6e121d5e2@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:10:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Fix legacy/new SoC strictness split
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
 <20260706-b4-shikra_crypto_changse-v3-1-23b4c2054227@oss.qualcomm.com>
 <20260708-splendid-outrageous-saluki-aa52f5@quoll>
 <d9b63658-b588-4103-a247-cdd78910a89c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d9b63658-b588-4103-a247-cdd78910a89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwMCBTYWx0ZWRfX7E1oLJQ50YAL
 ai1H5s+uhwputsBKyRL/GsYIt0/FVc9xySJH2e4bl733CZqhgXHoo1ooN5+Qq+8UxaemEwA4dBL
 /5blurLEWHbWc5YYo4FP1+2uhqDco6PhyBgw8Hcgc638by3aDQvxcmZkZVJufe/tslPUUU8+sjz
 l96lqCDxjYDGgk2/pd/UgocC6c3dkmR6jTbL0o07M7c85Lq7MbRTRnvGb8PG3S+qmJIPn85hQbh
 Xuu5rQK7xEeMB/Htw5STzBbHMI1pPz9w3S+a03/lXJ/G+zRYYbK1QclioL9bnPVmfnOGshGNMFJ
 0b+aCdGc6TyKMK0223LGk8BmSzeh31uPwYHxaZUZ/BvaDBDZ9wYekMNdXESZUreJiRmi8R32wHz
 9sMemjk47IY2kjdl8LOyl2Rc77Ofyw6vwkHRHpY5/jreFx7DtUK+wWGVaSp0wjOxe9MZqttYd7l
 Ecq0Aowwxl71gTXWcHA==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a56041d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=f0zYKoChvmPFgximC2kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Qnn4XHjlHaA14hgftXiscH3FZDVEQIP4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwMCBTYWx0ZWRfXyiRTbVUw63+A
 i9CyjK37JHG1mZWSy07ox8ZbT46hU7SkI0jkQ3nwM/mlfubUfwzFy/Iq6mRmS7h7bhUFXsOjD4L
 30NrbaZeF2Wr1BComQMCya7ca8TgNhM=
X-Proofpoint-GUID: Qnn4XHjlHaA14hgftXiscH3FZDVEQIP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140100

>> To re-iterate: You change the ABI for Hawi, this must be expressed and
>> explained why.
> 
> Ohh I see, hawi is different case(compared to milos/eliza) where
> bindings define the compatible but somehow was relaxed(got missed
> probably) from 2 clocks recommendation.
> Just hawi compatible is defined but no DT entry is present actually.
> 
>> I do not see any change in commit msg (listing "new SoC"
>> is not what I meant is not relevant here - it even suggests like
>> everything is here done without impact).

Hi Krzysztof,

It seems Herbert picked bindings patches of hawi/maili/nord and they are
now part of 2 clocks list.
This means there's no special case of hawi now and current change will
remain intact.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml#n60

Next rev just require rebasing. I'll do and post that.

-- 
Regards
Kuldeep

