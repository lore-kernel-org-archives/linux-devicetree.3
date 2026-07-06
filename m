Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B74F346AE3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322248; cv=none; b=KT63LQpH0QhiHgcVHbkiVIRXQKFfO+i/+wGEENalvOqcuq3NJLOT3EhdDXmhPpy1Pdhjbw8eifbAO5SgjwopgnrdWsbQ8awbuJFzXJUFmugxB6UglXwRMr6piaF9X/KW2cay2xikqRQCEUfXEE3wCjrtTUU3LeKLSxEf+xAUP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322248; c=relaxed/simple;
	bh=TrosSIkA8zcvisBjf1v81eYJN7X91JBl+nNpD+xIHeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JF3AXkUHFX21fkOo9p1FuTPyTH9/Lak85oOxa9zzlijp4AyZoM+wFO4ot1DQJY4dTTDs8KwtHeGUxrwvcf4uD4Mt4dcACK/Kwcnfj8343ejqaFPVePNJBuqKnEKdJuBM/IOzs6fnOdhZb/h+9+E05ScsprbIql5uZa3nt6OCEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiX97yx3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baKT1MDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiX97yx3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baKT1MDP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666420rx3595058
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ol0lAZcpxm+72VcWnoDUZEtqTZ4u+FEu/knKGZeZ3qw=; b=EiX97yx3+PgvRKHn
	nd1vYRkMGiEObl2ApunJlC+i5L3/AlpXvUsjALB7b5dp6L3qDKgzxkv2lHRm3g9H
	4OeHguC69J6xNE9bDeMDgVYjCq0qfTRXPEglHgCSMbFDBc9yHtAkD6Yeik8h/mdB
	9Gas1uBs/FFwA3MmYRoESkpZpVnkQWQ8jZ3vhxg2FJRYrd4Nx2oE070cMH+RMzQP
	2kb6v+t/L1Xdgino3IVA+RTIM8cwYS+nrpuWrJM1hfMeSnSEmBxVDa58Mqt0ue2y
	/bXFgdG8zZ8dX2U27EvTxLHGuhg/mulgjkp2p1U8p1iD9rB0fDVag3udYfImxkOy
	VkoNfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwakp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:17:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91ed0e140c5so493387785a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322237; x=1783927037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ol0lAZcpxm+72VcWnoDUZEtqTZ4u+FEu/knKGZeZ3qw=;
        b=baKT1MDPHuDph9U5oKDmR8lncUnkdUwQFswRLLJ9Ib/rJ46ETkHsl0h2x3ZlrNgb1o
         33CjQFD1uYRSpUVVUNQVSq8dbH5I2n4FkcDn2PHvJdYjstTO9FF56MM1mBG/7BoaVZY8
         BhWuJnsxs/+pGFyuK2i82/iXzIf1i695zo9oYdcyxQ+SEegvZbtTei3EOYB2ghccAR2F
         lqrrmTa3ZEq6HFfDaVF501cfulXOeGt8s5wqyQv8LlWQ+aZXOLleGaLJIFf6kLopzKgd
         7JrNAh8KDUIPCTh1jm6hQEP3XtYIT9ClkW6+ZKveD3h687HBZpEEPuzaLYpmpbxafyX9
         jv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322237; x=1783927037;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol0lAZcpxm+72VcWnoDUZEtqTZ4u+FEu/knKGZeZ3qw=;
        b=n6/iF+WHNE2goW0SyZquFPYmZxjTitzpebDP9ExNFnE+lnx3z4x7UBAHWI09W6+e7o
         bGJTMSMsjQivSnnNrtQso6pt6gsRmG68c9UroFBGJikvImk6ipbD5PnjoylIryAwuJuz
         SJPM7a2u7S1Gc2Hrr8K9iJFNnYkYVtCZd+eLt9BMnrPcUfxxwIilzX9n9tmgr9N0QJqf
         xEuIMId8HoB8OryziIbtSwtmrxOmfL2DrP7o08bvm2Em0I0z69fnxRNlAU1ckQqoVU4X
         CVicMdN/mOeHBrHGv32eu2QXiiFq6XMZIrg5Hsq9NeK9K5rm0vOVT7iB0EQp1M5g03hk
         mIWg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/GBVWRSDg4q4Gag7gNhhfWhHGUzz/i63g8tBht6PEZnymtD2dxMhQUHXkuJrwIqmYffFNbk7rHQHU@vger.kernel.org
