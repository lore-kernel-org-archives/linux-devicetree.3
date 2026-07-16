Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB0531A06C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215023; cv=none; b=s/Oc9PsG8ianTA1COPiJHSGkRCDoMPlnQuAqfsMWPNQnBWgt/HibZ3CLuVNaziOg1316+Wsb7jjVVPsdSFkN7l0SKzvND6I5jTO6HF5EpTZkyuw0Oh18PnUogOiXoBG90q177Bo3pDSZhOx/YOnRpg7nlDJnQYDA3v9ppJQZrRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215023; c=relaxed/simple;
	bh=Kt0kHWeOa2pc6HHNAuTm5CmqSOse/qvukTWTXllpwys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwjSPZ0jWftKnPUe/qG9G9US9TiTgcQhzMF/5NZg7MLKJ5ASUm1FqUKVK5M84Bvbr63ePwBv1Et828PAB/I/6gLyMgjtWBxaN4vjRkhT2Rznp87OI1IqP2YGm7rdP4RJxiPXAe19XRQEhVylWxrEwKofcseuESE8GV62pinBrqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIsG68q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpSxaZD6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIsG68q3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpSxaZD6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKLtG2857733
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=; b=BIsG68q3sOPos8S7
	4l+qmzIBNZrp/ZOfLZUOu3sWF0E7t85dkMttaOR/Ubd8NVZNJHKJHYlIMlBSFJAb
	5MeTcJdgJH8LoXJLFS5T1yqlG2v6kEJC7TNc8rmaLfbWIn9cQVYe5YSwntKWrflA
	Z5Sd2owNJRjU9Pkz3p+kUhLT+A+0E1acYQZaUsjf7yCcr2i2ai2yJlUZ0ZT/o2LI
	lbATLjetmPPEycnvVXGuNmU892C6K//rRhToC6FfDLSmZMykev56ViSh0+6sgyGQ
	Ahx9+lnxEQ0o4I8Di8mWhI5SMM/TJV2pS/hKBJRRe0y5ELBnZjTazIAhRHpxDa/0
	n80WLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex1v6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:17:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso20963585a.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784215019; x=1784819819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=;
        b=fpSxaZD6Qlfpg0OVtI+uh5NRvI4wEbaLD/B2ZFrG0bPdsJbt75OnXhR7OyDAqOeYA0
         knlQ5fc1cdC6YuIKwl2pzkvtkUKDe+UBN3nBpFEYqulsvGUKLORZGlGyHnkfsrZ/pLLA
         QF6k8qDRhirbTfyywRhVUlWZr35NqQYPq/oJmRsr8w3utDMp4NgTUb6e4jSdjFKagpgp
         3UUZTCVCc6BlPzETL+2Ya2vsR8wQPUaHomkPRRr8kosgPfhljPeq2030A7jFuu6y5VDc
         s5ITTqZFW3PYvUExZEUuKrFJr9xjW6jaEbEQ6c7U6ZlYzviu6zcheSSVfFvIYM893h95
         tInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784215019; x=1784819819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klO8wkpZdgbEWI4QguMUXZaM7Y8s1/o1IXoK57HQAZ0=;
        b=A73Ne8igwQnY0GiNMXTHm6NzE98B//tNruCNBflfQWIBCZa0QnZXZYrEKJpA3w6aaE
         So1DLE110QvSjaoaMMbCgYUickzJjctdiq4BI/3kn109ot5HzoCbNiS4W0xJ5aHp5mRZ
         vq0hJADA/CGj6sOQw4nKBzbOnIG9DdUXpYFp0WWCloRfv68R58zamK0jGC9zOdc9HwM1
         I+uQ8nYdHlnbIzrsMb4NT0n+PAarZpCfyY9DjVFmiILxqc4nX44ZDZqY7T88IKYC/zd7
         fQFUVQm1HKq++vq/t6bEx82uMyJ9lJ0GET5F7fp4/hM3uhGqBBYiSj2q5nFvT4sm2fYU
         7dBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/DSOKkOHNA/RE3nEPEulsDfCyOTVr+nuMgjTivSFkBjooBEqb7FgOEz0f+EELHGE2xjDtNmSbqha/@vger.kernel.org
