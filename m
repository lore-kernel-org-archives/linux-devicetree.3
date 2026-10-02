Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DA472F73
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934413; cv=none; b=J9udQr1ZfXjgpZJrQNR57L0GS3+D+NfBXoGqwRjBAqslAxzVGJQlEJIMwCaUM3Rt6xEEPLMPZNnw2GzUl9LQ/CeLICfwVdFvZ7fk9ymQSMBG2VsZYv8YqgIle0wLdiDwaSlATWi0ubMpDz2AgIT67eXZicHn5ZEtQEH3gbKIl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934413; c=relaxed/simple;
	bh=Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJsZLx/+9duVTbLgZNuoGZaY9aGlQl/ATZ5FZ7vjO/RPA0dRbO5Xqz4tDrOiDokfPbaqxmdel+hBnFFnIOW48nAYKRy6SxpeyjXrTW3Un8U1zg3jf9q5DqOW3B0tYXUq9rDCi8OqQUiOKH8ycXRomjpkNKPrQTB6Je6TYdrIC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJxH3DW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qeo1EHDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJxH3DW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qeo1EHDs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j5pO437874
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 09:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=; b=TJxH3DW5VQvQGWRb
	aN8zeETZHirij+rlmEUYFDVOJVhV9JWOA9CQUgQLcR33ujzbzy8JFf6XEoeT/7Sz
	vEgCOJYygixoBYOjozJOi9yxHJgEnvOw7CqpOD2lQNQ0uPxcOYUBPRWoJhI4TDH8
	BAMb9OoFrqFmGaF2SAnyqaFvmDoOyvRuV9emx0GgYQRbmNMkOiKGW+smY69pY6Lp
	2zVq73ZrYW2SYsuysj3eBTU0XCp0yUGCGJjy06l4ZAnq0el8F8oT/sOBjJiTUhQl
	u4s2StU0px3WJwIrHhRQ8jEVMMPoyAJIrWPmaLyTpe4fzwm9iTjmXRgijzQ/jtJA
	mC2+JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdckwgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:46:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1830507085a.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934407; x=1791539207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=;
        b=Qeo1EHDsRyYmgYQ9Y/ELBRN/laKZY0K8m9QeQ2fiDoY1aZGo/nzLXmzU1nQznDLWt9
         dKB+DxI7AUm0DVRX7PtmU3c3l1xn/XxLOV1Us5UwatmaD/oR1vz1qsabvPVU76XL7hbM
         R1S6VmY3dAJv2B335TQBEbEnbCL0xmt804jNQTl5pRIhppc5mat6Zftd0U921W9eBnWU
         gUV6xt4kks4PpnG8NvqrclZeucgp5Ljfdo3lKDrx/ZFvijtORA17/dePlIW69q5Wjvtg
         8Cmb0h7GEeBq3U8VNEHcLaH1UDkZ4joQm/cnCGXH2H04AUi8LiW3L6/Ob1Cj6xuC1MST
         1RXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934407; x=1791539207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=;
        b=j1srPXMEowDmzdbNeOuYieLrKbpAudX10VpSevWZlSUrueeVDdhNcBa0vUrLWDkcct
         akudyx6JHSJ2HHZ0mTDuj4VoWuLBHhwF8wkgW8z+F9p5LGmndsi474YOhvHuap1yQex1
         iMZ69K7j/BI9fgLT/fqFL8GzAdSMcn49fdfT2KXYxeaG5l3f7zFL84bdi+cZBJtSpEhH
         5MuJKiI+8fuR2ZMHHIEImp5bpUsPLlRdt0S1w8VW19RTPBAgB5eiVXNPQMcm2X1+PTod
         rUuju+tf7vaXcAGAb/B7qad4YFw2MN18gnLiNhRzoyslrhlYvIZPQ0pBCOuB2RV8NHM7
         Wr7Q==
