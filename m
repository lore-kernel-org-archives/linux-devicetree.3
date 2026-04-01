Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B93D1CD1
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035285; cv=none; b=Z0LGSg4g1Vxh9JoVk+nWxvg4p0rbsB/uBo38+c0b0QKZIlyRwVTq9kHY3E3lPqRA0zFkz5ZYWwK0335M/3nE1rAVcEiTs0PXD9ScnV8BqX64k+/7/4kcqdWRNYwklUDEa4uldoKtt1IaJdrVE05oAPhV5GMmDKCvi4Px+DvYPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035285; c=relaxed/simple;
	bh=NoCow4Z6L2G/wxb8DwrevuXxTOuceAl35jbs4vGKYa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUV2YIDbXj+HdQ1u6QC4NF5vh2SA2VZsaERBklKksGCIRGxQB5tz+I6zMIZYkPwum/mFe+TsvvQ8xiNv5Q6PpNy/qV20z59myt5Qyb9O1kMFErGSFvtPMJcif6h5Yn4Y9SIwqX8zU9m5gnX5wWhy3Tmn0ddRrLulo+lmBdGfy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClJT30o5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IA7tjlX8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClJT30o5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IA7tjlX8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316aJI63103842
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBI7l9zOQxhycvPzhOFDQoTqc96GsNf9eLIJ5NTRHWs=; b=ClJT30o5TGzoJuEw
	DRHmI8SBcPR8/BKe0LQnKW2fN/A/1bu57CEvvKbjPAFK2rXAukpPNRoA7ydBongK
	SeEdzXY3RiA2chXjRkEHSjrx48QnaarcH8n8StJb1U4i4korDLdYWAS1IO080Kce
	0jhBeLBxqpq1r2FibPzFjYf4kz5O6QlLHhq2FgSdtSfT9uWoGKlAuzH7MivqDr0U
	UJQoo5OT8eXgbgo9n+w9PQiJJ8TkzflYS98Q5oY+L8D0e0PSqjBOHQ5frGYp9s4c
	F76M4EQN5NYFBp5TDaTvK3QalLfMVqgNu9DzsLdmjdUKzhXT5DHl58jr/+gStOCW
	S+l2Lg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23k43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:21:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5073ed1ec6fso23381311cf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035281; x=1775640081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBI7l9zOQxhycvPzhOFDQoTqc96GsNf9eLIJ5NTRHWs=;
        b=IA7tjlX8pkGfijPNMRnJrNMmbrsIcCk1l1YmQxZCPnvZatuIO76AP3FEoB/yj6xwk1
         5QWyTYIlgmKVtSYYM8GeLG/1YoWUgb254Kk8m/26CwOubaJCkSYu1w8rBOJXvLW0Qtf1
         lszsBwIkjazaXkIUFESqs8y25LnD+DMPN9BFyBCf0IfokBmuZnUU+s1TiVTn0ual2xBh
         KHQUUnAAe+d+PBN10UgqKt8oVyfETJFeps0dy/xiKVm/gOAr6HIw7S8BEzpLl9NYS48x
         fBULeBEvOlEJZ9W+zEGqIG5NLRQfy6z8Q2alwL0DoSj5THJarzGgXRXn2i0Kl1eQhNen
         8omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035281; x=1775640081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBI7l9zOQxhycvPzhOFDQoTqc96GsNf9eLIJ5NTRHWs=;
        b=eW2aUORS9JX1+Zz/jqzWjhUnjydRNrXDLgdVgGS+Gaj/SWRACc/Bd53ThmchNSfzLF
         4T/MlQm48nrxt9xEi3mqYz74knMN9CaOZfIm/7awkpmXlXMzsRWCt31RB6ZotZJ3reE7
         6lbolbaL9QWVmnViOzVQsNRVIAqm7mBy9NFARVe302KAFygWpiWSeJ5zmrJJbSfAbh8c
         CTpcFQ3as7cAyJkHzwwUbBrIECghx8wpDbyDU2M1l6QoGPsXR4JcUuthOTCfXZByYAS3
         J710dy+jomVbrCl9Np+tUGhOiKES2SAU0ZAqf/B4f78riaSnXEDGcAlPCxANfDVQvlkV
         Nxbg==
