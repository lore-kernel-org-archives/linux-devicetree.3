Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63A346E46
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836517; cv=none; b=aC8+Y6w7/OcGSdtFD9WWiyGLFcCgbHyuVgtPYLPhEKbpVk/iQrxh5/SccWWCwH6LvKo5r7aN17Sl98hsmgnEUqAAc+clE2SNupxbUv7PMC/YSfYF178APYKtVDSLlO8nGUflw/2y0zNKaU95HEP0Kb/AjIFnh5pATSgCLsn+gnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836517; c=relaxed/simple;
	bh=NefE/0kJbsphrvHNNstIdOu1bVoutl8ZbcpsZB2T93w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUUyBoJc5/vJocMT7Z65jeuHtXLjH/D0qBizQ9C34eKljMs1C6UqPxIP9NXYiub6FuIKR4grplxVvuBkCRaxLOc7w+tPaNKqtNOscFrXftMQE39J/JaVJw0EUgcHVVRrVfVhuoh70YB+hAX3439wTJUHeZloZnZ+PcNeGwwte34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NB1iufjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0mwwwz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NB1iufjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0mwwwz8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5aW6s3219669
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DricSgktW3Hs5pfjuBgwQwCFVfVZNp5DndSxnqXR+jY=; b=NB1iufjrr56CLtmU
	DW6hKq1muFQJq45D1cO9UrcRZsUHxAs/FVzYihVHZZiMLiPNZTvEAe5gMGUViQvs
	NBFEcvtiGeVPQqtHeTku0kG3huflZWmOJkK93fldYlXZXlHgDJ2t8B2C2wNCSFaa
	4ZPVWMXrIv/NOKphe3BQVAzfSUIi5mjlSDXnKx+SfgLSvh8odO8iA39QRyV8HIUq
	/bNWkF6lH68T6AKT7no45pEaj0GxRl1sdy8pXfNUI4ZhTWrdL4EB95ZUF72MH82l
	Kt8OR+nWxcZyZgIkEUni4Dk3VbP+cwQm6pXpcfnfxNMAbnNMaR/k1I/5nAHxZtH0
	DD9QRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2j2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:15:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba054e0304so5844245ad.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836513; x=1779441313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DricSgktW3Hs5pfjuBgwQwCFVfVZNp5DndSxnqXR+jY=;
        b=Z0mwwwz87gqeTXQNoMzGL0VTCjOryRiZNvJom4QVahBKJeEWE+0PeYYh9GDTGN3s7q
         ntzJWDrovyjFnKkkr/n0LHvT21z1wElARiXLeSYeXKAUp4/4Gxdblbfhn1MUvOtElFNe
         lTXVnsu/GuKW8OVivXgvTu2naGw2Z/mp07ame60RTxEmYU/pbVhkHZDqceHZHlzvGgKe
         8bWBywwf9SIN322U0BQ+D9GkEJsr0ox1/KuG7TdgKdIzTFl5jbDGCXgkxfgt1F35BgWW
         /5GTsNcj/UjB3qNmMhGSkfyLZkT8VQ7nnJToqD3gKbjx+PfTIPl4j8WoZm99LIv+sg/u
         yJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836513; x=1779441313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DricSgktW3Hs5pfjuBgwQwCFVfVZNp5DndSxnqXR+jY=;
        b=Gg2mszeYPF5YFU3MCFnAqdqH/COW8yFM4XBTVKlV6IgYyLnPejQGRBVDg8xmdzEp1q
         mXhKpmgMeM70nG/Z+FYtlJz2moMieXM4kOOrWZmOHscj17w0RBiUlJwfM0QD3h5o8nSB
         03l6cGCcdkiOH+C3epioxkhrkyh+ARkcFQeuzugHy29hjVf+EmeTimuSrHhQGAANuFKv
         NrNXA0VZGWV6PHWC46o1MXrqpf9Y/3Da4WqJZvh/5c1gUlYz86SU4a/v2SBl+2Ap+3ZI
         rtrRS0cU9JPlDwiGKAHmJZuHJW5iM2LF3j/f0kb7NtJJFTOThen82mPh9KBYrN1A4wjI
         0q0A==