X-Gm-Message-State: AFuF++kyxdu6Im8hZqtIqttxM4/4vN5UbNtE1RH9EMdA6mhIozOUkBqy
	6FFLn7rHjiKZN70ju5AeqjqoNIsmOo7D9BehVm6ROTEXZmwVD4JtFtlMrIu7YyrIs8Lb2O6OSkd
	D+ecWRGOOLkQoR8R4LepKK+bi9LPQuvlYK3KIg7BJQLFRIHa4eJy6rox/GKkD1ur815SurJGB
X-Gm-Gg: AYBFou1nacPcBQYJHtsnddjNwOQJtsYjKiY4kOjOyXDjZkapH+vceivWSWhem4Sqyfk
	RdxzqaPWPKyfGj5ephJRzHzH0LWwA3eh/I5iASy4Hqi/l86k0MZyS3ERmBKlwsn+KxcZ62uYXbf
	/mkI8pG/xM3hKOvcYNmBayDsg8n2ql/d/O3Q2XTJD7LMtd+wCztYIEpYhpygH0IVQtJskk6935V
	e0YVEeJa0lUD/2p6Vzy3NTsLoEo34Qy6BIQt/c/bAbsfbnJIfmFjm8U2pZWxxs99nI7y2//W1j2
	2k2dfze5q6H6vc4LrixvvYLf9vIiOp09WMZZqNWn91b8I7f8SB4s4UV78CqntLXpZ4jdtrvftXp
	H366icqHE/FU3CXVLuYQMoyVw/2ZT
X-Received: by 2002:a05:620a:72c6:10b0:939:d762:e2d8 with SMTP id af79cd13be357-93cf172fb13mr251662785a.31.1790934407361;
        Fri, 02 Oct 2026 02:46:47 -0700 (PDT)
X-Received: by 2002:a05:620a:72c6:10b0:939:d762:e2d8 with SMTP id af79cd13be357-93cf172fb13mr251660785a.31.1790934406884;
        Fri, 02 Oct 2026 02:46:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm73241225e9.0.2026.10.02.02.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:46:46 -0700 (PDT)
Message-ID: <92d1b735-00e9-4c3e-bd40-6684e0e4eb93@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:46:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and
 mboxes constraints
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20261002091432.8FF8C1F00899@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261002091432.8FF8C1F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GyQW0k0WU_DIbaTQLLE0z1RmKPPfz5X6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX8Sy0SPPjbs8o
 bqawNxUD5YNQ0vPWYCXo2ZECFUK+zYB4JknQSGyH4BdM+KeR80p0IcW3p6ap0FdyxRdZufQ1UWC
 LdoNoJHzlaQ7yEvmd2eGa2a5g+YZBYI=
X-Proofpoint-GUID: GyQW0k0WU_DIbaTQLLE0z1RmKPPfz5X6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX3NFEH/rXMsqQ
 /Im17onVMBUMxKcc0ExPSdtFj8TXK8kt3h+ot2sf6X1yewfWFxk0Qxa/pU3lfkRa5cm8R+/ojzO
 aW1bD2iziPMPeGOmTljUvZCCCCw+v14aZc8UhjvC9vWOpDnZERksget9uI2syzt+z8jH1zRkDxa
 0mvwiVpOjeSgCRRNxlbV2Rlsj46mP6w/9w5PjxbKbXLeMFGqxvBe/2KOsHGJtSw5PyGlwk9azBT
 KSbeBz4msmocMsevR6PF+9j/keJDKxWGM1uq1jCcb7Y9pRksGTtHukibpvILkN4Foljc1FeKQtG
 nZX3VrzTWsy5kjiWBQYcQrB7JCJz4/J4tHQAypovk4jUNF1D6cXENgGPsJLcFgumnfPEikXuTyx
 7hnk0HzDFwEx8UXmxndF9HI0N+gnCvvfwxZT0gweJQL4AMLQMJ9PHu6Ti3Zni4sSKco4c8txnpn
 FwmMEDbCowhT1B+EV5Q==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf7d88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020038

On 02/10/2026 11:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: missing minItems allows incomplete mboxes array

Complete bollocks.

Best regards,
Krzysztof