X-Gm-Message-State: AOJu0YyUi9Sgwx6XQy6aaBpZNii/WZAbzUKl5X24yEvguPJ8goE7F1VN
	dHTCj3166uUF2BzY2UR1F1BdIQGKSbJAqIsiBhaJ+eT21ygJjpESs60EBjX1YxOoxlHvG+/YYil
	szOo6lT3WIRCi47ietxZs3S0vuGGM3goPXMWBsswJNxUTl97H7HcRWt4rMj7ucZGo
X-Gm-Gg: AfdE7cm7pU2RVWo/12BMjmnFLNWXx9NRy+Dk/wbhw/dtf1UxiF3FESDL1NM+K4f0os2
	vrs9eiKB+uU2nH4XL6PT+IxspSxNACJKBmOasN8bVbZrl9DmPasG/IVEXO5zakWCMNeTaDkrM0/
	xhC++7+pg94Kuq9wMGqDrhRJtiXtJgscWLdBxzPKupPWxBoPzn9HIpeuutdNAdEcaYKzb5q6s1I
	V9LQhJwMPbRjRVZm/gJdt0y+DYlFEp7YQCR/Oyi18J2rfhpQ7nZ9K21U/1mToFzPkpxjx5nrinh
	9UAKeCVdubFy6Sxpu0GHyWP4Vi53iJGIXJchqZaMsMXS0hGyLo/ggEUbL+cF+fWY/N2EsRmQf5/
	AnMwJtxCejr5tnE8yMcLWluH+9ymCyczcmyHjCvOP
X-Received: by 2002:a05:620a:1710:b0:915:4211:baa1 with SMTP id af79cd13be357-92e9a3e1c78mr1094812085a.33.1783322237020;
        Mon, 06 Jul 2026 00:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1710:b0:915:4211:baa1 with SMTP id af79cd13be357-92e9a3e1c78mr1094810585a.33.1783322236644;
        Mon, 06 Jul 2026 00:17:16 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb62d3sm280504225e9.8.2026.07.06.00.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:17:15 -0700 (PDT)
Message-ID: <68b98abf-4cd9-4906-a774-2b798c4576bb@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:17:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b567e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=-bRoeWwJ9r4bXZd27MwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: O9SOm-fnlQdGCzNpXW38JKfpFn9ECrDI
X-Proofpoint-GUID: O9SOm-fnlQdGCzNpXW38JKfpFn9ECrDI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX/ar7Y44fhmVr
 szcXva6tnfc4KEnS8cPUtMQnLo97vaQnxb7bEmNuqrjPsO2DRLr7UjE4kJaN6S8l7ghhIzhhcvi
 EF2H3TovnXAXy4sWCU38q4MPOktYVBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX7exoL1mvxYxL
 AjCdrHvXGWREF5cNJiJ7UYp2TDurSOEajpwpcgUmwWXbag8yV+Zzplyfq4726LWyACvbIFXfoju
 FRj0ysA0OCkhjAImM9Hm/Qmbvqi/00OSbBJxAdRe1/Y5K9fkaEqZPJihmqbrZ8eS0nf8NJixSZx
 W4NBd5wtXl6ijEZ96TjKELwuSb89+RVbBkLx/ysQjngYmL7Z4ujb+ZE51/K6FSXlGWO5vU9cbtG
 l3waJGLYDpKlppBmpmvb8M+5sEpFkuxwMsHTm3n4dyeg+OFxBtDFFk1djmmKIXZSafUxPbiOQcJ
 HEQ9k8K0qxAdaapUHzouSYJ1vG26psNdZwZf4aFqHEt6qQMEWAcaTTY34Uc/x25BuR0v/LKZ5eE
 egD9kv9qLpxmeiuR9SdgaFLGk6Z2b9yqMFVCM5r1pxi8xlAVmI3zUpSBJjKNmMKBEnD012O9gPB
 7kHvEwSeoSIlqQhEnpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060071

On 06/07/2026 09:03, Krzysztof Kozlowski wrote:
> index 7393978926e4..0796d9dbe158 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -136,7 +136,7 @@ ramoops@81f20000 {
>  		 * ABL is powering down display and controller if this node is
>  		 * not named exactly "splash_region".
>  		 */

If I only read comments... This will cause DTS style checker warning.

Honestly, we should not accept such code. Bootloader vendors were told
about ABI, they just ignore the problem because they can get away with it.

> -		splash_region@e3940000 {
> +		splash@e3940000 {
>  			reg = <0x0 0xe3940000 0x0 0x2b00000>;
>  			no-map;
>  		};

Best regards,
Krzysztof
