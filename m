Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D83A1698
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654809; cv=none; b=etOce42GMjSnT/umCjcUxFTH+A+JhSPPZ7iPxyo/l3IKvJdeaBn3Zy8LJ/AaQls0odUBnPSCvmkVyhlP34rc+FnPsmR0LMx+zrBpbhPUdz5pJagnfbTsn6tWnRk3W7iC0yNMLnfX5azz++OZpc3v3gP/LrhlNqIpsB4LjvPg8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654809; c=relaxed/simple;
	bh=31+Nn+H1zvkXMEJm7djV33Cf9S+18OFYs4CwkmVXFjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5cdUcQWIG2dUTcQHS4DOOjv4X98dVSxe/yMHA9Ukw6y5Qr7cfcWyI9d0Ti/cnu/l7sryc+Hv16DYqyWwGZAK71xtClRmoWL1S8nnVJ84tue7YqDFY2xi7NJ4GUex6GBwZ/aPDL84IXvWyW/hBS3pVWyLyIqNgVUCQI5OCkjTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHQ441be; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiCFG78F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHQ441be";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiCFG78F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638C2V242451717
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 13:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=; b=AHQ441beUejrIpys
	SHlVQUTy4Y49IKQyqQaWNrdqhpAJi0Lxxr6xUhIGOj60a4oHca5+k2s1c78VV0v4
	1p02lw6jeWxmSBSj1jKXW6PujcomwaYCZQ7W81MAm+/eQ42Sd8pvnUYqeUM4//gu
	bXbCRnQCHGUNz4yJDXosi8iXKw+pP5rIi8jRclBE3++/Gw3tXECUiiiRe9usTq53
	UZ6k1g1HfffMpr1xUlXuMKOBtfW+B1oyEWTSPKkrMd8YU2Wnbyb1MavpqTg7OxSg
	mkJd3PzlrFZ3oDEV8k/MDGTzzsWqYaWwwWJ1d4s34rY0pBaUnx2BWvJOtkgFMS3G
	Jyyvag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae6ax19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 13:26:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b32feb719so8907071cf.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654806; x=1776259606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=;
        b=CiCFG78FtEa1+FVeWoThhvVu2r0qE9smTIn1+bNZYqUcXZ1pO7DumvEOIWDsUo/JWI
         8D9u5Q6fDtBQSa+uZ/S6TP5cDnkLYuJ5hHOtC+LTul2bK0W93gDSFFwY3UcjOnlAUFii
         EkD/JpskajK4zKvI+oOBiFjF+4ovx4zRm2sYzyFtktu+OzU79tYe6rkcj39xebsVExCx
         3o/KaGc3xoeI1rFdxKNxiSVAhv+s0wLm81j9UiVqKP07jwCJbg9dbwRHWS8rlZbLrSJd
         KAu0ugjupLXhUrzLaCDnP53zH8uoCLSKkESUmN74rXhjOqsdd2k/xcuFpXR453WB+WY5
         T+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654806; x=1776259606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUsI0vRt/h3JRrI0+01jviA1yqiyNxPW3ZUL83X8HrI=;
        b=iYUs5tZgRqFVREsZpuoMbhjXynC1TJ5cb21h85aDbfc05U/2uXT3bfs6avsZ6BwuiZ
         OgDKVMooTExTWTYAJnUXaTzenKvlsrxXY0BHmB5pWa8B+jfVzjOwYbAZH+/tPdF+s9XI
         IJXLAPVccbd/TP2HIRn1sm2K+qLHX7UbUeT0n1JvZ0o+6DBhqdbB0yP9ZWGLkecsjAAW
         qZuP1cs5uFR3ZovNtc83fb/8QrK0GQ1hpnCx5MvVEIT2Vk39OpouJOoV/ICMUaoP/3uX
         pxeqoA/KDvl2SnY/qMmPRv+zosKWIUJZYkBh5MrAFY6qwR4yMWZNeYG2A2SNuxuehToj
         166g==
