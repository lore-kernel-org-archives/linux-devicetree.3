Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170294;
	b=aneJQcaivQbSbFgKIAd8JHEq5g1Bnz2RkVxFJR42itIFBDHlCppLGDmVbVcBNccQkaP0
	 IimWN1i8TdVcv4DlXb46jgJPbGljWEN9ZHg86S/c8OWuibljEJvDbOgnNCOO/f1HZcCAv
	 uXGhgvh9YAPy/mil55SnXSqdP9hkAh261O8eBwHdwF4Ts86/VIbwMQz8bz09Cygk3JRCS
	 6We5MWrAy+rbsLG2GrYNcZLF87mIl11Ljys3h1nfxG3MCL9+R/mhpee/SD8hsAgwNQwCu
	 s2uutKkfkluzlBdKT0MUNFMTIHl4weikFEVlGGQAKp0tmaj4f778Ito+BV8pmaOLZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
	b=p6SK8K8J0btkTT9+qgSvOlMlOBg6kxKiboQiHmD3u/xNPlhlqYMCx4fchmnANMLnr23y
	 DaPTWu1ZUN8eAWUb4gxvWr4DFc2WR0txc5y6VH3PwP8bNuxKPavCAGBHl2e0zYyh55V7N
	 WIYENBptPHPdkW8BVCG5VWkuP4iudge+C+lBPBd8tLT3rsbsWFe6YCvU9jdhrZFe19nPm
	 7bhDFJibI+2nydHkCGiPEZEK5d9fpCJObFR6+RysQBrPcDNnSKt7im0Q6gWkcpEXcCnQz
	 ocBFxuUHr/B9mPY8FR38iMzKIxGbWr3Xoi6s3OBBAPOqEZO0gafAP+b+L2EJcOJoxXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DEC606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DEC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqH91268340
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nzLBBCOxZ1CGRp+RMhrY4PNI
	yoFdbWP3uo3fOhLpR+M=; b=SZGJSzlKkGJfixKeNEsPTNljyBzvJyaS/5hdSHB1
	9rM8ZtPGEkkj8in3rfofoAdHvBmy8O/+607Gbc1oVWBDKXuQcu1aHQut77IsvCyO
	OXtg0eiJFci7SDAP+SiqwYsDmRq3c5AZwa5rXmZDcFQA4SWMnXK6WD+HHWBgfF9p
	2P9UX1NCgJ1oj9Pa17Skn0rGtocFp6jpBDduNPmsbmVzld7ERlR0sscD1UwpXkTz
	aak3cfVzsIKdNYkWDcfN9jRvzLZl7u8ZcCs4veNBs6yW415KblBsbtK67hEf2Y/A
	W67b6VS89lHcr5JFAhTHp59U1mpRFP19clbxirUnNzXSVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sxrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:24:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so84682985a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170292; x=1795775092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=YvlrrT+tqMldMGT6Q5jM7N6X0ZbDeEq7oihb24FRMFkYw61On/GcXeLXl+ZCVn8nzU
         /CM6reVFGVhwyf62GfRc6Zgz/D9b9fOvmBkjhmRiB2EY9nEfFtrXxvmGqwoXG5kdv8R6
         vg9nur+K0Z6H7DOCjnS/c4k64M+/rwcmdB31W5/SJSNft/PDlpypgaZ3txb3Hn7aShcG
         IXCPWRZtm8IQqWHa71cJLMyTj2JbsCSxj1klrDBVCn7hLLyGqiWyjwD/VK5E/R/wlYMp
         /dbkoEokIZkHc8H4FdSVAdcTCDPRbef60m61K3CpUBZGAv1rDqFaaGm2nGAsI+XRC/y2
         BE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170292; x=1795775092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=oekP3e+RujfgUs0K3uLBpc0+CKuGbFDknZolVga22SYd0qStHfKQTDUeriHmwx15cm
         3HJ1y8Jts/1wS7kBKw6eiinS/vwGJxvtOjUBzWzRZ1I6ps4HaIRJ7/1l1vi5uLR2kXnj
         2mqelqjfp7PGGH+g5kMTGqCWuYnFOEov7ztKykrwg3ZfPtvhLrao8weErBiL3sTTCq1K
         efUQXnY2ZsWaX0YCXv9n7HZZLQLmg812y+Ru/oVCjrJX8yD+m4WKGaapD5Uuw9igg1xZ
         S7hWs6067uphpILigyKJY2uhi1KheFi7IDLrl5OrThrKtb8Azs60Rcro6hvFiYdOjIOc
         piOw==
