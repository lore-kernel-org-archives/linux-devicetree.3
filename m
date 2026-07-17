Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C13D9690
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282293; cv=none; b=qhjr9X4Lqxt5XW/eS2WtHXuzSGT+1bBlSUt90h2CQhq3Il0vYnK7iax5qkWa3L5C6xsXgWjNNh8tptSdFJRgGx2pk/nqTxPI5Iq1XN+Vr8YikvZ5tPE1SmZVvFYyPFr4Qv7SwBGZXU11idILqHuDHz6wXabQ0DaXIl4HW+RfytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282293; c=relaxed/simple;
	bh=GFMJuZ2gCDqk1g05GaRNmg9RIl1LY5Z4UDH8PVL+lpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o99HcqViYCaPYQ4wpLY4uEF565/SYKU7uehO5QWAmwncDi9sE/5JvMUc6FE99GNsV5lCBw9LiO2dfRLAUoCAvuIunLREwLJJPpWNvV4vL52dMse3Fsl23OouEg6J2/S1jAHIL2iBvetxaqw7TmkX3dQ8S0Lg/ncd59jeDLHkNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jooec1MV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xc5q0iLb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jooec1MV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xc5q0iLb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cH5W1160842
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	savSOVyHSFB72wTBtsDZSLcoDOJWNRm4u0Xa/f3dJGc=; b=Jooec1MVsNRy2JqQ
	DVzr0EPDuoCRgMyXZBv/8BQNNAnbXFH9buSeVoc5CwuR7IhuKB6me6uCtW6sgpt0
	LN9iVmhU8Okvgf5N5jsmez4cHxVkYv4sjA9Eiu07sB6JqDvXzSXNOK3aRXfboAVc
	EYStoNzF+jZDAjja0JPAp1s1oiVbj3sPhQoK7/VX5cDNRqQ1xpu2Cv3mTbj3psFj
	fv5oZVAMRupBmFiiWT6d0tINjbue27TXq4WSAM86/RXuGn5N18d/8NSNgWCZaZgU
	0w0+cYjmnm0AgUl6EJqCrdop97YJzoD2l8zanqRgRYOy11d1uo7jTknRTnCBJjoW
	2bpXdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3as82r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so24186211cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282291; x=1784887091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=savSOVyHSFB72wTBtsDZSLcoDOJWNRm4u0Xa/f3dJGc=;
        b=Xc5q0iLbHIInvHF+BR0Z8TexWqQCJ4L6Vxx6gLvFi7umsfyIFOfG1f9KaO5FWPXxfo
         3Z4YhgYqA+eg+x6JoQGMuDbUMAIi2dOiaR5SkMIoYU/TXQ0nZkN3/EX9DW3Is4OX0xrW
         0oaSWWjjT5/rHfSjisdzJxUwozPJNSnVVD0N0Yf3Xf0LbG4Vi+JhgF+/SOhJkFMOrvD8
         D0Xjk6dmhcjY7tppmAMtw0zYxdnSnAhhuiiEl1CX3Stiv/mY/+zQPGSTERnKP6NPL5Jx
         I7zWv/cdxtZ0QE3Kp9ZeYh3qhkPhNOe137/UXEHKyixAQNlpnC7BmtqwWVLdGd/G0KXf
         FG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282291; x=1784887091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=savSOVyHSFB72wTBtsDZSLcoDOJWNRm4u0Xa/f3dJGc=;
        b=GITYxDKBWW2knyEOE0ZEcprjPKrBCtj82e2U8+rD/95rCTi+u1dnIRQaoXfbE5/bzQ
         FFXU1FWKSmetUyqk+GZB5FKBeJiQzszJAE6osvNowpyrplzFX3+dpbbAWCQH4QmekiKP
         xE4m53xbAn7yKijvkgmWYG5RcbK453T8cYrJ3SdwIXUVlCciqNrxczg4atIo4s/oQnQe
         HfzOk0LXnDvfkQRGrDEl2xlLs3hrHHANKBhMyNCKbVHGCB55e4lJ4SO+OVdoiOWkPSXa
         v1U4jKrV21aLMEad5qZr3EovMk1udt4OEMF4FgQu0wZwCodE8gACQrJzRMOw7C1mAGdC
         1S1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoNDKjBqkg8FOlVL6ap9asSv0y6jAovgecHyBbtbn6K4EcFtcZp9zQKqVHOhtE2GOMKSYsP52P/aLzl@vger.kernel.org