X-Forwarded-Encrypted: i=1; AJvYcCUEKDNOfy+HRl44YkCNBWLAbEd3AXW3Bd+KE9lyGN2CeWtbODgr4QyzsjXUhaVUwgRe0c+8AhNO6XTA@vger.kernel.org
X-Gm-Message-State: AOJu0YwHdcDh79d5Y1t1PsM3jDPj0Pg99Vs+D/0fLd0Z0ipjc1cmGDAM
	JHMu9Kcvg8hYKzS/htjrM1MQuyLv+hy/nk4Eh12+uctEQWSYDgVhAEYeUrEFox2QgiRw1CHSe2P
	nDBaQKFNl0y330ocDxlLvh8WurqaK5PFbWx4UabY9V/OeBUx4RiDpUlRZ1DVPVTi0
X-Gm-Gg: AeBDievH+qLTPx3AykMDXC6e7XCAXPYrlVVX1BWyAK9lybC1b7ukANG+DiEDq0IaVaD
	pHHVKvKnljMXH4NKQD1o3Lkzi0yYtDz6hbBqhGob5JD6d/Ao9KmYWnzjR1TwMAqZTH/n1zXXIUW
	M98C961Ibvjpnd05UvJ3AhlVVazwBSLjIqvZF8pkyrH/FIzTrsrRtSArxprVzfEYH9lk7HkDAxO
	3xP0YZSkRno4Eo4NsQU3Q3MEgJAZeGNOeRNRDG/83IdQztybFDd6WEUk0EwsqVzxQqmdKZfWoAZ
	1W4QXZjielUo0ELBMNWlP9+tg2Dk7vO3TZzshosx/sf/KcXl6VYoY2yhSNx0dU3IF9cH34xLWWC
	14Ta8V/zhpUJvx0HgIZTw7e0K5+lvO8pwBTEQEpvcv5fwT1EGTt3IooOF+uuP2Qg7pU9XD1TUck
	KLntU=
X-Received: by 2002:a05:622a:11c4:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50d62d30eb2mr224219931cf.8.1775654806128;
        Wed, 08 Apr 2026 06:26:46 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50d62d30eb2mr224219471cf.8.1775654805544;
        Wed, 08 Apr 2026 06:26:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028995sm646292166b.57.2026.04.08.06.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:26:44 -0700 (PDT)
Message-ID: <1a6e1819-cce3-4e08-8cf6-2cc3a8abeb74@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:26:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
 <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyNCBTYWx0ZWRfX7nALh4wHC8QE
 /m/IwfZ/U0ZD0ypxrECoOe9TiJxOX6LNoj5PaQQcyF+WWN1VjpkqnGxZ9cq2BTzgyiOKTOWoSXw
 2H+tBNB4gkBYsPpmt6ajIkntOos5RN1xisEpw8nNIw3VITwjxSkXlbklVYKUnx9R6eR4GKZAQkL
 OHfiYJazy8WA1Ax3gGCh40KUH62oa6zWTro5JSEuouLd5rPrBP9As9AOymctvvHrCvih1cdxWVV
 Yf1OR686C1OakwG54cG4KKl4Yi9rIsYcwqhFanZzIUbwNGFK8xljfqTYeQGFFBVOBGFVtv4LdnY
 7ziYr/fCjoMfbinx31KUdwXkN92KNXzTDODyOHRCRBkrPpwoXxpsUAQ3P4KcB0onzI5i939wQds
 1hmn/s6QjA4JUrQeOmtr1xorcHrvzqRBvADj/btJdYqlg7FskcDQHbShrGoFpgylZ8pgvF0m9vV
 1YI4dUhfALwi+9XFsfg==
X-Proofpoint-GUID: WAs834i4Uutk4TxNj9IVC3w2H2iuKjIe
X-Proofpoint-ORIG-GUID: WAs834i4Uutk4TxNj9IVC3w2H2iuKjIe
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d65796 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=pLXVy_XSri54llwUxOQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080124

On 4/7/26 5:11 PM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Not happy about the names of the subnodes. pil-reloc-sram is not allowed
> it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?

Not really.. I had a patch for that, I'll send it rn

Konrad