X-Forwarded-Encrypted: i=1; AJvYcCW7s/hGMIP7yH+ifyWWqFmlYKSg6o9ztiW2ag19GRKffT6zRiKkzBOGJnTLTR04v1Nsnf1J/y4tx3bL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7w+sPUYGcHHmf8JshQq7tj9IJi3bf6aqdfIf0xkGY3siW+syU
	OsNrJDRKVqtU1gaM/5FVa/3/NgCp7owtqMiXICs8BLSk8O+oUwszG3umR5546Nt6W2R+sblJrWJ
	ld/DsxBP4bpl/4Vtg0R1KwG/mNpY5TOb6P+nlzGL0C0/3VrLgpHZQPz1uYf3ZihMbKda2LJpp
X-Gm-Gg: ATEYQzwLeGbiwbMB+S9oPfITPU5SVrijwOoRaQ9F+w51jVjC2ZWGuBB6X8DUwSjCDnM
	E8PiH8Uf+8wDTnb/SfESw5I1Pw0Mh9rmPh+o39AgNyq0qat2U+R4qEFH6FGFn20oFqfEiIAIMpc
	v++p6PzVTPdQ1Z2RN4f6BKxe7kKeEJtZ8mDu6P/VXYmX4xoID7Evie3wIlRcdSE/0fTO1ILNpCQ
	07GJYdB2EJpcYR8uD3I4viHyUwr0g6/clZPPSoE6YuHxA0DQ4iO/5KAlGxjwOyQcBv9lHmN4aRa
	JrI59MoEtjrKff318jSqPAeFNW3+RGGKq3TKxmAQGYvhlhLJz0lmiI/FKxo5HGscrsZeScAXVVq
	rki9ho8VAokkpQANFD8D8UnLW4ru1yvCZT3meCggfcwTa9vSZEE9UoMD35znQ3ToUIhoGJr0XsB
	6fFy4=
X-Received: by 2002:a05:622a:98a:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50d3bccc4f5mr28589181cf.3.1775035280861;
        Wed, 01 Apr 2026 02:21:20 -0700 (PDT)
X-Received: by 2002:a05:622a:98a:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50d3bccc4f5mr28588951cf.3.1775035280472;
        Wed, 01 Apr 2026 02:21:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b227393sm498818666b.63.2026.04.01.02.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:21:19 -0700 (PDT)
Message-ID: <29c8b202-2d99-4cf6-b523-0363335b25e7@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:21:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -LQFJs-74TZwyeVwE9sO2i9taULHvjO9
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cce391 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qZ5ZlOtsQYTu7SIoqgkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX7+1x26BbC3Q2
 o6xkvaASBoHlgI5SRHbE5jIN5KghGQ2O5HVbEx5TQKSdYSlkHpj5CldWOlvRP9gHqv2tHZh+Zd1
 rdBaJw0RRcfV9y+08nUI7259uj33P3yXF7W7JG8VjoO9ULij4toPcjvLbUHtrZNojXJzoOoR0+x
 GO8Q3UOX3i+pK1lrXeitM07K84vRdd/o+L+wpiWo4sHKyv97jEpwrq5ATA21ZmH8E0DcWfES5eS
 uEFMv/Movn3az+aK588wFLpxd5Kg/Yt8VjxyidcnuHFkqvB5s0DS/UNHsoDxzWIr/vSQc08PA7i
 uG3fI5s2kFdjbF4pAJODT+Zoszvv55o/v/AQD6Cck+gnc6noc5FYNQc8pt3FlOwuxq+bBFqyvkK
 aLljDj4yQblCg8Kwd2Y8mwMqZuj7EJiKl0P2xfpIRyFzTzREqM+1QqCNsbZq5/7xYE3PEYYCiXX
 OrbkvqSYDhsNTENL0fg==
X-Proofpoint-GUID: -LQFJs-74TZwyeVwE9sO2i9taULHvjO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010082

On 4/1/26 11:15 AM, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