X-Gm-Message-State: AOJu0YzvGOYRrXDE0KZ0JeM1UlR/0R0mVH0UrhcGqfB0lUtkRa85OYMI
	g5JmEXbfSd/56ncIVIDo1p2Ks2LTFoQzjq5wsD6NlXaNIzBP5eWDai1k9e7XSzMwYKxH3VK8HPx
	/B6YU/Q0Q7ivKoC5XfmTqAcBR9UtjXSn1fvRTQiyiuwjjAORC1r2VlfxsSCmeSZB1jZatAJSA
X-Gm-Gg: AfdE7cnQ0pK/T6Nt7UhxwIYVyVn/spZZ0j+A7jeXc2LkZOgv92qWc3Sdc3UNHsJDDdk
	oJrgX+rI2BzyYrqXeQqVbliqlVtMol8fUMY6NHJ2LUzRNmhelX5gzAjKL0Q2cl28ZOtka2L4LMo
	EKY6CEsaquTUkfUsCPeyagdcod771rkWNNDJQ2AWlhVEwFoiS6nP1tW+Osuki2J84c0FQlBeiQ4
	BnKu6uXNBDR06O6rsLQsKWq+SxBMGurSIZEH/pm8NxjAB+69FvVBpBhDtITjengDI5BZRtQFvZ7
	qgYCVFyK9mgPrj/RukdQksGWGmLIer11ApOF1+83bqhj0uxOtZioSCItF8Mw8GZq0exe4LezRFq
	hPOmwMRfqR4WvsPjWp1cDtkv9
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr1865661485a.7.1784215019500;
        Thu, 16 Jul 2026 08:16:59 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr1865658885a.7.1784215019078;
        Thu, 16 Jul 2026 08:16:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871264basm238140066b.7.2026.07.16.08.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 08:16:58 -0700 (PDT)
Message-ID: <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:16:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a58f5ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5FnEwOx_HHoQhKJlLkoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: O1epISExZBVEYCHWh6slcNckNVjawTtK
X-Proofpoint-GUID: O1epISExZBVEYCHWh6slcNckNVjawTtK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX3HQ66kzzKdk2
 BWhWRnnvR5zSboE908idSp6HPZmCJgDO1bJBXe9w1z2dXbJt1d2bdj843TQmGMQzF4p4iXx40Z+
 78oEdWoDRkvJlrzD7EJJc3/aK5TCzWg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX4p70M1d+eQ1U
 ktXH841rwlP1unHreSdgiuYYkrKIeuQeob9g/wlRljATxpCl3SPdddQLb+zCMfGo5MePHhZVLgw
 02g8VvUQNctRfN5cCBSHBVvLmqLtskEYIfxFKEpUZpjjIUlHYxNUm2KDQJj98vMYBWnsJ5sxLgN
 00HQ+szv8lR3rwG+K8PTY5xDPOo/pgYXAt2wZZa++KyKedrwdVFTYvBS0+LVN/b8bbC6moQb5Ea
 r97I06dO4hc2Znp9JMI8S3q35/areO+FFzxU2mRGL7PY22n+0yHN2cjPek8GaIbnCiU2E+n8oET
 i42cGEmXi9RmBvXZYNYSwkMsG0nbcIs06JUpxifuzz5jzfbICS1kj+i1ONKZXRJ3GisFGXh5kcj
 ltuOoRVSkMrentbeFGEbhxSJICM+Yk4Gm3DHnwHeWOfOcHg5GExO5mvoXD5K2kOGQWVK4XC+006
 KQhgESlDYkeNfRdJfbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160156

On 7/7/26 12:12 PM, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..9ec7c256b80a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
>  			no-map;
>  		};
>  
> -		soccpdtb_mem: soccpdtb@892e0000 {
> -			reg = <0x0 0x892e0000 0x0 0x20000>;
> +		soccp_mem: soccp@88e00000 {
> +			reg = <0x0 0x88e00000 0x0 0x400000>;
>  			no-map;
>  		};
>  
> -		soccp_mem: soccp@89300000 {
> -			reg = <0x0 0x89300000 0x0 0x400000>;
> +		soccpdtb_mem: soccpdtb@89200000 {
> +			reg = <0x0 0x89200000 0x0 0x20000>;
>  			no-map;
>  		};

The updated regions point to "SOCCP Boot [DTB]", whereas the old
regions point to "SOCCP [DTB]". I'm assuming HLOS potentially loading
FW to the boot regions is fine?

Konrad
