Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BB40B6DE
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817453; cv=none; b=V5Ouz1evMB9EZEayBT4dJ7z1f+PQKWTdXp/JJ9d7F5nrxs+O/cccrIixViUu3cecUiGu70ZmPoGAqQDFLT/IQoByCvH4mKVem2mr5bxjYClIrUgXan2Wuv8Rq5qXkTk3aS2tOCeO8/uh6lTnkhStQ4kctPVnN8E+2yFTvtRvTEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817453; c=relaxed/simple;
	bh=cpApCxfBaqKDh3CGnj0iJ2WdxTJDpyP5GpLB8ovnhNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmEG3A2yOTj518pPEsYa+C3RliYlUNTXK7jF2byvJlhbhM/YRWBylUXXck3Ckipmp5Oq4KWAugtQBSqerw63gdGihEWqaI7CZDT7TcpcQ9S44EfLSCoYn1EL13gKRPv93rIQfQnlq4RGRILcclE4yl6/gEJui4kReLF6g3UV4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVxW9ssc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBf8Hcft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVxW9ssc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBf8Hcft"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtgl1611941
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th0F1tTiFb1RpjJNUOl6uU84e8PxU+lQWgw3C1dT/Cw=; b=iVxW9sscHUGvuTqN
	UYTJFSfluLKQ+i+TShtM2yRIawhvekWQvrL8FajapcHhQr8d/3P9Q5SjoDZAZAc3
	sltg60vP9hcGBR8pVY3Z7dVixD6bVk0cYxwGZhOMp4G+/yYULQp2awafJIhx8TCM
	VM7pbHw9eHPV9KgrrBAW4zxmA183uiEoRDn5p4dPDrjTs9UIHHnvba+W+PXU4ORo
	43pWVICqkhSEFWyQAsWyVNl6dd4C0lpW6GMyCawQ8NcVHcaX1B7uXKkzbHBEh+xO
	w1yvrb0sN+ekUd/KeNtwWA+scqmJZW99VwU6NUst708dqNAXaClItjwzkg/k42Cm
	cmJLIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt871-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:04:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8ee253caso4943461cf.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817451; x=1783422251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th0F1tTiFb1RpjJNUOl6uU84e8PxU+lQWgw3C1dT/Cw=;
        b=BBf8HcfteYDOQQi5FEd57JuCEt0Cscb8WZYJMNhjAzC90C6aGDcFyWihdn43tWmZiC
         RpbhBjqKg8jI1fupsYp7tPzSqjxNSXZUW1XQJQp5FpGIUWTf6Hybxj/Fkf+0OullnEaX
         s6DmzGqfgI/3a5I7wvNaSG7VC11suYnzQzp1Npkoqb9ChRWlyRMN4JrU+difbQpMKs2h
         xJfpsZvDY+TmUOv+OQ6C7CG0e1F5uwKcTE5D4Ubn/y9zI3UADF9MXEt3Z98NsSYZXxhT
         TJ/RUX9Z3ovk9n4Uq0C02ndbjUOR8kLoqKLNDTKS6nKzOpzFh+gKYnhO/EJ0e0Yh3QuQ
         TR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817451; x=1783422251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th0F1tTiFb1RpjJNUOl6uU84e8PxU+lQWgw3C1dT/Cw=;
        b=SfoiZ8NY6IEoz1cea4Cer5anI4J3PAhXl0IFUfO8YES17340DXng37apRDIHTPKySy
         IDyic4m4o4BvuQ1KZMBejoevF5pwmnc2nkdYlD//5Y9U3PA8POkpAqoxFXVASJyQugpN
         ZmucDflPOkNIEJI/iHSkkf4Pde0S9Urxh6xmUs3PhBKgFz5TLTQNApZYmi4YB4JkRe+i
         xvL3rWoWpMYOyRZY8XrxEMe9LuSfhtizFuzYqV+42Cf40USoxmcR1rRV620viwmIhBmG
         ZiVy4PsQs2LU8x+Eqv1kMA8fVTImJYiuFKS5m+5Ja7lj3y3SO9CA16BKjMHuW9FHHs2V
         BrJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+M4paW08DaT924QQfLbTUzITPPpUeLrVeNb2I+3y9xQS46nph0Dta8Q9Ym1Q70MTe8XkzJfI6+WEHf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Wacyqo0rELhIbU6hwilnlYQ0Bd4vxGcMARnmlNOvYF2S0yiS
	86GKRO5vhr3Y7Cp0FoLAelaW/JHrrqSydDBcG3rgoOgufFjJtrR+yJR1RUaiC5IJk4YHJHVXYjC
	Smne4uy12WcbmYWTPXk9pzotYgL4pNTQzXCeTNGYPY/cL6L0oCbEqh0k5DWkTdm6c