X-Forwarded-Encrypted: i=1; AFNElJ/xbFHgWYw927s9Xymmr9DBFoSU/J6XiWJoE6jN8QrJQRo5h47NvwTCbiFX4Za3q5Ufu6r41t+MFhcw@vger.kernel.org
X-Gm-Message-State: AOJu0YwmbxamNvpfJnZEv2P6QowgpSpgS6GdJwhTvKU/hj25PdoE6PD8
	wd5IgUyghPdldoUweZjeGy57dgyUZ4xC8wu4CVSPrQ/9EwR0JvcSbAQ8Ybf/AOhylGYneKvX8Ny
	/Q7ylACwAmgn+tTtlszBpRe/b35vbiAkZvG4qO+0hRk+tErq2zCKe/CU/2V96lGGi
X-Gm-Gg: Acq92OHrdhx4xrn3ccVj6VVoQp5IibBg09DYZR4Jb9Lg19JmihzgwXSIKIZIJJ5usWi
	ZRFjv7VC7OABP+ZhIWgHWzxoItEVYrq4/ySX63R7B6hku6yClP6ZpBKSxqz+xcpVZWlZaZdv4R3
	T9c0qGZzxEFwwwd42KWUGgK5WAeXwYtPUxrVHP/cEy7VDUI7w7xw1JsDsD0kHYee1vffhV5vxol
	1fZStSx9hhDsMJimCWLjkP56IoXo9/IfFzj2joUZORG6YEI3VLFWGnX0vLvW6ui9iQxPEH3cg74
	jRVX4EjSqlLajYWQYodptNdI6rE6KhN1mwUGy3xPftxiLHOJEVRmY7mjpM/U32vle6bCzT4u4k6
	Kkz88Rya2HpJpXQB8RpW/fIg0OMEqlnFGyoBRmZ6Wfl4G+8mGrXaXYj41P8vEdfbRgg==
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr48358885ad.14.1778836513362;
        Fri, 15 May 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr48358635ad.14.1778836512834;
        Fri, 15 May 2026 02:15:12 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm54607235ad.28.2026.05.15.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:15:12 -0700 (PDT)
Message-ID: <adc65162-c0fd-4eb6-a2a5-bd0d04e7ad7b@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:45:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650 TCSR
 block
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-ipq9650_tcsr_binding-v1-1-a41f612da54a@oss.qualcomm.com>
 <20260515-flawless-space-groundhog-0fcfaf@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260515-flawless-space-groundhog-0fcfaf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MiBTYWx0ZWRfX4ANric1pr6aF
 fwRM2FJwgQ4q7EKIH9XRuhiF6U+xUPypnZrVIcNM1NQvTFqOJ27xu5EXBfMaRgfEtmitzhbFPxM
 6hEO5VR1LFOnCqordbXazOg4Q6e/DMtBwgpiUzpluxWrsZRYSXVQo2tTtZDAYpTNT8kljv/6fxW
 DNO7ZWxB08GUYYI0goC5ZUlBfQE+QPhA5QTy7vr+heOAAcW5Zf6K1uy2HvBVWh1MPhl0EucLF5H
 AgGF7/+LwAyfWc1KHW+dNJQam1viqtmJsajUhsK1xQFnWIJBOHPSRzJhLBfELnvXQOH4fxcySSN
 XIAj3DqIiROztraExEfIVGd3L8DoAlRcF5aiOdx1+R/8Y0n0ECseKuU8L8vqpZ+3KRb3Jh6yN0c
 hckymOWrf9FZ5ibzBd7hg+CoWNdWmFQCwcj8dI+kt31aPKakdd1TklT1ECZQKxPPaIdi/tjj19O
 041GAoJYjbOMHx6VSzQ==
X-Proofpoint-GUID: BUmJK4yaMoI3uLOd8R_C4MkNNFS9bmOb
X-Proofpoint-ORIG-GUID: BUmJK4yaMoI3uLOd8R_C4MkNNFS9bmOb
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06e422 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z6vG9Vk2bhGQ9zti1q0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150092


On 5/15/2026 1:52 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 10:28:04PM +0530, Kathiravan Thirumoorthy wrote:
>> Document the TCSR block found on the Qualcomm's IPQ9650 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> NAK, I said it way too many times. You just sent COMPLETELY separately
> IPQ5210 and on the same day, completely separately this patch.
>
> I gave this feedback publicly and internally to Qualcomm already
> multiple times.
>
> NAK

Apologies. I should have sent both IPQ9650 and IPQ5210 bindings 
together. Will take care of this.

>
> Best regards,
> Krzysztof
>