X-Forwarded-Encrypted: i=1; AL+hErGkl5Xs/gV0tdffbk1mZLmTy9YHAIEkiMo2RsC+1VgeRB4yxA+JM0/57CUGipqKeqQEaznMeUrfytnf@vger.kernel.org
X-Gm-Message-State: APuU4Z+4aNKERceyoC81zFld/9SMpnv/ZX976uVVm7uuicSWq8V5hwgw
	v3uXLx+2557AvYAETlZhE3OHh4FFjFXawmYsgm7buP0LIWJLP4smfDoOT5QTR+LDAyYJSKzenaZ
	wkM/517J4q8Y8jAMQ/NJ5mhTL6sQIZM+INDvsJaiLbC4J3CD8uKRJmcwTIWeWZbh1
X-Gm-Gg: AYBFou37ezhzH8aupw/gYL3oltqjn0HgLeb2h3Bi6duufVsDA8P06YLYH+7QybYQ/CN
	hDu9lmgYvj6LqDKRNp+Ot1jhk+yIbODgw9x5dzgtjR3g9IzuTS0MFdl2nEOlEHKx1kIvL6/PN9F
	vFgsVa56KkLkqjDLJ4stGC3ZZ2n1TNzCyl8RZJly8+XTLK9CIzVczjHuXHUe7HKbQLSsU9qmjZ7
	L0EaZsOLkzLI7Qi58wdFNXiyzgZ8f+VzQwlFAs+rGQYInDUUWGlhNUy7Viyt/OP7WkA77zI+Tuw
	Ygqna4aAyHYineNkAaH4XD3B7PM4tN6NzwmCFfWNA8ICqoW8s/TCqBgZ9DUWlT6r4jANUVKYKLW
	1kTEkdkjL6qKcRshoIhLe88jzKWdt+jO3Gb5c5hmaFDKs2tS0FkCQpgLjWi8Jxwwx
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462892485a.4.1795170291758;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462888785a.4.1795170291117;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm84205905e9.4.2026.11.20.02.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:24:50 -0800 (PST)
Date: Fri, 20 Nov 2026 12:24:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: venkat.yadlapati@yahoo.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Add support for Molokai
Message-ID: <ru6sqipsa7uv2schc3eejuasbk5pqfhpcac5eyq6wjbea6ryy5@7lu3miauiivo>
References: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
 <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b001ff4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=8lLAj3oif3jFirTb06IA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: g6i9GMexHBTbf1lCFokhEeKFWqihTYAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX1uIb8rK/SLNo
 Mxwn72EEABMSvv7F5TI0B0VJwE4jcE9SIb3StZ8SpX1Ows05XF0y8KKhxSKlokWY415Jy0dSDMZ
 RkNdZHEo9v/arpUmxoeqWtCC4MIwgQcWNIGRAe03Ri0vyGRA/hp2y7K11i/8b11gcmnhTanssyy
 hqM/TB0ObnkXroLva/dcedeiBDxlDXcSQRT0jNdnJGJ/KZwOrp218OqM7GOWnTKmy3xapJJSbkA
 4sFytqak/jc+DqmDNdehbF1n5HRMSqTu9S7faZXjMT3DTiQUqtQk9GtkaIISCcxHbUCGJlzSHRA
 yJHvdAIC8FiuLFasr40dFOunSVT0oWzHULq/Z2gh6rsIpyyYJPFF4FkJCSnE5wmamg080DSJiV4
 nPzQrZHhJqGUKE9dosLWQTKVsMbBCe7vAP277KnQBofqR5zoGAU3DHMowtV+LmV3gTvuoc2NC20
 6jhu9IQoWiPEtQHJmbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX4Qt4KvzpKlNL
 5tRIB0xkb2GWphiwHiMS/Elp3mKq0XcskZVFMAlHmrj4+EQzS0Lv2Es0Pqh0+hpK8zCumP/BGX5
 7Qjd2hepjZIMYo+cEYUja2zh/PNGMGQ=
X-Proofpoint-ORIG-GUID: g6i9GMexHBTbf1lCFokhEeKFWqihTYAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 01:49:28, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> The graphics clock controller of Molokai (SM8845) is the Kaanapali one,
> except for the PLL0 CONFIG_CTL_HI value and the CX accu shift, DPM and
> MEMNOC GFX branch clocks, which sit one register further. Handle it in
> the Kaanapali driver.
> 
> Assisted-by: LLM
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