X-Gm-Gg: AfdE7ckwRC5xOUe5sVDhBnJUzwgbM7I98X64ZkXUKhLPFd/S2/AFhONQOrTvldbVm2p
	mS9mwHFTlR9TyzGvm0LpeTvlqmtHDy0OkZo2NUuoDQ+N7IrXo9QusZyosUuOnx+3EQza//Pz7g4
	rfIHOZW2zisIbyUR7Pb0csxl1r2U5Uy+TVgdwZjPWxZnqdmSBZRRcifpchJSp/2JCR26NLcAGYY
	n3BPaXPYnEhTevoyjq72P/y+kAq18f1iuAk3/nUAGaZeRdxWl7TiGld1edbDJguO2KDxpWUBS/7
	Af3ReDY6AZv0MO28nBsPcLf+1QWxkOCFrU2WW9IP1tSUIw8nJL5e1MqICJO/WtLiIzbKN1HnIvU
	rso8fxA+7ddxeKr/HjSWXGKj1ssdy4ywokx4=
X-Received: by 2002:a05:622a:50a:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c106024cemr24242961cf.1.1782817450839;
        Tue, 30 Jun 2026 04:04:10 -0700 (PDT)
X-Received: by 2002:a05:622a:50a:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c106024cemr24242361cf.1.1782817450139;
        Tue, 30 Jun 2026 04:04:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f48b35sm104121866b.46.2026.06.30.04.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:04:09 -0700 (PDT)
Message-ID: <28bd19ae-14b0-44ed-93f5-e066d7d695a0@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:04:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
 <20260627190612.27271-1-jason.pettit@oss.qualcomm.com>
 <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx>
 <20260628162913.66306-1-jason.pettit@oss.qualcomm.com>
 <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
 <20260629070903.1341-1-jason.pettit@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629070903.1341-1-jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfX3rw6VO+9zf7c
 TXq2VtbNpTHb0eUJRmI8V8f6pZmj74wF1uRKLLSQQnUQH8zZ7CSYA/uq535oWZpIu30YtkL4ZK3
 OubywSueuqVyVurZtV0gYbEtGC0CB5w=
X-Proofpoint-ORIG-GUID: 5KPlPbSu7mPJQQPCPiS-CgGsSinQCJwm
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43a2ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=vR9D-bBcShyYD9ty43sA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfXx0DMMgLfnaql
 OXHQcOrj+cerL8KDGI4PZUsPez4+7EaK+shbZJ2/me4iPGMau/opH9cnWXPwTte3FbdylWPMYqO
 K9HUut1sqMdDCANeD2l43oYocNQS3te8yq1rm0wBC8FbMf5zRbXLXNbhJypTnZHRJlJwHPlFT97
 seK7A8QkmFHot6+BXzEJgAukWuPizkkF8V2iKEmuQpaVbqbYzqnIbKfSsOpZ9UAJ+mTJhXuShPc
 GGIdXiX8ljiS5dWMEGv0WVxcikRu6cG2Mf0IEuVvnJXVjXmLbvw8K+1GiSkYg+U4saIC/xzIBgW
 +vB9Wv9N05vntdzOKqHniuFUgHvNu+sxkvIkBeBMavz5C9mb/KfUuxoMG33n1IrCJpFZgaDrvxl
 j/rWvtiFJFTlySiENVkZKLglhq9YVf8w/35JsqcUq/KIe2aCA9JeJPpufeJ2M02/tA9WjjSAJPF
 K+rsNuI6BDgxAN8rg1w==
X-Proofpoint-GUID: 5KPlPbSu7mPJQQPCPiS-CgGsSinQCJwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300101

On 6/29/26 4:19 PM, Jason Pettit wrote:
> On Mon, 29 Jun 2026 11:47:52 +0200, Konrad Dybcio wrote:
>> At a glance, this seems to be different vs the reference data, could
>> you give it a spin?
>> [...]
>> -	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
>> +	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
> 
> The prerequisite this v2 lists (the Glymur DP PLL change,
> 20260419-glymur_dp-v1-1-ad1067a8e8ae) already includes that 0x04 -> 0x3b
> change, so it is applied in my build. Just to be sure, I retested with
> &usb_2 and &usb_2_hsphy removed, and the same result is observed.
> 
> I can leave my v2 as-is and wait to submit v3 if there are other
> patch series pending that I should wait for.

The merge windows just closed, so we can pick up patches again.
Let's see how the (many) dependencies that we have shape up.

Konrad