X-Gm-Message-State: AOJu0YyObmnjWK4K9JeWRFyEA3yYk6xY291Z1HUUzcBjhwFC2U4tikyy
	t9HZE65YbVnKDlle8GYbJjg4Y9wTovakEF+ds/Eu1yfzsTctTmyMJL20e7qzt+j8uzyVZFpNwTK
	0vGKONZwG8XVUZANchbkEfQyINlU8Jl4PRJaQ7L4HxJEdSvZSJxr2ldv9b1gAYhqj
X-Gm-Gg: AfdE7ckrreevJ2jvQ6TLPv4HPIrcd6Gc6LcTGDxgwA6c0It+cWk142Y8ya4TDj7j/n9
	xEE/vKMPV4MW8r6tJAlaAGs0LtMQMeJmatU1T90bwuHreFrf7dEmkxt2kKrUHuJMQCfbWwTb2xc
	0H7fLIv8Lx4LXNWFi5C1tSsDvC/KTN+5wu6dQOwB2UathhIvyZjpO7mxHy0SLpZgRHYtoEzJGF4
	P1tqTkofXfWTReB0Mo1rhoJgGDr9c6A1UUaD933mT07oYbFnY1jfmyJJMNou2N8hGVIvgxzr+sc
	btsSWEPt3/hbeZYDRaXkQldj7Sn6EKSIO1f2P3kJz7P2RzIFi5QEQqdUy7PBdsOEbxtZXzvzv1F
	KKg1R+WXZO4LGYWaMaFcijGq5
X-Received: by 2002:a05:622a:a9cd:10b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-5213cbda842mr9183091cf.4.1784282290677;
        Fri, 17 Jul 2026 02:58:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a9cd:10b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-5213cbda842mr9182991cf.4.1784282290128;
        Fri, 17 Jul 2026 02:58:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf4dsm395194a12.16.2026.07.17.02.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:58:08 -0700 (PDT)
Message-ID: <0dba7e7f-0aee-4fb1-a62e-5d3f991f6242@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:58:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com
References: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX9DooHUAoLQqW
 uz572TryRY4qIcWgxxDjVKEoW2Vs/Gs5pEWl7s8UhgR+j6g4ow3DUTkeguDt+PacnakImjTrATM
 Lssd2waL4YWhYbG3Cktt9AzbJ0adRoQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfXwrvmo7AGpT4z
 89v7GTnZSYQF9GDlyFEEcAJrSVne8y/blbizbsjL3qburqa7IZPz7PWHStW+HAdV9ea8onByu9A
 6LvCUfNpYkVRxG2i7og8oUEDRAwhyVopaVASJ+fOgUbLhEdj7rYv7YDUbw9oXf+JPNOv0OchEfn
 fJOTu2wrQzIRMGDFXuA3t/iE/cMslb2kCBd7ffk+r4UjZwNB1Z4ws442bDHutDppIvhG0vnZCWw
 gMN8RcyXTMeQYeJaHVfiyqXcj5ORHX0zWGL4Q8fAnPShWLAKhOkcgvn/jkuhoyvGXGG40C69fuQ
 uave6xlvuRmq4j0ybs7nAztxxuLJyqcDj0lleaIvw9PhZT/8UwxlI/iDHfaEPHoucktBCArQhO+
 oMiIr8xlzCfAxuPZxp2w9tXNLQlOedkoqa3Th5yQSRbnQlbPYwrxF9Iff0BemeVVb2p2YjkSbwb
 zr51meLReSpShG2pb7w==
X-Proofpoint-GUID: SXxJsaz1gLJkC5nLMkH8u1ZOA8OP26EX
X-Proofpoint-ORIG-GUID: SXxJsaz1gLJkC5nLMkH8u1ZOA8OP26EX
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59fcb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=obKXXINtG9EwW41erPwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

On 7/8/26 7:36 AM, Krishna Chaitanya Chundru wrote:
> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> the GCC clock references to use the newly added PHY nodes instead of
> placeholder zeros.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +		pcie1: pcie@1c08000 {
> +			device_type = "pci";
> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c08000 0 0x3000>,
> +			      <0 0x44000000 0 0xf1d>,
> +			      <0 0x44000f20 0 0xa8>,
> +			      <0 0x44001000 0 0x1000>,
> +			      <0 0x44100000 0 0x100000>,
> +			      <0 0x01c0b000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;

There's a secondary BAR region at 0x4_0000_0000 that's
0x3_0000_0000-long

Konrad
